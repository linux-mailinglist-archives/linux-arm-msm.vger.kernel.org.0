Return-Path: <linux-arm-msm+bounces-66193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B4B0EC67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 355FA3BA206
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8529D277C8A;
	Wed, 23 Jul 2025 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pOjtkfpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25E86ADD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257191; cv=none; b=dh6VNiUaNZw6rfrI6aEUCrkypnDv66Qp13WeVssYL7IhS6fRC+nXpV8sDRBnAQUMtNJuI5NGUXGJqAeHw54Ed/+SGcOUvdmjrh/kuZehk6N7BqPDUMyh1xjhVoW8jid1IOiqKfu0RaTR2A4rtdSBiA3bO7WHl4O4h0a/DF83XkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257191; c=relaxed/simple;
	bh=0KSMWlwmOQexTzUypiaXdDYCsjg5c7Njq7vNQ5cw0cI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ixtQGS/4u0djRukKL0dLzcrW9hgCN3G2gBoBpi4YVd735EErishD3Gxm2NKhuhbhVAEMddnbszVC84MSxI4waC1Dt3f3r/S6DdpNLbNpWkMEPKOlAZPQME+1EicAYn3QPpPahDzjBWBBKpJ0/ySAElr6eTvbpzhktFYQNusqeuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pOjtkfpd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMOPdB030783
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SOMoCK5Z62kbEUSptCNX5RZ9a4811e3udrv
	9blV63po=; b=pOjtkfpdQDobqg6J499di8oTM4TOvLfb0iH97RKnHtRNYnYQedb
	jpkDvTDcOOnU1wHhnHlmw9Qx/JM5XaiRZH4MPwMgu+OoIZoZm7cWyJnTsfXPcVbd
	ui3Dwird7tB7olJOEmipe0vovUMCmwE8ZUkhfAHaraYhKR+Y/zPHbFFuFIWMTZKc
	tArrmMbTFY7jmp7hfdPrgCseghY7ut8GYs+sIObd2Y3mVMhUkFmxREVc7BryCVHM
	1Q7v+mzwEDL5S5IOxOjaejirbgl1IBEMfXwR0nKlFrXx07mT26ga3NWnoQy2aRPq
	S0wy5EZlT/Pdbce5v8oIK0VtxnOwV3b/1Kg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s4at4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:53:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748f13ef248so5976078b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 00:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753257187; x=1753861987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOMoCK5Z62kbEUSptCNX5RZ9a4811e3udrv9blV63po=;
        b=Q+3yVW6wMOy1O9gSs0J8tKi07w2jzxspybLfJQgpzF4+LPE0g/LPJEEbBUhHCWXkB6
         JrEJaFtrWeUa4gSu5h/4xMBdCltAbV+x8BFDWbCM6hgn31ee4LDQ+uN0vJbwUBAbC5mm
         YRyqJOJ81nYmEfVcJFzGD4zlw0GaP0rRxoievCmFzn4q+wkaoSIsrjEAfD3o9A++hfAn
         o9xJ5g7WZ1iWIaWFn1nLslIVz8BCVuswkLLpYiy8WxFzMleZ5GhbuR2yLIxx6GLdu5SW
         +J4YX+uH6rpQhxQdKK0s9UUZ2LZCqyt5VT5l1D8eyjUfqOX1wl4ONNFo0qs/yO+mIaJ+
         Lx+g==
X-Forwarded-Encrypted: i=1; AJvYcCXn+CnRxZl9FJosRQ42BhJDuLkeipDPLjSLKaxeZK2UWzf2s7O2ofd7SPv/dduSv4dtMvAylZfz7ifxK3Dy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nz5eE2jV2IR0TQTCMl9HoH1qZLpmcb5OXz9XYe9838shFcQR
	brDyIAKa2NHa4xnEvgsfGYaPzXe8JpGAUYo0JmQBqvDDF0Pi/WnnOyuoUeR8c+S4Pj8oD0K8tjH
	8FAcXU5LxTOXEV0oflQx1F+1AY2wRQUAuuafVt7l2gJcp3ZY4jZNowyjK3firTNfCudOc
X-Gm-Gg: ASbGncuveYc7Cz8ySZk9s3oXbC17SfxU+wJmzM30SqyFjY12GohuflU7kVLP5jRNJVE
	+jAZalxnIeglAB30wrMvxSC6qe3l+GiVjr94v82oO1jw9ECKPup3fXjc30nEiTTFmtNNW0l3A6e
	Z1q5nrcS3qbA5YN9eAeOVUl/Tu4jHxp4wTgOMlyeJ/3h478NSD2ktrPmU5Wx2Q54nmkDObmK61a
	HTDs9WEEM9h/Mf5awpmNstjC79HX3iXe9ntdErx+hiz5bnP4GxSyWKvG/gcUqZy4Eqz0VJCwlER
	oJKFj3U5SQQirrVjguO4+FEmOEplvSHuHIirWe3r1vPZyAZzXwiEl8qeXldjAHQ+08OnLF0OusH
	lbEk6pOIFb+gEghE=
