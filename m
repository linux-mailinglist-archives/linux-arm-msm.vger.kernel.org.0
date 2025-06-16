Return-Path: <linux-arm-msm+bounces-61508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74FADBD10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 00:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 869943B6EB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 22:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBBA225795;
	Mon, 16 Jun 2025 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/OtMreW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012D221C16D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113790; cv=none; b=dg+LieL9Klk1pEIjBhjE18ooMQ31WlTu+JEBaNl3yxgj6Zymm02SfDeTn+cKDaHksASlwFk1D2jxnqh6wu/KGvt4CQoB7nrS8EoiDN1IsNiTZQW/dXOEzBCX0slcETzbJnxyMjq/JK1wr1thRmaiKo3MHqsCEBnJ3+VEtO5xSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113790; c=relaxed/simple;
	bh=jwXAlYfmhDYsCRlqK3RU34h6+Mh+UVwAG7ubZFvcMXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VYN3azthGROB/FkB7A4+oS31MCY0GnSwF+q9JTu7t7SoBbiTOPENxyTAIAzDLd/wpX+gQzR1Y+XlBBCmt7uhNUeRuPXS4z3Zm1SfDC9XYmHUHsgj6AnhRol9DZTSeid4QJYFoSNW3w5aXXuR2HW3fMXl2RbjDx4wYf7iZ7Qt1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/OtMreW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GGZX4q011918
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lhwmguzIPmh
	cfCIr+Zeb4Fe0l1FXFzrQsdEuYLGejCA=; b=M/OtMreW6tTSjgnFMKZdWIY0O+k
	YeB9UMeLnYPvtr/fjiNgGWs44d/z1Fe+TBG01jUOyxhxuIaQ5pROidaUtfNFDbtj
	XdsvnEMv8hu+81/724GXJeGUqhALpr4eEwG/mEdxlV2JPw7rgb/BIRUZzOc6BRmH
	hNKnst2CCHCZwoLJdcuNj8cJX3zm/PlJzi04x/fuMHigzrQYOms1FhO9xNIYyutD
	KVShgJR3eKQHjGgpU/gGEj0O/bSyg8SDxFCvVpL1dUn43add1hapRfHMXCE6UBtB
	t1S7n8eFJz1dkSAxg6WYxmUdsXRzdhUDUnFb40H/J/kQ/dvD16R/AF3fLaA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h962qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c38df7ed2so3591570a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113787; x=1750718587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhwmguzIPmhcfCIr+Zeb4Fe0l1FXFzrQsdEuYLGejCA=;
        b=DqscrJro83UOH/+htZx7YzDseEkcmAfUguaDee59kNDk0BlNjc9mOhDJko1IgzD6a1
         g4OpL4Ink8FeeI7SStrglaoMyLgLAaYtkRg49g/bqRzVSizShesHxx20mf5cTYXpOC1D
         MljeRjnYPi5bdl4YoKFXFtGmaOIiZiiZ9gSRpLMObybqBKWMG9vkGgcUlRnriEOEaXwn
         o+C0d7rRS6b5ugUlk3Qs5IiA87wrNeBEeUn7DT6G+Pq2XocttvJdBUMOZT9Az0ALePWF
         X0jdubG9vSG1zmGbR9hqYiD1kffdyyaVw9l2targpJENPkdQO26Obd9a2WFHksn/qSLH
         opVA==
X-Gm-Message-State: AOJu0Yy8wxRApf99d4rif6Q6ButF/V6hBc7v0fzHdBK5/kN/BKGwxkfc
	SdNoMzfLlwCitN+WCnXGtf7gWJpMp52zEZ/MNtGjtsxIlO8EIQRiORRKMXnwuBsIi+saGxie0ek
	Q9k/NrmOHtjQx7d9Cha/zGBwyh548+UkiDQtAaHgaPDpdDHgsBfA0RCQGWwmp4QYm/IWR
X-Gm-Gg: ASbGncvQ3SjU/3bGHPWXHkcLldjILO/U3FZQXtZp+48Hi8nwFgl1rFIVhA9nNUXJMKb
	rylb5TehCG10mKy3VNSdtGJ6BfyLAX1wAUiBbBpoeSOnMLeK2E9GRDDzvkU+8l1c0GYywAFgIBu
	J5T/egk3xKUM6pMIspeCcqsCifjy51naP/WZ+RVMECjEpo1G87PRTCs/TdGFSTamwcL+b9ib5A2
	4h6mlJUfbWUYsi927/d+RNPcsLWz7CoUSyWD1mZTUhglQfYfjULdyYBjeNAB0v3KqdVvaJlbruU
	D4x5q5OZbqXU2EFS1xQxTU7m1qIfPf04O1KtRDw3JNUViIM7a1m1kFaqDv+alnJm+Mp29myU
