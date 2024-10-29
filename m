Return-Path: <linux-arm-msm+bounces-36320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 371819B4F13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 17:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690E21C229B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 16:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164EE1D2B28;
	Tue, 29 Oct 2024 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIdFo/xm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA26D1993B5;
	Tue, 29 Oct 2024 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218532; cv=none; b=VClDhaLMgwuDSu+3ubggbur7M9LjDai8b86XzSCQqsQty+HePi8L0JAOvgoM7wv9bxfYxJdER3GnSGxGZKe5vRDC5Y3JQp4JJdAKsfUq30ns0PA9blTBF3y+fXSWnzikQe76usDFFE9xVrqa1LvZR8YDyi/V+uXRAuFq0gCkt2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218532; c=relaxed/simple;
	bh=kMKc10j7VGxeNAMb2m4ny2C5ZWH83LXpdQnxhHidR+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=reEOIil5VwBkEHbtY/A3G55b9QgSBm2otGF5VzquMo9z5I1s2GoOP4SF+tXzh0nl+WVwRfWbpEby58m87Uy8Z9lgpPkFwQiSe7wxZfaNAcK8P4D8BCjCCMTRwBMUxLmWHsiHNTgK6bWNRm+qXaIp+DSiwRUAxVt9D+oRw55C6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIdFo/xm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9752BC4CEE8;
	Tue, 29 Oct 2024 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730218531;
	bh=kMKc10j7VGxeNAMb2m4ny2C5ZWH83LXpdQnxhHidR+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XIdFo/xmjJ/A5CqRYVA7v9r9UUp1/0vm8UzP2PZyPD1gXfJNYrja7Xv1b17rVD9Pv
	 t98DbS0wAJN3988GoAvvJisJYvO+IaLbCJasI5dI5fR7pkumiiq0tmiEbfMoM2Ls3c
	 otQJyl3tPZgN1ylyNfEMLyzrMN60XmMpj1Y5bSdruUlC05qh+YT/roLWGDGz8UqpS8
	 TzZpropxMC0LTFXvukXPC7xMzswCuTG1vdqbiMCWjfulbiRo6I49WNsctUueOuhm46
	 Mz81OZQfQUao6e7CzZbG0YXQKEP5PFTFUHgUCJuo379LAMa/q6IK+schDut7EdJBzx
	 h7UeGnsCYovBA==
From: Will Deacon <will@kernel.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robimarko@gmail.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v3 0/4] Add support for APPS SMMU on QCS615
Date: Tue, 29 Oct 2024 16:15:14 +0000
Message-Id: <173021813714.1137827.1103662832817907135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 25 Oct 2024 08:37:28 +0530, Qingqing Zhou wrote:
> Enable APPS SMMU function on QCS615 platform. APPS SMMU is required
> for address translation in devices including Ethernet/UFS/USB and
> so on.
> 
> Add the SCM node for SMMU probing normally. SMMU driver probe will
> check qcom_scm ready or not, without SCM node, SMMU driver probe will
> defer.
> The dmesg log without SCM node:
> platform 15000000.iommu: deferred probe pending: arm-smmu: qcom_scm not ready
> 
> [...]

Applied SMMU bindings change to will (for-joerg/arm-smmu/bindings), thanks!

[2/4] dt-bindings: arm-smmu: document QCS615 APPS SMMU
      https://git.kernel.org/will/c/515c8ff024ba

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

