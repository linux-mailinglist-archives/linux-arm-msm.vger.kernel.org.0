Return-Path: <linux-arm-msm+bounces-50181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362BA4DEBE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842623A6756
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFBE204C3D;
	Tue,  4 Mar 2025 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2U96kjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8DD204680
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093639; cv=none; b=XjKg33SVU+QPFxJ24acubOyvJvv/O4AceyjYue5E3SvZcZABCdlA1X5VGnyRABJ9KwU5QnbY0QIu0o0e7ekN43/9jP09NTfzLmvY2lF8cqpyeI84px4xwZVdx5LEFOeU19agxGXAmgeQDQAm+xCL5dZw+hG2LseTGkVA8X8lD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093639; c=relaxed/simple;
	bh=FaXxWBTtA0V9vWn2OFkttUFzPuAdqQgSnU2vFsSbkqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iga267PsJbExA3TKQVBHteFviMhTMUF1fdRHPyTsLH2gePCCAIgAi16CGF07IJqPFa753hndf5L8Ovkwkhqpsw2laoTODivvUrm02K4O/XPOq4Hub2r7bDtZI3c9DPLXlswCVkb0chjI78LNfeiaVCgOMuVYHUSRbuNKpaI8Erc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2U96kjI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-390ec7c2d40so3884630f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 05:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741093634; x=1741698434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6HSOnQBr0FDVpREIMoFhmB69JXqeBMODdqv9u5g3C4=;
        b=P2U96kjImqkUyovt+nf7z/PdDXHS4hm/QKlqa2kM691zNt/05WLjSvlTI/h3uZIfHi
         UQErMq7C3EhO7fEJwHfNV1h42wTwUL9/nsSH6OKVTTdJu/lZIBtSXgmpnXQJaUtNSWF4
         47FBRKvGCqdrqL8kD3iAYlfsggwYvw26tcwdogR/RDCMkK2wMvlDw/B8ADyuLvm3QfGc
         zq6aTEG13xKwfcF1Pcq1gPGlvn8FPLNyWHNnVEkvGp47Z30dcoVLLzitj4D+DKUE/ceJ
         2PumeYTkppHEZWcF+xwieOXkKAuGgoX1gobfjQ9APrphRlSv9iV7Znwj0omtxKYa+ZZr
         kH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093634; x=1741698434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6HSOnQBr0FDVpREIMoFhmB69JXqeBMODdqv9u5g3C4=;
        b=sROSk4cERZS/kkyTXWeoEFzv4dsxoVYfnlEDKeEsULjXDbh53YnWtK43fzA8z0UdX5
         CmXCvw5gLmXwpMd87r3p/4veOjevd8hNSRtigQ+QZtTtYgiX20ypXGF5ywd6YyBM49nE
         2jOmbHem/G/lFyjNml2pLoJUBc9isqR7K4qjZCEZ1dMYZMej2zOJ2uoyg1pIdJnL8EIq
         Ltx6YC/v1fggc66ft9w1PCwrSy4LPGS+AJGvdVyTgb4MZFpaEx4tst2TLRxYL4yVey2E
         XqS7bLrUe3j4LmmexwdW2rYZw/hG2Xd/m2eCO5xI0N+AFL2QUbTZPIxpgyXTUODSe2un
         KZjw==
X-Forwarded-Encrypted: i=1; AJvYcCUfpCXTlqOcTav8ENtnmTPs+IwEq1Ls/d6DyyhabnrrNAYakVTLPKhwGCG2rxuCCQA+sSEfLhyiN05J3OS0@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1aNSfYB3Wcx2x+4dBSjHyZzrGMEa1AH3nn/AbU5UbwB2FIhA
	wv9lEUEZTS+Y4ffV85SqUST/EbB/JEH3YCnHkDA1DkQvsixxlMkVItXCFmHJVCdCI7eYLs1VEQv
	2
X-Gm-Gg: ASbGnctuk+Fujj0dTz7Nr1wLKP1P6SvDYduvwMkXhSXp4A5DjjkTPDIs/B+XN5eWXFR
	U23OjCvk3Q+fL4gWi93Vc6I4KD2RW0LxB06LFGQrKXEgFDUmCS0oYq95EEnDHTrPy4CaTRqIRFO
	NPKX0CGq77QAnPkj8afJHPlmnkkKKJuVzNzpBNqU+cOefiUvXn28CKzLuo5I4cckghXGBJI2nMZ
	W/X6jM4z3c7CUvcdF8oDvtaKffzjx6th9kRYCCafGq6EKf7idQQZ4hTRKuUpMAEoAm5xvWB0qyw
	XWab+tziHJ9orpmYngKtV9dS+MOQuThY/QDcLaKhSXdxXJbe//ghlHsVNTwIzL55ZlqD5newEqk
	7Q79rog==
X-Google-Smtp-Source: AGHT+IFd1jiwpx5EeofZBxtQSONJsTOBslCT9aMW9/Tof0U0ChG1L8NGbIX2J18ydo0KXKMo/1Upcg==
X-Received: by 2002:a05:6000:2a02:b0:390:f412:dd41 with SMTP id ffacd0b85a97d-390f412e13bmr9259864f8f.53.1741093633694;
        Tue, 04 Mar 2025 05:07:13 -0800 (PST)
Received: from [127.0.1.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm17401715f8f.44.2025.03.04.05.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:07:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 04 Mar 2025 13:07:09 +0000
Subject: [PATCH 3/8] media: venus: hfi_venus: Support only updating certain
 bits with presets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-3-279c7ea55493@linaro.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-33ea6

From: Konrad Dybcio <konradybcio@kernel.org>

On some platforms (like SM8350) we're expected to only touch certain bits
(such as 0 and 4 corresponding to mask 0x11). Add support for doing so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Link: https://lore.kernel.org/r/20230731-topic-8280_venus-v1-3-8c8bbe1983a5@linaro.org
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi_venus.c | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index abeeafa866971..b595f72b3afc4 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -38,6 +38,7 @@ struct freq_tbl {
 struct reg_val {
 	u32 reg;
 	u32 value;
+	u32 mask;
 };
 
 struct bw_tbl {
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index a9167867063c4..ef2ea4727758f 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -359,10 +359,19 @@ static void venus_set_registers(struct venus_hfi_device *hdev)
 	const struct venus_resources *res = hdev->core->res;
 	const struct reg_val *tbl = res->reg_tbl;
 	unsigned int count = res->reg_tbl_size;
-	unsigned int i;
+	unsigned int i, val;
+
+	for (i = 0; i < count; i++) {
+		val = tbl[i].value;
 
-	for (i = 0; i < count; i++)
-		writel(tbl[i].value, hdev->core->base + tbl[i].reg);
+		/* In some cases, we only want to update certain bits */
+		if (tbl[i].mask) {
+			val = readl(hdev->core->base + tbl[i].reg);
+			val = (val & ~tbl[i].mask) | (tbl[i].value & tbl[i].mask);
+		}
+
+		writel(val, hdev->core->base + tbl[i].reg);
+	}
 }
 
 static void venus_soft_int(struct venus_hfi_device *hdev)

-- 
2.47.2


