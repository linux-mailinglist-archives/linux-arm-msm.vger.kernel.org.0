Return-Path: <linux-arm-msm+bounces-58464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB0ABBF91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405631B62593
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA774280A20;
	Mon, 19 May 2025 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIUFAD3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0246A280002
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662256; cv=none; b=iobRitUFxo8jFRDHLY1DI5rkRThabcBmgdy48FOdm5tXvMCNe5LQof51uchOVGsXJbAKtGO4VvcHDoXFDQNa6j+fBH2L0npnRMcu1+o7z3Osyc+eZgzRLUJSGnkeJgW2dqnzAGk+xYuDCx/oZaNAGtykQmtju+n5Uqn0ujgCkGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662256; c=relaxed/simple;
	bh=yolDzczYpjPodf29Rfbyb9DI2HpvxGwqgiLVvEp10jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DnxS3tNvy9euBDokxjWHbDR4tNBMeq+lThTtM6ETydtgL825vJjMHopUlBV2mpfE+Mp+NiiOEdYGw6yWvr+/0Vr3hVvQqEfFEcmk6mtPa9vwhINEJxRSzvO9zh2qHw7MZpu3EOz1rwJJPsLTyDJAsnuRSWZEi3mMEqTcyu5oliw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIUFAD3a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Mb5S000806
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xRZkj0PsbJSbrYHAqES7DG
	XowTaGFY8sh3Gy0YZ8AWg=; b=kIUFAD3aULLaEX9l0oph1yfdN3gsuTdSGmaJt8
	dE+KVxnDUXIHcNYzQGoy87z/uTS30P0DDTNRe7fwdLiZaG3o1qzOmsBSi84KTOzr
	cOXWOy1xKIRk4BXHHbN8FhzcD1kkwZD6kcBdJSe4MTewKrMQTyMAuICHhfMa2xa/
	i/HL9USX6o/A4cxMU5YmkTJCUl471LsseroYxemPg+SVJk27xQHTbb8Qu6u9KRh4
	1Bi2yWrCrwVM+IUNSUrcvZNbXqKySyrt87IfnzeQ+iBfpquPaqgR6gRb1b0LV0WR
	aUK1U1kb91vOiLaDM998UUY7MCoc3NGbLYKzWwY5YepEmh7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vh1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:44:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742d077bdfaso1360262b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 06:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662253; x=1748267053;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRZkj0PsbJSbrYHAqES7DGXowTaGFY8sh3Gy0YZ8AWg=;
        b=uEU2UD1UnB9MPKFmfE4HhoJTGncf9Koaoc/URNHnXTdtG+Qvwy9m8ZcjYqrsC2TiF2
         Ks5cumUNCWfT8VyMXt4wbIZ/1Htkry+20vF097nPq8HriE6FS4HpB8+POHd0OxRrQ8eH
         FvLtRpHBFLPO1enJcQywm3ZXn8J4YMGv/5leJ1wHyywsRf9GKckPvi1oMtXRVZAwnDj0
         9DAzXNHMZifV0OHz8ujzrkBa4ZSpXHZf4AIbHXPhPO8GxHxfEsqdA99cG6oywSDc2pss
         53vERS5u//YCDXlU+aAggcT+IX+kEm28kfIFoB4ZhJZvwNdFMPi65ZeTIthS1bVMCRZM
         XQiA==
X-Gm-Message-State: AOJu0Yxi3gcQIWXH4FShS34CDBPYZIQVQcYP4favTfuP0BYCxBKFdLZ3
	ZA/rzY/ERonFjHkI/EazQtQXsgT303B+xsfwzaJug2GbZY5D/ViT2NP2eyxebmraYREYp6Av175
	h4ui/opceLQ8rpFhEfT+JAkAoOu/zylOKB6A59ypJvAHTA74YTuGPhUYAfw/dtbcH6dv2
