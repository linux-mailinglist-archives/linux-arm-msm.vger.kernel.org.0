Return-Path: <linux-arm-msm+bounces-44931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4127BA0C40C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4286169811
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70421F9EAA;
	Mon, 13 Jan 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GPoL2l+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC21CB501;
	Mon, 13 Jan 2025 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804818; cv=none; b=imCMYxXtEFIDxf0EZSZmL9jLavJg74JlfopKtl+vMogweM+cDZF9ze4+fbkUL8ACeaZfFB8oZMcJEUmlM62xS3kYzPEommZeFQF7ze8MaAINe/qVhEA1nAT38lIO8snrQbiJIf9RJUF2m2uPA+ZLUz6SHGwaiZRR5oAESR996Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804818; c=relaxed/simple;
	bh=GO9z6Q9uXJTA4q8uOoK1TctyCximAITW9vb/dxU+YzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UCVASX2O25iSgVHsIybKlPNxHmXJW3fohkaEt1hd57+OplziEtwwKbt3O9aqYsoqtMPTXF80XIrbCnEpX20UpyRM7bNY4I3eOBw1Cgqs9FEOKBYBLFzDwtYccy7XowLiOVM9KxyLaMF3ox0Lxf8DsLM2hWbl9McCtjFS9G+RJ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GPoL2l+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DJLZhS002893;
	Mon, 13 Jan 2025 21:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODiJRA5IWGmmjSr6rULHONxs+LWOR+3Y1AfgCqi5NVo=; b=GPoL2l+rGhJpHtGU
	tP4pcbODuKlWpmGIvgM+u4JaSimz60nPxuZ4R84OJH99WjYYNGJiyXBzgtMhOTNA
	VmG4EufvLcd6Juvn111Bx73JM8U6dC1sV4hXZ16ce/LekrKGg7tt1jEIGLteOHp0
	08Mb72pRvzmLWQQTcvZkY6TV7vhjpuGwk8Ux3zFTbdNpRSUTHAYaIHs7qbyHJb+Q
	cuU+hDrB1rSvQrd1GnV6FTBf+3v/Vhj4tW8WEWftScsLLgT29BvqPcU5zUy+iK6s
	2tuMDL1aRfrRifdbMi4hn3E1xXVkJ+u6fxyqgS1fKzXJJpqMKB1eZC0y9OloEKrl
	cVfDKQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458ww88sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:46:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLkYUi032053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:46:34 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:46:33 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:46:26 -0800
Subject: [PATCH 3/5] dt-bindings: ufs: qcom: Document the SM8750 UFS
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_ufs_master-v1-3-b3774120eb8c@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
In-Reply-To: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>,
        "Nitin Rawat" <quic_nitirawa@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736804792; l=1063;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=pJqht7YeGW4HBtobRM2FT94FZ9Hi4tZx1p03lWKf8jg=;
 b=ZLP4/etcBuG51t/bWuthnpeU7ufU4tYQJfZVrMUyxns5u7sg+A5mCRiVbvck1YGmlzbXm108+
 iAjT2epLfkZCGTTf3sodx8mziiwpuXN+hvhQQzNkq69uoIUbGbDBybF
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NoWH4yK-hNMfEJhcXE2MSorH32XkXsLU
X-Proofpoint-ORIG-GUID: NoWH4yK-hNMfEJhcXE2MSorH32XkXsLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=979 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130171

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Document the UFS Controller on the SM8750 Platform.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index cde334e3206b0aa07ff18db0765eb17e7466b1e5..4bf980f6cf2b1b10d909f27fb4ee7afa2a5be484 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,sm8450-ufshc
           - qcom,sm8550-ufshc
           - qcom,sm8650-ufshc
+          - qcom,sm8750-ufshc
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
@@ -157,6 +158,7 @@ allOf:
               - qcom,sm8450-ufshc
               - qcom,sm8550-ufshc
               - qcom,sm8650-ufshc
+              - qcom,sm8750-ufshc
     then:
       properties:
         clocks:

-- 
2.46.1


