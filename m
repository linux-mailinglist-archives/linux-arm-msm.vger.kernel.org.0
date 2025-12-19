Return-Path: <linux-arm-msm+bounces-85898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F421CD0305
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE53C303998D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A57E32720C;
	Fri, 19 Dec 2025 14:02:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F52306B0A;
	Fri, 19 Dec 2025 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766152926; cv=none; b=uSgY+lxma+nzX8mWw4ylPqVcO0vjUfYdLpxt8xeAR3ONUJX47rguEywBWk5m1smJapJNOafHscx1La540kTTubZ1d/fjk3p+qm31iKZUVGD6DjJesH/5Pn6sRw7f5V8BCTBVrnC8RQNQw+sYwDW/4PQA0VReLJ75LJIhnr7Ojqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766152926; c=relaxed/simple;
	bh=i/mmf81HXPfl+r0CrAZLzcet6zBD7jfudc0vbWBbtoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTTnGHqfYSgyymtUrHkgV+tY732m+JIZsEMiNDQkzL7GRewxbFk4GevbcdeNENlxg0sYZcZjKRMJyzpVIRQ3EdT9vWqK+bOMWeSMgds6VyvqKrHMK0dio1Pt8ylWJfLtBEnfKctsER9e1QtksEMPOURGFYVO3+2u3tGhzUnGgDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15437FEC;
	Fri, 19 Dec 2025 06:01:56 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFB2F3F5CA;
	Fri, 19 Dec 2025 06:02:00 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v4 0/2] Enable CTCU device for QCS8300
Date: Fri, 19 Dec 2025 14:01:53 +0000
Message-ID: <176615287813.688536.723538049922655005.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Nov 2025 15:06:20 +0800, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.
> 
> Changes in V4:
> 1. dtsi file has been renamed from qcs8300.dtsi -> monaco.dtsi
> Link to V3 - https://lore.kernel.org/all/20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: add CTCU device for monaco
      https://git.kernel.org/coresight/c/51cd1fb70e08

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

