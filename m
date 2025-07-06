Return-Path: <linux-arm-msm+bounces-63856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06676AFA5FD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 16:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5137C17C305
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E088C2139C9;
	Sun,  6 Jul 2025 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgMj7QwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348511EEA5D
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751813244; cv=none; b=KRu1vftha06KP2ZRp6Pt/Gtn0IPoBr4ag5m1k1UyWJdYWvtTg9cGpT+0lx3IM41BvseHYzSzCY5cWLCZwxIootZKCZVbap7qk/v7F63QUBU2y62LMmUGFk1gdQkD511yyOVSmsnkJTTzajHS8Eg0K7LWF+bBKJ3eN9yq5f9WWDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751813244; c=relaxed/simple;
	bh=skypqUzSwtXJGsliG5Y8ja/11l2hi+RC9szZh61cAag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MD43dh5ES7rW9Gciaxtiu7QLeH/lEwhFSgKAFfG008jAzvruQDVMX/Polz7DKhG4HkZL2hsfYFVEnNgrkJAvQ6mHFU+TuSNw3Rk7zqdSpdv4w7ALFHNqunm5YZjnEI9J5Dvz2uvey7pazutP8PMOFEk/x03JCsN3Esw5Mya+0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgMj7QwP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566DNnY9012786
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 14:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vsdY6eVGhQLNX0O0RCx/rJ
	VWqOZjeYxZJRJqRPOPjKQ=; b=hgMj7QwPc8SXaciGyvmg09TXAqh9drASBZjOaO
	pY52TQ0TMLUf2h0gQrdwcewrvzj90XMM3Q+FLAFgQwnuj2byl1FyVsORnmGbVcZW
	mWwwLomd14L8h2EkPv+OoHFK9MHFRVeXF9whUfChmAqmF8HC/c0mdzm9Xzrpm8ef
	usvBqYE77LFb6cUJPMra14DEwQdGeVgzgO3CHqUbvbKcrAc4xL718DYcTQnUVBhh
	f2dG6S5l+1COJlzyN9aaStfUid5GTY+YjEi3NMT9rLRvTm8chCOwLzcJ/ahl6UW+
	S5R0Xkni7t7HwJX4Hyc118oNuJ6GXkzDiwRhareBMv3bq/zQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2amvf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 14:47:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a585ad6726so90571261cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 07:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751813241; x=1752418041;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsdY6eVGhQLNX0O0RCx/rJVWqOZjeYxZJRJqRPOPjKQ=;
        b=O0Ya5VqEFTLd83MkguQfvPyS7I0xeANOrdLQfevmn4ZB9cqsN+EkimHnGQouoDWG8t
         lCJV15w0JdNgqIgahpvWfOYxi0DYWxEW+lVmXhu5Qcfro9DlJkrRh0GnR0ojwdjBoM9o
         i3/G2wWRSR61Ntb3KpkwamfXyNTXO4KerZN2yhjwbPFhNfXZKZJf1I9K2mj6UO04uguq
         keqXgGUiTVDLCsZg/h41IkFYhbNqxdpVxqfmdB0MI4+OGQGjJg8Lo1e2CrWfVyk+/EwW
         tNn6JGwxkJJRmkdyKDUnA8GcuIQlhf4PrM21flLTu3Uo8U8LTVexMnD9ncFqIAH7mF8/
         EdNg==
X-Gm-Message-State: AOJu0Yx43SVfyuDMAeeLB38ZPQj4R6XKf0JjRG7/n7vGspammLQejLjh
	aHKrX8nNDc7wWahnsNdyvNTPZ5FEvuxzW0y10izI9GcRlyktqRxvDszP1P02r42uryLd3vWtwld
	7rT8HDJ40/Chf/73sOTT23RAeThLfLpRkcDvDLMfChAqG4DibI1QGcBSew+DPu36nWDFC
X-Gm-Gg: ASbGnctJvErAbAnLXzn15/XTjg5MyAu/XSNEfc1nZ+XCiF2dKCNAxmGVe0XjASfpPIc
	dFij/ZbZtKHPI5jU/eV5cvmfREA0r5BnHndfSszMmPddpvmlyOiyEbMbuXLFSbFKru4q4JMHsbc
	c5CHSoYwGP8esWdDiL9xC5QaxtQIiAKHUqrHXoFAhaVte/gVVYz2Lj85rsy3vSaQnBCNuuYerQ3
	esgeDFLlPe0lWV8tgFU3Xma2xj2If2nTKu9zc361+tDZfqNTpD0j9EHaPTf6hWmBPfx5S3LcCFT
	QNgpE/A5TgaNtLyyjKLpNBmAMg6nyHfKODsdynm7iXdDHO7CTgJ2tMXP0qZKS+Vx3bZIJFqNtm9
	fyOa1FnVtMd/lbQ3bdJ0rRFAIG06xYVx0d+k=
