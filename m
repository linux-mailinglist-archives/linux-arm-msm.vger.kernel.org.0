Return-Path: <linux-arm-msm+bounces-47656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE75A31994
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB925167A1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 23:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBF8267712;
	Tue, 11 Feb 2025 23:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCDgV0jV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AFB27291F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739316785; cv=none; b=GipRhkWiRKZjIZI5KfKN4DTWz9YenmOBDS1vLvKRM5tx+G2ST6D6xDDmG+xaE38n0ykwM2BPCPHIODES2RqK/+lU+JS5Bsxk746ewAI1IfuApYEnocSGvHdDAmI8MGWt5PQorOe+vnX/OcP1jfdnie/HCJ3UdmDql5GL5q02AQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739316785; c=relaxed/simple;
	bh=5FH5cvqCHRGQxFLU+IHFkeW2Dbf/nCNH2vIoY2msvPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXy+SHRjAq28YFqVXs8+pg8wt8s/jYf38BSFBWxAuh+OjGo7z/PYvef9WRntISDf5dBxubcpaj0zQNbtL8iJRvbqiLdLLvgO/7HG/CRJ4BQXiqR3i9jYiHj1yQXlvi0gze7v7YsU2cn44du1tuaUq6qHaTS/+24hroYaaep80xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCDgV0jV; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30613802a04so61013551fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739316781; x=1739921581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rodQbk+x03x3x3m50M7JrNSJkTThLNOVG4NbQXJPotk=;
        b=JCDgV0jVOJEhiBpYdACp6h4H+2/nZuoOOuLAPwfxxoyPfFE0xoesOFWp2IZoCr/9gc
         IbUXI7iNsAmjPugAyxWAD0V3qmhZBUkSHHw7HejzKvrRrTeigVsyDJelDTEe8Dzy2pEh
         erfrLqNKZz8/SYxzPL8xpdqID76X1c+APKNF/BhxBz8CVEPoxVpR0rFxIhy1Fy7Bb5m4
         shwwtyeyZSXE8LVJiwVbPZk1xBNt0oUE1sAVOqSEWawzsJ3AJAvHhZ9bavj9IDOK/VxJ
         Pyn4+H09SyjODHAN//pGfvztNkcuJsj0AZSVohrc7okxbYKbxA2zbeRb834Yd72Cy9pi
         Cmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316781; x=1739921581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rodQbk+x03x3x3m50M7JrNSJkTThLNOVG4NbQXJPotk=;
        b=tLdfPYPLnZyUD0iGvdftAOMcEHf2bMWvGMFdoxffZflSmyzNu/jAmKuafBs/q3B64Z
         PuwDhTGhvEHLXicAxVwN/ocDPdH+/GE4gIaVhNP+HvBAfIyn4Z+tUiqNxxnUpCX15Jz8
         skJm9diNTH9MllD2lyTrVP84jkSTpVpYX1oJLMwmxLm0oM0b90NDkjTkM5pe7fOsJvEK
         RUJYr1eJY6iOUJtxaxHEslYFMds1pkwG7CXVTZnlh6M3Xh78gnQ+y591KjKLag+trGob
         QX1UwMY2flnWG+Qhu0gwORRQQB68mD+D6PLMJ/8BLA71t4nyHZzOv7fZK2BgDldwwcMV
         aOFA==
X-Gm-Message-State: AOJu0Yygb1l9U9iyXwrYDfznKIt4MqzBHoe2OLav0o3DniG1pqQG5nMG
	i0nIsBW6kiNEaUAeHBatPW2y3PJIF8Au+Q9nUdW7BxQgbIIzKPVtxiWdywQwV9o=
X-Gm-Gg: ASbGncvgAxD8ZlBYCNAoUIcFV/mKueCm04SLXGcBGHfenXRrtIBZ3riblHcrxjwnw99
	vwSusjzrqTtyn2GO8ZFdtK+mdOIxpccoPwBIYXJaYsoG8utzK/6ChqtEVaZztARH0y2IVFGuLa6
	nkucKm34V/z+tbBoUIFGkWE1S4pmK/XQx+DgGE0BvJPa4HAUdIybUSQbCNBV2uM4IUAv8Otd1ES
	JVewaJgDdMwJkcjylm7AR1DFn500FzMwayh8btvuxFfBsDCBK4M/nrAZVj/pfNdqfjUKIXxiTeN
	IVDE8oNwKHh9kvbkrd5dWQDRlPQ2DYwZ3Or6QJ0WKTqkfb5Tzn5P1jCeW1HWAMnmSa/LURM=
X-Google-Smtp-Source: AGHT+IGB1Kv/nNI1yQM7J/jta9bV8fuqJGcXbtiJgiXWtxEIK0FnId8AJnNZYhlhIorjWhWV0YGZVQ==
X-Received: by 2002:a05:651c:221d:b0:304:4e03:f9d9 with SMTP id 38308e7fff4ca-30903911d8cmr3728551fa.28.1739316780860;
        Tue, 11 Feb 2025 15:33:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2f6995sm16006451fa.107.2025.02.11.15.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:32:59 -0800 (PST)
Date: Wed, 12 Feb 2025 01:32:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	quic_wcheng@quicinc.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [PATCH 3/3] arm64: boot: dts: pmi8998.dtsi: Add VBUS regulator
Message-ID: <5efl5oppr5phgktwuk2n6rvdz37wuygdwsmrdqwh5gimofrrcq@qe6lena27emf>
References: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
 <20250211194918.2517593-4-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211194918.2517593-4-james.a.macinnes@gmail.com>

On Tue, Feb 11, 2025 at 11:49:16AM -0800, James A. MacInnes wrote:
> This patch adds support for the USB Type-C VBUS regulator to the
> PMI8998 PMIC device tree.

"In order to enable USB Type-C VBUS support on the SDM845 platform add
device node for the USB Vbus regulator to the PMI8998 PMIC device tree."

Drop the rest of the commit message.

> 
> Key changes:
> - Defined the `usb-vbus-regulator` node for VBUS handling, enabling
>   control over USB power delivery.
> 
> This addition enable USB Type-C VBUS support on sdm845 platforms.
> 
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd42..8cb1d851b5a3 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -29,6 +29,12 @@ pmi8998_charger: charger@1000 {
>  			status = "disabled";
>  		};
>  
> +		pmi8998_vbus: usb-vbus-regulator@1100 {
> +			compatible = "qcom,pmi8998-vbus-reg";
> +			status = "disabled";
> +			reg = <0x1100>;
> +		};
> +
>  		pmi8998_gpios: gpio@c000 {
>  			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

