Return-Path: <linux-arm-msm+bounces-10165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A5A84DEAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 11:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DF3287E61
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC5F6F538;
	Thu,  8 Feb 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+4PJJvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BC6F506
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389470; cv=none; b=eHhx16BZSkLQE9Rl9vbZmWaO/8dA28B9RacW/2p5haQ6wN9wozNsV7COQHO3HO0kYT+2mVPQtx0g6gyYcqXSOX0NctJ87rmY6lYiKZA40rJa2R/LRSArL7r4e8ciYih/GbsvCAE6384toxy96jA1hrOadReLMaTRWk6IwZU40g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389470; c=relaxed/simple;
	bh=L2PhbeqUvP+ARdsn5F6t71AsTmNIlOubM6y/Atgkp1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uo94R7FMS5T4L3tsR0IHZ6oMAPbTx3AfPTlqtV+sxGSz/+UbyeOWZWVgAaKdRNou9qKuDyL74KYu+9atQyJxFw4i/QOsLVCnE0OnnORUKM5baPq1jHDteRBGIxFUPxKf7kD65YyRskwTRIMpMx9y6qQsdrWXp1qs4VRaK+z47JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+4PJJvh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41008ab427fso15178215e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389466; x=1707994266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/7BlQVqaBg/YDuqV11FzeuMwMO0YVBlV+t3/dxolhI=;
        b=c+4PJJvhHGS7HNItJgeabKKr20TPvUlRyD3rcwveOflNxu4fWuEnOqrofbQ99vnpVP
         u+EEWLbmRTyJ7AoZSp94bCJOE5Fc4Eh2escnOpsX0Z5MEVIKHKr+3Ml3bhTokX+N9LkX
         EvxM3zhl35ix7US9EXPa6mQuuA5RJTgBfFnHcYlZ0kohzenZQNpw87SaOr/qbTlLUziF
         uHDjXQ2SS7kcSvr4A+5S1osGeUnIfp5wMZH/GFyyMEByY8OUtKOsAXbOy86fNb6U06Yd
         af6oxyZwzkzmk94cPGVDjrgK4JlD7H0++pmGyJ0FXrk8FnAAnzY7QdP1sWRYynnJ+aDP
         zoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389466; x=1707994266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/7BlQVqaBg/YDuqV11FzeuMwMO0YVBlV+t3/dxolhI=;
        b=KKipQNJOv73oA1mprmloqC+LufFql8BxWfyKeX9apneCt5L2GvmI48Jp8JJNRuFR9Z
         id8gaB+wL0SrOhucxJVApqzToLIkCuqRHNAec4POn5JpuZkZIaHINsFe+WAynSfleZqd
         oJv0k7pL3Q0ZzBTLApBgz9GbsStYX6Qca8O+yy9+NCwbVtqDRnGWCMyz3MYqVATzoy5x
         4URkgb6U0g7ox61by+EKXJWvdp9cPht3yg3w5sQts9PER9qPKjYz6+YkaD5xSpn5zuMY
         iqfNxxye0KynPeDfFHgpQUR6Si14tCCxVgrmAgP9PG/JwZvWvfoLQo7/u6tAilAyGefO
         F39Q==
X-Gm-Message-State: AOJu0YylYT4E2I+8VCV+oBicL4nHSuhbnH8PZ01/No7CZ+nkj2TJn0gF
	d7UgIC/vGVSJ9Gm7sXAzBZrtTd/kAx3VhXdW/C0Cuh1Gdl961me5Ej6KVGqwZZY=
