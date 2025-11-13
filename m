Return-Path: <linux-arm-msm+bounces-81672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88087C5913D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 18:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52F174FF310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 16:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE26F35F8CB;
	Thu, 13 Nov 2025 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts00Z7qv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE2235E54D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763050539; cv=none; b=cWlE5DRUmhloLOsYeaLrEkFVNQXS+x4fAASIRK2HKySAETS3GUcGNCOH2mflm90kF1OnWrq4beYTPnmjMLxortqDR0TiNxsTcCLaCGaTSd5MIAesSgVSrsANa3qa8cg4Kkrc9XZQaOpPotG/Pd6SqmUWpyGbNSjhtxzkFZykyHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763050539; c=relaxed/simple;
	bh=TWEkez4qa74/GelrihI7Pr5Km20IEaqU/Sv6EgMpAwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O/bO+r4xqppE8826AmzgJFkVjsYiJztu8e9b7VK7DkLLY1ppIc+qJfuxRDT40ZO+TUxEP5YM3GG5JrEkVM5mO70Q4D6h5L6a8RUnUSelGnI+F4iyUrzlVs1Zrq8CmEmnKPESzSpK4UyZ+LqT6fRHpjoGumx6xXu1+7+5xXxejRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts00Z7qv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477775d3728so10384875e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763050536; x=1763655336; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8KjP0K8IuiEFgrTGQMK3BBanWGBPr/IHVcMMlCVe7Q=;
        b=Ts00Z7qvu+ECstOffCDEC6qusMVZolPoT8nUi//+/+U0CtvSoV4+OBYfptrNuimTw5
         q59hl9qNQlGkZyMaWUG+Kjj1uFuEUeYroD8y+sls+otnk6+hKe+CSUbMLJkBNSQR+qsg
         nX8ejlfIrq79sm0BTY5agVWtSOAG9use3IWXxTAwPFsrl25laYualq1FfELGS6q1gp+c
         OkN242zwFgGs4NNBlPoDdIpqVD1/JgO4DbEsAZtiYR/0C2cH8pfvmuoZWgaaXWKSpNtn
         Kxaa7zFdXsi16GkgyuzrmXtyPI1zp/hA583sDJQ+8VsmAscHtLNSAJctdWkklNrSuIgo
         CxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763050536; x=1763655336;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8KjP0K8IuiEFgrTGQMK3BBanWGBPr/IHVcMMlCVe7Q=;
        b=xQeOFm2xz1YFyIHoLaybo3oPvmZSFzCT1jeN/NTVaqJNtPdCvCwB21BtksWAEHg4YH
         wdveKdEEoh7fMEJzrtVKEL5lPlAVkr/jUche801cVWuc+q3/vx60y9gIL8VXRV04TZOg
         9f2lJpmIjxB3+3v+dTI7nOCwUuqiSZwAXcUUjQ8B7QfSfzg2NAz2ox/1s4oUfBgFoyrC
         xqwawfarV+E9N2mJiU7X0XExDMDkYKmXutQKxE0LoOWWO5f0eL5ZsFJtzo7sfnR8eq4n
         clDwb6DNeu25ysYp1bnB4d0qVMPCA2ZRUTUMur+AOKuf/N9heZkdCuT2BJRXw9igasra
         HBqA==
X-Gm-Message-State: AOJu0Yweo2ocINgpxxTiT5+83XZRNajaMIQRLMV2Mncn7ALjz4qHW4U6
	UwIdjLUtK3wCm0ziIHgPUGsdkYeOYGLFKHG+ZHnFG3wq793SzFuiPxwB
X-Gm-Gg: ASbGncsHUmYLWpHWqdCOAT5go6igGUSUZxO/C5k1jnQP5oztk6ARij6pVxxXWQPNET2
	H6UuJihmw2ctgp7VxtQjE3YG/WdZrLTJcH+lNPbeDRuxfLuu/kjO4bojMMM2uSheBjdzNQihHzo
	VDv7OwEzY2k60rZgEg2GP1mAHbExZdwJKrDfnoJsEGl7XhVR9q5rj/GyO2t10wgk2NMWRnMKrU2
	W2ITlqWKe7YqPGwedDJfROr0oXyxoqM0VTxXW0E1gbeRYkfmLeSJ0wnFURb9pZUKtb3ve87FgXF
	+FBOln/xCgi5Yu1oY9TNPMOyZmwlQu/DNH1i2woN+wdxTmMM0N2QAP4o20hE/+Fsavpy/F6IBIc
	BR3hSpdXh4feG1MgTfPcMAl/BukwE4MUeqHEqwKVLd5zehP0rfHqjbzpPCjOTVyoKzGLj9Cp5Ra
	5mNiQxlbkjQSivttj+9B5io6HTFLga2g==
X-Google-Smtp-Source: AGHT+IEQBr7kyonNOCf+6/ITah462rsUm/fMGQESxqAsjgQp5o7DXD/7On9C9thqMTrE8oLwe3DOSA==
X-Received: by 2002:a05:600c:1d0b:b0:477:7975:30f2 with SMTP id 5b1f17b1804b1-4778fe5ee38mr587435e9.10.1763050535961;
        Thu, 13 Nov 2025 08:15:35 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4778f4bc9c6sm11445025e9.14.2025.11.13.08.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 08:15:35 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 13 Nov 2025 17:15:25 +0100
Subject: [PATCH] clk: qcom: apss-ipq5424: remove unused 'apss_clk'
 structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
X-B4-Tracking: v=1; b=H4sIABwEFmkC/x3MQQqDMBBG4avIrB0w0VjqVaRI0D/t0KppBkQQ7
 25w+S3eO0iRBEpdcVDCJirrkmHKgsaPX95gmbLJVtYZY2qW+HeNbThhXjewj6rD+Pvy4zkhuLZ
 qEWrKdUwIst/n/nWeF07T1OBpAAAA
X-Change-ID: 20251113-ipq5424-remove-apss_clk-79def5606ef3
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The locally defined 'apss_clk' structure is not used in the code, so
remove that.

Compile tested only.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/apss-ipq5424.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 4c67f722e009af2889ff7435535d7bc156192c47..2d622c1fe5d0522f00d7acb4614ebe4381e066c0 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -35,13 +35,6 @@ enum {
 	P_L3_PLL,
 };
 
-struct apss_clk {
-	struct notifier_block cpu_clk_notifier;
-	struct clk_hw *hw;
-	struct device *dev;
-	struct clk *l3_clk;
-};
-
 static const struct alpha_pll_config apss_pll_config = {
 	.l = 0x3b,
 	.config_ctl_val = 0x08200920,

---
base-commit: 682921ab33129ec46392b27e9dafcb206c2a08dd
change-id: 20251113-ipq5424-remove-apss_clk-79def5606ef3

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


