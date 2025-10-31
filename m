Return-Path: <linux-arm-msm+bounces-79782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B37C23017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A18D64F02DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F3F2874F8;
	Fri, 31 Oct 2025 02:28:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046B027703A;
	Fri, 31 Oct 2025 02:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877721; cv=none; b=QFXupnuGPpqEAj+6bO6C6wKYp6e7xfApHujmBcXa7Gd7C2YHrXXU0BUDKI+i7/wiWUlzjYuu0IZXz2JzMyeNLOX+y9+8+gii1UocbWNbnRp8DEGKVGA1/M9vxhh11HbG+nHd6S2HqzYOJrdo5CRnOu3r4MYK2iwjG9N49Lobne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877721; c=relaxed/simple;
	bh=7XisM2rwpdDlhZ2y1kfdlXbHH1vW3/EhUUIBGKIvWfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGDJy2A+dRMe6+e+0W+ntxFWgbTMN7k+cspFQZMwOW5JZ4nd6To2+hCOI2a1ozY3VEs4I9B11m0K77RsXSAJy7EBwyiAvqykmus0CUVyoGwAU5BsJIh/o/7Sk+P6Ib/yDQZeRc6Q/albQADsOCbKyS51iM69NuIKG0iAVwx/EXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=95.215.58.173
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey@web.codeaurora.org, Minnekhanov@web.codeaurora.org
Date: Fri, 31 Oct 2025 05:27:44 +0300
Subject: [PATCH 2/3] clk: qcom: mmcc-sdm660: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-sdm660-mdss-reset-v1-2-14cb4e6836f2@postmarketos.org>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
In-Reply-To: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

From: Alexey Minnekhanov <alexeymin@postmarketos.org>

Add offset for display subsystem reset in multimedia clock controller
block.

Cc: <stable@vger.kernel.org> # 6.17
Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 drivers/clk/qcom/mmcc-sdm660.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index b723c536dfb6..dbd3f561dc6d 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2781,6 +2781,7 @@ static struct gdsc *mmcc_sdm660_gdscs[] = {
 };
 
 static const struct qcom_reset_map mmcc_660_resets[] = {
+	[MDSS_BCR] = { 0x2300 },
 	[CAMSS_MICRO_BCR] = { 0x3490 },
 };
 

-- 
2.51.0


