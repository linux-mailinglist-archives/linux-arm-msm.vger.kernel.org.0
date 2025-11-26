Return-Path: <linux-arm-msm+bounces-83393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B5C889A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951EA3ACAF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759D430E855;
	Wed, 26 Nov 2025 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3cTHsNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJ+PrVXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52A2E7198
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145048; cv=none; b=StKSPwpf1T/Y8Hdop+U4XiHs9kpDEkqKlhCaoKR7eP3rtu9r+CL5wDwWVJ+3galdcvTHQX0eg2fxDrSQMccClR2wwyf//WjIE+eZ38mzFIiAv1pMv87iFNrqPyLHXnX4etogLkq3c9ebCX7skVqz+r7xvAVe5zVFBj9LZubEs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145048; c=relaxed/simple;
	bh=26ewATnLhdKUDBijWBdOubXCn8dWfFQbYho+Ln2xqYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AaqeBrvr33OmUK9K2f1WKQrE3/VhJfK1mu9sSYZKNUZoNXiCKLK8r55yhPFzdNZGDZdYDxxEQb57TlzKmWP6smIptVZ9O2S3+iHfbFhv7d+1Z1dGFd3D2omylCmZeNUZ+72JJKAiuCTVFXyoFi0xWxhik6owOByGvoQPvTFwAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3cTHsNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJ+PrVXg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gH1F1234811
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qnD/1lKAxJmdDO+JtOoVFqrhZ2jHl2VA38L
	GsO7qpQY=; b=N3cTHsNV+yDowqoi08cRXlD6+419iQ/mOh6KxvVsUF1iviwfeNx
	MdvLz9b6s9ttJmqRGnTYvM+XJKHiw0MdMl0bpq7ea9m8cKxrEgwM6Iez2W/gtxcW
	UIpJYdSTKAso7t4cLbFvUvmq29czrURKlOnozQE6ZkEfJ9EyJPPpwKzULxLRw67+
	k6LUsrb5QH1QvahiZkbhmaQ9P34fjO1to/eSyOs9L6zzh1vaF0GHNy3toXEKzRfs
	yPV4/Mh2ULL739qoYcQYJp5pCbOMhhQzx9fdcKrbjlf87MYG5u9r8PyjuT+yO1ht
	xbaZTvvwRKCIQJ4lfn6VYsE/waZdoys5xDw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd4038v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:17:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b895b520a2so6154244b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764145045; x=1764749845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnD/1lKAxJmdDO+JtOoVFqrhZ2jHl2VA38LGsO7qpQY=;
        b=iJ+PrVXgtyPgN1oNjZuSYxjO6MFPWX3bvYZjROjw1CPD1wlwzuasC/vTvNLoMXCCjl
         +BXIJuqUIfM1j1V7mIFCEfeBc7dM+hJCEdxbdNxagol2JT1hed8WNGX5TnAq6ci/8MdS
         dRqyq3iH+XLVww2SpJdxcFVhV4toKAA9lDDOWaqcrkqC7cVzey/w67lAT2L2k+KESHeI
         xx21KMzr8sh87GkEdIyOTtq/wZyF3PiBG01WxQWW+wra+H/+vzqCA77JQMIeBL+LEJIg
         2LmGtcCQN7rgfB+QQoWqXOqsgh5mnXiVNH6SbI7j1p8YMoG/kimCYA3xSPbYYFP8GvcH
         m+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764145045; x=1764749845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnD/1lKAxJmdDO+JtOoVFqrhZ2jHl2VA38LGsO7qpQY=;
        b=RB9MDtM7QfFpLrOeNC85EevvyZPLwLV2Xj4ga7nPWKT1k3q/t/voS3qtsPkFqM8q5o
         7uWOZ1U7bjVgFX8Fik8cWkAcSpp/L5HsCB3ypHjRIWDGsA2iNlxjGe/qSy6AonHTHXEf
         aTCun10a6039TD//WvKJJim+VQu/VHoHMgEQdyfcaVLztiXYUVZ+RO2oG7eAbsWk54QO
         PKI+Cr63FSEzyEqNVp9fSHVMoqXxLrhc49vI2ZrSmtRnDF9fSuEj9hGShnhV+FSBM6KZ
         8JwQL+CVM2EgPSKkT4LnH3EGkTW6BNNJyZULwWSKF9gfFGT/C0BAgTCLlGHIr8KBWLgu
         9vPA==
X-Forwarded-Encrypted: i=1; AJvYcCVYb8L8LY8K4vvX7+slNJY3/KNOOzjF+u1Kc2kYi2ydYDZRGdDzSGQy8C2FwpW0W90yaYX4eb1tsLN8ks4t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwx4xYjjYXsdWJycN8yMnpuD/TUZnVpOTFk9hdcEjPySNU0f2m
	9nc2VfKUeyYOU3kFiSZE1rq7un51GO18Y/MznV3aui+FizgwRIJgvnv+dMPQJuXe3gTGx2JzebC
	m+8mGjcs6qvbG9dkK2j6GfL68hHAZpYt5EWiw9xCqSIMRPRlu3K3kvXCp/jxBQSO+w+vy
