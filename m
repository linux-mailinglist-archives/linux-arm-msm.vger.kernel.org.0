Return-Path: <linux-arm-msm+bounces-113467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kDO5EDyvMWp9pAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:17:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8E695227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:16:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Zv+IAM/7";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FJuUCJhE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4452732235FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B48387371;
	Tue, 16 Jun 2026 20:15:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30A386554
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640904; cv=none; b=Y2D3ipwQTX4CnQ/6Pbw3HRIjyLLyeAQMP536edXo5KDnSue6XIYVDHvMfgRnT4+dDIc0VgVZno8nm5N9KlBSwMqB+QuHTmFrWx3YX+GXY5BfRg1VzXUapF2WLM/EPcAf1aDoq5Z4r3Gclgk040FljSDskBYfMsxqOqaAH6tFxxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640904; c=relaxed/simple;
	bh=mPmaD4IFVUIu+HVzzg//Q2MgUjywNjd818HGA2EhJos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYRLm9V+RF2vBu1ZPCPi6DNMGF3YdjEJ9GC5Y2pEnsTZL4OYlOyksHvPmho1vK6Sx7pNgbhXP7m+ca9xW9TKZ4yfVyjLLR9YEbtfW3RW1Ngz6/UcF18Akb986Q144PMMBZi1PZYT3Fp9kAJk7HijxgGzMS9PWRrnRtEk+/63IFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv+IAM/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJuUCJhE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOd4v3914063
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tZzr6OI7+ha
	3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=; b=Zv+IAM/7C2t0SXWNeQL3375XUbb
	gZAOeK5Y6GrwpBz0fXjLt52AK2JhUbhU/P4FLb8KlYt8QxHs6keOxeZFPWBbiQzb
	LhrwzoMQLNz032jeIcD9qXKsOHh9SdmE2rz3aocal4lY9q4q/yMgdhdu54HYosVk
	I/egw8NdgKl+82sJ6E/UhYY3I0+pOMMOjp3xrFopOcS/m6d5tN8yu41TS3Qx9vxN
	ggsvjNhTNcm5CRGbh15mFqP/+IB++j6gktSofX+O5ywTo3LOI6beEH/uU/2zMEqr
	tX3UN4+o0YjrOZFteVadn8Y5gdNfyajqnz1tazd/apmKjcCEGIp+h4KPP9g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7v0ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c8fd4d4baso243577a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640901; x=1782245701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZzr6OI7+ha3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=;
        b=FJuUCJhEhHy4+XjCwGgwgYV4AaZQ/rxl0VRKHw3yzAQx17nyKMWpOjdHVfJpK4rrhA
         Rt7jqkwZBm36tapbpjnfJMTHl2bn0lDtRP4BYSUEnxckno2lMpLLBMcv9k0e9GXzH185
         Glh4t79C3IrDTGDAZhiuUiHOMUiLdwOAfajpaze8Iwml7ZJkFmK+kTVVehyZ9ImtLgSS
         LrvKpChB7G7tN3wHMVef1/5zs2pzE2Ebe78759wJnkF8BL97BGUIDOIVsn7YaYisnJQo
         juQen7b2XKEAmnXxAYJ44beXta+Mq5Q/BSWWTxi7YhZJ+sbH9HMxKBahftUO91lIwV1O
         5g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640901; x=1782245701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tZzr6OI7+ha3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=;
        b=csIP0rzpVczwCLM91kyYLw1S0GaQ6+zimk+zLEMQu0/G/1fYtKWQt4NxNhWwvom/1U
         ZTFT5c2gN2U9Co1u6OPe+IAHiGQCs3Xe2h3eeZ/6N7IzrQT4pASIyEhpTODPJyn6bmW3
         ZHJ5O2cHAUQ2UWqQyRKv8X7Qq7p5lVy2x0WRDmXJXe90eWvGUYfiXqGAHcW29pZIckiw
         PaF9UyC/q42pLJT5IqjNjvf5DhPPpXWF1IP/G3z7i/A3VK6Be2WxJZ4MVljScnG5QCdX
         lrp2ZVqCfTqiGYBE86PRmEpQZiysBCrloWWJN4qmaokVpMMwlCf8ryBgvviwEU0AVW2J
         i1fw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZtVdEdNOaZWGYhsvyYUKPI7YEMsaaax5aoqQy+CmE9HblR9ZX7+o4B2SYaPuQk3QqZc503ejuPBd77Z+t@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8TyH2tEf4Rn7qA1wTRT086NCHgcxJm1zFL1Fl74B5kBRIJ44
	GR4NEqrMPouF5pim7CTzB0lI0uftiLVM4CEe4cMnZpPsnnTx/uv5GtpeeHbPipMDrCDHJ0pQbPW
	LkqMKCFbMyx6lQH/+/ylWpBoaSjwOLT5uucangRgPLI8mH2UqVwiV+hlf5KoCr/Cdoayk
