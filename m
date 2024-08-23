Return-Path: <linux-arm-msm+bounces-29378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DF895D3F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 19:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 245871C21525
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A6219069B;
	Fri, 23 Aug 2024 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXU6+DF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907118BB97;
	Fri, 23 Aug 2024 17:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724432560; cv=none; b=YU+kUnuK2XE35ih84WdZxIobvuS2LC7h4GhRREg9i4Up4f6267HRlv233eKcH2cq07o7e+L2XwL+QUsGmWKaT4Ex59sTI8X96MXdFpENy6fo9f1rgAkMvWZev0OCWV6m5bwR/ZXAaGwMRB3NDhU1yEbcIP95bwmtbolH1fQJ5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724432560; c=relaxed/simple;
	bh=LrsQbM+9Culzk5ZY9Zi1h3Hk51nvlJlLN7JY3gYeZ58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qElWmEXSVfgaXJ1IUNdFg57fqbDZyfCUUP7rszVfCeob/MHUPZH+6qOital58Xfkd1AC2Tl86XEWW48/ksoHoXPN+6QO3Khnzdi1sX5UemUnlHitEMmw+lpX5o7APFaGNaT7GTU3iQkmSWlC/jaafuOGohzq+dUdBmq3hwsxx+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXU6+DF8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35515C4AF0B;
	Fri, 23 Aug 2024 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724432559;
	bh=LrsQbM+9Culzk5ZY9Zi1h3Hk51nvlJlLN7JY3gYeZ58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KXU6+DF89znEUirCTp35mYNCLYojgYk8MR4FlxokFC7tSsPoU37sbQtr02dfE1X7J
	 9n0mLdPKtVRtwVpQFcLDbssODFWM9GoSU46M/qpPWDhir5xrMW7tSy3Y4WQh6KV5EV
	 Sb2/OznrLSC4d7Hf2fVVFY6wBAIxM6+ymWj/1+upUnGdmhbqbLUkc3c1N/gK8fzKXy
	 KGveAS0qbHrTaxhR/za4wjDURJtnpYOEWmqE3i2S35JIrwREglgcbxVUyFdIjzfNWY
	 mf3gAeJfXjvLm6qU1lLly3DakzOWHRx35GILq/HXgMCN+TGUoxaYzOWA3D9+f6QZYJ
	 m/yyAyJIpThuA==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com,
	quic_parass@quicinc.com,
	quic_mrana@quicinc.com
Subject: Re: [PATCH v2 0/4] perf/dwc_pcie: Fix registration issue in multi PCIe controller instances
Date: Fri, 23 Aug 2024 18:02:12 +0100
Message-Id: <172442564702.2792102.12095795549059563421.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
References: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 16 Aug 2024 20:47:19 +0530, Krishna chaitanya chundru wrote:
> When there are multiple of instances of PCIe controllers, registration
> to perf driver fails with this error. This is because of having same
> bdf value for devices under two different controllers.
> 
> Update the logic to use sbdf which is a unique number in case of
> multi instance also.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/4] perf/dwc_pcie: Fix registration issue in multi PCIe controller instances
      https://git.kernel.org/will/c/e669388537c4
[2/4] Documentation: dwc_pcie_pmu: Update bdf to sbdf
      https://git.kernel.org/will/c/96a37ec98664
[3/4] perf/dwc_pcie: Always register for PCIe bus notifier
      https://git.kernel.org/will/c/b94b05478fb6
[4/4] perf/dwc_pcie: Add support for QCOM vendor devices
      https://git.kernel.org/will/c/db9e7a83d308

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