X-Received: by 2002:a05:6a20:748f:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23d49136ea5mr3637348637.31.1753257187270;
        Wed, 23 Jul 2025 00:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUAGcYxje+EhTOZciJRbvuAo0LH8110NzyFn9Q0lgKpHEpXgrJWvgD0QcKFF3FowijVLcrGg==
X-Received: by 2002:a05:6a20:748f:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23d49136ea5mr3637311637.31.1753257186749;
        Wed, 23 Jul 2025 00:53:06 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2a6esm8609161b3a.11.2025.07.23.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 00:53:06 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH v2] pinctrl: qcom: Fix logic error when TLMM reg-names property is missing
Date: Wed, 23 Jul 2025 15:50:24 +0800
Message-Id: <20250723075024.4604-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA2NiBTYWx0ZWRfX3C/mPtXuCMFH
 6IlXX4VY57ObcPJLifd/3agGoHW+knecoygAcp+fA9NaYEk7rh+h5mCyUxZBhCByfDPwrktSAHs
 iiVN/tGuSP18yOTEvmVGcBaA3kDzfhFb74Ku9GeBy6J/B7tWhtSXh+q5/70QWU/jk6eYaMkzQcK
 rFihJXqZDQzn+EYd52AWYFMOUGXMp7+XG6o6dRTR31vie2r+ZTn5IZwabnNh8cJLQkoPLNje4xX
 F2fKh69BdYTpqrObSDDA7au3g6/rN6F0AJIv1bqV3yKaC5Bw/6mtaTkjd6RusioDFNwK32+f2Wb
 eP92KJ0+QM29iLbqEbiLih+xAnBATYVQ86qpUwp6W7+Wr8GzPsnn3jH/A8o6mXAkz0fa3HEwV0Q
 2cTyz4l0tEzRv+l2jDLEaR1Wj1ZF7LFtJFl0NuxgG9xji00NF5Cip7l/3hpFwdxFXFldZqjs
X-Proofpoint-ORIG-GUID: YhfcvTThr7vDCvAF9hoewiNRwdMeGh6G
X-Proofpoint-GUID: YhfcvTThr7vDCvAF9hoewiNRwdMeGh6G
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=688094e4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WDoE7Cz0S_A2IT9AzmkA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230066

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
region without the reg-names property. This is a valid and expected
configuration. However, the current code incorrectly treats the absence
of reg-names as an error, resulting in unintended behavior.

Refactor the logic to handle both cases correctly:
If only the gpio parameter is provided, default to TLMM region 0.
If both gpio and name are provided, compare the reg-names entries in the
TLMM node with the given name to select the appropriate region.

Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

---
- optimize commit message
- optimize code structure and fix kfree issue
- rebase on tag: next-20250723
- Link to v1: https://lore.kernel.org/all/20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com/

---
 drivers/pinctrl/qcom/tlmm-test.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 7d7fff538755..e41fe7e76c80 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -581,10 +581,13 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 	int ret;
 	int i;
 
+	if (!strcmp(tlmm_reg_name, "default_region"))
+		return of_address_to_resource(tlmm, 0, res);
+
 	count = of_property_count_strings(tlmm, "reg-names");
 	if (count <= 0) {
 		pr_err("failed to find tlmm reg name\n");
-		return count;
+		return -EINVAL;
 	}
 
 	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
@@ -597,19 +600,16 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 		return -EINVAL;
 	}
 
-	if (!strcmp(tlmm_reg_name, "default_region")) {
-		ret = of_address_to_resource(tlmm, 0, res);
-	} else {
-		for (i = 0; i < count; i++) {
-			if (!strcmp(reg_names[i], tlmm_reg_name)) {
-				ret = of_address_to_resource(tlmm, i, res);
-				break;
-			}
+	for (i = 0; i < count; i++) {
+		if (!strcmp(reg_names[i], tlmm_reg_name)) {
+			ret = of_address_to_resource(tlmm, i, res);
+			break;
 		}
-		if (i == count)
-			ret = -EINVAL;
 	}
 
+	if (i == count)
+		ret = -EINVAL;
+
 	kfree(reg_names);
 
 	return ret;

base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
-- 
2.34.1


