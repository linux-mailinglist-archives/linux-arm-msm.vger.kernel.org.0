Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3184C64BF09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 23:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbiLMWFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 17:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236748AbiLMWFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 17:05:38 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8F210059
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 14:05:36 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b13so7313100lfo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 14:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YcFX+pC6oKMWEjAMll8cWnWDKBHIN45PyY2bvtn3d+4=;
        b=usp6+i4vosXV1+xTbRN/vYaZVxRdMMNfEe1WR8pKwy4u7Ks/30SM8nW8UDMm/hgBbh
         2dFrC3/sHZ83NhRcskOmh0psxlnDaPxMv5c5rt69R80ywtXSocj7r+uUYs6WlXo6vL2a
         +Y+1AEF6AjEEVPDpadS4kOTIJaq1rxjItRD6RepIhvu7KlFeEN8ftMxG+uLmOvnoUKCa
         P/+rZHrrhcKenm0wSzwoFyOglRv/68qI/SA3hI9fLkUGjN2CduFVQcThfXxd7gBmwasI
         SMqpWetp7X6WFGzUAxh5r0AWyG6qkLQdynaQDm10Y1Z1Wsuenr2JW/pdb5TCSAouNLPD
         EGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcFX+pC6oKMWEjAMll8cWnWDKBHIN45PyY2bvtn3d+4=;
        b=hevD8imHqNDUnIoWu5ffZ+4KJteqme7Tm1nuTSZiFFgvZNbHISohauFzph7bnu/XA+
         x0j2WQQdMY2wZxxLV7haa9p3SyMUKV53Wv7rCfyZEgwlhdnRcBdOWtkjXxhjuMCpwIzR
         QdWYp2eryLUg1a1klh2/a9dC5ef2dgWsnhsXfa2PESRlG7+2jHxiKKCsU1OWLPDagtD+
         hnUU7+7kmV2l+pVh5oGPb1I68V0OPyRQ3m80E0c/t7nmCCnz5zqvf1uoClNZQqv/o/1A
         OUbH6Tle646fLvpGZ4g5dN3t+kPUZe9wcci2p2YLipb237ZoKMAsetrx/2NczN/hWj/a
         1guQ==
X-Gm-Message-State: ANoB5pmRqcy/1bcPJHlglN0+Hov9ixAzHlRT1K2ZdjKL4y2sWcY2AiPm
        lfXPcUqGOsHJIuLLi0RSi03qQQ==
X-Google-Smtp-Source: AA0mqf5M8Djzuycc38JR/hFtxMBw3/6t86+xUx1PIWOq9IMKdUk8BXmlYzR/Kxn2wDeAA8cXFQOYUQ==
X-Received: by 2002:ac2:4902:0:b0:4b7:8291:d4b with SMTP id n2-20020ac24902000000b004b782910d4bmr263779lfi.13.1670969134795;
        Tue, 13 Dec 2022 14:05:34 -0800 (PST)
Received: from ?IPv6:::1? (dzccz6yfpdgdc5vwjcs5y-3.rev.dnainternet.fi. [2001:14ba:a085:4d00:8c19:462c:c647:13f2])
        by smtp.gmail.com with ESMTPSA id z14-20020a056512370e00b004aa95889063sm534262lfr.43.2022.12.13.14.05.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Dec 2022 14:05:34 -0800 (PST)
Date:   Wed, 14 Dec 2022 00:02:59 +0200
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, airlied@gmail.com
CC:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v12_2/5=5D_dt-bindings=3A_msm/dp=3A_a?= =?US-ASCII?Q?dd_data-lanes_and_link-frequencies_property?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com> <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <04C3BCD6-5ABE-45FF-995E-DB7E60E8406C@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13 December 2022 23:44:05 EET, Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>=
 wrote:
>Add both data-lanes and link-frequencies property into endpoint
>
>Changes in v7:
>-- split yaml out of dtsi patch
>-- link-frequencies from link rate to symbol rate
>-- deprecation of old data-lanes property
>
>Changes in v8:
>-- correct Bjorn mail address to kernel=2Eorg
>
>Changes in v10:
>-- add menu item to data-lanes and link-frequecnis
>
>Changes in v11:
>-- add endpoint property at port@1
>
>Changes in v12:
>-- use enum for item at data-lanes and link-frequencies

This is not a full list of changes

>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>`
>---
> =2E=2E=2E/bindings/display/msm/dp-controller=2Eyaml        | 30 ++++++++=
++++++++++++--
> 1 file changed, 28 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyam=
l
>index f2515af=2E=2E8fb9fa5 100644
>--- a/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml
>@@ -81,6 +81,7 @@ properties:
>=20
>   data-lanes:
>     $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>+    deprecated: true
>     minItems: 1
>     maxItems: 4
>     items:
>@@ -96,14 +97,37 @@ properties:
>=20
>   ports:
>     $ref: /schemas/graph=2Eyaml#/properties/ports
>+
>     properties:
>       port@0:
>-        $ref: /schemas/graph=2Eyaml#/properties/port
>+        $ref: "/schemas/graph=2Eyaml#/$defs/port-base"
>         description: Input endpoint of the controller
>+        properties:
>+          endpoint:
>+            $ref: /schemas/media/video-interfaces=2Eyaml#


I'd keep it as is=2E There are no video properties at this side of the gra=
ph=2E

>=20
>       port@1:
>-        $ref: /schemas/graph=2Eyaml#/properties/port
>+        $ref: "/schemas/graph=2Eyaml#/$defs/port-base"
>         description: Output endpoint of the controller
>+        properties:
>+          endpoint:
>+            $ref: /schemas/media/video-interfaces=2Eyaml#
>+            properties:
>+              data-lanes:
>+                minItems: 1
>+                maxItems: 4
>+                items:
>+                  enum: [ 0, 1, 2, 3 ]
>+
>+              link-frequencies:
>+                minItems: 1
>+                maxItems: 4
>+                items:
>+                  enum: [ 1620000000, 2700000000, 5400000000, 8100000000=
 ]
>+
>+    required:
>+      - port@0
>+      - port@1
>=20
> required:
>   - compatible
>@@ -193,6 +217,8 @@ examples:
>                 reg =3D <1>;
>                 endpoint {
>                     remote-endpoint =3D <&typec>;
>+                    data-lanes =3D <0 1>;
>+                    link-frequencies =3D /bits/ 64 <1620000000 270000000=
0 5400000000 8100000000>;=20
>                 };
>             };
>         };

--=20
With best wishes
Dmitry
