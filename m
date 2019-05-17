Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFBF21C29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 19:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfEQRD4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 13:03:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42978 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfEQRD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 13:03:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0ABD660DAB; Fri, 17 May 2019 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558112635;
        bh=4IgcuJFcVBunA66vabPQGLUoMAAyfYOXj6QvXzjcV9I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HSWvFxn0qtDzSm9PyIPznHPMS+TALkycUaHjcD5iJAgxDLVsfR0Kj6IN2B9DwhzZL
         C6oMyNLOWq2l7ufhPAoF/zPhDYWvoultb+rJN3Pkbj2rohDU7lHvov6OKhzz4Yedb7
         JHtJcTkxvt4HesHwsqEzz1XR2HC2PWxAv7eYiIgA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A423602F8;
        Fri, 17 May 2019 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558112634;
        bh=4IgcuJFcVBunA66vabPQGLUoMAAyfYOXj6QvXzjcV9I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=k+R2tF9WuUY7eh5PECiRZ0/Qf9PXm5wjZm6I0pUXoXqvxamT22r8qoNZamBUmTc5e
         VFax+tV3sVJZ8RUoBq93EnftWC7b1GYXfiqoIOplx8CNMt83P4K8kiyl1FuriR2a6j
         QbBQZOCQO5ALfNYi4RMRKJdCL2gAoyNcnByeWhYM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A423602F8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v4 0/9] RPMPD for QCS404 and MSM8998
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr
References: <20190513102015.26551-1-sibis@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <2d453c99-4ea2-e4f0-1d99-e13d099bfa07@codeaurora.org>
Date:   Fri, 17 May 2019 11:03:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/13/2019 4:20 AM, Sibi Sankar wrote:
> Re-worked the macros of the rpmpd driver. Add power domains support
> for QCS404 and MSM8998.

For the series:
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

> 
> V4:
> * fixup fixes tag and commit message in patch 1 [Marc]
> * fixup typos in qcs404 and msm8998 dt nodes
> * fixup comments regarding resource type in patch 8 [Marc]
> 
> V3:
> * always send level updates to vfc and vfl in set_performance state
> * fixup commit messages [Rajendra]
> * fixup s-o-b ordering
> 
> V2:
> * Add rpmpd support for msm8998
> * fixup corner/vfc with vlfl/vfl
> 
> Bjorn Andersson (4):
>    soc: qcom: rpmpd: Modify corner defining macros
>    dt-bindings: power: Add rpm power domain bindings for qcs404
>    soc: qcom: rpmpd: Add QCS404 power-domains
>    arm64: dts: qcom: qcs404: Add rpmpd node
> 
> Sibi Sankar (5):
>    soc: qcom: rpmpd: fixup rpmpd set performance state
>    soc: qcom: rpmpd: Add support to set rpmpd state to max
>    dt-bindings: power: Add rpm power domain bindings for msm8998
>    soc: qcom: rpmpd: Add MSM8998 power-domains
>    arm64: dts: qcom: msm8998: Add rpmpd node
> 
>   .../devicetree/bindings/power/qcom,rpmpd.txt  |   2 +
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         |  51 +++++++
>   arch/arm64/boot/dts/qcom/qcs404.dtsi          |  55 +++++++
>   drivers/soc/qcom/rpmpd.c                      | 134 ++++++++++++++----
>   include/dt-bindings/power/qcom-rpmpd.h        |  34 +++++
>   5 files changed, 252 insertions(+), 24 deletions(-)
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
