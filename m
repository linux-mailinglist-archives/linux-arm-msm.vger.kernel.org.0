Return-Path: <linux-arm-msm+bounces-80280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B5C30CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 12:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1B053BD995
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 11:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9C82E8B97;
	Tue,  4 Nov 2025 11:43:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4019A26FA60;
	Tue,  4 Nov 2025 11:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762256617; cv=none; b=D5NE4TyHtTfoDzyzT0hb7dAu1kl74XXrmBISljgMIMfhXApOGM9YM/XIt+HlRWw7rXpx2YBFJfsfxIXZlvGH/N6YuI9FRpu1a1AFSasQMx51qplSsfDt3r4aiPWCR9brufrk/98LdRm9DGZhyqhoxUNhJCyNDjxa8DfN8BTffNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762256617; c=relaxed/simple;
	bh=53WUuaBOWGNY7HMl/GQZC54v+7vKuWYy543nNv24VpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsQqYSvBufFoVRJlVIKfddQI8XHu+TzXoBKG+jVMXJB3/HzNj7vgOsL1C5xPRUrYPZJCopTNyUeZHv64W89Ge3w6U36E/huBBgxbVtDBlZjbjmzrQfsdfO8inhdRefJAU9cd0MSkMJSuv6544j4g/vXX+HBHZL7THWcdUMakrcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6878D61E647AB;
	Tue, 04 Nov 2025 12:43:22 +0100 (CET)
Message-ID: <0c54ccc4-0526-4d7a-9ce3-42dde5539c7b@molgen.mpg.de>
Date: Tue, 4 Nov 2025 12:43:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Fix SSR unable to wake up bug
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com
References: <20251104112601.2670019-1-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251104112601.2670019-1-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Shuai,


Thank you for your patch.

Am 04.11.25 um 12:26 schrieb Shuai Zhang:
> During SSR data collection period, the processing of hw_error events
> must wait until SSR data Collected or the timeout before it can proceed.

Collected → collected

> The wake_up_bit function has been added to address the issue

has been added → is added

> where hw_error events could only be processed after the timeout.

The problem is not totally clear to me. What is the current situation? 
Maybe start the commit message with that?

> The timeout unit has been changed from jiffies to milliseconds (ms).

Please give the numbers, and also document effect of this change. Is the 
timeout the same, or different?

Also, why not make that a separate commit?

Please document a test case.

> Cc: stable@vger.kernel.org
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>   drivers/bluetooth/hci_qca.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 888176b0f..a2e3c97a8 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1105,6 +1105,7 @@ static void qca_controller_memdump(struct work_struct *work)
>   				cancel_delayed_work(&qca->ctrl_memdump_timeout);
>   				clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>   				clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +				wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
>   				mutex_unlock(&qca->hci_memdump_lock);
>   				return;
>   			}
> @@ -1182,6 +1183,7 @@ static void qca_controller_memdump(struct work_struct *work)
>   			qca->qca_memdump = NULL;
>   			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>   			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
> +			wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);

`include/linux/wait_bit.h` also contains `clear_and_wake_up_bit()`.

>   		}
>   
>   		mutex_unlock(&qca->hci_memdump_lock);
> @@ -1602,7 +1604,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>   	struct qca_data *qca = hu->priv;
>   
>   	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
> -			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
> +			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>   
>   	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>   }


Kind regards,

Paul

