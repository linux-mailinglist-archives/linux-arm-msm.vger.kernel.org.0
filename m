Return-Path: <linux-arm-msm+bounces-50344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D82A4FD29
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 12:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74BEE164E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 11:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC0B233701;
	Wed,  5 Mar 2025 11:05:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC809205515;
	Wed,  5 Mar 2025 11:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172748; cv=none; b=iNMX8PEqO+Phikrg7q3tR97Z6myg1P8a+aDYnydY/ClMSgul0o9ESHIvqPe/bHLiSQnekoENJ4jURKo/9cOPnJl9L7p6WKF0cMzYakl/WB93xPVD3TEPMuYjllHUfz1lv8KGTAG/W+w1GaHW1acpWnuNgeN1pB9i2QZx+ZpdOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172748; c=relaxed/simple;
	bh=BZnuyGU/uDQhYwqyS/UzYfPqyjhn01YRbPgefTN3ySg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+caX209KqzTn/UAVBE4//ifLPsU56Qgod+j1L8P6jz7mjauGQXLLwkJCgQy83ugShfhXNjwgsN6OW0k1Md9QldDIEJmbKOLMUMX53kuyDy3zZfupOy6V/RZoMN5DZauPCRCvUJJgTciszrhEYQjXjEHV0F2xYnlUa0tXWckECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4267BFEC;
	Wed,  5 Mar 2025 03:05:59 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CBD73F673;
	Wed,  5 Mar 2025 03:05:43 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v15 00/10] [subset] Coresight: Add Coresight TMC Control Unit driver
Date: Wed,  5 Mar 2025 11:05:31 +0000
Message-ID: <174117263579.1942819.17038167511866554035.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Mar 2025 11:29:21 +0800, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>              |ETR0|             |ETR1|
>               . \                 / .
>               .  \               /  .
>               .   \             /   .
>               .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> [...]

I have applied patches 1-9, leaving the DTS update for the platform.

[01/10] Coresight: Add support for new APB clock name
        https://git.kernel.org/coresight/c/dc872c5f
[02/10] Coresight: Add trace_id function to retrieving the trace ID
        https://git.kernel.org/coresight/c/c367a89d
[03/10] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
        https://git.kernel.org/coresight/c/182e8c70
[04/10] Coresight: Introduce a new struct coresight_path
        https://git.kernel.org/coresight/c/3c03c49b
[05/10] Coresight: Allocate trace ID after building the path
        https://git.kernel.org/coresight/c/d87d76d8
[06/10] Coresight: Change to read the trace ID from coresight_path
        https://git.kernel.org/coresight/c/7b365f05
[07/10] Coresight: Change functions to accept the coresight_path
        https://git.kernel.org/coresight/c/080ee83c
[08/10] dt-bindings: arm: Add Coresight TMC Control Unit hardware
        https://git.kernel.org/coresight/c/166df2a1
[09/10] Coresight: Add Coresight TMC Control Unit driver
        https://git.kernel.org/coresight/c/f78d206f

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