X-Google-Smtp-Source: AGHT+IHTi+ezAr45plt+5btiNf/+Z44BIjkhX9loti1cioElEEUYsPt3Ul4bZ5qSnfdT8RnutWwY6A==
X-Received: by 2002:adf:f047:0:b0:33b:28d5:f770 with SMTP id t7-20020adff047000000b0033b28d5f770mr6464418wro.62.1707389466565;
        Thu, 08 Feb 2024 02:51:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVI3UQ6pnc1atVOZQK2GOKkZ7PnZOeLKdB7ze0BjOVHCvosNIlnawe+hvoC4mzhh/xx5CEzwDReml35Gg+aHu+lKdq0muJRglhLPrqunH2OA2YZsJ5xyWOXbbume4knhdMY9c6S/Rm5upUIjCrTN1tLpKTiLmbfYcaFw7HkB5swTnZiTOh24LaOF2P3yctp3ipJfCTwctpKucaQ42xwMMQ/yBZCvENZFhUl3ZBb8bPu0YBN
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d69c1000000b0033b4719eb6esm3308283wrw.27.2024.02.08.02.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:51:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/6] interconnect: qcom: sm6115: constify pointer to qcom_icc_node
Date: Thu,  8 Feb 2024 11:50:54 +0100
Message-Id: <20240208105056.128448-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
References: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
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
 drivers/interconnect/qcom/sm6115.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/interconnect/qcom/sm6115.c b/drivers/interconnect/qcom/sm6115.c
index 88b67634aa2f..7e15ddf0a80a 100644
--- a/drivers/interconnect/qcom/sm6115.c
+++ b/drivers/interconnect/qcom/sm6115.c
@@ -1193,7 +1193,7 @@ static struct qcom_icc_node slv_anoc_snoc = {
 	.links = slv_anoc_snoc_links,
 };
 
-static struct qcom_icc_node *bimc_nodes[] = {
+static struct qcom_icc_node * const bimc_nodes[] = {
 	[MASTER_AMPSS_M0] = &apps_proc,
 	[MASTER_SNOC_BIMC_RT] = &mas_snoc_bimc_rt,
 	[MASTER_SNOC_BIMC_NRT] = &mas_snoc_bimc_nrt,
@@ -1223,7 +1223,7 @@ static const struct qcom_icc_desc sm6115_bimc = {
 	.ab_coeff = 153,
 };
 
-static struct qcom_icc_node *config_noc_nodes[] = {
+static struct qcom_icc_node * const config_noc_nodes[] = {
 	[SNOC_CNOC_MAS] = &mas_snoc_cnoc,
 	[MASTER_QDSS_DAP] = &xm_dap,
 	[SLAVE_AHB2PHY_USB] = &qhs_ahb2phy_usb,
@@ -1294,7 +1294,7 @@ static const struct qcom_icc_desc sm6115_config_noc = {
 	.keep_alive = true,
 };
 
-static struct qcom_icc_node *sys_noc_nodes[] = {
+static struct qcom_icc_node * const sys_noc_nodes[] = {
 	[MASTER_CRYPTO_CORE0] = &crypto_c0,
 	[MASTER_SNOC_CFG] = &qhm_snoc_cfg,
 	[MASTER_TIC] = &qhm_tic,
@@ -1339,7 +1339,7 @@ static const struct qcom_icc_desc sm6115_sys_noc = {
 	.keep_alive = true,
 };
 
-static struct qcom_icc_node *clk_virt_nodes[] = {
+static struct qcom_icc_node * const clk_virt_nodes[] = {
 	[MASTER_QUP_CORE_0] = &qup0_core_master,
 	[SLAVE_QUP_CORE_0] = &qup0_core_slave,
 };
@@ -1353,7 +1353,7 @@ static const struct qcom_icc_desc sm6115_clk_virt = {
 	.keep_alive = true,
 };
 
-static struct qcom_icc_node *mmnrt_virt_nodes[] = {
+static struct qcom_icc_node * const mmnrt_virt_nodes[] = {
 	[MASTER_CAMNOC_SF] = &qnm_camera_nrt,
 	[MASTER_VIDEO_P0] = &qxm_venus0,
 	[MASTER_VIDEO_PROC] = &qxm_venus_cpu,
@@ -1370,7 +1370,7 @@ static const struct qcom_icc_desc sm6115_mmnrt_virt = {
 	.ab_coeff = 142,
 };
 
-static struct qcom_icc_node *mmrt_virt_nodes[] = {
+static struct qcom_icc_node * const mmrt_virt_nodes[] = {
 	[MASTER_CAMNOC_HF] = &qnm_camera_rt,
 	[MASTER_MDP_PORT0] = &qxm_mdp0,
 	[SLAVE_SNOC_BIMC_RT] = &slv_snoc_bimc_rt,
-- 
2.34.1


