Return-Path: <linux-arm-msm+bounces-49712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1CCA48250
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E27893B35A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6088726A0C6;
	Thu, 27 Feb 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMSXQCEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608423816C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668598; cv=none; b=aU/T2wkcmGHRLkc5VPyTCQYuXsDnm6qhJ/w004QrlwXp9XnSqar8Ktx1IK0x6tZOJbhh7lkxEOc9C20RX1I382xw4eO2vToISPS/KP05vI3UO67wCnUfpTS6kXKcNx72QnKcJlo221FEl9vEDWFn8eEmQe7rdv1Ot0FHUVsOJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668598; c=relaxed/simple;
	bh=Tl40Fm+loygXp9JTJZ0Z7May9tG5QQ1he6NwlUmTUjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbwamZjxrhv4RmvDvnC4BnIku9+LDlTRrYYLrwt/W+XeJGBAyX3i50r/DDCyhwO2sUXpx8AaQgqs6JL+EhbCqeoJgXR4cWbPMS4ypPMOB8/dER1VfNNvMxHUKxsL7TOdubhWMSknDii5llU1fq6CaAzSVwVs9iDjYaOG6LLppv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMSXQCEc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54524740032so1008743e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740668595; x=1741273395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jct5/sWNcnHp4YAXGTjpriX8VME8tdrztTmpTBFh3WQ=;
        b=aMSXQCEcg8RqG+qJqVpEHWj9PPcUP9pfHJoA95HV4UjkVPTIxTlO9xGCMCDfaGEDLs
         xL9NW4Hq/fGFgr4+sBdXSI7G9YcS4jViE6+/ufbI73tEC/jME4UsEzngv8WqVKOKpD73
         IEKXy2jBQa9JNpoSdEe08jKb2NJyhQy1jjqaEHwS4WjTxDoMh4qP2lPSeAnS5raSjrTc
         F3eastvt5F5PRTi7rzlBzAYEnb0BQYll7AE8s0eHCgSQOR0hVBWW8yEEBo2LlAM1Qdgn
         odFjAf1lOCJixT3O40yz+ktjBwyPSs5QMQOCxFPKeacDK17EdFNw9UeQLKdSy/wIlI4T
         I5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668595; x=1741273395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jct5/sWNcnHp4YAXGTjpriX8VME8tdrztTmpTBFh3WQ=;
        b=InTZk5esRXpgfLSbvk+5Ga25DdZGCq0dBySfoNjckmad7On1daV26rNtCrYxKKJCAJ
         XUzFH1o5Oe39srX6XcJNAcZieZWkaNNmWb3P7ksttYOIZ67Fx54/ooI8SKiRvsdJb4BH
         W0nLTG0P4QvBgvj9+4HLuSh0nXjSFliPMAhCxNNEVPHUZk7pouXSiww72j+ToWSs0ZrB
         AAPWb/PMThOQmCc7/8sXcgZHJmODWTK5+we3xKnKJEpv4o+E5LMPHNWO0zf5eL811yZV
         PSmJaMW5dJthX73AthpU2HRJsTQiX59YtrWmJTsDP0CvJuPrxklhOiZgQlmVl7U93Xiq
         ja0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe3aDBmJHLutUuq7HGrvxaGk/niJpMDDbDUgKFiL9s9R+JuzoJAwv7Lkw619zPu7BTla+CTdbNZMeXOJfl@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwK2KlP4PC9nGrqjTl/NyyDrQKKduwLNCKbZfLnpsE3GLxqEo
	dEBjG3mh26t0y6b+12gTINuRuI9wRarRqVG2xYj99o0WxXfN+GQbvMrpRIaraDo=
X-Gm-Gg: ASbGncuXiaL9OsrK1ZjYbGHwKkYSaJc4FU9CeD7285LyBJDQK7TYgCHj/DxZVPAOMac
	doW0Pot3ax954RmqVt0VJI4+bw03eUXocAww21dLFJabVV94W4wvnOExukb/6JYkqEpWD3qefyy
	wohHWUQLEk8p9IHRbqHCZI1vXllZy/BNSwl3wIb7WekJyiisCbsqIln67ZjUVTxvIf98aelgjd5
	JRHCtgkS+K9y05i49LbxZz65za6Gk/9Lo1R3OYnuriq2RBnW92gLkUGuBa0j3zZfLGGIVRPg93K
	QUpvFdWfOYa9E5G9H1LSPrhS/DiguQ+Ip1QqD2O8WLWXJGTyLOJow223rKLiRY54DAi2JbHwXKV
	1YmxIjg==
X-Google-Smtp-Source: AGHT+IGu6e9SzMnhpr5EnGH9g23xD2bFOtEakcdfl/ZUCRRGs5xA3LtI3CvuzfMuKxAB74Z8ujrfbg==
X-Received: by 2002:a05:6512:3d16:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-548510d2891mr6258092e87.22.1740668594423;
        Thu, 27 Feb 2025 07:03:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b11f0sm180701e87.114.2025.02.27.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:03:13 -0800 (PST)
Date: Thu, 27 Feb 2025 17:03:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: Enable MMC
Message-ID: <ryfawl6uykry5ds5kovujvepkwffdwitbqltx75wnnrqrbl4b2@i2pjwegs3u4n>
References: <20250227094226.2380930-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227094226.2380930-1-quic_varada@quicinc.com>

On Thu, Feb 27, 2025 at 03:12:26PM +0530, Varadarajan Narayanan wrote:
> Enable MMC and relevant pinctrl entries.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index b6e4bb3328b3..252687be9dc3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -69,6 +69,14 @@ &qusb_phy_1 {
>  	status = "okay";
>  };
>  
> +&sdhc {
> +	pinctrl-0 = <&sdc_default_state>;

Where is it defined?

> +	pinctrl-names = "default";
> +	supports-cqe;

This property should be a part of the SoC dtsi.

> +
> +	status = "okay";
> +};
> +
>  &sleep_clk {
>  	clock-frequency = <32000>;
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

