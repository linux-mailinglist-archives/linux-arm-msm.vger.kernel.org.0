Return-Path: <linux-arm-msm+bounces-69981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5319B2DE10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 15:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D32C4E555A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BCB2236FC;
	Wed, 20 Aug 2025 13:41:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A54B2E11AB;
	Wed, 20 Aug 2025 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697271; cv=none; b=MLLOVtCz/cpLYLzwGZbjDla+Lmp9VguD3DPzUZQb41URxwibqrFMjKcP/uTcQdrPt15k7Kjj+W/ADroIdUMIuKA1IWe0BUYJ8OcHb0v06b8ADJzWbIPzgmhFVXhYIFW0KV7gR6zlllgNrIJ6yvkEDTOujS2BollhH0T4ILH0Spg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697271; c=relaxed/simple;
	bh=pMj0gp/2bA+b9eRsCiy6AKLGAvEUd3cDvU67rP19T+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msW2tEEBIqXyb9ruzhBrO0NbgYhdHR9vxWshCMSyUrd5zXIc7YKuuzCv1QRwPBZ65tXdp0eGn4Y56QcVWmH/A1JCFDAJEVickTHRn8/JlRmuP+sVWG48SCkhzio0zlDe2bjBxlP4Pt3xQZB4WL6ZZoecko8m1hBHO2oXG4hf5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0770360288273;
	Wed, 20 Aug 2025 15:32:22 +0200 (CEST)
Message-ID: <0c0a6b05-edc6-4e3e-8db5-c48f732d12f2@molgen.mpg.de>
Date: Wed, 20 Aug 2025 15:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] Fix SSR(SubSystem Restart) fail when BT_EN is pulled
 up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_bt@quicinc.com
References: <20250820120641.1622351-1-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250820120641.1622351-1-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Shuai,


Thank you for the improved version. The commit message summary/title 
still has the space missing before the ( and should be prefixed with 
`Bluetooth:` to pass the linters.

Am 20.08.25 um 14:06 schrieb Shuai Zhang:
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However, due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.
> 
> To address this, this patch clears the QCA_SSR_TRIGGERED and
> QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
> HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
> completes the SSR process when BT_EN is always high due to hardware.
> 
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> commit 740011cfe948 ("Bluetooth: Add new quirk for non-persistent setup
> settings")

Missing dot/period at the end.

Also, the comment in `include/net/bluetooth/hci.h` is more helpful to me 
than the commit.

> The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
> and its presence can be used to determine whether BT_EN is defined in DTS.
> 
> After SSR, host will not download the firmware, causing
> controller to remain in the IBS_WAKE state. Host needs
> to synchronize with the controller to maintain proper operation.
> 
> Multiple triggers of SSR only first generate coredump file,
> duo to memcoredump_flag no clear.

due to

> add clear coredump flag when ssr completed.
> 
> When the SSR duration exceeds 2 seconds, it triggers
> host tx_idle_timeout, which sets host TX state to sleep. due to the
> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
> As a result, the controller does not enter sleep mode. Consequently,
> when the host sends a command afterward, it sends 0xFD to the controller,
> but the controller does not respond, leading to a command timeout.
> 
> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.

Sleep

> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>   drivers/bluetooth/hci_qca.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..403d65952 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,37 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>   		skb_queue_purge(&qca->rx_memdump_q);
>   	}
>   
> +	/*
> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
> +	 * hardware and always stays high, driver cannot control the bt_en pin.
> +	 * As a result, during SSR(SubSystem Restart), QCA_SSR_TRIGGERED and

Missing space before (.

> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
> +	 * command timeout.
> +	 * Add an msleep delay to ensure controller completes the SSR process.
> +	 *
> +	 * Host will not download the firmware after SSR, controller to remain
> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
> +	 *
> +	 * Since the bluetooth chip has been reset, clear the memdump state.
> +	 */
> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> +		/*
> +		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
> +		 * it triggers host tx_idle_delay, which sets host TX state
> +		 * to sleep. Reset tx_idle_timer after SSR to prevent
> +		 * host enter TX IBS_Sloeep mode.

Sleep?

> +		 */
> +		mod_timer(&qca->tx_idle_timer, jiffies +
> +				  msecs_to_jiffies(qca->tx_idle_delay));
> +		msleep(50);

Add a comment, why 50 ms and not 20 ms or 100 ms?

> +
> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +
> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
> +	}
> +
>   	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>   }
>   


Kind regards,

Paul

