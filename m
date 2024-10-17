Return-Path: <linux-arm-msm+bounces-34796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D269A2B73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5982B2250E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343CB1DFDB4;
	Thu, 17 Oct 2024 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZE2ZVD21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBCC1DFE10
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729187570; cv=none; b=HiCOzM1aezwsvlym4KHH06Ms7WT//GVhqb2NzDCFxzbY124i3sxwFRxC8TJBo9w9n4+vz+nRH9GW9Zo3OMcWCl+d6iXTDsldCF28OOIyz6WKjbvNkOvE+zW39GvIcv1+nn6kEwnMVbpvnpFOE5RsqkODbTSs61czks0r4gNJiqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729187570; c=relaxed/simple;
	bh=E6sSET5NTanEf8su5V13W3kLbMh4cgFTxZO6VeLZC/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWIZcYqiceZsggCZRYd7wwhcxFwldp+O1DgZt/7TY2Wlsfb7vQmoj59LrfvIYCbg6ei6J6Yo/qmMPOvoBKjfF6nwn0RNTdFoSkVv4Av2GoWoWrqg76zglrjRE2S+VKb8fW9LtL4ua0HMC9WMiIv8eQ8UlbukKkJwMnf2C++jTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZE2ZVD21; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so14041321fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729187565; x=1729792365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGopXLJTzCLfhqUsTpJkqnxqFQeGkxJFucKx0VxQEO4=;
        b=ZE2ZVD21dWI6T2bK0f2+G2oa03al2DvKIw4Lx1fIJjnpUf/wUCCgGL+yZdufrKVd5U
         oBTOtFehedBX2hNwJiEA5d/RreDC/HabH6y5IIpdyrfgJUAQAwU5/kqJhxMUVNl6bZ2q
         C20AheVX1JOZNYWYYmvAitL1crhszGqxy8/+6oqMwXLf/VPXalR07WRpxZMkTak99hFU
         EAYlyNCjaglBUnHM3JnZBhBRwKavwpBG15gxzovyCPel3aF0qGlKhr8uq0TIknxRKlfU
         nCdh5l/tA2ILJ1XEOY8SHzJYo/vNRYAPxhJILJdjcy0iU+J1cKY+RqAgrTFsb/MsGyL7
         lF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729187565; x=1729792365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGopXLJTzCLfhqUsTpJkqnxqFQeGkxJFucKx0VxQEO4=;
        b=duBLnJCOOFWa7XoZ6A6Rj8PWBf5m62UwbOTVcWzzrNjMMnoMCTg54PVB/DileFoA1z
         cB5zC0qViGrNa47WfkHophf4dPol0hI0UqRRT5bWWM8BxlhWALAB1LUc9ApfPpyFbOXn
         EL0sfKEWK+8yVpuvrfFSgDaTNjxBv/li+L0nBJcmE/WYnzgv9XQy0TIiFznY6Te1bKIf
         Q6WlX2C8Jezkb1uZ4xgoFvIrzlSuCAQUPjcc7YPfOLRd2frFFkDFtmQvT9qoSA1MPQ+P
         HA+g/FhQ/Z7ANfwMhxQhA1Pq2fTiXLmqA/872PebSTODmhfMr82puz8sD0ekZZz3XXau
         sXAg==
X-Gm-Message-State: AOJu0Yyuhh5PtbTS5UTKR+/sGCQVtYRJI2ChmGqjhkk+Pw1/HdAKsQsl
	UGxnhJVfhBj/0hVxuniUC9DpHPOFRbFz+2nZDtD0suIkikAsW+9oqqQJ6BudTqo=
X-Google-Smtp-Source: AGHT+IH6+buk6yaAI9YJVrIAMsjfJtRGGoRZPI/6YbiUBaiUNOpD2lVTXPHL+siqaaTkG8jrqrmyAg==
X-Received: by 2002:a05:6512:3d17:b0:539:948a:aadb with SMTP id 2adb3069b0e04-53a03f81a5emr6415982e87.42.1729187565363;
        Thu, 17 Oct 2024 10:52:45 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00013f8bsm829557e87.286.2024.10.17.10.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 10:52:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 20:52:36 +0300
