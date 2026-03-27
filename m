Return-Path: <linux-arm-msm+bounces-100225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PNKIM5GxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:58:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E83AB341648
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A4BB3034B2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D190437267B;
	Fri, 27 Mar 2026 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRSlMbwg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8R4StIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF63CEB80
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601610; cv=none; b=SG1HSmdnv9MIZm2b61TkmPMRfnRVUGEeAZQt8Ebo60/OHKAqqnzN/06U1il+z90KPeef9LIAeQd8XeP1ZCoV/1hEW+ob/JMSpWGjtBIKIJcvcsu5TFA3JNLNPyeDM2hSgDSmcNl6PliazLFgzjcd9UJTAmozPrqiJxzsoF04nJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601610; c=relaxed/simple;
	bh=AdR6PAQkd/glAbRWzZqZs5ZV5zwjk6NoX4PBwfEC2PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jCZCpLl8ONxJ+aUE2XN87kzPDJSpfdtkx/4opi/x67KTeyx0Bg9STCkXhifh4WgQSLZJb8e7di9MFksEh2T0nE3xAd6ZluNYhhufJlPz/Axi6cJVrYyErEr9H5HX3lJ1Dp1dzsH5MEuDrAuPrR8aWelZsXsYp9T/d3QbcNDWiOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRSlMbwg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8R4StIN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w7vX3132239
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3
	LJrHuND8=; b=LRSlMbwgkLMJhskPryMuFDC+66xpWnkO8JbfQ1ooPQ95Asb02VW
	5z/coajHd20W9/nqS1QMf8f2zJe8k6PMpZDyiQiqFKwSjxI51kUV2bGN0FwXjAmO
	dpRafkVEI66aXJvTgrIX2JBtUd7H1auwnjsxpzP1S8r1eVWuJHbue1YkAu/4qU8Q
	fDPkx0xl0yuA7ZYXc9zlkp6DCIr2ZZ8bOu5KwHeWSsazp8W91oC6apYHm0G9ZkKW
	pzxZrHSHHcFrd1QhTFEGUPY3aSpr0718W9B8YCSr7zbfc9cnqZgx4sNy6Y8sa9EU
	m584RISoX+jht7YCtrNGvLhxdAoITnt5FjQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s42pxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:53:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6906e35fso3504444b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774601608; x=1775206408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3LJrHuND8=;
        b=d8R4StIN78YqhxxQXR4wZ8HMhlSmfux1kQr2qhymFhHFvxqBaMLg9aWm3fhxSODkAQ
         occUyRg12gp2EkmrW1P9bl5GuakKWRornhIa5050A0/PLLzK8PplH8iMDWpKINl5OUpZ
         8hmgrcY+Of0Na+5ixUQpxukmUGj/PjT81r0ORZZ9Q3qp729hc2bjFXGg6lG8WiIwJLgY
         BXTFyjdU0OYKnf96dyfEFhLcUuyOqMrX8JdA7dggS75PXCaonkiiYdL0KPkMBekhSO3r
         fGBDydklQgWquijE40AJNZYKzxBYZbGfGmzCd1baiAKq3/jHAUstW/yDw1rIeInVyuZE
         50Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601608; x=1775206408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3LJrHuND8=;
        b=R4dzEHh5pdorE2MBFIshfSObQwclwmRT0Gf4I7KEP9/YsDIOa28mc7OI+taPz4t2I/
         xciUW9e9x2LjKCx0PqBzBblUSfLMB1qYptpGgyL0TLEzhDy4RbFP4XaF3ocRElUlY+sm
         N6qdh4dKxgRWk0qoLEzHR5QWrYDdBhtL6Qs8+n78lrA3e6z2xkZfkiLsyq1IV5OhJRvm
         clvjVowuNZMLPNFXiAbO+RbAnPktBpGdqX57DqtsSxSF0A7mwZU3z2OlWELXbtwhcv8h
         4+gQAi9Lm6CPgr4P3Ek1gn1Iq3UIWw4px1uNZ0i2rxz1ESKHaSIiSh0snG0HBUdaDgsM
         8SWA==
