Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F1E44F7EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 13:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbhKNMtj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 07:49:39 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:34346 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230186AbhKNMth (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 07:49:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636894003; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mC3LjhRSX3c0QTWBp0qcXjBnbouZr3462yGwYzm+tFU=; b=fiM+yUwgIkUpmAsB9/Nh2OLgQdXn3+gCih8OuwEb+2MGuaNHSWbwbYJFMXQ0hzX0d4k6t1Dq
 Fk1/t5FiNXVgmZd/oDpkwu1Ba8W4Fas4B5DDVEyECRDqU26KBS2YeKtgjSIo11XW2j1iTRCh
 KaPa+t9/JsumJQ0cxIh7XruHFHQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61910527c48ba48884f0b040 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 14 Nov 2021 12:46:31
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AAB1C4360D; Sun, 14 Nov 2021 12:46:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [183.195.15.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09536C4338F;
        Sun, 14 Nov 2021 12:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 09536C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: hci_h4: Fix padding calculation error
 within h4_recv_buf()
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, c-hbandi@codeaurora.org,
        hemantg@codeaurora.org, rjliao@codeaurora.org,
        Zijun Hu <quic_zijuhu@quicinc.com>
References: <1636546159-8339-1-git-send-email-zijuhu@codeaurora.org>
From:   Zijun Hu <zijuhu@codeaurora.org>
Message-ID: <97e8c186-3c4f-a3ff-8389-e15ea476280e@codeaurora.org>
Date:   Sun, 14 Nov 2021 20:46:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1636546159-8339-1-git-send-email-zijuhu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

could you please code review for this patch?

On 11/10/2021 8:09 PM, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> it is erroneous to calculate padding by subtracting length of type
> indication from skb->len, it will cause data analysis error for
> alignment which is greater than 1, so fixed by adding length of type
> indication with skb->len.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/bluetooth/hci_h4.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
> index 4b3b14a34794..1d0cdf023243 100644
> --- a/drivers/bluetooth/hci_h4.c
> +++ b/drivers/bluetooth/hci_h4.c
> @@ -252,7 +252,7 @@ struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>  			}
>  
>  			if (!dlen) {
> -				hu->padding = (skb->len - 1) % alignment;
> +				hu->padding = (skb->len + 1) % alignment;
>  				hu->padding = (alignment - hu->padding) % alignment;
>  
>  				/* No more data, complete frame */
> @@ -260,7 +260,7 @@ struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>  				skb = NULL;
>  			}
>  		} else {
> -			hu->padding = (skb->len - 1) % alignment;
> +			hu->padding = (skb->len + 1) % alignment;
>  			hu->padding = (alignment - hu->padding) % alignment;
>  
>  			/* Complete frame */
> 
