Return-Path: <linux-arm-msm+bounces-89480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91749D389D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF9CB310DA93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01E432B981;
	Fri, 16 Jan 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVsbH5jZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfdTpncJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63D2FDC4D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=hOsrWQ2tzxs2D5LYTiT1B+hnMoDV0HMes23LO4Jn203v0CFdWwFuerVLUb8rdVv37phTWeorC6dZvD9QTR5i+rEv65VtoNBxSl4uRZzrzIjYB30WVD3rduA5J9jHGLQn4ioMusOStruewcYebU7K2o51EI+DdjBMcfS/zKdtgps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=oJZEE75ljDhbxjPAjmqXX/qekCyAnUUIY+vndlyCRTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WJ+PY2N8Y/F7QUa9gAme8EmkgqNRSFHTn1azHwKQpjG81Olj1O+v4HTFvpcZoiGqKnfNDvv5vANQ+ZxBMfpVBWsBYRKq+JSvUX3W4SNRB/GrZ8XpDH0pKDL9KOKcDxvsxaGUH+YVkycMxWzl03WGxm9NC6yQYFzKpsrYVOZcuDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVsbH5jZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfdTpncJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNEMCq167573
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YodHWG0Qjmm
	xJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=; b=gVsbH5jZTWKKD3qlhepO7EBZXDW
	qz7MdvwC6PVR8TU0rWp9UXaTIQIYUURXbZQ9/KP/jYSTx21KL04EzIPRwx9m1hUq
	PjFE/6YF+XklsQJ1+b7DjcKSNXBpUHhyzBvQSxsYOz6CjJG4TQyHIjGwMaTKMYsn
	tAiaqzzgQL5ZMYXXAaa3cb8cbT0uCKzPbPqtctpBbRXzpKb/opflF4M68UqOWOP1
	PQYLKYLqrHcaLjp+6bM4SQns0HNWpetAhzgru0QjhtmsjK+AokW+i1ab40kf8J0z
	GrFZua5Tw/HyaKGIS1r/fhD+Ktu+aLmBqfVI1tGAMSDnATjeNYUFFKPHH2w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqved0b63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-122008d48e5so4736725c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605675; x=1769210475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YodHWG0QjmmxJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=;
        b=JfdTpncJ/UDALHZLWF/JGuLIQy9rNR2d0Hy230JSAARNiUqkRFZBgjSy7q5PJ+3t8I
         /CIwdj3u7vbls0dMuLuRtWuIpKmNlr7MpRREfjmcR6OU5FUaLy28aEAiKiYFEStmMrnC
         tODceKXYCUfh2vKoPpNDt8giHkpIUM0gkvzJPwdYRZvQ07jHkpTYpRCI+YcS1NQiCr8U
         gwWTivVUOre8Muq3nvqSmqacHhGSt7IdLuHxxbZc5EcFmVY/6k5M8+8DmzirGM+DA6gP
         i/ZSJFOf26RB/fkrJMd/+pARXb2Y0EsUvJQJrxQmhifp8WCbF3Ojs6p/sh2b+/c0fSh3
         OY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605675; x=1769210475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YodHWG0QjmmxJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=;
        b=aul1kvhGQJyeL1jqUTpq+Wh7yvBx8Lmaw2ZL/MLDoJr9+qH0xjRJT98vGYyqJLXsKe
         q5VNozHigj3akFlXKjWzlC15L0WWUkW7isUNug92NGNXXfnvEpaoe0P5w6JPxb4ujq4D
         BnuzoFDLN8knYAj/3kPaDCO5bbF/eWvBanrptJluLq/6uxNQRKvOxjuVyBNkU/jN2yv8
         n324WjSXDFusJfQ8YOU/xl5v+AuNchgRJ2sq4IwPR9z2lJtyk0CUYcbOUMVv2ruSjF+8
         tB3sOkn892NTjZAxBcl4TeN1mRcEXQKKhhWZ+idg4iB9oGupCJh8oCc1WZ68L615ZWp/
         dRGA==
