Return-Path: <linux-arm-msm+bounces-52961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED3A77978
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 13:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03946188F2DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DED1F1313;
	Tue,  1 Apr 2025 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrNUFPQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A01E5B7E
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506511; cv=none; b=feNY+p039W0XKmjrbnI1PGzbfRvC58ifjnOrdRfbdVYusG84Ussd1MJIxZZhCWKj0Hag34lwsw+sWLeRW5Ev696QsGHUWsXV2kuEyePWkrK9BVbRZDKHRAWvTsp7K4hyrmOVnd+r3w7c15IASEQNSiaZwvRHVpoBtTSsX6HzWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506511; c=relaxed/simple;
	bh=3j4L2QxOKRrcmyhz4yd14lvyeH370cntxGYp/Fj+41I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XfXHs6Lxe5uKwwncT6heBygv78MxakYRb3LwwiZn9q3E8XWIFkiO9R3iiNPOrX25vaGKQT0PPTujq5idDi59d+28E5yZW/yQfSxHS1ZHti8ngHGvTz+fj9I0GhTVa7zLN8Ctzf1zGscPRt+ViMQva7+0Mj5WE6CteKE9UVBSNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JrNUFPQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53162BPR025950
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 11:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VkK2MM1CAm5eed1B+oOWXK
	JepEh5fzewZSEpIR48+Vo=; b=JrNUFPQuDqQSCYuulpSuaOP0xT3yXOmVTJ94Be
	ECL/uKkNzsWeqkU8L1X1FOIby9iwSJUSMlQFQxTGxNg+6WSkdoGNJ9qw1SjUlrkC
	2I9iSJEd9SienogMp0J+xBKDZEePSD3vuDSZoRSLkzv3w1K4l0kg4OlY6n28ZujS
	m+LZX7iwQdo87yNn+RFG4uv4hufvMKwJPcH2CTXYlVNJ3N1/ZSLA4aVCQMNkL5zu
	IEHCrOX4xsbsLe4qIS5lZc3ekk5oGcsQSAYvvt215h9VIPD9HLLSeOMSWj7fQqTS
	GwYlB5DZNYdFnUPQtpaeJFZU3ZudLwznSbRk7RR/kUW+ChUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhr0c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 11:21:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2254e0b4b85so96151165ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 04:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506507; x=1744111307;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkK2MM1CAm5eed1B+oOWXKJepEh5fzewZSEpIR48+Vo=;
        b=vlJkiAZ1YO6GNF+oPt0s5F0wKgyXaI6JdrCbITi+qc/D57TlE1ljPzrbDars00TbI6
         uC52MwzuT/Qptz5w2fW5OgN6FFSMut19MR6KoDI7LoUFUHcmrkVG11EzUzjy9yOgzyER
         vXykUwNDs0RVtBLGyfOb8+Gmc3Rue9tdsmaUk/YlqIoJ7KuD4rMuflupRdtwSU9Mc8cA
         ZsYHEsM2lBP31jlB5unFQX29CBOLNXzVyATJYhoJzCzpnORN4coe2pCUYRJltRF7yEqy
         dW5Ju3IpWgDghy+wj6mumtN98oz5yFb+H1HwmDEmRv7lStaeqDCm78EcadvgjSayvPbL
         Bryw==
X-Forwarded-Encrypted: i=1; AJvYcCXUumVEum8ihkPeu3z07Gy91PJPtmRF5F6vFWw2LfUvevByh5V9CzED3ASy5ORsYCT5TgcmSDebLv8bU+JB@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbpl93b8WfbXBvTYeTTm1e5jsnB0dKwd6QRcY3JFhTDnOjbD5
	7504Comiv8iPgrT3LvwxN8y8BRxn68Uq8Z3hC06HrD6j7kIT7wxv3A9VFjL+WlAny1Vyg7ch26y
	y1zcR8a7l6TJv0WQLL1Bqf41DjNdOw8ZrUCEG//xVx/r/2S/5fZH+Di9sqs9xpk0+B+0kwIAu
