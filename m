Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5934F27E1A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 08:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgI3Gsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 02:48:35 -0400
Received: from z5.mailgun.us ([104.130.96.5]:24197 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI3Gsf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 02:48:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601448514; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0Cg0ycDtO+B0XeEyD60ZAnUts/W0lzugMtbQ+pnKkhA=; b=v/d/IXaxAdCWHAPoTeTykshQIhW7UtZby/OjNcYE07UNW5l5PmUSyR+UBctPwkcBfAeo5uai
 3nfkRpryxO7Wlglfpj3KbxpmMtFTLjv54Zze4z4eGJdn9hU1cnjNI6pPLmaOiBCi2+IZnJia
 cdBmQ91FMYTBEd+xv1Ib2yhYCZY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f742a4259892db41fe3ff06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 06:48:34
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C399DC433FE; Wed, 30 Sep 2020 06:48:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.98] (unknown [47.8.99.116])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B640FC433CA;
        Wed, 30 Sep 2020 06:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B640FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V6] serial: qcom_geni_serial: To correct QUP Version
 detection logic
To:     Paras Sharma <parashar@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601445926-23673-1-git-send-email-parashar@codeaurora.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <a0a560c5-8ff5-6c5e-d313-fb77c2631a7e@codeaurora.org>
Date:   Wed, 30 Sep 2020 12:18:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601445926-23673-1-git-send-email-parashar@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/30/2020 11:35 AM, Paras Sharma wrote:
> For QUP IP versions 2.5 and above the oversampling rate is
> halved from 32 to 16.
>
> Commit ce734600545f ("tty: serial: qcom_geni_serial: Update
> the oversampling rate") is pushed to handle this scenario.
> But the existing logic is failing to classify QUP Version 3.0
> into the correct group ( 2.5 and above).
>
> As result Serial Engine clocks are not configured properly for
> baud rate and garbage data is sampled to FIFOs from the line.
>
> So, fix the logic to detect QUP with versions 2.5 and above.
>
> Fixes: ce734600545f ("tty: serial: qcom_geni_serial: Update the oversampling rate")
> Signed-off-by: Paras Sharma <parashar@codeaurora.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

