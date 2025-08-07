Return-Path: <linux-arm-msm+bounces-67971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04840B1D39D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 09:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16ADB565073
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E436724DCE2;
	Thu,  7 Aug 2025 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kq23wH5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E64246BA9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552617; cv=none; b=nYnQwED11Lc8mykrQK7tTKSmfCcjsnXKQQlc151JGZsVCl6vAxsJwIPyNYwl8BoweIYM0fvYdlGiKvIH+Bey4DNJ8cKGCGSW1nLYjEllezp1gCZBFLRfrWmKBol1vJWgKzQhSVjugwhVkvrQssGiLUSFVUxdBk3HJpoz/q2HOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552617; c=relaxed/simple;
	bh=RRxiBs16r7KTIHUs8Zak5jbdXnfM3F+ay1jRs1C93GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPXXH5tciBAFIcwuIJFMds5DNLl7QNR7EjKAfVmmaxM7h46Q0JJ0mik5DI7CHvD5wfSA/4jVG7mqlhVC3bNTWcJiP9hCsWVii2gzAIHRD7X3ye3XEVB5jhF7qjHHZ34nXhnFUKh1FbZxjYFgYyuA0XWQUdCny6iI2+T66iLQsmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kq23wH5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576N7Dte025041
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 07:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IAd5Ze4vzEv
	wh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=; b=kq23wH5DE2+oLegmUvtX/zF+xtk
	g/FzoL6TijTXlnE32k18k+uqSgh8GeqMAlROGd8glIE9JimOn/gvrPY6p1yT/M6c
	hvUYYjy4mKzw+PWBhlybCB5wlRK4tCqB0FCGCASdh1dyJ9cLEs6wAAtNrJ2azJPT
	SKfMOV/BLmhYZPeropj9mMsLU39N7O348ny4KPgPgyf2PN8cRiTk9ExORGz8YT64
	ueOIL8NOdJKbRwlbVIpTO626RO+4buwTgyDjSliJXBp/cbm1jPai0e721awRoUc5
	WYQjTUZUMkAhiXrnLddJIHwL6ITOAcnK7Y4a4wYDy9lIm9U/VAf+qaVK4Og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvywp78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 07:43:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b321087b1cdso1092044a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 00:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552614; x=1755157414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAd5Ze4vzEvwh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=;
        b=uQoE1WHYf5u4/XTEem2TX/FdTP7OLQDk9eW+X5RQx62J4sD5hL0W5axYHbKqZKjtUy
         SP/MyOy4pX1xhd8y3y4eurzde/ku7cL1+Cakm/YEWJW0/cpI7eSLoOSXXK3PebvTuJZA
         BnNDA/7FAfRH0vwlGm7SsT+hjet+xr6ehY4LQjW4q9TKBHkl65u1jAm/bYT5rLBFhbGA
         F7uCLBMooPbmpCwMXrKWAYCiXcBpyNa/zGmNLMoaIQIJvpXeKc/h32XOSDIORw/8ho+r
         CuNxJ1d7bB3RIlYB7JzEBy22Q1z7b3gIfAY8zBvOx5mYqCgbdtCxYh8gz94qEI4Odf/L
         aQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCWjvZjT3m+WG1vYPP9DVhrIuZsfol7dvSFu4DxGHubG/zWRIZqmm7FXulO8g8F0sg42wuXj1vq1leiIFUFv@vger.kernel.org
X-Gm-Message-State: AOJu0YwStG/RFZtOqbCf2GEDDHrEpfdMrfiprCp8X0dXIp/8m7FUcwFa
	6qQ37uasQDii5aYuURP2PVuJG4ykLUmyUu/GRUTSPV24z+PKY47wiQP9gZxs0I4FG52egAL+j7f
	JXeW0ioDn9/YpovMOs0qN3ONt7/NbMPPaKv4SecUUQ/ZJP8UMPPeMUzUO0I6ZKFBvmonv
X-Gm-Gg: ASbGncsFPuEbVmU4Rg/ILPjWEF4sF6gpfc2sgyEtVrt/++YbUIHl5TuCHCXUoRSbB+b
	5XMytX0EBvzRrrK3Br/8Lx97dqWRtmfFtI41MvrabaVo4/0KG9+2rXy7OuFryQpQyhcdbGl7t9o
	rbgsxk11fmvTFfyVIDCWTo+qh8UZmRByoMs/Rk9IfPD6emm8oZHK6LvGMd+JNK7AIYnZV9nPP0r
	wIcIUerSyBfIF3dKGEuQ4HVkb8cwa6vaWXsvyM1/ptyJG3bqwNDrAGcOZqWu1uPsZoWqtGwfDEO
	eqWts7P/ePsGKq2954Q0R2FkgjIGoLy6c6VOH1VXvMhiU2jP/P7uPmA4bpcSuSNCqpQ=
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270815ad.33.1754552614149;
        Thu, 07 Aug 2025 00:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmQ70xW0VJBqeSlIUWMJPARL1fYQTkCAlkasjy9//oof5xTgkO6mW9mVoX4c12poiyfQ7JHg==
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270555ad.33.1754552613777;
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:11 +0530
Message-ID: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nFC4rwpB-DQcf1UCcoKhEfL-r_t3VoQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX2kOjT5ABOm0F
 VLEj1+wOmiSk8K/pjzc+2ZLTPhIHA64ww23NTXHH/B+KV12dgkFe3IsGSx0JHO+b3GErs8ONohA
 3VKDQlB05v0muP3he/ERpKmHAhhQx0bqmToG2vghBoFjgNfg042OpOQg9gMBVw3DIGaJbkPLd8P
 XJSegkmXyeYTrMebEhGMswoCtYQ9ARO5pMcE2R5cRSL9xtD5rxpPcTT981RAVoGMjsPozZhbhFX
 MuHD48CohlxYRa43GXN2cV+ZDcCd/tMWVaqjyxo7oh8nZT2gtxKaV/0W30yqUY9fSHrIcY2opk+
 XHfzCOUbZdRJd8lttHcYS545r3aKYY5TCcGY2T6zdJQmFZn/DawrjRlyND5q/6B6wLBqCcUvXN7
 6/C2KFrK
X-Proofpoint-ORIG-GUID: nFC4rwpB-DQcf1UCcoKhEfL-r_t3VoQ6
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=68945927 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wln2f8d1oZJPYHCAfSYA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com/
 - Caller of qcom_mdt_bins_are_split() was modified in 2/2 of this patch in
   earlier version, bring the change here.
 - patch order changes due to drop of one patch from earlier version.

Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 74c415774657..7522223835f5 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
-- 
2.50.1


