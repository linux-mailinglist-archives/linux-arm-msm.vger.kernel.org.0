Return-Path: <linux-arm-msm+bounces-65984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99EB0D156
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9FD1AA2132
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 05:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C22428C030;
	Tue, 22 Jul 2025 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfqZew4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B2F22612
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753163099; cv=none; b=mgfef6jAP1iBminn/7bTtgssGUI6c9aYnPRSW9jphEL0WJlxqNUFdJpFO4UHZZgIyJ1Fz/it04o8UTe8+3C5roLpMjiYqJilaPaHHobOkrWgD+xqkUlfEN7Sk3l1WJaDu5sw8Cq0E/rJBRJkBOuyNyYgxDOc9SzcUmNYL4sitH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753163099; c=relaxed/simple;
	bh=ukjz107venpREw1AXh4B8olSE8I9TNZM92z3x+eADHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EpZfyvB8xIEcZYH6SpuJWiHQCFxknNUgpCuwnu6N1jm2VZhhJ23V0HqvFC+Hwrg1b4MD5pLFh+Irnz2nSe9FvfVROO+EP/53aiUgbMYfX6MWfpo0LTVa7EJ3qg5KDnJMi+QTN4wgZcQ5J/22KDSR9H/6vfZM7bEyPS2bZtLFGe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfqZew4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M4ahfe000902
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=75DfiJpF1MttMuOkBOXm8Q+i0oMIyLyaAAI
	5qQMiwVg=; b=AfqZew4R8muh4CKK8rI/aLL9YpauWYXGwTy0jrzj9HZSdDVDGpN
	kvmnfyPPHsr0uSJnDXZNeAeEYsydQgMGeEjB8rKThZp8zmSywNFb1XNpe6EXb++G
	ph/NWR04SR7Hp9/Bevm9w8X96bCUrlbWS0nis6bRcPTVGTND35w6ecQw8ZxCY9tK
	k4PBit6ogsMDGz1vgM4IjkgQsMRS5TAS45ppsv6xjyslIzAmEbO11BF4UgEI3E5b
	81TBug5vcvvJ90j019jZbndD0Gw4U3moVjSGkeUApgq+2OnRAo/4NB+uAppTgKUL
	iaO4yzhN2DrESObcL0HQJxZ9q5GfPESLJ5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dg465-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:44:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235089528a0so50274325ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 22:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753163095; x=1753767895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75DfiJpF1MttMuOkBOXm8Q+i0oMIyLyaAAI5qQMiwVg=;
        b=q3b5VnUt/LwwKDYiNUXrtcf5b0EwlOBLgUXVwFLpF+D+J+9O9pglvPGJS7t47kIWOZ
         hXAAjFKFmyQ/Tx03Q3DHgezbsA/KjzO3brB+y9AJRFM775z7308qdSMBrmz7/0gFDHHU
         WzVmOLI6G8aDvKL19KxHOiGBPU+OrfDSNgMfUUyQB34X/wzqZj50dKoCAnVJoIqPDB3W
         BV8nXElwCrv51LBT80HI0yefLkn5if7RtkTNBAuMBcsUa3M2cA3Ar26hDhw9eRf4zpg2
         Ffur1ZsKIXXE2SCr13zajW1EdhW2I552rJ/Xykn8pD6blhBvqnY7D2XC/1Lnx3+UtEJN
         /YHA==
X-Forwarded-Encrypted: i=1; AJvYcCU8YYMCCrVdk6DfZzd2UaKfx/Da80zjHq8e5MZ2vKLRrGDGFVl4ue+xrZaq7Vqa1/M5k+s+HOomfQhQwHOg@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZRXV0vSDoRRsottzy84tf4Gag4gqoC7wJ8Gw1ryi9AgQG/Jh
	WwdTOpMwEgFRl6t7CuB4Kilfw6Wr/il+4dT1xVu9mxtND+ahnqHARbFxh4h2+iehZdaaZ9lWh7p
	RTl4XdkinM1HEcY8k/+SUylFoH2UqcEOxj41QInzoZsLholsIzMzELdgW2IDI3LgocMuG
