Return-Path: <linux-arm-msm+bounces-24826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6691E7DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD0951F22336
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EF816F0D6;
	Mon,  1 Jul 2024 18:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwdLyA/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6E16F0EB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 18:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859111; cv=none; b=bKUVX7RC6ymKWXGGFa/i684yJJxKrfI8h7zJCgI/bqcd+qH9MkRRLo272rSaxMtSo9TtdUj3OMN/52GNEK3ChChy5esCB+Jxrw9vAEBhYu9I+ffwtCFpKOiROCqJzM0G2J98iwL4FiJAge0FpQXyhBaWKrSu3CaTl5A6tqhhAnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859111; c=relaxed/simple;
	bh=Q5DNZJkle1fuxyMGLV0LWFww4L4pTjWDcEYU/W0hd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMCX5IVFRBT65liaYupRlLbjJgBcKhlAii3pktv2BByWxIfS+ZbkO9MYHMxk0ZniGX7pNOxxXLaCYdNnyuHAI3011mNmYkYXxqqS9QW8wT3LEJigD6Hmc48ZxblY4NYpNI6fdzrE3QNALDpKD5zCmusYFwFC4D4IJ6ZMvILNg8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fwdLyA/i; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e829086f3so3016676e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719859108; x=1720463908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP26RievRLgoMdQuIRbJbPKYmkTq23GGTz7uClqgRXw=;
        b=fwdLyA/iHnDGUsQ2bJXdt9QcnmrdaMubyZnIKnbyeowy1xTS3j8ZIYlFbmslyqZMp+
         H67HJ2bJHGHqX5VQ/lX3ssWBvtVpvNNrxKoepzN6Aogwe8crMF7Tpmjfgkj/agobKBkP
         7uBo19YiS4t2wWHHRtxOnxiEg6lEhwj273cFrMxxLx3cwlvevb6Wj+w0lrTYB+2+dA8r
         ZUqqlLe5DwsMqeOHdQT3sghsAMtZkGg9K5xDO3vtL01Id8zprOR/tVWyfoW0kwCLDBrm
         UWr8qx01+Df0rMJltaH0HbofmahBP+fUcohVbMitwQGfmCxxV8r+sVclEqHSGHBNCLA/
         zYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859108; x=1720463908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP26RievRLgoMdQuIRbJbPKYmkTq23GGTz7uClqgRXw=;
        b=LVtf4Ib27wAgLhLKSc/ZnARVRIs803sf6evITn9/eElTQy55o7gwOAu8fjaLsjaFxF
         3JRtOz2nQ6YcKv1ECJtFnjOpb1ExH3qFkqczoX9Po0R0ntRTVklQ7Vg2/+trAdEEZw8p
         J0IuAH5g2Rp7yl7rPVjFF/Em6z71pY20goi9kxrndA+zOJLDC4LPycPMT1dZqfjTLkWO
         6Yo20nnG2sq4Wlop+K7ndFkh+6MWXodZQtH6YqL5BMPhWgfdVZr/JM8WZqwBDOT0iv1u
         deMeYxbZBleU5vDzqv9RFofuws+tlpcSTjlr1sVAW7iOmK4lBcXp07LFH/Fehi5UIhTx
         UeUA==
X-Forwarded-Encrypted: i=1; AJvYcCXKWJRyCKf99p5qGczfzxcj3ko6CZGCseXbQ9nfe/bpwFsK2+vVX1P/bKp5tbsV+q1uIeEBL9YQ3p48hIx/UJP9RJ9X/sL1+86KGNlYew==
X-Gm-Message-State: AOJu0YxUdaaZxrSPzsRdMUgVJ32zF8CPFrdNJzLR8SBdlzV8oXRGaEiF
	LrM4s3/NFEC+0R6NyXsmFdLu5RxpYwwVRgfPp8pPcisEcreR2RmYnHj9ADaPLYM=
X-Google-Smtp-Source: AGHT+IFRqsXEzTxzzMdgk4SiVapL0WO66+w+Yg4eXPAj4F/TWh4MZqDqfszVl6/jbUBXlWx+Q4x6eA==
X-Received: by 2002:a05:6512:3baa:b0:52c:d943:300f with SMTP id 2adb3069b0e04-52e8268b961mr4075257e87.38.1719859108356;
        Mon, 01 Jul 2024 11:38:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0bb88sm1474303e87.56.2024.07.01.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:38:27 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:38:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>, 
	Hariram Purushothaman <hariramp@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Hariram Purushothaman <quic_hariramp@quicinc.com>, Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sc7280: Add IMX577 camera sensor
Message-ID: <uuchyzhj67gjcsj4ijlrefopuhtflenbyb6wjyjkvjg7evavku@6i4z3ac76fwa>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>

On Sat, Jun 29, 2024 at 12:02:37AM GMT, Vikram Sharma wrote:
> Add support for IMX577 camera sensor for SC7280 SoC.

Note, the subject and commit description do not match patch contents.

> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 9ac251fec262..1c99ee09a11a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5167,6 +5167,39 @@ cci3_sleep: cci3-sleep-state {
>  				bias-pull-down;
>  			};
>  
> +			cam2_default: cam2-default {
> +				rst {
> +					pins = "gpio78"; /*cam3*/
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				mclk {
> +					pins = "gpio67"; /*cam3*/
> +					function = "cam_mclk";
> +					drive-strength = <2>; /*RB5 was 16 and i changed to 2 here*/
> +					bias-disable;
> +				};
> +			};
> +
> +			cam2_suspend: cam2-suspend {
> +				rst {
> +					pins = "gpio78"; /*cam3*/
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					output-low;
> +				};
> +
> +				mclk {
> +					pins = "gpio67"; /*cam3*/
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>  			dp_hot_plug_det: dp-hot-plug-det-state {
>  				pins = "gpio47";
>  				function = "dp_hot";
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

