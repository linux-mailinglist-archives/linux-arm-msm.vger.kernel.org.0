Return-Path: <linux-arm-msm+bounces-41112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFF9E98D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E9E1280EB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDA21C5CAE;
	Mon,  9 Dec 2024 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYCfjxXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F11B1C5CAF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754496; cv=none; b=JiO8hkgEGCVNLpxsydM452xU7XJIBOoSEdfORNoMtBQtrsjysz9W6MPZmnnZwGR2qgYKYJK2f1vissWkzd8JR1j0vW+O16vXPnJZ3dAUFgc2IVfdWLLPpP6fKcdR9uTIT+PIzt3N6pnLQB2OYdawHr02ci3jGGuDIHE5I25khsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754496; c=relaxed/simple;
	bh=5TLlUUFMlxVBRA9LfgfySqW4/f430JBLZVgZXAnTFfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScuHxvQtF/PG3zuFl3EJ25XxJS8YEhI5NhuGGPRcF+LDJz1n5safPAQLrwQutuXgCvZIEZTOzj9TgKmVWQBFAdZg8spBJ2e7QXk9YoPRDVp9hYmMNpoSQvk8rUPQ34R9N11Gx+4vyZHBWx9DoHE94qA6ohhAglQQE0jmgknU9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYCfjxXq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d0b85c5574so471686a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733754493; x=1734359293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krw1ZM4+VGT72qR1TvdXm8jH8NeT3h/uE5f54vAoMeM=;
        b=EYCfjxXqTs48ZuRdDdZlVdxSLs4pnh1JVDZsYThFyiSnTKZQLB6LcDCQTjTxPlQ0KE
         B6+Zc4pxpujf+1W5kGwS3wuRYJGaUd8cTVHxCWQfMR2CJapcnheMoLWzlldQYgV/wTrW
         dE5ye3LDwG0MXWc9x3QzJornxc3DGtB1K9qQSqd/t6Y/YMIVTk84djmaYH7FrnfLWGXH
         YZ6/RYucxW9WsC9G4Mp/ae77XLCGyy2gL9JJ83Xx24M9wsVxKfCwNNAVCSaLecs1EUzV
         iLrDexe00Q5tP0/K1U2k+gDWyfNaHsbuz4RINl2ln3FzoqqNv+mjvNucxoFWYffcqYiY
         Zwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754493; x=1734359293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krw1ZM4+VGT72qR1TvdXm8jH8NeT3h/uE5f54vAoMeM=;
        b=E9/Dgi8Xu8xXy1wDNsTPFHr8olWKIT90X9+PmzLLfU0IMrdP3lUrmqiY3spJZO/QD7
         OlKYABikfVTnPT3NtNVfDk17onhjDravydnStuFVDkM38QetygiDsk6aqvgsbosgs6S+
         fTPWQuWzphZ50tKNLMlAWSNUZ720aWi1qG0XsyHYSWxl2XwT78zEYcNnYaPZu8uuPA1P
         jBzw5g7cQPrsdq4XDHKV9k/RNal64AATxBCJUhrGqRlE26uTattZ7iSk8Bo+MRv4K2a8
         a2lKN69TMvAiPm0Mf85dGxBbVK/8DEIvcSUun4/7ZhpzblvSEYJcCPb+U0Mu63lIGk4n
         +QMw==
X-Gm-Message-State: AOJu0YxNe+TI5mYidYoELa6emaQ1jGotBOEq1ZgP+UojtxkQASXLkbQk
	leNE0vwgS19Vy8olZtVPfS+F/jqSy+rHipU8CPZZOdo19NzbtPUR1z8EIaiD3p4Y34SMPtuiI25
	3
X-Gm-Gg: ASbGncsGQDfTXl2yKQ0TsN3rlVXuDZIMjmWvKkxFXK4ZL22dKIMUoWQEe4/wVUkEt9x
	VIUd8pMVolSpnskodazoRoZfPBUyhTHGPEuLR4JcPdyWWtrYn/7QuxB592Mx+N+uMISj6MsMoiK
	OWxXi+xPOIuUqOUDPyW3zWDqvZ1i9xLLnLgJzb7jEt6hybNdZReV8ads9bPM/EYmskdzkCA0HUJ
	79I2EPe0BTbv93bm+u5b8ChzofzUVcXMc8SiRzKqkOby5uoKGDIrXgrslIa+5i7ALCFvg==
X-Google-Smtp-Source: AGHT+IHsI6iD/zVuMNM4tw+NA1uwfnkpW2LIFQgi41uLoAMlI78UMHhZxLJfaWOWrR8bA0DyMV1lKg==
X-Received: by 2002:a05:6402:2349:b0:5d0:d786:b87b with SMTP id 4fb4d7f45d1cf-5d3be7a104fmr5033011a12.9.1733754492988;
        Mon, 09 Dec 2024 06:28:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb109bc9sm2887141a12.42.2024.12.09.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:28:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 15:27:58 +0100
Subject: [PATCH v2 5/6] firmware: qcom: scm: smc: Handle missing SCM device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-5-9061013c8d92@linaro.org>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5TLlUUFMlxVBRA9LfgfySqW4/f430JBLZVgZXAnTFfw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVv5xgN8900fGfZBc1qQpYhJH5p3sIki/V9+Lo
 jHqa9tcWb6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1b+cQAKCRDBN2bmhouD
 13zPD/oCh6uonPTtF5PRZdZ8CbQ8c3GPgUXKd43349iH2p0wSErBDh4pob3eZb3wYp2L03Dzi3b
 mUnaOtKGWEVwOhAN9tKH02KoqHPJknxkBefYLUMXAKnmxC22i7WfgXwTD32+OsUF2kw5TfKCZ9L
 t1+sYYMbSA25pdAamsN8nxnGQ1UjgnuYL9rzCsjbDAcV29N6IaX9bhF6Tw9YLnFswXZ8jTvYQbC
 go8dSYEkym2K2Y0fOftlz1xtce2sXMEckDn0t5RFtVzTg1h4k987E+dKG8PSd8sCEgvvQBsQRKp
 aeEdlnGKNxw7IQWYRUm+WP0XVypLXmRt+yVMQDd/g/AuTAQd0m3kM/tR2WXcI5Pb1KnFLD7WPQO
 WxK+4Ln1ohCa/dPuZWp01LD3D4JuXYMUQtB2CSI1pCeR4deOwnsCKwKPUsi9mB5gNvsAhniwwVF
 4G6MMh2QxkdEirYDNifzUZHmVefA0TwjV2UbaOKTMqdVWq+ycAU/7ibt5gYoZeYu8zXf6ED6lys
 Pm4A+ZNluStmTGyTnx4J9AdMWho3B78f57+MnTyLFGxpDJ+5O/khB5wKdjEpeqD4aoq/r3Xx6hJ
 53ffB1rCj03ormMApr46JHHpXgpK6TgC8Cd1pg8fnUH3cjLkqZNgOKtr4NW7/2k/ucTGopPwvuF
 JDWGudroS+bxvwA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit ca61d6836e6f ("firmware: qcom: scm: fix a NULL-pointer
dereference") makes it explicit that qcom_scm_get_tzmem_pool() can
return NULL, therefore its users should handle this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 2b4c2826f57251f25a1bc37c3b467dde28e1268b..3f10b23ec941b558e1d91761011776bb5c9d11b5 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -173,6 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
+		if (!mempool)
+			return -EINVAL;
+
 		args_virt = qcom_tzmem_alloc(mempool,
 					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
 					     flag);

-- 
2.43.0


