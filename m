Return-Path: <linux-arm-msm+bounces-102582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPAcJ3V82GlMdwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:28:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0030F3D2109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87BAA305D1E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 04:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13290331215;
	Fri, 10 Apr 2026 04:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="km358ngl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGrdefKU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89391330D2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795171; cv=none; b=NmvHKRzWZTpOf8ETzgnnLlZBRW6nbxFGcb+ToE2G+ixpjfmpsewR6+wB03KsFBscC0dwd6IPn62lUvRQ1sfBtLSjKC90B/x4NIjhlAAue2vzUWhAZNRHF4RcnNnCE3txk29LDPRGQ8mzMoSTW+JV+cNAYDkYMrIaAVW5RMsqID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795171; c=relaxed/simple;
	bh=V4wUSuWV5Yj8ZviHFpqjcBhwd5DsUzsCPP/vHGseUdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXWzjM+kqQVBXD+NGuAUz57DfWOKH2kglLYPXE/jWMb4LDpsg6vERSS4aYufol0RRpmKpKaTrlbuS378hCMfD2WKO5H03NpEneflUEyBRRDeTpodBy5a2TesCfehNnq7E1ZujceZAZl8oc/58+j+KE5XWWVYr/PRdNeEbtytWF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=km358ngl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGrdefKU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A24eh1115016
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=; b=km358nglaE08mi/G
	ZvE5bWnmvyIPdLi6SZ4dLR/qW0eCX6qmx8RBajSMcM7TpMXJQqWXDrg1+slEqLtG
	6Lbw1vsAFau1JIdzYpywLye3bLXai/rTTSR5MBnWwyNDvDZdM0yKKUCYtxmM+dGA
	5uEUOYOJeyjH1aMdpETrtWNgycn2m6IZREJh5G3WF/+0ZNDEWbEwm/+8OfpzHiqA
	OqQ263Tm558Tkhv9QOTkgcES3A5cOEu+43taRXreCAGMExMoBHR0rXPMRDuUP90L
	1k3PCmsqK5B4KoAjZg/iflu4HfTPVEWaDYXdZ+WUwwd0vSjUZsPatLJ/UhCmH+Ec
	GUGY6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xa9c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:26:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d6061bd722so323121985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795167; x=1776399967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=;
        b=JGrdefKUcwBzv3eh2nNMagVZq5QHOQY2/nx/O22K1QZxjCQxLUa+CJHBY+jYi8C54P
         tJ+sULBKTxC7MarxQRJsrSm/mI7Zkp6q7f6+2gyTw2QOD5IPTNB8kmMlmebmPrbioaar
         0/WkSws6M7xOdgd+BF2csgLv/UaNB30bHDRf786yjMFPUg9zJXN4CSRJf4rkRzlGi2rX
         ri2yyFAXppEacv/XYujemQeT44f/8Uy7pvCE1n65aJFKy7wbh6WMehQQGbLgHL04N5lU
         x2gP2BptOjI3rXVaC5fKknNNA7U0l/cndx5rFaInIwzNi5TAFJasDpFAw7AyL0lYI8GY
         K9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795167; x=1776399967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=;
        b=bhWlu9CQkDxRn4/XghEMna0tjJLU/OIX13VYx0U12Sv8PShVb3GCQbnmhN4ysXNYrU
         qN5XM1ZUMhP8kuTLP5AXZWwvi1cYLaCuMHVgaDeHrE8FC4NDuTCEkiiJZS1y5BRHNbub
         xKUyibNGMxIvwKR+w1Cl58JPba60NaMspRlyMx4xPYLgv0cNeq/2dplnMKGmP0CNZdLS
         EbB2QvGqtMbgqSN4nD4Vs1r5oR96Lae/5pszQgBQ6j7syV1YYzBq7s+6MzD0akApVmNd
         QP1XV8jZAbs3Mfvcl8g/O9D6lyWKXCFKohK6eTysVN6ngkPdp1SXOqsg9BKulsTi7JC0
         FsKg==
