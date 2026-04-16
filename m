Return-Path: <linux-arm-msm+bounces-103386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH6qMXzK4GkdmAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:39:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E540D82F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB4A1301D69A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6603AD51C;
	Thu, 16 Apr 2026 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TplrZMf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyKA3khE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798983ACEF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339306; cv=none; b=pdEV493+Y7+RyqgV5wAK7keQ5PqWjtQAYR/kMc9J0ncEL+QDbD8NeDD2ZXSMLLoix/WjCTPYyBUPcAI5UtfMOpeM2Y4tFS0HmagwF3OvoUy2XnlTJ4EIS7Eli8hzy5v2boVQ34DGv0s2iD5XtZM+9vt3Ir42D32yhEdmY1Arsis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339306; c=relaxed/simple;
	bh=hAZRszKGLrAk3oaqtg0e8Dh1KNCie2INOW9nEkpV1G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LyLw2zz4dSBxOpSTKywdAoUHHm8URctXmKSooyxZdG6QbZm5f6EftDOS75o9C8dFgAqKXnwUitnWl0hALOcvY2B5ZFg7yEiOnE+WJPIADnjywAC3YFm3pub3hLhpgikulzg9bpwzjpG7y2iFVGJHwfgsLKW2VZa3riR1DDtXS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TplrZMf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyKA3khE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6okMa218928
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4S1axQL7mkxBLZ9v9ZhYzL
	O9uuVKtQgDNbh3Uc++7Cs=; b=TplrZMf7WzL3eqVqt7qr96obZ655EZ7ykR9HFi
	MsvU/0JuTORlOWmidSy1PSCwqXvsvMhpvHAHtxdmcZy4eFXTGqJOmjlbCXlicvj3
	e9OGWvDcW+08VXWI5d5r7buzRXa68gxSNgPolaUVmrsIjgGI+/jIzr9Ls1wQo6AG
	lkxd5Yf2byfVMZU1aFZyWnIdEimGUyRxVvRTORwJCHa+6jv+tFNOewPCYGsfBKhG
	SOTLTuyGnJppX/oAI9SnsBf5SJW/9+bIRe6GWOhY9fV8X5lmBxepaS15rfqE07UN
	TcVUfLIEchk07UF/0Ztt5gCjCQFSKHBePCovsN9jDlG1q9dw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyh12w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:35:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f32d67ba7so2414059b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776339301; x=1776944101; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4S1axQL7mkxBLZ9v9ZhYzLO9uuVKtQgDNbh3Uc++7Cs=;
        b=GyKA3khEOfo/rke8tRSkYmYMEqQ+63avbt9Rjxc/b4oPZ0rtoldKEwU/YtP13I6xxu
         Wr2pWIPZqu/uZlxF4tlBhDDEREoiXOq2+LQ0o0gn0tCc2v/tDLeK0ojSrpyNcNiYIhc8
         MJOWOM24Tqfn9fU5eXjQZCt9E31iITEeGIkDixIfZcSq4cBDyqOJ8jqlRhKVVF/oCvJF
         m+SdGBCVt/1Hs2sLxQsXF8dlsMvNKNtGZuOkYvOYXK8CXiBQP8i4IwEcsp9rRzhX8QAU
         +sx8lRWU85XeQTadksLme6YgsI7YcZn0JR45Grz+27MoyfgSc3+LrTbdWAkMmI11HXdl
         RuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339301; x=1776944101;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4S1axQL7mkxBLZ9v9ZhYzLO9uuVKtQgDNbh3Uc++7Cs=;
        b=rFnogc644dfg2tk6QWkly3l3cis2xhk760TjnNm67CCoW9AXziTM32ZPSLTCUSd8lu
         Wxcz+VNA/Rk5C1LAx5gfIHabxm7pJ+DoEkwqy0F1vwX/hv2mmpSB5zFb5N9LLML4MXd7
         lY34YcWTveRKs4M1aF9yLV7ie3QOQYtbKPILMxlCxsSRkIhqAbGQ+tjHDAp0AeR6z+EE
         oWsa5bvxP1DGengmGLhnc2DN2CEYMgH9Oi9+FeGjlghVWyovGI7ulSamNx10lnkU4Ktc
         8+wrwaNiwD/ebPet9E1b08BfV4hs+mvieCrGJIXiB8dednDaxEce76eqaCLOjN6S8es6
         p8Ug==