X-Received: by 2002:a05:620a:a109:b0:7d7:22:25b4 with SMTP id af79cd13be357-7d7002225f3mr464495885a.13.1751813240896;
        Sun, 06 Jul 2025 07:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoVxk9kRFZG7elfkrbqpXenfZ/5F9xPYBP2fV+rFJZtlWG00EY45h9sZgiedVAQmSfK58O2Q==
X-Received: by 2002:a05:620a:a109:b0:7d7:22:25b4 with SMTP id af79cd13be357-7d7002225f3mr464493385a.13.1751813240450;
        Sun, 06 Jul 2025 07:47:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c3e9fsm978369e87.227.2025.07.06.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 07:47:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 17:47:08 +0300
Subject: [PATCH v4] remoteproc: qcom_q6v5_mss: support loading MBN file on
 msm8974
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGuMamgC/42Pz2rDMAyHX6X4PBv/jZ2d+h6lBydVG7M6Xq3OL
 JS8+5TCYIcdehH6SXyf0IMh1ATI3ncPVqElTGWmYN92bJzifAGeTpSZltpJLzueMYfeW35O39Q
 jBzUEUMoOHiQj6rMCrZ7Gw5HylPBe6vI80NQ23VxGkk15La0S2tDA91zxU073uogh1gWnj9L21
 zTHWkSpF7a5mv7LB+WM05Z4MvXuFd788v//0gxJwuAidGoMXez3BVHcvuJ1LDkLKuy4rusPpBt
 ZRjUBAAA=
X-Change-ID: 20250706-msm8974-fix-mss-e1b8e114b7e0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2505;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ffQraQlDo4VxV7QYtI1NeKFMPYu+1edQjOFU6FplvMY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaox3o2bW7vVz/PPkRnEnJVlq/p6g6jf7f0nhc
 K1chBRPMs6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGqMdwAKCRCLPIo+Aiko
 1Xq+B/4ihMTdqR+F9qPwLmrNWCgeovUbEo7x1DUQi+3xt/RM05Wlkacyd/lpVWLOLFNiqw3li9a
 QeafP2dGHD0YZPQ6XC38oUkqyumuO9Rp9fKabLEtRirX7WhtQ2+GzYcZU7uzdSiSuBBToA59AGR
 m1s/CnkR31rSRxYYky10ZuIEltebJoaPlR9kURNUcPzdB+yZtWriX5hdUBL1GGAu3vearQNcW46
 pNDBRjyst2Zc9BKs/E21r6eGqOa3ATn9SRCR0WdRgCjntNisE81vKVa0GWlTpGfQKOTOQsFhreB
 sgujG+mVSFZEoaTiV6VtsGcb5rXKHAr62clL4IGm+gfNdHRS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NCBTYWx0ZWRfXxRTnfmPeiXTl
 bZTAe3/5fWdcI76hzOWM16eGIJObpRrd46Pj4fgb7pHPb5YwDFxAFNX+RaFxiIXm6ZdhfFN11AU
 0qFeArIcKQggNjVavJYjEjq94ob+0+jMtM5m0H1Bay9FH+nVdCLXfRs/OS48Hqqnz/Ca+689wX/
 OYRWPc26y7Vw/u2KFlz9iOQ2a6z5PtB+rDF4Bmjcc5ulLCg9PpJ+kfOPwL6J4rCB4ifOCMiaFV9
 IsewK+DYsa10Q0qMZ66M16AaopS7vtz0pZviSdLBRmT23ci1gZZGJqQ/L1uWNgk+jR8iZJfg7yP
 ofDbpqJgFwJMlelNrQG/79qumwjqVX9qiVfKQTJ5nABarEibbJ0Ewsp52WyoNEte+raoTbH/0JC
 lNJoBCnivAeDVI3h17Lk1hFyNXF7RiWYAd335YoSC96KuQBJcRmIFlWWtPmOD02Otps+X1fr
X-Proofpoint-ORIG-GUID: JMiRlwniUzCIIdt6rlMqu_0uFnaYwnhK
X-Proofpoint-GUID: JMiRlwniUzCIIdt6rlMqu_0uFnaYwnhK
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686a8c79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=pdK8BzC1Fe2ipjuFi3cA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060094

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On MSM8974 / APQ8074, MSM8226 and MSM8926 the MSS requires loading raw
MBA image instead of the ELF file. Skip the ELF headers if mba.mbn was
specified as the firmware image.

Fixes: a5a4e02d083d ("remoteproc: qcom: Add support for parsing fw dt bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Expanded to cover MSM8226 and MSM8926.
- Link to v3: https://lore.kernel.org/r/20250706-msm8974-fix-mss-v3-1-8b5ae61c86a9@oss.qualcomm.com

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
 drivers/remoteproc/qcom_q6v5_mss.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 0c0199fb0e68d6286f1e238d110539554d1d5f14..636f00d481ea80508fc9db28d8e2e225ea52372c 100644
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
@@ -516,7 +518,16 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 		return -EBUSY;
 	}
 
-	memcpy(mba_region, fw->data, fw->size);
+	if ((qproc->version == MSS_MSM8974 ||
+	     qproc->version == MSS_MSM8226 ||
+	     qproc->version == MSS_MSM8926) &&
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


