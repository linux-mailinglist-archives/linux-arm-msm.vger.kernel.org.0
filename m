Return-Path: <linux-arm-msm+bounces-58399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC7ABBA18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C55621896E61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C2F272E6F;
	Mon, 19 May 2025 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNLRL+va"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F9272E5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647785; cv=none; b=lLgrQYhSrZucFwHg+l7JjN78TDqocAdB6e0bFhyBNU0pqBDW/BstXvnBPUkAoKLxYVVHSiHzh5zokWnfsqBtMpRqviGVTd2CmIRr/VSWPLHYoPUrGoul/isRzbJRHAKuQ3DIMG9ugwAK6RAg50ave60YF6XAN6BwRKIjZLzkg5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647785; c=relaxed/simple;
	bh=SUc6IJO3BpbO4Jf4TpYtqCzshGFkITnNomre9y5viZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaj7e7eAHOWLsfZAEhEKLKF/epJVTzz5LMJ2tOhE1u/IUl+TCSyzCrEIcto1SLiNdl8rGir1R1IJQBT2Q35zHgszN/9BhV19bUx2nI474fRpYyfFrGmb0zZhXy8hM6BkAvoiIafnqgD3OOgdd/SN+H11iRbQ5iLkjSPkUn/A/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNLRL+va; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INJsT1013665
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ry0Vuqi3xhbwKzg/mP3dYU2BH+BshVjYacj/KzyHCA=; b=NNLRL+vaMQCh5Rp4
	S4L9FjCbGkZXhfazz5BYzNoYPzgIbw7np9qm33KNLiqf73K6ODM4N3KJU8D2iNcK
	tuHNBenNXkqJhVXINbV388GFCovjOgaQrY9vdO9PpugZ55sqFb0KXj4Ezk3ZvOWB
	UbSAX1BqNdvsu9OxALCWbiW1b2KpzlLsdXLJfH3OCWT8ipvdYt60usf57oVG52ao
	6WztyJa4KSwOdoESHXhcmtHw4ZMOW3S4bt4mSJdhcJB3jAC0pPoJLFsXQZUCx/cs
	qRunL12i2Pj20RM+ZogH+NwVd5UGNFALRKNrgB+V7yEAzXbExRLkGUpbF7y1UG4t
	C5NWGw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkykyg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:43:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740270e168aso3767972b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 02:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647782; x=1748252582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ry0Vuqi3xhbwKzg/mP3dYU2BH+BshVjYacj/KzyHCA=;
        b=dALGI+3Zd53sRe6wDNwbe+jK6Z5ha0/KnQAHG+wIxTeuL5E2OcmI+1aPfKBYUIunZd
         JG1wIzHNPnFY/NALAzz/0gCvsDOFkNe9c6HNkGCmvkF0nr0Q1uF592mpviu83IkiZP39
         bC+UhUFFI+BCBmn/jSJnilolwfF07ayv8lAlP46HprnQCT7gqFkioAQWTQbggsQNWR7c
         iyBgEJWV0i+We+c/pXhv1hv9r1pzJvW7ZFZIgHbk+FK4hf3vahS1iQBzClBk+HdTIrjF
         C31kHbxupubcQ1rs6iQQ0sPIrIz5w4HM2Xy37xSBq5KPp6a6eg0dNW6r7EvjLK9evpVB
         4Fcw==
X-Forwarded-Encrypted: i=1; AJvYcCX5cxqSSuRuYo3xndctsYmgpa1WcjQXRIk6JPWzv4q5IpEf5JbvvAM17Q3ZCm+s5mzWtdyvDUUMwI2CEwIA@vger.kernel.org
X-Gm-Message-State: AOJu0YwHcdQGcIFUn2csqb3N/bxx6+1N2CY55Wb9htEDpLQqhgchLL80
	O/ksajFu7NsKe0fduLKdTULrGbt6Ys1aEwfYWuqxx0kZ2O2046dx7iG5Br0pcIFsEtqG659TCjg
	mQUNuLo7tl3z8FE1l4HwyMYww4Kxosb9fAurU10PauDi0PdQ9dSViARMymQhLm3rYp3TQDqOoV8
	og
