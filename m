Return-Path: <linux-arm-msm+bounces-21833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE48FDB09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 01:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C39E32871CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 23:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9544716C443;
	Wed,  5 Jun 2024 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVHGkrdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0EB15FD04;
	Wed,  5 Jun 2024 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717631717; cv=none; b=WjVsJKow8mePVJBvbJUJAeeDKW3dc/jh8LtjM5m2pPkRnpef+OVTuXsoRXCHVOb8/LRO2Ya9eo0XzFheEVoz3axEoHsurDcDIY96ebd+Ny51/U1JqT7YASdgKW8eWtHwUnBVaghI2sJLBL/PoVb6rumyuXf41rrPtYcRGKhZnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717631717; c=relaxed/simple;
	bh=Gr6FdP01TYe9geaqfK/BaFTzGY/PrnX38cvxMniy4hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1L7oSdA4/b0uvWHDzG/CC0PCFhBhIVwJwVW80Mj5fqUUAOF+NPbC4Xfo54ob0wSdtxYNLxephPbAaOGjf1pUvT/zflphQk9gEsMr+iwvMDuuD4kypkLQ8902a/E9tu2xq/44Hhqmfk0GQJuUZhGfWe/GW550AqpGEnUWq87oBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVHGkrdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B62C2BD11;
	Wed,  5 Jun 2024 23:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717631717;
	bh=Gr6FdP01TYe9geaqfK/BaFTzGY/PrnX38cvxMniy4hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVHGkrdpd9qHNUWrmVey1+Z4TOHxukh8sDqQUzLuW6femHynJhOr1wmLOphGbKF3T
	 r/+MpacL7dq8FUSX58NbayI/AsXFOpwOFmQskFRQabnTXXmPLV7iOz0pT0HIsI58Yz
	 nEFwLJehvnODFvQ0CU/eiivdbYHl8co2g0HTPYmjFLLdnl9KC6Ihdk/4wc2iguHv73
	 vIEHYwJPUfNpaVGj0Yo1I27TpcxfFkBHIpdPsNc1W4TutRLRNXebHcc8ScQ2ApIFPY
	 yvVOxeDQP11ScZjdTKGWCX6eLansVtZUx8oPxlhipWJmQnXcSMXm0covUc6W2BnQkt
	 iEZedjuY6xy3Q==
Date: Wed, 5 Jun 2024 17:55:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sean Paul <sean@poorly.run>, DT <devicetree@vger.kernel.org>,
	MSM <linux-arm-msm@vger.kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-phy-8998
Message-ID: <171763171236.3460607.686734211960496313.robh@kernel.org>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
 <c1f26026-dd53-4082-bb0b-c35db2d17fb7@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f26026-dd53-4082-bb0b-c35db2d17fb7@freebox.fr>


On Tue, 04 Jun 2024 15:46:03 +0200, Marc Gonzalez wrote:
> HDMI PHY block embedded in the APQ8098.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