X-Gm-Gg: ASbGnctjqkxM/Inw4OXeg89TaKdow2v1va11mSXrb2R3qh7VQoUC8iauWjTawcRHWRF
	/ChFLJGS+qoxFVQUd+MyRTBoFYA52QtYdv1HcOFKUB4y4D8OVV2jLv7NmfaFgf07LzvEckJ6/qV
	HZcIAUO5IuceOB2DFIjjeG3Ww8itbdyHgUUTzSuB8rD/mhm4CKtrwZsnuXHpeCNADcPd3U9soch
	NCQgbsf3xHkGNB3lylXCX9RL3d79qdI0LOfZ0QlWx2XwcXUS+GWR84cTwABoa8wmvtuZbDuIlWG
	Ykr/WxYDKeF/X4zBUWT3x1U5X53u+TbnkQIgkTwivuEwi3/aH6g=
X-Received: by 2002:a17:902:f68f:b0:224:3610:bef4 with SMTP id d9443c01a7336-22921d5fe82mr256413725ad.25.1743506507315;
        Tue, 01 Apr 2025 04:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy9QF8wS9Rgy7q06a9M9W4MmvXM5rJUL4dGibDgpJDRmq/c8Gipm5EbZFFxWQn7Lq6ftUvPw==
X-Received: by 2002:a17:902:f68f:b0:224:3610:bef4 with SMTP id d9443c01a7336-22921d5fe82mr256413365ad.25.1743506506913;
        Tue, 01 Apr 2025 04:21:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e271absm8936727b3a.51.2025.04.01.04.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:21:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 16:51:37 +0530
Subject: [PATCH] PCI: qcom: Implement shutdown() callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEDM62cC/0XMQQrCMBCF4auUWZvSSay1rryHdBGSqQ3YRjNtV
 ErubiyIm4F/eHwrMAVHDKdihUDRsfNTDtwVYAY9XUk4mxtkJetKSRQ8LLP1z0m0UjW9to1q9gb
 y/B6od6+NunS5B8ezD+9Njvj9/hD1RyIKFEa3R4sk+0NNZ89cPhZ9M34cy3ygSyl9AMwcg2WnA
 AAA
X-Change-ID: 20250321-shutdown-9237fad7374c
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        quic_vpernami@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743506503; l=1778;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bO0uYRbDkwDwxkKRtxqXEwxp/rvstpJjBNdcSK6i0aI=;
 b=3V0Cp04Q+KTThXclzuuxXM7tBv67C+ezon2zOLA+BSA+yvposhNfoKmrU8RhQqyLi4ObrN2cC
 ODLDKNuYHfgByrdQzpe967UxQcc5SeLu/pKg04iAydYJBNrXc/aJnrB
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: wKXmzKNRi-iBMcs0QbSlteyAGG7-7qln
X-Proofpoint-ORIG-GUID: wKXmzKNRi-iBMcs0QbSlteyAGG7-7qln
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67ebcc4c cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=758 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010071

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

PCIe host controller drivers are supposed to properly remove the
endpoint drivers and release the resources during host shutdown/reboot
to avoid issues like smmu errors, NOC errors, etc.

So, stop and remove the root bus and its associated devices and release
its resources during system shutdown to ensure a clean shutdown/reboot.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e4d3366ead1f9198693e6f9da4ae1dc40a3a0519..926811a0e63eb3663c1f41dc598659993546d832 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1754,6 +1754,16 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void qcom_pcie_shutdown(struct platform_device *pdev)
+{
+	struct qcom_pcie *pcie = platform_get_drvdata(pdev);
+
+	dw_pcie_host_deinit(&pcie->pci->pp);
+	phy_exit(pcie->phy);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie = dev_get_drvdata(dev);
@@ -1890,5 +1900,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

---
base-commit: b3ee1e4609512dfff642a96b34d7e5dfcdc92d05
change-id: 20250321-shutdown-9237fad7374c

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


