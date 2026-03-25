Return-Path: <linux-arm-msm+bounces-99857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJXTIyHLw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:46:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4C324290
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92EEC3019442
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B103CF66A;
	Wed, 25 Mar 2026 11:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUDs3rDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwC148n/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC9C3D3329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438892; cv=none; b=sQVRXLEtR4kdD0sLfc1ka/NmdHKRym77XUp26fJsoUztc5jEM3O+jNum9CkypH6YcsdJe5MBhKUxI5PjGUKOTheR6+PqhUrTWejeyNWQNyRF4xmgh8ydptN2BCfn6bkmi5zHs6Iz6Q7hZy6SlXjfQ7zbAu6s5RrLy+cki2uaK4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438892; c=relaxed/simple;
	bh=CNOKzvn5kD0XReRJC8TJ6vbCACz1YNhnjP6JoO3Pr4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hgmql/kgnUHcVbCzrPAOc4v1GIR/QXjDU/LGO8UlfJiQsfYx+xnWMQO0uSQ0s3bg++4BqHUhQbJ7EQkBhv3nokUtrY+sPfKnFk4STKzf0I7M1HW9C4gxvFYRmoC65ikrEMjgzZGbLfqYsfsG4LjCJp+f0wBQHSFDE26kWqBUdWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUDs3rDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwC148n/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBFuBs720216
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=; b=XUDs3rDP44Txpfc4
	vwM8bOgWr0JPHLz5sky4txQXdX6a6lwyjSpLafrF0yv8SLOQ4WiAK5+phi/PCiX3
	WRu+XpWIrCWWCsow2mX/WS4WQYAZGHPj/Jv5/hx48fiNrjH+a9jFnTSXplYO4WbW
	jT2DHuFmWNbu869EPCSOR3EQBoDiNilYNaMCdOV5GSSIcl2082AvVfiK6bt1gLlp
	Zs1mJCj38KMYRBl2mgk2+CXpBUTV2OJVc3wOhzEzG7x/KJvdfRjridFbOdsFPNRG
	/THN3hwRBRCfX/RD9rpfFrUavGiEx55trAOrBTX6Ag20VXvXvrlobZl2E5WUnj9b
	Fzc6AQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rb9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0601ff3d9so39443005ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438890; x=1775043690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=EwC148n/7YiSpLocL9DFCFSdW+L+UIoWjFzu7IgcSsfFSh++Ez9lIp3OzNmVlK8Zyb
         ujaroL8JhFvd8ZRrYBPkS40N9dGjx1s62dFFu76Tp7aCSwf8tJQEihkrYK7WmnS0pOdZ
         gb3MZ4B1MvVs+zd7ckjf4hvXAlpNhWvnQhvvhcIhuNx+pe9216eQdyHgiYl2SrLbuFKK
         ymEi8Y4tMKh4hWMUbK1UGM9gDv4wgQxTr/HFVKGG5L+5h2mKhZoKR2nSjqkwajbRWM90
         3eqAgzabNdI//16rcZ0SXtU7D3dPHhuiN91ha0hd9vKHHeWYjZg1cwz3d+LSAi3tFDYJ
         IaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438890; x=1775043690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=c/p+mzwVLfuDgTgFHDz5g22rQidIxUGlit5Nioy0T+sLc9JcFhESfk7V6m2yIFGVVH
         O0R62CS5F+ooWX57YkCYkUV9MfsYen5XF9Y3vuyJrYFyoaX8BJ5gneTMx2YVoCNyT5R3
         FRq37AZSv1yM/cRVoooo0bWV94jWX0JbzbNPjnRokpGCzFIomLlhcKT3h6p+xNNm3Vq4
         3IByOaHwx2gMSunrShOI6hCnJ2je+7mG9kkyv6xyoom/n1G69MoHQVJYDStkMU92Vjg5
         EW6axLTfpuMW+IZB6DFYOyo7i8Supp5UZJ+1a/r58w/wiH+USKdQKNRQZ2Xv8ZPf4Om3
         nZNg==
