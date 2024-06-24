Return-Path: <linux-arm-msm+bounces-23948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B03914DEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 248D71C22ABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC1613D600;
	Mon, 24 Jun 2024 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pf3phNxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99DB13D52C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234516; cv=none; b=r/46qjY2tEscG+3wis14veIzMLvL1f/Og3HLokuj9kOVCZs6fdSTIkDNORlTk4N52R43UcoFHQSLe0a3z/YoxJqXMorgs9jNT8px2Igo0q7mmFaHs+e3ZTmTlSDWrvbj9UWXIGMOEzixlfNpKQcALJ8cUEKc4kVnD+Ax3PyHURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234516; c=relaxed/simple;
	bh=NSk42wQXT5/Xm/NXv1x7pyxV8bcBaiuQanGLDAOqvow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Es0GVLURNpj32q7isWTi9J8F3uKyHohKQYgx98fNUvASYBEfrmTaE4tR6ZXEYCJxm1S67fnitJfZc599T+chVRuNdesrWQCQ1Jvf7C9o1hwZPEzarEzbmPMUr58HTN2r8P/B194TDp7gdCM+/ockygsFc01YRK3YUvwX4JBcHS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pf3phNxj; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e02b605bca2so3752245276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719234512; x=1719839312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ0GaeWHZJU3apbaE0PkNJm8vYB/Ehr9D/Vuo2kLMSY=;
        b=pf3phNxjKs6enxhgGaf5LiavBYcKvhKZHABr5D3a8MkDwZTuHmHA3uz+lAgIkaIdKw
         /CpkkMEnG8sgt5oL8DFb5R/XTs/6IOJSmPQoJ9mbVXF81M2eP1xeGsCFBKMHruAwUd2Q
         Sr2uwxl8zE4vnx3fkQJp6U8/MK6f6ABqzL/wtmykqD3CMP64wjtQxMOA2UCfYglaiTvs
         4ldV7g5h3nrVgO+VWuofqnzFMajU5jmDeQD/Pn8RigVlmXjvu6BpfuO2NTl6ryaWT5Fa
         OhXbKCZEzPxdfXUuQSvz64VfxuU7hJG/+O/4S4flAqiEyG2JQfxsNY3DraOsPu1nF/fK
         pfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234512; x=1719839312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ0GaeWHZJU3apbaE0PkNJm8vYB/Ehr9D/Vuo2kLMSY=;
        b=dckxfQamji//crw1ZpGaC5JEnNK2tUamG7oNgX5UheMG3EnpmV4PwABSaS/uLzFoQg
         BdXMg8kBUbTDWFEnIfpLxzlvTvKaQkgyffgKRBsyWU+FYhUgbf3cJSd6D1looCSBvZzm
         PVREhMhRwhLSQz1f2eGc1aSJSgGxqSqJ4pK2e/PV1rw7T2PdLY3cyfAyH6i2gPC2tsae
         orLu55y6XQeXrJJSZoSUndRTKpGGefbmWzT9HdyUGcQWVwvW7XOi5AzmCn1VnhlBt/03
         NusJsZNqZustz+LR3UVqAsZML1pezDc9ovtsaAAgfE9kB9m8HXGoZrsNMZ88OfcE2P09
         G1yA==
X-Forwarded-Encrypted: i=1; AJvYcCUfwPptFI86tKv9TGTc4e+err0o8pOUsZlMok4NSMqtWXi7eI13Gp+vipirYxefdjXIQcp7fe94RJ7M9h3wMqVZ44JKeYBwaIUVb613Pw==
X-Gm-Message-State: AOJu0YwM2FB/9H0k7lGWtGnTKtDE+nql4ziYMKhcK/5d7ZHJExoQmrMs
	n/myYry6mm7EC8hVYlfCPmwjVtm4sHLZq0m5je4ai/m9dhkQsUvMJyMVzXXaNvfHT6x3Uzn7Qb0
	ghuMp+h4EnKnYXNOSbegpbVHcdcaA+Ky/eUjBFQ==
X-Google-Smtp-Source: AGHT+IE/6w9SX4vD+UyerjeEC2niu6U7wagAXCpv5/FdgO2Xn6aChU2WgKm6SQVmwy1mG2UdMHIk7z4HCPL2yG6vkn4=
X-Received: by 2002:a05:6902:f0f:b0:dff:9d2:28c0 with SMTP id
 3f1490d57ef6-e02f9fcb425mr2801750276.21.1719234512544; Mon, 24 Jun 2024
 06:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-rb2-fixes-v1-0-8d763ee4e42e@linaro.org>
 <20240624-b4-rb2-fixes-v1-3-8d763ee4e42e@linaro.org> <8411fee8-7e09-421a-a52b-487acd3a3e24@linaro.org>
 <CAA8EJpoifd-Z175ZX6f6Pw+bQHY4F-rX05YoqJNr810_1KLm9Q@mail.gmail.com> <95a69492-afc2-4215-aa50-5d7aedbb1556@linaro.org>
