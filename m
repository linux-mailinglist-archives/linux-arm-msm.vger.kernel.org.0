Return-Path: <linux-arm-msm+bounces-94069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGW0B8TCnmnsXAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:37:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBD21951B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5648830765F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CFE38E11F;
	Wed, 25 Feb 2026 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mi7D9bpy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7Mwpgfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45338F23E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011936; cv=none; b=fCxYkm8K/ZlPP/Q6VmJjXEGk9jIobEaMzIIzSacezvGDbQcBt/tL4V+SLtKFxXP80dGdYvubShk3iEzcVF4VCAXjimbvMztx77by8AI2f5hEh/P8yQ00ExILLbQT1uZofkxY+MkDKTMwLtFN98SeUsI19NHDGYRpiFQxKaXhUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011936; c=relaxed/simple;
	bh=U/+o9nUyHx9+NniGBEPDco+IrEvQ+QM95H+jvPThMMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=laK9V1EDqqv9TNK4IagJUiN8IC1Ux/wcHQyxOE+9FbgnxSArDcs8z3S0qJdcX57/wzNY37M42duQx8reVgjAHV4Yk2kH9Tafk0JkUNsTfvdxyGdcYTgOET3lDhichbzANb6Vfs2FCEq/YG9oYee+CL5apwOM7SMaXK8/1R9yNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mi7D9bpy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7Mwpgfy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SIvJ1363560
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xX0+lOMCotS
	XXElNvJDICNejpp715IbQXMgUxEtPFus=; b=mi7D9bpyJ4q2/X7kgspKwoBv4DE
	Hux7+SPm+eFj8xy8Stu0XPH/2ZonhdOh7vvcK7sdQTVjhrWEz8D3dF5QIwba76ML
	8df8LqmSsFmcm5H2qRlA0t42iaKE2I42pSrUME8CD20Ko7PPOt01K96daJoJIeyV
	93tbIpASKrSR8TfOE9jcy9U1R0GgOSdU+vtDtyoXqBcePNZyY7pAPh/yk+kPEH5w
	LX9R2WmeifA6NfOj+mGjJGyTxn3yCNi4rlfCpDwz6zWGO8GMG5OWouGsV4VhMjVk
	KJjPQbHCNA7tNmDpeYiPZJky8+IInNwVmZBj0WqKq6Ktp+hU1Of/yBWSDkA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp159fw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f137aa4aso103913a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 01:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772011933; x=1772616733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX0+lOMCotSXXElNvJDICNejpp715IbQXMgUxEtPFus=;
        b=Q7MwpgfybotvhXqHdqPxFtQaPSHXGEhzujXmyBntei6Pig89jPGqDdmGKOv84fVdij
         jNxTIW1f0it7f77yJsB+OEeCncqO9/rQDd4nyVELYnXvmadcu/7JKzqMCYVJhuJUofGq
         Qyrq+LPxGd5I3QidZDfBPZqtezqNsoGAizp01osWQPzAGkCDzDSrS/JR/7h6npi5zoe2
         xVo73sVIsgVQdPQ8zq5v7BlnBBfWcbdQ7575NPYdeoxnWAJ1B2DuAfINT/Tn3DYHyGos
         gl24ZGfmkezx+n+9naN6HJuuAFLP4BelXptCyS3Fa0n4tul/fIQxp1N9gP3hQkqtCjPJ
         w31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011933; x=1772616733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xX0+lOMCotSXXElNvJDICNejpp715IbQXMgUxEtPFus=;
        b=e2PF8nCVl+w5jIeyfNW6W4XA8Ui9zc6O0/os3LtK+75UkPdMJz1MUNA2+pdqenH7dS
         wp4xCUhO6LMI0WIe09tnGTXiaSAoZmojNOB9fCyryRtasAXHepdU4RxrS5fAxKCsonSd
         WEdl+UCFDFRALzlcLYWv2RLHJ4mDE4kfR02oiLXdpHq9Qu5DN+ooQgD3SUzPNEG+LHBa
         yUuab5gxdbj6qbhaW3kV8vO1xMT6UVUFUU87OV0NUpEhGsBYbWAYK7fTt2gva2NYdpcr
         gvW+5S/vmxd6brj8dsiuhHewvDzq+CSEqHSI/VAvfVjI7OYHRoFHr+x9gzhb2lqZ/hqa
         H2kQ==
