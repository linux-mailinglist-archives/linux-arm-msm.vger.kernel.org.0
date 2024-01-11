Return-Path: <linux-arm-msm+bounces-7044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F246B82B26E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 17:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 693E9B245CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 16:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035A04F894;
	Thu, 11 Jan 2024 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLJOl9rW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE14F882
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso57239807b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 08:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704989214; x=1705594014; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9PuIKXYJ8WO/maoVfroyyO8XVO5WxbNktc0uFfTKoBQ=;
        b=vLJOl9rW3PJIXLb21bJACxCfF9ZSYKpYJ0rq5WEW3mFgSVhi60fNY58z4V+T8ghwmE
         5190G+vJns+Hrll/l2AtIFMJXC+Wf1NhUr2kO61bb7zq05kzwKrQ+QBuWwz3ShzKNpIX
         s/VFnIzzm1Bq/eT5KqV8FJvQMmd1wHq1vQmf+I+x/0TEyEfgwKeeOfkAYBBHeME7glKG
         VNHV4qqI2Sg3JXb7uDhY0p8R1I3yC5qlFYSWQvjfc6YKvp3Z0EsS/FIZAwUAXfqACuoV
         uovvFHJLdzcrzPhx8mYuwm/NrrCOdr1RuVL68golYFZYCwxKeTQlKdRDlzvHckzBs4cu
         QE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704989214; x=1705594014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PuIKXYJ8WO/maoVfroyyO8XVO5WxbNktc0uFfTKoBQ=;
        b=NJ7UanGSb2xMfxZVYq3sc11Qdt28pnz0hyeScul+t36/ooHWSCHkNV41/hkEqq8e9T
         x58XHqHiRV7cc58Ql+CkSpMChb1RK6BjmX4AyuDkk/9fph9zIshyKC36zpdGatLWsTqX
         //8s4NOz8NPqB73viEpznMSL0FwKSYRfsELENCifiykpkdkwB3XWnNdr2MxdlJpMPPLC
         6TdChcj9ShZMQE33yyFR7ZjZb+dvpR0KPAJZVOJJCufHif0S1mGEA/TcVf/EWZXAtlXO
         Hc9Pfj6CFkwYRP/un9y/g6/ge29oWtSYcj6sEni6ukIVGJJQMW5xeNVbsCNMqbrzbAlO
         fA5g==
X-Gm-Message-State: AOJu0Yy4HoO1OKJkwKSfKOaXEOuQdJil2E8K/ld9oTcWHZUr1SfXlH2o
	aHV8pTNB9an3Qez4wj7p+mQ1oCWz0jAOHiunzQjJxwZgGl4BvA==
X-Google-Smtp-Source: AGHT+IFmFfgSVm19pQ+qKl8DnLELtP78DuTwuE4K1YOjX7HQk3ouLFBHRL7t3xjWuzeIzVZ87tlvLy9sB0U8VqrjxsA=
X-Received: by 2002:a81:be02:0:b0:5e8:2bd:9b96 with SMTP id
 i2-20020a81be02000000b005e802bd9b96mr12283ywn.17.1704989214192; Thu, 11 Jan
 2024 08:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110112059.2498-1-quic_luoj@quicinc.com> <20240110112059.2498-2-quic_luoj@quicinc.com>
 <a42718a9-d0f9-47d9-9ee8-fb520ed2a7a8@linaro.org> <de0ad768-05fa-4bb1-bcbc-0adb28cb2257@quicinc.com>
In-Reply-To: <de0ad768-05fa-4bb1-bcbc-0adb28cb2257@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 18:06:42 +0200
Message-ID: <CAA8EJppeQdB4W8u0ux16pxBBwF_fpt1j-5aC0f849n9_iaaYtQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: ipq9574: Add PPE device tree node
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_soni@quicinc.com, 
	quic_pavir@quicinc.com, quic_souravp@quicinc.com, quic_linchen@quicinc.com, 
	quic_leiwei@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jan 2024 at 17:31, Jie Luo <quic_luoj@quicinc.com> wrote:
