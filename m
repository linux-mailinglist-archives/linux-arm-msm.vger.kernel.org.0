Return-Path: <linux-arm-msm+bounces-7556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768D831AB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 14:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F391F1F229F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 13:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F02325553;
	Thu, 18 Jan 2024 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DH05Yrd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315C25541
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705585110; cv=none; b=FR+BVkEmK19V2T7WXld4GpbSWxtiVQzwY7Sshgh4dohCuUQKxngkxDvejwN9bZ9UUKtC2Hf3xchwYJ62KlqQc2j7CAQpipirDudk2ZKBBRmS1TNeAgPi3H/zpaa7BaUjuNJwgLDZLF8AAiXuunYmm1bz/+M/n1uj5bpc+ndSC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705585110; c=relaxed/simple;
	bh=Z8Vfb0SGZBAI4P2ZDVDjsMweYGzgqrj6T42o6rn6LT8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=rS2iuCbLSg/8uZ3AnKKZCNOZ4JwvY7yE5/9MDvlMA4RmOmLfjQR3x7UNBeWDq7uUM2vX0fop3LR/eEIEnlyCQQ1yhiSWjyDQOF09DygbqEJCWyD/n11rX8JyApEnLcCCW0pnzwcVLetG0/a1J1XS8VnbAVX//w34ufMkEvMK1v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DH05Yrd+; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc226bad48cso2681743276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 05:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705585108; x=1706189908; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A4oOpN8Y3DEZ3CQYkWBnW0jH3tN+IO9B+O6AmYvwm30=;
        b=DH05Yrd+eviPoVAB6B24oLBR3HXkeU5u2xFplMd/eJKVEjTbQFcWfKblhPPBAVhSge
         91oxsLqWmgzYGFRQXjCQlB6iV/zzHOX00JL+x5X9H0N9sEZZ5PkaK3Sx4yR6eY/8jpOw
         AQ80FHBgKzERMqnBJj8eYI48vXUum/Pl0j5yom3LSrod9R6Bzvw6LnRrPfu7NOU9SjOP
         0T1Wj7XHW93SQiGpg4vPtmQeh2MqHlX5VP46EaLbxrpsdixHIm/E07xpwK+WCuE053N/
         ZqBHtpPktZMFhuXeDqpokYYyIofwSEXX+7PxoLfC6KMXnMdsxBJvMzzkGlb7KHkDyl79
         DMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705585108; x=1706189908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4oOpN8Y3DEZ3CQYkWBnW0jH3tN+IO9B+O6AmYvwm30=;
        b=BbB8p1jCfNSppbbRkF1blrwsI1mDVm9BVzxbi5F5gAZpzR/ar6mMhTBqiM3MglSuKM
         3l5zaXhVEvsR95EAOdSq4P5ZLMA1y/91RqEu299wxsOoL4w4NkH72Kwkorr1s5cjwqO/
         syDoadIoM1WWRGD7gpp829yT/bGP8BjIfIgdsZBfdFMCNOItl0DwdtoRs44u9iEVSq3V
         LccmLzR/lfawWFqC6UAZVD+5IV+0dv16+Z8s2r29zYAFsXmu7B5HrTuFajBB+NTN2aDc
         TxcbBdwYcSuHEmpav4TEOroGPV9a4h5GIAxV5maJsk4eHQ691xArdhYt4zxuDfSOs+Eb
         sMJg==
X-Gm-Message-State: AOJu0YwWIAi7ricueY9dVPMaEdWJQdwt8RwvzgcTGQKXZFbANOsZRsp0
	wROJZdRyfRO05I/iQ/Nlsn+W1bbXPCgUe77wZxrE0kmi6PYc9ILlWLlm6vdqI3U5xzJHxb0I8De
	65SnrR5AzjWbSNQI42stYZx3Zxu1vOeMWYaye/A==
X-Google-Smtp-Source: AGHT+IGdy20i2CdAntPsHqXzGz66RuOXdG6qrXdmHo9xtm2eAIXSW6yR7iTaedJKEXIvZXfSQTfQ1EP5Lws0BWE9adg=
X-Received: by 2002:a5b:d0b:0:b0:dc2:260d:f00b with SMTP id
 y11-20020a5b0d0b000000b00dc2260df00bmr556118ybp.60.1705585107916; Thu, 18 Jan
 2024 05:38:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org> <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
 <20240117220153.GA649327@hu-bjorande-lv.qualcomm.com> <9a24a065-b649-4431-b8fb-78c733c07671@linaro.org>
In-Reply-To: <9a24a065-b649-4431-b8fb-78c733c07671@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jan 2024 15:38:16 +0200
Message-ID: <CAA8EJppEFSy2=GKgkqC3uS15cO51KfxDrHtxHhAnA10kScYKhQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related blocks
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jan 2024 at 13:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 1/17/24 23:01, Bjorn Andersson wrote:
> > On Mon, Jan 15, 2024 at 11:00:53AM +0100, Konrad Dybcio wrote:
> >> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
> >>> Define VBUS regulator and the Type-C handling block as present on the
> >>> Quacomm PMI632 PMIC.
> >>>
> >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
> >>>   1 file changed, 30 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> >>> index 4eb79e0ce40a..d6832f0b7b80 100644
> >>> --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> >>> @@ -45,6 +45,36 @@ pmic@2 {
> >>>             #address-cells = <1>;
> >>>             #size-cells = <0>;
> >>>
> >>> +           pmi632_vbus: usb-vbus-regulator@1100 {
> >>> +                   compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
> >>> +                   reg = <0x1100>;
> >>> +                   status = "disabled";
> >>> +           };
> >>> +
> >>> +           pmi632_typec: typec@1500 {
> >>> +                   compatible = "qcom,pmi632-typec";
> >>> +                   reg = <0x1500>;
> >>> +                   interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> >>> +                                <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> >>> +                                <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> >>> +                                <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> >>> +                                <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> >>> +                                <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> >>> +                                <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> >>> +                                <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
> >> This differs from the downstream irq types:
> >>
> >> <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
> >> <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
> >> <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
> >> <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
> >> <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
> >> <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
> >> <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
> >> <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;
> >>
> >
> > Interrupt 1, 3, and 6 are level interrupts for which it's reasonable to
> > act on both edges. Interrupt 0, 2, 4, 5, and 7 are "pulse interrupts",
> > for which it seems reasonable to act on only one of the edges.
> >
> > To me, Dmitry's proposed version makes more sense than downstream.
>
> Thanks a lot for crosschecking!

Is there an ack?


-- 
With best wishes
Dmitry

