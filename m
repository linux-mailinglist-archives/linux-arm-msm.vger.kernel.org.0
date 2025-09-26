Return-Path: <linux-arm-msm+bounces-75268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B625BBA2C07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C74D21C004CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5469B29BDA4;
	Fri, 26 Sep 2025 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZrHsPoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F90328D829
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871647; cv=none; b=Wu3JBvD8cfONM60KFAYjCpHhRxyjz8+joiWpl0nKHGUPE1Q2RtatnsNnTVH935deDnjvDOba4omAn9YLe6M/Uzglk2ZA5ODaGel2qrDjp+H9Ig8dnj1UdLd6CNwB6y1INrK4qTECQTnJXUyMk38hQt8w7xH9TBUkaJFnMXGxjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871647; c=relaxed/simple;
	bh=DPKLxEacqPPVPld/3Cw3ossBUvxFPG/ElRs6jI9aG+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EkMErC6c7Dt3CSBRQ07rPAjLbJMNiGjC6aVbTC24KTPxydXWgx0EOB0n+SnMseC3Pj4H73WMElA9r/dsOawiRo7Et7r+H8kVBzk4tPVsxKc0XED+RZPc26CGSDk+fbsQkr43XOGUp6yZBm3e+LTQ8BYCqHZJS3OTzvw5GZ/24Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZrHsPoM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6vQM5026497
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBnKAQHtJIUzOuuf/k4xFN6GQiHRN0JpTaejw5fAgk8=; b=MZrHsPoMJRf4Qv7t
	g/gyESw15cUBoBQ0NM7U0rvmGcaabIU1i9HsyOExSPgwZ1Y0OFNx93A0GNbAvuaR
	C7ahVwfEwmv2FxHxBhTza2NEKZ3uHzYqJbf5qOdFRcvu/q2y1nvr3qI6sf4T8paD
	JbYZyLtyU2abpbrfU292PyoBMkzcplJedsbXatYBZYPWY0qpN6CG8DuPmfJ60YNR
	ZybP9POnattamOTLDX53KBNx5nOEz6POTf2oG9L4xDuBoBiLkOv3RQt8OsAi9/N3
	KL/OyY1vw9KzgcIJrDLIOltl5Ksz5Yj6fThvRDApV3cfj20RFODrTIDLe9EjJLVL
	FFx2NA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u1vtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:27:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26970768df5so4239685ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871643; x=1759476443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBnKAQHtJIUzOuuf/k4xFN6GQiHRN0JpTaejw5fAgk8=;
        b=puGkYVXCkkdd+x4Ki+u9fhNCTDiszjydyQfNEJgaEghbhIOou9KPPTJRI8+zIx0+ZG
         eruB0EN+PIKuWis3bXtf5ffrsz5dNiPrLte30MnvUJP+kLT3NGP5Xrm9zFzKbdmRtO0l
         jieB7ksoIxt+8X2v1SXLA34I88N++53c8GLuE8gYrRvcjvWuUOiiaFURYAJ3pSthrQvX
         VSW+PYUP1XtH3KCDd2uw2pSnB0LplyBhLk+LiuhOXZDhcS2tDuBo3V2yeALyglOb/kI+
         pl7Qkw+Yk5TjaMbMEUqrsTNxobwE/KrUgzgKOtmMrQWZVfjMYXfaz3rAnlOWeuvPawhk
         WCXw==
X-Gm-Message-State: AOJu0YxKfuIR9OycDx6NzwWZA0HN4gfS2rna7Y3MGx2xlJVFtCFAgih3
	jxLDzEmTDSeNfjIXZUIhsX/yWfpTLsBe6nBlXOU6D9qvvWv+I+hIeeQNwK4CfjCWOXKbpAaKHPC
	+zheJzeNd95Yj7xdN9rIKCeJ3QwNEC/IH9UCNV1Ew67vYSB10TvX64LvP6Y7ujX+YuaDp
