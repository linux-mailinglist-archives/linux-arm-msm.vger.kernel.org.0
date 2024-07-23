Return-Path: <linux-arm-msm+bounces-26879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6AE939EC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 12:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7175B1C22000
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F17113E034;
	Tue, 23 Jul 2024 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1czTTXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310C14D6EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721730807; cv=none; b=tbtPDL7RecrdxuYXFXw70kvK9zIUIK9Zdmnfo6520FeAipaPyhN9M0+mk7YIZ6b5IBzZl+WUFtyNaoHb1aWZJ8Ucu+ejghxmjaJ3S7wFTDpZU3J5pMcM+QS0HdHZd33BPsP7ctpEXSGj5peSvI3lA7tupTZowQ2vZX2Bbv68P/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721730807; c=relaxed/simple;
	bh=m5FZdSlKSn2HH1WK/8QoH35aY2wLvBYaB1dz9p412/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUE5BgahYPUSVaWmt8e1aP8cegxncHzeP4y25fq+QL2/8XZ2uHTt60hRWDFVZrBLBd42Bd8OQHatfOaj70OCquy4VQvJH/6q/cKRBEFOJFZAUav4uREAJ1YrAhQAZCR7btoiGXV5g0I+CCdHJKPOIpAVa+Nyf76mY6d+ICOtljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1czTTXx; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-66c7aeac627so23062577b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721730804; x=1722335604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cYfTKvKSj7lLoJokuJJ1LaOPnzxS1ubH2/iuemUb/w=;
        b=O1czTTXxBv7hIsLjrT7Wth+zQcXcVk93479T+TDZu3p40qhTehJ/NtUBbK1HQ9cW7H
         0kzJgwb3zuvaflqowmUH/yajv2sGhoX/RAo1f2Jn3MrgwV0CsPPGL67XrxYVNvoVrnWW
         WsuAxvNpsvtv1rR9RyMlXRSXaQLPk3hOWtdm3Mhn1N9wFsKowrMqOj3AXkSh2kjePN+y
         mR9kVBHrCW4O6MKYmqa83tzVLpO4S18k3hZ/iLHwbWRllWTFOlix9FJWZthVaCSHVqlV
         K5Asg4gUUVDiiBgA7NPYfNuU1wwg02o4lfzJ1/p2FOWCgFakFz/d8MCYug7WnbcwYwTE
         m6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721730804; x=1722335604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cYfTKvKSj7lLoJokuJJ1LaOPnzxS1ubH2/iuemUb/w=;
        b=n6ap1Xft3tF4dpTvRwq2zPIk4rqPLDxK6KLL0hRQEgPF5euC1zUvdjnlOY79O0xsag
         AKdhH3MiqWCSuEtZn8rB5wS6apHfBW0xX28A/jz0WntgrvnO+VMDXNTpMRL70r6UCD2y
         WvNoQAkJo0KqquM9hHIvgO1eKvs5cD4bx4mY3L7Ce124He/1+asd+82nvSKWk3ULRAHW
         6mmgiuoei3v0DAwU8OIHBFVYciLVVWLsJmdIrrfTV87XZQqFbqMvHqM1OTv3Q78VO0x6
         2brhRy+Qr5sTWLqk5IS3ZGJ71PbAV1BDgk0XtuP/Iv0rqS+20PkIE3Evyj/Mcl+mM5CR
         SJQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkMMOYVLpbOTZU9qThAUYcN94ja2wnSlX8eqTDu4jTDa0+YrWpwpd9mkFhFTYHuQnAw6Z1SeaRksmzdhi4Iep+ZfcxDYC1XpK5yCKGTA==
X-Gm-Message-State: AOJu0YwVeqwxPJo9SW7YMFGhZKNLeeh9Iri00+aXEIou+IWuYOMai7KG
	pYZoui+JQ5wBLnebN/6twPab81rs3F1DleEGKl7BXuCwrFtk8BUSj2hjMd0jNATCWb9zQeVACsH
	zGsgy7BfxFh1xfvC17ErCdhvD1Nt1QFg7aRXuKA==
X-Google-Smtp-Source: AGHT+IE00J2zhKrMFAIQ9tWF9/wq6znQzjO6mWhp+k6HEoTeyFAK8Bt9BVV2ly5zyAI3/BeUBiSvs/jJzJr+pm3H9bE=
X-Received: by 2002:a05:6902:2486:b0:e08:8aba:644a with SMTP id
 3f1490d57ef6-e088aba655emr8727052276.19.1721730803694; Tue, 23 Jul 2024
 03:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
 <20240722-miix630-support-v1-1-a6483cfe8674@linaro.org> <cac3d7ba-2a62-479d-94c2-c6dc4d7a5ba2@linaro.org>
 <CAA8EJprROf-aJgJvUMb3D+dCzOUO-eRzM3khM6ZY8b+z+_gByA@mail.gmail.com> <2448216d-344d-4ffa-826f-d077ab9b1958@linaro.org>
In-Reply-To: <2448216d-344d-4ffa-826f-d077ab9b1958@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 13:33:12 +0300
Message-ID: <CAA8EJppu3eaWrgz89Qkx3ZXrQoWVgL1ODoX224g7FYh1pX=Ydw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8998-lenovo-miix-630: enable touchscreen
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 13:01, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 23.07.2024 3:09 AM, Dmitry Baryshkov wrote:
> > On Tue, 23 Jul 2024 at 02:22, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 22.07.2024 1:57 PM, Dmitry Baryshkov wrote:
> >>> There is no point in keeping touchscreen disabled, enable corresponding
> >>> i2c-hid device.
> >>>
> >>> 04F3:2608 Touchscreen as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input1
> >>> 04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input2
> >>> 04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input3
> >>> 04F3:2608 Stylus as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input4
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 28 ++++++++++++++++++++++
> >>>  1 file changed, 28 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> >>> index a105143bee4a..118c55f5bcfd 100644
> >>> --- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> >>> @@ -11,6 +11,24 @@ / {
> >>>       chassis-type = "convertible";
> >>>  };
> >>>
> >>> +&blsp1_i2c5 {
> >>> +     clock-frequency = <400000>;
> >>> +     status = "okay";
> >>> +
> >>> +     tsc1: hid@10 {
> >> weird (and unused label)
> >>
> >> very non-specific node name too
> >>
> >>> +             compatible = "hid-over-i2c";
> >>> +             reg = <0x10>;
> >>> +             hid-descr-addr = <0x1>;
> >>> +
> >>> +             interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
> >>> +
> >>> +             pinctrl-0 = <&i2c5_hid_active>;
> >>> +             pinctrl-names = "default";
> >>> +
> >>> +             wakeup-source;
> >>
> >> double tap to wake? tap to wake?
> >>
> >>> +     };
> >>> +};
> >>> +
> >>>  &blsp1_i2c6 {
> >>>       status = "okay";
> >>>
> >>> @@ -35,3 +53,13 @@ &remoteproc_mss {
> >>>  &sdhc2 {
> >>>       cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
> >>>  };
> >>> +
> >>> +&tlmm {
> >>> +     i2c5_hid_active: i2c5-hid-active-state {
> >>> +             pins = "gpio125";
> >>> +             function = "gpio";
> >>> +
> >>> +             bias-pull-up;
> >>> +             drive-strength = <2>;
> >>
> >> Since there are no other pin definitions, you can do better and not
> >> copy the old rotten style ;)
> >
> > Both node and pinctrl were c&p from c630. But was is rotten here?
>
> yes, we stopped putting a random newline in there quite some years ago

Ack

-- 
With best wishes
Dmitry

