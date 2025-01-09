Return-Path: <linux-arm-msm+bounces-44506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E274A06D1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 038153A2A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26039214222;
	Thu,  9 Jan 2025 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4tDzsiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC69214205
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397359; cv=none; b=cbYqGzDFI/On8qSzag8ixqCWvlX4UbcT3KkKt37ECpJQf5Teva2DaYG8EFjDl6gygt2mPJF38YVkQ1ifqKf3pRGQBbwcdkVA+xjK7Nma3b9ZJ+H25f4hoSDHVkAI2M97QNTwGJuQEkJjgTpM/2eb96hh45OH41P7J+TpHOGbgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397359; c=relaxed/simple;
	bh=2bskNibEbXqxfl2Ilmpmi+d9e6SD72hHz1dhkLTsXqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFo2YRZ7sCGG09gDKoPWWKDSf8V830Uv0PxFLw5ajmK6akSnQzujNbxq6xh1Of1sXHuhgR0/NA6br0q0khDMITuuWLLC06lziIT+zRNI//eHuMJmaG1vHd8OXQ7UaLSIDxcjQlc7S3gOyY/IXFnGmHAb6tIZTjPBYsI7JtaK8JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4tDzsiX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54252789365so577501e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397355; x=1737002155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aosplTLYhtpWTLaU5zR4iQWyyRW0YdWxTgdnKv+OWI=;
        b=R4tDzsiXiVcjWQKxwcpcuwZrpeVI0iiJvTQvP0gNdHs8m8TYq4b9CLao+x33dOEn1f
         u5kiV3grxKUVzRUQ+mj5zwoQAXd7hDeRJg5Y6MTVv4Lbz9JA95P0WdWEVtesj7B8b5cI
         H/cMZQ0OKv+Oz2HpjJ9n0SFhXs+NBw3jL3oT3BKcigg5Wgo1Mgkys9dPkiuU3WyPhmhn
         IuQHNUPXNgvJS5EdGmNLGT9u5rn2JupIBfBlDgO3wqh7pMURG1B9+d5edFlOIocDQXh8
         2D0Xiq8RsYP8rDf8SEDZo62tho16CnW69KM2p2E8ouyE4AqUBy8eEYYbM9dhPxPXtYZO
         PJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397355; x=1737002155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aosplTLYhtpWTLaU5zR4iQWyyRW0YdWxTgdnKv+OWI=;
        b=P+OSbBRA9QgE1ucFxVcMhQiMiMaFLW8ma09KzDLSKXKBIMPanNpJHESh2tEp3KRX9V
         ildi3S8LghhxW4aP4phKXWcGhtJr4fiifmAVC4XEOgQUg3I5wJohhvxte63JwR0g2Zcq
         m7Vf32Y5VJqYwdQtCq7Xbcloie7VkAOzMYlvZ2r3T700hNDWIpoKExQOZy3On9siRyRS
         SYceqDin0/DH0DGef5MWXy5McRFhToMyGSO91JBIfux/jUAh+iwg15B6pfEakzSUDzfY
         C5THjgzGeXddJ1gggcdrLH80X8OENJgIAraXIIhAfM5TD3sKNUZnaNYSZX7oI6PNHs/9
         GYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCAq0nRSmYN/QCXlwSRTyEDDqzw2v3Hu/SArcLJOd+h+KZGCsJoULfis4S5QPvArwJuewWYRtyjBLZ5deX@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLRTM3CvKY7rBxJ2tITFmEGDI9+ZaqJGOGVFsbGaKrBBoQuMq
	C9Arzembqs2qqrEaupLs7nuaigzDh5ion4YfLOixS4zFhgUkLdyefdWEsElwJhk=
