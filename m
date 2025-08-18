Return-Path: <linux-arm-msm+bounces-69559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA9B2A211
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDA2616D135
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1BC3218D9;
	Mon, 18 Aug 2025 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7M1+jlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7A43218A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520739; cv=none; b=lUuEaQ8Vh5aaJ7wjP1TKwv1nQWaC+wKqoWNLvShb43auimYwotMP63Id2E3kpQjvkIuakSLGhivBU2sHEFJZVEHlR8NIGnZreRTEha9woAwtpIq5F52BDmPTKi27jxFU6il0dXbC2TqZ4ID5cjClcpczg8aQxJvU8cJfN4rrmqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520739; c=relaxed/simple;
	bh=NNd+UhxgFiLUKQUDeL+TcsKdGr1tcHid7dcDNUh0G8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=roJup7kxAZBjVInHdGkvnimKoNI6OjbqYP6MRT56MPg46/woECYVMNy1e7MD/iajueq9Lanur9gzw3g+2U27Koh5xRenTUrc47I5CUm31k1cHQ013XQqFI+7eecq5Y63mzOFc7nWEiPXuYgYNkWkj9BLBVMK4L9OwORzI8D40DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7M1+jlz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb79fb221so53545766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755520735; x=1756125535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVidIAFOQ1pNMOop8iUArlRul1tpgG751/FDNho3w3s=;
        b=F7M1+jlzXfUEmjg5x258E7bgy7boqDvREUiPiuHlIIkipjmSgfEt5Ow6BvzRXTgK6N
         7XHADhnPkDRgyyAPzBLvjPGXj+lmQkFl1n0ILZEEOe+8peyeOe0nFOZ+S91PAmvLWHIL
         evY61cXcYgiZYGXOKZ9PPFuSpUkigEEbYPZh9L2NRIeYLiHXal673yvhFlND+fAahLYC
         0uiVBtbIabBqBeFtAEH8F13nrCVKLRVg8+X1WPhkFcHhWHdE7liTjWHCjB40B0Hvj+5P
         Anyv76J9QcWhSwKsuXPAC1/S0fvGJzBUAzidDrPcfkUskBUpGYzMQ6xoAf9X1fdL1KSw
         4puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520735; x=1756125535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVidIAFOQ1pNMOop8iUArlRul1tpgG751/FDNho3w3s=;
        b=xKHpRN6ko7Kucf7hMcGMB0DLTAb/upXOwN2j/URa0yFhaPBbyFk+zlagZNyHELxhqa
         +i1Gc5dnx94Z1oEcEyJ/wKYqzgqQkXVLN6njY1XNRuc35nA2FRyvc2kXcwG15cuKK/65
         nvpdVk/7XGMyEmE8x/yqvR8V6EdmMC0XnlgS3NxQjJoWbK0Djcmpa/0DsWjR05W/RV4p
         C+Jgb4gIAQxSu0RH1EZLqDyVE7mRsN8+tEt7s20dsveFhOMVIzhpPTVITeIGB+2iTVq/
         vqzBzCuqindtTv7bjqVHi8oqPr4GaElHP+quRy+it8a33iQERPOcxYLDuoCP1GnvpNCE
         4+8g==
X-Forwarded-Encrypted: i=1; AJvYcCVMMHYGEndDlq/1QC8yv1Gy61Rb3qqPszTSaSIFj785SHT/HLHB9wq8Sag9iCUh+CXKjSYOqloCaljS8b3M@vger.kernel.org
X-Gm-Message-State: AOJu0YxsG1O27d8QNlVhycg8p0aa2D+yjEFX1P25LNu7sIReEaLVgk6L
	mC1QqifH3vP8Wt4epTmmZObwKioDXkk8hcNm0byGKlG2STv/fCLELsOATzZnRL6T9b/yvZXYBw0
	jiLZg
X-Gm-Gg: ASbGnct84S77LHoH+fdDp0FEWY1thR2Fl52XzP8KafYL6uwAZ0JjrtNIg0DVZDUq9Y+
	61l6Gj6BWW/V8wb0QWUnEx5RnpQfmqL00RaQZ0Jk/VdSVAEsrz2gw2j1uDi3V0Oso0gm9/qkWIy
	GaDycPpzec+78oWbVuQQ81Vk6HJ6cexM9S0dlGBIxlFwE0hye8r5Hrmn70OMRlgtE/WyxVRxgYs
	YV9fLfUAWPf2MlJKNP6iiRzXEatIQXOj8nROjrhjac+Zfci1/pwrlL3A3WhXGSiq528c14cbXkV
	3lwuhupXmw6oJabZBonuoV8MI5ms1yKCXcCqYLxSrPd6qQOY5hTh11w7vY9LqmYClBNUSuYlpoJ
	2N9Ejhk4lypSquO0Y9ASAFlbpnhwx7JX7gg==
