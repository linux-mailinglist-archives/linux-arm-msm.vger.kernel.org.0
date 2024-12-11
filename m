Return-Path: <linux-arm-msm+bounces-41465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBC9ECA32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 11:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A64FD16080B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184531EC4D5;
	Wed, 11 Dec 2024 10:20:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A45C236FA9;
	Wed, 11 Dec 2024 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733912457; cv=none; b=RykjUlqTi+tuFCWO5IBqkpzopzoOk1ghEO2/Q1QwJVK5ZB0GDiLuJuytT1hzG/T3geY2KALU5+zJokQi8u0yM/7T/kTCB61KF8aTC4KYL5l6sI5P0uBSX8tRTXKlnO7qjgn8IQekdN3EKo7JEPlYHeNy985FjxJ5KQG4XoE8cGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733912457; c=relaxed/simple;
	bh=2qrgK9+IAdcUz5AYRru8afY9lA0SYpB4HI5K88IxY+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSr1acub9G//0nHe4j5ke+QTprPU7UatN6snlAPzADs/qCiK+HpYsXm8aQncG71p7pwkX32eCpGe/LPEqyM8BKdl+/THIlT8BMo/g/8M/Vw16JO36ZdP0zle5uM83eWdi35G5FH+J0DccxYOFyPbrHCE4INOirF76lXUphY98ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78E5E1063;
	Wed, 11 Dec 2024 02:21:22 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 81D223F720;
	Wed, 11 Dec 2024 02:20:52 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 0/3] coresight: Add static trace id support
Date: Wed, 11 Dec 2024 10:20:47 +0000
Message-Id: <173391229097.561442.14812407436677697542.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
References: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Nov 2024 14:28:26 +0800, Mao Jinlong wrote:
> Some HW has static trace id which cannot be changed via
> software programming. For this case, configure the trace id
> in device tree with "arm,static-trace-id = <xxx>", and
> call coresight_trace_id_get_static_system_id with the trace id value
> in device probe function. The id will be reserved for the HW
> all the time if the device is probed.
> 
> [...]

Applied, with minor fixups. thanks!

[1/3] dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
      https://git.kernel.org/coresight/c/d0a10da78cbfabcbc2eda87ac238bc03bb2b2c81
[2/3] coresight: Add support to get static id for system trace sources
      https://git.kernel.org/coresight/c/fd9b7e8e9fbc23d69fa4accc881dea2cf13a2e2e
[3/3] coresight: dummy: Add static trace id support for dummy source
      https://git.kernel.org/coresight/c/f7d7454607cf863cc860e201636117e242d45fe0

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

