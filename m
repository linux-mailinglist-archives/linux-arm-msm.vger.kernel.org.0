Return-Path: <linux-arm-msm+bounces-45555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D8A1685F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 09:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AE6518887E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 08:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2FE18FC89;
	Mon, 20 Jan 2025 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZS0gk1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290319ABAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737362824; cv=none; b=nm7rTWusDMle33HHk8uS9BeHBatF36vqfht/BLpSoEkMXkJDzWxn6uhO11jDxaB8yhp1I39CmBm88xKlnXnTgTpTTIEj4zKFWXHLN/L5qDyRD+gmVisu1oL7DcvtRk8+UDjOkRZdCFCGuwYBBWst2FG7PXfbJj3je1dE2H3jPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737362824; c=relaxed/simple;
	bh=9LcO7s1LFjPgAtWAv39R0xXxN+qC/uSMB3PyfFJTWf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9nYkclMDNY77HEt1rU2Y8ivxTOT028C050ql5XlQAK/vGs7e4FiXZjZglPfunAh5UIxjfsP5jiYyck0tx+N9MAqVYYSbt+/x886vBrPpbJ7xyNXAo/vEYY+7kTWthdCv8wNrMzpAsiO0zMuCV54ZkGWPSBH9hYAF81mMoOP9Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZS0gk1a; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-303548a933aso37871611fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 00:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737362821; x=1737967621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rT/AIsIzZmWZmFkt/0ZfkjfdTGDusUnjQWHoi1TGJrA=;
        b=NZS0gk1agnss0qL7k13gHvcrraKrIy9WWA4xoaZEXYbEo9GKGUdkef6uC6wYgz25vB
         +AP6eqAmlV9v1Dvl1DOWaxe98okOb8EaNAa27QYiZj3+8f3gqpeWCi2SPJuPeuhB2XsY
         0kmT2vUZDiG8yPGvfYZIKGF1CoBvrNgGZOeNaHRuFIXZbpRMkRuGt/O60GYTdJP/hIZW
         JeorhNUfqjPBlfIIDjTptTxB/876/XiamX+/icgxHuwfJ2NDRu0t7ejRU0CuSZxowbp2
         1JzSsTMtYmKgVN65i0XA8lTStlsyLR9absu2v6aCgj18ihMapTPZOOTBv+sd5MseHKGm
         hRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737362821; x=1737967621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rT/AIsIzZmWZmFkt/0ZfkjfdTGDusUnjQWHoi1TGJrA=;
        b=SUR3QJgfbXOInz8jJDi5MzMCrkoXA8CVO5Ds74B/PtYPvRpGn1JfoKx0lAwqaEEhB3
         vBIxZnATVcUlMdvPUTfqTSo+LZLeMRO1lSeI2IG3qJ1RGkAJPtePoOGrbgdg7EO0xh92
         99bdr8Z+79gzKkyASJsdj6smYmEWSDqYcHkuLe2glqTmsmaeCrp0+yFUNeTLgSHZW4hO
         uXxzISlUK5UUMZ+c37ufcSWZOr9pVLwC5WI1b8yze3kQYzCiqV8iUa8Lkq54ax2P9pnk
         CMgqO77+DLotimtFN2wKSJKXhc+QV1pXxG9a/ywgvA34kytoKqwA5h1k+MsEcEU71DlB
         I9QA==
X-Forwarded-Encrypted: i=1; AJvYcCWYeYd/p14JV3Nj7z545zqIgM/nYSz8rxLKpuuOyzULmWEgUb29hJdjKDgaz5LFAsDTz2/a2Aqhkn/G0WLB@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVXYilCDA9a6yrmysZbDG22ffFR694TSSrj1NRnbpoxAu4x6O
	iJ9EmUeUFlhBg2CQMIGplGQ3c81SOO0YOW9YG5l2qcHbqYIZaxWpEzLQ52fAuMs=
X-Gm-Gg: ASbGncv5TLdCikJ5ddQWdSknz9pG4xo/ff8fnuQZwBgyNcrL2CqAEUaSPMV9TyRaczn
	SirkGmjXn1IpV3XZ+7frW8rlgz5H/o5rrwM/97ht1HDbsUPK3uoDkvBq2kMV9/kHX03+Q7BX7WR
	UOB1EEsuISgAs9RGoaOoPBy0fkw2hA816eTr4MEKMHxOyqAA0jVnwEtqa7o2ptyCEgB6GJFMVDD
	mD+VubJO3hMxXxUVEjV/ohKalCNPbknkYAQkrmCUzhNziiaEFxqwkKDkVGxycRhbkfDLxhMjBQ3
	Hun9vnUBl0Y36a2KA2k+S9ruGSuygOh2RMh89M5EAggv4mXeyA==
X-Google-Smtp-Source: AGHT+IGv1OA7N2Pccs82cOm1MpDroFDWPgmqD1jqgQWfbkWvR2MNnIRNXjYm+ELjoydLUhrsjf+eew==
X-Received: by 2002:a2e:bd84:0:b0:300:3a15:8f23 with SMTP id 38308e7fff4ca-3072ca5b61dmr39256741fa.7.1737362820729;
        Mon, 20 Jan 2025 00:47:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330175sm15004111fa.5.2025.01.20.00.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 00:46:59 -0800 (PST)
