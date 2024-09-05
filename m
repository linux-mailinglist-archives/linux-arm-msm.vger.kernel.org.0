Return-Path: <linux-arm-msm+bounces-30967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B5796DDBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B61651F22CD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0604B195FCE;
	Thu,  5 Sep 2024 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4hurzOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25518289A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549403; cv=none; b=Dczp5axCsaUbgJQ6dVYLsXjK7iqXi9P1sn+mRaS/v4NPYY7W+6zlDmH7vA+i6UO+KqCslvqlD5WMnPKxEKYWwE/HV6Glaq6SPfkzvh6nv5JlyDj3hYe08rK+Eoa5xXawGbWGvMGeLyyt3JTpTjLOxh/rWAEiBHqVyGeOHI7+bP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549403; c=relaxed/simple;
	bh=ekPdpG7oyzJtXPp+xFvsL02Ww7Tof9pw8p/Ac8jNKvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qZqKtTfb+20eEgzoezWPD7X3uYj8uAZPweD7TrgG1Tx0pjCziHyjBHqrloQGYj47PX04OBVwDIAoqH5CX7Gurk70tuRS1PduHo7pekt3JRi++psjvaFB9Byw/NcUU4HfF/2dvSWRb4uw2XAuiav8NaPJ7CuVxf0hUQNWHL4EqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4hurzOO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42c88128315so1198655e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725549399; x=1726154199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lbqQMJHY0wP1Gv+M3FnecbwVctkR8rJv1ZT1Z1xP6vc=;
        b=V4hurzOOG0jmrI3N7imHNPugDOKpqWArtBgEqnWVjGRC8w1tcTaEbjfXMrLxgdnjMv
         clHxMGkjY7BnuW9W6b3VRsf09yaMJHsWkcX/oTSbDe3hxw4c5hH1aagf2BhbV64dyhoS
         jgbQOn7iHYywxxfrzR9O4uoSXUeEA5M8WdKYJPHOZfCRJRZaogntbAbHGGi35o9fZYKm
         bzgDzVb78RlTqkCTSyibQF7hHTRh7B8nhkwuC+oi6d/3eyi0p1FwVCRzFqzY9LLHf1UF
         NZ3rWHWYvYRvXZKLbRXW2YLzuROWMy7k5KdRPZatIe4WteGVl9bu+VjTGxOdEjlNOZA2
         5o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725549399; x=1726154199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbqQMJHY0wP1Gv+M3FnecbwVctkR8rJv1ZT1Z1xP6vc=;
        b=VuBnIH+6kLPufMrjC0W5MB7/kiIQnJ68ib5xpxIeHpE2nyqzSqruK++msK3HUBduS8
         7yqbbheO0DEPVk2qqO2lRgNXywDw/I8a7aVHImi8Ir2fAopYQ7Q1+srPaUqnd4jVMGl9
         XuXjewX9zKudYeUbHnDfIGLf8B5nEvz/fPQkW6K3uXyfOWMkhl7HABVdcvzySL1ly6CI
         R6YctU3KRkp3h1Y77u8cT0IJONYyKtH6ak+abMJLVKhiIaxxlQ3gHBnW+ECwEUoek2vD
         n5dzD9hmLBln9HnbtMiVd5LpTXgmFdEaGmBfRHlsop1xukGFAr++oDVZyNZgJoIyvMPs
         x4aw==
X-Forwarded-Encrypted: i=1; AJvYcCXwHdAHC+uJNsY3uNNkvTArd8z57U1f6WxhwxpKC4NhgJ4LkuqZQhcg/trgt2jyxnrH35a6gZfgJUGI+6PJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55Rx6uBBCUdnbrfN6eOH2PnNj2HQI/ZnaeZyCrJYdZ77OZX8r
	b9AdEiCkdQqt9G/OPOLap4omQxeYl8UAkTYdXgOlagIBh9v67Rz03QXcxrOvIjc=
X-Google-Smtp-Source: AGHT+IGrqnC4Fav20HZ0B43mlW3Q7hCc6eUOmNpGzWD39vmPmtHqiCHTNhSqc6PSx7LNERIQuu47nw==
X-Received: by 2002:a05:600c:3b21:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-42bbb0a2ed9mr82336185e9.0.1725549398958;
        Thu, 05 Sep 2024 08:16:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbf15b9b1sm195072195e9.10.2024.09.05.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:16:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] interconnect: qcom: msm8937: constify pointer to qcom_icc_node
Date: Thu,  5 Sep 2024 17:16:36 +0200
Message-ID: <20240905151636.280065-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointers to struct qcom_icc_node are const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/interconnect/qcom/msm8937.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8937.c b/drivers/interconnect/qcom/msm8937.c
index 052b14c28ef8..d9f8ba69b329 100644
--- a/drivers/interconnect/qcom/msm8937.c
+++ b/drivers/interconnect/qcom/msm8937.c
@@ -1175,7 +1175,7 @@ static struct qcom_icc_node slv_lpass = {
 	.qos.qos_mode = NOC_QOS_MODE_INVALID,
 };
 
-static struct qcom_icc_node *msm8937_bimc_nodes[] = {
+static struct qcom_icc_node * const msm8937_bimc_nodes[] = {
 	[MAS_APPS_PROC] = &mas_apps_proc,
 	[MAS_OXILI] = &mas_oxili,
 	[MAS_SNOC_BIMC_0] = &mas_snoc_bimc_0,
@@ -1204,7 +1204,7 @@ static const struct qcom_icc_desc msm8937_bimc = {
 	.ab_coeff = 154,
 };
 
-static struct qcom_icc_node *msm8937_pcnoc_nodes[] = {
+static struct qcom_icc_node * const msm8937_pcnoc_nodes[] = {
 	[MAS_SPDM] = &mas_spdm,
 	[MAS_BLSP_1] = &mas_blsp_1,
 	[MAS_BLSP_2] = &mas_blsp_2,
@@ -1268,7 +1268,7 @@ static const struct qcom_icc_desc msm8937_pcnoc = {
 	.regmap_cfg = &msm8937_pcnoc_regmap_config,
 };
 
-static struct qcom_icc_node *msm8937_snoc_nodes[] = {
+static struct qcom_icc_node * const msm8937_snoc_nodes[] = {
 	[MAS_QDSS_BAM] = &mas_qdss_bam,
 	[MAS_BIMC_SNOC] = &mas_bimc_snoc,
 	[MAS_PCNOC_SNOC] = &mas_pcnoc_snoc,
@@ -1304,7 +1304,7 @@ static const struct qcom_icc_desc msm8937_snoc = {
 	.qos_offset = 0x7000,
 };
 
-static struct qcom_icc_node *msm8937_snoc_mm_nodes[] = {
+static struct qcom_icc_node * const msm8937_snoc_mm_nodes[] = {
 	[MAS_JPEG] = &mas_jpeg,
 	[MAS_MDP] = &mas_mdp,
 	[MAS_VENUS] = &mas_venus,
-- 
2.43.0


