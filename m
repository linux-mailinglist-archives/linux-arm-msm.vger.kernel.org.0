Return-Path: <linux-arm-msm+bounces-63853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FCAFA5A4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 16:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D787116F255
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 14:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352BB1F95C;
	Sun,  6 Jul 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAPZt4oy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00CE17BA5
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751810457; cv=none; b=iUHhSgu62Zw1GhRg+0ucyP/HfZMMDbcX3P0sTci0NDK+0MVVgerVVg9eBg3u2eXeDVVbBJjBTxt0W5g9JJ1Go4ymvICK6GhCmApGC4OcsByWMVkP5Ph98URu5aacL+NlCuJO8D4ppdm2Q6VdRr40twbzH8FK/yuwuWUJ9vKPA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751810457; c=relaxed/simple;
	bh=oqwimgWLnScWATCA29eOQ//MuKV5i1lpW+AHath4UoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ox4eCkI//SRtI6YlFkBRKIjDry9S6a1Ieuq3quILF7J0Yy8wQFtd8rOghxW8V/9yPg7omVc8fDvQZ3Io4fNs00LCa3PWjIMqCp3Opf/QmPVMGlnU6uTZ8R0JR0yNwx+VvBt9erLEgCOdMe7DEwsYIrESjm2Ry8qBYW79vSrczfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAPZt4oy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566CxOBV029876
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 14:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W6Z4pPsIJFqCRzzz0glOc6
	nFhWzx26VPjC/to9J8M2w=; b=fAPZt4oyKGim7oDcpE/4LuRRK2VOyFQQSBvr1f
	zXqWUd5/X8SBGwADi/Rf+3mrtsp85BZOjjdyuJog7PIWUppzO/jcqBLK//IUAhpV
	vDkCJ9pfbayeCaKe4xVeM9Z84UJwVRfOT19hn5JPM6mG2K/fUJofH8H2n7fCBMfV
	NwyKt7JITl9gSD87AIodRCa97P3+alwA2IHUO+3FrC3RDczx9mo6NO6VFNfu5fbt
	KoHZ/zv31VCwFQyZ0u8mmQ4Oc8QpM708Ajc4VfWjlhTfuONLnd0bT5Qr8Hvhi8JI
	3mQSeJGTIY9ogjXV8ZHedee9ic3MWWWJCFhK1L2TBX20kY9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmcqyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 14:00:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d444d21b24so385220385a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 07:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751810453; x=1752415253;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6Z4pPsIJFqCRzzz0glOc6nFhWzx26VPjC/to9J8M2w=;
        b=J6qxcV5nngylbr8vU2WUSpdW9OYCMOYOCDsBscecxlyRHxqZ+WO0a+EGpBZK7SiPv/
         pqfxNXJf1HdRPsVGlUeFXHFFOnx0Ydi/+allX2o/62naoMjl1ARYAoRdA430pRxdkUJC
         1DnnvU/NBkxD77Ol7+5km7AYiDk+hN2PiZ7o/c99H6ZxSrmIiIj85SsUEzfHMHUYXhd7
         pjwH3H1qv77gnijCc8JH8rUZ8PHxKsn+2makZB2zwq5gddmdRMvfKB4W4dEmfziMF4to
         0Y4cnytzk2GxrL2U4IYFbMOs34csDDHTNu//1E02IVfTuYCd+UlrZCo5qpFcUmqtzpGD
         xNKA==
X-Gm-Message-State: AOJu0Yw/EZwrrGG9n5mNnHOCflcbuzMKcsJ77bbAWRZpvYbW3KOBVWAV
	7w1TVTGDkCL2y/9Z/shgR9lh2LieyiHWdraxXPZgLINFI71xx1uHeSvAgEMALyIZW6/K1bIymgz
	4bOM4w2Lxf2n0wqusxs2TX5hMRJWGJwn2ZkkEzRvV7k4u/+plYsgA0uDvAurmj29Ate4XHJQb4I
	bu62Q=
X-Gm-Gg: ASbGncsLrYR09iyTh6e6WoYuym2EEodbXUIzkWgwYuFb9xxs9GrgjrshPnbm9KvTMPE
	9Axz63tgVtN6ntEiwh5Rhof9lxKVunXd4tLrGVcmQjtyOOL5fmhvs8i7b5bQopI2sk5Gbfg8v8m
	v88puMxYq51IcWxQ+phhoAdxO2R+4yH93J+LYz0hrKjitMPh+oVJDTahg6ROMLFvHXjo96LBB72
	OicsKheITAvREBgpc8jNnxLMTdDin87yfNEAgYTT7FiiwOiPKnsKMYvt0DP4aTOYcvUgHHKXi34
	AqR7k4WTePIqlHrFGq1IVi9kmYaW4noWd+RaBd4iW4Bc3CXJDv0qzKZwmd91KimstjAeYNSpgCw
	iJvtyVrPWjHfE5b3kB4FXBL2d4zsi2CLpoz8=
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr618786685a.31.1751810453148;
        Sun, 06 Jul 2025 07:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc3upOBwOzreeA4TX5loHnVuqrq9dSSRCBMGhyMTDSkgjtx3ZahhNjPfBFGO7filOlyl0/Lw==
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr618780385a.31.1751810452489;
        Sun, 06 Jul 2025 07:00:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c4785sm972499e87.231.2025.07.06.07.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 07:00:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 17:00:50 +0300