X-Gm-Gg: ASbGnctaUt1caLIUE9NnJyDOAH9EC6vNhT2UP9aiMbZc5GT+TxHRmKqCH7XQNNWkSBL
	xXXcpdmmgmWFbLjcoDaLHDC+Kky0UMtg4ZBSu8xOgKw0H+9fzNQHiBV6/dg7ZisZeOF7xAu7oJk
	zCpnw/y9W/IJ63NCZv+BP5yfNGzRU3Y2HY3do96HDUNE5Oug2eYmVyPYuV4n6WXZDcmlOYlJSBt
	Dpt0ju2lL5D/E01H1oiJK9ugoyik9kSGEN/BXH4/K8BnOstwca543ETUh7mS/rWpuCP7pxe7O1N
	vDX6UXs8K1eLqIGphAf3ZPcbEXzRqMKNwRZpX8wsWgcq2qo84idAm4To53KGEzG/K+IZvUusZU3
	K/jl9xOSe5PQLpZnyFgWsI/Zsw8MpGuVbZhtn/Bjk5/19AW4=
X-Received: by 2002:a05:6a21:6e4a:b0:1f5:67e2:7790 with SMTP id adf61e73a8af0-216218c9b00mr18986026637.17.1747662252950;
        Mon, 19 May 2025 06:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGigiSPG56p4nzNA806fGLVPlqz8iHmGoh9R+kqK0uOaBp+WtDnh7QYxYoYPX/S8Opata9wyw==
X-Received: by 2002:a05:6a21:6e4a:b0:1f5:67e2:7790 with SMTP id adf61e73a8af0-216218c9b00mr18985987637.17.1747662252576;
        Mon, 19 May 2025 06:44:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829c7asm6224051b3a.85.2025.05.19.06.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:14:01 +0530
Subject: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKE1K2gC/x2MSQqAMAwAvyI5G2gr4vIV8VBi1ByskkoRxL9bP
 Q7MzA2RVThCX9ygnCTKHjLYsgBafVgYZcoMzrja1LbDc2Mk3TCxfi56S433FXHrDOTqUJ7l+o/
 D+Dwvm8Gba2EAAAA=
X-Change-ID: 20250519-tme-crm-version-a1c7aa3ce820
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747662250; l=1476;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=yolDzczYpjPodf29Rfbyb9DI2HpvxGwqgiLVvEp10jc=;
 b=hqd+Frb16y2/LvEKRCK5XyT3xzYM+U1MeoW7Z9/rtXv9jRgvhAzxVi1Q4xpKncJnRsyi1tuHg
 kE4F9JRgGbJAEc6RNKsy4QZMj7aqeR6PBqCFCqI9GWMKITIRloUnrxI
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: X6jLP8HChd39CBQzoudAXK4e7c4NYfXG
X-Proofpoint-ORIG-GUID: X6jLP8HChd39CBQzoudAXK4e7c4NYfXG
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b35ad cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=0tr5gUXQH48V7W0Z41EA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNyBTYWx0ZWRfX9UlUa6OkIuF4
 wb6DGBcxeetOzog57LELqSFZmDIwWkjl54OdfHxyRN2vfMgeoYZQXeM6Yr+GJnfos7xuug8XW98
 s/IRkmryVp798VXyJjGqVz9x7kOoiFN/HyRJgOuQUtvzjcY4SazYJkobOyOfL0/eOthAXGlurI1
 ppZheXaucSLlb+vSExcXluMcWxF9Oy2upYP0hNR1Jf/DpCXfiqFjzf1TxmXwhQ/5OX6KgYwH4iX
 HBLv7JyZUa19tpYJWURwBtWTSv+blAdpZgiZJrolKnkmINvJH3ydGH2CGgih4HBIj7tD4J8Acof
 2K84LgRa7bEJuOQv9g8vHG05UMkt5uSjPBAHnMblE03MtkhRiQMqWzm3+VQ3clS4H13L/5e/I0B
 /QIWqn1vbHAxvUvsQ1M+fl+mTrJ7TlTW4ZeayGWFzxVQ7Y8MRSYJdk0HHqBkFxdgCuK88t4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=839 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190127

Add support to retrieve Trust Management Engine (TME) image details
from SMEM, which is present in the IPQ5424 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
(Lite). Other SoCs from different business units may use variants like
TME-M. For consistency, the image name is retained as "TME".
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8c4147737c35e3878db2def47f34c03ffc1fea52..391380820f082d8daa5c764d5f3c44e6240e18a2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -48,6 +48,7 @@
 #define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
 #define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
 #define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
+#define SMEM_IMAGE_TABLE_TME_INDEX	28
 #define SMEM_IMAGE_VERSION_TABLE       469
 
 /*
@@ -67,6 +68,7 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
 	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
 	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
+	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
 };
 
 static const char *const pmic_models[] = {

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250519-tme-crm-version-a1c7aa3ce820

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


