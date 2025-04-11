Return-Path: <linux-arm-msm+bounces-53965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C860AA857AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D2867A3A55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEA72980D7;
	Fri, 11 Apr 2025 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNegJKWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1971D86F7;
	Fri, 11 Apr 2025 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362879; cv=none; b=PO4W796XpidOYFKCTyPR4GQknJx5+PTLJzovAoCg6VXABijV29qiM5o4K1T35TsobUGXbnkvfpN5P0u5ZXbrekVXm+T0eqUbeClFYk1IlAAYnhvKeuVfPt9Op/4JBIcfYRxYd6wv8RD3uYYrSOUC21nHSDEqPM8C1mzOfHx4vzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362879; c=relaxed/simple;
	bh=868/K9j7i9CpRgNIlqwpSUwNkGMQ9DAI50kwksQWn4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM+2YOMJ1KhqYY2qo54fd2v9hADHEKXyrdjw/BtsA2x18dQC1VrqHTkvrXbtLGL1krfTw5TJrBxoPYWFhMgNe/VSPQXBeA75V1aZBX/4GafemyF+VM66hJAI1c6zL8dns+GUyhAwGwlheTKdBnGaZwt9sIUkMhpI45PYiQNG2YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNegJKWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3F8C4CEE2;
	Fri, 11 Apr 2025 09:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362879;
	bh=868/K9j7i9CpRgNIlqwpSUwNkGMQ9DAI50kwksQWn4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNegJKWGMW/aOtWnDGQXCW3FGjcSNj4DUA44VL1Xh2lP+T0OdaYwS0un9ukjguoNs
	 NF0SViB08fXB3OdeLrRe6KEcju3zcuJ+nF3tQZj27Rt63D2HbXxaKXQpigqKJhMjTu
	 HKNe9VNL/asPqL4Y8CsAujBL0J7m3XUBusOW198vBBJEf2Obm1fWXPn+EmC5KfHlI6
	 MTfivl+COvhWm76FKqUCB1DCFUvhVESjn8kkg++e6fBjAFtN9+b1nym4fWa0P9utn1
	 7iZ0k4FhKAfE2KF9x6V5JODIY6d4WHY5nm2m4ByyjVK/Z8yGLAXGX7AeBDx8vLkAbZ
	 E3eYBqZuGqusw==
Date: Fri, 11 Apr 2025 10:14:31 +0100
From: Srinivas Kandagatla <srini@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: Remove unnecessary MM_[UD]L audio
 routes
Message-ID: <20250411091431.GA58323@srini-hackbase>
References: <20250411-cleanup-mm-routes-v1-1-ba98f653aa69@fairphone.com>
 <Z_jWLq6qJuGH3sNx@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_jWLq6qJuGH3sNx@linaro.org>

On Fri, Apr 11, 2025 at 10:43:26AM +0200, Stephan Gerhold wrote:
> +Cc Srini, Alexey: FYI
> 
> On Fri, Apr 11, 2025 at 10:33:29AM +0200, Luca Weiss wrote:
> > Since commit 6fd8d2d275f7 ("ASoC: qcom: qdsp6: Move frontend AIFs to
> > q6asm-dai") from over 4 years ago the audio routes beween MM_DL* +
> > MultiMedia* Playback and MultiMedia* Capture + MM_UL* are not necessary
> > anymore and can be removed from the dts files. It also helps to stop
> > anyone copying these into new dts files.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> Thanks, I always forgot/postponed making this cleanup. :-)
> 
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

LGTM

Reviewed-by: Srinivas Kandagatla <srini@kernel.org>

