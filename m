Return-Path: <linux-arm-msm+bounces-46698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C5EA25280
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 07:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B58188421C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 06:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387C31DC745;
	Mon,  3 Feb 2025 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="QcBht3c+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658BC1D86C3;
	Mon,  3 Feb 2025 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564496; cv=none; b=B9mkMQYAG/b/Cc+mwnPoIjINbWEaroIoWza3wOiPYSoCU2jRgIk9Ku8Dcde8kzPql0n298IqPzcw8/iJUg4Lzrtl2Rucz3ZHjSc+ITM3X2GRe3v0NejpmuoG57Tjf4t25Rv0H0Q9Qf8FpSJOZmwqn6HBa6TrlmPqxSCckrcShhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564496; c=relaxed/simple;
	bh=xGMuxjiG3J1KY0tpr4BD/2R/zK2QTssBPpcx8ig7gas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Icw/4T+7IGHaMutoG6Fq9sBiLeYsTH3hD62LZzYdLGhnhCF+1p6gCmXnm4Tyl1PicN4HAkR1gWhfcY0IQAByifh3Ynk80HqgWdLoMVZzrqV5veh0R2XyP+aDD7IOIWKwWs/z5Xe2By/WdTUCP6FZDxqv7o7XrPRvCOCVkGYggPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=QcBht3c+; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738564482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rxn7KNy58nycOR58GR1ZstIpveHU6RnMKXkVaNeuEy0=;
	b=QcBht3c+OufRO3iFS6wrhVpjylMePpMaqwaomd/7X7hA8XBPKaNDGk9iC3dWPZ9NzKoy/g
	UYw9TC40q+nyqQqgLo1Ij+y2kpsccgqveHqHIfjc6h9MfZ6pzShLgYgU3nL6s3pjXuyPg7
	fPN1jxxJGazM4Uy5ja9rIjqCURIGWIsirdPTRhDkIxyBmydOZa+ZLN1+Xj385iUc2Kc2JY
	bl78FjPa3bZ1s46bnHrJwkg3mhQYAwKuYi718li0Auz8IpFG43O7yYnKfKnwUd301qMYGS
	o6z4hltl0OkyfGtVNBxcbbHGJ6hGAwP1O1th1T08VnCk0BWclX7Sb5e/h2Cxbw==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH v3 0/3] Add missing SDCC resets for SDM630/660
Date: Mon,  3 Feb 2025 09:34:23 +0300
Message-ID: <20250203063427.358327-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

These resets are part of GCC space and were missed during initial
porting of the platform.

Changelog:

v3:
 * dropped fixes tags, picked r-b

v2:
 * split into 3 patches

Alexey Minnekhanov (3):
  dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
  clk: qcom: gcc-sdm660: Add missing SDCC block resets
  arm64: dts: qcom: sdm630: Add missing resets to mmc blocks

 arch/arm64/boot/dts/qcom/sdm630.dtsi        | 3 +++
 drivers/clk/qcom/gcc-sdm660.c               | 2 ++
 include/dt-bindings/clock/qcom,gcc-sdm660.h | 2 ++
 3 files changed, 7 insertions(+)

-- 
2.45.3