X-Forwarded-Encrypted: i=1; AJvYcCVGltLmI8gET/lPNrMiEH6ftIeg1dpx+FfmP5kkHySVllE9oTA6CKndR2xacGdQjL2kBY4ckkHAX+guqcSt@vger.kernel.org
X-Gm-Message-State: AOJu0YzXKYmbDPADE9FDGHIIa/KM2joomhm1DZQSGlI3hbstpC7JCmGO
	WANtTKMIiV2QJTsMDummXhdphpLUMif9rpRbyNEXi1tpC5qCu+T2I77FgGlJdF4iWuca2MRxBNm
	PfqYipcC/N4Co+qhzVYEkKIOO7ZVMwC5G+gZxfiYb3FIfNE/6caYiO+eL02CXSE31Qymr
X-Gm-Gg: AeBDieu42qUFE1awwRY+b5ek2PF9W9MgHoLCTqxa4cprJcdQ4I+dO77oF3VflRvOK86
	caHIwDQKh2VSpwjmv1NdyYuMqt+WAnBhe5h4tn3X92uWWDBx5+f+fcGNFCPPMyaiuOeYOuNFhpb
	UE1JSUTJPqJn5iURDHpj7llbFWXEHRwJGHOz/f+XFw1n8brAudlObP+2vlww5Dg4GVDC+coL43s
	UemDH3WzrREudMUjGvPr24YDWgGBb4jNvubZRUPOkDlTnIiN+h3kgZMUEC3qdy3E8QbnbYpJjzy
	yYJcOdIE/eVGhxxjMzayAMn1AuLBDG1Fd3Cxtep5P9jI3vmG1mN7y4YTA4iVGRDwDwC8lcDo22u
	409p+KrpDPchQbxQ3drmPox/gjk/9zOb0/viXeiCpOlXlA8F73RIroAPzJdk2ovK5vkY/astcRO
	uYs+hTHoARyJjr
X-Received: by 2002:a05:620a:4588:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8ddcd8f3ce7mr223449485a.19.1775795167080;
        Thu, 09 Apr 2026 21:26:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4588:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8ddcd8f3ce7mr223447085a.19.1775795166624;
        Thu, 09 Apr 2026 21:26:06 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:26:06 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:25:34 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
In-Reply-To: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=686;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=V4wUSuWV5Yj8ZviHFpqjcBhwd5DsUzsCPP/vHGseUdo=;
 b=+/fSDRh0kjqtmsEO04q71jhgtPncaUSiPf3yzSHP+H+PJ1RapKljGchMMhy02a6/c0SKUAYLH
 oRah80KvIePCV38PMBsvI5aExbf1aJ1azxF0EPkqXhA6lRiFwTkX5D5
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfX52sudV8A1iSz
 T/M0+D/JH8GsLcvNa7BoQs26y1JFubz+UfjlahZCcntARto4+JfNtEx/PfPBzy1LKL1QQ6noqiK
 TtEUOiyrfSRSh6qm0Eqi3+HnWeVgPew/sWkySfqrTLZQ0nVdEk4ejnFWYdzRv5WknUoZ4clY148
 ekLJ8mWvwHrUWeV8fX4iuygIB2InjUbEgtD9Jf2i36eaV6AtppmwACzubkKBxFXgC05Uu5QW9oz
 EiBR/vxvePuxBWo0qQKR+rswtuh6sE51fi4HrRohIWmfABcSzDCpkNLJJcAGQcWt7uJZVA3n0Am
 5A3+iwBDJenBNGoOINls07gSYbs/UccSEwI/X+QYEeaE0Neenv1ObxnFu8+I+mS0CN72kkeXrfk
 I2vLHm0evr0LfnmeVxC54bxC1VtHP2AxuzyayA0vbQUpeTl24nwzj36aEd+4CENjoIfNFi6cf7c
 YjGamZ3zUkwnO8iJQBg==
X-Proofpoint-GUID: WETshznPf7f89MXAY2JqlcRne6t9dZEn
X-Proofpoint-ORIG-GUID: WETshznPf7f89MXAY2JqlcRne6t9dZEn
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d87bdf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fhchRTXZpgtNQ5V_lqcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102582-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0030F3D2109
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

nable camss node for purwa iot evk board camss tpg support.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
 &i2c3 {
 	clock-frequency = <400000>;
 

-- 
2.34.1


