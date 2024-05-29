Return-Path: <linux-arm-msm+bounces-20961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 284BC8D3A91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 17:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C0D61F21B5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 15:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AA417F396;
	Wed, 29 May 2024 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKebw4MF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA517DE0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995939; cv=none; b=bAe/bEyM7TivQCE0/vbKE/FSkb48jjJNSD/3FltnW3iT7kMW44RZrh/l5lyEKbs3qZt25/9U7RNyHy7h+x0G6gb7DplTJWrXaKKiwTVX7FP/tOmgrC5wj4sL3hntw4FCtKHefE54DcMDx6LdgQL8FHczgT+k2CA+eDlBNiSLD/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995939; c=relaxed/simple;
	bh=9VXHCZS9cqUCoC5ewb27XhCR2osQeQAKC4wReWyepDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG+YxFWB66T6O4K6fgxkVkpu24rD8gIG1fY6jf0/1mJxPO51c03ugquXLUqQ/2G3b3/c/j9l7FD20MgwFxuvpzoSNKmo6U1HtoafjhhO7mJw0zalKC6sL1oeC+RcRCTiPjTTnFHTlsYi7mhmSWU4ePD/NanVBekiKOX7nYLGnRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKebw4MF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e96f298fbdso21482971fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 08:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716995935; x=1717600735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QR0POjqF20pzHAWBvG1eRnT0PhhhCZ/L07fIsqZvh5c=;
        b=WKebw4MFbdaXhkZ02HFRRAPHQ/Zj68VVNQsnsx8bL3tV0+xXP0Z4pAXQjVtfw9RCON
         glYT3BlRqbiCcTqQDKv1brE6LgIZz/HN/oZGnlTAVrx71Hjf38IGmNOffINcPzVgpC0Q
         TCQrwcZ7GRG3IiqI3eiQ+zeVnNLvlMOTUfD31sGHsD7MttFQjOV9vMDNcimdAfYYp2je
         u+ClmS0Fr9tR0PnmyM9uZtU75KQ7APjgZ3cAdoKa4NYE7Kvi7mCpTiKJKlCooxhe8MOz
         zexAe+cjtPCrjP4u1w62Y1qvbwniRlKifkURi7Z6Nwx1L0iI5tMGrIw3QkDxOi6e0vjS
         4oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995935; x=1717600735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR0POjqF20pzHAWBvG1eRnT0PhhhCZ/L07fIsqZvh5c=;
        b=QsR0PEadp/34zhPmlUGXfLLKtWgM56+/aoEWAIxv1aCf6XHjm/V6ZhyYwuVb3fddat
         G54/4zuWzftFdSbnhS5oXsvoNaCzK+W1hOinhQ//djanedL/7OVyGDJvNFF3UILjMxle
         jqEaOGcSmsnc02z6YmS4DLsz3FIJClKqAqseZljda8ij3OBuDFEPXG+ZsHX9gEOQiAN4
         vdQYdZTxm7sGztDt7D4DawnPx1ceDQWpmyMbTP3Dd5CPTj+5N7Mfsndes1HE/HKVHzw3
         utZ68LIw+jwAZUcMEQKdDatbeczY1YwFZwZPi6H3Am/P/M3I9kH0N0+urC5GQ6l5edPl
         Pb2g==
X-Forwarded-Encrypted: i=1; AJvYcCXwgS/k+B+gDJlrXE+Rw983f6WQ/dcRrd8ETc1UzzWS/HIw6SKUvIouVF7GbiwXoPMhKsemfRF5CRqz1Tq50qjtLnhlVQ/qb00qPKinKQ==
X-Gm-Message-State: AOJu0YzYvYXVdY8AD/ZWRItE7dRpF7GA2A+Ge9zd610E9r/YiGtAwRku
	tkAlnxizJEuW83ozZFa55N9c+4K2cvJwyy3DT+i8bJxK929fzXDy+ugmVF7BjS0=
X-Google-Smtp-Source: AGHT+IGt8PT5CAFahkrxvC3bec9sEni1+YGaWaqI0Puf/7L2iygCtbpF68kQbbhUhDxRBWHWD62qVQ==
X-Received: by 2002:a05:651c:1055:b0:2e9:8386:5f88 with SMTP id 38308e7fff4ca-2e983866e92mr37859321fa.41.1716995935469;
        Wed, 29 May 2024 08:18:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd21f6sm25824491fa.88.2024.05.29.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 08:18:55 -0700 (PDT)
Date: Wed, 29 May 2024 18:18:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com, 
	Qiang Yu <quic_qianyu@quicinc.com>, Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
Message-ID: <s5gt3p6zsd5ebrkop4dhd33tykln33f6ahu3pibymecxsmakyd@lg5wfgec6dat>
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-5-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529100926.3166325-5-quic_tengfan@quicinc.com>

On Wed, May 29, 2024 at 06:09:26PM +0800, Tengfei Fan wrote:
> Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
> I2C functions support.
> Here is a diagram of AIM300 AIoT Carrie Board and SoM
>  +--------------------------------------------------+
>  |             AIM300 AIOT Carrier Board            |
>  |                                                  |
>  |           +-----------------+                    |
>  |power----->| Fixed regulator |---------+          |
>  |           +-----------------+         |          |
>  |                                       |          |
>  |                                       v VPH_PWR  |
>  | +----------------------------------------------+ |
>  | |                          AIM300 SOM |        | |
>  | |                                     |VPH_PWR | |
>  | |                                     v        | |
>  | |   +-------+       +--------+     +------+    | |
>  | |   | UFS   |       | QCS8550|     |PMIC  |    | |
>  | |   +-------+       +--------+     +------+    | |
>  | |                                              | |
>  | +----------------------------------------------+ |
>  |                                                  |
>  |                    +----+          +------+      |
>  |                    |USB |          | UART |      |
>  |                    +----+          +------+      |
>  +--------------------------------------------------+
> 
> Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++++++
>  2 files changed, 323 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts

[trimmed]

> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs8550/adsp.mbn",
> +			"qcom/qcs8550/adsp_dtbs.elf";

Please excuse me, I think I missed those on the previous run.

adsp_dtb.mbn

> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs8550/cdsp.mbn",
> +			"qcom/qcs8550/cdsp_dtbs.elf";

cdsp_dtb.mbn

> +	status = "okay";
> +};
> +
> +&swr1 {
> +	status = "okay";
> +};
> +
> +&swr2 {
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <32 8>;
> +
> +	dsi_active: dsi-active-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};

s/dsi/panel[-_]reset/

> +
> +	dsi_suspend: dsi-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	te_active: te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	te_suspend: te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

What is the difference between these two?

> +};

-- 
With best wishes
Dmitry

