Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B5340F3E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 10:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbhIQIRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 04:17:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21167 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237857AbhIQIRP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 04:17:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631866554; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=B5ORCBwgNQl5ow+QjWVTKGscJFpCMUohasS/OMFn1go=; b=uM/Pe/9AqOJpqigFtX5upUvRN9PxBSsNPB7pmFLPvgEWSGR9A1lYNotL9lfABWv2CTzvaZ80
 39AS+0XX0EuIckoeNAJFWpd9PNdVEm4tU3ULPTPOXta/TfyR4lKsMzxfhIW3jq9RVnpQnYC8
 2PP+1xx/jgd/tjwQBDvpyZtzyu0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61444c1fb585cc7d240728d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 08:04:47
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4A340C43619; Fri, 17 Sep 2021 08:04:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.149.158.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 906C7C4338F;
        Fri, 17 Sep 2021 08:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 906C7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1631811121-32662-1-git-send-email-pillair@codeaurora.org> <CAE-0n50Qmnxa8dz9pQbP408Y_vOu_8j1qeYFGo61W47WQkGunA@mail.gmail.com>
In-Reply-To: <CAE-0n50Qmnxa8dz9pQbP408Y_vOu_8j1qeYFGo61W47WQkGunA@mail.gmail.com>
Subject: RE: [PATCH v3] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Date:   Fri, 17 Sep 2021 13:34:39 +0530
Message-ID: <001001d7ab9a$ad6e9de0$084bd9a0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI9zuPItyMZ6cixTNcgXkzSDqOHZwIO8vddqssfoKA=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Friday, September 17, 2021 6:25 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; sibis@codeaurora.org; mpubbise@codeaurora.org;
> kuabhs@chromium.org
> Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add WPSS remoteproc
> node
>=20
> Quoting Rakesh Pillai (2021-09-16 09:52:01)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > index 64fc22a..2b8bbcd 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > @@ -1423,6 +1433,59 @@
> >                         #power-domain-cells =3D <1>;
> >                 };
> >
> > +               remoteproc_wpss: remoteproc@8a00000 {
> > +                       compatible =3D "qcom,sc7280-wpss-pil";
> > +                       reg =3D <0 0x08a00000 0 0x10000>;
> > +
> > +                       interrupts-extended =3D <&intc GIC_SPI 587
> IRQ_TYPE_EDGE_RISING>,
> > +                                             <&wpss_smp2p_in 0 =
IRQ_TYPE_EDGE_RISING>,
> > +                                             <&wpss_smp2p_in 1 =
IRQ_TYPE_EDGE_RISING>,
> > +                                             <&wpss_smp2p_in 2 =
IRQ_TYPE_EDGE_RISING>,
> > +                                             <&wpss_smp2p_in 3 =
IRQ_TYPE_EDGE_RISING>,
> > +                                             <&wpss_smp2p_in 7 =
IRQ_TYPE_EDGE_RISING>;
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
> > +                       power-domains =3D <&rpmhpd SC7280_CX>,
> > +                                       <&rpmhpd SC7280_MX>;
> > +                       power-domain-names =3D "cx", "mx";
> > +
> > +                       memory-region =3D <&wpss_mem>;
> > +
> > +                       qcom,qmp =3D <&aoss_qmp>;
> > +
> > +                       qcom,smem-states =3D <&wpss_smp2p_out 0>;
> > +                       qcom,smem-state-names =3D "stop";
> > +
> > +                       resets =3D <&aoss_reset =
AOSS_CC_WCSS_RESTART>,
> > +                                <&pdc_reset PDC_WPSS_SYNC_RESET>;
> > +                       reset-names =3D "restart", "pdc_sync";
> > +
> > +                       qcom,halt-regs =3D <&tcsr_mutex_regs =
0x37000>;
>=20
> Where is this node defined? I don't see it on the mailing list for =
sc7280. Can
> you indicate what patches this depends on, and use git format-patch =
--base=3D
> so we can try to find them ourselves.

Hi Stephen,
My bad, it shud be "tcsr_mutex" instead of "tcsr_mutex_regs".
I will correct it and send v4.

