Return-Path: <linux-arm-msm+bounces-16424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 729B889901A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C891F25942
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5A213C69B;
	Thu,  4 Apr 2024 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF/N7Jzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994813BC09;
	Thu,  4 Apr 2024 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265804; cv=none; b=Bc3WyYFvWGsyobXmu4kUyRYy3xL2rz0OUhx4nshKRmBU6i6OfxYlZNS/iEGWwUPYQ1Zld6fTJkSgsB49IjByqXVif/OrK3S+9ccmnqH5AmvwoUPw29Mc4IkFH3A/bF2yLrbUL8oJWoutvXp2i/orHFm9Vmcbx7j2Tzpjg7RKgzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265804; c=relaxed/simple;
	bh=MbiEXqECtfE28I4L/YqGCi4YdPjgXndCB5nDSOfoEwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4U1M6oAKd6hPNpE3/dvhObVuvRAnGUjTOYeQ63ykBvGpEUbX2MDX4sAVKh+Dh0RgBLMG8jVGAWpPAbOk18zHdC9fv7UU3l7Wf5n+l7j1r3uFL4lCq01KWtdGKzz5o+/yXbOZ1zzm4foFnwqpG9iBwWxiSXEmDxnb42b4Q4QW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BF/N7Jzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8938C433A6;
	Thu,  4 Apr 2024 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265804;
	bh=MbiEXqECtfE28I4L/YqGCi4YdPjgXndCB5nDSOfoEwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BF/N7JzovTAagOTZHtkNL5Nhf44bvqxKxOfTeurnbJd7ifWXZD4qGmheZ2hAN5NE/
	 5vyX0HAUIabCACH6ok8LXqAzklRQiIOqDWktWN+PzO2m4c5fqQn20LVqRJkXFRUTLV
	 fuC1sSUDJDaK1RL0DEqTkbNsTYy/jgAPjzCFeyL4/YxlbeUv1pPogrZHx5VrI5X6KG
	 Jrvlnc8iPcGZDi2CpCLdXoGDUwDuYwgHFrlN/ln6FUzfNUK71HFpTzKWgLvvrPV9Is
	 uzj0uTBt0yoaMKNDzWz5jZqw8s8JueY1O24D/t91o0Dx+TJoDhclV8VaRSXKy7iXjr
	 vUbnqcdslpVUg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: fix several display-related schema warnings
Date: Thu,  4 Apr 2024 16:22:52 -0500
Message-ID: <171226578664.615813.3296104326825996144.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Apr 2024 05:57:14 +0300, Dmitry Baryshkov wrote:
> Fix several warnings produced by the display nodes.
> 
> Please excuse me for the spam for sending v3 soon after v2.
> 
> 

Applied, thanks!

[2/4] arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      commit: 7fb5680b589d5eae64ada1d917b6ff2dab82f5ae
[3/4] arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      commit: 580701ec27f61e0996dd5fcd23b091b6bf6933e3
[4/4] arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes
      commit: 1106ea2266d11ebd97c3493a0c36a45272bfb67a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

