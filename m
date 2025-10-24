Return-Path: <linux-arm-msm+bounces-78671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FFAC045E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC40F3ACC7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 05:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B4B4D8CE;
	Fri, 24 Oct 2025 05:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3TPD1qC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA7126AEC
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 05:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283139; cv=none; b=QE0BxDJJYY8NUXeihr5Nfu2rvxbhZsqsmYR5l0ZvkGFeaEftUcYm6WQm9WlEMg4mKBpuMylLxL+3Tn2jPsyjCbftwLLSbz4n8QpBjx+hfonA1W31+wx71qXKiih5K0VFustqso6mhh+Gxg65SIlCTHiUJ8ysmSoeFoIj+6ZKqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283139; c=relaxed/simple;
	bh=XQ+JlN74f2Jp20YFK1NOgcX3NOcIEvg0gafRe+n0rv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ELyyqGnIWKBgcVj3z4KVG4LvfGkyfPGhFITirLdQoHJ9/M5k7AwFjqCnS0711Li1n5xPg5h9Vco8YOEDZZlyBEMj5CnJzkZiZ5KuJ+zKBL1OZZjmV/Bglj8YEg8BM32eh23i3rgM7S8JeiitponUTjZPNtDl4cVJcRfRtiMglY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3TPD1qC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3M5Pl010151
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 05:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YxDg8wob0BqVw0+zh6pPHL
	5Cq3vrRGqu/p4Y/OVXT+w=; b=Y3TPD1qCP/C6roN35W4+PKI5fFPhwUKEh6Znl+
	WU2HiBBvUwOYBJeQoLFK4UFSirj4oYHG8tDqSkG0qpt6lUBJHZk2SMEc6i40V4l4
	3aUGJH3BKJ/bd7XBAN7MuBr2IIw9VA4bpH+Pd/HHwMoBK44OToCH+wMKYFn7ICKy
	njaLRtgXFz+LvYLF00MC13mmnKNvnKLD7sFMtl9yJ188M0KmLiW3b5ZsNrcaKiir
	MIb3ubQ8A3X9i/RMx//Ya1qxAgZxAnOSe615ioth+dTPLnaKyq8t4mwGH0Ph+xbL
	i8JuA19qdds55g+7SSbr7CzBF8nANRMEA9ewB6X3Sg+vfnyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524d2hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 05:18:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6cf50cbd2cso1271290a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283136; x=1761887936;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxDg8wob0BqVw0+zh6pPHL5Cq3vrRGqu/p4Y/OVXT+w=;
        b=IbCzISdmL/1lbZAgha5QcDsHaNzjCEsdwp8BCItVPIQFF6eugwoKdBHDAkbTfBiBgr
         P5k5rNb+IuxUWc9iTue+8BU00Y+1Vh5eg+/ULcrhP5dimlMZWadZ6dd/Lrzqh67H2IwZ
         kpFYpJsxXaiaQ266VK1WaOtjercxgJmPDWcjMTr1w+oalskCFKT31QTtn2eELqkI6jmX
         XrYenQz/r0dz9c54vk7q5Lj0HOgbI3qZiEsNm86yMzAOgoGrVSejTN6jmaowEvY1CeMN
         6gRxwbU5J7jVDIArgIlOVv8SD3oheB2UyFtm4sO8OmOLYhVhdMXu1HtIdgb7+dZeKnCf
         AO2A==
X-Gm-Message-State: AOJu0Yz+dSGUI8nb66e0W3SWbVkQujobMoj0PDLrcwbrxjh1LDjpYk66
	dkDNFia7wxkJd3QqtA/sxkbkg9OcT+9S2v8h7+JfniTrP3v58NFV08K6Or1cCwmXst4lSAKpQkn
	5JbI5ro1s4g6mJYXyVMb/9bR5xwnXDKIqU3byPDayA67+EaROmxQRUxQmz9WR+qx9ivNJZxy9rj
	eR
