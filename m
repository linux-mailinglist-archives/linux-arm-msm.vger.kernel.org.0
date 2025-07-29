Return-Path: <linux-arm-msm+bounces-66965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 728C4B1484D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 08:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C173A8110
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 06:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EFA25A2AA;
	Tue, 29 Jul 2025 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnQwSh4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE021D3F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753770866; cv=none; b=uVoexd9OyCnrfJVA25wTwBySpzvEyaB1pkMQY5AsV0BvwgpPVVEItR8O9Q2m1WJ0ga5Lg8A1Qy6aNgklm20Q8v7L9w8YsqQhmihZohJbmc5FvS2cHzyy9eJOVa3SVR4qDi4uYvE17a0mIW0PIUIA8sJLrDc6mIr5xn2fFfuJ8DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753770866; c=relaxed/simple;
	bh=DsSSixPFpacQb6ndKjAb6W1B+Y6D+l4BcUMKXYwMUtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBNuho4zRmO25bLZv8yWQOXiqQEz12vha6AKSfRwy7lCzR0CzYbsz0hSqzYpQA0IFx5z24DrotvG7K2gSIf2wxjPVCxue63dlHS9H/Ul84fsuw+2+qcWfdGE8xMK9U5WMnhGx7ebJZ4jMVlw41bSnWTqurL28zW+3OFls2L93M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnQwSh4x; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so2155525a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 23:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753770863; x=1754375663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0wJ7p1KnoPTtuiUiUre3TQUdtSHj428TRzShsa/CgUA=;
        b=SnQwSh4xLbzVXkBUaFnq94Epnq3ZNDiTi68ypeGyiEdUYKViwgRHNjnCaKvWpi7kMk
         2QG5XmqRjPKvKwIcSkjRm2KOichadQAqaGNoIRee0kHVQFLPb2cT7t+8UKGaGMFM//w0
         isO+M3+o3LyvguwMyNH/FTuhVItk1NUAKamR8Ppyksb5PzBvArQBLQKrp150r+eS3O/E
         XnSXcpTJfNijidSSDb5e+lDXPzeDhrq2A1mAnbn3wL3sIvWx0O3xtjnkbu6eJVX7Qihb
         vyBZc399hfjbck0sy2SL+6UdLKsnfgDu3PJv+4Hnu/c/29hupjDXHb2Jy/jTgE2Sz+FB
         niTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753770863; x=1754375663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wJ7p1KnoPTtuiUiUre3TQUdtSHj428TRzShsa/CgUA=;
        b=TzAwBwrdQNXLxelQrkmcK3U/NyNld5gHhzYxUFoXtxi8+BuG/c4hNpIyXF+q3ngpUR
         +gwUEDy5w2p0As9LEnZUusOqIxd3EGKTYK3JO+cg69ZiaDxx3IbI+NUSgS2ofHTklzV/
         eWW8IMWzKncWK/a3cp7rM4MKT8Yn7jTwQfmS/qWov86a/o1t7ArP2eAkNnjLmto+iBGj
         vrgo1CF93TTQ/GB2nVT76uFHpVeY2L4MbTQVWgpKaYcg5E/ylpn+bSP37Gx/NN1Gifrj
         HKkvkH747eEM42OcPPouObNhZTu00RPeHWmgrjdGytfsb9gXpThaqmokXJhzcYwxRsoZ
         yxJw==
X-Forwarded-Encrypted: i=1; AJvYcCVzmQlWbdFxmWKbynGa+729KvrIUWPIfU5nlTco57t1LOjyFV4YsghOWrxCX6gma5t0ZYNjx4RSCLMAIL6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5OtTzNcgh54O7Bkzy0IzctriH9HfsQRcfflPhEycz0xKWr8Gt
	nipGVrrzucopcQZGySQsRjChDx021HJib7mm7F/EG+/uZ7Dj619cDPVs33T6G4acAPQ=
X-Gm-Gg: ASbGncs4p2tG/Vuoew08iZLXZjSK4+3mSr44ebUAjuALLDg+kvkasDu/N6Q1DgQUF1I
	zlf5JjlrDreRNRhTgBu+MIBntjin0cC93AklYo70EY2byHGnuUd9xrBrCpqCBSsVSnt+SqTlRlQ
	lcmzXb6SsF6TYMKOq2CLY2N4WrP826EZ8zR6B8SWqqzYS7qS469q7urih81bh7r351e3fAKceyE
	JWsj7knDSHURdLlbLbdN7HAHOlZhwFjU7ezG2kf9hpOv0mhVYVndxdd4DPqv4Gzb3HC+gBmgaJX
	5nem5jFRi5kBYr50CRj5NZ1atxRFl/Qz6bA1FYrvF4PnUQkt+67df4kVPI1uaDcwah6f4YJfxhX
	zYy+UIrtzdoBwrZoAR+CZ0oHCq+D1qq+6eQ==
