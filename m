Return-Path: <linux-arm-msm+bounces-43663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8C9FE7B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA494160E67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDEC1AAA1D;
	Mon, 30 Dec 2024 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cnFoWxtK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BDD1A9B55
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735573230; cv=none; b=aERS9NrO5isDuSkxZWjBObaRZmIavHltdM/hOPF/TLIqqNSOoRHJ9WaX1B4kPudVP9d83ESsZoaHaJbzVDJp5M3nu4mUZ0WgNvXio/3qaeHe6VDzEcQOgiAC7D/GwbTs90WAzNpDSryMchpeZrzXtgoO8FKoVfTe5tXDRN/B3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735573230; c=relaxed/simple;
	bh=nayYYP1By29yNkwAI1pZyVdajz2RfMP0eDuhac/GLds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1ZmDxV6F/F4UqiXyYPx2LRtgbvZQmv4ojZwGs1wtJ8GKf4EgrysCdKrxWBXEu+Zv2SQNzMlDtGpVes/r9b7k6EW627XNh7al7wIK4dtXu/TcCLP28/OuRKhRlNRm8X3lFfBPlo7uNw+kaVbENK/ERvytufdv9je74GMZ7qxDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cnFoWxtK; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30229d5b229so99316891fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735573226; x=1736178026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=26qMH+5rkTrY7u7DfslpeBwBLGqdW1qgd9R5Aer4O1U=;
        b=cnFoWxtKZrcuuTzeW3mrbjbTVA11JVvMxUVyPgY/eUN5kYKQ5Spi1JiMS1Gz16heHu
         oaam7r9v27IpxSOGjpGyNaqY/HlZSZdgZTqoU8K05tMp8rOcJeWpeSmXrKlLyKUpJEV6
         4cGZJQa9F0XZ4uf1sGMKtgDH68n3Oib7d3giqO3TY93j4ov1kLGJMKKMQgoe6vqYOybt
         6k+Mx09NumDVTgezmtIvMH9Y5C6Wx8E7O/UtB6pDYUqzjL/WT/APlftIEXGzXmd+B03H
         wGWK5tEBLDHHrR4dUNHU78Eu+E9QFlfQMvQTEv0g/Y2fIel2zJ8vBCYX9nZptVKVbKyE
         EdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735573226; x=1736178026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26qMH+5rkTrY7u7DfslpeBwBLGqdW1qgd9R5Aer4O1U=;
        b=UHZ9TNAxvkwr1KBTXQkyHH3YOzrMmzLtR12ubF41zcevDrOZMA8qbshsk0+XyPR0Vf
         ZYsOpF3BT90IClGNPgLM8DTCC0GCowEsxK7Y11a7aA9B3rvYxPnr3PixsA6S4AkJUTHh
         +twBX37nSthvuovDVg2nkdg9iwpnVduY3oLRNOA8mNzm+M7z3VL4KXbCdyYTJ2/gpFpO
         bqX0CYvbZ5mkCAmvuaarTm51i/SJODnphyyvvTNoJHxXVgc2acigx6tTEclpCVWNj8Ky
         xLGyYOrEkR3RSIzOQomfqIn3OP2xO3YZ5ua9JyJ3VVjuhOdDDVfq2g20xcLvmZ63TOqr
         CkMw==
X-Forwarded-Encrypted: i=1; AJvYcCWzByGR8FsSvjtwAnGUq5XVzZmzAEplDSFtTLKu3Te4YqBP9GsnBAJ2sx+5IAkFdHswBqlJw4ed+A3lynV5@vger.kernel.org
X-Gm-Message-State: AOJu0YxFG61b5PGsAWsZynp75AvSscY1w7MoDj/AjtKLsazE1HgnkRSO
	yx0VbpSM2loVeImacMvMj730e+T+dDD6BRzq4LHwWeUW3lngKEL/y3n09dgAOh8=
X-Gm-Gg: ASbGnctLR5EiCGlZB7iUWMGSA/8WEd9IuGTPUCKgCHBo/kkoebJDXSoY3AQVY/OeyTI
	S6Gx4hkVDgxLBYNKrmDljurJM4Mf8ytbLPmDhz6C0B6Ar+tHKHJFhflQEhwhPlFvQqV8xEN4FeQ
	a4vSROE58yV0+c0U+V2SS5WJ+xYBsP4IY0Cwx280TH16E2FOqlHA7yxpQ9lwfuKkGuIEfzXnv+x
	fAzJiJybdX0g+IGW5igdS7kgq+sFgN2M2GeoHyx76KLtYI53BTXqmg/lhJS6Tzrlet1uamHtbfe
	RqCgBV2EtVUfFqCZu+L5jZvEOsa/voZccrAW
X-Google-Smtp-Source: AGHT+IEZ2AleHCNRaGyu54MVHn9krzsSUyp1V8199qrdJRPfOzBAClJbSFlHgYesIFnnxgkfRewZsg==
X-Received: by 2002:a05:651c:2115:b0:302:2598:de91 with SMTP id 38308e7fff4ca-304685484a2mr122093701fa.16.1735573226185;
        Mon, 30 Dec 2024 07:40:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30460542c0asm33717771fa.5.2024.12.30.07.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 07:40:24 -0800 (PST)
Date: Mon, 30 Dec 2024 17:40:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
Message-ID: <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229152332.3068172-7-quic_wasimn@quicinc.com>