X-Gm-Gg: ASbGncvk3CjetinRL7qYdHGeYSqTtSKmmzDcCTMNTopsbxEIzYoZ3qkn1Npb3pKiBIc
	ncy9I01Xjzo4jkVk/fKs4feSqjLH7fPxlbvEvTYpU4sdd1qmOCQXmm2n8SfrWktDNJIayBzMvfb
	MVtIX9/bv8TUBi8eVeUNrZAWnmPv1tL7cW54loJSNK1/kNeCqnRmgSTiiKE2+bFleGpJlYj+rbv
	pn9WY1JtNBJ0Peamuf+RSi2WJpBdtnVPQAQLm+2sX5G0ZQMAp+zzKqqF5uj/2rtaR/nSX30E/op
	x20vA5WtyvH76I2KoFZRTdvodVLegHyCjWPp7WS8AyTEn8/L+BQ1kD0n8eiV6MN3KKNjKdzNqQe
	cPSN0ekbnaXvzM0KWE9skZ3XKYXM6DO8obUQfymei8M/uVmNPiza0185B
X-Received: by 2002:a17:902:db11:b0:26b:1871:1f70 with SMTP id d9443c01a7336-27ed49df69fmr43571475ad.5.1758871642914;
        Fri, 26 Sep 2025 00:27:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTX2igDAbPEs0gasTbZkRY3PEKRg6iD3OO1BbSDu+8oSgdmgCgwl1nIHEcronmpOxG6BZOag==
X-Received: by 2002:a17:902:db11:b0:26b:1871:1f70 with SMTP id d9443c01a7336-27ed49df69fmr43571025ad.5.1758871642379;
        Fri, 26 Sep 2025 00:27:22 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:27:21 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:46 +0800
Subject: [PATCH v7 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871564; l=1933;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=DPKLxEacqPPVPld/3Cw3ossBUvxFPG/ElRs6jI9aG+g=;
 b=LKwRqi1oGH1DuHLM7E16LiWfNw5DOeR+8o8s9eF6SZvkMm3iSdaWji+J524cD6f83xQZU7P4x
 jx9iHVmnqEvCOsMZMAFLUJLwoQrBPzoPBnQelsJeE52ZLRbP7VKfXfm
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: _b8uzwbkK4GG6YV4k2qVYI1iuBny6AjM
X-Proofpoint-GUID: _b8uzwbkK4GG6YV4k2qVYI1iuBny6AjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+0J4HKoSIU6E
 imSFcc4JQn9e2lgopZS27HwII5XseTSn+QdUrg12nkTl2z+XU2UGPl0C1dVQltN/fbT8K++EWRF
 QoTwxhNRvXZq8p7JuWHmdBYgu0B2CfMw2lus8eSort3xc5xFDBz73OT5t08ph7oup1Z09OlbPcv
 uYuFAl0Ig08F7ujka6+Bod/ggPIO26FjxPeZv6WaHejG6Kq0zu7YwaqG65TzSgJnLOBWd1tp5YI
 D2kFXeVRnsh60v4/ZU8xFW14VSoCEDL83+j99BsSx8/yaRvjcGK8qVEMT5S4qqwyzOFKIMgjaFz
 MKx2C8jiIrdlpwJNm1qF9PjUgzuI7qdAuLoj8vs5i8z9MqKJk//R4A5PblphM4HiUe+CCiNTjdw
 cM0uRkSTLtaWcFHsriZzuWfwuZiZTQ==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6405c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RloG_8Ug8mropJZ47ewA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

When both USB and DP PHY modes are enabled simultaneously on the same
QMP USBC PHY, it can lead to hardware misconfiguration and undefined
behavior. This happens because the PHY resources are not designed to
operate in both modes at the same time.

To prevent this, introduce a mutual exclusion check between USB and DP
PHY modes.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3580c19fd62e02aa373cec42e9f53143f39214df..d84bf68940043bce13565503bb34796e653adbb7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -666,6 +666,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_usbc_check_phy_status(struct qmp_usbc *qmp, bool is_dp)
+{
+	if ((is_dp && qmp->usb_init_count) ||
+	    (!is_dp && qmp->dp_init_count)) {
+		dev_err(qmp->dev,
+			"PHY is configured for %s, can not enable %s\n",
+			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -673,6 +686,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, false);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -726,6 +743,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, true);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto dp_init_unlock;

-- 
2.34.1


