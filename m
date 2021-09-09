Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18EF404719
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 10:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbhIIIiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 04:38:20 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64867 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhIIIiT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 04:38:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631176630; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=giRwarU4s4LVrgcy91P0Aa74dAXsz7qKH3Vqj2XUaKM=; b=lsMIcNKIIRyvoS8i0PiNC4d4SARuhpwySM3oq90qG45k35gwjjKORuxb8+S6/kkHwQyDmVxB
 9WGcCvRMvsx8kWrghWChdiH3VPhLQi4193qsi4FX6G3joKSh23Z9ASiYg79c1nBHrBQp/G2/
 qYvJCw6rTObHHJ3rreG+GdkbH3Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6139c7a9161bd38c427c1987 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 08:36:57
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0670DC43460; Thu,  9 Sep 2021 08:36:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.149.158.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A640BC4338F;
        Thu,  9 Sep 2021 08:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A640BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     <robh+dt@kernel.org>, <sibis@codeaurora.org>, <sboyd@kernel.org>,
        <bjorn.andersson@linaro.org>, <agross@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <mpubbise@codeaurora.org>, <linux-arm-msm@vger.kernel.org>
References: <1628618483-664-1-git-send-email-pillair@codeaurora.org> <1628618483-664-3-git-send-email-pillair@codeaurora.org> <1628702693.296189.3975938.nullmailer@robh.at.kernel.org>
In-Reply-To: <1628702693.296189.3975938.nullmailer@robh.at.kernel.org>
Subject: RE: [PATCH v2 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Thu, 9 Sep 2021 14:06:49 +0530
Message-ID: <005a01d7a555$d888b4c0$899a1e40$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEJWhNIYLJ/66qBV2WYIx8eRMUiMwHxvUCCAmkU3e2tFSDU0A==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, August 11, 2021 10:55 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: robh+dt@kernel.org; sibis@codeaurora.org; sboyd@kernel.org;
> bjorn.andersson@linaro.org; agross@kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org;
> mpubbise@codeaurora.org; linux-arm-msm@vger.kernel.org
> Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
> 
> On Tue, 10 Aug 2021 23:31:22 +0530, Rakesh Pillai wrote:
> > Add WPSS PIL loading support for SC7280 SoCs.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  .../bindings/remoteproc/qcom,hexagon-v56.yaml      | 79
> ++++++++++++++++++++--
> >  1 file changed, 74 insertions(+), 5 deletions(-)
> >
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-
> v56.example.dt.yaml: remoteproc@17300000: 'power-domain-names' is a
> required property
> 	From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-
> v56.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1515482
> 
> This check can fail if there are any dependencies. The base for a patch
series
> is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
error(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

Thanks Rob, I will submit next patchset for this and fix the issues.


