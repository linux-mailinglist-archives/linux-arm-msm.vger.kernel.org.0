Return-Path: <linux-arm-msm+bounces-89639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2653D3A786
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2175301D0F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B826318EE5;
	Mon, 19 Jan 2026 11:53:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580FC31A7F1;
	Mon, 19 Jan 2026 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823635; cv=none; b=eV14JpXtobRgn2HbM9Hu++mXVQG/sReHW6c3CrlJDPxXgkjUV3qeNVOAjWrqKeaP9WZAqJRvS6LPilKnCA/ekr7cSt2UDSB559Euplxsll/ClX+/D+n/o8cYUeq6mQQTRJ74LznWYBZ1aoBR3TruQUahysQJwf0INheFm4viZtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823635; c=relaxed/simple;
	bh=wWQ/33mdutWx2GuOH6RRm0CECmdgEOZ1pAzWII+NRQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxNLbsj/H0RcBHd8lurqFMweVI+PRkBxgp6Un0+EhYCAiNcitba4w7rgXz8QRGkjCoG1lniWAZXPPkRb4jlKy29Yi11D3kUmVT0o2dyP9GuGH/88tgr/khFs6oT4JHGpAvEK6oPITDodiGG4zdcF1chk/Xxy1ItX3M+7JOD56Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EA41153B;
	Mon, 19 Jan 2026 03:53:42 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B58693F632;
	Mon, 19 Jan 2026 03:53:46 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@oss.qualcomm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH RESEND v5 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Mon, 19 Jan 2026 11:53:31 +0000
Message-ID: <176882354703.1800388.16602778597439476199.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Dec 2025 20:43:06 -0800, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> 

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      https://git.kernel.org/coresight/c/2b3625a83245
[2/3] coresight-tnoc: add platform driver to support Interconnect TNOC
      https://git.kernel.org/coresight/c/5799dee92dc2
[3/3] coresight-tnoc: Add runtime PM support for Interconnect TNOC
      https://git.kernel.org/coresight/c/4d9024d14d1b

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

