Return-Path: <linux-arm-msm+bounces-43441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 771779FCEBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E16E160587
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC221C07C9;
	Thu, 26 Dec 2024 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="be8VsyU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD11BDA8D;
	Thu, 26 Dec 2024 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252760; cv=none; b=JSOge4/8nSbgyBey+kaskGC+cH1d42/uRtOnHg2AuHqAFNPSp9P61JZn4FBppF6Yxw50rNB+VkjGXG08DS7Nn5bPCJqAeC8TzKzLX67PiW/SwO00E3omx8xfurNgdZAXNXzkmnN31JMEmDZ32ldjEfY4Ie7mwj9eT/gMNC1/baI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252760; c=relaxed/simple;
	bh=IA7k5C2AS+nLKhVxq0RIAeQWDFWdSUNqLZjob+STCgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5D+paFGGj2YrpEaW+tXSaP5zgutDcHKL02KDPbGXM38o63eYkP1fQ6/PjjF/ujdLBrbHsR0PzY764USb/FGAbxmOCPzVmS5sgSqBov5RR/TECzibrvOAXxBK92oli/h7KaatBaX8axUVPKZPb7eCau8PSySTlr7BVLM+JgTsd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=be8VsyU4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8157CC4CED3;
	Thu, 26 Dec 2024 22:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252760;
	bh=IA7k5C2AS+nLKhVxq0RIAeQWDFWdSUNqLZjob+STCgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=be8VsyU4/0n/4r5iNCubsQ/IrvULAPBPcO24RnxvNVoCzNuCdNG4wE3mHHhYKhin0
	 jajp82e5CfszRKhbFrmiZStB9twHYmTiCsij4mcguEKiuTo/lYnMugPzZ0+DEGMFI7
	 438blUtRocOkDYMMyvJaWU4/flu2plXVqu8/WMz2UzVHztAzDSEe3i/e8c/fv6Thrp
	 LDpbzqvj2BRPMD0dTN62zPx1JAhA3Bi9sVQmyNuq0dQUIEk/NNBndXVrG70ujX8aXT
	 KwsXJ9atI25p/9wVsCsnfueMGxe+LI9Q0lYuFMqmE434Oo+bydbC0N7L7Wyjh6zcUg
	 nC2Rr7d331FkA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/7] drm/msm: adreno: add support for DDR bandwidth scaling via GMU
Date: Thu, 26 Dec 2024 16:38:45 -0600
Message-ID: <173525273263.1449028.15610576942299813913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Dec 2024 15:51:13 +0100, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also vote for DDR Bandwidth
> along the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote parameters and bandwidth to
> achieve full functionnality.
> 
> [...]

Applied, thanks!

[6/7] arm64: qcom: dts: sm8550: add interconnect and opp-peak-kBps for GPU
      commit: 1ba40079267930643eade4282258562085d4319d
[7/7] arm64: qcom: dts: sm8650: add interconnect and opp-peak-kBps for GPU
      commit: 63c21d61b46197b6295e12dbf29adff29c18ae2c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

