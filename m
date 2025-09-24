Return-Path: <linux-arm-msm+bounces-74798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28500B9CC1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 550067ACBE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A92E2877DB;
	Wed, 24 Sep 2025 23:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg7vkLDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B186B26F2BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758302; cv=none; b=Yyh8pAWzIYs3uebvITcs+eLVREUOtL4bCiutpyUgFohXP4M26dnVutuu85QTnjQVTfboCsGePFizn0yL2BBgAHC94HYH6YenZcTAgiIU0F7R/XygiXbFI5Kqql4+pFz2RPF/lL3Ghg+hkYkzWChtYGqzRW5m5AwCQJfDzD4X8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758302; c=relaxed/simple;
	bh=JQHs85eAoQvA74JUQANSuBDlypyyegzPW98566v4RcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GELZ8PNkQsDtdGo9zIO2ZVxFo7dp1e+nf0BLzc1P2K8hdFTwIMTDqqQQsJ4zexAZMZKYGSsR46VaQAUAmXNLTifodNE5hKBtVmTu90YoVYrtQlO9x+LQinKi8Fl0d7xgb6nQrrNtNH7Xi9tukvP6r+Xi9rkovLTrXwWmBGPdTN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg7vkLDK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCqZPb029478
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+OI2myA/HDJvzEyeSqpMmJ
	BCPyy2/yWqJYYoALmzipA=; b=Sg7vkLDKThmJcS7bG3mIjbQbUrytGvgNZsoI4b
	jV+s7vmzKQCw+dLbciHzOCItkBTpJbNRAD1M5dRZWqPqZpEkIYpiSrrjC/hVmeH7
	B9KsIZyJgadneD7zO+izigPTGQibX+q5Ca6MInehnd7wLClv8INxdMaO1WA/+vMM
	KIMC5y3cV0bL7RrWs+r2n23dgQZCjqab8MoV2IF91ewr1o/p4P+hjnqZTDPtI73U
	0IjFu2qQacFa0cKmI/1qOHc+wAlBr0ETaw1UZYO4nlHCC5VMZXQUMhBVi/n/D9nu
	agt3EYUNhK8MEzEY7gNgj1OfPM/0eqSXMW36qldbApuvniNg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnysc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:58:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244570600a1so3576515ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758299; x=1759363099;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OI2myA/HDJvzEyeSqpMmJBCPyy2/yWqJYYoALmzipA=;
        b=wLALzH3Q99sQhZZaY008I33aivs5gtSXBwZsNB+JkObPiRVe2GrSTJf1dQ59ZE26Ks
         8QBSvQO0Tena4bkYGuziliyIr4AED2OfJnja+Vy/8Hdr3lNhdjZT98+OFdbKelwCIPN3
         qMlQQzw3A0fe3/NOrrYAKNyIWNvjbObwRriuziHXPjGe+vTW3laLBJqh4yiId5YmQ+BK
         QcoJ+hSdlgT0hZIWdmw38YxG376F3JG6QyHMdZ9p3jEel/om/PibHA4e2Oqydsc8BWUI
         2+nnZSmc5NWNVqrffLX71cTefl2ExvE2sA4snHSoVK417gJM71GjklREDoG0Wd2QhkAi
         srxg==
X-Gm-Message-State: AOJu0YzLWNRWMtOrSTUUteD/fC4/FakPHiPDsKUlR4EqAZ4RIsoEQgmf
	6EsSwR2vvRs3r49aE8eQ3sCspuLmpuFltYBjFyJoPjo6FkDP0zMYtn/eS1a4xNW5P+B8Me2O5UA
	s/8UMHyfJCBjDvGoVljw1wg0c3uFXmrN2uL8HbWNSIL70wWnPZNUp8OQvPr6RMikaJo0P
