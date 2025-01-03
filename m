Return-Path: <linux-arm-msm+bounces-43817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36711A003CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 888A77A0FF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 05:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7313256E;
	Fri,  3 Jan 2025 05:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4yc2tuw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F6155398
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883492; cv=none; b=Y4gZtj7q3/lDKcPNjrwOuqoWDmTyr0EWcc6yhrGB+8bZ9qhGrFmn6nzKqo01KIrUdBoUd5kptU3IYLVXFUNgSffTaPTkXG7B/E8FNITKVGJUUnjdCxYSfB0c1RfYiKV6CGKlOkN4drLCnXXoY7vRj2hRbWIcJZY32fMPNJnY9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883492; c=relaxed/simple;
	bh=at/YcOCsLb1g46WS4lByyjsiSkiP0EJhskoPqtjy21o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjF/DJEsLKx2usGtnw3PrJXqL13PXg/Y9WWDHq9hy8cul0flZB8Gyhb7NQRwI+/WfjsT+/vWx9MqWv5si44tvH2+RBN6J53e0nc0rK9/9XHOs0cETSUB330MMzvu8YcGbQZDwwBqYe4hRE8TBQoyK+HDSbW83p7IgV9z7j+TRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4yc2tuw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54263b52b5aso1742002e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 21:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883489; x=1736488289; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1hfCNaSvFCDhBAHKWIR7F+Dr2jFd4o4sO+o85oU4+g=;
        b=o4yc2tuwUnzBSX+S+68W9Wwm7TZD7CqX40DHhtJZH14os9foyRsHfXkAcdIoDz/dam
         +7IYCg1uZNWkiVP4qvfYaMwx55zFVghEYxLxfqjupQRwrlKtOaPP5SlRSub+SWLQGJhh
         iyeVfpUOsFiH44iMTXfjob8k76/x9iWr03Bt8nhBNdIYHhRjCClSHAZtxGhOJU1lSOmY
         ZFzp/9fdnfnpug0C8TCL8a0pqnPijffYALqcdrVkoLsnSVWypUUESbRInqCt1uXtFnJr
         Ml2kvWvghBMJu4R8bmrneNAuv+FlNEUrtzxGA0CXh2/TwCY2lQodUheyvio9mibG/fjs
         t50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883489; x=1736488289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1hfCNaSvFCDhBAHKWIR7F+Dr2jFd4o4sO+o85oU4+g=;
        b=XXadU1yg/Ssp30fitSO+dMa29YnIFm+rxbQ5Zs0k27ik754ryEbaU3lVCa9irRG2PP
         CqTTFDH3InmDnUXiWyasTXaMOjCQ/8L70tJUaxGStEPuzghXGkIevfii7dZOceZcGpHJ
         PCZ1TQJMtoGH+HJZ4XWFRdG+uKUoQh3m5T1JhByf/lAF2AiltfoOWESjwjo36yt3h1rY
         6yzdl3B1kmSo3eyMB3PjcNytptDghfu59ljGXiU87Sj2wTOygzEmZDZ1qUc+RRgBWwXT
         szQ3Aiu2nAPDZ1pSfhOhIYoD+Ibtj6m+GItpY6jd9DqLJXLxfryn33ShHQAICWfb1YXF
         yokw==
X-Forwarded-Encrypted: i=1; AJvYcCVaxR7LJUCh4z6Ejl2t11UpML4rGEDhTEWCMgFnsgtL8kntru41hih0xqNSVnwG7fYvDWNnlyUcr9Nqzmp1@vger.kernel.org
X-Gm-Message-State: AOJu0YxbsN+BhHl7SSMRn6EuvjhUZCaXWPyn6PMHRi+5s1v/hhfGHFgd
	scO6cN4uHX9vjL8DE7k2mT5Oj0b6kovQ5DoE07RqtSDg6EX9FH0GMevnyruFAf0=
