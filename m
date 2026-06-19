Return-Path: <linux-arm-msm+bounces-113828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P37GNUUYNWq3mwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:21:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 395DC6A52DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:21:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DJGYGqLh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAF523026F16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F212D372663;
	Fri, 19 Jun 2026 10:21:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E6372ED0;
	Fri, 19 Jun 2026 10:21:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864490; cv=none; b=kKbdauvfv0csSxsUmFJS+Qi/7Hye77JFJjXTR0iOCvHg2e7GzEQ7iXQyp1bvn8zfFb8oXcwkfJwAg5iymdRmz8ocNkx0gulAL0k8XiuLEiK+ZUipeYWOcvzsEKOrWz5b6GuEybDA+yqjvhK6XHHKnMlbtMPO7UxFDJTtUcRoMFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864490; c=relaxed/simple;
	bh=0eNx5l5qHG422Sr8QCZ1/IoQaex/Evo4j/h2gENgaHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ahxMKqQYUEHBkts75OhfTKZUE0EF/YDE4Kji2p4eg5uxbfOV8oVjerQSOCzvdD02GUkEwdDaISFFwZKg8Qsownb2ri5BGth8f2eLOv0o+xtzpigiVcwudxBLE9Ks68/k3Mfigi6NWAoMRM4hkDgG44u+DL2c16ri2kNfUl44uUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJGYGqLh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Oh0N1104961;
	Fri, 19 Jun 2026 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ezZdBqyd8xED9xUllBd0Xm
	1o9oKAoTJBpBxkp5rE9nw=; b=DJGYGqLhYS8Q4FSVbMa0fJ7aIL+aZecBTSLKOB
	fJKyn8ze2ehb0ua3SBD2LzhqsLURjBUrv9aZomVQMJbgQ+dENoDkAhTh3X3wjim0
	EixDQ3tmXbhaugrV+vKSEP76scOAjxGokUFAp7Q8Smd86s1cjQ/+hqsfz82iQ3iP
	oVtsVomSXUX8ge9k3skYmtCnjfJfOIlH8C4IhBB8Tu5yG43sd+2dAEMosaO2kWgY
	m+/LSHlXo9qDpqUXlkIO+7k7HjG+4MtJuoQqvfX92oROfhHDTtCLJa3l6PYxh3Ld
	dhfIg6DaS/HJ2QuV/kZvwTj7iymAYWEqaY8jViUjKCqDyhKg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evgtmmam1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 10:21:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65JALCDS004187;
	Fri, 19 Jun 2026 10:21:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09m6eu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 10:21:12 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65JALCvF004179;
	Fri, 19 Jun 2026 10:21:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-hsk-hyd.qualcomm.com [10.147.246.125])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65JALC39004175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 10:21:12 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4540518)
	id 4CCAB653; Fri, 19 Jun 2026 15:51:11 +0530 (+0530)
From: Haritha S K <haritha.k@oss.qualcomm.com>
To: dipa.mantre@oss.qualcomm.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Haritha S K <haritha.k@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the Maili Temperature Sensor
Date: Fri, 19 Jun 2026 15:50:59 +0530
Message-Id: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260616-b4-maili-upstream-3-b198aaa8969f
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781864444; l=1220; i=haritha.k@oss.qualcomm.com; s=20260422; h=from:subject:message-id; bh=0eNx5l5qHG422Sr8QCZ1/IoQaex/Evo4j/h2gENgaHM=; b=uBYTBLJrS+lsQ/ZkBVcG1ZANR2b2OGWpt8wzLTGy7quiVnQi9awjcSFyFMSsuBwhPvkAEvlG8 OcGz/AQXb6MDKFCFCbmX5UEDqvnDVPd5o3F3wH20agwkjx+AAVVXIHA
X-Developer-Key: i=haritha.k@oss.qualcomm.com; a=ed25519; pk=ivp2P9RgsC6IkOe8JaqweeahT9pd0BVtL2d1YD8ICSg=
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: I4IpFZvjHqqgX0FMZ1jmmOhDXnViFYdX
X-Proofpoint-ORIG-GUID: I4IpFZvjHqqgX0FMZ1jmmOhDXnViFYdX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5NiBTYWx0ZWRfX80oS4X7hKVFX
 k3ZwuqgZeyjtvxcmsN1g/1cYB/KzqXQluAxk1addNTRezHdsJtMOym5JQV9zjRI14yqnuD0ini3
 f+KOwk3RJFqYf0WNw2bVsfQ5ww683tEW7lrjg+8GRCxODqZp/AZZmW7XJdxljlZjEowqrxi81Ln
 TcUT7mJ0jjp9Op6yopJfnU6GwrEe1/qixJitiKtYWHbmYZt8J2DBQr4Wb+clDEDqSThdOKkJBIe
 RhzMDMO1vIuoDXmnwEPHNm6WB6QmikptN6I2MnqqBzbURs85F15Zgooq/33HSmbyaKcsKjcwGk2
 BPSPLfPaALFHjck5xEoNmOlsaoqRDkki5st3MFJdroJlrTso0QzRngRnFP4TH9sg6nTS43ZyncN
 eCr+ts2z+//uRh2vC7fyXvr0NuDb0OriNgDRmxKLl22C2H2KjhXaL4LAbRxj/2YCxwbxhWeKhd6
 LtgA6GiILwxhI7exvag==
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a35181c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=EJ9l39Lyh2RndnSoSJAA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5NiBTYWx0ZWRfX867W6lSPWhCC
 mT7jL6WKNewU6F1Cy/LTTRc7N897sbCZ/Hk3ydNVTOw9vGlZy0ipf46RDEG51kwmJWN/k0oEFFy
 pbFde4kOdV/qHZzetRqJ3qukmv3km8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113828-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS(0.00)[m:dipa.mantre@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:haritha.k@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[haritha.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haritha.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 395DC6A52DC

Document the Temperature Sensor (TSENS) on the Qualcomm Maili SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
---
Changes in v2:
- Updated commit message.
- Link to v1: https://patch.msgid.link/20260617-b4-maili-upstream-3-v1-1-1b8cb7e425d8@oss.qualcomm.com
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f0efaa8349ee..5a8f7673e730 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
+              - qcom,maili-tsens
               - qcom,milos-tsens
               - qcom,nord-tsens
               - qcom,msm8953-tsens

---
base-commit: a76326dca329a7a738ba367529868dfbafb4a403
change-id: 20260616-b4-maili-upstream-3-b198aaa8969f

Best regards,
--  
Haritha S K <haritha.k@oss.qualcomm.com>


