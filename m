Return-Path: <linux-arm-msm+bounces-51498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEAEA61BC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 413CF7A6CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970CE215793;
	Fri, 14 Mar 2025 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAcceZxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938521578D;
	Fri, 14 Mar 2025 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982520; cv=none; b=Sca42JnCqAPFbZf1CkYKC978yVUG4kOFoCtKXZJb+WyXbqxg5z3u6fOMspUsEKVI/BXfdbb8V/AdBIodYdbUtyIijKIUyp44tRiVOsgiFsR9VKRmafarvJ+/bhsp1SjTzcLeRbrn1PSnG0aCEGTINCF83fSEIhUIKLEZTiSaCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982520; c=relaxed/simple;
	bh=xeyVeLcjMNCPDbXinsEwmjc5sOvb501OOGqXZ4DrlLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XeHRyEmBkJHJgw5BzY4uMABpzMU9ISU/pwI/as53daxOYB2mlL9oi1FC51y77M+uqiN4zKtXMRI2qBTwvxcQTE2or7dzqzHOqDnb0/jLeAR/+behQZ7lIXfXCPoOdyQ6MH/VC0l0NsjxAQ7LtZPOB4s/YRcsgbHHqUmsSwlilsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAcceZxP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8252C4CEEE;
	Fri, 14 Mar 2025 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982519;
	bh=xeyVeLcjMNCPDbXinsEwmjc5sOvb501OOGqXZ4DrlLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAcceZxPZws3aK4NXKlfdtvQTb1P+QDyu7hew672AlwNZl66Zv2Mo3rYVQRNw4IA7
	 pImp5znWviWIer9ToHBn6hDQ0i2xBgXbz23PhhIAB968CmGkFD4SWJC8nH0mKT0Y3N
	 9W+2D2FgRy6YDqyt8AV9ol7aYbgRER5uh5FKWvxKWujLkyJIihrEgcD1+BZPzZu6Ub
	 MxK4EJdb5D0ep1mlAfrnXEbuqZIywgjcWyM6kq8fX4oEDWux6wlZYSoKU06oErwxOA
	 rf3ajHsPD9QZkj3IvSMGoJxmW6RanJ/TNMyDXZcev9P+vKOWep6CSBJt9iK8sQgJxv
	 HWz9AiZoUhwHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/2] Add support for GPU SMMU on QCS8300
Date: Fri, 14 Mar 2025 15:01:12 -0500
Message-ID: <174198247897.1604753.3634981110002933426.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
References: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Mar 2025 16:48:33 +0530, Pratyush Brahma wrote:
> Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
> for address translation in GPU device.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: qcs8300: Add device node for gfx_smmu
      commit: 28ef67df3658365b0a8ae6b54c800e70b0216778

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