X-Gm-Gg: ASbGncsWmFwLGccAhB8DmLXAysPKa5R7Aw+c1rIKMBU+ErodoxknsM2zrQiE1eBi7F6
	ZOBrCI0TwEjSwz8WNtXjn76s+PpsCu8CIQFAz0B+SK6rS3kZDxEt+PjPqe50Yoa9hGujmzbqgaX
	cKSCDuPBVtoPJNgQZ+Q5x/eb5TUkc+GBbvN6j8E9O/fp3JWw3oiPJZFpSn1Si6I7ls8iG+ICSg7
	M8410YJ2hWPrgcdd92WmkOWnDnfdMGcT9HjkQIheKZ1NJiUi0mfa54IzEuMEyUJk0LBF1wzefAt
	3Azipk5GeGBSmzz9TVoUkUC2cqWbbC8W3QMAyYwA0UgupfU=
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr18212031b3a.16.1747647781874;
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq4VZJ8jXy0RcqfiaIsLUELp4ZDyQyOCKyt5bCa/MS6rMWomKrNG+4/gCurYKLyPIbNJT57Q==
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr18211990b3a.16.1747647781467;
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:18 +0530
Subject: [PATCH v3 05/11] PCI: qcom: Extract core logic from
 qcom_pcie_icc_opp_update()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-5-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=3243;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SUc6IJO3BpbO4Jf4TpYtqCzshGFkITnNomre9y5viZE=;
 b=0FFqE/2BevOy7/2o0ZDzBTf5YqeAZmEQiA/aA9YnA+gjWks8X8VUxmpvDojUvsuvCAOUWiO5v
 kQRgurHaE6cDCUERnJhf+yxdVV6kYWaaRgoJ9AJFDNrEf0l85bzJbwx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: HTa4s7tjAuZWxzOBBblAdgaNc-Hghnil
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX2Fc6gAZBwIFJ
 4WBOCwmEzR9rJcqeYaN3jsfgkQW7AR/KwlYt5x9aEn/RdVX5detcpG3k1RDRQwpi3MAYkk+vD2p
 HwAC6wo3/xwAO6xCCIL7mNpAU0S8CGfSrK6lJNQNYFQrd2NDflH3ghGLt3NN0CxwjhR2u67hBBU
 CNucJivy7ituUSuCgsDsmwevwv2cMGJRlSt8xheDu0d3fQg3M0F25c6nacOF9RlUCDtq3THHFKH
 vIHUA5SiD7RA7+7ryiWYf5XzYlnrnS0G5DB+HmljnP5lUiH6yVx0FjL/tmGlZ0ErluyxhA+rd+h
 lF9q4r+7zu+zK4E7I5f/531BYk6OkjatamILwUL7rucDAibBjLDoSPAyU9QMG8rwujFfbhpghml
 sAEXmD+EYSRibYmI6JY64TDjVivoPqWV1JXLBdfOlpxZPbYUqLYiBmdMRVCVb/kZPXJ5xj/V
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682afd26 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: HTa4s7tjAuZWxzOBBblAdgaNc-Hghnil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190091

Extract core logic from qcom_pcie_icc_opp_update() into
qcom_pcie_set_icc_opp() to use in other parts of the code to avoid
duplications.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 61 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index dc98ae63362db0422384b1879a2b9a7dc564d091..bd984cde8d3bd688b2ac32566b0e9cdbc70905c0 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1294,6 +1294,40 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
+{
+	struct dw_pcie *pci = pcie->pci;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	int ret = 0, freq_mbps;
+
+	if (pcie->icc_mem) {
+		ret = icc_set_bw(pcie->icc_mem, 0,
+				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
+		if (ret) {
+			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+				ret);
+		}
+	} else if (pcie->use_pm_opp) {
+		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
+		if (freq_mbps < 0)
+			return -EINVAL;
+
+		freq_kbps = freq_mbps * KILO;
+		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
+						 true);
+		if (!IS_ERR(opp)) {
+			ret = dev_pm_opp_set_opp(pci->dev, opp);
+			if (ret)
+				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
+					freq_kbps * width, ret);
+			dev_pm_opp_put(opp);
+		}
+	}
+
+	return ret;
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
@@ -1478,9 +1512,6 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
 	u32 offset, status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
-	unsigned long freq_kbps;
-	struct dev_pm_opp *opp;
-	int ret, freq_mbps;
 
 	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
@@ -1492,29 +1523,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
 
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0,
-				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
-		if (ret) {
-			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-		}
-	} else if (pcie->use_pm_opp) {
-		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
-		if (freq_mbps < 0)
-			return;
-
-		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
-						 true);
-		if (!IS_ERR(opp)) {
-			ret = dev_pm_opp_set_opp(pci->dev, opp);
-			if (ret)
-				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
-					freq_kbps * width, ret);
-			dev_pm_opp_put(opp);
-		}
-	}
+	qcom_pcie_set_icc_opp(pcie, speed, width);
 }
 
 static int qcom_pcie_link_transition_count(struct seq_file *s, void *data)

-- 
2.34.1