X-Gm-Gg: ASbGncvVt0KkHF24BgXCE/uUf6z2mzVV+ND3Z4ZjAsZsg3hMAe6yklGeHZyrRoGFLYe
	q/qfqIZu2F+1YFgoAJeZIG8BFMpMdwQlJMuMBSvsVTmMvfcF1CxtgJyXg3gq+Ny1PfZr5ylAv+/
	MRA7XwoYD8cfCJwjS0E8D+5GYViHpIygwQQNFlU8HN4drfmChaOoRkMzsJtOJ/dcs4SnIKsJGl4
	Wc+bInSiUodS36vmuwskQxKMnUWnzwjypltfbQBe3INYKfmTbW5SrVmcZPa/T+E/eRc9AULro5g
	uPJiGGYulxrRRiyifvsrvGpPjXB948LMQ8Cf
X-Google-Smtp-Source: AGHT+IHJDXW1Mfr007wgFjUluJ0e5hHgU9FRhIlqr4pWUUbVOvSfBeZ9WdF1YSyq6ifZoaAj5CmfLw==
X-Received: by 2002:a05:6512:6cf:b0:540:2022:e3c6 with SMTP id 2adb3069b0e04-542295619f7mr15701372e87.35.1735883488635;
        Thu, 02 Jan 2025 21:51:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238138e4sm4012638e87.141.2025.01.02.21.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:51:27 -0800 (PST)
Date: Fri, 3 Jan 2025 07:51:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
Message-ID: <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>

On Tue, Dec 31, 2024 at 05:31:41PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> 
> Hi Dmitry,
> 
> On 12/30/2024 9:10 PM, Dmitry Baryshkov wrote:
> > On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
> > > From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> > > 
> > > In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
> > > does corrective action for each subsystem based on sensor violation
> > > to comply safety standards. But as QCS9075 is non-safe SoC it
> > > requires conventional thermal mitigation to control thermal for
> > > different subsystems.
> > > 
> > > The cpu frequency throttling for different cpu tsens is enabled in
> > > hardware as first defense for cpu thermal control. But QCS9075 SoC
> > > has higher ambient specification. During high ambient condition, even
> > > lowest frequency with multi cores can slowly build heat over the time
> > > and it can lead to thermal run-away situations. This patch restrict
> > > cpu cores during this scenario helps further thermal control and
> > > avoids thermal critical violation.
> > > 
> > > Add cpu idle injection cooling bindings for cpu tsens thermal zones
> > > as a mitigation for cpu subsystem prior to thermal shutdown.
> > > 
> > > Add cpu frequency cooling devices that will be used by userspace
> > > thermal governor to mitigate skin thermal management.
> > Does anything prevent us from having this config as a part of the basic
> > sa8775p.dtsi setup? If HW is present in the base version but it is not
> > accessible for whatever reason, please move it the base device config
> > and use status "disabled" or "reserved" to the respective board files.
> 
> Sure,  I will move idle injection node for each cpu to sa8775p.dtsi and keep
> it disabled state. #cooling cells property for CPU, still wanted to keep it
> in board files as we don't want to enable any cooling device in base DT.

"we don't want" is not a proper justification. So, no.

