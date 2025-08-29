Return-Path: <linux-arm-msm+bounces-71237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2832B3B667
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E691CC06CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666932D24A0;
	Fri, 29 Aug 2025 08:49:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1D42BEC4A;
	Fri, 29 Aug 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457348; cv=none; b=MNg87/oMoSoKiZLWHEIYvlECChW3XeWXz3HOT3iC9R4Kb8tQKEdXnH/HklrxByrXuoPBjDQ1Io/xiwqUOm7w1gcwy4IE8JLlFpMddi8zb0Nw7rbfK54/bmpyyEjf+zXMBBBxWAVju4fUR90Rl0Ymv9sWFN6gCQY2CqVbGAflv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457348; c=relaxed/simple;
	bh=t3QfyuZB/5zyTNfAgwicIE9XR9qIE64yDMjoQZUN1GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sn0jUqDlxTuF2WLl2OJVyabzYOBOtkdAQ0fWShhSZ1KtCA/HM2uimJsxgNTDC43eS4Qvyw9nqsLlK2B5MFablDdXnwPtLhfvtoXWoW4n7WYTiEMQ3XTxuvE0eHuIox4xJaiTow1Xj+xe6gOdp1LpoyB/U5d5s7u0FGINCKSOiN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D85441BCB;
	Fri, 29 Aug 2025 01:48:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C42B53F694;
	Fri, 29 Aug 2025 01:49:05 -0700 (PDT)
Date: Fri, 29 Aug 2025 09:49:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] coresight-tnoc: Add support for Interconnect TNOC
Message-ID: <20250829084904.GH745921@e132581.arm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>

On Thu, Aug 28, 2025 at 02:27:21AM -0700, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.

I tested this series with building and static checker, the result is
good.

I'd highlight that this series is based on my patch series Arm CoreSight
clock refactoring [1] (thanks!). The dependency might be matter when
picking up patches, I would leave this to Suzuki.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com/