On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> 
> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
> does corrective action for each subsystem based on sensor violation
> to comply safety standards. But as QCS9075 is non-safe SoC it
> requires conventional thermal mitigation to control thermal for
> different subsystems.
> 
> The cpu frequency throttling for different cpu tsens is enabled in
> hardware as first defense for cpu thermal control. But QCS9075 SoC
> has higher ambient specification. During high ambient condition, even
> lowest frequency with multi cores can slowly build heat over the time
> and it can lead to thermal run-away situations. This patch restrict
> cpu cores during this scenario helps further thermal control and
> avoids thermal critical violation.
> 
> Add cpu idle injection cooling bindings for cpu tsens thermal zones
> as a mitigation for cpu subsystem prior to thermal shutdown.
> 
> Add cpu frequency cooling devices that will be used by userspace
> thermal governor to mitigate skin thermal management.

Does anything prevent us from having this config as a part of the basic
sa8775p.dtsi setup? If HW is present in the base version but it is not
accessible for whatever reason, please move it the base device config
and use status "disabled" or "reserved" to the respective board files.

> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
>  4 files changed, 290 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> index ecaa383b6508..3ab6deeaacf1 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> @@ -9,6 +9,7 @@
> 
>  #include "sa8775p.dtsi"
>  #include "sa8775p-pmics.dtsi"
> +#include "qcs9075-thermal.dtsi"
> 
>  / {
>  	model = "Qualcomm Technologies, Inc. Robotics RB8";
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> index d9a8956d3a76..5f2d9f416617 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
> 
>  #include "sa8775p-ride.dtsi"
> +#include "qcs9075-thermal.dtsi"
> 
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> index 3b524359a72d..10ce48e7ba2f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
> 
>  #include "sa8775p-ride.dtsi"
> +#include "qcs9075-thermal.dtsi"
> 
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> new file mode 100644
> index 000000000000..40544c8582c4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/thermal/thermal.h>
> +
> +&cpu0 {
> +	#cooling-cells = <2>;
> +};
> +
> +&cpu1 {
> +	#cooling-cells = <2>;
> +	cpu1_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <800000>;
> +		exit-latency-us = <10000>;
> +	};
> +};
> +
> +&cpu2 {
> +	#cooling-cells = <2>;
> +	cpu2_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <800000>;
> +		exit-latency-us = <10000>;
> +	};
> +};
> +
> +&cpu3 {
> +	#cooling-cells = <2>;
> +	cpu3_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <800000>;
> +		exit-latency-us = <10000>;
> +	};
> +};
> +
> +&cpu4 {
> +	#cooling-cells = <2>;
> +	cpu4_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <800000>;
> +		exit-latency-us = <10000>;
> +	};
> +};
> +
> +&cpu5 {
> +	#cooling-cells = <2>;
> +	cpu5_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <800000>;
> +		exit-latency-us = <10000>;
> +	};
> +};
> +
> +&cpu6 {
> +	#cooling-cells = <2>;
> +	cpu6_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <800000>;
> +		exit-latency-us = <10000>;
> +	};
> +};
> +
> +&cpu7 {
> +	#cooling-cells = <2>;
> +	cpu7_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <800000>;
> +		exit-latency-us = <10000>;
> +	};
> +};
> +
> +/ {
> +	thermal-zones {
> +		cpu-0-1-0-thermal {
> +			trips {
> +				cpu_0_1_0_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_0_1_0_passive>;
> +					cooling-device = <&cpu1_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-0-2-0-thermal {
> +			trips {
> +				cpu_0_2_0_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_0_2_0_passive>;
> +					cooling-device = <&cpu2_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-0-3-0-thermal {
> +			trips {
> +				cpu_0_3_0_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_0_3_0_passive>;
> +					cooling-device = <&cpu3_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-0-1-1-thermal {
> +			trips {
> +				cpu_0_1_1_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_0_1_1_passive>;
> +					cooling-device = <&cpu1_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-0-2-1-thermal {
> +			trips {
> +				cpu_0_2_1_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_0_2_1_passive>;
> +					cooling-device = <&cpu2_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-0-3-1-thermal {
> +			trips {
> +				cpu_0_3_1_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_0_3_1_passive>;
> +					cooling-device = <&cpu3_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-0-0-thermal {
> +			trips {
> +				cpu_1_0_0_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_0_0_passive>;
> +					cooling-device = <&cpu4_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-1-0-thermal {
> +			trips {
> +				cpu_1_1_0_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_1_0_passive>;
> +					cooling-device = <&cpu5_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-2-0-thermal {
> +			trips {
> +				cpu_1_2_0_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_2_0_passive>;
> +					cooling-device = <&cpu6_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-3-0-thermal {
> +			trips {
> +				cpu_1_3_0_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_3_0_passive>;
> +					cooling-device = <&cpu7_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-0-1-thermal {
> +			trips {
> +				cpu_1_0_1_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_0_1_passive>;
> +					cooling-device = <&cpu4_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-1-1-thermal {
> +			trips {
> +				cpu_1_1_1_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_1_1_passive>;
> +					cooling-device = <&cpu5_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-2-1-thermal {
> +			trips {
> +				cpu_1_2_1_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_2_1_passive>;
> +					cooling-device = <&cpu6_idle 100 100>;
> +				};
> +			};
> +		};
> +
> +		cpu-1-3-1-thermal {
> +			trips {
> +				cpu_1_3_1_passive: trip-point1 {
> +					temperature = <116000>;
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_1_3_1_passive>;
> +					cooling-device = <&cpu7_idle 100 100>;
> +				};
> +			};
> +		};
> +	};
> +};
> --
> 2.47.0
> 

-- 
With best wishes
Dmitry

