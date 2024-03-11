Return-Path: <linux-arm-msm+bounces-13816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128E6877FC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 13:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C23F72815AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 12:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5413CF6A;
	Mon, 11 Mar 2024 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D41e5qru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB43B79F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159307; cv=none; b=fCaFmYR2NopeaF6EASyM4SdHJQ22N9Iudz3W5aPoqG6ooQY9yAnDz8NvWOSSSYCBitNOF+m9RzRLurUIiFgQx7aNgTjhOfq2eDfkaYwgMyBJHQNQtoCzzel8wFn/M2Yi28xavlS7iveonUpBiof3LvklJcT7rX288fsa+r6JN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159307; c=relaxed/simple;
	bh=GO3ULI7mQTnxS7jSG4txYsGJozwzQMjf/RmiaZbYSNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a92N1lUZcrBJBXzTB6TETjDTZE1oVdxGibLUd0y8effexkDM09ggSbTQsOPeREtVeFJh7yj+n2e7Px1oZIiQUW3FEMrkCwj7Am+2VzdjJMolIXOdX8I/dWYBbBym2IBNu5/ZuHK+tVik7joq+S33AK/XMMy6ND5Bvc8gtkvjOGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D41e5qru; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60a0a54869bso19325707b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710159304; x=1710764104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ztprHDXJluvRreDSSFUYa4qqYh/2UMDCZbLeEgV3a7g=;
        b=D41e5qruE08HfVMPlt3NvNBCAI3C0+CaXCXDTQdowHGUgFzon6kwWudOlzQow9PFWL
         VZn7QkXPZ0sSoNc6CfD0dUdARWDKIf5pDN1hRh0URNJF9P2tAb+2dK8RrZoAbtyYx+f9
         uVq/63x9VLve38VnaGkHqqs5antV+9T231c4v7Ehxnd8DCHzqRh3C8icCCUlLxJAzo5x
         oPoI+EK8X1Wtav+ygWN04JfIyfiTLcILy253q8ZJzib/D6Pf4EJlhdHmOPSJLwS9MOGv
         lUvXNVLjA+FlWZ0lokvky63N/dn+h9nGUawjRLGxufBtLiACJ7wJOGadbNz5Kq6ycODa
         3MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710159304; x=1710764104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztprHDXJluvRreDSSFUYa4qqYh/2UMDCZbLeEgV3a7g=;
        b=UJKLQ0iSV9ywhXvzWeN65GukA5swB56iggffJAkk+GSCGlZNzEwGTTiO6EaUq9TA52
         oOMrZUDOWYg+TzMnx3jbtqUS+tm7S2jydzkc4dn53nilJrXF4B/NasQ3n/gzhPD5az7l
         J6grCrLIYkKKL+Ll64WYnjXjuE4G83Wt7lw0N7HwjOirOPri294B3j0mfCVWQngyzXji
         FeizAUW0O1TuK1EfZfePRwzZdnqkLSr9sfL4YHgBIwBi16rm5gRkDZ2VLMIGkauZGxov
         T0fftMWZJQ+TCBiuw+U52WEF0fP989xsyWtxWXmdLN+qto3MiX8lO9+wvoxOunc6A7Ez
         kGNg==
X-Forwarded-Encrypted: i=1; AJvYcCUBvmqMhGFnD0yREv2AlMYaIXezG433vdKOLQCkUFA/AjyXvIwr22bbB9gh17qyXrqDyxfTG1TMn6hN+W/dlvQ/Dba9OdpVL/FWIlvDZg==
X-Gm-Message-State: AOJu0YxNN4TkEblKeXu7v8YDCpxpLgBSIhbJMXe8qlbtdMLVYRaw85BD
	9S9DbP7j5tKUve0IImM8f7sC1tu9j0peR/yoaFeJ4D9FCAyb2jvHmazq8tHoCYFgsx6xreWsJXP
	lcMPwMV6/19Y+VvCv2DxqqsfsVVUaB8rmAJh1ZA==
X-Google-Smtp-Source: AGHT+IHynY17WGsLOoumjxLnrUnR73bC37OcgOsdC+TFcMmdjQ0BKIKC6gkzEtM9/PBYdXA556baFQ8iNcTay77a0Sg=
X-Received: by 2002:a0d:f247:0:b0:609:ddf0:9545 with SMTP id
 b68-20020a0df247000000b00609ddf09545mr3723247ywf.22.1710159303730; Mon, 11
 Mar 2024 05:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311120859.18489-1-quic_kbajaj@quicinc.com> <20240311120859.18489-3-quic_kbajaj@quicinc.com>
In-Reply-To: <20240311120859.18489-3-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 14:14:52 +0200
Message-ID: <CAA8EJpqMWBWAEUCiJXm0x7zjZYbP8SkRDgu+w+goYjB=8JBN0A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qdu1000-idp: enable USB nodes
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Amrit Anand <quic_amrianan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 14:10, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Enable both USB controllers and associated hsphy and qmp phy nodes
> on QDU1000 IDP.
>
> Co-developed-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index 89b84fb0f70a..126bc71afd90 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -500,3 +500,27 @@ &tlmm {
>  &uart7 {
>         status = "okay";
>  };
> +
> +&usb_1 {
> +       status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +       dr_mode = "peripheral";

Are these ports really peripheral-only?

> +       maximum-speed = "high-speed";
> +};
> +
> +&usb_1_hsphy {
> +       vdda-pll-supply = <&vreg_l8a_0p91>;
> +       vdda18-supply = <&vreg_l14a_1p8>;
> +       vdda33-supply = <&vreg_l2a_2p3>;
> +
> +       status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +       vdda-phy-supply = <&vreg_l8a_0p91>;
> +       vdda-pll-supply = <&vreg_l3a_1p2>;
> +
> +       status = "okay";
> +};
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry

