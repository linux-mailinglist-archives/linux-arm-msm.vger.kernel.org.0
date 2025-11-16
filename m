Return-Path: <linux-arm-msm+bounces-81955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B5C60E4E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 02:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F21F94E4BB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 01:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD1E218821;
	Sun, 16 Nov 2025 01:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="gc2fMTIS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59C1EF0B0
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 01:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763255615; cv=none; b=ewSrzVIIaYRMI69rm5OUuVWs3/dzAoL0zX44mC2NRSigYNENy5SvQAv0Az/IllcO5V2Q7sVWQ3ifdm00KfkhGkXiofw0YlgygffeUD4I08ws6RIMAMTMf9JB7LsdRse1n4ww7x1PZ18A4b0H3y4+Pkh+tBErRhGDLS+QgbTlXDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763255615; c=relaxed/simple;
	bh=vf+IqT1tZ09wYkSDTMitxn1GWRUACmFnGKa7BeMLS+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFPFDTnYth9+DcphbZopUdM/JRXHPyZmXjEo65+eLT4nCzjnK8MxZrHnaxzXnTAL0wdzTExMzcgnyK6BJ/hg0Y7hAoPyHlxz2S/zvMGVIPnFKtVYRSEI5PDce16+4fJ26wkR7eajORIPzJi0j9mUDT0QdoaCgh9YFMNw0V1y+9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=gc2fMTIS; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1763255610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ivhTRThJyhdTW8a88HXfTfhYf/VeNvjO9pC+MTucnks=;
	b=gc2fMTISB1PQXMeFikmy3q4KoBqM+YcSH+cUXRIDOL0AoakudFGcVcEiTOWhJJXExlLTHi
	PHj75HyKI9T3sSohKa/nd9cACArMLW3/Jdd6SKmVOIJ1nAzpDPz2YoSWlLPDz7iSdAK8/l
	Lc3e/d66bly5/6MRWR1FNGpYiPbS6wm1ERdA1t6AVbMEVXOfrM7B+VSA3zzzHkOpIf/jis
	pg9bznAg5/PRbGnJz/9+JUgCu30Wu4Zahx1SI9wSGXUyVudr3S6E2KjULmjZdTyVtuSrf2
	gMqs+Zxgr2GCmKhM1jZkpfXoREjqu46hVXN7mqH2s1pb8Cz7ou6fthYASgJjZg==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Date: Sun, 16 Nov 2025 04:12:34 +0300
Subject: [PATCH v2 2/3] clk: qcom: mmcc-sdm660: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-sdm660-mdss-reset-v2-2-6219bec0a97f@postmarketos.org>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
In-Reply-To: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

Add offset for display subsystem reset in multimedia clock controller
block, which is necessary to reset display when there is some
configuration in display controller left by previous stock (Android)
bootloader to provide continuous splash functionaluty.

Before 6.17 power domains were turned off for long enough to clear
registers, now this is not the case and a proper reset is needed to
have functioning display.

Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
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