X-Gm-Gg: ASbGncu7KoQi+lsOY87Z3gL22K2YQYRUdta73AniviDZyo+mJk1SR0QLKdkjr4KABLN
	lEm2o3gXu1TduoYPQNdy8XvROJ34MQuvP6bjOn4SLJ/SUZEyy/OLZiz/SQGtn2kVvUPFjFmfU17
	tij178TMzWsgixe656MaZYjs/iqlfCDmZJ4cFWWUTaMsGt76xNvP45obHFyzT+w2wI0sjNJ9OwB
	XXAyPTgXP48gd1cYfyevj1V6N7lavVlUExlMoGQ1+JjuombMoKWwkeST8/vNLK7YXqzQl3eS+Qu
	gLVVL5AKlhI+nNEPj822ZpMkK7D95TcC2v81lHYEVufL3uG+5yyXZOd0EnvdT6InS2gje+ducJz
	QpOinzlLJ/NPrPMs=
X-Received: by 2002:a17:903:388e:b0:264:8a8d:92e4 with SMTP id d9443c01a7336-27ed6ac9815mr7120925ad.2.1758758299022;
        Wed, 24 Sep 2025 16:58:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk35ASYn/t3dEBZvcuLtGXClEqWal0BIggBPBQcWamgNIDKOc7AZ9WF01T40wkQfuEPCw/AA==
X-Received: by 2002:a17:903:388e:b0:264:8a8d:92e4 with SMTP id d9443c01a7336-27ed6ac9815mr7120675ad.2.1758758298613;
        Wed, 24 Sep 2025 16:58:18 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a9668sm4402965ad.112.2025.09.24.16.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:58:18 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:58:09 -0700
Subject: [PATCH] soc: qcom: pd-mapper: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pdmapper-v1-1-fcf44bae377a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJCF1GgC/x3MQQrCQAxA0auUrA20USl6FXGRmUltkI4hKSKU3
 t3R5Vv8v0GIqwRcuw1c3hr6qg3DoYM8c30IamkG6uncX4jwWQ2tLGwmjmMa8pHzNJ4KQUvMZdL
 Pf3e7NycOweRc8/ybLByrOOz7F8eKvrJ3AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758297; l=1261;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/U3G/f/oGqJBr8L7mX6FX3eckh2FYEjzKCL810qS2CU=;
 b=kyYLW5Pcu46Z7Q8gy0zgOL7v96F+APpLJS/fHx7xwbSvG5ofAv2fKtVpI6BgG5rjOw5k8HMQs
 h0aOQR0XWTEAFEOuGyvtytPdg9+CC/K2GMvAvGfhcUSR7w01x+uGtGh
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 2lfTC1McjWApvi0iM-6LalBXlw7yZYW_
X-Proofpoint-GUID: 2lfTC1McjWApvi0iM-6LalBXlw7yZYW_
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4859c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=X48u0K_GNqLc3HHWDA4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+DsPkcBnn4I1
 7Gr/smXyytN1FexQXlytQKf8j/zWeHKZbyLHiHXJNEjjanVzA8CGvr91ZApoBDWc04RczyxJY4Y
 Qj+A0FLipueOr7HhmWT1KNoFv5VCfqlwjRraRt1U5o+p90VXpyXcrZhF3yO5oHVKpnNIbMNj7jC
 zeJYSLJPgdVRENJl9kTBoFXQLJD7XUieYMaMtJ7KJQvFUhTpLaQqs4EZV/IJ+1/5qE79b7rocTl
 nUMq1rMtM5ZUb8vSMsT7/4K+vKNIhXr9F01B5Bce5Vtdal0LoDQPNGrrnHFyOLs+1zdQ8ngUHu/
 +KIaIId27ASErfzZEsYRHoVOCa7iTyqsGcOtsVQUAd+zxLOKa83e4oJdkUjpd+8j1aYhMUixBiK
 ekgnyKDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add support for the Qualcomm Kaanapali SoC to the protection
domain mapper. Kaanapali shares the same protection domain
configuration as SM8550, so reuse the existing SM8550 domain data.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 6384f271953d..bb2eeb955106 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -552,6 +552,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
+	{ .compatible = "qcom,kaanapali", .data = sm8550_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
 	{ .compatible = "qcom,msm8916", .data = NULL, },

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250922-knp-pdmapper-7b1c3acf74d2

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


