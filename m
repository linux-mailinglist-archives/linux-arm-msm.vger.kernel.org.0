Return-Path: <linux-arm-msm+bounces-51040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85971A5CE58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 247603B4D40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6013263F32;
	Tue, 11 Mar 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jh9ST8ih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714E25B688;
	Tue, 11 Mar 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719509; cv=none; b=AFK+5oIkFR2Fy/bUfsFn5Bmu4ZmuQpCIjLmfdtbqSRVUIGRvd+NwVduAzv4p1WsiPhrfhYRkjXToYFl+i4xCMdwxG9/+BteI3zj4jqwf6Naiq5SSroX+Do7/DMmWXbtkG62dSnbUT+7EWPCItqJhYyM/Y8pbLVhaqCzaX5tSOL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719509; c=relaxed/simple;
	bh=D9qHdpXll7vLrLHbuBC5ZIcyw1Mnbte9gmyw1jVzTV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o14u+HQ7L/QPq7uAAdU9xwpSplHZi2GeeMUPZcmfa3pEaxMWMcO1nFrK+FJjvQ7lmNaPAcEAbh6b7LIFGOVNPZKHbda4BivS6OGpHCo8jXOVN8WJCAkn/ANjPeKCa6XDokRShYw1AaYDF1RNEhZ25lfCdksb7A3zU9SHMzGSLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jh9ST8ih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05432C4CEEB;
	Tue, 11 Mar 2025 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719509;
	bh=D9qHdpXll7vLrLHbuBC5ZIcyw1Mnbte9gmyw1jVzTV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jh9ST8ihOpZEvI7y8d1x22jonvnRFPus3v0GMuAVzFLUhCbVlzxV1B7giVp9l7Mv7
	 V8knRq/iMELH84ewawJSG6pmB/zB53hGgurgi9q6LXTJHnJSpfZMmjAEY662ITT6pT
	 kwHF/mHXtSP38yTCCkPPZyPDxkTiNpphwLrkUwFHylM3NNktPB56aa2QEVWt5gx3Wx
	 DYDEtHISCkTO2hYtslukSlo3doRq1fYop7n1NWq67WtPLtvE353si1Eie6mGnok95W
	 nrGIVs29Il1Tpsyt6Sqqx+y6BI/F0DQI9VDx9RxB/bUUnHxxxmYhS39phtqHq5mlg0
	 llr2b0lFyjgHw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/2] Add support for GPU SMMU on QCS8300
Date: Tue, 11 Mar 2025 18:58:15 +0000
Message-Id: <174169911942.2776458.2825521492777245411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
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

Applied SMMU bindings change to iommu (arm/smmu/bindings), thanks!

[1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
      https://git.kernel.org/iommu/c/df90abbc31e6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

