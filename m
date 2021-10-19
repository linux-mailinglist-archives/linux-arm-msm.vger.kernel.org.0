Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C4F432C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 06:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhJSEVd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 00:21:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26601 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhJSEVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 00:21:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634617161; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1fA38Q6GgVTaXaJQYBszohqpLiMupFtBKld+K5PtB3M=; b=Ry1EeI3Z21OBSTro7J/S/DAPjSs/dNVHnxJBkquWOoNTGr+OkvhyVhuzlpHLIqbQ8ovFf/HJ
 BVxI5iXCIrYHzCqz9ou9P8RlokNDUb7FmVFVAljcfwv9DsLPIhP1hmtALI19JWQ8Ai4uz0Sp
 Lo24/QQevKtllM8/Ix81D95Bif8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 616e47475ca800b6c1d10b33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 04:19:19
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F1385C43616; Tue, 19 Oct 2021 04:19:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.5] (cpe-76-176-73-171.san.res.rr.com [76.176.73.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB284C4338F;
        Tue, 19 Oct 2021 04:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AB284C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     bbhatt@codeaurora.org, loic.poulain@linaro.org, wangqing@vivo.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <661c564c-e6cd-cbd4-0b17-a7c230d911b2@codeaurora.org>
Date:   Mon, 18 Oct 2021 21:19:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/15/2021 11:57 PM, Manivannan Sadhasivam wrote:
> Since Hemant is not carrying out any maintainership duties let's make
> him as a dedicated reviewer. Also add the new mailing lists dedicated
> for MHI in subspace mailing list server.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
