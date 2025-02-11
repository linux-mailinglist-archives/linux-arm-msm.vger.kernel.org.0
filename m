Return-Path: <linux-arm-msm+bounces-47629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E95A31281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 18:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B63053A3D17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E4226139F;
	Tue, 11 Feb 2025 17:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="DwIB3aVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C4017C91;
	Tue, 11 Feb 2025 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294100; cv=none; b=e3pOAtyrSHDpqX4Tju52h4Bp1aKEIqTuaVKyO8s+KBfwjpWZFiPsgAtwKNqu3SzjlYY93MOAecD+Secwkft78jMu2jXSVuqgLwe/da+8RTApMhlAMprhfTI19f7jcd3ErmkCxgTtwwF+q5CEmZNGTIK7hqHzZ0zFaLZXFJed9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294100; c=relaxed/simple;
	bh=t66d/4AH1fgVYpjkiv6cVclNRKcllufAF+iU4xKquLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYZX6WmDLgZInf8AyroMBEPvfZor1paxYJudP9tWJQ2G3Iyun+fhKk3tnBNsxYyOHmAQSWEkpQD3Ltx4wDsrw01Kp9ta8fFWGPGpbc+L9qqy63c5Op+WID//LfpgKbfPKajCMqPoMelXMICom5/QgsyJK39/ixoV9eV3dSICGD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=DwIB3aVu; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739294090; bh=t66d/4AH1fgVYpjkiv6cVclNRKcllufAF+iU4xKquLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DwIB3aVuQIyquiaqd/suVGZYHsw4zDypWZsBvl0VHqeEQqHQNIfZrvYwqW1vzjujr
	 ZwBFItpsWDKwdbY2ptfB6mlP/eDkDgtwcNX6jrDpzvETBYpzDGBnuEwk5A8eXts2n4
	 t4DvgA+aX+ipNWe85je37fRSSpKLxPnXrnpqiYHo=
From: Luca Weiss <luca@lucaweiss.eu>
To: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com, ~postmarketos/upstreaming@lists.sr.ht
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject:
 Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel and
 GPU
Date: Tue, 11 Feb 2025 18:14:37 +0100
Message-ID: <12605108.O9o76ZdvQC@lucaweiss.eu>
In-Reply-To: <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
References:
 <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-5-danila@jiaxyga.com>
 <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On dinsdag 11 februari 2025 14:31:14 Midden-Europese standaardtijd Konrad Dybcio wrote:
> On 3.02.2025 7:14 PM, Danila Tikhonov wrote:
> > From: Eugene Lepshy <fekz115@gmail.com>
> > 
> > Enable the Adreno GPU and configure the Visionox RM692E5 panel.
> > 
> > Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> > Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
> > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > ---
> > Note:
> > Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
> > ---
> >  .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 53 ++++++++++++++++++-
> >  1 file changed, 51 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> > index a5cda478bd78..cda317b49d5c 100644
> > --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> > @@ -52,6 +52,8 @@ framebuffer0: framebuffer@e1000000 {
> >  			stride = <(1080 * 4)>;
> >  			format = "a8r8g8b8";
> >  
> > +			display = <&panel0>;
> 
> This is allowed by bindings but doesn't seem to do anything

I believe this exposes display dimensions to user space also via simpledrm.

At least I was using something like this before panel support to get phosh
to scale properly on postmarketOS.

Regards
Luca

> 
> > +
> >  			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> >  				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >  				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> > @@ -757,6 +759,10 @@ &gpi_dma1 {
> >  	status = "okay";
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> >  &gpu_zap_shader {
> >  	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
> >  };
> > @@ -823,15 +829,44 @@ &ipa {
> >  	status = "okay";
> >  };
> >  
> > -/* MDSS remains disabled until the panel driver is present. */
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> >  &mdss_dsi {
> >  	vdda-supply = <&vdd_a_dsi_0_1p2>;
> > +	status = "okay";
> >  
> > -	/* Visionox RM692E5 panel */
> > +	panel0: panel@0 {
> 
> Is there going to be a panel1, too? ;)
> 
> Please drop the 0
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 





