Return-Path: <linux-arm-msm+bounces-80794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6FC40C54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 17:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 890403505EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 16:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFB8330B05;
	Fri,  7 Nov 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mfuKlY07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE99329E7A
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531737; cv=none; b=eWFFf+Zz371YfVNNZzIjloi6VzR9PgTFcqvYzqlkuRfKxMl4m7J01TM8/JaLWsSAPxqBpHnZpGkjra+CGjzkMKGxMMV8FPg5BNon3qrGQIRxls6biQc8VKesrp3ZK6dLBOMVHHXE14zCTP2NitkeAjWZ8/SnkT3hTuRV0u0bdf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531737; c=relaxed/simple;
	bh=yWJZX5pTtTBbyY/nQH9wW9jtpKcujH2KDm9MV6WcgRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ws4RnWZzSPh/t6L9h6Yw0icQ1XC0ALL/0xrkJ2r+IwpetW6ZqX9q/cGBhCWenrSyfGkk2WEllRVHX6LFInfaGK5U84BNfLGumPlpFlnrssdEY1JsEDlQWmseGhCf2c3hLuiWjRsLvlwtMPv5HuUlaR+N4luxl/XHmurRZocTf7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mfuKlY07; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640f8a7aba2so1540890a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762531732; x=1763136532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i36NG4+CnxJdtK2RZ//DyiotcskYlbpoGKFREpNJxY8=;
        b=mfuKlY07mc0etW1I6eSk8U2W497mQOF56sZ6VDWpJWEWRVSSGdyqOZbivlWLtybwZc
         tiIAkg3/HcV4f1Qo/qNh8y5OJrKzLnpaE+uzHohQAqyJDjEPm7EQwX/Mou/w2bl2U+4c
         mQ6hag13gzApHl/dCXqaZ7mJ1eFc1W8k/tB6t4QVPWxRIwjT4sAvG+CYjClTvGnMa4Fh
         g4eRv26Qf4b2UmrWBoFI8RG8aXeCoNRl3mZhm+Xbbgh32MGzktsKB28k+opWnyxajyT1
         B4H7efETIHotGR1ULbJ+5BfYtml5GXQQ8TXRTqa6i07fr9neskaX8bz/qWHI/KFue9lh
         aL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531732; x=1763136532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i36NG4+CnxJdtK2RZ//DyiotcskYlbpoGKFREpNJxY8=;
        b=I1SxG3tPkvO5tPBZ9bwOrEIu1T/D3o+naPa4nGovXLDhNx8rffhNGDfbkkk6xBXiYN
         uNeJhI2o9Oz5B3po7CbupU1zyKO5pjqQgwGX+GJXn4MkCvEyBSUjihtkvsrU0fGFP/BK
         jf81HkFSiwZDOAL88V90dD95AOE2PBPqPHy3MxH8WDimjHTAoiesQafjdjAIHEF8uFCN
         sPRXGcJxGCcS9aWn0qNzmSAbybaKIW/O96aXrit4MN4ZEB6b1RPYMWxv2SHNEa/osNOJ
         M3p++1tI+lt6zTeCy9iK/Z+YkfarWiSf3ivyALm3caW3bH1rxdKEYjv5GkdGzgu9FQgF
         ILKw==
X-Forwarded-Encrypted: i=1; AJvYcCVT3pz0gxvNFFqHti+thJNlAkblz03a/rgr+IbBXd0Ov7g0E8FtlsMHWXtvz/+O3X/HQS81FkZG7y7Uz4+A@vger.kernel.org
X-Gm-Message-State: AOJu0YwqvAwFUUbUsua4Cqwxb3MAUYBwfnQ0MqmkcJZcxjoDw0Pm2r+H
	XtCcN6opRJ1xwfYiKVH06FjTVTMm5QG5md754kbD7x89lcDTzRtBD5fGt6nO35XqCYnd767SPQf
	tQEA77k0=
