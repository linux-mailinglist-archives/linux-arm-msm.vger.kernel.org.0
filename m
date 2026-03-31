Return-Path: <linux-arm-msm+bounces-101032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBiLJtSly2mhJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:45:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCB36842F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64FCF30BBCF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A703AA1B4;
	Tue, 31 Mar 2026 10:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzN3zBXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpxfiKYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABEA3A873A
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953473; cv=none; b=Jvzoh4X7BCrl02RuTf2o6KDUJNHPlmZvG4CgxTK0MbkfKRfZLSjKK+khGBXXGCIm8Psa/CniNcOrInrkK56Hbdyz0bMmuiYag0Gwlqgv0zIcFG8CKxPllltvu5kXytsF8DeVgxV5bvxKnE0/92KMi902SJ+324oTNWwvfeWNAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953473; c=relaxed/simple;
	bh=raGwaoZcrN4kjJyDEnDCeSeMtBKidjZPyvjh/XLnbgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKqhlCC9g03rR0uAeRtVJdleQQXcWLLCi/DR4RtIa2dv6pIVlAbqspQmf7D917H20h4m5SlD3oWArHHWvZjUghDVTk0ZWpFmEGEzu/uwozvCmX6jIxiiDK2BRDFZxfiqFhIozJKQCeG20FBPcphPF8nv9uKHeh1HFtWrsmKFKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzN3zBXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpxfiKYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9181e2761505
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mO9asXWd+omDGcbdkY7dOre9nZcSuxB4BKr/K3o1ZoM=; b=IzN3zBXhqMRGoOdi
	ljjDp/1yZwnWMAsCO39sx5EYVgtPuhYwgTCHGPS2jbTpcR5Rud3Of+BDAXYSgLMl
	TdrK/11RKRdUs8EH+93+5gfNm5FcT8cK4ZBa30TcnGxBH/l5mD0cUlFAV69WqHCK
	VTnr/ErWa09wKEKsz4Z7N23IY1/NOycT3Yo059UDkiPjULAN8s24ydCW5nDGMXpx
	wnyle6wFXyTJSAoJlOANW/6Yp+FHyRQ+TbGtANnaAOZBl2LT5ShKJjfSDgUbmhpm
	Omyt47+jOGhbjJ5YCrjRCBKexhq0W5KhgGGk34g6jjOOLEQU2QWn3RM4GtPx4WDA
	Fyns0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930d8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:37:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso164705131cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953471; x=1775558271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mO9asXWd+omDGcbdkY7dOre9nZcSuxB4BKr/K3o1ZoM=;
        b=ZpxfiKYjjWvfSKD5R5buJwucGkO0uhz46apeCl3vjVvBLFFRIZ5QQzzjIfWy96vfVj
         Li2EY74igHU5YeqkoC7ZPVSFEyn7QM6m72PWWqAu0vf+xesA+UrjI3zuwhodgcpQuWRE
         M2TLHlEAUluIDHEFJn5GC7hVGsoYho0yFXKsD4e1w28jhyksnMPJo3QYaBdpMbfZ+/NM
         1qje+H0bhwOZMiobSMETwBRDnwgjY/ZK8tCWNsbyeIr98KJALD1/Fy1rl3weAPQ7657K
         M/yiQQn4hVqUFaGBW5Zlk23aVQdeIUVy+klKeSPF3n0nvRs1G4nDlmn786MbqJuiHMJY
         TxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953471; x=1775558271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mO9asXWd+omDGcbdkY7dOre9nZcSuxB4BKr/K3o1ZoM=;
        b=ZEWs2OlfqjgoA+35wDyzwhBd0R+KfnGEfWLrsFReVoVsiHyb3tpysGcY+ukLO9g4qV
         0eNVP0XRNJKUBGmjPI5gSiFGaSu+sKS1++Cz9KsR7P7rKf+/9RAtBlcNJ3cYm5z83F0O
         plqQNQgYYvvqH2xzdfb9w5JddOWpUqzF6KpHzNSnRgR/kt9wKoTyJIcbMztm8OpBQtOm
         H0Hh4TRAMmkG2Su/4QkKJUv8PQIZJL6TRA018L4hu6mTSaTPhy9ctNFtM3RTZ+NBU/Q6
         ocuHoQi5UJavmUwp9Z12iCqk+ARN8Eh9UbSwYwTfJrF78Zvgsd+79WHBgpkqX5nJu1dP
         fXIQ==
X-Gm-Message-State: AOJu0YxmSH6oQkPMe9ffMEGZm+nfTRFYbG9b27Xubt4Jxacqhg5Lxkyo
	qTfSv28QwRC6yTpo4LB8thJ36Z2khJThCzpxXenvEDbi1K8tAmesV6WzxjZqgUBVSOuNP6Dlzp4
	xssjUXeoTtVrN/V7NviOAA+cLfHrr34TYrG/InHsZrD1eFelWqR56gJcqQRpwZFs1RUwM
