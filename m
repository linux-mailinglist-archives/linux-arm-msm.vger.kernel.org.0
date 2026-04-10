Return-Path: <linux-arm-msm+bounces-102581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJYeEDt82GlMdwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:27:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFAA3D20F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E487304AAEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 04:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2502C331203;
	Fri, 10 Apr 2026 04:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNGESM0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzGVhMz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85B32D7FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795164; cv=none; b=QSEVegm4fFjfMSTDHFZX2PF8lnH5Ow2vAU2Tl9VGPqmIfDKIzAy/2OvOlPFNxvqBz6X54snsYLQmuBMxlsn1oVWXyBoYgB5o/mh5jOZwo+GZwU1NEYFJ5dufsaay/AFZtVR89WD/4swVpG6Y7wO89E5KDoJILjJ/gWehui2bR6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795164; c=relaxed/simple;
	bh=OFlD0CNHiTWymknInPV4aoNoC5dQ2ndLdsm4YJ/WjCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYz49cf56KfIABhMiIcQ2mBsQwjp2/nSaGoLWOSbEghalT3fjBfjv6Cy6FF6L7cMWv3uzMH5pnQsX7w33zrVvi63GPEHVaxKNOnmzpB7lHpPST1lYQFKQB+JGpzOrnC4ekD9FFWtyEynW9JxsnL5XlZHQ9vKc5uW123mZ7ad9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNGESM0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzGVhMz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KbiGX1433097
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kE725DW456+RQ35RZqwFwgfertFJcDGTdv42ukOXMh8=; b=TNGESM0QoDoHD9Vz
	dE7sqhwrRWhtoOh/GkskIs2SqXkMc6yin/GBQfPiOeF+bieHLdgk5NhFKDAtFH3y
	TeWI7NNUQKFeDjK4oZt3pkJdhytCiWCNkem/w3uVvxmjdfr11wfqzK77DcoQx3SS
	royWFP1CIA2aEFGIeQGrWiXg4MbTJO/ccd5gF9XHOXK3sJuxXynQz8zxUrX17Ar9
	hGbJ1+qBECiG0S8PGfcRdX/SEpx+32iNiewzMXxU1Fu+qdNr/jj9BByPz6pL7p3q
	zsSPIZKMF+WPQP3nL88wTZDRLgun6nZWD2CS6P8bD9eSHjx0T07jl8axXjTc9bOJ
	OQMsAw==
Received: from mail-qk1-f166.google.com (mail-qk1-f166.google.com [209.85.222.166])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfappw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:26:01 +0000 (GMT)
Received: by mail-qk1-f166.google.com with SMTP id af79cd13be357-8cfc8e7f987so251646385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795161; x=1776399961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kE725DW456+RQ35RZqwFwgfertFJcDGTdv42ukOXMh8=;
        b=TzGVhMz4j5UrrttPSSnhDcKuYGN/ttXDsUvKjc2j4PrBkcj+Y0RTkTHTTCNjT8IVft
         FMksTHwvSpDJ1nGzdVik6yKfw52TAtIjtuv0Xe6Qk//efIgB+sZE2cnSFuH26hqh2OZC
         SxZUcEsxyQngIm8Ygi0o98TWSDIyB/aUgDZn8vF6uVdhHflMn3meuZWdybDL3aXUdkHS
         be1jYuRE6IdDhJfr8tMqQqGzcZ/JmP2slVqWYh0laaLfb3SXYeW3N1GOR03NZcLqQJ64
         A43jcrq/z0CvIrq5hAR05i+gHGkgsW2lsxgUZ+JpJ1+i0T0u2hoJRFUEYA41kRrFfKr8
         PRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795161; x=1776399961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kE725DW456+RQ35RZqwFwgfertFJcDGTdv42ukOXMh8=;
        b=oKfTUV3YlC6dpnLY+JrwUqqdpDJE8+/fxuJ4exq9h9r8TWcI0KaoGwPmGlyz2p0JXi
         w7dJQcsAkaLTSDzXqlJavgHhQSLnw3tBIWdq+FUTnnNrUM0Ysk4S2AALbd7NbAZ+iXTH
         dBbpw+Rmr9QV3mvj0Gv0mnFQm2OYpm7c2omra1WDI2jk9hM/j5DmxyT9hBOjvH8svNVv
         Rm0aU3FBXwJSvFs28o7iwDVOMgnO/dECvkP4930RriCPnVGEHcoaX1suwiJptWuFA2cT
         Ybgay5X3wNE4Jw0DUYCFO3W/r1E71nA/DJj9Wsu8wpyaTrd4yiZoY31RYTIpV9DmphL5
         GxLg==
