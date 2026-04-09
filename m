Return-Path: <linux-arm-msm+bounces-102461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHbaG6pv12k5OAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:21:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED13C8638
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 216A230EED91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73753B3BF3;
	Thu,  9 Apr 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8qQDFFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4zHcpLA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3BB3AD510
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725958; cv=none; b=OWYVd4VHPEgjuLf/9rJ0L0YGayShPRZOj3to+Mg9yDgc94DbX9vMipjaF+AyT2WSUN5y5fFBBshq3UJ+rLoZbHBKJQJl5YPUJ0QMHVa2BbWcSsjAFZ24uzGziEzDporWCJOenDagZNNJvzOrFvwgnwSbjtpVDmPjH88wEqY/yGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725958; c=relaxed/simple;
	bh=nvhoyXhZC8ff9sl9TVPW+J48HMwpI/HeSMbvlvuGylQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jk8Z1Lhpml4WGjc7gVcMBTkH/NiUQ27aiOJQwQdLniHmkvfq1SBVFS9lP8sgWJaGsMB9/Cl9lp6krKqVW1w0Oq0jjz/ApY8cIE2IG9e48bapUYU355MQeDIuWkH5xoE5oIl1iOgldTe7d2iWN7mt6MFRhqjvsbDFPgYym36kfBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8qQDFFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4zHcpLA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395DrtF257399
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2pjlLX8ap2x
	m/xNGHvMK1k3NItA66EQGLnidFLCG7fw=; b=l8qQDFFdAoGs9NZSQ1SUTadX++M
	wEMWsn3FMb0kIm8bN3YE+2zR7761J2qKWTVxOr/UvFQsLIKElw3cnUaAgjGoDZYg
	+N2He7HpCS2dlM7fGrwsYphBU40DFw54RG+ImDATEb7cLbuNWbWkvNPCbcrc7Nag
	o6QLUAypzKvIbbtWgmShyJD2GoCuq+4SgtuadZzuuxhq1b3uT7SHABA3ZS5YvoOW
	0DjFEeUtn3SzVuTNYAj/tKQOSnQQM+iczM52B1Fr9FhPbUJ3tdBoBaYumOnJBBYQ
	JixRMV50TFYH/BZfTrMJnmJsobvudU5t9Mhqkue3fUKWdYU5TB+RS5d4bHw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6ybae2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:12:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so1983559eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725926; x=1776330726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pjlLX8ap2xm/xNGHvMK1k3NItA66EQGLnidFLCG7fw=;
        b=b4zHcpLArlrwiuEtw8wwKZ3zabKFYsrn7dfkieL7ZxLg4WLlY9XSOAOuoY7c+M0+uG
         lOcT99nopBTEINkhj/bhIt1MeQiBxb8FoyLQZ7enf/Zf6vUli9RlwnweGxgJU4GkTkxH
         snC5pILVWEeqM+sp4puq/h89xYEu0nC7y06MKwHfoxeYrk2g/4flOrFjX/hGkTV23pVL
         4GrOoifEa0h68SmTDtdTr2UZfIf9KGUKcYewXM6Ll8agkNI5MOry+bc2Wb/CT6hqiQvO
         uFWMrKMgfBSymSom7AtJOJcpQQdzLGk++s3Fn/Ma3ijCL/3LeMOVsMKH+zKto8qHpOKc
         5XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725926; x=1776330726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pjlLX8ap2xm/xNGHvMK1k3NItA66EQGLnidFLCG7fw=;
        b=StyIauFQ5O6OIyXtJdQctCABb9XgkxkLeWE0GKNWkNzrlt+GNx2C0WmoIHEwZZZoJJ
         ues3V+DyUbKUvtnk3ycwgj7FNs37L9eh2pubU+mEyqLrHrWfRnrUtsH/U2KnVwrOL0Yx
         urz+APNfLMi2S/46TPCYUafJwGZUPD5kiN9vId6inSLCEmYLlhYoX06K95ZHUOGlhIdf
         f6T7QwNMNAXKK9f6+UWsjQPfFWIkL0tBmUkGcztpVfGwE+8h0O1cSBbSv53DVjqN1l00
         K03rsvhPjx59qNmHMH6P3aGY1L8nrOy/V9zT6dPFtvBtXz05lW1kCESTZqvsfrjtEevF
         nv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKld0/DjHMbfrW28tZURJUrnbcWdkcASelZPUWa/Vk+I9o2KlxEyOLNlIIOILbIRMwxSm3S8cEsW678RcF@vger.kernel.org
X-Gm-Message-State: AOJu0YyNyFumNCC27syfyaMJg4o+mtHzBGIui9r0nmjI5s0mfDPGJOdG
	K3SX8aTNSZ109e4rgyt6/lP8IetPozpqo5eK65pU3Ph9LjcSeDXZ2XNnAHYjOwQhr1iEoUttSxl
	QepNEn5rtrqNqpNUYAj2boVMwQDe0BzzfJY6VZW7qktz4RkDPdPAu2P3PI5Vz5cr9lWAdRm6uMT
	+P
X-Gm-Gg: AeBDieud1ou5z2D/SIzUvAQuNLwfAXm1QTmeY+R93oLSGNq7sSeq8d8F43MEIhciHIj
	RIfYGN5DVl4OufBdFgmJGKjknNqtRbj4WGGILhpxPtRh7pl2AhC7xuPUvDpCWq2evHcMXIDee7f
	Z3Jy1J72IZvKOtaZK0e9LvGFgMyUo+mJZHyKGh0+6LCIOEFwvLhZIj8dPABHoxIhfwbVfV/GQwQ
	cOAYPQIpk/hOc/fZa/P47ne6dBiQQoJ19hpRQI96nszbI5Xpbtz6vyrCjYPcvs1IyW79Wa4JO3j
	go63sX8mExsx0v8rJ1uV4oXNUD2t8mf7tNu7vgO0NVamXu5DWU699ggR1BdL9STBHccnagW8P++
	z+LK3alYhRvhRm9QWRMLeoUnxzxM5lnYnjSV/Ta1Jp9MTvazms2H5h2jjC6lOrhLxHNK/wE1jZN
	cUGQDrAw==
X-Received: by 2002:a05:7301:7c0b:b0:2d4:afb3:7aeb with SMTP id 5a478bee46e88-2d4afb37de0mr541851eec.27.1775725924398;
        Thu, 09 Apr 2026 02:12:04 -0700 (PDT)
X-Received: by 2002:a05:7301:7c0b:b0:2d4:afb3:7aeb with SMTP id 5a478bee46e88-2d4afb37de0mr541815eec.27.1775725923180;
        Thu, 09 Apr 2026 02:12:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/8] arm64: dts: qcom: lemans: Move platform resources into lemans-iq9.dtsi
Date: Thu,  9 Apr 2026 17:10:57 +0800
Message-ID: <20260409091100.474358-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ar9OM7GSCU5JJ7YB96ODKWjWAE2ZMCQZ
X-Proofpoint-GUID: Ar9OM7GSCU5JJ7YB96ODKWjWAE2ZMCQZ
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d76d66 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=afSGG1qtvitiuWp1rUoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX6hj7REO0wK1+
 ZJpRG+mQ/BlmkRYQuNfa7NSG8vHk3E7qgnzjPp34ZKDdleJ7sPOF3W2EO0V5E0mU6bRC3uObY66
 JfH8bi+adZVZ9TyYwMIxdGVIBRz8K/QP3SBb3ZRCCUTGbz0TUEkIULD7XHExtFM9Y3x2ffbbEpa
 /o4sKinp1tMBQYVmlP7aW+jdevnHPQ6Dt4lstNtri/Q4NSG2bvqeexLJ57gs+OFv8Qe3RTktAjW
 vUzVtSLubdBYnCh2r5k8ohSHXQ5qyfLOeDwdex8wbcDKprrjfow84SXXGnYf5nx1SHebYXtEB/I
 ickCmPy0xVNKq8MVP0cl0vYG8O8zP/ote2w2+admLGbzcBWjEk5XwhZcdLqXKwA1UPXN3lqMPpv
 fZqQi+Z3TFhxa+kf2RPA5uOHg0eENbNheRRQw8HaMgpLE12MIMDXe0Nls+uyGBBexBDA2LYmtvk
 q2Pya9Zbnq3mcEzTAqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090081
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102461-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37ED13C8638
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Devicetree lemans-iq9.dtsi was created for Lemans variant where platform
resource like clocks, regulator, interconnects, pinctrls and PHYs are
managed by Linux.  Move them from lemans.dtsi to lemans-iq9.dtsi, so that
lemans.dtsi could be used by SCMI variant SoCs.

ICE, GMU and PMU are completely moved to lemans-iq9.dtsi, as they do not
seem to be used by SCMI variant.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi | 2893 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi     | 2603 -------------------
 2 files changed, 2893 insertions(+), 2603 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
