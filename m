Return-Path: <linux-arm-msm+bounces-49486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CEAA45D02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EC8E1891E5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD84B215078;
	Wed, 26 Feb 2025 11:27:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFE2215049;
	Wed, 26 Feb 2025 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569241; cv=none; b=c2i6ToZh1ibOmmuiiH74utH/a3yTN9GZ+3UJwc3qTi0wBNBv90dI15BRKoAt0ErlCzC+k7/GZRZRzaeed+O1wKLOY6PCT9O7zH4SLLzAmGVGyP84A3DeIbqOPb4+mSOLA75/SZjM+f55fHwzdT6hokdgseSMnpTpmXk29FrrBjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569241; c=relaxed/simple;
	bh=/Dt0STwkjtCu45aNJYccTwNG29dK8N2YviBhNfzEzW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dwih80EGvsqyYdalEEkRYrohOBLiQXaudfp+II0jX5sgPgPjJ9WoAk+8nLgmTyxYgG/4OF0Q4M4WEU25WIRpzF9gH1Cjoz+sJcXX1iN2VgLmtuE7FLfyPm5H20kKq5Wor/5Mh9DRcOy2Pquysg9faIhdD0SbQz25eWdNfFFX9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 761611515;
	Wed, 26 Feb 2025 03:27:35 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F2783F673;
	Wed, 26 Feb 2025 03:27:18 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Add support to configure TPDM MCMB subunit
Date: Wed, 26 Feb 2025 11:27:09 +0000
Message-ID: <174056919426.1604150.1643186333953518995.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
References: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Feb 2025 22:40:05 -0800, Mao Jinlong wrote:
> Introduction of TPDM MCMB(Multi-lane Continuous Multi Bit) subunit
> MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
> subunit has the same number and usage of registers as CMB subunit.
> Just like the CMB subunit, the MCMB subunit must be configured prior
> to enablement. This series adds support for TPDM to configure the
> MCMB subunit.
> 
> [...]

Applied, thanks!

[1/3] coresight-tpdm: Add MCMB dataset support
      https://git.kernel.org/coresight/c/ee39dbe9
[2/3] coresight-tpdm: Add support to select lane
      https://git.kernel.org/coresight/c/07f7c217
[3/3] coresight-tpdm: Add support to enable the lane for MCMB TPDM
      https://git.kernel.org/coresight/c/0c0b6c05

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

