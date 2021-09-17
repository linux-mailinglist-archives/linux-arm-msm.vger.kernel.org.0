Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B590740F5E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 12:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242734AbhIQK21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 06:28:27 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37333 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242681AbhIQK20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 06:28:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631874425; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=LhtmfeNAIlX8M2dcVRidCgdVPxkrLfqIMyZ5JSXqj6M=; b=MT/UezWxZjfOb4wG7AonP5tFuh15+4NYVmEBpHpkKAM1B63olknClJHMebBfXkH4qkfFRKeT
 WekLm9BArDhYkeKViE1apko0JXEGbce3lDGMsAz98OaJDbGk2YGUTHw/gLgyYiDXMMJp8GbU
 dLVCkLV7NYuTuq4LlJ1wZ4lTzd4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61446d77b585cc7d24722ed6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 10:27:03
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B869C43617; Fri, 17 Sep 2021 10:27:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.149.158.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77B95C4338F;
        Fri, 17 Sep 2021 10:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 77B95C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org> <1631811353-503-3-git-send-email-pillair@codeaurora.org> <CAE-0n51KBYjZvwGNy06_okmEWjEfRLQO54CYaY6-JnbBk6kOhA@mail.gmail.com>
In-Reply-To: <CAE-0n51KBYjZvwGNy06_okmEWjEfRLQO54CYaY6-JnbBk6kOhA@mail.gmail.com>
Subject: RE: [PATCH v3 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Fri, 17 Sep 2021 15:56:54 +0530
Message-ID: <001201d7abae$8d160a10$a7421e30$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHMNEBDEmK8+OU0e0UN4gvXCrx/ZwJ79PxeAhycz42rmi+7oA==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Friday, September 17, 2021 11:56 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; mathieu.poirier@linaro.org; =
ohad@wizery.com;
> p.zabel@pengutronix.de; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; sibis@codeaurora.org; mpubbise@codeaurora.org;
> kuabhs@chromium.org
> Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
>=20
> Quoting Rakesh Pillai (2021-09-16 09:55:52)
> > @@ -78,6 +84,10 @@ properties:
> >        Phandle reference to a syscon representing TCSR followed by =
the
> >        three offsets within syscon for q6, modem and nc halt =
registers.
> >
> > +  qcom,qmp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Reference to the AOSS side-channel message RAM.
> > +
> >    qcom,smem-states:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      description: States used by the AP to signal the Hexagon core =
@@
> > -117,6 +127,33 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,sc7280-wpss-pil
> > +    then:
>=20
> Honestly I find this if/else to be a huge tangle. Why not split the =
binding so
> that each compatible is a different file? Then it is easier to read =
and see what
> properties to set.

Hi Stephen,
I will create a separate dt-bindings yaml file for sc7280-wpss-pil, =
which will avoid all such if-else conditions.

>=20
> > +      properties:
> > +        interrupts-extended:
> > +          maxItems: 6
> > +          items:
> > +            - description: Watchdog interrupt
> > +            - description: Fatal interrupt
> > +            - description: Ready interrupt

