Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695737DBB74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 15:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbjJ3OLj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 10:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbjJ3OLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 10:11:35 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257A8D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 07:11:33 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so7678120a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698675089; x=1699279889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4pKFRQbiSaL9ZKbrNbTowWU8USbI5fmQxi6InoyZho=;
        b=RFE/nEerAdtNfSCMKLf49A/PFII6jUA0aO45W2A2PARV9CoY0DdDynV3SuAFCOH+z8
         1sLafhvMZ0leOa0JdgqhaljdxV6KGerhqjy9kx8iX/7nU6v5uoJWE1nJLaEJ7p4oo4Wu
         cd2Db2OybuLpULssyQASgmwaMHprZZpEAcgho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698675089; x=1699279889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4pKFRQbiSaL9ZKbrNbTowWU8USbI5fmQxi6InoyZho=;
        b=fHgt8SMyxcpJqX0Gv/eTJmuCy+vHj7bpzpF/AFY3LhciW9YPuH2V12r8G7C02F7mRp
         Tw6jTkORmYmIXg/C9PnUODJnFzhroDdcis2lmM7XV60vscRcSL8LldUN1mKfSrU96l+I
         B0zr+R2rpd6w0MqDTfnKIqwRE9J/eKpZF2Cg6iv0LwB2PTcsnknsDso4Q8e0s5IJjhRa
         Jc+FLoojGEk/K1fLFWZZIJtUp9X1GRBzsqq12XzvPucYI6ulfe62zfppNzdsyPU8c3/j
         NnNjkYCAdI/BlJPZlvESrcTxT+HhiAsPHkil1BGWBYGVeeBqjZXzVTieP/vmbkUQKIR/
         oiNw==
X-Gm-Message-State: AOJu0YzAfTFAEcmb+n6t5IoGMB38AtEMzvA/De+xJyyoG/5cz+w52s/N
        NYOVec2XB5B46/V+u7l92Ik4Loen6YF84CsBKv4Wsg==
X-Google-Smtp-Source: AGHT+IGtm11VwSbrQuMvnY934mAwkNWdX7g4Mm+svOLSEWNDNdTHPMElq9HnNQAirLK8rHgNczdShw==
X-Received: by 2002:aa7:d392:0:b0:53e:6013:7fe8 with SMTP id x18-20020aa7d392000000b0053e60137fe8mr8534260edq.22.1698675088898;
        Mon, 30 Oct 2023 07:11:28 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id i11-20020a0564020f0b00b0053ebf32da31sm6213956eda.57.2023.10.30.07.11.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 07:11:28 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso94715e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 07:11:27 -0700 (PDT)
X-Received: by 2002:a05:600c:5128:b0:3f7:3e85:36a with SMTP id
 o40-20020a05600c512800b003f73e85036amr116810wms.7.1698675087168; Mon, 30 Oct
 2023 07:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
 <20231027-sc7280-remoteprocs-v1-7-05ce95d9315a@fairphone.com>
 <7934a36a-9438-719a-2ed0-4a78757b044b@quicinc.com> <CWLNP6QNUXN1.SNVACF2IEGI8@fairphone.com>
In-Reply-To: <CWLNP6QNUXN1.SNVACF2IEGI8@fairphone.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Oct 2023 07:11:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6mi0h0MBFMC+ba4oq-te6_+WR6fj1XjAq7tmUu64bUA@mail.gmail.com>
Message-ID: <CAD=FV=U6mi0h0MBFMC+ba4oq-te6_+WR6fj1XjAq7tmUu64bUA@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sc7280: Add CDSP node
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Mukesh Ojha <quic_mojha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Oct 30, 2023 at 2:12=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> On Mon Oct 30, 2023 at 10:04 AM CET, Mukesh Ojha wrote:
> >
> >
> > On 10/27/2023 7:50 PM, Luca Weiss wrote:
> > > Add the node for the ADSP found on the SC7280 SoC, using standard
> > > Qualcomm firmware.
> > >
> > > The memory region for sc7280-chrome-common.dtsi is taken from msm-5.4
> > > yupik.dtsi since the other areas also seem to match that file there,
> > > though I cannot be sure there.
> > >
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   5 +
> > >   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 138 ++++++++++=
+++++++++++
> > >   2 files changed, 143 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arc=
h/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > index eb55616e0892..6e5a9d4c1fda 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > @@ -29,6 +29,11 @@ adsp_mem: memory@86700000 {
> > >                     no-map;
> > >             };
> > >
> > > +           cdsp_mem: memory@88f00000 {
> > > +                   reg =3D <0x0 0x88f00000 0x0 0x1e00000>;
> > > +                   no-map;
> > > +           };
> > > +
> >
> > Just a question, why to do it here, if chrome does not use this ?
>
> Other memory regions in sc7280.dtsi also get referenced but not actually
> defined in that file, like mpss_mem and wpss_mem. Alternatively we can
> also try and solve this differently, but then we should probably also
> adjust mpss and wpss to be consistent.
>
> Apart from either declaring cdsp_mem in sc7280.dtsi or
> "/delete-property/ memory-region;" for CDSP I don't really have better
> ideas though.
>
> I also imagine these ChromeOS devices will want to enable cdsp at some
> point but I don't know any plans there.

Given that "remoteproc_cdsp" has status "disabled" in the dtsi, it
feels like the dtsi shouldn't be reserving memory. I guess maybe
memory regions can't be status "disabled"?

-Doug
