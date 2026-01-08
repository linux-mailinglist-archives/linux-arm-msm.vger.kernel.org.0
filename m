Return-Path: <linux-arm-msm+bounces-88132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A58A2D059D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 19:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B62A31AC23D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 17:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E382E5B2A;
	Thu,  8 Jan 2026 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKg1kNbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ECE2E3B15;
	Thu,  8 Jan 2026 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894597; cv=none; b=XfkHwCUVBkjzp4ZsS/Q0ewZn+et6v3HG8QX6mNEhptCbP7cKG1lW0UXQf7CmTZU0d23MV9mSBq0gSwNoCFESvrrzVUzGvvrglUqWMWWbBYzLiyswPaeGbJ6WsnW3jlZZXrX3qo/FtXCsCtXim2qSks7OkXfQZqGI5AcfSsyujSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894597; c=relaxed/simple;
	bh=yHXzZ4miF7zh5XwZfOW7e/mH9PaCOotHUPX6zGX/Uos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmGK8y97Z2eu1prHCbZcwCOK43fj2gULz4Sr3rBTuY05dHRWk+uc+Seg/QjKSTIsU8N/lNGaVUBVDUZBP4SkrNtkuIbnVM+6C3+1A/OZ5diC2PPitP+Mhfbn3ytAV9I0dfNb6AkeGO1ULv+UBpUwP7ceTS2UAC+3DIx2Rb3IDkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKg1kNbf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5788C116C6;
	Thu,  8 Jan 2026 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894597;
	bh=yHXzZ4miF7zh5XwZfOW7e/mH9PaCOotHUPX6zGX/Uos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKg1kNbfR7AwjZlLXGLigURd6geItf/1jIcBGUAQTH+bRwf8/Q8/8CCSOmoky3qX9
	 KeCK9KH5x9DbICdcKOqRZ1OVmeysHblEGw8bOMB/mbaJhvC2Sgntiej5Bxg+PI/6UZ
	 XKG9QlGnN9x5K8l7FBDByJLSV7CNjc70R4MOJIKhLbvS5x8c7jGYKNVthyuwGTIn7B
	 +Xi6C3MjUPd2vMQ1Od3L4DUL9pV0nYQJH/mIxKLcneX+0l65StmljCEt4qE1caNvUJ
	 /9Aa4J99EJG+sPw+bYcAVPcWLUephad2ahlaEJV9ncUZCNpzuwxV5HOmszziUICAB8
	 0C0w6a1tJRVkA==
Date: Thu, 8 Jan 2026 11:49:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>

On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > To make sure the correct settings for a given DRAM configuration get
> > applied, attempt to retrieve that data from SMEM (which happens to be
> > what the BSP kernel does, albeit with through convoluted means of the
> > bootloader altering the DT with this data).
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > ---
> > I'm not sure about this approach - perhaps a global variable storing
> > the selected config, which would then be non-const would be better?
> 
> I'd prefer if const data was const, split HBB to a separate API.
> 

I agree, but I'd prefer to avoid a separate API for it.

Instead I'd like to either return the struct by value (after updating
the hbb), but we then loose the ability to return errors, or by changing
the signature to:

int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)

This costs us an additional 16 bytes in each client (as the pointer is
replaced with the data), but I think it's a cleaner API.

Regards,
Bjorn

