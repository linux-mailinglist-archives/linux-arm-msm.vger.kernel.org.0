Return-Path: <linux-arm-msm+bounces-79049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81EC11CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7961A65E3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50CE343D89;
	Mon, 27 Oct 2025 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePn8CGFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FF343D7A;
	Mon, 27 Oct 2025 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604517; cv=none; b=muzO7QNZf0Dfuq56bzIACDq1KE+3PmZIOlTXREIf3lK690iq+P6Pn5V+eWX3k3ecr6Mv1kAhKJT5z9Gy0hltV8D8E4VOB5DGXIfxYCPYUoXdoczTWPC8K2lG+UrUKoT7xdLm35hO0DA2x81QNXSSe4g63aDlcnGVS9Z/ZKx3wcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604517; c=relaxed/simple;
	bh=CqIgISHBmyfGGfxV7Lybzm2LLLi/F1uI/qlSDfiGTyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hyrCJLAqQs6tRV7PrQiHzG4b/2xFdr/cVaFQdTzg7C3LO6FWlyYhvvi3vY5n4+xl3E/wR5KEPKyKSDV3pG3uUaO1bsDwkVgJqnrLsXu8GhGPdkVO07kkpo18Iv7eLNE6CYGM1xtx65YNFi/GzChNorYSGtRycE+etjd2x8GxF7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePn8CGFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951BAC113D0;
	Mon, 27 Oct 2025 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604517;
	bh=CqIgISHBmyfGGfxV7Lybzm2LLLi/F1uI/qlSDfiGTyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ePn8CGFxFh/pPIUg4LvBHFxXryW7+ER4CF+USVlwn3B/K5q8ipqulpvVaJrNbMcH4
	 Nvm4piiq9FHbVDtmBF81yfl0L/dbn2fkgLmtrLjtRSleiNreeFGrah6pZ5Whxc1/Js
	 +Yz7AxrkFQNKVQ3vn0spQyW0S0yewJ3r1aUZMnQAF658A/3bvm9l9rAfl1gC9bAhGW
	 qwAflN09d9R30TB17cNOnqAiOWu/nASmEWfo6u8EYkGd4fccC2pXt6KbsUtCSzO3H6
	 UpF6LJzCya0VLnZiDrA4+foDGDkYsOOFARp54fc10gBJrs4gJy+E24x3G3f/bUxGX6
	 5QoyuTE1DlcNw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Mix of dts fixes and improvements for qcm6490/sm7325 devices
Date: Mon, 27 Oct 2025 17:37:10 -0500
Message-ID: <176160465205.73268.8879594151222623953.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Sep 2025 15:57:00 +0200, Luca Weiss wrote:
> Add some fixes for Fairphone 5, and use correct compatible for
> lpass_audiocc for qcm6490-fairphone-fp5, qcm6490-shift-otter and
> sm7325-nothing-spacewar to make sure that driver can probe.
> 
> 

Applied, thanks!

[1/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies to simple-fb node
      commit: 3d4142cac46b4dde4e60908c509c4cf107067114
[2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add VTOF_LDO_2P8 regulator
      commit: 99dc57012dd67c251cfbfd0ba501ecc524b621fc
[3/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct compatible for audiocc
      commit: c207f5319d17ae2d8447c89ef32e5d297709f222
[4/5] arm64: dts: qcom: qcm6490-shift-otter: Use correct compatible for audiocc
      commit: 1a3051614f6d0e0e9f5725032ebbaa434fd1aec3
[5/5] arm64: dts: qcom: sm7325-nothing-spacewar: Use correct compatible for audiocc
      commit: 037f0f59bb0f43bda3d3f0892f9bf65a64c173e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

