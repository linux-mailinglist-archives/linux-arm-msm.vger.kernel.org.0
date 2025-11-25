Return-Path: <linux-arm-msm+bounces-83285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB42C85F79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 17:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E3ED834226B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 16:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A41426E718;
	Tue, 25 Nov 2025 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="ArQ3ndOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49221.qiye.163.com (mail-m49221.qiye.163.com [45.254.49.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165B8235045;
	Tue, 25 Nov 2025 16:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764087801; cv=none; b=PBbgqQ1JiP/EByT4iMiN2TyCJCKUsGQN0S2VWu5i0tdw/yhvZuHj5cuRnmFoQKTasPl9ytN0Bf1piNuYUmNyI7r+DDKGXj3wPxn0vknVEt7OgsOmwuxJjz4h4LoMsyNbdglFDu2H2x26KIdjtXtiWHCUSgzshdl9tTYl5crycWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764087801; c=relaxed/simple;
	bh=crqoWRp48LVeqW9qvipq57rbidjAENZEIH1/bha3yrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOawBfPmoD10SP2ouSR8zIZ1GOvX9ThCdjXhycK2SecArh0ISkwnu4I3B9oPGzwGI89f/ezTkoWqeWHVx5FJ+Es6abal4dp89Goy8zGbKNvGDLkbuVgP6w+ylSwQER1Zo0olz8+Y8tDT10xUdRsan5Rv7qfdK6SwRLOxnYxy7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=ArQ3ndOY; arc=none smtp.client-ip=45.254.49.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [116.3.204.103])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2adbd157d;
	Wed, 26 Nov 2025 00:07:49 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 26 Nov 2025 00:07:02 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: qcom: Add Thundercomm RUBIK Pi 3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-rubikpi-next-20251125-v7-1-e46095b80529@thundersoft.com>
References: <20251126-rubikpi-next-20251125-v7-0-e46095b80529@thundersoft.com>
In-Reply-To: <20251126-rubikpi-next-20251125-v7-0-e46095b80529@thundersoft.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764086868; l=938;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=crqoWRp48LVeqW9qvipq57rbidjAENZEIH1/bha3yrw=;
 b=D05/4F8KrQKKwh1rk4xQuLS0mvpq6/nMkyt0b5GDdF7T0Fx2ipaEwnqRcH0sBm4h8K4+zFLwM
 ISWrmMnLyuDApZ2mEa10MyYLRUKjL6avCxkuszuuEgr2KPHNvKgVMRt
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9abbc56d9609d5kunmc9d8d2b5442122
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTBlPVk4eH0keHR1PHkodTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSk1VSFVJS09VSktIWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ArQ3ndOYzmOyBLPwehAFvJ3i0Uwl+LhGMORAyQg7ahuYgB7u+unq+Yz/nyMFxmm56XLFEaoMP+jCU4PEvO/uESK9vQgISBEerBuPoF6oyag9Jd5btbCPUx51qpm8gE3lFa2M++vUGHh7E6Uyi3T57+SnMzDwhE6LKdTJuPZdSX4=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=ePGgLLAaFxcL8uhcDY/dpXzavxVRjLl+0lANaYCE4fo=;
	h=date:mime-version:subject:message-id:from;

Add compatible for the Thundercomm RUBIK Pi 3 board,
which is based on the Qualcomm Dragonwing QCS6490 SoC.

Reviewed-by: Roger Shimizu <rosh@debian.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..8c7dbf764ec2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
               - qcom,qcs6490-rb3gen2
               - radxa,dragon-q6a
               - shift,otter
+              - thundercomm,rubikpi3
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform

-- 
2.43.0