X-Gm-Gg: ASbGncsg7h2BUcjhyzEBlj1BY+JFHEcoIKwfzQMB2zXcdgjs4qKvkupso3piwhCBHG8
	M9e6dS5Hp7IGsrFG1iUjVNoGnUuyMIqcUlyKDiZ+dvQRR/acrTNwFDpw9g0L6bLlriBGEof8OXi
	c6lCHNkfuOCcjrMCsJ0O6FPouN+4wY71LDum4ifALm0iOsDSrdB5kc/aYPcGh/CjKOe4d7uRamw
	KdfZzr+9ugsB0fmVBpD7Pksd7+PbmYoPBD8HJQWrlrFTK/Ai5NDL5nMHvJPIlE68rIH6Tbnyk/9
	m8isSw7a1coS2VzHiB+h8s588LXFDfs6aZKKT7ytOBao+wCqlybTX+L9WmP4y8KCo1lHOTLu11s
	e
X-Received: by 2002:a05:6a00:2d14:b0:772:4319:e7df with SMTP id d2e1a72fcca58-7ca89d594b4mr6020013b3a.30.1764145045400;
        Wed, 26 Nov 2025 00:17:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMnX3uutEhAxNfnRGDkCn54FdPUAUGPEjT1Hkxxud4okq3aFyy7ph/bAVkyK9nXbZ97Mmrgg==
X-Received: by 2002:a05:6a00:2d14:b0:772:4319:e7df with SMTP id d2e1a72fcca58-7ca89d594b4mr6019976b3a.30.1764145044851;
        Wed, 26 Nov 2025 00:17:24 -0800 (PST)
Received: from work.. ([2401:4900:88e8:55c:d927:2b8f:9059:4f8f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c668138e7dsm14204371b3a.68.2025.11.26.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:17:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com
Cc: robh@kernel.org, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] PCI: qcom: Clear ASPM L0s CAP for MSM8996 SoC
Date: Wed, 26 Nov 2025 13:47:18 +0530
Message-ID: <20251126081718.8239-1-mani@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KBGqxtECbEmNODsaBHL81WtCIon4M-mS
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926b796 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=iDgDmxrxDGO2Rnn2FVcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: KBGqxtECbEmNODsaBHL81WtCIon4M-mS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2NiBTYWx0ZWRfXybIm9f0O88oA
 q56o/96tcPcQyXRI2GMHlTmeoHOGydgb0gUO1w9UAH1Y3G8GH5/Ctqb3r/8WrqXvxuVHIldBza5
 2t4NlX2Yc/76ZCVpKhFRkZkc7pXrS3X82BT10jI1dNH885icEVaMr/1ugrmEe7bfjFlPHrIQQVS
 pn/OB8Ijfu+MT32pHP2JTrHwI5xcaAQlzRA9+wA8XYJMJkyvCGgFO6rO+Y6VjmeFnkvz2d0w++x
 QPXopbrO4q1B9joL/mHG9umwyRG2IJFnxjvRTwIPCsUlsbNM9iJ5dQ7B+uqGfn5SGp9fcjV+o6j
 2WoUTpQq7DELU2TTnfZA2d9pzKVGQ41JUMU49W1cylJXlZwL2UnkS2MwAhrN2v34LqNzbNBgmJz
 jauI/EsRcwiw3+G+XroSHnP91GTDKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260066

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Though I couldn't confirm the ASPM L0s support with the Qcom hardware team,
bug report from Dmitry suggests that L0s is broken on this legacy SoC.
Hence, clear the L0s CAP for the Root Ports in this SoC.

Since qcom_pcie_clear_aspm_l0s() is now used by more than one SoC config,
call it from qcom_pcie_host_init() instead.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-pci/4cp5pzmlkkht2ni7us6p3edidnk25l45xrp6w3fxguqcvhq2id@wjqqrdpkypkf
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 805edbbfe7eb..25399d47fc40 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1088,7 +1088,6 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
-	qcom_pcie_clear_aspm_l0s(pcie->pci);
 	qcom_pcie_clear_hpc(pcie->pci);
 
 	return 0;
@@ -1350,6 +1349,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 			goto err_disable_phy;
 	}
 
+	qcom_pcie_clear_aspm_l0s(pcie->pci);
+
 	qcom_ep_reset_deassert(pcie);
 
 	if (pcie->cfg->ops->config_sid) {
@@ -1486,6 +1487,7 @@ static const struct qcom_pcie_cfg cfg_2_1_0 = {
 
 static const struct qcom_pcie_cfg cfg_2_3_2 = {
 	.ops = &ops_2_3_2,
+	.no_l0s = true,
 };
 
 static const struct qcom_pcie_cfg cfg_2_3_3 = {
-- 
2.48.1