>
>
>
> On 1/10/2024 7:40 PM, Krzysztof Kozlowski wrote:
> > On 10/01/2024 12:20, Luo Jie wrote:
> >> The PPE device tree node includes the PPE initialization configurations
> >> and UNIPHY instance configuration.
> >>
> >> Ther are 3 UNIPHYs(PCS) on the platform ipq9574, which register the
> >> clock provider to output the clock for PPE port to work on the different
> >> link speed.
> >>
> >> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 730 +++++++++++++++++++++++++-
> >>   1 file changed, 724 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> index 810cda4a850f..5fa241e27c8b 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> @@ -775,16 +775,734 @@ nsscc: nsscc@39b00000 {
> >>                               <&bias_pll_nss_noc_clk>,
> >>                               <&bias_pll_ubi_nc_clk>,
> >>                               <&gcc_gpll0_out_aux>,
> >> -                             <0>,
> >> -                             <0>,
> >> -                             <0>,
> >> -                             <0>,
> >> -                             <0>,
> >> -                             <0>,
> >> +                             <&uniphys 0>,
> >> +                             <&uniphys 1>,
> >> +                             <&uniphys 2>,
> >> +                             <&uniphys 3>,
> >> +                             <&uniphys 4>,
> >> +                             <&uniphys 5>,
> >>                               <&xo_board_clk>;
> >>                      #clock-cells = <1>;
> >>                      #reset-cells = <1>;
> >>              };
> >> +
> >> +            qcom_ppe: qcom-ppe@3a000000 {
> >
> > qcom is definitely not a generic name.
> >
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
> Ok, will update to use a generic name in the link, Thanks for the
> guidance and the link.
> >
> >
> >> +                    compatible = "qcom,ipq9574-ppe";
> >
> > I don't see this documented. I don't see reference to posted bindings.
>
> The DT bindings patch was part of the driver series as below. This
> property was documented in the DT bindings patch. Attaching it to DTSI
> series should make it more clear. If this is fine, I will update the
> DTSI series with the DT bindings patch.
> https://lore.kernel.org/netdev/20240110142428.52026d9e@kernel.org/
>
> >
> > Please run scripts/checkpatch.pl and fix reported warnings. Some
> > warnings can be ignored, but the code here looks like it needs a fix.
> > Feel free to get in touch if the warning is not clear.
> >
> > Ignoring this warning is a sign you don't really check your patches
> > before sending.
>
> We have run the checkpatch.pl on the whole patch series including this
> device tree patch set together with PPE driver patch set.
> As mentioned above, I will add the DT bindings patch into the DTS
> series. This should help with the checkpatch issue.

This will cause even more confusion, as there will be two instances of
the dt-bindings patch. One in the driver patchset, another one in the
DT changes. You just have to specify the dependencies in the cover
letter. Another option is to wait for the bindings + driver to be
accepted, then send the DTSI changes (and again, specify the
dependency).

>
> >
> >> +                    reg = <0x3a000000 0xb00000>;
> >> +                    #address-cells = <1>;
> >> +                    #size-cells = <1>;
> >> +                    ranges;
> >
> > Put after reg.
> Ok.
>
> >
> >> +                    status = "okay";
> >
> > Drop
> Ok.
>
> >
> > All of above comments apply to your entire patchset and all places.
> >
> > Looking at code further, it does not look like suitable for mainline,
> > but copy of downstream code. That's not what we expect upstream. Please
> > go back to your bindings first. Also, I really insist you reaching out
> > to other folks to help you in this process.
> >
> > Best regards,
> > Krzysztof
> >
> We will do internal review of the gaps and update the patches as per
> your comments.
>
> Thanks for the review comments.

From the first glance, the bindings do not follow upstream principles.
You have all the settings (tdm, port config, etc) in the DT, while
they should instead go to the driver. Well, unless you expect that the
board might need to override them.

-- 
With best wishes
Dmitry

