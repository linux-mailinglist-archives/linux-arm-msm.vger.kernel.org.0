Return-Path: <linux-arm-msm+bounces-87731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B221CF9F94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D601305DE4E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B25434D386;
	Tue,  6 Jan 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQiYK3UX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F226234574B;
	Tue,  6 Jan 2026 17:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721979; cv=none; b=MoYkwKsy6VuJf+bBnbd7ugDTgemeacn3rzFYftByqRKscuIch55KSprVJyJD7glDA2yVj9nyYMIOK3NRclII7xdqQ5T3r9zWeXavtXVuSg2wVaWe+XZ6AoJzeuxZlqHRB00ByKBNVbLJOW7eBj3iLlMUlqbDHBpZoXl9GZCpwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721979; c=relaxed/simple;
	bh=J49Ah6r3ppiaT0Ccz51lpd4pEOWs7B7UD75ItEoFIzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oE0mtt7ueMVro9/Zl6VlMU3WqQqUjD3pbeytgQkuJLw8cHBYfT7sa2yqBgLfP6wqoLOEe1fH4OHd7iUedGNwwpymAi5zqQbn2261Y9MyLeAKq0TBF1S3+X1nIDGNYC0gYLwo2EBQgyuoIWTRKoSDdOzvbJBBv/gv3mzHcsKTy9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQiYK3UX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66F5C116C6;
	Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767721978;
	bh=J49Ah6r3ppiaT0Ccz51lpd4pEOWs7B7UD75ItEoFIzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQiYK3UXUjhruabV0TEB87eqcDD8yGQHz/zC5Qr6s9pFNQMNkOrM2Gu5bIL9b7dgl
	 eoQr5tItFOr4rqvdfUbcoXExCZE2DqcXquPXXkQj+ZhlZo5+PMJMNWqP59Ud+NqmBc
	 UUjeIiSMbVzoz/eYmAgkxHosjp7HjYXJfO4wfareJzA/LNN3sOu4w0DzHR3bU0QiSD
	 nHbiI24Dv4FYKUawiWsFHdxVyHJGPAHzdEBSlNKBvwChhcvg8uq8bKUgAUz5FMtdHg
	 Nu0ZUFDI53GPBDxqKyvXG1GzLm5D3RBBWGHGOZkj0fP4RKmXjH99KtPMHDquLdv+r1
	 7XaURL/dJMkiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	fange.zhang@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	li.liu@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/4] Add DisplayPort support to QCS615 devicetree
Date: Tue,  6 Jan 2026 11:52:52 -0600
Message-ID: <176772196932.3106040.4674734843475910105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Nov 2025 09:33:22 +0800, Xiangxu Yin wrote:
> This series enables DisplayPort functionality on QCS615 platforms.
> It introduces the required bindings, updates SM6150 dtsi for DP controller
> and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with
> connector and link configuration.
> 
> Depends-on:
> https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
> https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: talos: Add DisplayPort and QMP USB3-DP PHY
      commit: b7ad04269d6825b1c88de17e698a356bac5f3197
[4/4] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
      commit: b5a3112bfd5742a5d831c0bdfac2cf6e6796ac9d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

