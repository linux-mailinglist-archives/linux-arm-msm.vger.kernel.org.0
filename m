Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1792C414107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 07:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhIVFE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 01:04:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27875 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbhIVFE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 01:04:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632287006; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=F6JDteZc07ta9blvaVuEHXEVpmU7kZtyp9jRwTKVV7E=; b=l+v0+dztpkLJmuz10s+cQDt5I25iI5nI/BnulttGJ5TKrEFXCSYHQj1Czt28IdB+Ltb4zUSd
 A5z8J/bDHqFxcXzghFzKfo0C/+vTE9BLKYhlelf5a4n3KjrgsRT8FXbjXJ7S9DOg28T9/YkA
 2SgKNf6zOBMjyZgenwlMQ3KUWuw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 614ab91ebd6681d8ed39b0b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 05:03:26
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0D1DC43617; Wed, 22 Sep 2021 05:03:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.155.223.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AECAC4338F;
        Wed, 22 Sep 2021 05:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6AECAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Stephen Boyd'" <swboyd@chromium.org>
Cc:     <agross@kernel.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org> <1631811353-503-3-git-send-email-pillair@codeaurora.org> <CAE-0n51KBYjZvwGNy06_okmEWjEfRLQO54CYaY6-JnbBk6kOhA@mail.gmail.com> <YUps1JfGtf6JdbCx@ripper>
In-Reply-To: <YUps1JfGtf6JdbCx@ripper>
Subject: RE: [PATCH v3 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Wed, 22 Sep 2021 10:33:17 +0530
Message-ID: <000b01d7af6f$2be09c50$83a1d4f0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHMNEBDEmK8+OU0e0UN4gvXCrx/ZwJ79PxeAhycz40Chr1Yo6uNex2g
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Sent: Wednesday, September 22, 2021 5:08 AM
> To: Stephen Boyd <swboyd@chromium.org>
> Cc: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> mathieu.poirier@linaro.org; ohad@wizery.com; p.zabel@pengutronix.de;
> robh+dt@kernel.org; linux-arm-msm@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org
> Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
> 
> On Thu 16 Sep 23:25 PDT 2021, Stephen Boyd wrote:
> 
> > Quoting Rakesh Pillai (2021-09-16 09:55:52)
> > > @@ -78,6 +84,10 @@ properties:
> > >        Phandle reference to a syscon representing TCSR followed by the
> > >        three offsets within syscon for q6, modem and nc halt
registers.
> > >
> > > +  qcom,qmp:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: Reference to the AOSS side-channel message RAM.
> > > +
> > >    qcom,smem-states:
> > >      $ref: /schemas/types.yaml#/definitions/phandle-array
> > >      description: States used by the AP to signal the Hexagon core
> > > @@ -117,6 +127,33 @@ allOf:
> > >          compatible:
> > >            contains:
> > >              enum:
> > > +              - qcom,sc7280-wpss-pil
> > > +    then:
> >
> > Honestly I find this if/else to be a huge tangle. Why not split the
> > binding so that each compatible is a different file? Then it is easier
> > to read and see what properties to set.
> >
> 
> Further more, the way we express the non-PAS properties in the PAS node
> in the dtsi and then switch the compatible in the non-PAS devices means
that
> we're causing validation errors.
> 
> So we should explode this binding to get rid of the conditionals and to
> describe the "superset" of the PAS and non-PAS compatibles, for platforms
> where this is applicable.
> 
> Regards,
> Bjorn

Hi Bjorn,

I have posted v4 for this patchseries with wpss dt-bindings added as a
separate file.
Can you please check v4 ?

Thanks,
Rakesh Pillai.


> 
> > > +      properties:
> > > +        interrupts-extended:
> > > +          maxItems: 6
> > > +          items:
> > > +            - description: Watchdog interrupt
> > > +            - description: Fatal interrupt
> > > +            - description: Ready interrupt

