Return-Path: <linux-arm-msm+bounces-38459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C59D3936
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8DBD1F26D83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBBE199FB2;
	Wed, 20 Nov 2024 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkOrSKNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8704118660C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101142; cv=none; b=L6sS+9HAd/Zvhm7QHUrOqchu7PjlkViPeO4J9MA6sbqtTO3BeDTwqefYncCelYMI+Plj5Ckaj72P34rIZs0TPSkcJylUqY2rImGbeAYbfEZnWGm77J/iiIqihF+BPFx8aL69EP6qkhIGhiJAbdbIK+5sF5FQTCaJEHWHZLYs4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101142; c=relaxed/simple;
	bh=sTIrY2sJNGWGUmHnCcr7JTspPdLcIuOEoGsMA3vi/Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSz4L/YizN1LdNKyArk6tyh/iBwzqUE1/euN6FMfb9YfizbP/z4Vun6X/P/gMvTA9C8o5tCI3zd1+mmn2pfOq+lFM+vVHG4zUy+bO0XYKEw8Oa/ag5UAra++UsSIFxhreiYVDm1V3Ud32u8KBJqNwS29YZffoM+rHtmyy1MWf2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkOrSKNO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53da2140769so4641281e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732101139; x=1732705939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rAN4nKbft5CXDCdEJ1vMSCwtZ3Xk9NEt+75Eio0hiY=;
        b=jkOrSKNOvhd4KEmR05+JcOOPANZBIjnVsJdMvjwLEph05EQFcMGLE0e8+XeXVmjGtR
         XK8u+JrsXjTfUexcYymHY184p/H7IhF5Jfkb2hDtp87O2nH4SDf1gnz8X0bYVu9wtSQ4
         1LWQAf4KTAnmCzjjVkdrIxQvb3Tfv8MuLkiyxiDz4maNS6rJ/Eq8V/rSfS1T4kIV91g+
         o8fdj80JSkIj+PCItTRh4r8eFlyvVHALoCTM5avbZI/Iw0NntHfl2VZvllmodAHURJoc
         puR4Ka4pGBUbAA4FoUamN4OpFYFT1Sn5FgWWnC9PgdUOI/YoJhLPnz1cZ/pd3blpEpXL
         3hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732101139; x=1732705939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rAN4nKbft5CXDCdEJ1vMSCwtZ3Xk9NEt+75Eio0hiY=;
        b=nSduoqH1ejOTzN0tx35jx9ijvWb4P6wZ1SDL6zZHLIXSW8BfPupNEm/rtDVweeLwgV
         TvTgSUL4esVd+3N9b2uMkcr5LE66xBm2V0mQsfSlMt0r+GzRewpz1jHi3v6yL1o2K5ip
         Y1LH4zotRXxzr8q4bdBjXHyHEVZjgBi/Yd2MDa35y3EA1X50JwP+MNCHqNs93Mv50XLq
         4WI7n2eiPjEORfzSocQCL1bTPOPIxuSPHR0nz4Ud34hWxOhLr3WxVZ7lvV2151HgYQGz
         sAnma9FLLkB2GwJk8qjudcsB8hfssxjCDyGieWIy9WlbD/yBHJGji+p6VIioEYVHCMzq
         0wFw==
X-Forwarded-Encrypted: i=1; AJvYcCUykkLEJ/2u4OVNfkC144WO/z0nUwqPBKVVEsq3Vylh422eNP63GtnAl9oQiIXYwCkTD9Ida4hNiuFCbjOj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrpi5DTnenPPqAW2FxDjizaV4PNAyEMK+Hbh8jrDmwhxnn7Kv3
	gsJwZMej9iWvI1TmRcqEPNKDxjehDxfEDN1DbiDsbF+uqP0mUcVH5VbCMO2njSE=
X-Google-Smtp-Source: AGHT+IEluENj384Eah3BgM0n5k4aswo8bBzu/OLNpizzi4AQu1mRHvzrFAFcSCe5MSGLZJ52zq+atg==
X-Received: by 2002:ac2:4c26:0:b0:536:a275:9d61 with SMTP id 2adb3069b0e04-53dc1333a6dmr800517e87.21.1732101138711;
        Wed, 20 Nov 2024 03:12:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd472335sm593024e87.184.2024.11.20.03.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:12:17 -0800 (PST)
Date: Wed, 20 Nov 2024 13:12:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
Message-ID: <lkovymvjsbd44v2huij7paikvnmo7i7rrmkmvpha2wn5sc4hr3@ppr2dgvhzy6d>
References: <20241120105954.9665-1-quic_mukhopad@quicinc.com>
 <20241120105954.9665-3-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120105954.9665-3-quic_mukhopad@quicinc.com>

On Wed, Nov 20, 2024 at 04:29:54PM +0530, Soutrik Mukhopadhyay wrote:
> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> sa8775p-ride platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index adb71aeff339..4847e4942386 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -27,6 +27,30 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";

Thundercomm's SA8775p RIDE platform doesn't show such a connector. At
least not on a device advertised on the web pages.

> +		type = "full-size";
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss0_dp0_out>;
> +			};
> +		};
> +	};
> +
> +	dp1-connector {
> +		compatible = "dp-connector";
> +		label = "DP1";

Same comment here.

> +		type = "full-size";
> +
> +		port {
> +			dp1_connector_in: endpoint {
> +				remote-endpoint = <&mdss0_dp1_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {

-- 
With best wishes
Dmitry