X-Gm-Message-State: AOJu0YxCgcMjNUtLB+skcJ5rwGRuM/CUm5z22LrcaDLXnRHu0Lpzr+RR
	GLsGOuZZCeoJtEGURMtQNpSgCLjtdA9qh8MZ+6MDlLg93LInRQpL32JZpuz5X0C2jrl/YoauP5s
	FPMHwj8nrqxlTuVH3HYDmLRGAGpyWOxRB9SEVy1L1+vXj9wF4qRTFuMM7RNNyPO709r/6
X-Gm-Gg: ATEYQzxWTIrXV4zRm6DR0PLXEhFGVpBLtlTXA9+3WTMm8gwz5DS8BGfidqJqxVeMPWt
	i+vBsPfxl+0pHiraLcDhh+Lo/Meg5c4pUL8edDOssDEZha2iW/Y9Mx4txyXTqQdxQkvNOxWcmNL
	qMsQEPJAMgo8B172Rnusdm9Ohhz4grkKx+DfFGXCQlN6E6Run9dmIj1gmz5/5CmulikZuY9SDzP
	yC+Uag1+vkuspOHq4X7KXjmaQrhWYyQmbChkUy9gBW5X6GVdHXJIymF+fCFIZFOqFhbz1BiFyuX
	G3e4/7XIL0iosQXNwLBihTIMCPN6eSKzzNQtMEdNl7t7E0+EmvFXUCLpHtBGD1u1cqBW0cm5CoM
	C04Rj2Q/I0LFou7HcvXHHJFeKAEEJVoYvRI7Y4gVolp36d5dJg+etL5qQckFu6SjKQ0Pxlq/5Py
	JoJtlTQx+GG/hw+9s+Iuuz+KU9vV5MT9l0Fg==
X-Received: by 2002:a17:902:db01:b0:2b0:6a22:5159 with SMTP id d9443c01a7336-2b0b0989b2fmr36294905ad.1.1774438889863;
        Wed, 25 Mar 2026 04:41:29 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:2b0:6a22:5159 with SMTP id d9443c01a7336-2b0b0989b2fmr36294555ad.1.1774438889345;
        Wed, 25 Mar 2026 04:41:29 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:28 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:54 +0530
Subject: [PATCH v6 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-4-a8e888d09f0f@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=pXx3AWCW1rDtKny9OmTAQa5CSZy7BRS7KSH0ZkBzrwE=;
 b=CRxsbAgVHTVXROBEtardS/vqoi+9PCeiFI3Gvfw1jGrDpki5TSiFwziEf23VnZdNopzVrl2xG
 mKp6t92goKbCHGiSpapZ1+PNi6eXPBHK3uitfTiPpOVdc1LbbJ+xMDX
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX2MxRv2P2u+1z
 72ZbfnWs6PdoFViQfoAYBxdsGN0krAC18eWW2fjsj2qxjsZ+inZ1L/sAXALwwijESCPKSGVQ1Dw
 XPaOrw4GHbcNHMRf59A7HJnKG77Zw122w6e6lcIfy9Z8g3bsvmYdMjNTxZ93DKCiy71dPNMdLyG
 OiaUCw1+VWxb/Y9Uw2+vTcLmP6Sx2/escw2O4qdIX7qHFQRJdGOisH8ksWvIOewUXSMg3bbGZxf
 DgqLffew/cAoHG4Rt/zvDQMJHQMALmvRK6MnsrMFTCC4pLcEi+7u11dK1DUpwdbZltD8yZYUQEK
 HcncPLXEtEDx7KwczJo2wkG/HyQPhCNOYlztaoamhLuGd2ZikRQ8OokNP59MyE053TScYM57Jo2
 20cwXK5v8dnsxF7/d3R27DGOEWbe9mohCpwNQuqLJkz3CprfpjwidCdLXyxgDGeDOISrAE6SXPR
 oDNkBJPLB1N/2HOfGSw==
X-Proofpoint-GUID: _J60o3R4ejYuYihyambgZ8iNsikTyAnm
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3c9ea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _J60o3R4ejYuYihyambgZ8iNsikTyAnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99857-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.76:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,4f:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3ED4C324290
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 485dcd946757..1184169f49cc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1517,6 +1527,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