> 
> Best Regards,
> 
> Manaf
> 
> > 
> > > Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      |   1 +
> > >   arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |   1 +
> > >   arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |   1 +
> > >   arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
> > >   4 files changed, 290 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > > index ecaa383b6508..3ab6deeaacf1 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > > @@ -9,6 +9,7 @@
> > > 
> > >   #include "sa8775p.dtsi"
> > >   #include "sa8775p-pmics.dtsi"
> > > +#include "qcs9075-thermal.dtsi"
> > > 
> > >   / {
> > >   	model = "Qualcomm Technologies, Inc. Robotics RB8";
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > index d9a8956d3a76..5f2d9f416617 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > @@ -5,6 +5,7 @@
> > >   /dts-v1/;
> > > 
> > >   #include "sa8775p-ride.dtsi"
> > > +#include "qcs9075-thermal.dtsi"
> > > 
> > >   / {
> > >   	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > index 3b524359a72d..10ce48e7ba2f 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > @@ -5,6 +5,7 @@
> > >   /dts-v1/;
> > > 
> > >   #include "sa8775p-ride.dtsi"
> > > +#include "qcs9075-thermal.dtsi"
> > > 
> > >   / {
> > >   	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> > > new file mode 100644
> > > index 000000000000..40544c8582c4
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> > > @@ -0,0 +1,287 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +#include <dt-bindings/thermal/thermal.h>
> > > +
> > > +&cpu0 {
> > > +	#cooling-cells = <2>;
> > > +};
> > > +
> > > +&cpu1 {
> > > +	#cooling-cells = <2>;
> > > +	cpu1_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <800000>;
> > > +		exit-latency-us = <10000>;
> > > +	};
> > > +};
> > > +
> > > +&cpu2 {
> > > +	#cooling-cells = <2>;
> > > +	cpu2_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <800000>;
> > > +		exit-latency-us = <10000>;
> > > +	};
> > > +};
> > > +
> > > +&cpu3 {
> > > +	#cooling-cells = <2>;
> > > +	cpu3_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <800000>;
> > > +		exit-latency-us = <10000>;
> > > +	};
> > > +};
> > > +
> > > +&cpu4 {
> > > +	#cooling-cells = <2>;
> > > +	cpu4_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <800000>;
> > > +		exit-latency-us = <10000>;
> > > +	};
> > > +};
> > > +
> > > +&cpu5 {
> > > +	#cooling-cells = <2>;
> > > +	cpu5_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <800000>;
> > > +		exit-latency-us = <10000>;
> > > +	};
> > > +};
> > > +
> > > +&cpu6 {
> > > +	#cooling-cells = <2>;
> > > +	cpu6_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <800000>;
> > > +		exit-latency-us = <10000>;
> > > +	};
> > > +};
> > > +
> > > +&cpu7 {
> > > +	#cooling-cells = <2>;
> > > +	cpu7_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <800000>;
> > > +		exit-latency-us = <10000>;
> > > +	};
> > > +};
> > > +
> > > +/ {
> > > +	thermal-zones {
> > > +		cpu-0-1-0-thermal {
> > > +			trips {
> > > +				cpu_0_1_0_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_0_1_0_passive>;
> > > +					cooling-device = <&cpu1_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-0-2-0-thermal {
> > > +			trips {
> > > +				cpu_0_2_0_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_0_2_0_passive>;
> > > +					cooling-device = <&cpu2_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-0-3-0-thermal {
> > > +			trips {
> > > +				cpu_0_3_0_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_0_3_0_passive>;
> > > +					cooling-device = <&cpu3_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-0-1-1-thermal {
> > > +			trips {
> > > +				cpu_0_1_1_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_0_1_1_passive>;
> > > +					cooling-device = <&cpu1_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-0-2-1-thermal {
> > > +			trips {
> > > +				cpu_0_2_1_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_0_2_1_passive>;
> > > +					cooling-device = <&cpu2_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-0-3-1-thermal {
> > > +			trips {
> > > +				cpu_0_3_1_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_0_3_1_passive>;
> > > +					cooling-device = <&cpu3_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-0-0-thermal {
> > > +			trips {
> > > +				cpu_1_0_0_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_0_0_passive>;
> > > +					cooling-device = <&cpu4_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-1-0-thermal {
> > > +			trips {
> > > +				cpu_1_1_0_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_1_0_passive>;
> > > +					cooling-device = <&cpu5_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-2-0-thermal {
> > > +			trips {
> > > +				cpu_1_2_0_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_2_0_passive>;
> > > +					cooling-device = <&cpu6_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-3-0-thermal {
> > > +			trips {
> > > +				cpu_1_3_0_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_3_0_passive>;
> > > +					cooling-device = <&cpu7_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-0-1-thermal {
> > > +			trips {
> > > +				cpu_1_0_1_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_0_1_passive>;
> > > +					cooling-device = <&cpu4_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-1-1-thermal {
> > > +			trips {
> > > +				cpu_1_1_1_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_1_1_passive>;
> > > +					cooling-device = <&cpu5_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-2-1-thermal {
> > > +			trips {
> > > +				cpu_1_2_1_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_2_1_passive>;
> > > +					cooling-device = <&cpu6_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu-1-3-1-thermal {
> > > +			trips {
> > > +				cpu_1_3_1_passive: trip-point1 {
> > > +					temperature = <116000>;
> > > +				};
> > > +			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu_1_3_1_passive>;
> > > +					cooling-device = <&cpu7_idle 100 100>;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > --
> > > 2.47.0
> > > 

-- 
With best wishes
Dmitry