X-Gm-Gg: ASbGncvJjpmzG4DJoJCBJvP6V3rfFGTchCFNgt/G78IOYEtp9fUEIXJ6+13vDAhsBIr
	gtiQ+VqC9KikNdm8djCTBxOacq/D6E81jadxU394G2Pdyp5AXRE+cR0qojtE4aonoYhc4tJby14
	XvmGASqYvKp7w3LLXKmwfqqLbt/e+kmuqcNHD7Ic2dpI1/2aa3BuJNUfvQx/OsqLsJxLYsWQCoc
	C1vUsc0q4cOX2sU/1qZ1bstBNdcJ2pp+mG/Mfoj+ZUxjW+BvsT54JslzSwKtfDtaQVdc+VRhJTK
	h1TjNwv88DEz6ugXtqAu9gDnQ7GIeCVXX1MIUUNv1kIvvbbpfG2EDw/YAEYSxLhT8z6LJ+AVdAC
	9iPvmLWxcFw+CvhND5aPqb0B3vBSnt9qYEKcfJUdnqbuqIVmdpw67pdff/rfRrSsqIeu7opVFwg
	ndBcCZDMWSek7FTJ4BavlxGuSeJNtPnWa1XNekzX6c21e4HKlzgY0Wt24=
X-Google-Smtp-Source: AGHT+IGwHC2zxo64CyGp8N6bbrIrT2S27jAM1f/m55hZJrxyvSql7IEb3+1EIi003K3x3H4dGc2jlg==
X-Received: by 2002:a05:6402:146e:b0:640:7529:b8c7 with SMTP id 4fb4d7f45d1cf-6413f059981mr3730411a12.1.1762531732054;
        Fri, 07 Nov 2025 08:08:52 -0800 (PST)
Received: from [172.16.220.100] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm4444376a12.5.2025.11.07.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:08:51 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Nov 2025 17:08:49 +0100
Subject: [PATCH 3/5] interconnect: qcom: sm6350: Remove empty BCM arrays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-sm6350-icc-qos-v1-3-8275e5fc3f61@fairphone.com>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
In-Reply-To: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762531729; l=1767;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yWJZX5pTtTBbyY/nQH9wW9jtpKcujH2KDm9MV6WcgRE=;
 b=4zcbiYwJD4C2WWOQVJKpY7aqjPmWPTB217iJUU4vwEVsg9ocL9+9WFfA/TmTJ8b8SF0q7EKHn
 2vYniMUYxWGCIsvid0N4wRR0KUrob3/8yWJHfXYAAoNxwUcqme5i21c
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Clean up the code by removing empty BCM arrays to save some lines.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/sm6350.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/interconnect/qcom/sm6350.c b/drivers/interconnect/qcom/sm6350.c
index 99c435a5968f..246549cb761e 100644
--- a/drivers/interconnect/qcom/sm6350.c
+++ b/drivers/interconnect/qcom/sm6350.c
@@ -1526,9 +1526,6 @@ static const struct qcom_icc_desc sm6350_config_noc = {
 	.num_bcms = ARRAY_SIZE(config_noc_bcms),
 };
 
-static struct qcom_icc_bcm * const dc_noc_bcms[] = {
-};
-
 static struct qcom_icc_node * const dc_noc_nodes[] = {
 	[MASTER_CNOC_DC_NOC] = &qhm_cnoc_dc_noc,
 	[SLAVE_GEM_NOC_CFG] = &qhs_gemnoc,
@@ -1538,8 +1535,6 @@ static struct qcom_icc_node * const dc_noc_nodes[] = {
 static const struct qcom_icc_desc sm6350_dc_noc = {
 	.nodes = dc_noc_nodes,
 	.num_nodes = ARRAY_SIZE(dc_noc_nodes),
-	.bcms = dc_noc_bcms,
-	.num_bcms = ARRAY_SIZE(dc_noc_bcms),
 };
 
 static struct qcom_icc_bcm * const gem_noc_bcms[] = {
@@ -1600,9 +1595,6 @@ static const struct qcom_icc_desc sm6350_mmss_noc = {
 	.num_bcms = ARRAY_SIZE(mmss_noc_bcms),
 };
 
-static struct qcom_icc_bcm * const npu_noc_bcms[] = {
-};
-
 static struct qcom_icc_node * const npu_noc_nodes[] = {
 	[MASTER_NPU_SYS] = &amm_npu_sys,
 	[MASTER_NPU_NOC_CFG] = &qhm_npu_cfg,
@@ -1620,8 +1612,6 @@ static struct qcom_icc_node * const npu_noc_nodes[] = {
 static const struct qcom_icc_desc sm6350_npu_noc = {
 	.nodes = npu_noc_nodes,
 	.num_nodes = ARRAY_SIZE(npu_noc_nodes),
-	.bcms = npu_noc_bcms,
-	.num_bcms = ARRAY_SIZE(npu_noc_bcms),
 };
 
 static struct qcom_icc_bcm * const system_noc_bcms[] = {

-- 
2.51.2


