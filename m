Return-Path: <linux-arm-msm+bounces-109352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I73MzpwEGqgXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:03:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7312F5B69D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 437673046357
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBCB37AA72;
	Fri, 22 May 2026 14:51:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3E30674A;
	Fri, 22 May 2026 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461477; cv=none; b=PjdnWg7ptAeTyu7kVb/pFy/Y/0fGF8rlo2hMm3iYQWLAvlCyXLEYiPrjbbINGikrrHYb6wg0mA1NLXnM57qEXFdJewHx0ezcPudjYKUP3QEmn7mnrDZRRi/thLiqOS5FgPqT53mynC2noFGmivMmiPnViDocLso1N6HnUxbQsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461477; c=relaxed/simple;
	bh=lBVXNXtOGTCHMtt2PQV725KZuxjijDwQLe2cBFj0sJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXHTY4mHDLPcHlyajh/tYatrll0b9q9DYMqcXepS20nfdtbXE02yyssxX3qkpUTtVnGgEtgPmqw3kfXJZ5Rttk4fAwzLsiVh5QsBFwRn744lnb1cJ/8iY/1DCZ6ufDClBPeZQB7c2bE6iOw5dnRVxOm2Nj7bc98dn7Q+X04dXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 078774C1511A21;
	Fri, 22 May 2026 16:50:50 +0200 (CEST)
Message-ID: <1b8e8129-4f42-429e-bd70-5e368551739c@molgen.mpg.de>
Date: Fri, 22 May 2026 16:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Increase SSR delay for rampatch
 and NVM loading
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 stable@vger.kernel.org
References: <20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109352-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[mpg.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7312F5B69D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Shuai,


Thank you for your patch. Please mention the delay in the summary/title. 
Maybe:

Use 100 ms SSR delay for rampatch and NVM loading

Am 22.05.26 um 13:08 schrieb Shuai Zhang:
> When bt_en is pulled high by hardware, the host does not re-download
> the firmware after SSR. The controller loads the rampatch and NVM
> internally.
> 
> On HMT chip, due to the large firmware file size, the

Please document the size (> X MB)

> loading process takes approximately 70ms. The previous 50ms delay is
> too short, causing the controller to not respond to the reset command
> sent by the host, which leads to BT initialization failure.

Maybe paste the log?

> Increase the delay to 100ms to ensure the controller has finished
> loading the firmware before the host sends commands.

Why can’t it be increased to 1 s?

> Steps to reproduce:
> 1. Trigger SSR and wait for SSR to complete:
>     hcitool cmd 0x3f 0c 26
> 2. Run "bluetoothctl power on" and observe that BT fails to start.
> 
> Fixes: fce1a9244a0f ("Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   drivers/bluetooth/hci_qca.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index ed280399b..184f52f9c 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1680,8 +1680,8 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>   		mod_timer(&qca->tx_idle_timer, jiffies +
>   				  msecs_to_jiffies(qca->tx_idle_delay));
>   
> -		/* Controller reset completion time is 50ms */
> -		msleep(50);
> +		/* Wait for the controller to load the rampatch and NVM.*/

Missing space at the end.

> +		msleep(100);
>   
>   		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>   		clear_bit(QCA_IBS_DISABLED, &qca->flags);

Is the time it took to load the rampatch and NVM visible in the logs?


Kind regards,

Paul