Subject: [PATCH v3] remoteproc: qcom_q6v5_mss: support loading MBN file on
 msm8974
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm8974-fix-mss-v3-1-8b5ae61c86a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJGBamgC/4WNyw6CMBBFf8V0bUmnDwuu/A/jAmSEiUJNSxoJ4
 d8dWLlzN/fenDOLSBgJkzgfFhExU6IwcjDHg7j39dihpJaz0Eo75dVJDmkoK2/lgz58J4nQlAh
 gG49KMPWOyNNuvN4495SmEOf9QYat3VxGsQ28VhYKbbjwlQTZDjTFuWjqOKf+GfLlRWMdQxFiJ
 zZX1r98Cc44bZlnU+X+8eu6fgG0IC3Q7gAAAA==
X-Change-ID: 20250706-msm8974-fix-mss-e1b8e114b7e0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9kC6//TSGE4mGfyjwxDSTzJm9CuKb/MQm2Lwjhyl6rs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaoGT/Fn5GxGYwNVr6ikuRBjBAZ9gQiGjQcX4T
 K6Wk3sgreSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGqBkwAKCRCLPIo+Aiko
 1d5kCACEa5X7vOj8g3uJTKYq3thPgy1OgBwDopVy5vHg0sKDQbDYmtYkJ8Lf/cb/43V6om1l8Fj
 aKy8b/BkNbOFuc9xvtBpai+FigeVryI2uPVcVxCBV4dGwMhDXBM0RhAuHsy3e8P73Fi/GGDtYz+
 n8zBEeQRe5yHOxs3lmxTM7AA2hYE1x4tAIIOngu4DBwy2vEFNdpvtV+R+Sy4a27FY+ZaMf0qprE
 jMZNiejrukxJdZQa+aOQbrbu8xJjv0a0UYkrb5vU0MDrFXLo19ajcR5HrC0P9XHCUCj+pYQH8xq
 fe6NdVMUPLyOgZvcxVqNQ32E5BD7je3TsAjbThuc4ceSf+z9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686a8196 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pdK8BzC1Fe2ipjuFi3cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XbeUhIKIjrvxq5rE5rxkqopwvNwYxwfW
X-Proofpoint-ORIG-GUID: XbeUhIKIjrvxq5rE5rxkqopwvNwYxwfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4OSBTYWx0ZWRfX1e5tF+nEGleI
 TKVGCZXh00nOSaX1K27RT6dYPucktRB1DTK4PskXBnvXdS/1hc7KrZ/omwuPoL0CsqF7xgbYm3o
 p0zLQiHRJdg6+iGIUznhNSkiCpngTAmYphkNOX9iqRxgfuTVQqrH7mr5fVzOqEnyO7MzAuE4x37
 7IbNl/i4G7YkWAm+t1Jpok3EqFHr7Thuj3Xicr1g4KouQsRRdr02AhrdAXLGZTvCIava79WXUM8
 04qAey9PZNOfh9N1jCG4R7FbGgMqTIwk3ID5ZifAL9beKJYQHbMOElf/6y2wOJjaFkABtAI7vk1
 WCbhzt/xWkteC5smCiuw/iwXp3MEo3m8Jkwm43DVWotXVxIJABBHF53qbdRv8aGd7a06OBLRgMX
 ALwVcXL82WpUPMm+HqvOf2R3NzPKNBSKijcMeFJjeMpDypbpcZDCiSTVSGwbFImN6DCsb4K0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060089

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On MSM8974 and APQ8074 the MSS requires loading raw MBA image instead of
the ELF file. Skip the ELF headers if mba.mbn was specified as the
firmware image.

Fixes: a5a4e02d083d ("remoteproc: qcom: Add support for parsing fw dt bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Reverted back to the simple patch from v1
- Added define for 0x1000 (Konrad)
- Added MBA firmware size check
- Corrected the Fixes tag to point to the commit adding firmware-name
  support
- Link to v2: https://lore.kernel.org/r/20230508153524.2371795-1-dmitry.baryshkov@linaro.org

Changes in v2:
- Replace fixed offset 0x1000 with the value obtained from ELF headers
- Implement ELF validity checks
- Link to v1: https://lore.kernel.org/r/20230507172041.2320279-1-dmitry.baryshkov@linaro.org
---
 drivers/remoteproc/qcom_q6v5_mss.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 0c0199fb0e68d6286f1e238d110539554d1d5f14..999644c2a15b46e89ef1c04af294bf02ee0b3638 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -498,6 +498,8 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc, void *mba_region)
 	release_firmware(dp_fw);
 }
 
+#define MSM8974_B00_OFFSET 0x1000
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -516,7 +518,14 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 		return -EBUSY;
 	}
 
-	memcpy(mba_region, fw->data, fw->size);
+	if (qproc->version == MSS_MSM8974 &&
+	    fw->size > MSM8974_B00_OFFSET &&
+	    !memcmp(fw->data, ELFMAG, SELFMAG))
+		memcpy(mba_region,
+		       fw->data + MSM8974_B00_OFFSET,
+		       fw->size - MSM8974_B00_OFFSET);
+	else
+		memcpy(mba_region, fw->data, fw->size);
 	q6v5_debug_policy_load(qproc, mba_region);
 	memunmap(mba_region);
 

---
base-commit: b12a9fa1c88a441daa33f15edfa3ded8cd6d3556
change-id: 20250706-msm8974-fix-mss-e1b8e114b7e0

Best regards,
-- 
With best wishes
Dmitry