Subject: [PATCH 2/2] pmdomain: qcom: rpmhpd: add support for SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-rpmhpd-v1-2-f4bf7f6fd12e@linaro.org>
References: <20241017-sar2130p-rpmhpd-v1-0-f4bf7f6fd12e@linaro.org>
In-Reply-To: <20241017-sar2130p-rpmhpd-v1-0-f4bf7f6fd12e@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=E6sSET5NTanEf8su5V13W3kLbMh4cgFTxZO6VeLZC/s=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEU7oMWrzR66N2bIKoRCxtF+Wfk3UJKHC+yMm0
 Nf2dyxqYqSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFO6AAKCRAU23LtvoBl
 uOjvD/kBIY5uaOVx3oJnoec9/FanLeD3f5mDWUw1vZHIEhA/irTrfLYtoxNeUzw/zJV+oEALKV5
 NFVRSEUPLRGZwa5Fqjay1oiroZOLhOzUpeTaioGv6iU3WdYUHcNxVlFzXYY/cMr7cb90M26TD26
 fX1+/O/AwTRPCwfxyc/iwSFkz9Bajev4EXTwloe0eeVx+8CUlDuTg3HONFAIawH+QmvLWj5he42
 yiXWzB/4c1OPUVneGX/JBOGxl6f6B9RoVPI1wZvU3FX4R1ZMzn3k57ofITH5iQ0b4g8SrzokKXl
 uN2OMUTZkZFJorxCMk0S9FSu610TCxD0nKQOMTm8QvwQn7M7EIgxZ4bHNnEbX1ru7kKSpef5wop
 hpEJwe7C+vgH7yliVtK4jgCxwFcm71oaZtn49t/K6cq8JOr2+g7R7rSz6fZOJv7220fUXx60Kvq
 S+0tUnjXV1YoFOa+LQq2Yo8MnAn1/vTXZXJ+Rg37LL2Ovi8Qubj28m4WTuOzxttdIn+GoxKpQIC
 PQQELMoWowEaAf65JHb6dqW8tX/vIodP9Rzrk6ftV1lpDan9QWmv2QiHqcMxwnwxjP0/m8DKOxC
 2CnP7hJ5G7a1DEmG/IjFfMdAQPzz3h/Mh1b6GYxdk5YUsMQigp1GUGh0cxTb2YXBaepmtzq9R6E
 p+CmCqzR+k/o+RQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define power domains as supported by the RPMh on the SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pmdomain/qcom/rpmhpd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 731feab9f17ddae699815332d193e9a298fff0e1..5c5f9542c3925045cc90872e81cae3e6c2936212 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -259,6 +259,30 @@ static const struct rpmhpd_desc sa8775p_desc = {
 	.num_pds = ARRAY_SIZE(sa8775p_rpmhpds),
 };
 
+/* SAR2130P RPMH powerdomains */
+static struct rpmhpd *sar2130p_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MMCX] = &mmcx_w_cx_parent,
+	[RPMHPD_MMCX_AO] = &mmcx_ao_w_cx_parent,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_QPHY] = &qphy,
+};
+
+static const struct rpmhpd_desc sar2130p_desc = {
+	.rpmhpds = sar2130p_rpmhpds,
+	.num_pds = ARRAY_SIZE(sar2130p_rpmhpds),
+};
+
 /* SDM670 RPMH powerdomains */
 static struct rpmhpd *sdm670_rpmhpds[] = {
 	[SDM670_CX] = &cx_w_mx_parent,
@@ -665,6 +689,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sa8155p-rpmhpd", .data = &sa8155p_desc },
 	{ .compatible = "qcom,sa8540p-rpmhpd", .data = &sa8540p_desc },
 	{ .compatible = "qcom,sa8775p-rpmhpd", .data = &sa8775p_desc },
+	{ .compatible = "qcom,sar2130p-rpmhpd", .data = &sar2130p_desc},
 	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
 	{ .compatible = "qcom,sc7280-rpmhpd", .data = &sc7280_desc },
 	{ .compatible = "qcom,sc8180x-rpmhpd", .data = &sc8180x_desc },

-- 
2.39.5


