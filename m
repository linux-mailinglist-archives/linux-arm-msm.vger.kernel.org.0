Return-Path: <linux-arm-msm+bounces-80621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC2C3BBC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94503347BA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E9733EAE4;
	Thu,  6 Nov 2025 14:28:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53522D795;
	Thu,  6 Nov 2025 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439284; cv=none; b=R+0hfRrvWxym4nTV52Q0I9FYWLsf1Q4o2RGWp+IcyVhAKNI4+oBRWZLw4nRM00f4Esjs/e7eAnu1Du2bhP7p8Jo6/BxvKPdxj+taiHwupUooW9S2z/gR9B3P5GKf2U3Vpv8ohIk3ZX4dU1e0CFHXWPk7wjGzwlBxqeUT3tfgIeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439284; c=relaxed/simple;
	bh=d6ciqkP+BTCwznKuF4GupZl6kfAo/zc3Ukdzi0JOdmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lm1fJOIHeqYCd8B56wUrZsTj5HQ4OZToW/CUfYrxMr4Bkvd+ogL4FzSNBFKQ8VlCelGETAEtNHDc1LpbaVCCHT+K5p4ZtduvMMhgOY1Kp9vW2gJqqCHQKPDt685qPV7hTZchySbCXg+N5kW+sGsUa/G0qKMEYH5lpTw1T30aoiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.14.72] (v072.vpnx.molgen.mpg.de [141.14.14.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 20FAC61CC3FED;
	Thu, 06 Nov 2025 15:27:48 +0100 (CET)
Message-ID: <3676d7e4-5a28-4e8a-bc55-1386b4fbc58f@molgen.mpg.de>
Date: Thu, 6 Nov 2025 15:27:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Convert timeout from jiffies
 to ms
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
 luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com
References: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
 <20251106140103.1406081-3-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251106140103.1406081-3-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Shuai,


Thank you for your patch.

Am 06.11.25 um 15:01 schrieb Shuai Zhang:
> Since the timer uses jiffies as its unit rather than ms, the timeout value
> must be converted from ms to jiffies when configuring the timer. Otherwise,
> the intended 8s timeout is incorrectly set to approximately 33s.
> 
> Cc: stable@vger.kernel.org

A Fixes: tag is needed.

> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>   drivers/bluetooth/hci_qca.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index fa6be1992..c14b2fa9d 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1602,7 +1602,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>   	struct qca_data *qca = hu->priv;
>   
>   	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
> -			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
> +			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>   
>   	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>   }

With the Fixes: tag added, feel free to add:

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

