Return-Path: <linux-arm-msm+bounces-81002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD91CC466BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCD94188723E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF6A30E83F;
	Mon, 10 Nov 2025 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N/y4xHS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94230E823;
	Mon, 10 Nov 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775912; cv=none; b=u3AnQ4d323rNWN+B29JEZnrGf3fzViFGwXeg4+xepGX3LzpGEJY21oCvhFNkOhvdpMxzzqIZYOyYbu27tW4dVcfStOjGqnZwRsKEphd40c/uMl0f4VLqVCQlQar7KGTmN5ztaEnMFVbt75BkKaaZ4SV4xLfOdlrta3P2q60yMCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775912; c=relaxed/simple;
	bh=msi8UD2zCF+tcWQ1JWKBKEbElowMRY1ceqjTyUzskx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tHRUn6aSWzBiIuzzkI3kV0AAEDsfpoO9ubHdCiNBCIAQ5NkzCsT4uLu3MBLZFeVZ6p4Bdvuy8REOqow0zZFq5+du0znTXD/b+MqzYhn/kpsUyUU+PPC7XBDgbBC4G8nCZd9RXlrJzbq/m2kcWXptw/Wp8p6CJW66/KUYOlFLp+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N/y4xHS3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8pFDI1797802;
	Mon, 10 Nov 2025 11:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LVBKFtu946R
	BF2wTKkMtHK6iDj/rZuhXvfuYMUOh07E=; b=N/y4xHS34mFbuSyAdkWotLzRS+k
	Meex07oQsB7ZdEaURbx1jXHZDdtPFQy7gYe9mns6GyPaYNq1afzwWr/BJQz543oB
	fwSomJp4/trXm7OJ/fuSdcSWbF2P1HytV2veYiz3zkYwNzJ+LrhayYNRDteq40uT
	kIsmMQxSu8ricw31xVkGEmRIiKNHz48AgC4DVo4K2HyCzqRzhWcLRjGaEkkq89fL
	S1Ua6BZA6FqY+AjIyreUGK4xjWitVXL+rZDtjasZCo/EDNDK7DNy6aqHFq3XRDAF
	BDYSr3df46ROnuUS9sUbG6XEHe4gDL6wznT6j2p8pxu3DSgfU0XS3+o0O8Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0jfeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AABwMEb023662;
	Mon, 10 Nov 2025 11:58:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkqej3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AABwMwQ023657;
	Mon, 10 Nov 2025 11:58:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amitsi-hyd.qualcomm.com [10.213.97.115])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AABwMWP023655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:22 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4648853)
	id E757B5A8; Mon, 10 Nov 2025 17:28:21 +0530 (+0530)
From: Amit Singh <quic_amitsi@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, lumag@kernel.org, neil.armstrong@linaro.org,
        quic_wcheng@quicinc.com
Cc: Amit Singh <quic_amitsi@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add vdda-aux supply for USB QMP PHY
Date: Mon, 10 Nov 2025 17:28:06 +0530
Message-Id: <20251110115806.2379442-4-quic_amitsi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
References: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zFLGZVAhL6kn7BD1Ik9DKap63qkFPwLs
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=6911d361 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=zqwJLAdVuhH6XCcEYnAA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: zFLGZVAhL6kn7BD1Ik9DKap63qkFPwLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwNCBTYWx0ZWRfXyFw76nkcwG4N
 km5Au/VI85JEHjGwk6u+99X9/Lf3e0GO8a8SMgjfna6vF0Mj5Utg0/6IJaHPG5t4wXrOfJOGSHT
 V6V3/usVPonpOSRQ+C0YL2xdKm1cG6aTmgOtR/mn1qV3fa2w5NE8PfOj0gabfzrgk+w2hGE3Y4z
 pVuZYyYAGA1shh28ENunyliCoe+fOUB4fvQgit471KtW7FSc347PlZn6QqXk+sn1oVuiI8cam1I
 EZLScf6H2i9244vKLWkYfDeqCJvFmbEFXo2RDk8YOtxvkj2afTN58dgKund78p2NfNw/kaKl36x
 hJnxxedFwpsqV8n2dKXhJSE6XT8/s3B4sXyjmgn+RrRHGoNTKJdijlT6JH60fwpNBB/wRcYHcp6
 xguDRVnYeEusm/T6nRaM2lXMiPTemw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100104

Add the missing vdda-aux-supply to the USB QMP PHY node on the
RB3 Gen2 (QCS6490) platform. The auxiliary 3.0 V rail is required for
stable PHY operation and proper power configuration.

Providing this supply avoids fallback to dummy regulators and helps
ensure reliable USB enumeration.

Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index c146161e4bb4..441b5d9d377c 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1367,6 +1367,7 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
+	vdda-aux-supply = <&vreg_l7c_3p0>;
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p912>;
 
-- 
2.34.1


