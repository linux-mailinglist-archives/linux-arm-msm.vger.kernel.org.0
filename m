Return-Path: <linux-arm-msm+bounces-80037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D4C29475
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 19:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E589188B9C4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 18:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE3A23EA80;
	Sun,  2 Nov 2025 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrMnuunD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87823D7D4;
	Sun,  2 Nov 2025 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106788; cv=none; b=ctXTYySDoBjCxd/NGsDNKzXhPcfgrZiHM8fC2yfEHEHp/Jd8XvwyIh2zQ0MY+INQTU8bQ/7JFc3uohC4yE0c24vnENWhFH2dI1bL1ggQHgshY42P4+vrUpjexZGl+PhfPXrlwpNvjLWGGptJzioZAgI6uD+abrU8o4p9WuJhty8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106788; c=relaxed/simple;
	bh=Uc53SLqHzsBlkBueUCrgtX0KEHqZMr4grhI/sKaZna0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldqu+2IsDmQIduppYUA0lVi8eKrcLBEm67Ize4pBz2SPHgG/jAXU0iOm+u0vs1mIUc4dCF42YUvDJI0t23mqsqq49H+OgR5qLZDonh8k8n2v1DD+VwX/WcjKiZfc+1PWKProHPodxjq7yYzoBEk56oKe64YGfcX8U6HHB4p23K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrMnuunD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEFAC113D0;
	Sun,  2 Nov 2025 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762106787;
	bh=Uc53SLqHzsBlkBueUCrgtX0KEHqZMr4grhI/sKaZna0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FrMnuunDLA+9kc1/i+JumSXmoSANt6p2YCYKnMv9qg6gwcdm5VZhtZqBb1Jxu7Pab
	 1SNqly69mG/pIkmpGcyZBhE+4jaP053Rhk4QExkXnt318SpyYtjRkieAc/KIp2DmoN
	 TexMzu09+k7VlrcDYhguj/Ng8grJa58xTuNIneKLBF2rcPi5MHgtrpkXIoBnlZszAv
	 727IQ77CtAzjXJy9LidrMbpQsQA5zNTm8Dn5RQcql5HxcgupJojwy6aH4xmO3869g3
	 KNMEkVukBXCrDgdSTjxvnpoK6QQmIOMstX0vxT1pUrOO5mIX3yOPa7mO7F3SOPyEnB
	 mYJq9mW+T+gcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for qcm2290, sc7280 and x1p42100
Date: Sun,  2 Nov 2025 12:09:45 -0600
Message-ID: <176210698627.937813.1347882402480558851.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Oct 2025 20:20:12 +0200, Dmitry Baryshkov wrote:
> Follow the earlier example and rename several more base DTSI files for
> the platforms where we have (or expect) several SKU ids for a single
> platform.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: rename qcm2290 to agatti
      commit: 021df9dee9cd63eee1cfae1bb2381db11a1a45d7
[2/3] arm64: dts: qcom: rename sc7280 to kodiak
      commit: dd6edcd7d3e42b143a2f86e8d30ded62106a8972
[3/3] arm64: dts: qcom: rename x1p42100 to purwa
      commit: ef659a5bd91bed7fae2c2a150f8ecca06599ac03

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

