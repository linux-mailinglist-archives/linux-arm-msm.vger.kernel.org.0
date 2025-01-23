Return-Path: <linux-arm-msm+bounces-45936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9EDA1A1E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A5E16C9B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4C620D51A;
	Thu, 23 Jan 2025 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUeFycJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE8820CCD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628331; cv=none; b=PmBFeHG3YoWfTzaCUWogvYCecUCI7lC8FzNogg3l2b19BkqBQm5FmHcB97WEGDKbBbcnP7EP4X7BTRy5FVR/I+ehhhRB9NpKDUhrTZvSy6pvwhYaAb3yHp6le8/Yi8J8z+HfdIokWFHfLwcCtqXZdufl9/BMQPekmWqGlVi567s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628331; c=relaxed/simple;
	bh=5QDj1vkJS+yvsDLMcSTcf4UcVo3dW9OBFZHH9q/AKL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuG87lxJA+03bl7u3GDUlQK8Rnmg0pz6X/GIIS28+EboP+/uHdz/t8xkBkZIEDfi0WKaH/Jq0vSH8mymfTwf/yKsj/Z/6LYcpV5CCw/OifWv47aHil1Sz3TlEh2D/XUZFIWepk3mQ88MS1k38CL9nmcRTmT0DMJPkGRPaGai9lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUeFycJo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401be44b58so878782e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 02:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737628327; x=1738233127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8zPn6AGoIbhFoUTj/9NofY6/9PJDSu0fp28fJrrat0=;
        b=sUeFycJoY8eVrmn2ciEgD0Id/plwIAj5ZkwQes24EB34ADxVGMjmHep2zoTh3YgP8f
         IVcrCHaLwMi/AejmqcPjxV5LyhQwcPyFtgodDFxTqvlR1CFlHJ6XzwL33BBCeOMaXmvi
         1l6hp2MiY3JlFmr3I3cUDH74nTZsUPUchKsX/KaHhmQ/T3VRgWKfAflzmTeIjLKQ2vFN
         eSQF+1x2iFE5TrJFAiGDdfJfEnYnfZW/zCnDNGvaLaK4Qhnvz3XRDzqJExZQk3xUu6B9
         1TvZsMaOyPvX6VdQ3aKGIidUPztGuPgHAy7uZejSkEroaAdmDm9wtXTjact/Pg3xicrK
         YuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628327; x=1738233127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8zPn6AGoIbhFoUTj/9NofY6/9PJDSu0fp28fJrrat0=;
        b=ZgarTwrbfyIDFXPN+566Ew4YyHOS4m9B4Z2dAj38lQ//ckaIr3QGfDgFk317k6/DPI
         R5iC++xnO2D4nCp8jh5oWmQpqemkmyW/52HbVYokIq/XNtfhEWnxs9y8mbeHnAUjyppP
         6+SMe1JCc19RtqH3c8jf9027tnDD7VHAmXbf1ceWABAF02l9wbnI6kGMQVl881PugaBv
         X2kL5kier+JwBB3GbJrcfCJ6g2Dj8mIdlYNoIkPCiRvZVE/BxjjV6jjkXUfQAMr6qm8J
         z8TCDmHSfHReaO0fOvIB5y6RIj4K5nbWHy16gRgWmWMdUdw2ryVbdhZiN9XmrPT+PQXw
         7CCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgpM0stSE2sT97LdqTHesXynWCUBV/mQvEgy67g5YGc3HermQlt7/4AJi7FgfuB0qPSF/MvE9uO3zvCxmw@vger.kernel.org
X-Gm-Message-State: AOJu0YxgxgAoLXAd2t5/GPgMFr72trQpkZl5kLIpvOEgjLebMZzlysdz
	d5ZCdQ+U0fWDfKoxpJnXqhnHxIVcgmjBZIzNR6zQq3QGELO1dVlWcgcxMLOZnLA=
X-Gm-Gg: ASbGncuJx2XlVGnrsSWrOxamSH3ansZ+hkKEt+VwfgHG9+uDL/Mu36z85z5S0k9SXHK
	u8Pqm3ItX2g4mLS4WB7rso/sow8J+CE1WruG07Km6qaLLpJO7ZAcaFWMkSflyVx/Slds/qwCN4w
	EWgtmGTFzyddJp4+b2Nji3E4etRz/PF+ZIZthFQSPVEwISYZW7/570Dwy2LiNrQ/TE+kD2GkQFh
	DlLgO0LDc2WCWMGpiIA+EtgUibtCSqCMj2agklNgmu3lQ1P0qEniw6DGo68PIwPjxyYOiGeqvQ/
	fxCE4t1HryVRaqEQo8CdtC+9kHU8guxKLmq0a05RD0AQWl/jUNs/v6M2KRs7
X-Google-Smtp-Source: AGHT+IGLOWKp552MjDCQsj2GiquOR4bNT+j/x0B85ycTrL+y/NsfELNzywPJjLCdF2ZBMhuuro0c9g==
X-Received: by 2002:a19:914c:0:b0:543:bae7:ead3 with SMTP id 2adb3069b0e04-543bae7eb93mr2295595e87.30.1737628327267;
        Thu, 23 Jan 2025 02:32:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0ead5sm2577284e87.74.2025.01.23.02.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:32:06 -0800 (PST)
Date: Thu, 23 Jan 2025 12:32:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_kuiw@quicinc.com, 
	quic_ekangupt@quicinc.com, quic_kartsana@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove cdsp
 compute-cb@10
Message-ID: <i65z3bpnhsqx2cg4ga5lampicdpydtqwkbpr45kfpc5xg7eydv@kaw7aenrcy3g>
References: <cover.1737615222.git.quic_lxu5@quicinc.com>
 <45e0882efe080d882fa083c16c51f613f70e52aa.1737615222.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45e0882efe080d882fa083c16c51f613f70e52aa.1737615222.git.quic_lxu5@quicinc.com>

On Thu, Jan 23, 2025 at 02:49:28PM +0530, Ling Xu wrote:
> Need to remove the context bank compute-cb@10 because secure cdsp
> uses the s2-only stream.

This doesn't tell us anything. is cb@10 secure (it isn't marked this
way), are those SMMU ids incorrect? Or are they S2-only? Or something
else?

> 
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@kernel.org
> Signed-off-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 0aa27db21f3d..81b2fba94841 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4585,14 +4585,6 @@ compute-cb@9 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@10 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <10>;
> -						iommus = <&apps_smmu 0x214a 0x04a0>,
> -							 <&apps_smmu 0x218a 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@11 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <11>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

