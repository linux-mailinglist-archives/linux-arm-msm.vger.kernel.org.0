Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BE63A9164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 07:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhFPFw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 01:52:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:40120 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbhFPFw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 01:52:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623822652; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Q1TyVXTeFx6rF/4IhR/HbBq/HUJgc1Eg0wjHkC/BGjI=;
 b=D3Air2CJuuqnwlsxiv4GX06G4vWGAe4KJ0knq/UHitGM3anJgzLUt9D0c9oLL/aWLqL2z5iU
 yh8EU/jH5z/iF1F31O/SYR29n3hT0joH2vRP9tXuQGfV2DgnR8rrwpbMCyWafJIIPnjAgMtS
 sW2rbUf94JBgk06+XJmwjkqmR8A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60c99131e570c0561970a32a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Jun 2021 05:50:41
 GMT
Sender: rajeevny=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37F7BC4338A; Wed, 16 Jun 2021 05:50:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajeevny)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0920C433D3;
        Wed, 16 Jun 2021 05:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Jun 2021 11:20:39 +0530
From:   rajeevny@codeaurora.org
To:     Rob Herring <robh@kernel.org>, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
        mkrishn@codeaurora.org, jonathan@marek.ca
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
In-Reply-To: <ec1bcb4e734b784ab17c4fc558a5fab9@codeaurora.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
 <20210601205848.GA1025498@robh.at.kernel.org>
 <ec1bcb4e734b784ab17c4fc558a5fab9@codeaurora.org>
Message-ID: <27dec6f881a3b8bd5e13ba32990f975b@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-06-2021 01:32, rajeevny@codeaurora.org wrote:
> On 02-06-2021 02:28, Rob Herring wrote:
>> On Mon, May 31, 2021 at 07:03:53PM +0530, Rajeev Nandan wrote:
> 
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: qcom,dsi-phy-7nm
>> 
>> When would one use this?
> This is for SM8250.
> 
>> 
>>> +      - const: qcom,dsi-phy-7nm-7280
>>> +      - const: qcom,dsi-phy-7nm-8150
>> 
>> These don't look like full SoC names (sm8150?) and it's
>> <vendor>,<soc>-<block>.
> 
> Thanks, Rob, for the review.
> 
> I just took the `compatible` property currently used in the DSI PHY 
> driver
> (drivers/gpu/drm/msm/dsi/phy/dsi_phy.c), and added a new entry for 
> sc7280.
> A similar pattern of `compatible` names are used in other variants of 
> the
> DSI PHY driver e.g. qcom,qcom,dsi-phy-10nm-8998, qcom,dsi-phy-14nm-660 
> etc.
> 
> The existing compatible names "qcom,dsi-phy-7nm-8150" (SoC at the end) 
> make
> some sense, if we look at the organization of the dsi phy driver code.
> I am new to this and don't know the reason behind the current code
> organization and this naming.
> 
> Yes, I agree with you, we should use full SoC names. Adding
> the SoC name at the end does not feel very convincing, so I will change 
> this
> to the suggested format e.g. "qcom,sm8250-dsi-phy-7nm", and will rename 
> the
> occurrences in the driver and device tree accordingly.
> Do I need to make changes for 10nm, 14nm, 20nm, and 28nm DSI PHY too?
> Bindings doc for these PHYs recently got merged to msm-next [1]
> 
> 
> [1]
> https://gitlab.freedesktop.org/drm/msm/-/commit/8fc939e72ff80116c090aaf03952253a124d2a8e
> 

Hi Rob,

I missed adding "robh+dt@kernel.org" earlier in this thread.

Please check my response to your review comments. Regarding your 
suggestion to use <vendor>,<soc>-<block> format for compatible property, 
should I also upload a new patch to make changes in 10nm, 14nm, 20nm, 
and 28nm DSI PHY DT bindings?

Thanks,
Rajeev



