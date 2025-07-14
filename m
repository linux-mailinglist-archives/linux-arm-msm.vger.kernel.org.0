Return-Path: <linux-arm-msm+bounces-64820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84392B04045
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3FBC3AA9D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C10324DD0A;
	Mon, 14 Jul 2025 13:37:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66FC23AB8E;
	Mon, 14 Jul 2025 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500267; cv=none; b=IJCXFl+KDmj6VD/V+giMriD9ExpDpVtZmQLWwIXsz9+ZbYj3+w/kjqDFT3g+XmPgLB3EBZOLB1rKNYInFDhhChUATMPGzw3qqcFGd49Zc7lvYAC1yD6hZH1zbFdxkqScU9UdDVC85ra/zLsXTvrT1EZkwcG0xUL2HuMyUxuAAMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500267; c=relaxed/simple;
	bh=28FqZG/QrHT3XpjRqRhn4Oj2ZnLlkcmVYKXwAZEEcOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VL+8LnsV1dRuXVApbgYkEuq9Va9YeuD1+3SmScGU3Fpmogh5dPLLP1c5x/3XT7X2ipNDCKpS6UAWBHdI0Sz61jQHIiO/JwI2e0aOmwGzYzOmKowi9omXbz5y+z9SOezYAz8sl+HvWJ0oMTUL6tweSVUYguSZWjI2FgceqqprBjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905E41BC0;
	Mon, 14 Jul 2025 06:37:34 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA9193F66E;
	Mon, 14 Jul 2025 06:37:41 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v11 0/2] coresight: Add Coresight Trace Network On Chip driver
Date: Mon, 14 Jul 2025 14:37:30 +0100
Message-ID: <175250020505.487814.2214255862249827250.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com>
References: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Jul 2025 13:27:19 +0800, Yuanfang Zhang wrote:
> The Trace Network On Chip (TNOC) is an integration hierarchy which is a
> hardware component that integrates the functionalities of TPDA and
> funnels. It collects trace from subsystems and transfers it to coresight
> sink.
> 
> In addition to the generic TNOC mentioned above, there is also a special type
> of TNOC called Interconnect TNOC. Unlike the generic TNOC, the Interconnect
> TNOC doesn't need ATID. Its primary function is to connect the source of
> subsystems to the Aggregator TNOC. Its driver is different from this patch and
> will describe it and upstream its driver separately.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: Add device Trace Network On Chip definition
      https://git.kernel.org/coresight/c/015959687cff
[2/2] coresight: add coresight Trace Network On Chip driver
      https://git.kernel.org/coresight/c/26e20622a8ae

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