X-Forwarded-Encrypted: i=1; AJvYcCWag98SwTadl0De81rPosbW/rgSOY71DA0+KyYZuBzwakj6duUIHLH2d60zpIezMArDFGPYJ8fQtDmsLYd5@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMr1QeAABzb9RrwsGWTrtqY5m5shwjAL8OXR1lxzhoeH314oy
	M2CUoM5Z1/5ALpgxo20eLK+o2+elcQQpof/JqbAb65fce7KrwRX+XJcbt8NjTfyVYm/ddVO+KEe
	wyDVtGwYsfcE9oicdUZ2xswn39pre4oepzg4liiY7w/SLIUIFUSb0jTT1bk9VGRxfTkgf
X-Gm-Gg: AeBDiesyR9cPcGEbLIGivdPu9J+DdJHYKl07+JvOXNQ0LAP6ErGTtp1Sq/WQi0CcWj+
	hEAWZolzPjqPUT0nU+2zwp4nomiYwx3HiItbOJOWpWo6oK2C8AEW3iYOPvUfd52MVYMH0DcRyns
	NcDoKmPy1Pzyvr5sQ8D1jY6aRF7e2PWYzjkvoQsc8+BCLDyH6RrCJu7HAK1WOnjkxzM7Uqkv11q
	xDrJGY5e6sZIxeJcflOvW4qyc6fmXcuLklyw3uXluC4eRX9X3ZUFtDZkOO6mVoV/7yQ4lnG78OA
	RB2CGJVAEDEo8V2uVYxNAO/GTcv5Dyzhj5PwSDL3UGYzswqJGFwURA1fQ0cFbf6iq8Ley39FLNk
	ghuXZFsTFyXH24qWZyaI/hSbPckYMUcIvowcDuMzwZGxLXDnnDfuHY27AAt4PgHRWc7z3zx42Yc
	tgs4RVkOxZMMd1
X-Received: by 2002:a05:620a:2586:b0:8cd:7b0d:a6a5 with SMTP id af79cd13be357-8ddcd9ebb68mr213407485a.19.1775795161150;
        Thu, 09 Apr 2026 21:26:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8cd:7b0d:a6a5 with SMTP id af79cd13be357-8ddcd9ebb68mr213404985a.19.1775795160617;
        Thu, 09 Apr 2026 21:26:00 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:26:00 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:25:33 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: purwa: Add camss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-purwa_camss-v1-3-eedcf6d9d8ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=5134;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=OFlD0CNHiTWymknInPV4aoNoC5dQ2ndLdsm4YJ/WjCQ=;
 b=esYwwscgi0E449fIvLdezEr1Tctyt0sg3PFJNJqMmOtrC6pbtGvM8yslAVG5Zd1bBj9/BxfYz
 yQRkm0InTyoCErbka+gypmRHXEJl2cy+JImCIihUf78BPDE3guAhaIQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d87bd9 cx=c_pps
 a=nfVB5hPd1485yofV/mQ5vQ==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Y4Anj9vvmeP-TaeWApIA:9 a=QEXdDO2ut3YA:10
 a=p5TrfPBG3YVFkAorjflA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfXxG2KaXZ5X7Wr
 3+01cj8RGWi+WZYIBcHJ9KcXVJKy/lIDXtgH6u5FZ6omrlWWxABX1OPIkg0We9xXaRE92jpS0lq
 DF3B5URz4qEL4o4qExFUfCLnTNxz+vaKQKAga5gfCE1/PVSmlbvfYG8sFlVLkxPiy23oRBx63GD
 fEx6eHfzMtbeZGulge/5piRMhgAj8vziFcyXqkbbaT6cB1xP87z0HGWRnRnl/k9xvw2oJfWACa9
 7NhFd2SMxAZL94iOT4HRNh0fjBG5uRNXYq9X3ZbVIMM64Rh0jH2mHt/786phRZ9L7M95FaOR2Ev
 qx2CEkE+TIf9hkM8xPHeWplEBWORaJhjUPr+ByiTSBFsYT6Tq2ajnqdSxA86ytXYTwZy1vndU1K
 B3DkwvFXH5fk+bKFRBokhauyKbiStk5a0G6C8FoUP5yGzgReXZYiFdmMHzmLHmEljLYN3nxujuN
 AJ38kWtMLLiAboZMxIA==
