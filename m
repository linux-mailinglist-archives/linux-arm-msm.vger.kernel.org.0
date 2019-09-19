Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57BFEB7F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 18:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732787AbfISQuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 12:50:11 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33483 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732783AbfISQuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 12:50:11 -0400
Received: by mail-wm1-f65.google.com with SMTP id r17so7592618wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2019 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qEDrSkRuuo6lL+9DY4DVGx51w66YHOspKUBct+J7PsM=;
        b=q9V8LOeiE+364i78EeVgeUXc7zuwpTt9nK4dpxcKgjCZKsP3mEzEClf2oOVu8qEnD6
         tPFAmHMOG9eBWSWp8YzG0RZ3ekqH6iBxnlmCPbirm7oFujKUdlDtTDI3aBEBVLA5XFua
         gvMGkkreSEoPSoirpYZpNA/0L727emywPGT3ugA35ZYvBsHoUHjGfyTZfTCir7rPFcST
         L9MGeDnc+DC/oSqemRoZfvhCy00ebMmIiJWVmZOMMHFu3LBZy17QiRwim3RSq0q2+uCR
         usoqBvFwTmxj8a7DY1gIOKsYat/lJNAdwR9/8DVXaORL8Sh7hhT1c8bcQ6l/S906xAI9
         P88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qEDrSkRuuo6lL+9DY4DVGx51w66YHOspKUBct+J7PsM=;
        b=qbQOJq5fyZil1p9fCMAm1InXl56lypK+L8DGqi3lY8rJcbJb5VRTgQ8K692A2i50QA
         GHYQRRcryUqKHxo0XEuLDNiiYUQvkosIoTSLrgV7a3Pc97oW97jOT1P13ECsvh6aPk0O
         36Z7TLoQAbUKBTM22aOv2lQoBtY2NanUS27DFEEqGI/CVKMT5g/uUhQ+InFSRVcxW3Ze
         e++GDUcSCIVVfBlSRh2Omrlm163QAc2BrtCZcDEnrmzCqXFZtSivKKkkD5KImOMU8Loh
         SL7+d1AMm/Ki5PhN9Y5mlmlRuvt8WMbjZwqnkEaivS4Tx3psC0U/x2ITHkRme2gomZyv
         G+nQ==
X-Gm-Message-State: APjAAAXA1VPVypqPAt88rLBttfNmNOLdcu6PGX5RYw+CPW9+HwAoXJOZ
        ZBZguSn87fsLPRrS5MJFLBy/qg==
X-Google-Smtp-Source: APXvYqzBroZEcwk9i2c/xO/jp6uxLLX76ENOImmzPZLTWzLhoVXMVZ0JbZLe5mS0tiXjoN63s5XMPQ==
X-Received: by 2002:a1c:2d44:: with SMTP id t65mr3654035wmt.12.1568911809121;
        Thu, 19 Sep 2019 09:50:09 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id u10sm17381210wrg.55.2019.09.19.09.50.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 09:50:08 -0700 (PDT)
Subject: Re: [PATCH 0/6] rpmsg: glink stability fixes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <74b3d165-b1ea-e4e3-df50-98bda8691d5c@linaro.org>
Date:   Thu, 19 Sep 2019 17:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/09/2019 18:19, Bjorn Andersson wrote:
> Fixes for issues found in GLINK during reboot testing of a remoteproc.
> 
> Arun Kumar Neelakantam (2):
>    rpmsg: glink: Fix reuse intents memory leak issue
>    rpmsg: glink: Fix use after free in open_ack TIMEOUT case
> 
> Bjorn Andersson (2):
>    rpmsg: glink: Don't send pending rx_done during remove
>    rpmsg: glink: Free pending deferred work on remove
> 
> Chris Lew (2):
>    rpmsg: glink: Put an extra reference during cleanup
>    rpmsg: glink: Fix rpmsg_register_device err handling
> 
>   drivers/rpmsg/qcom_glink_native.c | 50 ++++++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 8 deletions(-)
> 

Thanks for the fixes.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
