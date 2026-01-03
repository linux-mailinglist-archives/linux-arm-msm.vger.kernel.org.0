Return-Path: <linux-arm-msm+bounces-87317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E950ACF0294
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 17:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45BD7300486E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 16:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBBE21507F;
	Sat,  3 Jan 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u47nYwSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5A1DED4C;
	Sat,  3 Jan 2026 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456185; cv=none; b=JP3ejt4qs2prK+tb/DLMwYnh+DfkkDRm4gQFFo7nKaJ9M7Ufcc3TGRvWyIXQBzn8i8iPfRQek3PqyeDPisQjBbi9UNqCInpHpsjoDWuzfLjkXbAJqCCepvnZ6GmQl4PDlWfyv6ZahdgnyjnQdhkhOJWINE8OhqL6uzshfbPAc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456185; c=relaxed/simple;
	bh=9dgNMg9WfEeZx00hbAC0YpEF/0WX0CU/tJfCl2/C81Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgIWwrNxgsdPQhO2BFUIkQ5MC/kMNtFaEqLuseta4Fh/N+xxtrSPBSYIkDHYCiyNn7ySYdas77YbgK9CWRF1Av/8QsnYZW/uEn8bItW3Nu3LKemQK3rdOdkLvDOhcYhF/BuB5SdSFTf3gOXD0zuWo2XgW2PdrCFa4OFetK4EU0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u47nYwSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292C9C113D0;
	Sat,  3 Jan 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767456185;
	bh=9dgNMg9WfEeZx00hbAC0YpEF/0WX0CU/tJfCl2/C81Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u47nYwSgrTN2ibSb11P6lUyzCCS9SdK216WggLkh7vqk0mULVB+w6xd4Vb6sMBQzY
	 GSoja3ibvJhEBeapjpLBOLNeCoYr5gbEMdIh16wXyRzDXuPV8b0Yhj4w5RGg5nZf4b
	 pBV31pCYb1kj2s2v23MZh4SWNzEk9AnAZ6vXn9OAdTlpdfRjSsxE6ukg8B2IpjRgpa
	 6WDeYMMLoNXR0lQg6Y60AZzYGsthv36tbmexfwm4ziOWv/j5ohSFxzwkqBx7iefx/L
	 J3/3f2AQeGRBNNpc8/VcmvTTIqwamLtcqtOPEnOgsZRX6YWpwpkBXaiP9yl7Xs3O5d
	 5GKcd+YVliOGg==
From: Bjorn Andersson <andersson@kernel.org>
To: Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Connor Abbott <cwabbott0@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Sat,  3 Jan 2026 10:02:55 -0600
Message-ID: <176745617461.2631416.12790593319351767238.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Dec 2025 18:03:24 +0530, Akhil P Oommen wrote:
> This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
> chipsets. The closest gpu which is currently supported in drm-msm is A660.
> Following are the major differences with that:
>         1. gmu/zap firmwares
>         2. Recommended to disable Level2 swizzling
> 
> Verified kmscube/weston/glmark2-es2.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: lemans: Add gpu and gmu nodes
      commit: 6940c66825e4c27c53b33e367806ac1dc922583d
[2/4] arm64: dts: qcom: lemans: Add GPU cooling
      commit: 4a6488a8070b95702d6f5dec444fbddfaaaff8cf
[3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      commit: dbff283922e32eaa3d81233b69c02ef2abe7ee9b
[4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
      commit: 247b55ddf76ee65b1a63e5c834341a07996de07d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

