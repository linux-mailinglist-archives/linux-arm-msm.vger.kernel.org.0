Return-Path: <linux-arm-msm+bounces-78494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED2BFFFE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB03A3AD8AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266753019CE;
	Thu, 23 Oct 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGXNGFRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AEB303A16
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209101; cv=none; b=UTLYQD074k0P2kh2/RI0oj98UY1b99ek8TXhhauWgB50fDzeMZtucltQcRlWhtDSIKjOMnmRA34iZG+zw00oa6JuvySydZDk7/v5k6wpCRH7y9ES52PsreQl5Hd6pXEIbSTm8DQ/94GRaGfhXaWkt+6iL87PYMfsunw+YHYmeM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209101; c=relaxed/simple;
	bh=NBRovJaqkNcGG3lLAI5DbYycB/1E0nG5kKP88TENNd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2ppPqYnHEwNJ2CnRF6mPAjZqdtZqWc9VHxYvOjTmA2f6KLE+x0foytFZniID/RNr/kc5xexS0N0z9K6Sn3+WMTqilsoaZ+Zrc/jHBLas6E07VGA6GxWEPU27Yzps/jzcuDncZtYOOFmTdDtYc9RM/iFExLh9rqZpfJaTZ5r6+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGXNGFRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6UGt9018586
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMOYKcOfCkL0s0KLPZmt9lLeSz9YVBHmXBnbsduDHcg=; b=QGXNGFRoc+NG4GqS
	GSv1DA4pfUiUKvaOilnpwGm/QRIGl8VNiUGHTmLbW2ZaC2z0ZKIr4RBlkr/k80ik
	tuMWhC1nTweFkstmIaKUdMRuwv8FLGrqxPE7+PN8BsjQADSjHeu9I/ycN+XH8xu+
	CIWDrJB7+c4PFPDUTyyvK3AruH80ossTFfrwYflUeeYhtHieM3xFs3dlCTzkz/eJ
	WtKnIHGxApZCmWDgISUN9xoSPSNXHKS+UwROlZpxnoa5H0XzWkZQigso/91QyInC
	9l27nMbNoyqOEVldJLkHKhqRmnhxbB7SkOQI7JgfZYontQK8hvdSvDoLzNAQAM9K
	PgMnOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pqwkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so568457a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209096; x=1761813896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMOYKcOfCkL0s0KLPZmt9lLeSz9YVBHmXBnbsduDHcg=;
        b=Q8jEPerzgv30cJKrlfGllGPKRNvVL3bczLVdCFAKKN2tbSggjiXbfU7kV/VbbZ/rvt
         kCfohnciIe5uNw7C0ycPdisTYGaP5G5RyR7jEuNv4OTUJxjDo6tDuNRFl6z70vm/kNif
         7SHJT6cbP41H6jDXVXGN18dlKpcpLtQmj8oaj5ezRVi5/q1MjuTMsZKq2Ew/C+E8iNqV
         jEaLcrb02vvva8jfYMPFMMzjyOm0piqDGciQaLchM940GSzVyGZnAGbLn8znfXBWf9Pt
         Sr1ZTheWXmCysDAQHsd3lnsT8j82+95QhqcGrV2XysDIgTlXYhOb5tndH80diJiZ7wbc
         TH9w==
X-Forwarded-Encrypted: i=1; AJvYcCXAuCYrMW3Jbcgw0ljDDxgccVJGo7RIJFkS9jBVqUW+tSmiS4W6j97yyR+VNzRoFpgSQoz81n9h1+gQgLHC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/FZJ6MLO7ufwBOSF1YCOLL4Nmh686qiCvowF8JZW3UxD95SV/
	WG+GfUNXiJjeZkPt4aZK2Ei9lCvWnWbZAZQ2WZm+IgLCBF2FBQ5nlAJppvJ8I/hqFbpTtEMJZtW
	doHm96PFpG1rr4D2zqLA0gxAbEAoo7HQNzqdfJARznV4UwAK4KjaOtCQq01mu3gdIB7iW
X-Gm-Gg: ASbGncube65tBcG7gMQoMs95PbG2mfIc3yz2DBo0u/Buzwzs/mOuHQQ+7/oft88syoU
	ar7LpQwr5UV8C3QhTdtFlj25uA7Rbkhf4IgAvKoUgpa77ZCiWaO540xIFz6pD6ExnskCittPKll
	gL0zngjTGHBKBewVY7d46jESPrvB5i5EkSOcjiP0VrDtHmhFDpi5zYRTr0fypjrXk8UrZuucGOr
	i6zzEb3fT9k+97XMZXbVkjybc38TTqDwxBpkRFZxVZNVzuoJ4AKPboJ/VZDHydOXBbh8mQb9NMp
	JyQ+KiiMacCR232q31S0tIZrwgLrwC+u3N+dPpxbLn/j10ZQ/hXkGX9YXj1PVZ9AiwsfBTaov7m
	Blf/AxoTjIEpTGwVtKnX+p7aa34l2xc1ZIA==
