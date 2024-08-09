Return-Path: <linux-arm-msm+bounces-28227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21494CCEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 11:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85152828FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 09:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B25518F2F2;
	Fri,  9 Aug 2024 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6H7IMr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DCBA41
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723194482; cv=none; b=Kgu1vldffWArfmh6jzT0NCwyZgp74opyyMNu/6KNrO1UwaDjhj4DeQ0771AuSse5gT/frMweXT5rE7AEyL/FrDceg4DmwZbOTfS5xYQAaIAjHg5U0sARER6puh4Y37pRxHQuwR7H2DhmI100wUxBBVvF7o02qZ+1ljCiJKLpQ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723194482; c=relaxed/simple;
	bh=xIqKlPFTBOJ+6voM4SrfjSL0L9WwiYk4J/CQwLdYuIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTWvD4RUo+Q8pKNOB29GvMqUCaj0FCtZuwKJaonVrDo+YPdQWAXzRMV9R+2IpCQYlKIDheDLiirijtIeG0iRZvx6kSkx9wk/NV3qNtSmiuXiUNHjANcwf/CC9N0xCdw7CTSSNaZ99OzoiB4YWfTlJ7FLeCo+aS103hEBWKpQxu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6H7IMr/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a94478a4eso474404366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723194479; x=1723799279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B7RTNFF0UhhRSGM9SKE+tATW/EB8i2VcQtdYWBx4S0Y=;
        b=L6H7IMr/z4a3LgmHLmRSn5Ss8ObViO7bYJqmFwENJYtuIJCRwOMqFCEnzBBuZmGMPH
         yMD9/ym8w/7/ob85FPE8yc+FzehnTHb10bZ9U+qMhduwvO+v8pwdELLwSMjVIBUvfHAp
         TddU0PtdcMCGitU7QSrqRsYSCycLWVBH7kxo5LwIyQRqVIsWhsaOT8b26zPTu11/1bxG
         OF+8KRnZAiYQrLJweCyDTcdDS1tLTrKPI7iVLsJhbWsTGIqVf9o6G8UGyntER38NpcfR
         OtdxSvECq6JzWp1wmM6SN7d8aswAuSI/aPStoLjWEKgLM6aVfg2Xq0eaQ5x4oO0CQLDM
         xn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723194479; x=1723799279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7RTNFF0UhhRSGM9SKE+tATW/EB8i2VcQtdYWBx4S0Y=;
        b=GDLmYMofoJMz87WbAseyLCObmtskqy2EgMN5FegLTLIUs1XOxDlGONunMG0Bp2F59x
         0tTUZB3FF77YxKZgfGSyjK8kRGrTFA5qA/EbZxsA/1WTYQfOGI14AaZPUat8MwL6hscV
         2wL7KBckp/lzSKv3p4/gTbEGzZsNYurkzCtwq9F90OMdWCPuBOiKQASPMeWwhkjustoc
         PJlIxsOohNOgGeMTSXcVj+fjVyXzQiYbv3dQoYVQtIpCInW2je65v/fpNgRYDwNn0AXD
         5TNE4yfbifp6q1xpEryTLwTaG6Xh7oE9TUTaNSeeRCESylY8geU+yOiV9aNEHpfWMbcr
         LSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHAqFLzXqdIyekgAkJ7MPMVFRx19bTOL+k6Lqb6G9iJp4s4bAvRfs+JEPIr81ENuoKikVPIKjPyBKMdcEWn4ntVH5g2bwU01ZjA5o5CA==
X-Gm-Message-State: AOJu0Yy9lt5Q5DCf9vp0cSY7Vlq5fXzzUdUvFi3BsDLbNLBx8r/Um66o
	WOU03J5dlBU8RtctjcHpxruewIMcdaCWSjJL0CDJz+qIOe/+IMSZAOksDJ6IYFs=
X-Google-Smtp-Source: AGHT+IGvhsQpUPKxCm1iJvnax5p0Tv9cMnpIDD0F666gPAGCWco4tbsfdWHtGRtszjZDAr/Ui59qDQ==
X-Received: by 2002:a17:906:6a1f:b0:a7a:130e:fb6e with SMTP id a640c23a62f3a-a8091f1bdf7mr387496766b.15.1723194478853;
        Fri, 09 Aug 2024 02:07:58 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:8395:bc08:2fce:1f21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d437a5sm818414866b.101.2024.08.09.02.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 02:07:58 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:07:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add support for X1-based Surface
 Laptop 7 devices
Message-ID: <ZrXcbHWXPvVj-lQd@linaro.org>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
 <20240809-topic-sl7-v1-4-2090433d8dfc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-topic-sl7-v1-4-2090433d8dfc@quicinc.com>

On Fri, Aug 09, 2024 at 03:43:23AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> Add support for Surface Laptop 7 machines, based on X1E80100.
> 
> The feature status is mostly on par with other X Elite machines,
> notably lacking:
> 
> - USB-A and probably USB-over-Surface-connector
> - SD card reader (Realtek RTS5261 connected over PCIe)
> - Touchscreen and touchpad support (hid-over-SPI [1])
> - Keyboard support (low-hanging fruit, works with pending Surface EC
>   changes)
> - Audio (a quick look suggests the setup is very close to the one in
>   X1E CRD)
> 
> The two Surface Laptop 7 SKUs (13.8" and 15") only have very minor
> differences, amounting close to none on the software side. Even the
> MBN firmware files and ACPI tables are shared between the two machines.
> 
> With that in mind, support is added for both, although only the larger
> one was physically tested. Display differences will be taken care of
> through fused-in EDID and other matters should be solved within the
> EC and boot firmware.
> 
> [1] https://www.microsoft.com/en-us/download/details.aspx?id=103325
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 818 +++++++++++++++++++++
>  .../boot/dts/qcom/x1e80100-microsoft-romulus13.dts |  13 +
>  .../boot/dts/qcom/x1e80100-microsoft-romulus15.dts |  13 +
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |   8 +
>  5 files changed, 854 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e534442620a1..820b768cdb71 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -270,4 +270,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> new file mode 100644
> index 000000000000..3f6d4b93db50
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -0,0 +1,818 @@
> [...]
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 5000000>;
> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +		/* TODO: power-supply? */

There seems to be something at <&pmc8380_3_gpios 10>, any idea what?

> [...]
> +&pmk8550_gpios {
> +	edp_bl_pwm: edp-bl-pwm-state {
> +		pins = "gpio5";
> +		function = "func3";

Can you add the power-source here to make this more complete?

> +	};
> +
> [...]
> +
> +&uart2 {
> +	status = "okay";
> +};

Any idea what this UART is used for?

> [...]
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index a5ca0fa4e5ae..5b54ee79f048 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -249,6 +249,14 @@ pmk8550_gpios: gpio@8800 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		pmk8550_pwm: pwm {
> +			compatible = "qcom,pmk8550-pwm";
> +
> +			#pwm-cells = <2>;
> +
> +			status = "disabled";
> +		};

I don't mind personally but usually we would have this non-device
addition in a separate patch. :-)

Thanks,
Stephan