X-Gm-Gg: ASbGncvp5Kb2kNxVcxw3jp3EZAN9Bj3zZjQee3vqK+ruSATNEUexnAu+yxQUUnwT2lf
	OlpuRUO9a4r5LyB3NllqWa3jeYrSZFSXc7zAdubGha+9e6rEq+4Jifi6vN3ceWLOix7cJsL3Tp+
	bSH/Fh1efqerrGTmFMWH7N9DdAKCSfDX+3kLXcZoJ4SDy3WgTpHamnOCPfNxfW5zmiX3IzDyyii
	0q+z9aLM+HC3rrq9nZaR+cJYzPlJ8SnDankjcTwO4gfSY1BTPbKwd23vrvybeRfGw25W57lqE1O
	r4Y225n2YLByR4/CB/t8whiR
X-Google-Smtp-Source: AGHT+IFurU+4fRGqLM1kG2UuFsjtR9sjwM9mtjisWHOKw7E/cc5bFihShsVmoDxew3v7KstsiFz9KA==
X-Received: by 2002:a05:6512:e83:b0:541:1c49:26a with SMTP id 2adb3069b0e04-54284815d5amr1743053e87.43.1736397355392;
        Wed, 08 Jan 2025 20:35:55 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec06e1sm73866e87.191.2025.01.08.20.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:35:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 Jan 2025 06:35:46 +0200
Subject: [PATCH v4 2/5] nvmem: core: verify cell's raw_len
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-sar2130p-nvmem-v4-2-633739fe5f11@linaro.org>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
In-Reply-To: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=930;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2bskNibEbXqxfl2Ilmpmi+d9e6SD72hHz1dhkLTsXqw=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnf1Ij5AW+SyAZq3O9yagXEl8p5JuqiY9aKUHLG
 RhBU+zo8rKJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ39SIwAKCRAU23LtvoBl
 uNSdEACYA0FlOl7h1SRtSGwI1DheVcZK27ynUAsZws+LY5hBTSfVsSnavmFZpuWQxmXmnYwnqWF
 wIL45e9gI3wZJUt4+PAJAuQIpJe2Gpc5V7boWVMEZiAryCZsZ+miWj3w1EfhvSXu2gbSSK0OURo
 rFBZAz6bRY/2V9OiZmmLOr2fUlLNxuIIIXXW1yF8HddBS54LUKQxPoz3UIvDUAI5lGXez/X2JWL
 AmJjyp84ID6JLdNWOfrxRzjRL9/PCua/5dnzWQe+Yr6SMW97qZ+QMvfTK/xnVcA/yazIGF9h29j
 jFDz/cYQqtt9I0Qk+bdMfdHv1zX7euOEQNdJFDCRrGJdkzgClGYovR0SeIaCOdv+vBQSe7NhZiq
 rJfjfVJHr8RH4EuQaY7dMPZ3PqfTMnSbL4WJWFWra6WQchwUpd/MxWF8UI6UQjfWAwPuChEwdVQ
 z4R7UHXcLbqWTb6FoekugjEbAwLTZrHeqsXmLi9meHUq7WTbaTjCj7Nhea/doW0WTQvZLVABbWD
 QZ8kAVuJwEZXYNUgSS/TzFOovX1B8Y0S2pPJ5zJJldJfBgDsktM40QpdUTAcN0rEEwJwsPZZMW2
 s0XCU9fL+tcK7bPER+AOb8OPDJO+mD20yOuVvxr5G1NEnSSv3+ae4Ak5YSnBhzUmhrvFxxWtuez
 2Tuv0hX+VSiecGw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
Otherwise drivers might face incomplete read while accessing the last
part of the NVMEM cell.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7fa85b0804db360035d7471002dbf79658d5830b..59885d8b6a19d01f50759f09d453b092d1ec44bb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -602,6 +602,14 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 		return -EINVAL;
 	}
 
+	if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
+		dev_err(&nvmem->dev,
+			"cell %s raw len %zd unaligned to nvmem word size %d\n",
+			cell->name ?: "<unknown>", cell->raw_len,
+			nvmem->word_size);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 

-- 
2.39.5


