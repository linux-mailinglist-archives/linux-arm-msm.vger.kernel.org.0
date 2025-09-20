Return-Path: <linux-arm-msm+bounces-74261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C8B8BD5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 04:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E18A1C2114F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 02:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CD6212FB9;
	Sat, 20 Sep 2025 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsFf0vI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7858B20B7E1;
	Sat, 20 Sep 2025 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758335023; cv=none; b=bWPpiPfN0IAa+PwTsup6lL0Ockymn26p3R3dt8Y/RxxNYr9Yd5GBqVfp1dz6qq65VRL0yFilgpF7+klHZhzZTLeq14pYCUMPpTyYlpQBPPPw+fhKHqp9BMmXMMNNZCyOis5XvN4MBTZUKTql3ykTZzKPHlcZxJ09y1SzsnpNxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758335023; c=relaxed/simple;
	bh=fgsoUIP29w2rcYoFOf9ihmp8h1h3DCFxYScd1U/hZAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFa32BDygKD9uAUFeurmQL0vRIrzBIc5hhWvUiuEDyzIFAK6D2sKzp3jqaCLi6H2mMj5VPTtI6aVRAe+mu1Lm1yvgRS5gH6uSonSRZUSfvVCwkBKFc1Wuq2pFRQKPhUeGLo9kF/EE4o9blSnGkzGOPHwvBoPrfS8zmDVmdQZnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsFf0vI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8E9C4CEFA;
	Sat, 20 Sep 2025 02:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758335023;
	bh=fgsoUIP29w2rcYoFOf9ihmp8h1h3DCFxYScd1U/hZAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nsFf0vI/PgJ/KN30pYAJvZEgjzuzQh14FuJQ0sdSukAdR8RtJZlSEWNcnT52o5Coc
	 iAjv0pH/iJX/3rODx8abnUnQumeK9BBsYZI8XQvIej8KSv98wKe/lk+pa5F/h3eIdP
	 gVK/9FcClJtqMl+j5RVAHst4R+NTDexn/LvLlhM3wsYJKskQGyOH0LbrGz5CEnBw8/
	 hiYueMHtAo/BuZJNL3FBSIo1mK1zKooW3rPV+UjMypGn/X7/eKHma2lt77c/jCwK2K
	 LHXduKIatAHokUkYvSL78XgGOKuXTAf9n3NruR8+fI+EUEL9CJvYJDwCwxp1gKUKHi
	 jo/LvYEO0rpGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Gaurav Kohli <quic_gkohli@quicinc.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jie Zhang <quic_jiezh@quicinc.com>,
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] Support for Adreno 623 GPU
Date: Fri, 19 Sep 2025 21:23:38 -0500
Message-ID: <175833500891.491899.13406233219294339363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Sep 2025 12:49:51 +0530, Akhil P Oommen wrote:
> This series adds support for A623 GPU found in QCS8300 (internal codename - Monaco)
> chipsets. This GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Since the last revision, there is a new board support (monaco-evk) in the mailing
> list. But I am skipping support for it in this series due to the heavy code churn
> happening in that file at the moment. For Bjorn's convenience, I will share a
> separate DT patch for gpu support for that board later.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      commit: 0099675695aab4356f7d05c507edb60fe72a4973
[5/5] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
      commit: 9da690f1b649c9900dd97b9bcd78e4a5ec61f2ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