X-Gm-Gg: ASbGncuqi8lObYPClytgN1F72R2JjyCSakRFBJ1wPENFoyDRchcC2FjaiPjElQHns5B
	4mM2spSguYeo0A6RZMKG0MWchlJpEEdIuTDN/CQqXdRl2benSaWAjBh/KEEvKIXL3/ubuGEToAX
	kBGJut/ODGx9VyJ0Z4lRXwFdlaVkdEasxpkGLC1yhDncWjukNtQjd2EndoISdK9hR2UKWVkfjs7
	S6+eDxpZYlnkpjY90ifC3YNvpNGPQ3rSLohS+JQBV/m/90yfRIICH9vSDQupg5z+L9MDiFlq1uI
	ot97Ilg4RCjKqZFBA8izJIkdt3vKUHuBWPsYg4U8cb0FCHmxKUVwT0/X2hQXxqVrbbA7Jpibxvc
	SIKQ7KjljFqgQXIWWR5efmg4=
X-Received: by 2002:a05:6a21:6d9c:b0:32b:6fdb:734e with SMTP id adf61e73a8af0-33dead4c669mr1477191637.28.1761283135827;
        Thu, 23 Oct 2025 22:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA3SypwBbaeYcsMylDsibkkJkFzpDnuXNKIAef7Zx6JcuxdUyRtNbCfZYucE711DH+oerQGg==
X-Received: by 2002:a05:6a21:6d9c:b0:32b:6fdb:734e with SMTP id adf61e73a8af0-33dead4c669mr1477162637.28.1761283135369;
        Thu, 23 Oct 2025 22:18:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb3636sm4502218b3a.61.2025.10.23.22.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 22:18:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:48:45 +0530
Subject: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADQM+2gC/4WNQQqDMBREryJ/3YgJKrGr3qNIiMlXA9VofhtaJ
 Hdv6gW6GXgD8+YAwuCQ4FocEDA6cn7NIC4FmFmvEzJnM4OoRFPJqmZkjVHBTELRrANa5TdiqFs
 ULZfNiC3k6RZwdO9Te+8zz46ePnzOl8h/7R9h5Iyzmo+d7FCaYeA3T1TuL/0wflnKHNCnlL5mX
 ooivwAAAA==
X-Change-ID: 20250804-sdcc_rcg2_shared_ops-ea6e26185fe6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX6jvYg6EvZnVG
 SGMh/vFAHY/Mg7WGCQCW7i7Xr8aEoKC9DyxWbJX3HT009w4Ju3VIZyw/vGZOkeqBTL++W0dMiVN
 KgZmK3BO4rL5Km7qm4w1RDxXwiI2xd//FusY6j+2CNX0/hOrcCbSDuSVQ98zHAiEgCb4WaOqglx
 zMrs/F/8U+jCFykw0bl8fOelzJG3SMsv8HRpHpoSGtOS8l6/rGVelOUubOUPXeTH6D1YndC+Oan
 IzAaITdQNOjV3huFuv07rudPaWxfO2v2x3bPTkEYiipu69oxD+qp50xcCw9EMlFb0UZCrLEAh5Y
 Z8fgVTH2Z5EoGPK9MvMBkdWgcQFb7LhTfxUuHonOP8RMArHPdlOtAbQ9F/JeHFMIHZWaeBLCDVp
 aiDkqWVm5KXKi4n/C71btreRV6OlTg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fb0c40 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FqA27K0koNEk4n6jG3kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: U7589q0FgZRwSXinHJH_S0kN_OKIM9t-
X-Proofpoint-ORIG-GUID: U7589q0FgZRwSXinHJH_S0kN_OKIM9t-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
boot. This happens due to the floor_ops tries to update the rcg
configuration even if the clock is not enabled.
The shared_floor_ops ensures that the RCG is safely parked and the new
parent configuration is cached in the parked_cfg when the clock is off.

Ensure to use the ops for the other SDCC clock instances as well.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-qcs615.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 9695446bc2a3c81f63f6fc0c98d298270f3494cc..5b3b8dd4f114bdcb8911a9ce612c39a1c6e05b23 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -784,7 +784,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -806,7 +806,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -830,7 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

---
base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
change-id: 20250804-sdcc_rcg2_shared_ops-ea6e26185fe6

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


