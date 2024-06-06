Return-Path: <linux-arm-msm+bounces-21843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F19748FDD50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C168B23616
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FDB38F9C;
	Thu,  6 Jun 2024 03:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTyqNmLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1338DE9;
	Thu,  6 Jun 2024 03:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644043; cv=none; b=DW6N/s+1jnUX0BjejQowOxoxJtvpXECliZFcf3PJDsvX2gVc7uxZo6cz4KDwEn1QJ+k2A8WCgLuci4VJeNB7G12AOUXZXjMcPFUOziY5BMlSVR2bzQhtF2LaRd9eIh26wx8vZOGVd+Mu+ycBcSowBg22z3yplAAdX0NerkAefXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644043; c=relaxed/simple;
	bh=J87XcsLofrKABdL3kJN74TZ/o4x2X5qa2W2wwiaTGek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uRrafvVZUpL7lL85aj/wPTVN1Ynag/CB83gRCDbyfCMJn4AMlzMZ2O4UlpFO4EXC5s+lYumq58DgzTetgc5SST5QweEkk0FJTYa4EJzmek7oPjNdTCJTTCwqH2fvSRos6gFhKVHaYGMRH5Hjqg4wBy8r3PKUTD/Ban4WYNx8jnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTyqNmLP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFD7C2BD10;
	Thu,  6 Jun 2024 03:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644042;
	bh=J87XcsLofrKABdL3kJN74TZ/o4x2X5qa2W2wwiaTGek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jTyqNmLPAlkRoiiuIkE1GaN/t+LXkyy+l0wNk1PINq1CdFOjupu3hN0IFHBuh9TA0
	 Yy3rituJNtOr/NlhzZHZDM1kFJIMJqhLmdlBMSVL1TCiWqNDAqz0bvi1ceKojdnpms
	 D3U6dN6F4AAMQ2WD1pDLHGaBZWrwjIsSOi2pcjwfueydAyOUBVPemBxQim9q47Lw0o
	 nIdVciqbJ08neDPk4lIsDgMHEnLoZGaAxQu/MZ4NrZABBSIFeyggoK1EOb4zziHk8Z
	 /z9w64c4ChlhCMAoEQYARECHAA/0mcOzBRSzp/B7fnSDyBwC+QmH6lDQROsQ1DJjMi
	 uK+fGiOCBMWwg==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable several Qualcomm interconnects
Date: Wed,  5 Jun 2024 22:20:29 -0500
Message-ID: <171764403332.730206.16522682644687500569.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240603-icc-msm8996-builtin-v1-1-3e3d1b0a78ee@linaro.org>
References: <20240603-icc-msm8996-builtin-v1-1-3e3d1b0a78ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Jun 2024 15:51:49 +0300, Dmitry Baryshkov wrote:
> Enable drivers for interconnects on Qualcomm MSM8996 (Dragonboard 820c)
> and SM8150 (SM8150 HDK) to be built-in. Otherwise boot time issues are
> observed on these platforms.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: enable several Qualcomm interconnects
      commit: 6eee808134ecf1c1093ff1ddfc056dc5e469d0c3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

