Return-Path: <linux-arm-msm+bounces-79976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FADC27747
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 05:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F0FF4E81BB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 04:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D003426F2A1;
	Sat,  1 Nov 2025 04:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuXMLO4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHUvsahj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645726F2B7
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761969611; cv=none; b=dz9OmLFWAzzz96HFlQV9cK38piR6vkLiNgIZWq0nmsMU160pwR9l1uAlrWFvklKSgiSOwsSwUwDrjrBojnn7dcaUt5rki4vOHvsuMAM+Dg67NCDE2AdMlfsYzmgHe4fmitMl1YYGPlDn3eUPo55TVx5xQZwrDhL2DxGOtZOjE8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761969611; c=relaxed/simple;
	bh=/rHGDiZUdOdrl9DYepaOQeGv1VtjtTYXi/+ZkT8cb+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFxfID4Cijj1FRXX1rfxgMjGTj5HUaY8ijePxc4Y7i1RqEgS+fB6+bssFpoxGbFT31x9w+W6h+9FLZBHCPmckIhrLppOu8wElwEq+WU2bIPdxQLa4A9whV5xB+pq/qJqLSmnFVSQ1yxxvaBapwau+vPN//2ESHGrl0+iqpCUzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuXMLO4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHUvsahj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A10JZF5214489
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 04:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUun8ttkoQTOkHeDhGd/NSYDbZVcwe4JABD7MBbYCrY=; b=TuXMLO4Mwi+OQcmI
	M6GtmmtWO7xl/RyIJhOXNW5/k8NraVBPmAbcFzs1LpGUCW6X/XAqFgOmP/D82J29
	2MNGsBLpyhR7k4KBQQuSVMApYqYz4xOJYsxh+t0GOc7/u+Q5nm+mO/aC8DsYlgLW
	7K/6ijmu65Ht/Sx00jW8VbIxsvuSLVsHy5p3oz6t9+a+Qww0dphE0m1xLj57fqYa
	L13h/AotM1493JshZcymzKXUquvAq4hl8FyOwj9O4FZgT4qeBTE1lnBakS1zUota
	V9E7sy6ClkN0Is4+vKzI4/mFBRX+sw/ACafGj//B9E5iCqG/CwFn/N5i5Q27QbRF
	ojEYFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn08jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 04:00:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294ecd3fdd4so31116255ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 21:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761969608; x=1762574408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUun8ttkoQTOkHeDhGd/NSYDbZVcwe4JABD7MBbYCrY=;
        b=ZHUvsahjt/knFgGJui7oDPL+E6OmvfRgp1VLICdckZAatL0KWnyq4osHYCLP2/rjsP
         J6pGGXd3g6o4UAjrzE8OhNpdmeX+ILXp4VaYscMgirJSxuDUqFtNEIku7ASPsT+FM4KD
         IWrBtiVNOUUE4T8nYvdpDB7+giqNzT9Xy3HODxbX0044LhKZ8ZH4xOeW2H5j9yfbClip
         zv0te9DMVy8J3siv0fxy2elEF0DRd7j9mVn5kGYNuwFOCF4IdKiOhF+QEefd0PsNT9wh
         Uk5S2/zEMWkbHsjaUlDFHttWK11Wm3j7auuSx+hW4gbgX8d9NbZUrxJrMPzY3XRVoY0x
         xU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761969608; x=1762574408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUun8ttkoQTOkHeDhGd/NSYDbZVcwe4JABD7MBbYCrY=;
        b=FDrzlmlP4sLHSy3uECJbclWV9EJhFj0LXkkWMr0BenY6xhlQH0vazJS8wz3g0o5Kq0
         HAXAfLpNSGJkE2thKwn/+n15tTNFAP3rZO4tpsj7Lzqndx+Xh9CbgobIatdG2SdQWrUE
         U32X66l2AwPLH/knrM8nQfMhTQ1cTwurkNz8ZNev3P4SLzkN00+P9uuH5grdvnLh5FcA
         Am9aiyFJUKHKPGu+mE9ZD4u7OtKIq7iEyGB5wjoHPzu3CGV7bNKOJOR1Vvs739QU60RX
         ZtYX2hEn4DqP5o8N9KGi5N5rmLTx5kdpHYqOp/5HdsUURAu9IdZcyfXi0XOM2B6IVXAA
         ujJA==
X-Forwarded-Encrypted: i=1; AJvYcCVmoXtMSdA8ov2Zw/ShOMai2V2MIeEDRxvG3xorBOFV5IKDWbKah3j6THx1eZSnMA1/aImxbw4yBQzunAyg@vger.kernel.org
X-Gm-Message-State: AOJu0YzxiEdSAxz299mlifmVPrItzCGwYK3Cu51hFbMkyiCVHp/6kvgL
	mfwnLvMr0rQgpwtuFZCrjdm64CkavrMxBNLSWX7GQhjgfPOh3vrDskQp7lY47qwzHsPiyaUqj2i
	HgRPgUHiehYA8f8B/w4kIdVdinxRonctrz2aRmEzk7khuLsyVCl5A3DY9YkLpRJ8ABwcD
