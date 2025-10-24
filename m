Return-Path: <linux-arm-msm+bounces-78746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED6C06E84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 17:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B081C07BAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 15:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C361D32144F;
	Fri, 24 Oct 2025 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFZFzzRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30661328B6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761318947; cv=none; b=RPQ8ngasJ9mfiE32oYFZzFOq1v1P/Eqneo0h5I8HuXeovP6JQ/cP9dNyLjin8iuQxnWAeV4Z0m0Ev/+DbrHjD9tJTXN7kq+fGDB5A/8shytRk2ZiBy21cNMYrdkS8H7H000U1MPUztObYuz+kAbRlYXaCNNdOxWMsPlbbxR2t08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761318947; c=relaxed/simple;
	bh=2JxH3SAb5I5RjNeUkzq/LydH+ScowPF8cKoijPFvtTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=teEkpEa7MujTWwEfTHu+rjhRAsdDIBchbq0f6wjmRA1bDH4u4w3CfhXmfVfuy30xSSdEw2cPq8ZR7ZQEbkldS6gftbe3mtci3M7AbYqjm6Gih6c+NMhSp5tVSCg+fo0MVOeOmYvsgm/H2b3aZIEl1R12eo+t8XQ9x3O5BSAVCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFZFzzRV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCPJNM003409
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IuNGrA3HI88
	okECNz5zskMA9+Az9f8glbFMv0KeN/Q8=; b=TFZFzzRVtHTfM9bU9OSmRYGziff
	7bTFra1Th+L93t0E1+xQTj1dnouGRLZZks4wmKBjlLSOqwI17xkJBaLw8fhnblCa
	yOdnEa5jEkyWOr1xOQGJcSkXtqMqr0aPAhtt1rVECKCE4LxLyFpuKHZLjo6x61NM
	Ai/92X3tYK8YKSgeI9LuVEHkIE+8/SRsFGKRLLxamPuHc6PKekreIXHkuZobWfGX
	eXHuh4lFcmanJqsr9JnszFpUaACiFLnyXcl7iuFGwYITxFNw/CbMAOBWzb5JI05W
	q1N783/yeJ4p3GmDPvzSJlUn7134T9+J74RuES1/OVfNQBpIMOfcMhkbUSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jcavy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290992f9693so27353885ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761318944; x=1761923744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuNGrA3HI88okECNz5zskMA9+Az9f8glbFMv0KeN/Q8=;
        b=GnRpH4rwByJ/xwJ/JpDDJm/ZF9hzl6FEBQsOI2k9gONJ7FZ0MO7giVdBdxRzuKLDlS
         anaD2PbLzYZjgVbZLJtdOJL/6OWSbTkwCI0eNC+Srl4GSMg/nGhkUll4AFW8fx8liyGH
         tuk1z38x8iAiitC1r9+FJc1sCTC2hFEkxjg2nz36jvpTMQTo5N0Jfz8UIpUSDROsjGvn
         MnAEyFHHVG3BCDX7byAtM4eG9Kqnr3WW2iKhwbuKOy1PDAVT++3z3Ia/ljbEeKUCe9uo
         0lCCrE4I6+ftuj2oaIacmIAw5eLoWTB+z2Bbf8ufR4hNJQdnZina905AmiHYcjD5xvW2
         8zPQ==
X-Gm-Message-State: AOJu0YxYK5Eo5f40xZTZ0WyhwUe4ucUv1tV4/JrdUGN1N5PxAKwiKp9u
	/E0bWEPJW8G+8f4HjLzANFC7rs26IQSPgprniUyPY8ZZ2buTyCVUsn12XHtPOXqJMPaQ/EOWit9
	wA8WbVOHn782uReHLLDdoqQimZS/im+QaAXqn4ooA1cjRHrlL4L/2dS1sNdAhPWqDhwh/
X-Gm-Gg: ASbGncsbnGOmNvKeLEbqBZQpKRJ4U9N9Q4Qtp1XVbkU6o0rjRkO31bQPeqgtYF0PPLg
	ISoSq2dMPxAfcK1c/7FsxH5A/lvP0+E1YOOf/cjcjr+1ytLT+8aP1B4yvpRZu2ScxxpAO+eSarg
	jD9ml7vRyB0iJxbM+iMrkxzhsJ2A6k+RVRKZtsmtVrUA14TMIPQPRS1D295qOPsjP0HiRTW08lW
	2ZxGVi8hKJrZLp+Tmr9u9hfw1IMNMFedeP2rlW++W6PsaCndNsXQ3k602lE/F8ygz8pOFIvSY98
	oHJYAvb19K+ACqT0r3qoZxJIhZ9q3ILgpPck+tftt+cRGYkIDsDAhuUq29Ahfeb72VcE0+oZed0
	cR97aLivwqj5dURQ0k5zwo8wL48djwdjFCu53
X-Received: by 2002:a17:902:dacf:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-29489e6c09amr39043545ad.29.1761318943682;
        Fri, 24 Oct 2025 08:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS2HlK5lfQnZw/weCGadNiGz6AZhTCUJ88fvYxAvoGDeVcOR3lzXeFAjSFc96bPrGPUiJYxA==
X-Received: by 2002:a17:902:dacf:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-29489e6c09amr39043055ad.29.1761318943099;
        Fri, 24 Oct 2025 08:15:43 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddddc34sm58758885ad.20.2025.10.24.08.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:15:42 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v9 3/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
Date: Fri, 24 Oct 2025 20:45:21 +0530
Message-Id: <20251024151521.2365845-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8phYpR+adBMD
 vWB5qJdempDB8oetNwgp1jk4MHer/4K9FKXKU38KY16lqfhObI2t2s34AJVlC3Y05DYZTizwtrE
 m6bZRl1qvXlUO5fc/IH9kw6MnEd7XYXkZmco31xsF7bgyIK/FPHwBSeaxrU4ehJ/MXLznYsviU6
 neo79tZGHJonSpHWF6qB/MhgjHeFRjd2UvkFMNYp2XZ4URciplleaNTF0BJgZlwPEhnUdO4o1Lp
 fuTIMipXRPMgSDc40lTzqlzCg+ji3EYCX4yY8mZS/16gDNpkeDK73mHxpuZa/pncneSj5tqY8F7
 ZYo2OXkccQQP2ByVtejAgGTbZSzTd6lEORDnPVjFnyQIOLPgch3oh3ClLpdidxyaXKI90XPDGZq
 jHSn+GZ8p4nFhTZx806qAWt3PEudWg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb9821 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EoOMd-xwxZjzz6zYUw0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JdlQ4nQ1-5gCWwRqCUteAiVFwYl4KGjw
X-Proofpoint-ORIG-GUID: JdlQ4nQ1-5gCWwRqCUteAiVFwYl4KGjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[Krishna: Flattened usb node QRD DTS]
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..fc5d12bb41a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1054,3 +1054,25 @@ &ufs_mem_hc {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};
-- 
2.34.1