X-Gm-Message-State: AOJu0YwZM+1lw5IDkSStE/bkcIG9dHiLd85iBw8DHXWVokdXC7E1eAtg
	9hKUii0R1I/TIcXaMY07koI4PXBxD/Kx5gXwEedYgTWmojsFD2Cifz+jw6KqkK+1veTRlJqgNkN
	tmgte+UiG0PQtwuZ+S1TVKLTndUk6ZtrzM3sq6CLh+a4cFlbLBCAy4YOvi6eA5QpdwZZN
X-Gm-Gg: ATEYQzyK1xszUh+CrwkVwBILRjMNMlvYm9+ghOCBWf6vU+gAIito+mYIri3wVPECRNf
	5JAwQlNF9Ot8UI16tCZdp6cDJCMdNzmV6ZE0kutuEHWu2pD9qezwQVpMVxDWM+kQbqjFIQaBlhI
	37+s7sOzkKZUH7dW6K9E+3kYeMxl8ZrMexOdiZG+FPnZ3BIo+5k4BQqvMnKmToOXYBQv++QUHmZ
	foeSW6qLJyeUaxvJrsXzMHXDCWmtF6EKF6np7mbZjIHeXY+GLATTQDED0AOANEwkNlqME9agfW/
	/0V9zqjKskolpG0cHGHVdR2iVSr22nhEJfNfx98l3xs1gHTFq5F9fd4X8MKdWE+UM0XKzbhs9UH
	oehO4WRQMhp08yPS5M5Qj3zdRZL/KgfkLwns28LTXe1BgF8+2Q+Lv7GI=
X-Received: by 2002:a05:6a20:1591:b0:35f:4e9d:d28b with SMTP id adf61e73a8af0-39545e5bd48mr12550025637.18.1772011932803;
        Wed, 25 Feb 2026 01:32:12 -0800 (PST)
X-Received: by 2002:a05:6a20:1591:b0:35f:4e9d:d28b with SMTP id adf61e73a8af0-39545e5bd48mr12550007637.18.1772011932332;
        Wed, 25 Feb 2026 01:32:12 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd688aa7sm13628098b3a.14.2026.02.25.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:32:11 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 2/3] arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for tertiary USB controller
Date: Wed, 25 Feb 2026 15:01:54 +0530
Message-Id: <20260225093155.4162177-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
References: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfX07RCbAxyLMFt
 K3ZrIntTleRb8AlLoFi4hZ4zHjvOUOeITGUdjTFscBi9jSQFtKQRcToGBkN8WW2L9vRRkF9Bn66
 RAtjYhJgo5W980qfO84GXMoQtUuXT4DHJSHwQ2i7/4JNuC4MJjqfLuhwiaI4Cxjhs3Tf/sQzm88
 yK2fiwJeAa3QzX7TPSWS4zL+cNWMbe9zLpriyTxbSELhLxf7Z80yVpXiIAp7xGhabLLLleR8Nrn
 RNc4951ekcNFt2EIbRSnRPUuWB9GGr9DFR0oXfhHvJBDRHl6nbP2Wk8u6vl/jxiJF64XYV4nn+L
 zKoGHyptYGQWuZDAtMCIJN65ENBcfNhhOw5pqs/vGARTvFFqwjsgOeueRGuGd6pFbXaGoa64+RA
 XShpBXZWUokkJz7M1KVM7b7Hro4mQ5NoBcV+gvfydISawyLYYh92oFdr8OyWlE1imV5TYBFDREX
 0kBoPBJwFIP5/LWe3LQ==
X-Proofpoint-GUID: fCB_RBTcI-p8rFnBSGtaYvDb3gOAq6xc
X-Proofpoint-ORIG-GUID: fCB_RBTcI-p8rFnBSGtaYvDb3gOAq6xc
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699ec19e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZrvUoS1E-TgtW8Atug8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94069-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBBD21951B0
X-Rspamd-Action: no action

Enable usb-role-switch for the tertiary USB controller on Lemans.

Additionally, add a port node with an HS endpoint so the controller can be
linked through the DT graph to the corresponding connector.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..d0e63336be6b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.34.1