X-Google-Smtp-Source: AGHT+IHwnRZ8V94I2dIRwpv7xzVyb90S3UZWn2P7FJ9P3VAU65PFBP1DY/UxTAXlXrCCU2xReoJaYw==
X-Received: by 2002:a17:907:9686:b0:ae3:64e8:8c5c with SMTP id a640c23a62f3a-af61b5e8a5amr1548200866b.14.1753770862879;
        Mon, 28 Jul 2025 23:34:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:a1a0:92bf:def8:453d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa32d2sm541086966b.100.2025.07.28.23.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 23:34:22 -0700 (PDT)
Date: Tue, 29 Jul 2025 08:34:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Douglas Anderson <dianders@chromium.org>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC 24/24] arm64: dts: qcom: x1e80100: Describe GPU_CC
 power plumbing requirements
Message-ID: <aIhrav7GKpsbVpto@linaro.org>
References: <20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com>
 <20250728-topic-gpucc_power_plumbing-v1-24-09c2480fe3e6@oss.qualcomm.com>
 <aIevIuMDA5R8igmi@linaro.org>
 <50868cd8-68a9-4bad-99f3-8cf542886fb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50868cd8-68a9-4bad-99f3-8cf542886fb6@oss.qualcomm.com>

On Mon, Jul 28, 2025 at 11:31:10PM +0200, Konrad Dybcio wrote:
> On 7/28/25 7:10 PM, Stephan Gerhold wrote:
> > On Mon, Jul 28, 2025 at 06:16:24PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> A number of power rails must be powered on in order for GPU_CC to
> >> function. Ensure that's conveyed to the OS.
> >>
> >> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> index 5e9a8fa3cf96468b12775f91192cbd779d5ce946..6620517fbb0f3ed715c4901ec53dcbc6235be88f 100644
> >> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> @@ -3928,6 +3928,12 @@ gpucc: clock-controller@3d90000 {
> >>  			clocks = <&bi_tcxo_div2>,
> >>  				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
> >>  				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
> >> +
> >> +			power-domains = <&rpmhpd RPMHPD_CX>,
> >> +					<&rpmhpd RPMHPD_MX>,
> >> +					<&rpmhpd RPMHPD_GFX>,
> >> +					<&rpmhpd RPMHPD_GMXC>;
> >> +
> >>  			#clock-cells = <1>;
> >>  			#reset-cells = <1>;
> >>  			#power-domain-cells = <1>;
> >>
> > 
> > To repeat your own message from a couple of months back [1]:
> > 
> >> You shouldn't be messing with VDD_GFX on platforms with a GMU.
> >>
> >> Parts of the clock controller are backed by one of the MX rails,
> >> with some logic depending on CX/GFX, but handling of the latter is
> >> fully deferred to the GMU firmware.
> >>
> >> Konrad
> > 
> > Please describe somewhere in the cover letter or the individual patches
> > how this relates to the responsibilities of the GMU. I searched for
> > "GMU" in the patch series and couldn't find any note about this.
> > 
> > Also: How much is a plain "power on" votes (without a corresponding
> > "required-opps") really worth nowadays? An arbitrary low voltage level
> > on those rails won't be sufficient to make the GPU_CC actually
> > "function". Do you need "required-opps" here? In the videocc/camcc case
> > we have those.
> 
> Right, I failed to capture this.
> 
> The GFX rail should be powered on before unclamping the GX_GDSC (as
> per the programming guide). The clock controller HPG however doesn't
> seem to have a concept of RPMh, so it says something that amounts to
> "tell the PMIC to supply power on this rail". In Linux, since Commit
> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the
> domain") we don't really need a defined level for this (perhaps it's
> more ""portable"" across potential fuse-bins if we don't hardcode the
> lowest level anyway?).

Thanks, I forgot that we have this commit.

> 
> However after that happens, the level scaling is done by the GMU
> firmware. This holds for allOf CX/MX/GFX. I'm not super sure if
> both MX and (G)MXC need to both be captured together - downstream
> seems to describe MXC as a child of MX (in socname-regulators.dtsi),
> but I'm not really sure this is true in hardware.
> 
> The GPU driver currently first enables the GX_GDSC and only then
> does it kickstart the GMU firmware. Downstream seems to do that as
> well. So on a second thought, since we've not seen any errors so
> far, it calls into question what role the GFX rail plays in the
> GX_GDSC's powering up..
> 

It might play a role, but we wouldn't know since AFAICT we don't support
enabling the GX_GDSC. Look at the beautiful gdsc_gx_do_nothing_enable()
function, it basically just defers the entire task to the GMU. The GDSC
just exists in Linux so we can turn it *off* during GMU crashes. :D

I think we should identify precisely which votes we are missing, instead
of making blanket votes for all the power rails somehow related to the
GPU. In this case this means: Which rails do we need to vote for to make
the GMU turn on? If there are no votes necessary after the GMU is on,
it's better to have none IMO.

Thanks,
Stephan

