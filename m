Return-Path: <linux-arm-msm+bounces-23942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065369149FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A0AD1C21347
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1192413C9C8;
	Mon, 24 Jun 2024 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyJno4Er"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896EE13C693
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719232283; cv=none; b=uJ9GY674Cy1+jZs+0UyNd+mRcdCGfgsEhm/Dp1X74LoKZVquhTkbovFopLGSxQaCHAWU+z4BYpWAzpzY9y45+XYbNLQhV74tS7s0s5/oVKj7UR6lWJQ89FaK+XG+a+Hc6SDZrvUszdrjmLfzLNUGvUO0zQmyMoV4vLmZR5Nb2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719232283; c=relaxed/simple;
	bh=Z03Hyk66WKHUeI6asS433i3/Raj/9DzLn+HKR6nc/xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rx/1L2TeotQ5dPnv26+5l5k+16q7FO1cbY0dH9BXGMfLE1u5Lr7fXVV+hQRRq2WvnubJO4vqMzSQyN/WXB9rq+n5gZgZFEXzrsctsfufwBFimxAYS573Fd0atQqHjYNs76kH/sD6QOjPmfOGlJbQkiLjnSdS3Rh3neX9e+dFCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyJno4Er; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-63bd10df78dso39397647b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719232276; x=1719837076; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wx1OKLgNZUx8KsLAfn7nDVW0j5Q8IXvt0cCAVJB75jk=;
        b=HyJno4ErZWo5caTgEeT2Vgrl90DNYatneeD3BWl43DFM4LLQDOPxNbNHHZVRKZ3YzE
         nYDtASGyZDjvZIP1CWuhn3E855x9OZP1SRqfjq0CDJE/8pCKvtgs9+DsMCu6oHqdR/Jf
         m4pvJVGcxrXeeohx4xOmNMWpWj09wLvAqWtCE5/8xarlz59+zW7NhBrz0z803gK8lwkC
         OMxGXaPMVCDv2UXVYhgqQvjkhZeoJNJ8oxLAoqEUw5oDlelIJthVHeWvoJiQwYlJY28J
         Tc4byppQp5kyF66pBA2jUBLphDsrATnruk+36fluXzqSYHM1F72itD9OQWYYRG8cmCn1
         yuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232276; x=1719837076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wx1OKLgNZUx8KsLAfn7nDVW0j5Q8IXvt0cCAVJB75jk=;
        b=ArbYA2ls3RSE/lg6HO77bqgC9Re7fAGbB0DElVDzjHUc7id7atpWVsKHePaZi6Ko6J
         zpWe5sO2S2uOdR3xquIIGmmG+H8slHRRQDFIrHI/FGfTYMSJzym160nGhMWlJ9JPGKhp
         4KLpjhzC0wFa+yZsylLixbnD+UhMNXdu2/0Hgd1EVfM62ENhbZvphHhmNj+G5cm6Rkag
         qYB1EzB8DsUlPY1YEWJ09uzAM+Je4EWhD2dSvUpkS6YjPaQfkYAAhR+1fcNNfb9wY6e1
         dw2VITmZXwT6GQJuhAT5NmYJjwVugOGTBu8iJElfxxuW8+ovyvMzn66Qetsi1IB8v7oA
         9QUA==
X-Forwarded-Encrypted: i=1; AJvYcCVspul/VbzT6VsACKo4pFMzvTrSfCyEOTzMZKCyBCbhOjd78/v4MkZGsc3paVX0djr81Vm/OWipaXeuywn3rapD9qPdIewDbelxnGV6mQ==
X-Gm-Message-State: AOJu0Yzjt4qSm9pPUgxOpYKyrqNprh5GOcPu1Ym972yjlkXcIXwT5Zi9
	s8JNmirNkoKxTcBrnbVVPVJ9/Ighf9EqcuxEXwNBn33FlrVdi6Jvm535WFb+JNAyK0gCGNSOowo
	alVIeLVXfQXSDKvKpEcKkQ28bOxcTj9O3BQiK9A==
X-Google-Smtp-Source: AGHT+IHGxKEtZcPtKy1OThdIuOF49JeaB51ZmFNMNgH3I2rXIgTJiIR9n+JSvfl11EtcJzdvUh2Rg5DW5KdxMjgrqnM=
X-Received: by 2002:a81:f203:0:b0:62c:f82b:553f with SMTP id
 00721157ae682-6433eaf2c0emr41387717b3.31.1719232276490; Mon, 24 Jun 2024
 05:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-rb2-fixes-v1-0-8d763ee4e42e@linaro.org>
 <20240624-b4-rb2-fixes-v1-3-8d763ee4e42e@linaro.org> <8411fee8-7e09-421a-a52b-487acd3a3e24@linaro.org>