X-Gm-Gg: ASbGnctrlycTDntum0xctHF4RyKpEP5fedvUE2cBgTpT/uwpqTamWEwmE9JLKRr1rRO
	zMi0YxVZbjFRwjv9E3U4lZwlbymWoD4yMEH1i2XvaLuMvNMc5gDjO9LoM0oUxoA42vgUYCItuWG
	LNfow0PJKTeWKlqUCdcPFkV0W8MWCwK5PWoK8D3rpIr0qcbw+NGKJKBcsaDVykXmtTrroDB/Uo8
	CbzLGsRpcEaJfmbwvIEU6f/m29YnmGgxisUG2wB0NdWmvPqPRlFzGRNMXTTT9SEij1Iz6Vm6dI/
	Bxu8Ze2hdzLXCg1JeJKYeHbmNIMDHLvE771N+aJLNNs6TuLTtIfOLcqHG2ikxSeb5HqxPy8B4sM
	Oxeno6nIZNYa1E58=
X-Received: by 2002:a17:902:ebcb:b0:237:e753:1808 with SMTP id d9443c01a7336-23f8accd820mr31458695ad.20.1753163094789;
        Mon, 21 Jul 2025 22:44:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjnBKOTKbEfvmKSJ25MWepQGV65OWl3NjJ9lnM4agFmO6tGJ8XkNxJ1NO5Wil99RX2LWYPxA==
X-Received: by 2002:a17:902:ebcb:b0:237:e753:1808 with SMTP id d9443c01a7336-23f8accd820mr31458375ad.20.1753163094335;
        Mon, 21 Jul 2025 22:44:54 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d65sm67494375ad.109.2025.07.21.22.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 22:44:53 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH] pinctrl: qcom: Fix logic error when TLMM reg-names property is missing
Date: Tue, 22 Jul 2025 13:44:46 +0800
Message-Id: <20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f2558 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WDoE7Cz0S_A2IT9AzmkA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TdIia_lSGnAGy8cmnYkxeLIzPP1RDLzp
X-Proofpoint-ORIG-GUID: TdIia_lSGnAGy8cmnYkxeLIzPP1RDLzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA0NSBTYWx0ZWRfX/ruswtkbzjHb
 yKlysCAPtxzHOYrbNkCTewsQsnxkCXYdQrzYCEQiYxpqgUQQ55bvId7dzGBwWW/XkMGuF529a1Z
 oI5itga9Frw+UDToi9qxTQqoO9oZxmhYY0hHtjlbYAAKglEcP7bt9XI6HHaVqT7ZNFrhipyD0Kb
 jFtDaMGS3SfX/lhcmmd7cO2uGLTjHCkxdtSPvUWKqNwKFsckKXT7ipctStZNCWuLO5SOJsuW9Kr
 BBkoz06Xv2Oz6qNhOiIKO31Yg6aS/Fp6vcavuFlhOPD5rMUdKUZizImYH8I+NTG4yKhe0oylDXG
 wuv6PP+75ADgF163Fxudl2zjmjThwSpa4QcJGmixS77N9D5axZc454e/ec+CvkLRmrt+uT/6Glj
 P2hhEP19SXWIjb+UNEXYhaFtmKLEyoNzspkexNA2LOzJO1vdAXwm+a+P2rqjIvqn0R/gPgjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220045

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
region without the reg-names property. This is a valid and expected
configuration. However, the current code incorrectly treats the absence
of reg-names as an error, resulting in unintended behavior.

Refactoring the logic to handle both cases correctly:
If only the gpio parameter is provided, default to TLMM region 0.
If both gpio and name are provided, compare the reg-names entries in the
TLMM node with the given name to select the appropriate region.

This ensures proper handling of platforms with either single or multiple
TLMM regions.

Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 7d7fff538755..6de8cf23f9f0 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -581,25 +581,25 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 	int ret;
 	int i;
 
-	count = of_property_count_strings(tlmm, "reg-names");
-	if (count <= 0) {
-		pr_err("failed to find tlmm reg name\n");
-		return count;
-	}
-
-	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
-	if (!reg_names)
-		return -ENOMEM;
-
-	ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
-	if (ret != count) {
-		kfree(reg_names);
-		return -EINVAL;
-	}
-
 	if (!strcmp(tlmm_reg_name, "default_region")) {
 		ret = of_address_to_resource(tlmm, 0, res);
 	} else {
+		count = of_property_count_strings(tlmm, "reg-names");
+		if (count <= 0) {
+			pr_err("failed to find tlmm reg name\n");
+			return -EINVAL;
+		}
+
+		reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
+		if (!reg_names)
+			return -ENOMEM;
+
+		ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
+		if (ret != count) {
+			kfree(reg_names);
+			return -EINVAL;
+		}
+
 		for (i = 0; i < count; i++) {
 			if (!strcmp(reg_names[i], tlmm_reg_name)) {
 				ret = of_address_to_resource(tlmm, i, res);

base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
-- 
2.34.1


