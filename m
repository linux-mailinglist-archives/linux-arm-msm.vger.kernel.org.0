Return-Path: <linux-arm-msm+bounces-15484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2571B88F4E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 02:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAC0FB2348D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 01:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6982C210EC;
	Thu, 28 Mar 2024 01:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D4GNVCUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D7F1804A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 01:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711590728; cv=none; b=khbjL9ded8OgTeXLBdxCLmBMZXtVfCNNvbWTyFIPPIu4LVkig1+b+AHknp40VGutGEoGysHDkIy/Z9JvEqOEcUVv0TIbec6cMDXdTPISl3hj30y8940YSSr0aejnHBzNUOlpcS2B5/XIPpRv/BXdj0+VtzVGIiwBkf7p7HwY4L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711590728; c=relaxed/simple;
	bh=mkM6R0KgpBbz4KudbiA6fw95cLUuvRuwLR/2IvSvuQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgCsyVjqZqEXp5ZL+u/yuNf9CfQxSNx7TNFFNXwR3lqlKeYYqVUD4nO9juCdG8AOcDe0b/x8tgFeoaTJxZP7f40C4/xJJQm04rk6+6FjzN/q79D/EIhBuLmPX0NuYKgQU1iDdOb5RBLI0ANUdN9lDI2onhKyQDygtRMsei1igWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D4GNVCUX; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61130dd21c1so5249967b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711590725; x=1712195525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xeRupraePyxNUCGKwkTwjgmBsjpIgZkoxz4iGu5JFgM=;
        b=D4GNVCUXFpdKjKpZy4B4yr8vhONdvnIwjwp34MmdMERiVmsLzVW3kPf2NudIFy2BR+
         UJ/yK0TsAFi2HUP8/puMsIEbzcrglnwrpDD1Kzg5sqwROPppvCjdm1Buw9MnfCK2JrhK
         zPYdWB6GZjXx4ZfXn6KmoCRrAei2VActP8/S9zEVnthJSBj0xXRuTLA3vL3Z6l6Wq2Mj
         stx5sdnH3F1rnExa8Bub81vBYPd1JKW8NFjWc7ih6snNSJCY1iHfowqRWFJu2wPmdtU5
         IaNqDFSf+odUP/xp4jlncO4JdWzNZJC9UZb+BZaqykyi52jF7GPz2n8s7b4Eo+s20Tfz
         So1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711590725; x=1712195525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeRupraePyxNUCGKwkTwjgmBsjpIgZkoxz4iGu5JFgM=;
        b=e6ROSRtQaf3nhfYyp4kW+Z9yUhFLaGPfGz3ehqrSya7naca1EgAZtZI0wikzk9wky2
         nt/f/Pxq54HXhVgCqeyzFD8xlHiIF8xbVIY4GBVBwvDhBbjll+g5uPmMz0PXNTTTLnsM
         0tNbe7TMiJrOUhMkHvgiixr9kVkHUZCy/V/ejHTgCdku2KG5MCwfljUR2VwtKkSJlWYg
         WnkDaxuWkWxIbhW1xBfu6SRTMb+hwoL/1tF1PW+AQ93q8YKfFcB7DeZBFPuVwRfk4q0c
         xayu6eZPDyaK4MyJ8gcx2MKYwWYcJks8K5y6aTn3ol7++5s6F9RYEh9V+covX+0s9oqr
         IGuw==
X-Forwarded-Encrypted: i=1; AJvYcCW884iRY3d5JE26ZBOAmknKmiVJYyrc7VztTiBUujG0aHLVq8bjoHS5+DY5yAiOXW3rYnkfoGqBUPvw5EKuo789u2AXXGmWMcgABRC6sA==
X-Gm-Message-State: AOJu0YwUDnM/BqUWAd0diknHGTrvO59muldaPD4Yz6Nv3Ff4Cgn4uvLL
	QmUgzQLO5ldhAC5VXg60W0nBXFgT2Iunq0pO3EKyhyt96ooTqnfSkY9d8yM81EKgCjQYAefzTbT
	Qh7PpiTp8WHwQnZvWrmpgxrBeYRhmE6T3hWFwyg==
X-Google-Smtp-Source: AGHT+IHT/ujAoEbhu8rLTehIuWRBp/B6kdAP54AQCRbG7T5Aw1Z01ibd0Fm1N0Q2G2mnLCjO54IRJqd2ObldP8kjPj4=
X-Received: by 2002:a25:29c4:0:b0:dd1:2f58:292b with SMTP id
 p187-20020a2529c4000000b00dd12f58292bmr1517178ybp.9.1711590725160; Wed, 27
 Mar 2024 18:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-rb3gen2-dp-connector-v2-0-a9f1bc32ecaf@quicinc.com> <20240326-rb3gen2-dp-connector-v2-2-a9f1bc32ecaf@quicinc.com>
In-Reply-To: <20240326-rb3gen2-dp-connector-v2-2-a9f1bc32ecaf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 03:51:54 +0200
Message-ID: <CAA8EJpoe7A94608V1GdQ-oU9UXagHPm0mVBUe4Yxi=HF2pMd7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: qcs6490-rb3gen2: Add DP output
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 04:04, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The RB3Gen2 board comes with a mini DP connector, describe this, enable
> MDSS, DP controller and the PHY that drives this.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 63ebe0774f1d..f90bf3518e98 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -39,6 +39,20 @@ chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       dp-connector {
> +               compatible = "dp-connector";
> +               label = "DP";
> +               type = "mini";
> +
> +               hpd-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;

Is it the standard hpd gpio? If so, is there any reason for using it
through dp-connector rather than as a native HPD signal?

> +
> +               port {
> +                       dp_connector_in: endpoint {
> +                               remote-endpoint = <&mdss_edp_out>;
> +                       };
> +               };
> +       };
> +
>         reserved-memory {
>                 xbl_mem: xbl@80700000 {
>                         reg = <0x0 0x80700000 0x0 0x100000>;
> @@ -471,6 +485,25 @@ &gcc {
>                            <GCC_WPSS_RSCP_CLK>;
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_edp {
> +       status = "okay";
> +};
> +
> +&mdss_edp_out {
> +       data-lanes = <0 1 2 3>;
> +       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +
> +       remote-endpoint = <&dp_connector_in>;
> +};
> +
> +&mdss_edp_phy {
> +       status = "okay";
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
> @@ -511,3 +544,10 @@ &usb_1_qmpphy {
>  &wifi {
>         memory-region = <&wlan_fw_mem>;
>  };
> +
> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> +
> +&edp_hot_plug_det {
> +       function = "gpio";
> +       bias-disable;
> +};
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

