Return-Path: <linux-arm-msm+bounces-75531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F6BAB600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 06:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCE1D4E103D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B881A8F84;
	Tue, 30 Sep 2025 04:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Sp62Alt0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155104.qiye.163.com (mail-m155104.qiye.163.com [101.71.155.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C6C2CCC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759206814; cv=none; b=Xnm94owHM5Fb0ms9Nvd7+FUSxdc83ztrxPUcFk42t/ZyYBDTnslBXfAkdTWdhelhjpHiz+7PDMhmCwAKu/UZ2vGtPv4ILQ039D1Jy1gYJPeyrrakLWYN1R8pIWq8IiIdotvmvBO17i3yMPEY1prFB0e4WvKsB5XVYomvUD+j+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759206814; c=relaxed/simple;
	bh=JqEj+DCJWbC/G1OgP1tYeRve8eqolXsMXGo+YZBvCYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrRksNtXsZRwbKLQo+w5ueyBH0nIIoxSrLegu+3OyCd7FTF8NH8175iJTAFSiByl6FwBFmIEb7tiDDLjf9cKD++PiTybs4iFor1A+dYE8T244fIp75MeuQAF/jC5ScNVLELWMx50jS17E/Tvdsp3oKVdKb60MO24IoSmJTzJMGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Sp62Alt0; arc=none smtp.client-ip=101.71.155.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [113.235.126.201])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2489e0113;
	Tue, 30 Sep 2025 12:33:21 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: linux-arm-msm@vger.kernel.org
Cc: casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	loic.minier@oss.qualcomm.com,
	andersson@kernel.org,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v4 2/2] dt-bindings: arm: qcom: rubikpi3: document rubikpi3 board binding
Date: Tue, 30 Sep 2025 12:32:52 +0800
Message-ID: <20250930043258.249641-3-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930043258.249641-1-hongyang.zhao@thundersoft.com>
References: <20250930043258.249641-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9998e5803309d5kunmc5095b342ecc6e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQk9LVhgZHRkaSx5NSU0eSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTVVJS0pZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Sp62Alt00bZn32tfHLFsG31QHy0dWUhSEHNBdCOGsSy0Dg5HPkIjShjwOP8JamY7+ZjMw2CbdYRtR+TgOBWU0mZKIJJNTe4vlVBD+Zp2siOUaPMrjFQ0iWMrMUfOb8Ll3msdME5ZQNS9mtZeGqpSuFiDO19QWDTpW/qs3UHtraY=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=i2lg10A4nS8CRYmuUjKjpcNC0ActqoMEJCxx6bm7lyI=;
	h=date:mime-version:subject:message-id:from;

Add binding for the Thundercomm RUBIK Pi 3 board,
which is based on the Qualcomm Dragonwing QCS6490 SoC.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..763fa2ad2425 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -340,6 +340,7 @@ properties:
               - particle,tachyon
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - thundercomm,rubikpi3
               - shift,otter
           - const: qcom,qcm6490
 
-- 
2.43.0