In-Reply-To: <8411fee8-7e09-421a-a52b-487acd3a3e24@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 15:31:04 +0300
Message-ID: <CAA8EJpoifd-Z175ZX6f6Pw+bQHY4F-rX05YoqJNr810_1KLm9Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: prefer host mode on dev boards
To: neil.armstrong@linaro.org
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 15:28, <neil.armstrong@linaro.org> wrote:
>
> On 24/06/2024 14:23, Caleb Connolly wrote:
> > Generally, when given the choice these boards should prefer host mode
> > since they're SBCs. When attached to a laptop (which is host-only) they
> > should still fall back to peripheral mode.
>
> It's really not what I observed on sm8550/sm8650 QRD/HDK, as the power
> is setup for peripheral by the bootloader and without an actual UCSI/PD
> negociation it would only be functionnal as peripheral mode.
>
> So this is definitely untrue on sm8450/sm8550/sm8650 HDK/QRD/MTP.

But we now have the UCSI support for those platforms, don't we?

>
> Neil
>
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
> >   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts     | 4 ++++
> >   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts     | 4 ++++
> >   arch/arm64/boot/dts/qcom/sm8150-hdk.dts      | 1 +
> >   arch/arm64/boot/dts/qcom/sm8350-hdk.dts      | 4 ++++
> >   arch/arm64/boot/dts/qcom/sm8450-hdk.dts      | 1 +
> >   arch/arm64/boot/dts/qcom/sm8550-hdk.dts      | 4 ++++
> >   arch/arm64/boot/dts/qcom/sm8550-mtp.dts      | 4 ++++
> >   arch/arm64/boot/dts/qcom/sm8550-qrd.dts      | 4 ++++
> >   arch/arm64/boot/dts/qcom/sm8650-hdk.dts      | 4 ++++
> >   arch/arm64/boot/dts/qcom/sm8650-mtp.dts      | 4 ++++
> >   arch/arm64/boot/dts/qcom/sm8650-qrd.dts      | 4 ++++
> >   12 files changed, 39 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > index c4cde4328e3d..bac4ed5874b6 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > @@ -657,8 +657,9 @@ &usb_1 {
> >
> >   &usb_1_dwc3 {
> >       dr_mode = "otg";
> >       usb-role-switch;
> > +     role-switch-default-mode = "host";
> >   };
> >
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > index e19790464a11..bece4896ca23 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > @@ -593,8 +593,12 @@ &uart4 {
> >   &usb {
> >       status = "okay";
> >   };
> >
> > +&usb_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_dwc3_hs {
> >       remote-endpoint = <&pm4125_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > index 1c7de7f2db79..17d36f0ef5ab 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -661,8 +661,12 @@ &uart4 {
> >   &usb {
> >       status = "okay";
> >   };
> >
> > +&usb_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_dwc3_hs {
> >       remote-endpoint = <&pmi632_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> > index bac08f00b303..fe548d795490 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> > @@ -695,8 +695,9 @@ &usb_2 {
> >
> >   &usb_1_dwc3 {
> >       dr_mode = "otg";
> >       usb-role-switch;
> > +     role-switch-default-mode = "host";
> >   };
> >
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pm8150b_hs_in>;
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index e031ad4c19f4..20d5c54cfcf9 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -847,8 +847,12 @@ &ufs_mem_phy {
> >   &usb_1 {
> >       status = "okay";
> >   };
> >
> > +&usb_1_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> > index a754b8fe9167..ebafcbe6859e 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> > @@ -1098,8 +1098,9 @@ &usb_1 {
> >
> >   &usb_1_dwc3 {
> >       dr_mode = "otg";
> >       usb-role-switch;
> > +     role-switch-default-mode = "host";
> >   };
> >
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > index e0dc03a97771..1efda478b7b9 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > @@ -1252,8 +1252,12 @@ &ufs_mem_phy {
> >   &usb_1 {
> >       status = "okay";
> >   };
> >
> > +&usb_1_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> > index 26dfca0c3e05..7b05932f9c36 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> > @@ -945,8 +945,12 @@ &ufs_mem_phy {
> >   &usb_1 {
> >       status = "okay";
> >   };
> >
> > +&usb_1_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> > index 361b0792db4f..744bdc846e70 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> > @@ -1211,8 +1211,12 @@ &ufs_mem_phy {
> >   &usb_1 {
> >       status = "okay";
> >   };
> >
> > +&usb_1_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > index 092b78fd8a3b..f07a56583e7d 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > @@ -1300,8 +1300,12 @@ &ufs_mem_phy {
> >   &usb_1 {
> >       status = "okay";
> >   };
> >
> > +&usb_1_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > index d6f91580ba8d..1a9a31423af4 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > @@ -839,8 +839,12 @@ &ufs_mem_phy {
> >   &usb_1 {
> >       status = "okay";
> >   };
> >
> > +&usb_1_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > index bd60c2770da2..031b7ada8eb1 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > @@ -1285,8 +1285,12 @@ &ufs_mem_phy {
> >   &usb_1 {
> >       status = "okay";
> >   };
> >
> > +&usb_1_dwc3 {
> > +     role-switch-default-mode = "host";
> > +};
> > +
> >   &usb_1_dwc3_hs {
> >       remote-endpoint = <&pmic_glink_hs_in>;
> >   };
> >
> >
>


-- 
With best wishes
Dmitry