> 
> > ---
> >  arch/arm64/boot/dts/qcom/apq8096-db820c.dts          | 5 +----
> >  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts   | 5 +----
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts             | 2 --
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts             | 6 +-----
> >  arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 6 +-----
> >  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 5 +----
> >  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 5 +----
> >  7 files changed, 6 insertions(+), 28 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> > index e8148b3d6c50c670d6bc8045e42074162dc1c6d9..1089964e6c0d819e166fd5a959f7f1e6fe688d65 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> > +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> > @@ -1012,10 +1012,7 @@ wcd9335: codec@1,0 {
> >  &sound {
> >  	compatible = "qcom,apq8096-sndcard";
> >  	model = "DB820c";
> > -	audio-routing = "RX_BIAS", "MCLK",
> > -		"MM_DL1",  "MultiMedia1 Playback",
> > -		"MM_DL2",  "MultiMedia2 Playback",
> > -		"MultiMedia3 Capture", "MM_UL3";
> > +	audio-routing = "RX_BIAS", "MCLK";
> >  
> >  	mm1-dai-link {
> >  		link-name = "MultiMedia1";
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> > index dbad8f57f2fa34575440caa7f0a19d5893efcfbb..d7fa56808747ae1290b884430d5fa5443bdd9be1 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> > @@ -156,10 +156,7 @@ &slpi_pil {
> >  &sound {
> >  	compatible = "qcom,apq8096-sndcard";
> >  	model = "gemini";
> > -	audio-routing = "RX_BIAS", "MCLK",
> > -		"MM_DL1",  "MultiMedia1 Playback",
> > -		"MM_DL2",  "MultiMedia2 Playback",
> > -		"MultiMedia3 Capture", "MM_UL3";
> > +	audio-routing = "RX_BIAS", "MCLK";
> >  
> >  	mm1-dai-link {
> >  		link-name = "MultiMedia1";
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > index d485249bcda44055689b5556eec9dd057b92d0ae..a37860175d2733214f1b257e84d5cb4821033242 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -110,8 +110,6 @@ sound {
> >  		pinctrl-0 = <&lpi_i2s2_active>;
> >  		pinctrl-names = "default";
> >  		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
> > -		audio-routing = "MM_DL1", "MultiMedia1 Playback",
> > -				"MM_DL2", "MultiMedia2 Playback";
> >  
> >  		mm1-dai-link {
> >  			link-name = "MultiMedia1";
> > diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > index 4cc14ab1b9ea0f92a12a12ef4df1cdc37bf5591c..dcb998b8b05498d8f9a82ff9a984c1e237a61308 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > @@ -1053,11 +1053,7 @@ &sound {
> >  		"SpkrLeft IN", "WSA_SPK1 OUT",
> >  		"SpkrRight IN", "WSA_SPK2 OUT",
> >  		"VA DMIC0", "vdd-micb",
> > -		"VA DMIC1", "vdd-micb",
> > -		"MM_DL1",  "MultiMedia1 Playback",
> > -		"MM_DL2",  "MultiMedia2 Playback",
> > -		"MultiMedia3 Capture", "MM_UL3",
> > -		"MM_DL4", "MultiMedia4 Playback";
> > +		"VA DMIC1", "vdd-micb";
> >  
> >  	mm1-dai-link {
> >  		link-name = "MultiMedia1";
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > index 2b2ef4dbad2fc55b27fd176baf1b4205802e1c42..adfd916270055df0a957c573868302e0d77c614d 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -777,11 +777,7 @@ &quat_mi2s_sd2_active
> >  		"DMIC2", "MIC BIAS3",
> >  		"DMIC3", "MIC BIAS3",
> >  		"SpkrLeft IN", "SPK1 OUT",
> > -		"SpkrRight IN", "SPK2 OUT",
> > -		"MM_DL1",  "MultiMedia1 Playback",
> > -		"MM_DL2",  "MultiMedia2 Playback",
> > -		"MM_DL4",  "MultiMedia4 Playback",
> > -		"MultiMedia3 Capture", "MM_UL3";
> > +		"SpkrRight IN", "SPK2 OUT";
> >  
> >  	mm1-dai-link {
> >  		link-name = "MultiMedia1";
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > index e8012205954e76627febda14ee51ecff9d29e4fb..7677acd08e2d176be932d3f726fe5602cf8d50d1 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > @@ -632,10 +632,7 @@ &sound {
> >  		"RX_BIAS", "MCLK",
> >  		"AMIC2", "MIC BIAS2",
> >  		"SpkrLeft IN", "SPK1 OUT",
> > -		"SpkrRight IN", "SPK2 OUT",
> > -		"MM_DL1",  "MultiMedia1 Playback",
> > -		"MM_DL3",  "MultiMedia3 Playback",
> > -		"MultiMedia2 Capture", "MM_UL2";
> > +		"SpkrRight IN", "SPK2 OUT";
> >  
> >  	mm1-dai-link {
> >  		link-name = "MultiMedia1";
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> > index 26217836c2707ba2f7b0030c9801d7de3a797315..d6d4e7184c5603864668057de79c7497ad361ab3 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> > @@ -445,10 +445,7 @@ &sound {
> >  		"RX_BIAS", "MCLK",
> >  		"AMIC2", "MIC BIAS2",
> >  		"SpkrLeft IN", "SPK1 OUT",
> > -		"SpkrRight IN", "SPK2 OUT",
> > -		"MM_DL1",  "MultiMedia1 Playback",
> > -		"MM_DL3",  "MultiMedia3 Playback",
> > -		"MultiMedia2 Capture", "MM_UL2";
> > +		"SpkrRight IN", "SPK2 OUT";
> >  
> >  	mm1-dai-link {
> >  		link-name = "MultiMedia1";
> > 
> > ---
> > base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
> > change-id: 20250411-cleanup-mm-routes-7b9e92962553
> > 
> > Best regards,
> > -- 
> > Luca Weiss <luca.weiss@fairphone.com>
> > 

