Return-Path: <linux-arm-msm+bounces-21998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B11D8FF637
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 22:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8037B1C22257
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 20:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313D91990C7;
	Thu,  6 Jun 2024 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAKR5WhD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3A198E84;
	Thu,  6 Jun 2024 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707446; cv=none; b=V32gqKvUrkiq+47yzysKMRN9FQe8hY0jA1UMjaCSpCdNE36Oa21A7K2TAgYup3IMyDjNo3yJ2PsftEtLrZZa12vKjuQhQ2egpAfVhEKB5vS24Tm0FBj+v89daf6Wq8r1+3XZXPAdeob1IOrw3WK53IeR0CVizffq3RaVdkxxAEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707446; c=relaxed/simple;
	bh=wFqALVp5mDtWf6L9b+AXIGvzv82kunIA6A0exDovdCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ny8HcpW93zzGe8OzDzeteUsdASQtuyJWHaWKqCGvFjOWAJNf/jT6W9Tb6uXvJg8DJ9bwWZqziENmLBXFGbHcbeoHWJo1u0cHlcqWXI3QbyNdEyim2Uvx4FH8l0yv8H/rZ5AmDhNeS7+HzL7H7h6XqKnKt/6SCqoInY2s+V4LhLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAKR5WhD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A020FC4AF0C;
	Thu,  6 Jun 2024 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717707445;
	bh=wFqALVp5mDtWf6L9b+AXIGvzv82kunIA6A0exDovdCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAKR5WhDlunhA9NWxm1kfJnmaRG2JG+wyLkKwAhHP/2IXemCWbKsBZfQkUkIyjZRL
	 AbOSc/7rI2Zaauv9CTBPfbfWVB37oQ1gpaP7y2O98CRg16JmYGqnXNuTH9kUl0Evbk
	 CG+iUN3wbeQgZa10gvS/EOvmna74D6XRrM3oe4rqQB2s2pWDmwGJf5rgyhiOhMzLj1
	 k+bx+A8435kCdTvJAkNGwdjFccJUcfscjGVhAZ+Zax4OMu7uBlj+Zm1mWMU+hI26Zc
	 IZYZnLRIcf5xvEjqsRJXNo6vejmHiM1Pl3Tkb91KeF+Ts0tnUtKJAv5DMDcsmMXuTD
	 ZWYqhIZlEBF3A==
Date: Thu, 6 Jun 2024 14:57:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-phy@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	Arnaud Vrac <avrac@freebox.fr>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <171770744191.3848297.2891281220885073312.robh@kernel.org>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>


On Thu, 06 Jun 2024 18:07:48 +0200, Marc Gonzalez wrote:
> HDMI TX block embedded in the APQ8098.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  .../devicetree/bindings/display/msm/hdmi.yaml      | 28 ++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


