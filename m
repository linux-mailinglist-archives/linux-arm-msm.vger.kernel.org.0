Return-Path: <linux-arm-msm+bounces-12894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC4386B583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 18:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 905841C21CE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 17:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61D73FB85;
	Wed, 28 Feb 2024 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qO8zF7Dy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF9208D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709139918; cv=none; b=WP+y/dEUJ+kNAT/ebzqSvHhYhRhUWbndPt2Var0cwgG/aZtOr8FiuIqZG6VsvF5+vvGx99QG3uCfzHKQvupVM0unx7ylGSEofzkTLbB+6+ezDAK/EzktlpJnNRFUOf7Aah7+NRi6+XBoEWbFfYQtc+2vu/a2ylnCOBwkhAm+UWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709139918; c=relaxed/simple;
	bh=FVcXaV24hqf+O26y29mEYjF1sOtwwqLMlU2ptNFM73w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G00Az6ZePCP4d/5yQVN/llmBcd695vrXYC+9kPBMFLoMMpHg+eB3gr6cnbAY90HVZiR+Q4E7n0EE/WGsdlXIuH3AUV344gLhUtKsv2OKilMcFXoZicvWn1QlfKqP5X53FTV2QuT3jTFwBy7YY47t00n2x4JfA7z1o9xtKM99TF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qO8zF7Dy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412b83cfac4so2000105e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 09:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709139915; x=1709744715; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=raKlYsxX1CoUA1rEC+HT6CFp25O9+mSwte0XpksV7ko=;
        b=qO8zF7DyTgCMXD7wG0DKdxOu71OQGKrY2AxOVYzWXrVxJunkMJti3dOukL3TBEZlOz
         SltLAN+7Vut+D+VZc0SDR7hIclprTo1qfif4JHGO8n+zXXFh2ZgTPDwi28iyJJuPG51q
         VEHVYkHcb9fhJm6NrXVtddPWD6NufK8NKB9qkgpk7y/fbIg1VwJg1BZaKx9+jCDWTGpT
         gd7K6jFMV4Ak61BrJ9Fqdha5y+uKrepMkLxylenRiEPsBI/udR31ZpDskHYnrxcvR9i5
         qtpZXmc/cMKhWhf2ESncMVWloc8PbxUL0kqNFbvXJmFIhdU342tpeORlNSDjXSK8NIjy
         p7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709139915; x=1709744715;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raKlYsxX1CoUA1rEC+HT6CFp25O9+mSwte0XpksV7ko=;
        b=QUkI/JiCxL9zzDyaD7RUwK2fSxd5WyTgP7aHuQtF8eUTrhOxmHnk0h3sEAKBrRSR3y
         laf7epoTb9IItXOc7YTjOcr3HF6yWACaGMboN8flis6kVS61tmqajaCOksy8k8PJ49p8
         HFH46IUK4hFRMum2zxGFxY6pcQ9VdqKD3J/YIj4a9GhHZIhUXBt/13L6rHWM6cBwkhXa
         mlcnAw78NlhQiJX9LYkuHy57fUj1vY2RiUr6sL+Eom6q94/+LInOIpYUzeYW11AGilYE
         5ZovmJ+mqPF7beOB4J2qb2AdqirShVfrcp8AQe5d/W7ff6stEspQNwEU7oAdoovb6Czi
         9l8Q==
X-Gm-Message-State: AOJu0YyozoVipgy/IOOsBDQcZ0+4RZ0QyZntOj/UD3WtFbSRRU65ItXu
	Lf9TLViBEcbKSxZgCgZ8BCEfhvQIxrjPcV9HZoMXN+y38S8o/JIBHpg209akvVg=
X-Google-Smtp-Source: AGHT+IH29p2SuKBey7ncm8GpoVCcz7N2S4ULQ+Fp+iOZOvQYBRUfhgtHj2imzhZ7YEPLUJ932Wrw9g==
X-Received: by 2002:a05:600c:4f92:b0:412:b7cf:9189 with SMTP id n18-20020a05600c4f9200b00412b7cf9189mr62889wmq.36.1709139915134;
        Wed, 28 Feb 2024 09:05:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b00412b0ef22basm2659365wmq.10.2024.02.28.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:05:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Feb 2024 18:05:13 +0100
Subject: [PATCH] phy: qcom: qmp-combo: fix duplicate return in
 qmp_v4_configure_dp_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-topic-sm8x50-upstream-phy-combo-fix-duplicate-return-v1-1-60027a37cab1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMhn32UC/x2NywrCMBAAf6Xs2YU0mlj8FfGQpqtdMA82iVRK/
 93gcWCY2aGQMBW4DTsIfbhwih3G0wB+dfFFyEtn0EpflNYT1pTZYwnTZhS2XKqQC5jXL/oU5oR
 P3nBp+c3eVUKh2iSinc14NldjlbLQ01moe//t/XEcP/jXYUOGAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FVcXaV24hqf+O26y29mEYjF1sOtwwqLMlU2ptNFM73w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl32fJaprd3yno2KQHTuZClgxf8NyyfMXSP+P3A5oe
 F2jmTQ+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZd9nyQAKCRB33NvayMhJ0QWoEA
 CkBL9dLTftxjIWRvnVqNsN90tY0MZj4bBejTiE/CMyzVjzNXn4YiMqSeEjnTZFohFMbGhnZpeCWJHi
 WzUM6e9tqdh3P+SUljyU8X/2nl2v8M3w6Knt/lQ0qri0SQSWg9H5PhIrXwFMNvP+8AZBMBFFzlY7MW
 hVrl5xaT3IZrfswDxrj0VPEVlOsUGPuzVmLyf1eXO8XFOOUFthXsDfpYFFjmBry8Zkqe6sDxjUcWQ8
 0iO1S6vb9lwIcnv5iaQYtQOsz7hyy8rUqLuDSzYvybuLhi8YfOZBQObKD2YLddyJcK0AeLYWlAogdT
 S4bMkWwjl6eZMdfX5OzqZCY35onEZr4/GkqtwhzEyqkP+iOl3Jfu+s9kQfTmZFvfRHzNgzEnMDebLU
 PRjD5BdwG5r32Xpn+4XC2tbOVS3A2hLBuKunjBRFJIz4VUOcV47CCst2MxqiWd4veeCFhv+TVD12wg
 K+nIRJNLb3KE+vEHeQd4foJOXAZGlH4LtuEnsxx7SqoP6SakW03RKwypmarjFBOKsVzNb9pbzHkvde
 8wOE5eLUG1/8eR1YI7JDOpNuceDmul9c2ek/jXNQjzgFxP+mdmjWdMt8JEleKrA+hIcngFNhGo+soW
 0PjZmR/JDVNDO7igA1yMEzrd/kiSK87cdPUN5Rco9xL4X/iTK2U4ZfcvWPwg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Remove duplicate "return 0" in qmp_v4_configure_dp_phy()

Fixes: 186ad90aa49f ("phy: qcom: qmp-combo: reuse register layouts for even more registers")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 546d3c6bee32..2f341613fd31 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2431,8 +2431,6 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
 	return 0;
-
-	return 0;
 }
 
 /*

---
base-commit: 20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
change-id: 20240228-topic-sm8x50-upstream-phy-combo-fix-duplicate-return-6b5135756006

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