X-Gm-Gg: AfdE7cm83JIhlVJq2L6k48dZU5yVo2GatjAD78w0WVJoDArpJecEK2femcHJVRvIaFx
	lgdBHDLs21P8Hq5rw7AAZpu20nPozAWzQbQDzHweHcwJMj/8ko4JxpRA1ZFDfXXfeh/fkRCR2W4
	80xkJPs931SoWoCW1xjlemnnkG03leG+rvfMGXcptRQVVSoQWKgWINfJqmYuE3qwKH94zOJnteR
	hx6+z1lfWBYS2884wbezbJMD/XgIPTu10rHwg0AQdFcu4hr/F1GPrpYkGVmefb1FGg4owbK6uCN
	Ns+OMNRxf8/qEpiUH74rP6fataLzBpHY5ok1XZmgxs6lxYavyopPDqXYm4EMdjwRnbilnHRTh5v
	udk/CkS4TULO6rxJoYCGbXHWu3A6cz1DcANHzK8kzVhznL5QEQOu3QxwgCQ==
X-Received: by 2002:a17:903:2441:b0:2c6:a45a:4f7d with SMTP id d9443c01a7336-2c6bc2521damr4623085ad.29.1781640901320;
        Tue, 16 Jun 2026 13:15:01 -0700 (PDT)
X-Received: by 2002:a17:903:2441:b0:2c6:a45a:4f7d with SMTP id d9443c01a7336-2c6bc2521damr4622895ad.29.1781640900899;
        Tue, 16 Jun 2026 13:15:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:00 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: [PATCH v1 3/8] arm64: dts: qcom: shikra: Add gpr node
Date: Wed, 17 Jun 2026 01:43:10 +0530
Message-Id: <20260616201315.2565115-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX8AHpWWWQ3RPV
 QzoUwJ47He776KzaJUerwQwAFapp/MkzITYHQDcRtoCjHLU9ckWr0RarTwnM4ukf+mU23sqM/L3
 pUJ5uh9UyZCoT1Uot8Gl2VlNueCQOtHr5orq/EY5hYhMzbjJ7ML3RHtwtPKVy2k/S2qPTsiXN6o
 IpQDJ8C4svV55AVFScdBQZmfE2KrwzrQ3oVuxaC8kfX/Jhgou1N8e7vaQTwPttWyGAu9fkVrr4I
 0cFhZY1HRei8aX7m/9ll5ETJXVq2Mtg8AciMtoyq/E6admcIudggq3GVfHwINkGm7IbDKyjpWws
 Big3pSA/Y/TBVxfbEcSnvfgJdTAybM/K7VtWroem+cYZR52ipU7HJT4rwDOyVLMj5iyWZSeZXw3
 ITaxQckh2kJmTob4jX5Ni4GAy6FpaPpijxvvO1NX+xgDrzJVmleH6Ee3KbwITIdytZtLLNZI8jT
 ZOnRRtO8aMGaLFFil2g==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a31aec6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SuvoWwvw_XIP34NGM4IA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vxDRP_gnzwC-aThqgVXUf_i0NkWTgGFv
X-Proofpoint-GUID: vxDRP_gnzwC-aThqgVXUf_i0NkWTgGFv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX4OpXdmgAfc9f
 /ib1zaGEWzbhgJvwNvC+2J1ybw5bKqjY6q9XX6ol4LSHNgkCg8KXcD6rMPMt9ZegV3QLsi8x+X6
 qt2pEgdN4rDLz/iWgfkaUV7drZK5XIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113467-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mpratyus@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7F8E695227

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e58c87fc8cb0..3df09cfd17a4 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -15,6 +16,8 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -1851,6 +1854,42 @@ glink-edge {
 				mboxes = <&apcs_glb 12>;
 				qcom,remote-pid = <1>;
 				label = "mpss";
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "modem_apps";
+					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
+					qcom,intents = <200 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.34.1


