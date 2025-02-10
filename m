Return-Path: <linux-arm-msm+bounces-47498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41061A2FE5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 00:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8938E1886D0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A36260A42;
	Mon, 10 Feb 2025 23:24:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5110264607
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 23:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229870; cv=none; b=k+s/HjABcRQf+1sqGOiXI6CzKzu/ZdJyNwZ7ECLkaDmuOXtdKDCjuDsoLRwJGHK/Z6amkAcdafiHkfMK1nMjJyArNp+Lm6pdh/EOFRcigbEx4erMofcsAc9Qy7k/V3qkBC1qmSKbJmqmb87RdC6AGzB2Gjp4DlOWuptnmrVH4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229870; c=relaxed/simple;
	bh=bJ5ESZYzG58v/d6J2EU3atpmIcpZBlSODiSwEgznITE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDn+vQXpym+1mc12z0DNsujJWt3801QIc3iNvvw/DTVOn5al/lPLymzWEdopdbxn1JVJnsyLHIuVUvRGFIbnHkHudhPkcUz3eeDJD98PIGv4axy7yGGIE4EvTPlcjQPtvoBtnLZRsoNcFRTDFnomXu59ZgkJnUC3QNWg2O3JDzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 769443E8E6;
	Tue, 11 Feb 2025 00:24:25 +0100 (CET)
Date: Tue, 11 Feb 2025 00:24:24 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	dmitry.baryshkov@linaro.org, sean@poorly.run, jonathan@marek.ca, jun.nie@linaro.org, 
	fekz115@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <oexunzihzwxux6aitpfpgpljhn2lndzqwnx5ruu3nzsahd7gzm@ttr6fuya5ncu>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
 <bcba3d38-525e-43d8-936f-2ddc95d0cceb@oss.qualcomm.com>
 <e9ab55d7-bd2b-4241-bd40-322c2beb97d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9ab55d7-bd2b-4241-bd40-322c2beb97d9@oss.qualcomm.com>

On 2025-02-10 18:13:58, Konrad Dybcio wrote:
> On 10.02.2025 6:10 PM, Konrad Dybcio wrote:
> > On 8.02.2025 11:09 PM, Marijn Suijten wrote:
> >> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
...
> >>>  	dsc->simple_422 = 0;
> >>>  	dsc->convert_rgb = 1;
> >>>  	dsc->vbr_enable = 0;
> >>
> >> This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> >> dpu_hw_dsc_config(), which has:
> >>
> >> 	data |= (dsc->line_buf_depth << 3);
> >> 	data |= (dsc->simple_422 << 2);
> >> 	data |= (dsc->convert_rgb << 1);
> >> 	data |= dsc->bits_per_component;
> >>
> >> The original value of `8` would overlap with the lowest bit of line_buf_depth
> >> (4th bit in `data`).  Now, the 2nd bit which will take the value from
> >> convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> >> your new bpc value of 10.
> >>
> >> Can you double-check that this code in DPU1 is actually valid?  I assume you
> >> have tested this panel at least and it is working (worthy mention in the cover
> >> letter?), this just seems like yet another mistake in the original bindings
> >> (though the register always had a matching value with downstream on 8 BPC panels
> >> for me).
> > 
> > It seems like the lowest bit should be set iff the input is 10bpc, the
> > current situation where our '8' bleeds into the following (correctly named
> > fields) is bad.
> 
> See also
> 
> https://github.com/Wikidepia/kernel_xiaomi_santoni-4.9/blob/master/drivers/gpu/drm/msm/sde/sde_hw_dsc.c#L67-L80

Correct, this is also what Dmitry already replied on Sunday and what I
formulated into a patch earlier today (now sent), which I hope you can ack.

- Marijn

> 
> Konrad