index 5c2aa83fe8b4..68e211555909 100644
--- a/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
@@ -3,10 +3,2661 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
+#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
 #include "lemans.dtsi"
 
 / {
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		cpu0: cpu@0 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+		};
+
+		cpu1: cpu@100 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+		};
+
+		cpu2: cpu@200 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+		};
+
+		cpu3: cpu@300 {
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
+		};
+
+		cpu4: cpu@10000 {
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+		};
+
+		cpu5: cpu@10100 {
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+		};
+
+		cpu6: cpu@10200 {
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+		};
+
+		cpu7: cpu@10300 {
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
+		};
+	};
+
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1862400000 {
+			opp-hz = /bits/ 64 <1862400000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2361600000 {
+			opp-hz = /bits/ 64 <2361600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2457600000 {
+			opp-hz = /bits/ 64 <2457600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
+		};
+	};
+
+	cpu4_opp_table: opp-table-cpu4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
+		};
+
+		opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1862400000 {
+			opp-hz = /bits/ 64 <1862400000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
+		};
+
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
+		};
+
+		opp-2361600000 {
+			opp-hz = /bits/ 64 <2361600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2457600000 {
+			opp-hz = /bits/ 64 <2457600000>;
+			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
+		};
+
+		opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
+		};
+	};
+
+	clk_virt: interconnect-clk-virt {
+		compatible = "qcom,sa8775p-clk-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-mc-virt {
+		compatible = "qcom,sa8775p-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	qup_opp_table_100mhz: opp-table-qup100mhz {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+	};
+
 	soc: soc@0 {
+		gcc: clock-controller@100000 {
+			compatible = "qcom,sa8775p-gcc";
+			reg = <0x0 0x00100000 0x0 0xc7018>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&usb_0_qmpphy>,
+				 <&usb_1_qmpphy>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&pcie0_phy>,
+				 <&pcie1_phy>,
+				 <0>,
+				 <0>,
+				 <0>;
+			power-domains = <&rpmhpd SA8775P_CX>;
+		};
+
+		qupv3_id_2: geniqup@8c0000 {
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+
+			i2c14: i2c@880000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c14_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi14: spi@880000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi14_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart14: serial@880000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart14_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c15: i2c@884000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c15_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi15: spi@884000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi15_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart15: serial@884000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart15_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c16: i2c@888000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c16_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi16: spi@888000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi16_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart16: serial@888000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart16_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c17: i2c@88c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c17_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi17: spi@88c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi17_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart17: serial@88c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart17_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c18: i2c@890000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c18_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi18: spi@890000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi18_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart18: serial@890000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart18_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c19: i2c@894000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c19_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi19: spi@894000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi19_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart19: serial@894000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart19_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c20: i2c@898000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c20_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi20: spi@898000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi20_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart20: serial@898000 {
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart20_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+		};
+
+		qupv3_id_0: geniqup@9c0000 {
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				<&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+
+			i2c0: i2c@980000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c0_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi0: spi@980000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi0_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart0: serial@980000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart0_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c1: i2c@984000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c1_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi1: spi@984000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi1_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart1: serial@984000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart1_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c2: i2c@988000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c2_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi2: spi@988000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi2_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart2: serial@988000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart2_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c3: i2c@98c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c3_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi3: spi@98c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi3_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart3: serial@98c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart3_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c4: i2c@990000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c4_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi4: spi@990000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi4_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart4: serial@990000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart4_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c5: i2c@994000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c5_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi5: spi@994000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi5_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart5: serial@994000 {
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart5_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+		};
+
+		qupv3_id_1: geniqup@ac0000 {
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+
+			i2c7: i2c@a80000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c7_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi7: spi@a80000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi7_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart7: serial@a80000 {
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-0 = <&qup_uart7_default>;
+				pinctrl-names = "default";
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+			};
+
+			i2c8: i2c@a84000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c8_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi8: spi@a84000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi8_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart8: serial@a84000 {
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-0 = <&qup_uart8_default>;
+				pinctrl-names = "default";
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+			};
+
+			i2c9: i2c@a88000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c9_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi9: spi@a88000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi9_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart9: serial@a88000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart9_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c10: i2c@a8c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c10_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi10: spi@a8c000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi10_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart10: serial@a8c000 {
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-0 = <&qup_uart10_default>;
+				pinctrl-names = "default";
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0
+						 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0
+						 &config_noc SLAVE_QUP_1 0>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+			};
+
+			i2c11: i2c@a90000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c11_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi11: spi@a90000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi11_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart11: serial@a90000 {
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-0 = <&qup_uart11_default>;
+				pinctrl-names = "default";
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+			};
+
+			i2c12: i2c@a94000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c12_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi12: spi@a94000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi12_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart12: serial@a94000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart12_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			i2c13: i2c@a98000 {
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c13_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+		};
+
+		qupv3_id_3: geniqup@bc0000 {
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
+
+			i2c21: i2c@b80000 {
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c21_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
+					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+							 "qup-config",
+							 "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			spi21: spi@b80000 {
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi21_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
+					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+							 "qup-config",
+							 "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+			};
+
+			uart21: serial@b80000 {
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				interconnect-names = "qup-core", "qup-config";
+				pinctrl-0 = <&qup_uart21_default>;
+				pinctrl-names = "default";
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+			};
+		};
+
+		config_noc: interconnect@14c0000 {
+			compatible = "qcom,sa8775p-config-noc";
+			reg = <0x0 0x014c0000 0x0 0x13080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1680000 {
+			compatible = "qcom,sa8775p-system-noc";
+			reg = <0x0 0x01680000 0x0 0x15080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16c0000 {
+			compatible = "qcom,sa8775p-aggre1-noc";
+			reg = <0x0 0x016c0000 0x0 0x18080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,sa8775p-aggre2-noc";
+			reg = <0x0 0x01700000 0x0 0x1b080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_CARD_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
+		};
+
+		pcie_anoc: interconnect@1760000 {
+			compatible = "qcom,sa8775p-pcie-anoc";
+			reg = <0x0 0x01760000 0x0 0xc080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gpdsp_anoc: interconnect@1780000 {
+			compatible = "qcom,sa8775p-gpdsp-anoc";
+			reg = <0x0 0x01780000 0x0 0xe080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@17a0000 {
+			compatible = "qcom,sa8775p-mmss-noc";
+			reg = <0x0 0x017a0000 0x0 0x40000>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		pcie0: pcie@1c00000 {
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_0_GDSC>;
+
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+		};
+
+		pcie0_ep: pcie-ep@1c00000 {
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "core";
+
+			power-domains = <&gcc PCIE_0_GDSC>;
+
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+		};
+
+		pcie0_phy: phy@1c04000 {
+			compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
+			reg = <0x0 0x1c04000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>,
+				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie1: pcie@1c10000 {
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_1_BCR>,
+				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_1_GDSC>;
+
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+		};
+
+		pcie1_ep: pcie-ep@1c10000 {
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+
+			power-domains = <&gcc PCIE_1_GDSC>;
+
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+		};
+
+		pcie1_phy: phy@1c14000 {
+			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			reg = <0x0 0x1c14000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>,
+				 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+			power-domains = <&gcc UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+			freq-table-hz = <75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<0 0>,
+					<0 0>;
+			qcom,ice = <&ice>;
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sa8775p-qmp-ufs-phy";
+			reg = <0x0 0x01d87000 0x0 0xe10>;
+			/*
+			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
+			 * enables the CXO clock to eDP *and* UFS PHY.
+			 */
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_EDP_REF_CLKREF_EN>;
+			clock-names = "ref", "ref_aux", "qref";
+			power-domains = <&gcc UFS_PHY_GDSC>;
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		ice: crypto@1d88000 {
+			compatible = "qcom,sa8775p-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
+		crypto: crypto@1dfa000 {
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
+		lpass_ag_noc: interconnect@3c40000 {
+			compatible = "qcom,sa8775p-lpass-ag-noc";
+			reg = <0x0 0x03c40000 0x0 0x17200>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		sdhc: mmc@87c4000 {
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDC1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			operating-points-v2 = <&sdhc_opp_table>;
+			power-domains = <&rpmhpd SA8775P_CX>;
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			sdhc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1800000 400000>;
+					opp-avg-kBps = <100000 0>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <390000 0>;
+				};
+			};
+		};
+
+		usb_0_hsphy: phy@88e4000 {
+			compatible = "qcom,sa8775p-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e4000 0 0x120>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+			resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_1_hsphy: phy@88e6000 {
+			compatible = "qcom,sa8775p-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e6000 0 0x120>;
+			clocks = <&gcc GCC_USB_CLKREF_EN>;
+			clock-names = "ref";
+			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy: phy@88e7000 {
+			compatible = "qcom,sa8775p-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e7000 0 0x120>;
+			clocks = <&gcc GCC_USB_CLKREF_EN>;
+			clock-names = "ref";
+			resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_0_qmpphy: phy@88e8000 {
+			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
+			reg = <0 0x088e8000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&gcc GCC_USB_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux", "ref", "com_aux", "pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb3_prim_phy_pipe_clk_src";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_1_qmpphy: phy@88ea000 {
+			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
+			reg = <0 0x088ea000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
+				 <&gcc GCC_USB_CLKREF_EN>,
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux", "ref", "com_aux", "pipe";
+
+			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_SEC_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb3_sec_phy_pipe_clk_src";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		refgen: regulator@891c000 {
+			compatible = "qcom,sa8775p-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x0891c000 0x0 0x84>;
+		};
+
+		dc_noc: interconnect@90e0000 {
+			compatible = "qcom,sa8775p-dc-noc";
+			reg = <0x0 0x090e0000 0x0 0x5080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9100000 {
+			compatible = "qcom,sa8775p-gem-noc";
+			reg = <0x0 0x09100000 0x0 0xf6080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		usb_0: usb@a600000 {
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		usb_1: usb@a800000 {
+			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
+				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			power-domains = <&gcc USB30_SEC_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_SEC_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		usb_2: usb@a400000 {
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			power-domains = <&gcc USB20_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB20_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+
+		gpu: gpu@3d00000 {
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-405000000 {
+					opp-hz = /bits/ 64 <405000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-530000000 {
+					opp-hz = /bits/ 64 <530000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x2>;
+				};
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x1>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x34000>,
+			      <0x0 0x03de0000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+			iommus = <&adreno_smmu 5 0xc00>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sa8775p-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HUB_AON_CLK>;
+			clock-names = "gcc_gpu_memnoc_gfx_clk",
+				      "gcc_gpu_snoc_dvm_gfx_clk",
+				      "gpu_cc_ahb_clk",
+				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
+				      "gpu_cc_cx_gmu_clk",
+				      "gpu_cc_hub_cx_int_clk",
+				      "gpu_cc_hub_aon_clk";
+		};
+
+		serdes0: phy@8901000 {
+			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+			reg = <0x0 0x08901000 0x0 0xe10>;
+			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+			clock-names = "sgmi_ref";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		serdes1: phy@8902000 {
+			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+			reg = <0x0 0x08902000 0x0 0xe10>;
+			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+			clock-names = "sgmi_ref";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pmu@9091000 {
+			compatible = "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x9091000 0x0 0x1000>;
+			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&llcc_bwmon_opp_table>;
+
+			llcc_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <762000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <1720000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <2086000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <2601000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <2929000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <5931000>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <6515000>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <7984000>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <10437000>;
+				};
+
+				opp-9 {
+					opp-peak-kBps = <12195000>;
+				};
+			};
+		};
+
+		pmu@90b5400 {
+			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x90b5400 0x0 0x600>;
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <9155000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <12298000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <14236000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <16265000>;
+				};
+			};
+
+		};
+
+		pmu@90b6400 {
+			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x90b6400 0x0 0x600>;
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+		};
+
+		iris: video-codec@aa00000 {
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd SA8775P_MX>,
+					<&rpmhpd SA8775P_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		iris: video-codec@aa00000 {
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sa8775p-videocc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		cci0: cci@ac13000 {
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+
+		cci1: cci@ac14000 {
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@ac15000 {
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci3: cci@ac16000 {
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_3_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-0 = <&cci3_0_default &cci3_1_default>;
+			pinctrl-1 = <&cci3_0_sleep &cci3_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci3_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci3_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		camss: isp@ac78000 {
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_ICP_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb_clk",
+				      "cpas_vfe_lite",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "csid",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "icp_ahb",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sa8775p-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		mdss0: display-subsystem@ae00000 {
+			/* same path used twice */
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			mdss0_mdp: display-controller@ae01000 {
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdss0_mdp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				mdss0_mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi0: dsi@ae94000 {
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				phys = <&mdss0_dsi0_phy>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0x0 0x0ae94400 0x0 0x200>,
+				      <0x0 0x0ae94600 0x0 0x280>,
+				      <0x0 0x0ae94900 0x0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss0_dsi1: dsi@ae96000 {
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+				phys = <&mdss0_dsi1_phy>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				refgen-supply = <&refgen>;
+			};
+
+			mdss0_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0x0 0x0ae96400 0x0 0x200>,
+				      <0x0 0x0ae96600 0x0 0x280>,
+				      <0x0 0x0ae96900 0x0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss0_dp0_phy: phy@aec2a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x0aec2a00 0x0 0x200>,
+				      <0x0 0x0aec2200 0x0 0xd0>,
+				      <0x0 0x0aec2600 0x0 0xd0>,
+				      <0x0 0x0aec2000 0x0 0x1c8>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss0_dp1_phy: phy@aec5a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x0aec5a00 0x0 0x200>,
+				      <0x0 0x0aec5200 0x0 0xd0>,
+				      <0x0 0x0aec5600 0x0 0xd0>,
+				      <0x0 0x0aec5000 0x0 0x1c8>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss0_dp0: displayport-controller@af54000 {
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp0_phy 0>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>;
+				phys = <&mdss0_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss0_dp1: displayport-controller@af5c000 {
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp1_phy 0>,
+							 <&mdss0_dp1_phy 1>,
+							 <&mdss0_dp1_phy 1>;
+				phys = <&mdss0_dp1_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp1_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				dp1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+		};
+
+		dispcc0: clock-controller@af00000 {
+			compatible = "qcom,sa8775p-dispcc0";
+			reg = <0x0 0x0af00000 0x0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
+				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		tlmm: pinctrl@f000000 {
 			dp0_hot_plug_det: dp0-hot-plug-det-state {
 				pins = "gpio101";
@@ -814,5 +3465,247 @@ data-pins {
 				};
 			};
 		};
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+			      <0x0 0x18210000 0x0 0x10000>,
+			      <0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS 2>,
+					  <SLEEP_TCS 3>,
+					  <WAKE_TCS 3>,
+					  <CONTROL_TCS 0>;
+			label = "apps_rsc";
+			power-domains = <&system_pd>;
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sa8775p-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board_clk>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sa8775p-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp-0 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp-1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp-4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp-5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp-6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp-7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp-8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp-9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+		};
+
+		epss_l3_cl0: interconnect@18590000 {
+			compatible = "qcom,sa8775p-epss-l3",
+				     "qcom,epss-l3";
+			reg = <0x0 0x18590000 0x0 0x1000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
+		cpufreq_hw: cpufreq@18591000 {
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+		};
+
+		epss_l3_cl1: interconnect@18592000 {
+			compatible = "qcom,sa8775p-epss-l3",
+				     "qcom,epss-l3";
+			reg = <0x0 0x18592000 0x0 0x1000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
+		remoteproc_gpdsp0: remoteproc@20c00000 {
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>;
+			power-domain-names = "cx", "mxc";
+
+			interconnects = <&gpdsp_anoc MASTER_DSP0 0
+					 &config_noc SLAVE_CLK_CTL 0>;
+		};
+
+		remoteproc_gpdsp1: remoteproc@21c00000 {
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>;
+			power-domain-names = "cx", "mxc";
+
+			interconnects = <&gpdsp_anoc MASTER_DSP1 0
+					 &config_noc SLAVE_CLK_CTL 0>;
+		};
+
+		dispcc1: clock-controller@22100000 {
+			compatible = "qcom,sa8775p-dispcc1";
+			reg = <0x0 0x22100000 0x0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
+		ethernet1: ethernet@23000000 {
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC1_PTP_CLK>,
+				 <&gcc GCC_EMAC1_PHY_AUX_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "phyaux";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac",
+					     "mac-mem";
+
+			power-domains = <&gcc EMAC1_GDSC>;
+
+			phys = <&serdes1>;
+			phy-names = "serdes";
+		};
+
+		ethernet0: ethernet@23040000 {
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC0_PTP_CLK>,
+				 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "phyaux";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac",
+					     "mac-mem";
+
+			power-domains = <&gcc EMAC0_GDSC>;
+
+			phys = <&serdes0>;
+			phy-names = "serdes";
+		};
+
+		nspa_noc: interconnect@260c0000 {
+			compatible = "qcom,sa8775p-nspa-noc";
+			reg = <0x0 0x260c0000 0x0 0x16080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		remoteproc_cdsp0: remoteproc@26300000 {
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>,
+					<&rpmhpd SA8775P_NSP0>;
+			power-domain-names = "cx", "mxc", "nsp";
+
+			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
+					 &mc_virt SLAVE_EBI1 0>;
+		};
+
+		nspb_noc: interconnect@2a0c0000 {
+			compatible = "qcom,sa8775p-nspb-noc";
+			reg = <0x0 0x2a0c0000 0x0 0x16080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		remoteproc_cdsp1: remoteproc@2a300000 {
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>,
+					<&rpmhpd SA8775P_NSP1>;
+			power-domain-names = "cx", "mxc", "nsp";
+
+			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
+					 &mc_virt SLAVE_EBI1 0>;
+		};
+
+		remoteproc_adsp: remoteproc@30000000 {
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SA8775P_LCX>,
+					<&rpmhpd SA8775P_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fa2f20a7b11f..099754e3bdfa 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4,23 +4,11 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
-#include <dt-bindings/clock/qcom,rpmh.h>
-#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
-#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
-#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
-#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
-#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
-#include <dt-bindings/interconnect/qcom,osm-l3.h>
-#include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
-#include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -29,18 +17,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	clocks {
-		xo_board_clk: xo-board-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-		};
-
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-		};
-	};
-
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -57,11 +33,6 @@ cpu0: cpu@0 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -87,11 +58,6 @@ cpu1: cpu@100 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -112,11 +78,6 @@ cpu2: cpu@200 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_2: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -137,11 +98,6 @@ cpu3: cpu@300 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_3: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -162,11 +118,6 @@ cpu4: cpu@10000 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_4: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -193,11 +144,6 @@ cpu5: cpu@10100 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_5: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -218,11 +164,6 @@ cpu6: cpu@10200 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_6: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -243,11 +184,6 @@ cpu7: cpu@10300 {
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
-			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
-					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_7: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -337,176 +273,6 @@ cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
 		};
 	};
 
-	cpu0_opp_table: opp-table-cpu0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1267200000 {
-			opp-hz = /bits/ 64 <1267200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1363200000 {
-			opp-hz = /bits/ 64 <1363200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1459200000 {
-			opp-hz = /bits/ 64 <1459200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1536000000 {
-			opp-hz = /bits/ 64 <1536000000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1632000000 {
-			opp-hz = /bits/ 64 <1632000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1708800000 {
-			opp-hz = /bits/ 64 <1708800000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1785600000 {
-			opp-hz = /bits/ 64 <1785600000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1862400000 {
-			opp-hz = /bits/ 64 <1862400000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1939200000 {
-			opp-hz = /bits/ 64 <1939200000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2016000000 {
-			opp-hz = /bits/ 64 <2016000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2112000000 {
-			opp-hz = /bits/ 64 <2112000000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2188800000 {
-			opp-hz = /bits/ 64 <2188800000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2265600000 {
-			opp-hz = /bits/ 64 <2265600000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2361600000 {
-			opp-hz = /bits/ 64 <2361600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2457600000 {
-			opp-hz = /bits/ 64 <2457600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2553600000 {
-			opp-hz = /bits/ 64 <2553600000>;
-			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
-		};
-	};
-
-	cpu4_opp_table: opp-table-cpu4 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1267200000 {
-			opp-hz = /bits/ 64 <1267200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1363200000 {
-			opp-hz = /bits/ 64 <1363200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1459200000 {
-			opp-hz = /bits/ 64 <1459200000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1536000000 {
-			opp-hz = /bits/ 64 <1536000000>;
-			opp-peak-kBps = <(1555200 * 4) (921600 * 32)>;
-		};
-
-		opp-1632000000 {
-			opp-hz = /bits/ 64 <1632000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1708800000 {
-			opp-hz = /bits/ 64 <1708800000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1785600000 {
-			opp-hz = /bits/ 64 <1785600000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1862400000 {
-			opp-hz = /bits/ 64 <1862400000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-1939200000 {
-			opp-hz = /bits/ 64 <1939200000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2016000000 {
-			opp-hz = /bits/ 64 <2016000000>;
-			opp-peak-kBps = <(1708800 * 4) (1228800 * 32)>;
-		};
-
-		opp-2112000000 {
-			opp-hz = /bits/ 64 <2112000000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2188800000 {
-			opp-hz = /bits/ 64 <2188800000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2265600000 {
-			opp-hz = /bits/ 64 <2265600000>;
-			opp-peak-kBps = <(2092800 * 4) (1555200 * 32)>;
-		};
-
-		opp-2361600000 {
-			opp-hz = /bits/ 64 <2361600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2457600000 {
-			opp-hz = /bits/ 64 <2457600000>;
-			opp-peak-kBps = <(3196800 * 4) (1612800 * 32)>;
-		};
-
-		opp-2553600000 {
-			opp-hz = /bits/ 64 <2553600000>;
-			opp-peak-kBps = <(3196800 * 4) (1708800 * 32)>;
-		};
-	};
-
 	dummy-sink {
 		compatible = "arm,coresight-dummy-sink";
 
@@ -527,33 +293,12 @@ scm {
 		};
 	};
 
-	clk_virt: interconnect-clk-virt {
-		compatible = "qcom,sa8775p-clk-virt";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	mc_virt: interconnect-mc-virt {
-		compatible = "qcom,sa8775p-mc-virt";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
 	/* Will be updated by the bootloader. */
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
-	qup_opp_table_100mhz: opp-table-qup100mhz {
-		compatible = "operating-points-v2";
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			required-opps = <&rpmhpd_opp_svs_l1>;
-		};
-	};
-
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -1002,30 +747,6 @@ soc: soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 
-		gcc: clock-controller@100000 {
-			compatible = "qcom,sa8775p-gcc";
-			reg = <0x0 0x00100000 0x0 0xc7018>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&sleep_clk>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <&usb_0_qmpphy>,
-				 <&usb_1_qmpphy>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <&pcie0_phy>,
-				 <&pcie1_phy>,
-				 <0>,
-				 <0>,
-				 <0>;
-			power-domains = <&rpmhpd SA8775P_CX>;
-		};
-
 		ipcc: mailbox@408000 {
 			compatible = "qcom,sa8775p-ipcc", "qcom,ipcc";
 			reg = <0x0 0x00408000 0x0 0x1000>;
@@ -1073,9 +794,6 @@ qupv3_id_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
 			ranges;
-			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
-				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
-			clock-names = "m-ahb", "s-ahb";
 			iommus = <&apps_smmu 0x5a3 0x0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -1087,20 +805,6 @@ i2c14: i2c@880000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c14_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1114,20 +818,6 @@ spi14: spi@880000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi14_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1139,16 +829,6 @@ uart14: serial@880000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart14_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1158,20 +838,6 @@ i2c15: i2c@884000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c15_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1185,20 +851,6 @@ spi15: spi@884000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi15_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1210,16 +862,6 @@ uart15: serial@884000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart15_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1229,20 +871,6 @@ i2c16: i2c@888000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c16_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1254,20 +882,6 @@ spi16: spi@888000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi16_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1281,16 +895,6 @@ uart16: serial@888000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart16_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1300,20 +904,6 @@ i2c17: i2c@88c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c17_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1327,20 +917,6 @@ spi17: spi@88c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi17_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1352,16 +928,6 @@ uart17: serial@88c000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart17_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1369,20 +935,6 @@ i2c18: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c18_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1398,20 +950,6 @@ spi18: spi@890000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi18_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1423,16 +961,6 @@ uart18: serial@890000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart18_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1442,20 +970,6 @@ i2c19: i2c@894000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c19_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1469,20 +983,6 @@ spi19: spi@894000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi19_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1494,16 +994,6 @@ uart19: serial@894000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart19_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1513,20 +1003,6 @@ i2c20: i2c@898000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c20_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1540,20 +1016,6 @@ spi20: spi@898000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi20_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1565,16 +1027,6 @@ uart20: serial@898000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart20_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1608,9 +1060,6 @@ qupv3_id_0: geniqup@9c0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "m-ahb", "s-ahb";
-			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
-				<&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x403 0x0>;
 			status = "disabled";
 
@@ -1620,20 +1069,6 @@ i2c0: i2c@980000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c0_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1647,20 +1082,6 @@ spi0: spi@980000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi0_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
 				     <&gpi_dma0 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1672,16 +1093,6 @@ uart0: serial@980000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart0_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1691,20 +1102,6 @@ i2c1: i2c@984000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c1_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1718,20 +1115,6 @@ spi1: spi@984000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi1_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1743,16 +1126,6 @@ uart1: serial@984000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart1_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1762,20 +1135,6 @@ i2c2: i2c@988000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c2_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1789,20 +1148,6 @@ spi2: spi@988000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi2_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1814,16 +1159,6 @@ uart2: serial@988000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart2_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1833,20 +1168,6 @@ i2c3: i2c@98c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c3_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1860,20 +1181,6 @@ spi3: spi@98c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi3_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1885,16 +1192,6 @@ uart3: serial@98c000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x98c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart3_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1904,20 +1201,6 @@ i2c4: i2c@990000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c4_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -1931,20 +1214,6 @@ spi4: spi@990000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi4_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -1956,16 +1225,6 @@ uart4: serial@990000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart4_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -1975,20 +1234,6 @@ i2c5: i2c@994000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c5_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2002,20 +1247,6 @@ spi5: spi@994000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi5_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2027,16 +1258,6 @@ uart5: serial@994000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart5_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 		};
@@ -2069,9 +1290,6 @@ qupv3_id_1: geniqup@ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "m-ahb", "s-ahb";
-			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
-				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x443 0x0>;
 			status = "disabled";
 
@@ -2081,20 +1299,6 @@ i2c7: i2c@a80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c7_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2108,20 +1312,6 @@ spi7: spi@a80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi7_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2133,17 +1323,6 @@ uart7: serial@a80000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				pinctrl-0 = <&qup_uart7_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2153,20 +1332,6 @@ i2c8: i2c@a84000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c8_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2180,20 +1345,6 @@ spi8: spi@a84000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi8_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2205,17 +1356,6 @@ uart8: serial@a84000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				pinctrl-0 = <&qup_uart8_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2225,20 +1365,6 @@ i2c9: i2c@a88000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c9_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2252,20 +1378,6 @@ spi9: spi@a88000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi9_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2277,16 +1389,6 @@ uart9: serial@a88000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0xa88000 0x0 0x4000>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart9_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -2296,20 +1398,6 @@ i2c10: i2c@a8c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c10_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2323,20 +1411,6 @@ spi10: spi@a8c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi10_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2348,17 +1422,6 @@ uart10: serial@a8c000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				pinctrl-0 = <&qup_uart10_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 0
-						 &clk_virt SLAVE_QUP_CORE_1 0>,
-						<&gem_noc MASTER_APPSS_PROC 0
-						 &config_noc SLAVE_QUP_1 0>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2368,20 +1431,6 @@ i2c11: i2c@a90000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c11_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2395,20 +1444,6 @@ spi11: spi@a90000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi11_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2420,17 +1455,6 @@ uart11: serial@a90000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				pinctrl-0 = <&qup_uart11_default>;
-				pinctrl-names = "default";
-				interconnect-names = "qup-core", "qup-config";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -2440,20 +1464,6 @@ i2c12: i2c@a94000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c12_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2467,20 +1477,6 @@ spi12: spi@a94000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi12_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2492,16 +1488,6 @@ uart12: serial@a94000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_uart12_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core", "qup-config";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
 
@@ -2511,20 +1497,6 @@ i2c13: i2c@a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c13_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
-						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
-						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-						     "qup-config",
-						     "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2554,9 +1526,6 @@ qupv3_id_3: geniqup@bc0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "m-ahb", "s-ahb";
-			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
-				<&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x43 0x0>;
 			status = "disabled";
 
@@ -2566,20 +1535,6 @@ i2c21: i2c@b80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_i2c21_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
-						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
-						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-							 "qup-config",
-							 "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -2593,20 +1548,6 @@ spi21: spi@b80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
-				clock-names = "se";
-				pinctrl-0 = <&qup_spi21_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
-						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
-					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
-						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-				interconnect-names = "qup-core",
-							 "qup-config",
-							 "qup-memory";
-				power-domains = <&rpmhpd SA8775P_CX>;
 				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -2618,17 +1559,6 @@ uart21: serial@b80000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00b80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
-				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
-				interconnect-names = "qup-core", "qup-config";
-				pinctrl-0 = <&qup_uart21_default>;
-				pinctrl-names = "default";
-				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
-				power-domains = <&rpmhpd SA8775P_CX>;
-				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 		};
@@ -2638,62 +1568,6 @@ rng: rng@10d2000 {
 			reg = <0 0x010d2000 0 0x1000>;
 		};
 
-		config_noc: interconnect@14c0000 {
-			compatible = "qcom,sa8775p-config-noc";
-			reg = <0x0 0x014c0000 0x0 0x13080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		system_noc: interconnect@1680000 {
-			compatible = "qcom,sa8775p-system-noc";
-			reg = <0x0 0x01680000 0x0 0x15080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		aggre1_noc: interconnect@16c0000 {
-			compatible = "qcom,sa8775p-aggre1-noc";
-			reg = <0x0 0x016c0000 0x0 0x18080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>;
-		};
-
-		aggre2_noc: interconnect@1700000 {
-			compatible = "qcom,sa8775p-aggre2-noc";
-			reg = <0x0 0x01700000 0x0 0x1b080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-			clocks = <&gcc GCC_AGGRE_UFS_CARD_AXI_CLK>,
-				 <&rpmhcc RPMH_IPA_CLK>;
-		};
-
-		pcie_anoc: interconnect@1760000 {
-			compatible = "qcom,sa8775p-pcie-anoc";
-			reg = <0x0 0x01760000 0x0 0xc080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		gpdsp_anoc: interconnect@1780000 {
-			compatible = "qcom,sa8775p-gpdsp-anoc";
-			reg = <0x0 0x01780000 0x0 0xe080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		mmss_noc: interconnect@17a0000 {
-			compatible = "qcom,sa8775p-mmss-noc";
-			reg = <0x0 0x017a0000 0x0 0x40000>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sa8775p";
 			reg = <0x0 0x01c00000 0x0 0x3000>,
@@ -2741,38 +1615,9 @@ pcie0: pcie@1c00000 {
 					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
-			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
-			assigned-clock-rates = <19200000>;
-
-			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
 				    <0x100 &pcie_smmu 0x0001 0x1>;
 
-			resets = <&gcc GCC_PCIE_0_BCR>,
-				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
-			reset-names = "pci",
-				      "link_down";
-
-			power-domains = <&gcc PCIE_0_GDSC>;
-
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
 
@@ -2800,73 +1645,20 @@ pcie0_ep: pcie-ep@1c00000 {
 			      <0x0 0x40005000 0x0 0x2000>;
 			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
 				    "mmio", "dma";
-
-			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-				<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-				<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-				<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
 			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-names = "global", "doorbell", "dma";
 
-			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			dma-coherent;
 			iommus = <&pcie_smmu 0x0000 0x7f>;
-			resets = <&gcc GCC_PCIE_0_BCR>;
-			reset-names = "core";
-			power-domains = <&gcc PCIE_0_GDSC>;
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			num-lanes = <2>;
 			linux,pci-domain = <0>;
 
 			status = "disabled";
 		};
 
-		pcie0_phy: phy@1c04000 {
-			compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
-			reg = <0x0 0x1c04000 0x0 0x2000>;
-
-			clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
-				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_CLKREF_EN>,
-				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_0_PIPE_CLK>,
-				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
-			clock-names = "aux",
-				      "cfg_ahb",
-				      "ref",
-				      "rchng",
-				      "pipe",
-				      "pipediv2";
-
-			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
-			assigned-clock-rates = <100000000>;
-
-			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
-			reset-names = "phy";
-
-			#clock-cells = <0>;
-			clock-output-names = "pcie_0_pipe_clk";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		pcie1: pcie@1c10000 {
 			compatible = "qcom,pcie-sa8775p";
 			reg = <0x0 0x01c10000 0x0 0x3000>,
@@ -2914,38 +1706,9 @@ pcie1: pcie@1c10000 {
 					<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
-			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
-			assigned-clock-rates = <19200000>;
-
-			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
 				    <0x100 &pcie_smmu 0x0081 0x1>;
 
-			resets = <&gcc GCC_PCIE_1_BCR>,
-				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
-			reset-names = "pci",
-				      "link_down";
-
-			power-domains = <&gcc PCIE_1_GDSC>;
-
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
@@ -2974,139 +1737,30 @@ pcie1_ep: pcie-ep@1c10000 {
 			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
 				    "mmio", "dma";
 
-			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-			clock-names = "aux",
-				      "cfg",
-				      "bus_master",
-				      "bus_slave",
-				      "slave_q2a";
-
 			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-names = "global", "doorbell", "dma";
 
-			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-
 			dma-coherent;
 			iommus = <&pcie_smmu 0x80 0x7f>;
-			resets = <&gcc GCC_PCIE_1_BCR>;
-			reset-names = "core";
-			power-domains = <&gcc PCIE_1_GDSC>;
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			num-lanes = <4>;
 			linux,pci-domain = <1>;
 
 			status = "disabled";
 		};
 
-		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
-			reg = <0x0 0x1c14000 0x0 0x4000>;
-
-			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
-				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_CLKREF_EN>,
-				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_1_PIPE_CLK>,
-				 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
-			clock-names = "aux",
-				      "cfg_ahb",
-				      "ref",
-				      "rchng",
-				      "pipe",
-				      "pipediv2";
-
-			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
-			assigned-clock-rates = <100000000>;
-
-			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
-			reset-names = "phy";
-
-			#clock-cells = <0>;
-			clock-output-names = "pcie_1_pipe_clk";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy>;
-			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
-			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
-			power-domains = <&gcc UFS_PHY_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
 			iommus = <&apps_smmu 0x100 0x0>;
 			dma-coherent;
-			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_UFS_PHY_AHB_CLK>,
-				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			clock-names = "core_clk",
-				      "bus_aggr_clk",
-				      "iface_clk",
-				      "core_clk_unipro",
-				      "ref_clk",
-				      "tx_lane0_sync_clk",
-				      "rx_lane0_sync_clk",
-				      "rx_lane1_sync_clk";
-			freq-table-hz = <75000000 300000000>,
-					<0 0>,
-					<0 0>,
-					<75000000 300000000>,
-					<0 0>,
-					<0 0>,
-					<0 0>,
-					<0 0>;
-			qcom,ice = <&ice>;
-			status = "disabled";
-		};
-
-		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,sa8775p-qmp-ufs-phy";
-			reg = <0x0 0x01d87000 0x0 0xe10>;
-			/*
-			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
-			 * enables the CXO clock to eDP *and* UFS PHY.
-			 */
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
-				 <&gcc GCC_EDP_REF_CLKREF_EN>;
-			clock-names = "ref", "ref_aux", "qref";
-			power-domains = <&gcc UFS_PHY_GDSC>;
-			resets = <&ufs_mem_hc 0>;
-			reset-names = "ufsphy";
-			#phy-cells = <0>;
 			status = "disabled";
 		};
 
-		ice: crypto@1d88000 {
-			compatible = "qcom,sa8775p-inline-crypto-engine",
-				     "qcom,inline-crypto-engine";
-			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-		};
-
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
@@ -3127,16 +1781,6 @@ crypto: crypto@1dfa000 {
 			dma-names = "rx", "tx";
 			iommus = <&apps_smmu 0x480 0x0>,
 				 <&apps_smmu 0x481 0x0>;
-			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "memory";
-		};
-
-		lpass_ag_noc: interconnect@3c40000 {
-			compatible = "qcom,sa8775p-lpass-ag-noc";
-			reg = <0x0 0x03c40000 0x0 0x17200>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		ctcu@4001000 {
@@ -4306,171 +2950,19 @@ sdhc: mmc@87c4000 {
 			interrupt-names = "hc_irq",
 					  "pwr_irq";
 
-			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&gcc GCC_SDCC1_APPS_CLK>;
-			clock-names = "iface",
-				      "core";
-
-			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_SDC1 QCOM_ICC_TAG_ACTIVE_ONLY>;
-			interconnect-names = "sdhc-ddr",
-					     "cpu-sdhc";
-
 			iommus = <&apps_smmu 0x0 0x0>;
 			dma-coherent;
 
-			operating-points-v2 = <&sdhc_opp_table>;
-			power-domains = <&rpmhpd SA8775P_CX>;
-			resets = <&gcc GCC_SDCC1_BCR>;
-
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
 			status = "disabled";
-
-			sdhc_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-100000000 {
-					opp-hz = /bits/ 64 <100000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
-					opp-peak-kBps = <1800000 400000>;
-					opp-avg-kBps = <100000 0>;
-				};
-
-				opp-384000000 {
-					opp-hz = /bits/ 64 <384000000>;
-					required-opps = <&rpmhpd_opp_nom>;
-					opp-peak-kBps = <5400000 1600000>;
-					opp-avg-kBps = <390000 0>;
-				};
-			};
-		};
-
-		usb_0_hsphy: phy@88e4000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e4000 0 0x120>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_1_hsphy: phy@88e6000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e6000 0 0x120>;
-			clocks = <&gcc GCC_USB_CLKREF_EN>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_2_hsphy: phy@88e7000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e7000 0 0x120>;
-			clocks = <&gcc GCC_USB_CLKREF_EN>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_0_qmpphy: phy@88e8000 {
-			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
-			reg = <0 0x088e8000 0 0x2000>;
-
-			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
-				 <&gcc GCC_USB_CLKREF_EN>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-			clock-names = "aux", "ref", "com_aux", "pipe";
-
-			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
-				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
-			reset-names = "phy", "phy_phy";
-
-			power-domains = <&gcc USB30_PRIM_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "usb3_prim_phy_pipe_clk_src";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_1_qmpphy: phy@88ea000 {
-			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
-			reg = <0 0x088ea000 0 0x2000>;
-
-			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&gcc GCC_USB_CLKREF_EN>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-			clock-names = "aux", "ref", "com_aux", "pipe";
-
-			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
-				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
-			reset-names = "phy", "phy_phy";
-
-			power-domains = <&gcc USB30_SEC_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "usb3_sec_phy_pipe_clk_src";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		refgen: regulator@891c000 {
-			compatible = "qcom,sa8775p-refgen-regulator",
-				     "qcom,sm8250-refgen-regulator";
-			reg = <0x0 0x0891c000 0x0 0x84>;
-		};
-
-		dc_noc: interconnect@90e0000 {
-			compatible = "qcom,sa8775p-dc-noc";
-			reg = <0x0 0x090e0000 0x0 0x5080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		gem_noc: interconnect@9100000 {
-			compatible = "qcom,sa8775p-gem-noc";
-			reg = <0x0 0x09100000 0x0 0xf6080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		usb_0: usb@a600000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a600000 0 0xfc100>;
 
-			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
-				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
-				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
-			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
-
-			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <200000000>;
-
 			interrupts-extended = <&intc GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
@@ -4484,20 +2976,9 @@ usb_0: usb@a600000 {
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
-			power-domains = <&gcc USB30_PRIM_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
-
-			resets = <&gcc GCC_USB30_PRIM_BCR>;
-
-			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
-			interconnect-names = "usb-ddr", "apps-usb";
-
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x080 0x0>;
-			phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
-			phy-names = "usb2-phy", "usb3-phy";
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
@@ -4528,17 +3009,6 @@ usb_1: usb@a800000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a800000 0 0xfc100>;
 
-			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
-				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
-				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
-				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
-				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
-			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
-
-			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <200000000>;
-
 			interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
@@ -4552,20 +3022,9 @@ usb_1: usb@a800000 {
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
-			power-domains = <&gcc USB30_SEC_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
-
-			resets = <&gcc GCC_USB30_SEC_BCR>;
-
-			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
-			interconnect-names = "usb-ddr", "apps-usb";
-
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x0a0 0x0>;
-			phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
-			phy-names = "usb2-phy", "usb3-phy";
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
@@ -4576,17 +3035,6 @@ usb_2: usb@a400000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a400000 0 0xfc100>;
 
-			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB20_MASTER_CLK>,
-				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB20_SLEEP_CLK>,
-				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
-			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi";
-
-			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB20_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <200000000>;
-
 			interrupts-extended = <&intc GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
@@ -4598,21 +3046,10 @@ usb_2: usb@a400000 {
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
 
-			power-domains = <&gcc USB20_PRIM_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
-
-			resets = <&gcc GCC_USB20_PRIM_BCR>;
-
-			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
-			interconnect-names = "usb-ddr", "apps-usb";
-
 			qcom,select-utmi-as-pipe-clk;
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x020 0x0>;
-			phys = <&usb_2_hsphy>;
-			phy-names = "usb2-phy";
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
@@ -4648,11 +3085,6 @@ gpu: gpu@3d00000 {
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&adreno_smmu 0 0xc00>,
 				 <&adreno_smmu 1 0xc00>;
-			operating-points-v2 = <&gpu_opp_table>;
-			qcom,gmu = <&gmu>;
-			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 			#cooling-cells = <2>;
 
 			nvmem-cells = <&gpu_speed_bin>;
@@ -4663,99 +3095,6 @@ gpu: gpu@3d00000 {
 			gpu_zap_shader: zap-shader {
 				memory-region = <&pil_gpu_mem>;
 			};
-
-			gpu_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-405000000 {
-					opp-hz = /bits/ 64 <405000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					opp-peak-kBps = <5285156>;
-					opp-supported-hw = <0x3>;
-				};
-
-				opp-530000000 {
-					opp-hz = /bits/ 64 <530000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					opp-peak-kBps = <12484375>;
-					opp-supported-hw = <0x2>;
-				};
-
-				opp-676000000 {
-					opp-hz = /bits/ 64 <676000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					opp-peak-kBps = <8171875>;
-					opp-supported-hw = <0x1>;
-				};
-
-				opp-778000000 {
-					opp-hz = /bits/ 64 <778000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					opp-peak-kBps = <10687500>;
-					opp-supported-hw = <0x1>;
-				};
-
-				opp-800000000 {
-					opp-hz = /bits/ 64 <800000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					opp-peak-kBps = <12484375>;
-					opp-supported-hw = <0x1>;
-				};
-			};
-		};
-
-		gmu: gmu@3d6a000 {
-			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
-			reg = <0x0 0x03d6a000 0x0 0x34000>,
-			      <0x0 0x03de0000 0x0 0x10000>,
-			      <0x0 0x0b290000 0x0 0x10000>;
-			reg-names = "gmu", "rscc", "gmu_pdc";
-			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hfi", "gmu";
-			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
-				 <&gpucc GPU_CC_CXO_CLK>,
-				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
-				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-				 <&gpucc GPU_CC_AHB_CLK>,
-				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
-				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
-			clock-names = "gmu",
-				      "cxo",
-				      "axi",
-				      "memnoc",
-				      "ahb",
-				      "hub",
-				      "smmu_vote";
-			power-domains = <&gpucc GPU_CC_CX_GDSC>,
-					<&gpucc GPU_CC_GX_GDSC>;
-			power-domain-names = "cx",
-					     "gx";
-			iommus = <&adreno_smmu 5 0xc00>;
-			operating-points-v2 = <&gmu_opp_table>;
-
-			gmu_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-500000000 {
-					opp-hz = /bits/ 64 <500000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-				};
-			};
-		};
-
-		gpucc: clock-controller@3d90000 {
-			compatible = "qcom,sa8775p-gpucc";
-			reg = <0x0 0x03d90000 0x0 0xa000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
-				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
-			clock-names = "bi_tcxo",
-				      "gcc_gpu_gpll0_clk_src",
-				      "gcc_gpu_gpll0_div_clk_src";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
 		};
 
 		adreno_smmu: iommu@3da0000 {
@@ -4765,21 +3104,6 @@ adreno_smmu: iommu@3da0000 {
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
 			dma-coherent;
-			power-domains = <&gpucc GPU_CC_CX_GDSC>;
-			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
-				 <&gpucc GPU_CC_AHB_CLK>,
-				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
-				 <&gpucc GPU_CC_CX_GMU_CLK>,
-				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
-				 <&gpucc GPU_CC_HUB_AON_CLK>;
-			clock-names = "gcc_gpu_memnoc_gfx_clk",
-				      "gcc_gpu_snoc_dvm_gfx_clk",
-				      "gpu_cc_ahb_clk",
-				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
-				      "gpu_cc_cx_gmu_clk",
-				      "gpu_cc_hub_cx_int_clk",
-				      "gpu_cc_hub_aon_clk";
 			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
@@ -4794,119 +3118,6 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		serdes0: phy@8901000 {
-			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
-			reg = <0x0 0x08901000 0x0 0xe10>;
-			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
-			clock-names = "sgmi_ref";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		serdes1: phy@8902000 {
-			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
-			reg = <0x0 0x08902000 0x0 0xe10>;
-			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
-			clock-names = "sgmi_ref";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		pmu@9091000 {
-			compatible = "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
-			reg = <0x0 0x9091000 0x0 0x1000>;
-			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>;
-			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
-
-			operating-points-v2 = <&llcc_bwmon_opp_table>;
-
-			llcc_bwmon_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-0 {
-					opp-peak-kBps = <762000>;
-				};
-
-				opp-1 {
-					opp-peak-kBps = <1720000>;
-				};
-
-				opp-2 {
-					opp-peak-kBps = <2086000>;
-				};
-
-				opp-3 {
-					opp-peak-kBps = <2601000>;
-				};
-
-				opp-4 {
-					opp-peak-kBps = <2929000>;
-				};
-
-				opp-5 {
-					opp-peak-kBps = <5931000>;
-				};
-
-				opp-6 {
-					opp-peak-kBps = <6515000>;
-				};
-
-				opp-7 {
-					opp-peak-kBps = <7984000>;
-				};
-
-				opp-8 {
-					opp-peak-kBps = <10437000>;
-				};
-
-				opp-9 {
-					opp-peak-kBps = <12195000>;
-				};
-			};
-		};
-
-		pmu@90b5400 {
-			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
-			reg = <0x0 0x90b5400 0x0 0x600>;
-			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
-
-			operating-points-v2 = <&cpu_bwmon_opp_table>;
-
-			cpu_bwmon_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-0 {
-					opp-peak-kBps = <9155000>;
-				};
-
-				opp-1 {
-					opp-peak-kBps = <12298000>;
-				};
-
-				opp-2 {
-					opp-peak-kBps = <14236000>;
-				};
-
-				opp-3 {
-					opp-peak-kBps = <16265000>;
-				};
-			};
-
-		};
-
-		pmu@90b6400 {
-			compatible = "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
-			reg = <0x0 0x90b6400 0x0 0x600>;
-			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
-
-			operating-points-v2 = <&cpu_bwmon_opp_table>;
-		};
-
 		llcc: system-cache-controller@9200000 {
 			compatible = "qcom,sa8775p-llcc";
 			reg = <0x0 0x09200000 0x0 0x80000>,
@@ -4932,237 +3143,41 @@ iris: video-codec@aa00000 {
 			reg = <0x0 0x0aa00000 0x0 0xf0000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 
-			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
-					<&videocc VIDEO_CC_MVS0_GDSC>,
-					<&rpmhpd SA8775P_MX>,
-					<&rpmhpd SA8775P_MMCX>;
-			power-domain-names = "venus",
-					     "vcodec0",
-					     "mxc",
-					     "mmcx";
-			operating-points-v2 = <&iris_opp_table>;
-
-			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
-				 <&videocc VIDEO_CC_MVS0C_CLK>,
-				 <&videocc VIDEO_CC_MVS0_CLK>;
-			clock-names = "iface",
-				      "core",
-				      "vcodec0_core";
-
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "cpu-cfg",
-					     "video-mem";
-
 			memory-region = <&pil_video_mem>;
 
-			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
-			reset-names = "bus";
-
 			iommus = <&apps_smmu 0x0880 0x0400>,
 				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
 			status = "disabled";
-
-			iris_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-366000000 {
-					opp-hz = /bits/ 64 <366000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>,
-							<&rpmhpd_opp_svs_l1>;
-				};
-
-				opp-444000000 {
-					opp-hz = /bits/ 64 <444000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>,
-							<&rpmhpd_opp_nom>;
-				};
-
-				opp-533000000 {
-					opp-hz = /bits/ 64 <533000000>;
-					required-opps = <&rpmhpd_opp_nom>,
-							<&rpmhpd_opp_turbo>;
-				};
-
-				opp-560000000 {
-					opp-hz = /bits/ 64 <560000000>;
-					required-opps = <&rpmhpd_opp_nom>,
-							<&rpmhpd_opp_turbo_l1>;
-				};
-			};
-		};
-
-		videocc: clock-controller@abf0000 {
-			compatible = "qcom,sa8775p-videocc";
-			reg = <0x0 0x0abf0000 0x0 0x10000>;
-			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
 		};
 
 		cci0: cci@ac13000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac13000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
-
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_0_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
-			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
 			status = "disabled";
-
-			cci0_i2c0: i2c-bus@0 {
-				reg = <0>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-
-			cci0_i2c1: i2c-bus@1 {
-				reg = <1>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
 		};
 
 		cci1: cci@ac14000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac14000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
-
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_1_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
-			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
 			status = "disabled";
-
-			cci1_i2c0: i2c-bus@0 {
-				reg = <0>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-
-			cci1_i2c1: i2c-bus@1 {
-				reg = <1>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
 		};
 
 		cci2: cci@ac15000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac15000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
-
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_2_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
-			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
 			status = "disabled";
-
-			cci2_i2c0: i2c-bus@0 {
-				reg = <0>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-
-			cci2_i2c1: i2c-bus@1 {
-				reg = <1>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
 		};
 
 		cci3: cci@ac16000 {
 			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac16000 0x0 0x1000>;
-
 			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
-
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CCI_3_CLK>;
-			clock-names = "camnoc_axi",
-				      "cpas_ahb",
-				      "cci";
-
-			pinctrl-0 = <&cci3_0_default &cci3_1_default>;
-			pinctrl-1 = <&cci3_0_sleep &cci3_1_sleep>;
-			pinctrl-names = "default", "sleep";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
 			status = "disabled";
-
-			cci3_i2c0: i2c-bus@0 {
-				reg = <0>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-
-			cci3_i2c1: i2c-bus@1 {
-				reg = <1>;
-				clock-frequency = <1000000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
 		};
 
 		camss: isp@ac78000 {
@@ -5213,63 +3228,6 @@ camss: isp@ac78000 {
 				    "vfe_lite3",
 				    "vfe_lite4";
 
-			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-				 <&camcc CAM_CC_CORE_AHB_CLK>,
-				 <&camcc CAM_CC_CPAS_AHB_CLK>,
-				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
-				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
-				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
-				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
-				 <&camcc CAM_CC_CSID_CLK>,
-				 <&camcc CAM_CC_CSIPHY0_CLK>,
-				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSIPHY1_CLK>,
-				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSIPHY2_CLK>,
-				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSIPHY3_CLK>,
-				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
-				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
-				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
-				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
-				 <&camcc CAM_CC_ICP_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_0_CLK>,
-				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_1_CLK>,
-				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
-			clock-names = "camnoc_axi",
-				      "core_ahb",
-				      "cpas_ahb",
-				      "cpas_fast_ahb_clk",
-				      "cpas_vfe_lite",
-				      "cpas_vfe0",
-				      "cpas_vfe1",
-				      "csid",
-				      "csiphy0",
-				      "csiphy0_timer",
-				      "csiphy1",
-				      "csiphy1_timer",
-				      "csiphy2",
-				      "csiphy2_timer",
-				      "csiphy3",
-				      "csiphy3_timer",
-				      "csiphy_rx",
-				      "gcc_axi_hf",
-				      "gcc_axi_sf",
-				      "icp_ahb",
-				      "vfe0",
-				      "vfe0_fast_ahb",
-				      "vfe1",
-				      "vfe1_fast_ahb",
-				      "vfe_lite",
-				      "vfe_lite_ahb",
-				      "vfe_lite_cphy_rx",
-				      "vfe_lite_csid";
-
 			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
@@ -5313,18 +3271,8 @@ camss: isp@ac78000 {
 					  "vfe_lite3",
 					  "vfe_lite4";
 
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "ahb",
-					     "hf_0";
-
 			iommus = <&apps_smmu 0x3400 0x20>;
 
-			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
-			power-domain-names = "top";
-
 			status = "disabled";
 
 			ports {
@@ -5349,43 +3297,11 @@ port@3 {
 			};
 		};
 
-		camcc: clock-controller@ade0000 {
-			compatible = "qcom,sa8775p-camcc";
-			reg = <0x0 0x0ade0000 0x0 0x20000>;
-			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-		};
-
 		mdss0: display-subsystem@ae00000 {
 			compatible = "qcom,sa8775p-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;
 			reg-names = "mdss";
 
-			/* same path used twice */
-			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
-			interconnect-names = "mdp0-mem",
-					     "mdp1-mem",
-					     "cpu-cfg";
-
-			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
-
-			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
-
-			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
-				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
-
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
@@ -5404,23 +3320,6 @@ mdss0_mdp: display-controller@ae01000 {
 				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp", "vbif";
 
-				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "nrt_bus",
-					      "iface",
-					      "lut",
-					      "core",
-					      "vsync";
-
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				assigned-clock-rates = <19200000>;
-
-				operating-points-v2 = <&mdss0_mdp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				interrupt-parent = <&mdss0>;
 				interrupts = <0>;
 
@@ -5460,30 +3359,6 @@ dpu_intf2_out: endpoint {
 						};
 					};
 				};
-
-				mdss0_mdp_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-375000000 {
-						opp-hz = /bits/ 64 <375000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-500000000 {
-						opp-hz = /bits/ 64 <500000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-
-					opp-575000000 {
-						opp-hz = /bits/ 64 <575000000>;
-						required-opps = <&rpmhpd_opp_turbo>;
-					};
-
-					opp-650000000 {
-						opp-hz = /bits/ 64 <650000000>;
-						required-opps = <&rpmhpd_opp_turbo_l1>;
-					};
-				};
 			};
 
 			mdss0_dsi0: dsi@ae94000 {
@@ -5494,29 +3369,6 @@ mdss0_dsi0: dsi@ae94000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <4>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_DISP_HF_AXI_CLK>;
-				clock-names = "byte",
-					      "byte_intf",
-					      "pixel",
-					      "core",
-					      "iface",
-					      "bus";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
-							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
-				phys = <&mdss0_dsi0_phy>;
-
-				operating-points-v2 = <&mdss_dsi_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
-				refgen-supply = <&refgen>;
-
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -5540,34 +3392,6 @@ port@1 {
 						mdss0_dsi0_out: endpoint { };
 					};
 				};
-
-				mdss_dsi_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-358000000 {
-						opp-hz = /bits/ 64 <358000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-				};
-			};
-
-			mdss0_dsi0_phy: phy@ae94400 {
-				compatible = "qcom,sa8775p-dsi-phy-5nm";
-				reg = <0x0 0x0ae94400 0x0 0x200>,
-				      <0x0 0x0ae94600 0x0 0x280>,
-				      <0x0 0x0ae94900 0x0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
-
-				status = "disabled";
 			};
 
 			mdss0_dsi1: dsi@ae96000 {
@@ -5578,29 +3402,6 @@ mdss0_dsi1: dsi@ae96000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <5>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_DISP_HF_AXI_CLK>;
-				clock-names = "byte",
-					      "byte_intf",
-					      "pixel",
-					      "core",
-					      "iface",
-					      "bus";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
-							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
-				phys = <&mdss0_dsi1_phy>;
-
-				operating-points-v2 = <&mdss_dsi_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
-				refgen-supply = <&refgen>;
-
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -5626,63 +3427,6 @@ port@1 {
 				};
 			};
 
-			mdss0_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,sa8775p-dsi-phy-5nm";
-				reg = <0x0 0x0ae96400 0x0 0x200>,
-				      <0x0 0x0ae96600 0x0 0x280>,
-				      <0x0 0x0ae96900 0x0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
-
-				status = "disabled";
-			};
-
-			mdss0_dp0_phy: phy@aec2a00 {
-				compatible = "qcom,sa8775p-edp-phy";
-
-				reg = <0x0 0x0aec2a00 0x0 0x200>,
-				      <0x0 0x0aec2200 0x0 0xd0>,
-				      <0x0 0x0aec2600 0x0 0xd0>,
-				      <0x0 0x0aec2000 0x0 0x1c8>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
-				clock-names = "aux",
-					      "cfg_ahb";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				status = "disabled";
-			};
-
-			mdss0_dp1_phy: phy@aec5a00 {
-				compatible = "qcom,sa8775p-edp-phy";
-
-				reg = <0x0 0x0aec5a00 0x0 0x200>,
-				      <0x0 0x0aec5200 0x0 0xd0>,
-				      <0x0 0x0aec5600 0x0 0xd0>,
-				      <0x0 0x0aec5000 0x0 0x1c8>;
-
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
-				clock-names = "aux",
-					      "cfg_ahb";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				status = "disabled";
-			};
-
 			mdss0_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sa8775p-dp";
 
@@ -5699,38 +3443,6 @@ mdss0_dp0: displayport-controller@af54000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <12>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
-				clock-names = "core_iface",
-					      "core_aux",
-					      "ctrl_link",
-					      "ctrl_link_iface",
-					      "stream_pixel",
-					      "stream_1_pixel",
-					      "stream_2_pixel",
-					      "stream_3_pixel";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp0_phy 0>,
-							 <&mdss0_dp0_phy 1>,
-							 <&mdss0_dp0_phy 1>,
-							 <&mdss0_dp0_phy 1>,
-							 <&mdss0_dp0_phy 1>;
-				phys = <&mdss0_dp0_phy>;
-				phy-names = "dp";
-
-				operating-points-v2 = <&dp_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				#sound-dai-cells = <0>;
 
 				status = "disabled";
@@ -5753,30 +3465,6 @@ port@1 {
 						mdss0_dp0_out: endpoint { };
 					};
 				};
-
-				dp_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 
 			mdss0_dp1: displayport-controller@af5c000 {
@@ -5795,30 +3483,6 @@ mdss0_dp1: displayport-controller@af5c000 {
 				interrupt-parent = <&mdss0>;
 				interrupts = <13>;
 
-				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
-				clock-names = "core_iface",
-					      "core_aux",
-					      "ctrl_link",
-					      "ctrl_link_iface",
-					      "stream_pixel",
-					      "stream_1_pixel";
-				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp1_phy 0>,
-							 <&mdss0_dp1_phy 1>,
-							 <&mdss0_dp1_phy 1>;
-				phys = <&mdss0_dp1_phy>;
-				phy-names = "dp";
-
-				operating-points-v2 = <&dp1_opp_table>;
-				power-domains = <&rpmhpd SA8775P_MMCX>;
-
 				#sound-dai-cells = <0>;
 
 				status = "disabled";
@@ -5841,52 +3505,9 @@ port@1 {
 						mdss0_dp1_out: endpoint { };
 					};
 				};
-
-				dp1_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 		};
 
-		dispcc0: clock-controller@af00000 {
-			compatible = "qcom,sa8775p-dispcc0";
-			reg = <0x0 0x0af00000 0x0 0x20000>;
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>,
-				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
-				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
-				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
-				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-		};
-
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
@@ -6332,95 +3953,6 @@ frame@17c2d000 {
 			};
 		};
 
-		apps_rsc: rsc@18200000 {
-			compatible = "qcom,rpmh-rsc";
-			reg = <0x0 0x18200000 0x0 0x10000>,
-			      <0x0 0x18210000 0x0 0x10000>,
-			      <0x0 0x18220000 0x0 0x10000>;
-			reg-names = "drv-0", "drv-1", "drv-2";
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-			      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-			      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,tcs-offset = <0xd00>;
-			qcom,drv-id = <2>;
-			qcom,tcs-config = <ACTIVE_TCS 2>,
-					  <SLEEP_TCS 3>,
-					  <WAKE_TCS 3>,
-					  <CONTROL_TCS 0>;
-			label = "apps_rsc";
-			power-domains = <&system_pd>;
-
-			apps_bcm_voter: bcm-voter {
-				compatible = "qcom,bcm-voter";
-			};
-
-			rpmhcc: clock-controller {
-				compatible = "qcom,sa8775p-rpmh-clk";
-				#clock-cells = <1>;
-				clock-names = "xo";
-				clocks = <&xo_board_clk>;
-			};
-
-			rpmhpd: power-controller {
-				compatible = "qcom,sa8775p-rpmhpd";
-				#power-domain-cells = <1>;
-				operating-points-v2 = <&rpmhpd_opp_table>;
-
-				rpmhpd_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					rpmhpd_opp_ret: opp-0 {
-						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
-					};
-
-					rpmhpd_opp_min_svs: opp-1 {
-						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
-					};
-
-					rpmhpd_opp_low_svs: opp2 {
-						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-					};
-
-					rpmhpd_opp_svs: opp3 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-					};
-
-					rpmhpd_opp_svs_l1: opp-4 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					};
-
-					rpmhpd_opp_nom: opp-5 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					};
-
-					rpmhpd_opp_nom_l1: opp-6 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
-					};
-
-					rpmhpd_opp_nom_l2: opp-7 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
-					};
-
-					rpmhpd_opp_turbo: opp-8 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					};
-
-					rpmhpd_opp_turbo_l1: opp-9 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					};
-				};
-			};
-		};
-
-		epss_l3_cl0: interconnect@18590000 {
-			compatible = "qcom,sa8775p-epss-l3",
-				     "qcom,epss-l3";
-			reg = <0x0 0x18590000 0x0 0x1000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
-			clock-names = "xo", "alternate";
-			#interconnect-cells = <1>;
-		};
-
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,sa8775p-cpufreq-epss",
 				     "qcom,cpufreq-epss";
@@ -6432,21 +3964,9 @@ cpufreq_hw: cpufreq@18591000 {
 				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
-			clock-names = "xo", "alternate";
-
 			#freq-domain-cells = <1>;
 		};
 
-		epss_l3_cl1: interconnect@18592000 {
-			compatible = "qcom,sa8775p-epss-l3",
-				     "qcom,epss-l3";
-			reg = <0x0 0x18592000 0x0 0x1000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
-			clock-names = "xo", "alternate";
-			#interconnect-cells = <1>;
-		};
-
 		remoteproc_gpdsp0: remoteproc@20c00000 {
 			compatible = "qcom,sa8775p-gpdsp0-pas";
 			reg = <0x0 0x20c00000 0x0 0x10000>;
@@ -6459,16 +3979,6 @@ remoteproc_gpdsp0: remoteproc@20c00000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>;
-			power-domain-names = "cx", "mxc";
-
-			interconnects = <&gpdsp_anoc MASTER_DSP0 0
-					 &config_noc SLAVE_CLK_CTL 0>;
-
 			memory-region = <&pil_gdsp0_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -6531,16 +4041,6 @@ remoteproc_gpdsp1: remoteproc@21c00000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>;
-			power-domain-names = "cx", "mxc";
-
-			interconnects = <&gpdsp_anoc MASTER_DSP1 0
-					 &config_noc SLAVE_CLK_CTL 0>;
-
 			memory-region = <&pil_gdsp1_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -6591,22 +4091,6 @@ compute-cb@3 {
 			};
 		};
 
-		dispcc1: clock-controller@22100000 {
-			compatible = "qcom,sa8775p-dispcc1";
-			reg = <0x0 0x22100000 0x0 0x20000>;
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>,
-				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
-				 <0>, <0>, <0>, <0>;
-			power-domains = <&rpmhpd SA8775P_MMCX>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			status = "disabled";
-		};
-
 		ethernet1: ethernet@23000000 {
 			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23000000 0x0 0x10000>,
@@ -6617,27 +4101,6 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
-				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
-				 <&gcc GCC_EMAC1_PTP_CLK>,
-				 <&gcc GCC_EMAC1_PHY_AUX_CLK>;
-			clock-names = "stmmaceth",
-				      "pclk",
-				      "ptp_ref",
-				      "phyaux";
-
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
-					<&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "cpu-mac",
-					     "mac-mem";
-
-			power-domains = <&gcc EMAC1_GDSC>;
-
-			phys = <&serdes1>;
-			phy-names = "serdes";
-
 			iommus = <&apps_smmu 0x140 0xf>;
 			dma-coherent;
 
@@ -6659,27 +4122,6 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
-				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
-				 <&gcc GCC_EMAC0_PTP_CLK>,
-				 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
-			clock-names = "stmmaceth",
-				      "pclk",
-				      "ptp_ref",
-				      "phyaux";
-
-			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
-					<&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "cpu-mac",
-					     "mac-mem";
-
-			power-domains = <&gcc EMAC0_GDSC>;
-
-			phys = <&serdes0>;
-			phy-names = "serdes";
-
 			iommus = <&apps_smmu 0x120 0xf>;
 			dma-coherent;
 
@@ -6691,13 +4133,6 @@ &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 		};
 
-		nspa_noc: interconnect@260c0000 {
-			compatible = "qcom,sa8775p-nspa-noc";
-			reg = <0x0 0x260c0000 0x0 0x16080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		remoteproc_cdsp0: remoteproc@26300000 {
 			compatible = "qcom,sa8775p-cdsp0-pas";
 			reg = <0x0 0x26300000 0x0 0x10000>;
@@ -6710,17 +4145,6 @@ remoteproc_cdsp0: remoteproc@26300000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>,
-					<&rpmhpd SA8775P_NSP0>;
-			power-domain-names = "cx", "mxc", "nsp";
-
-			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
-					 &mc_virt SLAVE_EBI1 0>;
-
 			memory-region = <&pil_cdsp0_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -6830,13 +4254,6 @@ compute-cb@11 {
 			};
 		};
 
-		nspb_noc: interconnect@2a0c0000 {
-			compatible = "qcom,sa8775p-nspb-noc";
-			reg = <0x0 0x2a0c0000 0x0 0x16080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		remoteproc_cdsp1: remoteproc@2a300000 {
 			compatible = "qcom,sa8775p-cdsp1-pas";
 			reg = <0x0 0x2a300000 0x0 0x10000>;
@@ -6849,17 +4266,6 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_CX>,
-					<&rpmhpd SA8775P_MXC>,
-					<&rpmhpd SA8775P_NSP1>;
-			power-domain-names = "cx", "mxc", "nsp";
-
-			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
-					 &mc_virt SLAVE_EBI1 0>;
-
 			memory-region = <&pil_cdsp1_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -7005,15 +4411,6 @@ remoteproc_adsp: remoteproc@30000000 {
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SA8775P_LCX>,
-					<&rpmhpd SA8775P_LMX>;
-			power-domain-names = "lcx", "lmx";
-
-			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
-
 			memory-region = <&pil_adsp_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
-- 
2.43.0