X-Received: by 2002:a05:6a21:6481:b0:216:1476:f5c with SMTP id adf61e73a8af0-21fbd67e9a0mr16273211637.25.1750113786542;
        Mon, 16 Jun 2025 15:43:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCUK4WZBPlh1OsfUgx/7QkUvePE7tIw8RLbrhNrBkgKdkjJRcElSReSy0icKZ0zCzm+TpmAg==
X-Received: by 2002:a05:6a21:6481:b0:216:1476:f5c with SMTP id adf61e73a8af0-21fbd67e9a0mr16273194637.25.1750113786125;
        Mon, 16 Jun 2025 15:43:06 -0700 (PDT)
Received: from hu-mrana-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083029sm7405077b3a.81.2025.06.16.15.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:43:05 -0700 (PDT)
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, will@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        andersson@kernel.org, mani@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_shazhuss@quicinc.com, quic_msarkar@quicinc.com,
        quic_nitegupt@quicinc.com, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: [PATCH v5 2/4] PCI: host-generic: Rename and export gen_pci_init() to allow ECAM creation
Date: Mon, 16 Jun 2025 15:42:57 -0700
Message-Id: <20250616224259.3549811-3-mayank.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616224259.3549811-1-mayank.rana@oss.qualcomm.com>
References: <20250616224259.3549811-1-mayank.rana@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PWIYxBb6KqcqxisOuF2LbfilVDUQYcM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE2MiBTYWx0ZWRfX11ZuSQl7LGni
 CERzcSOvPOLnXT0w/TNj/PDfZ6SXXA/ioWkbVUu7Z5MEw2YuFFGrdKLKP0aubGbpw1ZJoDoF8UO
 vlWK38y++e5S20C8BHh3R+j4Tshq20mYizs6BJmR9tK8oFNp8eXatdT94+r72xNr1fjYTdE+fSP
 wbTFQhjqPXF8ndoKCZiMaUbWEPG2Z2ucmu8vdJ15K1Ll35nSG9j7umlKBT23PVW9nsYebOC0i10
 jWxDo4naYaGJf7nCQUeAZR302ZHWNVOByeabxjxcD9PrwnLH/7yDCbRnCMoejue7X92W2OKKs19
 TNVu3Eq3ipqA9eL/sQHRt30DCWb0FrA4P2hKeKWgApWmQ+adu7ElhlJ84Xqm3bHSUMwhWT0UR9y
 OTR712i5/un52Kcv3+22CPfJ2ZTSWLiHd9ZDMp4qGYsG+n1Qd1F6fIqmd2V68EbZa8gIJIym
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68509dfb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=IL0NFLon8k7eL5dmDYQA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: PWIYxBb6KqcqxisOuF2LbfilVDUQYcM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_11,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160162

Rename gen_pci_init() API as pci_host_common_ecam_create() and export it to
create ECAM and initialized ECAM OPs from PCIe driver which don't have way
to populate driver_data as just ECAM ops.

Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 5 +++--
 drivers/pci/controller/pci-host-common.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index b0992325dd65..5b61b5a9e0f9 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -22,7 +22,7 @@ static void gen_pci_unmap_cfg(void *ptr)
 	pci_ecam_free((struct pci_config_window *)ptr);
 }
 
-static struct pci_config_window *gen_pci_init(struct device *dev,
+struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 		struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops)
 {
 	int err;
@@ -50,6 +50,7 @@ static struct pci_config_window *gen_pci_init(struct device *dev,
 
 	return cfg;
 }
+EXPORT_SYMBOL_GPL(pci_host_common_ecam_create);
 
 int pci_host_common_init(struct platform_device *pdev,
 			 const struct pci_ecam_ops *ops)
@@ -65,7 +66,7 @@ int pci_host_common_init(struct platform_device *pdev,
 	of_pci_check_probe_only();
 
 	/* Parse and map our Configuration Space windows */
-	cfg = gen_pci_init(dev, bridge, ops);
+	cfg = pci_host_common_ecam_create(dev, bridge, ops);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index 65bd9e032353..51c35ec0cf37 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -17,4 +17,6 @@ int pci_host_common_init(struct platform_device *pdev,
 			 const struct pci_ecam_ops *ops);
 void pci_host_common_remove(struct platform_device *pdev);
 
+struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
+	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
 #endif
-- 
2.25.1


