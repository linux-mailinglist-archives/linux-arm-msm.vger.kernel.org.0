Return-Path: <linux-arm-msm+bounces-43388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E69FCCB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8384E1883282
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206181D90B6;
	Thu, 26 Dec 2024 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjYgY1xD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88EF1D90A5;
	Thu, 26 Dec 2024 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237644; cv=none; b=hs2djFEW2McnJI5XwFAMpQ4Wrwl6hoROI0TmpTeGtAbCpsw1tC2pKkKX7a5Glk17bcxaLtM5NlJiAslVWEnRk/JUX0OhXONl1CcHfF/ERO4f1ZUUnr8SoQBZ3emIb9smlSBasM06DfmR1EEtBGEo1Q2TZgzFLgtFAJvwaMrO0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237644; c=relaxed/simple;
	bh=5mmowJ1cVox9CjJyIMyxJWx85DXh/Llzv9m04ocdxkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OJkiZJ+o9Q4JRF80E/AhhWz2a+BNxHp/WdeZDqB5rAY0qLSdmIsbVJetLnkCgTIoBoty3viyD/f4Z5eLDJUXB9G8H9hyZf4NuHszGwVlVLOXBdXXa5dbrnDR2KHxbvNxZkgGJUxqB0TNzBViw9DY1fDuQHZjki9uNGT0qrgRksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjYgY1xD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7365C4CED7;
	Thu, 26 Dec 2024 18:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237643;
	bh=5mmowJ1cVox9CjJyIMyxJWx85DXh/Llzv9m04ocdxkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjYgY1xDHRzYzlA3978cYpP8B8JLR6t0W6Hv7u25D+zzxLRs4MYK/6FLKi8s8VSrv
	 FvGRBHAl1SdhBOxR6YnW7ck5eOOVQxSCGBM55UHgY6nApIvQJp6+754qVX4WmayLUe
	 N3HHMk/ejhxFB2WA+u4+c/EEtbmEgAIkJ5ce9nkRGvT6qevhhkzGk8VxeHwEvEP6Jj
	 sQc+eM5onpQVTN2sW/7H8/pCLkG8zpXXtScSRN9gxxfzm5eKt8UA/KmRABF5M01LGK
	 loydAyspEsU4q+czHzrAQY68cHkEL8unYw68uJyCG1e3rE+/s8EtEvhmmXjofR2Hzx
	 RQ8b7y37fiolg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/4] X1P42100 bindings + common driver bits
Date: Thu, 26 Dec 2024 12:26:41 -0600
Message-ID: <173523761373.1412574.7598695268533938221.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
References: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Dec 2024 13:35:59 +0100, Konrad Dybcio wrote:
> This series brings the board/platform compatibles for X1P42100 & the
> CRD based on it and adds them to various match tables.
> 
> The DT itself will come in a separate series, as it depends on some
> more changes across the tree.
> 
> 
> [...]

Applied, thanks!

[3/4] soc: qcom: pd-mapper: Add X1P42100
      commit: e7282bf8a0e9bb8a4cb1be406674ff7bb7b264f2
[4/4] firmware: qcom: scm: Allow QSEECOM on X1P42100 CRD
      commit: 6994c655e1252049007973fd641e6a26f94c420b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

