Return-Path: <linux-arm-msm+bounces-89094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90ED22379
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 04:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E735302BAA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 03:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83287286416;
	Thu, 15 Jan 2026 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5sRyKeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12427CCE0;
	Thu, 15 Jan 2026 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768446009; cv=none; b=n8CNKL1BkWdvRAjEyaclaD7z6zgluf3bq2xZT2Kvoch4vleb9uqVcLcpoBOWGq2DRo+wQzLu47H4jojZpycd+v3LShhMFzkXbqPUdl/ZUCmQe46ki2pu1O9tcOHgv7Bub6gSNSYPwlDgL/LBU51ChC65v24kO7IMIza0np/GAo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768446009; c=relaxed/simple;
	bh=8009av0T/l3R7imn5/vZj1JvTowoP4HVKgq4Jvr3i1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPgWt+simEp+JWHve9BKH9qfjm6Rd1sLHWNDj5NdghJC7Qap6jKTlS3IAbr4m/KDHAw6+NXt0rirXm/dJEx5PARubvCf7lkpyA0q/RH+zClTR1o+nGs/VuaXrICSXaDgpJ/vDEDHEg3v7VAObNaLxX30bYY7uGbgUbhxCllbzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5sRyKeT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D411EC4CEF7;
	Thu, 15 Jan 2026 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768446009;
	bh=8009av0T/l3R7imn5/vZj1JvTowoP4HVKgq4Jvr3i1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5sRyKeTV/pwiZo7EpP0+Jl3swaLCr8lx8uB48JzAC6AK0gUOD2O7KzOsXYlidAmc
	 TeWqA3ksd51agv8D15cMAtx+nxLbcox3nrMJZE3Tvde9tedLP1EIII7YRc8CwIlzOt
	 YC3IxBO3md5ZZ5PoieTIQ1aZwCiWo1QFWshmpZDRGdoUaBi1ZY3xpWlE+j/NthgexG
	 gabpEXpRlgW3N5etfRpQ3Mzxo2ldZ0LkB6KLUGeK06Pp5QoIaF5lXOmJDL8Qy+QRjL
	 +xqEMI+huCOQfyL24lwGOFBT6bJO/Cc5/7jEk6JhbRPhT5z7vLC3YKO8YobPoBbiZj
	 Yqbx+Eh/RxXGQ==
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v5 0/5] Support for Adreno 623 GPU
Date: Wed, 14 Jan 2026 21:00:01 -0600
Message-ID: <176844599496.144315.632973922304964900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
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

[4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
      commit: 96ea45304d786f6bcf4b553a05eb90675bc0f2f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