X-Received: by 2002:a17:90b:3942:b0:336:bfce:3b48 with SMTP id 98e67ed59e1d1-33bcf87f431mr33777077a91.9.1761209096374;
        Thu, 23 Oct 2025 01:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6QS0adJF6pTnwXOGYcJh2KTc8Y209+IAOSTNKlkqPHVZXptbGoDdmb5Pwbd310OlsY3Ervg==
X-Received: by 2002:a17:90b:3942:b0:336:bfce:3b48 with SMTP id 98e67ed59e1d1-33bcf87f431mr33777043a91.9.1761209095912;
        Thu, 23 Oct 2025 01:44:55 -0700 (PDT)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4c056fbsm1391414a12.17.2025.10.23.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:44:55 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:14:37 +0530
Subject: [PATCH v2 2/2] regulator: rpmh-regulator: Add RPMH regulator
 support for PMR735D
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-pmr735d_regulator-v2-2-452e1b28cd38@oss.qualcomm.com>
References: <20251023-pmr735d_regulator-v2-0-452e1b28cd38@oss.qualcomm.com>
In-Reply-To: <20251023-pmr735d_regulator-v2-0-452e1b28cd38@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        jingyi.wang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761209080; l=1846;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=NBRovJaqkNcGG3lLAI5DbYycB/1E0nG5kKP88TENNd8=;
 b=veWw1zkUQrhmC9aqOesX0Xm8cjMxPGs6W6jFTMl1E4EGD6hB4IkF/4NCNAlt3flfczEKPFM3n
 oFLyxFa5L3GAWcE5rtzUkl4fVivWAaFWJHJVYgW8KBijS9rz6vKWrtB
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX5LBbS0ef1c2u
 s9BLlRk1bwOxyNqSoRTM2WZOyoyC2TWaDW9xLYsrod6eYtL/4nSBLPSYsL8eQyvED6RLh3kMiEm
 kV2MgAhY/LcZZl1Fl5nQzBTyyDiIyTSqJMt3BXu1jr1DClx5fY+l8DF/JDO3oWf4of5aloYN/iB
 nP+4KyMVODPhJoxbaaD6L71MnLtX6wDLQM0uiPu5sso0qFAKsP8Y2m0LPyDJglseMnxrd6XMNDc
 W3EuvFnhqf4+mFhguHqn8mTIJGErkamtNplh4ixjAaCogeN+t8AgwqZ6EgOQNTcGB/YSV1KjC4W
 sAtuZvtwW98nFrk/d72f1KlJ/JVRvZ1tpjmM+qmtCQ32nSwU2UkzAJTrclgMYQHJtBC3OfOwzB9
 CioCTRwFhYxTxh7XccR6YUIGzvk6Qg==
X-Proofpoint-GUID: lphnyL918L4vXkrK650i-U8SxJll67q5
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f9eb0a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ufI_WnuctKyF2eFgXJIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: lphnyL918L4vXkrK650i-U8SxJll67q5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

Add support for PMR735D PMIC voltage regulators which are present on
Kaanapali boards.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 0a561f1d9452..6e4cb2871fca 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1735,6 +1735,17 @@ static const struct rpmh_vreg_init_data pmr735b_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmr735d_vreg_data[] = {
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,      "vdd-l1-l2-l5"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,      "vdd-l1-l2-l5"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo515,      "vdd-l3-l4"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo515,      "vdd-l3-l4"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_nldo515,      "vdd-l1-l2-l5"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_nldo515,      "vdd-l6"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_nldo515,      "vdd-l7"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pm660_vreg_data[] = {
 	RPMH_VREG("smps1", SMPS, 1,  &pmic4_ftsmps426, "vdd-s1"),
 	RPMH_VREG("smps2", SMPS, 2,  &pmic4_ftsmps426, "vdd-s2"),
@@ -1950,6 +1961,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pmr735b-rpmh-regulators",
 		.data = pmr735b_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmr735d-rpmh-regulators",
+		.data = pmr735d_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm660-rpmh-regulators",
 		.data = pm660_vreg_data,

-- 
2.25.1


