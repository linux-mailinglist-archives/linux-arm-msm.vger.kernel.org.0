Return-Path: <linux-arm-msm+bounces-37671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1A9C5ED8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80CFA2844EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8368E2123F8;
	Tue, 12 Nov 2024 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCl/GbkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5810820D51D;
	Tue, 12 Nov 2024 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432230; cv=none; b=bbnJJ7YB7I+SuDdY+Le4klsVvqdoPO31drvzKkmqPs2IPRmrS67i4PMGV73Hmqvx9FTSGKb4PwqKliHSmnQWXzATxMq/Z+YB2OM4DSdZC3Esy3/ihrCIJAJkq3qoTNc25bbSXV28+5qoyAg66Ju1g5aex8KCIYLxFzxt6rJwuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432230; c=relaxed/simple;
	bh=jyQE7k/6c/dBc3Apouli7VA/k4uP1aAXmM3lQ9MxKxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmsO2SdpIgwWkky4bGIHzeGdUlTXhZ5+K4ed2a867wQrB8qnl+YeCaq2OKYTbKjrMetdNyKK49FujlCWame3ZcL6Mjn1mJ/O5I5VWAoazRD1TbCCs8LUeln0ReWYjKh4FzRMyzFDKtLgzhjlyt8wMMIAhk6POdeHRuLaxuP6J4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCl/GbkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E4EC4CED5;
	Tue, 12 Nov 2024 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731432229;
	bh=jyQE7k/6c/dBc3Apouli7VA/k4uP1aAXmM3lQ9MxKxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCl/GbkGFUxoMLIcmnRInE3FKwHueUiQEPbIchPB56YosGF95KhpDv7GuryB3TEdq
	 BMLCvz0bPpyOG4mQtBSTaqLOrp1zjFLH1k0XBx0i0dmR8er6QPQEDNyuxHavUD101w
	 BP6ynFrrvZf3exL5B0t2mquFtZ7xv2pVfqnclCi98btYJLA6q+r7chnPtNOrp8GOss
	 +OyNOQIsHVOqBYJX2bxCaz1qUBdKqXQX3pmuVJ0R2Vm57/vVNDk4atpk3tyYgjRXLR
	 /kRcu6X7JK2yUkuo9o4iRNkADv3EHXey6w3EHfegV7jprfxoeKY5E6VpnKnSZQojMc
	 lkshka3cMqa8w==
Date: Tue, 12 Nov 2024 11:23:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mahadevan <quic_mahap@quicinc.com>, freedreno@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: fix the
 example
Message-ID: <173143222666.1391520.8375595672068197152.robh@kernel.org>
References: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>


On Tue, 12 Nov 2024 05:21:24 +0200, Dmitry Baryshkov wrote:
> Add p1 region to the list of DP registers in the SA8775p example. This
> fixes the following warning:
> 
> Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short
> 
> Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


