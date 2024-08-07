Return-Path: <linux-arm-msm+bounces-28115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75894AFD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 20:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89538B24811
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 18:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F450143C7D;
	Wed,  7 Aug 2024 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MqEkvJdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C893143722;
	Wed,  7 Aug 2024 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055565; cv=none; b=F8S6lK2rCpJYkT7V5ShdfEPDUYJkeKxBlCReXP1rXgT12qvWe3EIcOhexyLYVhBPkF7+QyTDWguZSwAY37hzve8BtPj1q5STnSvmGQFUfATvNEE/bfhzFWIkA9zJLYPutm0U0xHeMmHmYNUfwG4Bw9GQ3wo6mr1ogXPtlJWoWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055565; c=relaxed/simple;
	bh=o8vr4FPjg2yCz5mQnPL8tIyVGaXmWaFCaD6na35ncoI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/5aMDnOT6iA0aQN/4WHWPY6f6B+xjWOQRrJ9KvAQTG0hWwv2o2jlrbr6uHnEzT/4bK9EoYszRVuTGaWK2MENik3X14NWc3fM5+6pkKhDbju0OVwjQQX3yz9oH0/fktPkAQxSKrsooxdypwkfEYwyU5TSn5MWeF7DEcG/Ir/hLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MqEkvJdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477IWadm013609;
	Wed, 7 Aug 2024 18:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7phJYgoucwcazOotJIupa8oFc7x0Fjf0n2mjjJDHgs=; b=MqEkvJdlukJ5oswj
	TK5HnZk0US8EzcCdSKyyeWR8wlqvRaVb8H+qTaN6V6hNFMRacIofOIt9d410je5Q
	e9GWhTLAKS0W0w/rv5r/fUU8NhbcfxcryV/VTKM8fzfvwaCXCprg4Ryyg5+jN9RI
	Mg74dkeFhqEPPEkZ/v9vKcbhkZhW+GJ485Zx8h6eYmMBhACJEj8HT/tBtZWn5Grj
	SW0Be6idn+E25pv8Z5zXg4x279dsZzFbj+bX1Yx2PBrBQw/7cqCBrQtINLhEu+MW
	1y84tDOzrsy8VspjR3Mg9ONJMayuV7Ap9Gi/K7dpB2rG+UAuBIiOLbyTziLjsMJ2
	gRPssg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sa8f3pky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 18:32:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477IWdsE010076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 18:32:39 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 Aug 2024 11:32:38 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v1 3/3] arm64: dts: qcom: sc7280: Update eud compatible string
Date: Wed, 7 Aug 2024 11:32:04 -0700
Message-ID: <20240807183205.803847-4-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807183205.803847-1-quic_molvera@quicinc.com>
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LKnvYZTA6gB8uoJmLWhwQnDQdUtcMtRq
X-Proofpoint-ORIG-GUID: LKnvYZTA6gB8uoJmLWhwQnDQdUtcMtRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=580
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070129

Update eud compatible string to reflect use of non-secure eud.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..f4b120043036 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4018,7 +4018,7 @@ system-cache-controller@9200000 {
 		};
 
 		eud: eud@88e0000 {
-			compatible = "qcom,sc7280-eud", "qcom,eud";
+			compatible = "qcom,eud";
 			reg = <0 0x88e0000 0 0x2000>,
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.45.2


