Return-Path: <linux-arm-msm+bounces-73521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FC7B57500
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 857497A70F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370C32F8BDA;
	Mon, 15 Sep 2025 09:39:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABD82F8BC1;
	Mon, 15 Sep 2025 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929163; cv=none; b=bZCtMsQFNzWCStpTGZmR3b8FuUrK3lUfHgLri9l/JOWRn8CCkAMhP9BoqUkZgD2WSLuxpagSkzu2Yg5hPs7wkks46vqgbiqLUvPmHMI1PHMT1gPC2BtRy6q9SkCSz+hN8IHi83kJTnIxCH9p8kjJqeYrEeMqw9sH1UYe+unLuUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929163; c=relaxed/simple;
	bh=aeL9srpCnEBJ8yWGRXp6LmPlCUGw563gqexHrZreot4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2ZbMOI5GuuVUB1TxDayE94pINTgM+beaBfuszDqdzTkfeVl38dPVmvlm+7E87lrH97BJ82n5jilg8Oq27QvrH5KGtz3wI90/rEpucj/QhJgBkfAuO0/4Hyt1Alv1Tb+cpCWc776uY6b/Bce3XbqwgUPVUqm9F3TK15buxF9dJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 925411063;
	Mon, 15 Sep 2025 02:39:11 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F33C73F694;
	Mon, 15 Sep 2025 02:39:17 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v11 0/2] coresight: Add label sysfs node support
Date: Mon, 15 Sep 2025 10:39:04 +0100
Message-ID: <175792909832.1970499.2776952836834595776.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250816072529.3716968-1-quic_jinlmao@quicinc.com>
References: <20250816072529.3716968-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 16 Aug 2025 00:25:27 -0700, Mao Jinlong wrote:
> Change since V10:
> 1. Update kernel version to 6.18
> V10 link: https://lkml.org/lkml/2025/8/6/520
> 
> Change since V9:
> 1. Replace scnprintf with sysfs_emit.
> 2. Update date in ABI files.
> V9 link: https://lkml.org/lkml/2025/7/17/832
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: Add label in the coresight components
      https://git.kernel.org/coresight/c/37bad7e6d08c
[2/2] coresight: Add label sysfs node support
      https://git.kernel.org/coresight/c/559d6c380ea0

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