Date: Mon, 20 Jan 2025 10:46:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
Message-ID: <scfoxmstfqgvqmxovb7h5gulh6bjhgexs6yxe2n75izc7sawby@djphyr2ilei3>
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
 <71635b71-71e4-4c17-add1-bf41ce770632@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71635b71-71e4-4c17-add1-bf41ce770632@quicinc.com>

On Sun, Jan 19, 2025 at 04:08:20PM +0530, Taniya Das wrote:
> 
> 
> On 11/9/2024 5:30 AM, Dmitry Baryshkov wrote:
> > On Fri, Nov 08, 2024 at 11:54:05AM +0530, Taniya Das wrote:
> > > Add cpufreq-hw node to support cpu frequency scaling.
> > 
> > CPU, not cpu.
> > Also the prefix is incorrect for both patches.
> > 
> 
> Will update to CPU.
> 
> > > 
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
> > >   1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > index 8c98ac77dc5c665ef296e65ac76c1b59be485abb..2c61da790e78b131e454991c968ece40dd5ca56d 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > @@ -33,6 +33,8 @@ cpu0: cpu@0 {
> > >   			power-domains = <&cpu_pd0>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_0>;
> > > +			clocks = <&cpufreq_hw 0>;
> > > +			qcom,freq-domain = <&cpufreq_hw 0>;
> > >   			#cooling-cells = <2>;
> > >   			l2_0: l2-cache {
> > > @@ -51,6 +53,8 @@ cpu1: cpu@100 {
> > >   			power-domains = <&cpu_pd1>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_100>;
> > > +			clocks = <&cpufreq_hw 0>;
> > > +			qcom,freq-domain = <&cpufreq_hw 0>;
> > >   			l2_100: l2-cache {
> > >   			      compatible = "cache";
> > > @@ -68,6 +72,8 @@ cpu2: cpu@200 {
> > >   			power-domains = <&cpu_pd2>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_200>;
> > > +			clocks = <&cpufreq_hw 0>;
> > > +			qcom,freq-domain = <&cpufreq_hw 0>;
> > >   			l2_200: l2-cache {
> > >   			      compatible = "cache";
> > > @@ -85,6 +91,8 @@ cpu3: cpu@300 {
> > >   			power-domains = <&cpu_pd3>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_300>;
> > > +			clocks = <&cpufreq_hw 0>;
> > > +			qcom,freq-domain = <&cpufreq_hw 0>;
> > >   			l2_300: l2-cache {
> > >   			      compatible = "cache";
> > > @@ -102,6 +110,8 @@ cpu4: cpu@400 {
> > >   			power-domains = <&cpu_pd4>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_400>;
> > > +			clocks = <&cpufreq_hw 0>;
> > > +			qcom,freq-domain = <&cpufreq_hw 0>;
> > >   			l2_400: l2-cache {
> > >   			      compatible = "cache";
> > > @@ -119,6 +129,8 @@ cpu5: cpu@500 {
> > >   			power-domains = <&cpu_pd5>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_500>;
> > > +			clocks = <&cpufreq_hw 0>;
> > > +			qcom,freq-domain = <&cpufreq_hw 0>;
> > >   			l2_500: l2-cache {
> > >   			      compatible = "cache";
> > > @@ -136,6 +148,8 @@ cpu6: cpu@600 {
> > >   			power-domains = <&cpu_pd6>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_600>;
> > > +			clocks = <&cpufreq_hw 1>;
> > > +			qcom,freq-domain = <&cpufreq_hw 1>;
> > >   			#cooling-cells = <2>;
> > >   			l2_600: l2-cache {
> > > @@ -154,6 +168,8 @@ cpu7: cpu@700 {
> > >   			power-domains = <&cpu_pd7>;
> > >   			power-domain-names = "psci";
> > >   			next-level-cache = <&l2_700>;
> > > +			clocks = <&cpufreq_hw 1>;
> > > +			qcom,freq-domain = <&cpufreq_hw 1>;
> > >   			l2_700: l2-cache {
> > >   			      compatible = "cache";
> > > @@ -729,6 +745,19 @@ rpmhpd_opp_turbo_l1: opp-9 {
> > >   		};
> > >   	};
> > > +	cpufreq_hw: cpufreq@18323000 {
> > > +		compatible = "qcom,cpufreq-hw";
> > 
> > This doesn't follow the bindings, does it?
> 
> I will add and re-use the closest target compatible.
> 
> > 
> > > +		reg = <0 0x18323000 0 0x1400>,
> > > +		      <0 0x18325800 0 0x1400>;
> > > +		reg-names = "freq-domain0", "freq-domain1";
> > > +
> > > +		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> > > +		clock-names = "xo", "alternate";
> > 
> > Are the DCVSH interrupts?
> > 
> This target does not have DCVSH interrupts directly connected to the
> CPUFREQ-HW.

So, does it require a separate LMH driver, like the one used for sdm845?

> 
> > > +
> > > +		#freq-domain-cells = <1>;
> > > +		#clock-cells = <1>;
> > > +	};
> > > +
> > >   	arch_timer: timer {
> > >   		compatible = "arm,armv8-timer";
> > >   		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > > 
> > > -- 
> > > 2.45.2
> > > 
> > 
> 
> -- 
> Thanks & Regards,
> Taniya Das.
> 

-- 
With best wishes
Dmitry

