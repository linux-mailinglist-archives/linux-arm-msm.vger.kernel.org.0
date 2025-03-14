Return-Path: <linux-arm-msm+bounces-51489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DCBA61BAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A7D6882C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ED321323C;
	Fri, 14 Mar 2025 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYRyztuP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F593213221;
	Fri, 14 Mar 2025 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982510; cv=none; b=pCL3r0HUK3Qr9OKILxn9bhVQ+CU9k/ioWKTqh97ArvEt+0J5O8VKOYub+OKIoJ8IS7oEvPCeFVFaL4XxRmtTGcksUpQqW9DB0IyzZZgAeMNpLUdD4/Xt5w3iEaa6YSDaHFKjZpGRUmFOTUI5B2ZhbSQPFk+762H9myBj/LVKRcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982510; c=relaxed/simple;
	bh=I2/xCpzzeaxrkmm7yQ3y21IF5fQqrnzVJEYGyz3cje8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tw5OSoKL8S4Rl3LsCmAvTrR2EWwOnPqH+MyRU1zIifR9+kOQnMxYMC/oQOhSphCGyVNFh4GGewRctD7STM03dUbI7aYbCrAX4FLmmbqgr96Nl4QNMjvAJqqzIOKzTnlBaVp5wGroqUyiBqwopMHrCPzZLvtvyh/CoN7CXDLv5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYRyztuP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5386C4CEE3;
	Fri, 14 Mar 2025 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982510;
	bh=I2/xCpzzeaxrkmm7yQ3y21IF5fQqrnzVJEYGyz3cje8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JYRyztuPRhxcAKA69kTgFlLLOKjWM9BARguq+/o6PX8iovbyQUKPzKeTbWJTQJxAs
	 GadHX53ZubESMMnb7s+6MmPFMKnsU+xpf1EIS0GDHbiKi1qZhavsWNG/jsli0wWvGP
	 jTcfJgmE/whopTSI09a1X/MUutMDBVnR1438EOYPxFOlvMKVFDeEw3/yWbLe8crwkS
	 P03s8MbroD/Aqmo2cMPUbwt/Jy1TyTWYZNToGjhSQXBj2eqh/vtYoxvwXihDR10Uet
	 jNA8eZfodKwEzcTdlGGwbUCQ6xDLbKyEBT6MGRWtNVlo2Rwu5OuwFI8BL/C6VVbdGP
	 CdjCrP9+6gOfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: (subset) [PATCH v15 00/10] Coresight: Add Coresight TMC Control Unit driver
Date: Fri, 14 Mar 2025 15:01:03 -0500
Message-ID: <174198247887.1604753.1605423266163412383.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
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
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
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

Applied, thanks!

[10/10] arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
        commit: 05ed68070d7a061f62f502d07f883c05dc666990

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