X-Gm-Message-State: AOJu0Yw1EJdhmhnEVOvfLa56APYa4i2aq8z6RfcWrFCsxnljOPwmFBCE
	fIBVjPlWgTOSjt43jWllUC1l7I9jV6MSQhq5UJ4sLt5+jNMqC7BuWl2d76MapYwVsrYNLfRhhvu
	+YsKIqqE75wYPZ9Ao0ykXk2lJvKKjYahgvlvtlFZOrjz3xa+8RT2Ycw3p4MqCOGPFr8PZ
X-Gm-Gg: AeBDiestz1NThFNmyTJ/XinO8chLNZgaYzCZ5FLb7KSK4/qOcQovxqpX5HTmyFj86p3
	UVenvwAleeoscZk5+a5KWPKHy4OFByU0sFpKbT9b1x9Cyo0g+KevEHg/UjYVb1f0oiF+V0qcsnX
	xOF+wJTCQ2xvI/Md5WVQJXMgy4PGQoXWN+i3ruQmoTo8RhvYJwXLBG3hvdrrvD/mdZxN9z4jAA2
	V/qMJlGFiD3Xb/QKs7PDKucYywyQQ3+zn3qE2Euq+/wFDjslqUix+8SoSIJ89i5l2Zy8rfq7qdv
	cWYmwUAwzZvoqPsFtj8AmSuFmqdyX1wKry/I0KqWPAhUcY8hFax4iltZ9lA6nIxf1UuTEQkKC0t
	aIFqsMNG2GOSJxKTT85o5m2UZMY/M6GKKXkDo6HOIbk7pV3NVWWQ=
X-Received: by 2002:a05:6a00:170c:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f0c21d396mr24740871b3a.25.1776339300708;
        Thu, 16 Apr 2026 04:35:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f0c21d396mr24740848b3a.25.1776339300191;
        Thu, 16 Apr 2026 04:35:00 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f670374aasm5832570b3a.12.2026.04.16.04.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:34:59 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:04:48 +0530
Subject: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFfJ4GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3YLSovLE+IzM9Iz4kixd0zQL8yTz1BRT82RLJaCegqLUtMwKsHn
 RsbW1AE5Tl/FfAAAA
X-Change-ID: 20260416-purwa_high_tj-5f87b7ed57c9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776339296; l=1393;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=hAZRszKGLrAk3oaqtg0e8Dh1KNCie2INOW9nEkpV1G8=;
 b=IEzEQnKmql6bcs7ebhPEs1uYNygteV8fHrCC2XldatQKm+EfJOO7vnp1A+2ZBb9G6262ZPrbE
 POug3ER/aJRBJpDxTkb1dtjvVq2Pgcz3qiTsxlvVOoHuLCsiZDMNQM5
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEwOSBTYWx0ZWRfXxMZyWA0tscLq
 vAozbJFaMTLbD2TqmUuPVTnflJU3wbBL3ou57RdNWa2/fSB7IpFK2G9PlIGBE4tAqzjJ7GRhFs7
 wT1hVtwSGLDCELZ8Zj4jlEi2QliMw+mERQ5HZiaQSlwaf6FsGHcGVuuMdKdYatGm1xGnw5ziGpL
 C+amfMrg3Z1FQHzoLQAMoS02rMhv2HxkRpTQn6ejb1ILgusd5CKvhUElD1dKfM5+vt69o2y9Jsv
 Rc2a/a0o8c749QqqKgYRD5H/fcJde6GZEQpeFuBK1sRXFP8EHS2v0tMWPfBLRrlnSMiDrq/zcSZ
 h0lYRu4oJHAtAGZjjEqZ47UWi3zpOBtlVJ7fUDFZDe6abAeQs8iJcS9XY5LhZHZIih3PML6ySBV
 V4S1hToATHDdJ4H0G8iDpzyXSORfnLQImfXR0soJY2J3DHa5qEbUIiSg9vLG8ItXjgeGCeZ2fBn
 d8Xl7u0e2zv8gSbuprg==
X-Proofpoint-ORIG-GUID: d9OlLoRp3947WGJUrmf_up6OO_kzjsgZ
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e0c965 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rnUGh-oqUXyQQgXjzFoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: d9OlLoRp3947WGJUrmf_up6OO_kzjsgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160109
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103386-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.289];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F4E540D82F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Purwa IOT boards support a different thermal junction temperature
specification compared to the base Purwa platform due to package
level differences.

Update the passive trip thresholds to 105°C to align with the higher
temperature specification.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..261d1e85651d 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1325,6 +1325,38 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&thermal_gpuss_0 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_1 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_2 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_3 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
 &tlmm {
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-purwa_high_tj-5f87b7ed57c9

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