X-Google-Smtp-Source: AGHT+IHXYdPtY1MDFkC22yLVUpu+WB8sPm6OdmB0qkvl3/Jlp9B/FVBmvXmSnUDcwl7JZMcG0Z1xJA==
X-Received: by 2002:a17:907:3f90:b0:af9:5903:3696 with SMTP id a640c23a62f3a-afcdbe7be35mr491927266b.2.1755520735432;
        Mon, 18 Aug 2025 05:38:55 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53dd5sm786600266b.5.2025.08.18.05.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:38:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*() errors
Date: Mon, 18 Aug 2025 14:38:52 +0200
Message-ID: <20250818123851.111326-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=NNd+UhxgFiLUKQUDeL+TcsKdGr1tcHid7dcDNUh0G8A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoox7bkcKP6BHpCB3hJNSehZPEnE/cAIc1+e8fc
 nXJFPNIyO6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKMe2wAKCRDBN2bmhouD
 17XWD/9Zk77HtVCcEOHh0wTT8Vzbetf+z4DWBIjVrAv0xplZ8veRVqhc+G39eIDi3tDvW0oVSPg
 0kkKoVzwKDScptyI3Mr/ce0NQohxj3YZK5y6zqe7NcaBwXFZKI9QokTMPD8Xa7M9GK+tXg8HFzu
 K8zoZEOy8mVYqsR22x8NQMMUueIWLclshHZPuJnpAdA6tjWwLeR5oFtUUF93YwreAQ052r2WlXP
 K3vAY4INYsMBWi5VBJRW9x955TK2nAlLOWZkHYsKxpaYU/vB+gp4LF7D3Eo/RPp0IZ0wKfif//r
 j8V05z54SRgx2tjq6ro/GZxCzAdTaNWY9ME973WFyGuj/sauiI77GKHpizNF1YXZ+RESBl1ruIm
 9hLA00toCc3RCsvRIIZC4DnNAps4KXZ9iVMOSq4iVgYitlMN1M2OHbFdPZy1mjEA0CxT38U5K3u
 Fe3PMC5KBvdb9vQnf26bQlaUc3bcTi6s9HFYuydKYdMsXpzBaKTZN0QsjM2Lz4Cu1hAdOGTKa6S
 4EK3zaFoSNjy6pc0AHOfo0IPoqi1eQbb00fZuP0DxIy+hxd0Jwcg+ci4Mt4YaX5BeaDvtDq/zEx
 BbYZ3sI1rWdvSplWPTYVebxnrwtksTMDZRq7Gq3vcfp3WuRK6xG/CZLGOEuom3kIarmB4vxROnm b4E/eETCaXtHoOQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
or ENODEV, and if that one fails with ERANGE, then it tries again with
floor dev_pm_opp_find_bw_floor().

In theory, following error paths are possible:
1. First dev_pm_opp_find_bw_ceil() failed with an error different than
   ERANGE,
2. Any error from second dev_pm_opp_find_bw_floor().

However in practice this would mean that there are no suitable OPPs at
all, which is already being checked in the drivers probe() function.
This is impossible condition.

Relying however in the interrupt handler bwmon_intr_thread() on
preconditions checked in probe() is not easy to follow from code
readability and is very difficult to handle in static analysis, thus
let's make the code just obvious to silence warning reported by Smatch:

  icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing possible ERR_PTR()

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aJTNEQsRFjrFknG9@stanley.mountain/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Grammar commit msg fixes
2. Drop duplicated reported by smatch

Changes in v2:
1. Rephrase commit msg (Konrad)
2. Drop Fixes and cc-stable as this is impossible to trigger
---
 drivers/soc/qcom/icc-bwmon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 3dfa448bf8cf..597f9025e422 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
 	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
 		target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
 
+	if (IS_ERR(target_opp))
+		return IRQ_HANDLED;
+
 	bwmon->target_kbps = bw_kbps;
 
 	bw_kbps--;
-- 
2.48.1


