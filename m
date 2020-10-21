Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DF22950CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 18:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502945AbgJUQdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 12:33:08 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:49216 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438250AbgJUQdI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 12:33:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603297987; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wvO5zR9EQASc5KuaM9v+5jS+2r+RAJFBwotKW+D0OfY=; b=Zxk2qd/74IitUNvczg8UOtq1IJ3ihvDd+1h5h/j3I5D4alwFlsuRhed7B+TagEpV/B4BIMBV
 6gMx9TF6eXC94PFG/7viak4XUZq5ECsJJlsvSVF499BeOpQZZVDkHoUYciJWZD6XpOB1mMbd
 l6b+Y5TRvJqdmHxFQgdKvx7A7i8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9062c252f4fccef08ffbbb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 16:33:06
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C6B8CC433CB; Wed, 21 Oct 2020 16:33:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E62DDC433C9;
        Wed, 21 Oct 2020 16:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E62DDC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: fix potential operator-precedence with
 BHI macros
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, bbhatt@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <ddea7e85-888b-301b-90fa-85655c2ceb45@codeaurora.org>
Date:   Wed, 21 Oct 2020 09:33:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/20/20 1:29 PM, Jeffrey Hugo wrote:
> The BHI_MSMHWID and BHI_OEMPKHASH macros take a value 'n' which is
> a BHI register index. If 'n' is an expression rather than a simple
> value, there can be an operator precedence issue which can result
> in the incorrect calculation of the register offset. Adding
> parentheses around the macro parameter can prevent such issues.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
