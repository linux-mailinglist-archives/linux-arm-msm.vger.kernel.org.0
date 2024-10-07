Return-Path: <linux-arm-msm+bounces-33387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E13992F21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255281C23ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3389E1D8A05;
	Mon,  7 Oct 2024 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arhisDDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0403B1D89F0;
	Mon,  7 Oct 2024 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311178; cv=none; b=uwNH47XpLPGbxHw/Pd66G2CCBGFvnG2fhTfRkaF75TLc+N7X0Srszma+OacRLWcQ1fRfUkN5/i1CmwmNamKzj9l35Q2KXC7SZ0yVfp/gnu52Tbn1Cn3VzMSsjJquafjeMExFdPXXz5Ql9V3GwLaOrTR3W42zl9vd9V6mkHNMGo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311178; c=relaxed/simple;
	bh=wH8KEy7pERDiB2b1ro+1rgsenhn5KPrm+1++yqJVkcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gvl26SYKY7njJNo4Xf/EJSVtChWwzmcA6OLzi2t7CgPMlN9CYOtphiCp5wv/d0iWM/dnJHXVXpYzVqplcuovrT/00WpJYQ82mW7fMXoISizfCDf1H31MuQAYrHLX7j6n9SlfwR00f44NLD7Uv7cQ7Cj5Mp6ddze2RKnFuIQ5lEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arhisDDG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F93C4CEC6;
	Mon,  7 Oct 2024 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311177;
	bh=wH8KEy7pERDiB2b1ro+1rgsenhn5KPrm+1++yqJVkcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arhisDDG6McfndQojURs3dX0GDLhGHwrO412kzpciXBXJAD/MkXkTqruytoU+Smtk
	 VtZcrI1xqrOXcRkSqX69G6lhvaVJP7v4cqOlyCk4t2Z6jngTlxL1QtsTi8KKSGzL6U
	 PFQV2oSGJl4pDd1c0ZphsJupkyyPBWXSAVf99ZZwL5WeiA9UMus1LynkX0Z7of7Zmr
	 bVTiJwOfh/xRa7zuCCwF6xJgG4vGulf12p/0LwjJBuk/TnYcjGimqKoeksAkEiG3SS
	 48PoZN14gPnFOJSeKOuv/Z5/u4tWdRB1PPdTAoJQM5zlZ6hXkdlOjp9OPXXsWpd+2K
	 WfXAkSfKUsQQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: (subset) [PATCH 0/7] arm64: qcom: sda660-ifc6560: enable GPU and WiFi support
Date: Mon,  7 Oct 2024 09:25:51 -0500
Message-ID: <172831116181.468342.15853869019266363418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 07 Sep 2024 21:48:11 +0300, Dmitry Baryshkov wrote:
> Follow the MSM8998 example and limit num_context_banks on SDM630 /
> SDM660 platforms. This allows Linux to make use of the A2NOC and KGSL
> SMMU, making it possible to enable GPU and WiFi on those platforms, and,
> in particular, Inforce IFC6560 SBC.
> 
> Note, while WiFI starts up and can work for a short amount of time, MSS
> starts crashing with the following message:
> 
> [...]

Applied, thanks!

[2/7] arm64: dts: qcom: sdm630: enable GPU SMMU and GPUCC
      commit: 166b955a8d60b38d4fbbb9a18994a49e607ab17e
[3/7] arm64: dts: qcom: sda660-ifc6560: enable GPU
      commit: deac51aedd1e1e5ba0d46f23ef0012a8754e4871
[4/7] arm64: dts: qcom: sda660-ifc6560: fix l10a voltage ranges
      commit: 1dd7d9d41dedf8d42e04c0f2febd4dbe5a062d4a
[5/7] arm64: dts: qcom: sdm630: enable A2NOC and LPASS SMMU
      commit: 41caaf517014d11c17b2e6f3b057f7b6c9507cb0
[6/7] arm64: dts: qcom: sdm630: add WiFI device node
      commit: d7e67846c08f46974da26c54af7793d47037d452
[7/7] arm64: dts: qcom: sda660-ifc6560: enable mDSP and WiFi devices
      commit: 04d8ed02cb9b86a0e231ae0271527fbbfb411695

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