In-Reply-To: <95a69492-afc2-4215-aa50-5d7aedbb1556@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 16:08:20 +0300
Message-ID: <CAA8EJpodS=x9BZwpnOLN2eOVA31pNy9YT7rJjVfKqAKJ7c3O_A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: prefer host mode on dev boards
To: neil.armstrong@linaro.org
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 15:33, <neil.armstrong@linaro.org> wrote:
>
> On 24/06/2024 14:31, Dmitry Baryshkov wrote:
> > On Mon, 24 Jun 2024 at 15:28, <neil.armstrong@linaro.org> wrote:
> >>
> >> On 24/06/2024 14:23, Caleb Connolly wrote:
> >>> Generally, when given the choice these boards should prefer host mode
> >>> since they're SBCs. When attached to a laptop (which is host-only) they
> >>> should still fall back to peripheral mode.
> >>
> >> It's really not what I observed on sm8550/sm8650 QRD/HDK, as the power
> >> is setup for peripheral by the bootloader and without an actual UCSI/PD
> >> negociation it would only be functionnal as peripheral mode.
> >>
> >> So this is definitely untrue on sm8450/sm8550/sm8650 HDK/QRD/MTP.
> >
> > But we now have the UCSI support for those platforms, don't we?
>
> UCSI doesn't care about role-switch-default-mode, it's the default
> fallback role to set when no role was explicitely set by UCSI.
>
> Setting host won't make it work because the power support is handled
> by the UCSI firmware. setting role-switch-default-mode = "host" will
> make the USB port unusable if UCSI fails to start since it's
> physically set to peripheral mode.

Let's not mix the source/sink and host/peripheral, those are
independent. But I see your point. Neither TCPM nor UCSI check this
property. So it seems it's incorrect to set it even for the TCPM
hosts.

>
> Neil
>
> >
> >>
> >> Neil
> >>
> >>>
> >>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> >>> ---
> >>>    arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
> >>>    arch/arm64/boot/dts/qcom/qrb2210-rb1.dts     | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/qrb4210-rb2.dts     | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/sm8150-hdk.dts      | 1 +
> >>>    arch/arm64/boot/dts/qcom/sm8350-hdk.dts      | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/sm8450-hdk.dts      | 1 +
> >>>    arch/arm64/boot/dts/qcom/sm8550-hdk.dts      | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/sm8550-mtp.dts      | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/sm8550-qrd.dts      | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/sm8650-hdk.dts      | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/sm8650-mtp.dts      | 4 ++++
> >>>    arch/arm64/boot/dts/qcom/sm8650-qrd.dts      | 4 ++++
> >>>    12 files changed, 39 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >>> index c4cde4328e3d..bac4ed5874b6 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >>> @@ -657,8 +657,9 @@ &usb_1 {
> >>>
> >>>    &usb_1_dwc3 {
> >>>        dr_mode = "otg";
> >>>        usb-role-switch;
> >>> +     role-switch-default-mode = "host";
> >>>    };
> >>>
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> >>> index e19790464a11..bece4896ca23 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> >>> @@ -593,8 +593,12 @@ &uart4 {
> >>>    &usb {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_dwc3_hs {
> >>>        remote-endpoint = <&pm4125_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> >>> index 1c7de7f2db79..17d36f0ef5ab 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> >>> @@ -661,8 +661,12 @@ &uart4 {
> >>>    &usb {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_dwc3_hs {
> >>>        remote-endpoint = <&pmi632_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> >>> index bac08f00b303..fe548d795490 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> >>> @@ -695,8 +695,9 @@ &usb_2 {
> >>>
> >>>    &usb_1_dwc3 {
> >>>        dr_mode = "otg";
> >>>        usb-role-switch;
> >>> +     role-switch-default-mode = "host";
> >>>    };
> >>>
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pm8150b_hs_in>;
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> >>> index e031ad4c19f4..20d5c54cfcf9 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> >>> @@ -847,8 +847,12 @@ &ufs_mem_phy {
> >>>    &usb_1 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_1_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> >>> index a754b8fe9167..ebafcbe6859e 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> >>> @@ -1098,8 +1098,9 @@ &usb_1 {
> >>>
> >>>    &usb_1_dwc3 {
> >>>        dr_mode = "otg";
> >>>        usb-role-switch;
> >>> +     role-switch-default-mode = "host";
> >>>    };
> >>>
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> >>> index e0dc03a97771..1efda478b7b9 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> >>> @@ -1252,8 +1252,12 @@ &ufs_mem_phy {
> >>>    &usb_1 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_1_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> >>> index 26dfca0c3e05..7b05932f9c36 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> >>> @@ -945,8 +945,12 @@ &ufs_mem_phy {
> >>>    &usb_1 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_1_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> >>> index 361b0792db4f..744bdc846e70 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> >>> @@ -1211,8 +1211,12 @@ &ufs_mem_phy {
> >>>    &usb_1 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_1_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> >>> index 092b78fd8a3b..f07a56583e7d 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> >>> @@ -1300,8 +1300,12 @@ &ufs_mem_phy {
> >>>    &usb_1 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_1_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> >>> index d6f91580ba8d..1a9a31423af4 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> >>> @@ -839,8 +839,12 @@ &ufs_mem_phy {
> >>>    &usb_1 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_1_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>>    };
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> >>> index bd60c2770da2..031b7ada8eb1 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> >>> @@ -1285,8 +1285,12 @@ &ufs_mem_phy {
> >>>    &usb_1 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +&usb_1_dwc3 {
> >>> +     role-switch-default-mode = "host";
> >>> +};
> >>> +
> >>>    &usb_1_dwc3_hs {
> >>>        remote-endpoint = <&pmic_glink_hs_in>;
> >>>    };
> >>>
> >>>
> >>
> >
> >
>


-- 
With best wishes
Dmitry