X-Gm-Gg: ASbGnctzpkGFbGXwsBlp+hJ4PTYbGXBbalPk26Rv0eYFrAlw/geobgMfMA9na8NSP/b
	T0sNSTCXYuBt4pFpmMTQjp1x7ElKT4nDIsCdaC5TR2rHjevvKvKvMvlrQo9NnSXiqnmSzEotByT
	JKFKGLUcUz9eOyyqT5EaxHFV5S099VDl6nznmMUt+OY+w4x644mmcQbNM5GWIr4wea+6adQ/z8F
	aqlUb5CtoKU93bSjXIYBM9CqV103d4tqdYVYbYkBSKZsogSGT6w3evObZ+UPRSjrUTFq+fUI2As
	oSkLu7nDjHc8c4MVxbio/Tpd3ZsAnesLPs4WlHHV1YZWRMgsuuFXXRvPFVQz81yl1U/5FEYnP10
	LP/wgiHrCc7stsUoWD6MLSxFqbgO6L3C+CQ==
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id d9443c01a7336-2951a37a3d6mr76863635ad.16.1761969607644;
        Fri, 31 Oct 2025 21:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKAAec1m6KMSQ27zZIpV5w0wm864d/cFqrgqxQkc3z3RS2QIMzPOiuhWEcwaukQDzGofo9Eg==
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id d9443c01a7336-2951a37a3d6mr76863085ad.16.1761969607071;
        Fri, 31 Oct 2025 21:00:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm41490725ad.2.2025.10.31.21.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:00:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:29:36 +0530
Subject: [PATCH v9 5/7] PCI: qcom: Add support for assert_perst()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-tc9563-v9-5-de3429f7787a@oss.qualcomm.com>
References: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
In-Reply-To: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761969577; l=1479;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/rHGDiZUdOdrl9DYepaOQeGv1VtjtTYXi/+ZkT8cb+s=;
 b=Lnb0kzer2s2KLRgW1R4m1XdeYI6aM+xYc3kfH0jbPdg1zODFUgULpywmccRH/RJ5i4TyZrvs3
 TXDDygSCY9mCnIuEfsxGuYCrfV4Vk4yQ7h8Y6FivM/7Si6SgkyZQjwl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=690585c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j2XxTBISUlk66HYKGUMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: OhBdNxie3Nv0ItsO8wbxbfrxGMbB5nCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzMCBTYWx0ZWRfX0pDn6D4Mx0fh
 EXlwkxezx8sA1jfzMk9sC3gGQKcQNM3OpDLlJRWVV/facTeYETENMka6nj0wuBX2jYawx5W7Tco
 +xx++fS25gj7v0mbzK8pV+eNkZUHjNq8cKn0ssyHKqHxUh0qWyfWNamKJ6jYr3bEF405mMdg0Bk
 mYleBSN36Wxtt6drPbTtRyfKc3zRbtf0pT1JcCOBd8r8RuMD+89y4AidltSqnitewq+FKLTdAJ1
 TIJbfMVANj01YHpMrm+qKi2Cbi5c3TuMpnW37V9ABE5Ga9nOmRVPkHTBSdLOD5YUzkENHpCip/G
 H+k9BD/oRtBRTjHU4poUFNP3HqleH+ZfD+LWTnLKmKk9d8Z2eXf55cYDf8xMCMTf9SAbW4n0LEa
 /ZROqtdAxYmXua7RUYM86EIyRjtKww==
X-Proofpoint-ORIG-GUID: OhBdNxie3Nv0ItsO8wbxbfrxGMbB5nCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010030

Add support for assert_perst() for switches like TC9563, which require
configuration before the PCIe link is established. Such devices use
this function op to assert the PERST# before configuring the device
and once the configuration is done they de-assert the PERST#.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 805edbbfe7eba496bc99ca82051dee43d240f359..cdc605b44e19e17319c39933f22d0b7710c5e9ef 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -696,6 +696,18 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_assert_perst(struct dw_pcie *pci, bool assert)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	if (assert)
+		qcom_ep_reset_assert(pcie);
+	else
+		qcom_ep_reset_deassert(pcie);
+
+	return 0;
+}
+
 static void qcom_pcie_2_3_2_ltssm_enable(struct qcom_pcie *pcie)
 {
 	u32 val;
@@ -1516,6 +1528,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.assert_perst = qcom_pcie_assert_perst,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