X-Gm-Gg: ATEYQzzj39E/xc9M2TAU8OBXLG7oJSHFxKy+DdBNhtOCAREtaORjEGzE0sYg1u6cQEk
	UALOiLidxhdxjmxOHMQftAXavQQP+B71uFlJSl4UxsK+ifV/cLBqhRgaj9I9nJ2+HHUfzNzp8Uw
	3Rh2nRJMzq4b/eP88BVIhXoUPvLB7VneU9VCWrU49Ee9UteVDyyrQbxr1ORyA2YWyku8qzumI4o
	/qe+40+x5nH6L8xK0Nk3uoBZ0s3uLqSQ7aysp6c0fF4ejQatY9dwKUwh0OxkQTML6kA8TmZfVFU
	kd54pxVl8sqLHKJAeBM6MDkBro17+v0vQs3Xp5XNphyvqnAl0GxNKa95r8H+Fhw/PTRMtREkPHc
	nMXLro+/Z42au3tUf49Y/dW2PRU2LsA==
X-Received: by 2002:a05:622a:120a:b0:509:1326:ff24 with SMTP id d75a77b69052e-50ba384b0f1mr193105241cf.17.1774953470656;
        Tue, 31 Mar 2026 03:37:50 -0700 (PDT)
X-Received: by 2002:a05:622a:120a:b0:509:1326:ff24 with SMTP id d75a77b69052e-50ba384b0f1mr193104851cf.17.1774953470092;
        Tue, 31 Mar 2026 03:37:50 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm34178175e9.15.2026.03.31.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:37:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:37:24 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-eliza-adsp-usb-v1-3-d8a251be20c3@oss.qualcomm.com>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=raGwaoZcrN4kjJyDEnDCeSeMtBKidjZPyvjh/XLnbgM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpy6P1R7kuo170merMYSitIBN725o728DHYTCIH
 zR6u7rYXdyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacuj9QAKCRAbX0TJAJUV
 Vt6zD/9CYaEN6GHSxgkAMqnsP+s7AGIq2VwuZ8W9RTGHynr5OJYd8/VZlMtlHtkHfRMR0scfHv0
 1e12LDp2R+Tg3zGtJw/O+kqm0QrOv23PYnEtacp6Hk4nfz2Fm6HjZfcwAwd1Urtl9QNcS65rflP
 onTyi02FTkjiQ3eQSgYxQb4HByXLXHHAzQ7crRgWQYSnpaPTjGzsrSjjvSk7wFmi7B6QXG9AH64
 RGzh1ajqqyoiSMJaTAPWWNWG2aHppJz2jC2+rPGvwVU9jSMxVffqS+YzmdTh2kUAVX5tdaogc2+
 Amb+XOtnt4fVeBuSiTiFFrf5zIpoXLLV4bguG5r0sWLhOIMz6OElxascrWddlJe+MmZzTYpclF+
 rkZrre3aTYTYH2iGd323YBIOtDG0fVf/Mdcda7OwK1Bbm/Gedl1z4yHFyYoidotGm4lHpYdRiJ1
 Tl3oEhnaOy8mPGGQEim/Op9o6B77TFcDNwTibR/8hvs9Lzz5OIz+E/A4OktBeJTBe3G5G3inhxo
 TRE9+MQObL3hwezNMiBmAnx1HYXSfnwJTO1lABnfEYCfJlN3vSKHTS7XGiLMoNeY4Eo+Ok7b7L4
 0XETGTHiODFKL8MZSh7EFV3ne2BMCU+5Mwyvl7q8VWaIFKjrANpvWckc5Bgybgc+Wh80oheZv3f
 mSHB1g79uAzzsMw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMiBTYWx0ZWRfX7i+nVMQKeZIw
 FF0dV3Yu5Ftk4I0+/ANhl8njXD/aDh+QDbTkxbcFnAn97oz5MHkp9pxeTg20jiJR0q6snXoEBCB
 joB0kgQd7Vofr2XR3VOWwAsnJJUnxCJhlu0wEIfQK3QS22IwLZ7ZSdbuqnLSKgofqYpt2IgDk0b
 DiYj/eBDO8by/gdZDg3Rq/PYa7u5W+zttuhb1NL1T2jJy5rESWq6cHRlmrT32c6MG3630KrRYz2
 2jabkGh1h7R/K8JTcX820TA981NIN51FmY0v1dWA0Q7PGD3LIYSab/1H0S0lzsI77BUqUDaRHiV
 ssOqUcGvCriizhvEPrfw+6vb/K5WBBMpLBSnvSA/pBIZWW1q8qW4K/2+S3pOkswztiMS1znY6DO
 RH+8YVS0lvrZ54zVq9Cnt7VCNL9twbowFH2midA0425utLnqa4B6QciaKL2ortMStQ3QpEe37PP
 i607Uyou84KGSsE9BiA==
X-Proofpoint-ORIG-GUID: a0fnP_ylpjogNi501-FuWBD5h80lWKWZ
X-Proofpoint-GUID: a0fnP_ylpjogNi501-FuWBD5h80lWKWZ
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba3ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101032-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8DCB36842F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7750BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 90f629800cb0..c31f00e36eee 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,9 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
 
+#include "pm7550ba-eliza.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
 	compatible = "qcom,eliza-mtp", "qcom,eliza";
@@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -376,6 +417,18 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -405,3 +458,33 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "otg";
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l2b>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.48.1


