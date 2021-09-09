Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7D9404721
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 10:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhIIIkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 04:40:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64867 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbhIIIkJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 04:40:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631176740; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=dZetHwaye2lReUsUd8ql1cJnBrL9CLUFOLmfRGtkGzg=; b=EOYgFp+oPQjL6A66GYwb7TRoOubyxQIyWzAmIdB0iJ3OWFkoa9MGtVZPU0Bbl8juxtYffSBG
 biBTjilLLr6Ip0TSqVw7GqGwILKYN9rj7q9EKx0b4JIGjALob9hJIT+Qwg/LKjODSdijOp/C
 odMQiaXh+EXBil2/VC3YATiDiaA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6139c824ab61cfa9f4da5fa5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 08:39:00
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA3F9C43616; Thu,  9 Sep 2021 08:38:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.149.158.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4797AC4338F;
        Thu,  9 Sep 2021 08:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4797AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>
References: <1628619089-12502-1-git-send-email-pillair@codeaurora.org> <CAE-0n539nm6BrR51bZW-jX8e=o5d19JFnKfT9fb-sVS9FGKn0A@mail.gmail.com>
In-Reply-To: <CAE-0n539nm6BrR51bZW-jX8e=o5d19JFnKfT9fb-sVS9FGKn0A@mail.gmail.com>
Subject: RE: [PATCH v2] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Date:   Thu, 9 Sep 2021 14:08:53 +0530
Message-ID: <005c01d7a556$220ae9b0$6620bd10$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFga5rYGLLrUznfOc7QK5071klN0gIeqw2xrHjfJdA=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Wednesday, August 11, 2021 1:22 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; sibis@codeaurora.org; mpubbise@codeaurora.org
> Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add WPSS remoteproc
> node
>=20
> Quoting Rakesh Pillai (2021-08-10 11:11:29)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 53a21d0..41a7826 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -74,6 +74,16 @@
> >                         reg =3D <0 0x8b700000 0 0x10000>;
> >                         no-map;
> >                 };
> > +
> > +               wlan_fw_mem: memory@80c00000 {
> > +                       no-map;
> > +                       reg =3D <0x0 0x80c00000 0x0 0xc00000>;
> > +               };
>=20
> Please try to keep this sorted by reg address. 80c00000 comes before
> 8b700000.
>=20

Hi Stephen,
I will fix this and send v3 for this patch.


> > +
> > +               wpss_mem: memory@9ae00000 {
> > +                       no-map;
> > +                       reg =3D <0x0 0x9ae00000 0x0 0x1900000>;
> > +               };
> >         };
> >
> >         cpus {
> > @@ -1270,6 +1280,53 @@
> >                         };
> >                 };
> >
> > +               remoteproc_wpss: remoteproc@8a00000 {
> > +                       compatible =3D "qcom,sc7280-wpss-pil";
> > +                       reg =3D <0 0x08a00000 0 0x10000>;
> > +
> > +                       interrupts-extended =3D <&intc GIC_SPI 587
> IRQ_TYPE_EDGE_RISING>,
> > +                                             <&wpss_smp2p_in 0 =
IRQ_TYPE_NONE>,
> > +                                             <&wpss_smp2p_in 1 =
IRQ_TYPE_NONE>,
> > +                                             <&wpss_smp2p_in 2 =
IRQ_TYPE_NONE>,
> > +                                             <&wpss_smp2p_in 3 =
IRQ_TYPE_NONE>,
> > +                                             <&wpss_smp2p_in 7
> > + IRQ_TYPE_NONE>;
>=20
> Is this IRQ_TYPE_EDGE_RISING? Please add some type of edge or level =
flag.

I will change it to IRQ_TYPE_EDGE_RISING and send out the next revision.

>=20
> > +                       interrupt-names =3D "wdog", "fatal", =
"ready", "handover",
> > +                                         "stop-ack", =
"shutdown-ack";
> > +
> > +                       clocks =3D <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
> > +                                <&gcc GCC_WPSS_AHB_CLK>,
> > +                                <&gcc GCC_WPSS_RSCP_CLK>,
> > +                                <&rpmhcc RPMH_CXO_CLK>;
> > +                       clock-names =3D "gcc_wpss_ahb_bdg_mst_clk",
> > +                                     "gcc_wpss_ahb_clk",
> > +                                     "gcc_wpss_rscp_clk",
> > +                                     "xo";
> > +
> > +                       memory-region =3D <&wpss_mem>;
> > +
> > +                       qcom,smem-states =3D <&wpss_smp2p_out 0>;

