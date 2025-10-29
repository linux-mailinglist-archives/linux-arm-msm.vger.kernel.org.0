Return-Path: <linux-arm-msm+bounces-79399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93853C1975A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E93595058AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19D332E131;
	Wed, 29 Oct 2025 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wk+CjrNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRT590Hv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEB8328621
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730683; cv=none; b=b6RoRifva4EcuTPCOA7sY4JhJ2QGiQ+mSx7KYkWrPYJ880TG4MgE47EoD3rkQFGIJxaqnmpmnj2bFt7jF8Yaf6VqBtkokM+ZSpFotmkvf50QgN7jxf3aXNrLdoQCHds6E+6lnMlpdlP8ROs5tfdDv8DnTAHd6UasVFxVCSbiOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730683; c=relaxed/simple;
	bh=JC6+w4UGAYirolruYvWIOp4qN/wza/Ui3WiUhC+0WE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kyd7A6eYlahSuVgMm8qmv4sdfhkvo0O2XYxTgq7qWFq6PCLaB8cbZMUeEFHIIVQR0EOh8VeJJFnSIfVzlNcAVtFsdLO5/h+mXlFbs5Y+uwVqFHi9Z/sq+BJQP0xWUAHZ21Rg+JTg+IiI6lfHhU/6zgSZ/Wi83OtDDt456iuRVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wk+CjrNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRT590Hv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T8TiZw4135571
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jXxVeddQ75KBTjT8urxprG
	/yANbxXDxuHHoHCkUPtho=; b=Wk+CjrNV1aAcP6YZ81jZKS9XHxsPWAZORVEWe6
	YXEKQr0FlOq+ZD5zbaKmOt+15D+0kkX3rneRMODRwQBiYwvYxPLPy/7gVUsBm2nz
	07ksIHLOU1o1Di6BcIGCwwrSNa2ZgD2nmcO3iFOeH3FvGtPXGpHPgDtYnMqR25ub
	QnpGrttd2MdxrXVfFSBTq+ZU5y+bnHTC5Btf1BxfoUcilsdN1bNiQoWKdFTQ70gJ
	lAPIEY5T/jKnt0GQDx+t4DncgjiD+grMunqgWGjFM+C/aPCUgdF/ViqUgr9SF1kh
	Kprs1S1BUNZmgBaedV2nhCrUYORjRo/AjlUJFTPkhE9loQPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9r70y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:38:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2909e6471a9so47590825ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761730680; x=1762335480; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXxVeddQ75KBTjT8urxprG/yANbxXDxuHHoHCkUPtho=;
        b=NRT590HvhsN9s8P90e/cjGpYMonRLWMeaGW5RtimC0eje4NrU8bs1A7LcHLfA+C8W0
         vxNYbYbvmS5Id3CUazohGvick7v3Ye49k63skzx3gGJ0Lr1ggmhbvo1QrUAEN3CrHmin
         guzvjuK/xTTCGlYLHjcf57Sy6n8zIRlBBvwscNAXH8hkvg1uXbBLjoQqjxkCeR64hADs
         cQnW9M5ZDbeB61SZ11xDamDAoxsU+cAwKtkaJIf7VHKJXwIiJfMIfkAJMOPvG2SFTeQo
         gHV4V2Y3JVkyWBCxgZA9Su7uitSACU1+LbxqN+vsGyCieQdcVosyCW8WAYWHB7mQOF6D
         FZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730680; x=1762335480;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXxVeddQ75KBTjT8urxprG/yANbxXDxuHHoHCkUPtho=;
        b=cOTog81HykFvA7sb5+iOYYRen8F77C/n7bQnKwmxow0+MD8uUWh3/1l7Xl2FFsQ8oa
         4cBRJPOuUW2Omfb1VrZfCSzCQFnK0mMIGJMU3jlTGLh28Cyi3dE/y9YDp5Wbg0s4yFxj
         NdDtYMU0oOfr/z2ousSJbi5dNB5VX6fHSWvUjJVD6Vc0wJikop8d9DtEIMKpJCVVCaxn
         IrL5IMBOuh+e/GlkMZmdVqxpeZqN2E+X/7pYvllVMQmyQLo9JViiD7knnOG0cGN08N0z
         77FxLxvFKZZSvM61D45X1tmgSLrM24wglIud6RJ4IiOiI1zw5qPldngDJAN0KQFs5ULC
         V9iA==
X-Gm-Message-State: AOJu0Yw4GbDTyawJo41GUrQ6ANHwmZd5vpJZg45rkg0rx5fHQUwwWPNh
	3pbs2h5WxoTzHPdMpV3+d+fcbVlzpbT9XxIuW6OOXl0F6+Y9B67y+YCQO9PmUlDXpPP0TvnO5zw
	pMSbCOqtl/+fGOkQEb33pk7lK6RQu/9rm997H9rAOF9dccHiNtbVT4H2MLI3ddY1AQ+IL