X-Proofpoint-ORIG-GUID: RwYeKazOS6PFF3Yb8-r7bPGV5b2Bzwph
X-Proofpoint-GUID: RwYeKazOS6PFF3Yb8-r7bPGV5b2Bzwph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100038
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102581-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.3:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.886];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CFAA3D20F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add node for the X1P42100 camera subsystem.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 158 ++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index ea65b8448836ead83f837e973ed536e8ea0ed8ef..ff7b0dd781e9fdea2cec5a918772e4b2ff6f53a7 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -19,6 +19,8 @@
 /delete-node/ &cpu_pd9;
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
+/delete-node/ &csiphy1;
+/delete-node/ &csiphy2;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
 /delete-node/ &pcie3_phy;
@@ -38,6 +40,162 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camss {
+	compatible = "qcom,x1p42100-camss";
+
+	reg = <0 0x0acb7000 0 0x2000>,
+	      <0 0x0acb9000 0 0x2000>,
+	      <0 0x0acbb000 0 0x2000>,
+	      <0 0x0acc6000 0 0x1000>,
+	      <0 0x0acca000 0 0x1000>,
+	      <0 0x0acb6000 0 0x1000>,
+	      <0 0x0ace4000 0 0x1000>,
+	      <0 0x0acec000 0 0x4000>,
+	      <0 0x0acf6000 0 0x1000>,
+	      <0 0x0acf7000 0 0x1000>,
+	      <0 0x0acf8000 0 0x1000>,
+	      <0 0x0ac62000 0 0x4000>,
+	      <0 0x0acc7000 0 0x2000>,
+	      <0 0x0accb000 0 0x2000>;
+
+	reg-names = "csid0",
+		    "csid1",
+		    "csid2",
+		    "csid_lite0",
+		    "csid_lite1",
+		    "csid_wrapper",
+		    "csiphy0",
+		    "csiphy4",
+		    "csitpg0",
+		    "csitpg1",
+		    "csitpg2",
+		    "vfe0",
+		    "vfe_lite0",
+		    "vfe_lite1";
+
+	interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+	interrupt-names = "csid0",
+			  "csid1",
+			  "csid2",
+			  "csid_lite0",
+			  "csid_lite1",
+			  "csiphy0",
+			  "csiphy4",
+			  "vfe0",
+			  "vfe_lite0",
+			  "vfe_lite1";
+
+	clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+		 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+		 <&camcc CAM_CC_CORE_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+		 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+		 <&camcc CAM_CC_CSID_CLK>,
+		 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+		 <&camcc CAM_CC_CSIPHY0_CLK>,
+		 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+		 <&camcc CAM_CC_CSIPHY4_CLK>,
+		 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+		 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+		 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+		 <&camcc CAM_CC_IFE_0_CLK>,
+		 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+	clock-names = "camnoc_nrt_axi",
+		      "camnoc_rt_axi",
+		      "core_ahb",
+		      "cpas_ahb",
+		      "cpas_fast_ahb",
+		      "cpas_vfe0",
+		      "cpas_vfe_lite",
+		      "cphy_rx_clk_src",
+		      "csid",
+		      "csid_csiphy_rx",
+		      "csiphy0",
+		      "csiphy0_timer",
+		      "csiphy4",
+		      "csiphy4_timer",
+		      "gcc_axi_hf",
+		      "gcc_axi_sf",
+		      "vfe0",
+		      "vfe0_fast_ahb",
+		      "vfe_lite",
+		      "vfe_lite_ahb",
+		      "vfe_lite_cphy_rx",
+		      "vfe_lite_csid";
+
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "ahb",
+			     "hf_mnoc",
+			     "sf_mnoc",
+			     "sf_icp_mnoc";
+
+	iommus = <&apps_smmu 0x800 0x60>,
+		 <&apps_smmu 0x860 0x60>,
+		 <&apps_smmu 0x1860 0x60>,
+		 <&apps_smmu 0x18e0 0x00>,
+		 <&apps_smmu 0x19a0 0x20>;
+
+	power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+			<&camcc CAM_CC_TITAN_TOP_GDSC>;
+	power-domain-names = "ife0",
+			     "top";
+
+	phys = <&csiphy0 PHY_TYPE_DPHY>,
+	       <&csiphy4 PHY_TYPE_DPHY>;
+	phy-names = "csiphy0",
+		    "csiphy4";
+
+	status = "disabled";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			camss_csiphy0_inep0: endpoint@0 {
+				reg = <0>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			camss_csiphy4_inep0: endpoint@0 {
+				reg = <0>;
+			};
+		};
+	};
+};
+
 &camcc {
 	compatible = "qcom,x1p42100-camcc";
 };

-- 
2.34.1