X-Gm-Message-State: AOJu0Yyjb/Poxp/NbuDt4cbGJL/xNawmadKFhusIPcSp6JDGlaTgFcSz
	s0uDsSA5bSwTuB2fdkwLxPnPPqtnXygZfnhjSgXVj2VwbECQe9fOaGqbi5rBUybaeQfx3GouAH6
	nSAHF6LM/EGPbwz0Lf0wcPRRHouyuSumwST/b6HsUA5GKIds7/DYCLyly9RERITM7Kv6K
X-Gm-Gg: AY/fxX7muWQVzQXs43i6qdawxaXNK+3tpe2cv44HhPQUX4NDyIOy7VwPPO8k50N2hTf
	sJLELuhb86z5I8QRqYxwRCnUii7w2RYKrgQg36NAV58TPWTpiLziIBN2LAus6t5O7kXsRJBKv61
	aon8w+CzJjB0vbOrXCHSvwnh+eMtEkJzQ4hP/mE74V26PHXq41tnfUL7Z7tKzedBiscUWd/R6Pl
	+8I1AQ4YW49GdIMM2RKS03s8IplRREy/0Guq0XVYHh7o6y4W7xkqtF4qVBFzX1nJ4S1/URr0r/r
	jq0I2UqeW+pCQYwNa5LCLwjAJbR37X7tO9pIXbhIjCvWVLND9Uw+WvbptvYzDb40KIUeb+J68+M
	EuzeDE6UIAvxauI+g6a15+ou+9O4T34SrzTDwVCWXtf3+XXLrYdgnmnJS33olR28=
X-Received: by 2002:a05:7022:128e:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-1244a72e9fcmr3479670c88.15.1768605675169;
        Fri, 16 Jan 2026 15:21:15 -0800 (PST)
X-Received: by 2002:a05:7022:128e:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-1244a72e9fcmr3479651c88.15.1768605674645;
        Fri, 16 Jan 2026 15:21:14 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:14 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable EUD debug functionality
Date: Fri, 16 Jan 2026 15:21:06 -0800
Message-Id: <20260116232106.2234978-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u48MgaXsh1oKXHD6hjNOvMit5otambCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfXwoAGutGv2Eqf
 u9VWXgPo7YSlchHAB9XXBd1Vbuj9Jnymwdbdi4vVqa9jsGsJDpIWhA64l3ip72PRZ71iB/AUcNF
 HhuYulByzDJEMwaacG0Y/2Y1h6t98Jc4ugVNvkpXOhKKUZ12U8yS+7gYdwD336aNX1vfqWlAOLm
 aBxEIaitNbUi/tF19jsYGZin1fe2HdZyUdc7xuwlUlLR5+hOinf93J1k4KQAFyoTjSZCs6T2C+t
 762qDbLKcK7cm8+b+wIv/ZIYmPWXH01fjvwI0VJLz/Q3h+3xBR6op28mPFhFRVzhRa3ZOlubV62
 jl52mY7E3U+RmKkZwJ9TnB1VRakP+wwGKVgkjEJf5TqFs2GHVGdIuAjVw7CR+85n3H8uQPOGrXP
 DjUXNEaEJkPyLWs76BP906WBrG+mmlG/ouby+jwg/8jIuW+PRFqL7teolf6DXyXMjXreH8PPSAn
 XqtkyvxNtl3zofFEUgg==
X-Proofpoint-ORIG-GUID: u48MgaXsh1oKXHD6hjNOvMit5otambCF
X-Authority-Analysis: v=2.4 cv=aMv9aL9m c=1 sm=1 tr=0 ts=696ac7eb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bAolQom50hykzV7YMrMA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601160175

On this board, EUD resides on the primary High-Speed USB data path between
the connector and the DWC3 controller. Update the device tree connections
to correctly map the connector and controller endpoints, and describe
role-switch capability on the EUD primary path.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288..2fc2d0aed8dd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -194,7 +194,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con0>;
 					};
 				};
 
@@ -1176,13 +1176,29 @@ &usb_1 {
 };
 
 &usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
+	remote-endpoint = <&eud_usb0>;
 };
 
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con0 {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&eud_usb0 {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&eud {
+	status = "okay";
+};
+
+&eud0 {
+	usb-role-switch;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
-- 
2.34.1