X-Gm-Gg: ASbGncuC/QlpvQIOgQ4HGEQwLoeIjcYHVzsgpvMW9HmG5Jm3xBPkgbliI5wxPvmILTR
	FSwc62wSsLLEzTNZXo6RbIgC3fu9drQvhoO0TgIYQFddthqW3KxG63X2HJzCBtS8sXe8ZG7Xnkd
	m7BIgQWh/6F+lbKZoKH80tfw3RdCkzDc4voEh0WBZOywVvopIt8OeGue2zHSpzIIxUPGo49+QKy
	gk4QV2hYoo6YolQ+3JOjYCVFyH8yn2bP3RsqXtI0BAe0GSFSo6DN2c3WkLMNNaQgNx2qQRqcuvx
	KuHPG/ruF8xUip6vE2napnw7LQDUMKPZ7Vw5GhRXViYFPItJXUlEad0WcL3djHPaa/OCJAQlUuG
	dU86HtGD8uFmA8f4MmuY8YKg=
X-Received: by 2002:a17:903:1206:b0:28e:7fd3:57f2 with SMTP id d9443c01a7336-294def4764cmr24680035ad.49.1761730680473;
        Wed, 29 Oct 2025 02:38:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxdopI7TtLXoPbY3Gmaat4ZKTHDubtgAAQT6Szf0K6jOfcW8jjiLeCTo3u9Ouz0RtJlD5xIg==
X-Received: by 2002:a17:903:1206:b0:28e:7fd3:57f2 with SMTP id d9443c01a7336-294def4764cmr24679705ad.49.1761730679956;
        Wed, 29 Oct 2025 02:37:59 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm147588895ad.6.2025.10.29.02.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 02:37:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 15:07:54 +0530
Subject: [PATCH v3] clk: qcom: gcc-qcs615: Update the SDCC clock to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHHgAWkC/4XNwQ6CMAyA4VchOzuyVSDDk+9hDBlbgSXicNVFQ
 3h3BwdPGi9N/ib9OjPC4JDYIZtZwOjI+WuK/S5jZtDXHrmzqRkIKIUSBSdrTBNMDw0NOqBt/EQ
 cdYVQSVV2WLF0OgXs3HNjT+fUg6O7D6/tS5Tr9g8YJZe8kF2talSmbeXRE+W3h74YP455Gmx1I
 3wsKeCXBclSnS2tNro2Fr5Yy7K8AV2l+v4LAQAA
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
        Abel Vesa <abel.vesa@linaro.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: vBaPYLX2bKrKbQbxLe1dizbOoQQnzB32
X-Proofpoint-GUID: vBaPYLX2bKrKbQbxLe1dizbOoQQnzB32
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6901e079 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=DT-4WzK0eFhaf3B0yf8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MiBTYWx0ZWRfXxYgbjxU3OHtN
 KsJYdtP/GcdTMQ32yW10rrDcJDXjO/ibVBTWm8Ecp7qst9arYHDMlY0JbsbQMB1aktITmtQ4Vg1
 eCNo2jcPDsAewLQ8QvyrIwDo8ppgT7XBr8FFm3ATLjQtnsVHZXkVRq11bgB/CZPZ0bxaSao9sBM
 /36HXBzFCua6naVoU3ueAERxNX5++TFP3+6ygjgVGqSnLfS+8ucvIbKfP0YoBPGXbUWoVEoN2HY
 mlwkyx44myat9PzHzyfT1aDFS0+XQXzmf1xDuOV0uqOPGl4T/PfI+VQxWFyEFkZ3sHpgUv7qxsv
 5HB3ww4E+M0gYmxUD6vrV+hTmUaRRiP2O99wKKeqzC9QfHolkWCAdvLTPvXgtBMptaCM+mVK+s6
 VgRBXjzV5dy9mFiTvWDUkHiv2KAezw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290072

Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
boot. This happens due to the floor_ops tries to update the rcg
configuration even if the clock is not enabled.
The shared_floor_ops ensures that the RCG is safely parked and the new
parent configuration is cached in the parked_cfg when the clock is off.

Ensure to use the ops for the other SDCC clock instances as well.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v3:
- Update commit subject gcc->gcc-qcs615 [Konrad]
- Add RB-by from [Abel]
- Link to v2: https://lore.kernel.org/r/20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com

Changes in v2:
- Update the commit message as per comment [Dmitry, Konrad]
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