X-Gm-Message-State: AOJu0Yx7xDm3ni4KHlvAF4RfeSFBHcBh9R54Ltgzw1Q9AmYGAfoNwP/u
	BO/IqJtRtoZEKThXDl2Uwsnb7rLUiEdWil2+Hlh4WiXyzHtRwHheZkb8vR/miansOXbq0w0zLep
	Ag/nFGIFC7QQuUsSQWzpysic3L2rzgNweLAnlx0miyQYTnw9+FRNYagEG+r7rwD194EBz
X-Gm-Gg: ATEYQzzcA315TC4ztNtCxdH602VIETOoWfoba1csOrlO6IPUD5s5Oe76tsH1B/Iv0W1
	XXxga7dLN5fPpTMGO63usSjkVf+Y7yh291pPGI6pasWi62VbLA3ZE0qx9wjWykSmigADqTqU+jx
	2R/g6bsptf5nai850+KLOJMhWag81W5ohAoj0H3M1E5gDhzacEf/cKMkhUusl/RxdunWd/UyAfP
	ztAgZmrt+LXU9zJMGpIwvexk7p5tQX3queVbjfqVGuMS0UBNSinyt8VcAgedxmwxkEF2hZyHsrH
	8rUcuMq9QSRgmh0M4wZ/0ASZjnT6JnTVv/TXDGf+/PwReg5hYgIkk76D6KCT4WnAOpSc73FbN5u
	xmcTTgNRurbEkzwc1d03n6996qdEAW+aEb3RYmxaAw+13
X-Received: by 2002:a05:6a00:99e:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-82c969c042fmr1498113b3a.23.1774601607680;
        Fri, 27 Mar 2026 01:53:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:99e:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-82c969c042fmr1498091b3a.23.1774601607203;
        Fri, 27 Mar 2026 01:53:27 -0700 (PDT)
Received: from cse-cd04-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c2714sm4862885b3a.48.2026.03.27.01.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:53:26 -0700 (PDT)
From: Xueyao An <xueyao.an@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to QUPv3 nodes
Date: Fri, 27 Mar 2026 16:53:17 +0800
Message-ID: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BhNxntoimaocV7eShaS_ZGqlvaqLpkUw
X-Proofpoint-GUID: BhNxntoimaocV7eShaS_ZGqlvaqLpkUw
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c64588 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8rlZebuS5uYMG-XfLoEA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NSBTYWx0ZWRfX6PKK59ntKWsb
 i3VkRb8UG4o8KKovOg6xNagU5CfJ7d3mNUdMZz80S+9eYWHzEqj0VXbq3TAFcHjfR8GfbIBn5HC
 LOyb5g/D8SpCBYeLiFIJJ5hj6eebBpTm1KgKk8gf/y0WQSJQbPSMFGH1kuoo6Fa6+w3i7KwxGbN
 dZ/FfqFqlomTzUsfLVGlkBbfZFiZyzKX+4N8RfBuBvqKJOJR9zukIbgu281Y9II66qMnLN63wEq
 /653te49bH5ydkucNeCsJgD2VyEcdDFP+OORW7d7TliqN+NPUOcds0egMoD+cY68VFmpiFgElvy
 QD2IZviuAymXyAydbJrf10DCeMPzSnj2qKFDOfy/n66xzEX7kMkcoLGoxu4eawbAWL8/BICwple
 1arvNBAESzii6uc9UmbrCEbL4/8GxIxm2N2GVr2Sfxp4XPGVeDJHOT3rjLt5gcfXRdeYa7ZBPKF
 0aP2jd0pyKy1eHjMo2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270065
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100225-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueyao.an@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E83AB341648
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
ensures secure SE assignment and access control, it limits flexibility for
developers who need to enable various protocols on different SEs.

Add the firmware-name property to QUPv3 nodes in the device tree to enable
firmware loading from the Linux environment. Handle SE assignments and
access control permissions directly within Linux, removing the dependency
on TrustZone.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 1a9e930c0496..c26eaf187b17 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -458,14 +458,20 @@ &pcie6a_phy {
 };
 
 &qupv3_0 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_1 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_2 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
-- 
2.34.1


