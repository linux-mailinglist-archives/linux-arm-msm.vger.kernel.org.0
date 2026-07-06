Return-Path: <linux-arm-msm+bounces-116671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oxw+G2BcS2phQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:42:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342F70DB35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:42:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hlq8kI0h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cLBjVKVB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116671-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116671-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D73731349A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C973C13EF;
	Mon,  6 Jul 2026 07:11:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315739281B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:11:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321898; cv=none; b=Pc+tRrWtGL5dX1hhjT2my+3Qj8EjQdUSRXBDEarU3E2Kd1PkaOjl9WgF1TfkNEVFfCgT3ip9vMJtOPvahKy764+y+Marpsf3FXpls4bb8RHnHgYLKTHehrv8tS+V7xiEisIlm0eFxHiKxV9U98pqYdJg7yzYTEyhxTPu5JgTXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321898; c=relaxed/simple;
	bh=TOQJxNULiklYva5GtZvPg2vR0ieetZoPJmde1SseNns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=apMdliZr6LyxOv5DyFqu6RSO65/8tFserEiS5QNzMr6uOvB3aqxldY72tsdJ7MIWqGA7DSe+0xaDW6nK7GzKP3wVrH0N1/enKifvP0reT7kKGNm3S0pZG5S/rwwv3s7sI8Q7yGeoUKifkPmxrPX3gv6IBsEy1g9kc3B8yFXqsJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlq8kI0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLBjVKVB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TTO3616924
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=STeIGRcFLrK
	xSeTilY6t4degzcf5r4/MkwEugpmVYMI=; b=hlq8kI0hP8x7GBUXObcjV4k17PW
	hiJ7ePBh8hfcRCX01r1fz5UkzMMzUbEVfRmNcMNDx0WUnQZUJvKXHXEpQad0LUmX
	UuODIDldJXFxvRtCnKGxVn4L+z7W5wemI/KuYU3u15Elt5I6ALwrtfs0TEaG7fUp
	x1TuH+wLlMGCSvpPjnGUBIW0RNEELiA+kLPVl+suQ9dl7Kucu1Pmwea9a04DzDER
	T2TfB42Pkfw327GEgdXUDJEaRt9Oe+xDNqTTCVrDjDM2MNNZnmsuNtdCgWqBJwP/
	ipzXfFNr+Teeqbc7VCYtv1yVwVzyId98IGSYixTknx7VNUuuYh5N5lD8YrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64n3e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:11:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e68cb7a3eso507171385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321885; x=1783926685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STeIGRcFLrKxSeTilY6t4degzcf5r4/MkwEugpmVYMI=;
        b=cLBjVKVBUSyLIOSnvzMnLD6yOW3Rc7NXOHlH8EdfqEl9VwJyODDytZJmV9WDUhOho8
         kyySCgowuQGlXPoexFSKKYvsBckk+4L3C/TBIYu1537QW0MnRzAsMAhUgBcOnec+DBO3
         wLTFD1J0Qj/m4hcz1QXK7MYDfXpPx1QX8g+xKCDtphuwdekLF+QfGA9XPY7jSu5Ewz3I
         VtEx4Cl6Qc31m2yElnNp2wtJU8Pg0zeFtPsA+BIfaoH2sHDPuj9e/68bondOi9r/ZpKe
         GcNyyfP2y0rK5JD0d1bZEMkeCKQkU+ppgqTatFrJ72pImqRPeppsl24CKLK7u1sO+WYs
         MN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321885; x=1783926685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=STeIGRcFLrKxSeTilY6t4degzcf5r4/MkwEugpmVYMI=;
        b=q999rbV5JTHWH132mQRJ3+5adKxUSrNi6xSSC8p3H9DljtMPRcGiSSoLzaYPHeuEot
         khtdCl4/fmhuCw74Dyotd+Dkq0LnWh9taCwVBDfL9DqCy+/XXJ9LpUYdRtDcAzEqi77c
         kY4IhXmkAk2RTFzsGGxQzCDVsOgs3aVz3qo9kh7I/ZdgcSdDZUeUk05FVJKAUG1j/CDs
         YUowqh2+YxcDXZ9Rob+lXNg+ewMkuMIffXaIwTUnZ2bNoEUqSSZccHQ2eEcF6YBAj/+U
         CJ85hwvcZH3gxWwE5w9+gW4XwUZPP3d2wlnAyJws2nCR1nZU0u4riMixjJNhExbR8V+o
         v+Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rqi/tWw+YElmKp0k1Z8VKzG3GCBwqOSd/ndbAiQ9gf25xfr57vaEp8ED45XeKvInkZOMKEnrQQ2vHP1pj+8@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQLyWNFgRfRAsHCXE/GW6RTvNLs/ud8o/cAAFZAXTEpb1+nAx
	3aA9RbXm27bXi9qP9olHdEO/dHTxu3MDb/Am6Pid3bVk7ddzNDOwWPkT40S65OKPFkqk4SxT+k7
	aFnDiTZsLx9UKWWjTSSRgi+QXA7s65CpGpyJEDGaQ+VbhjXaAw+S7jSm4wkjDI1wkc59B
X-Gm-Gg: AfdE7ckCb6AztXrCfTGprh8U0oGA1ZDYRDndFMTBgmT/wkQCY1vALYFsFkjoisiFgM1
	H70mpK9g73vNdyv/kWky/F8fPNWdCC9eiHbRHtb3CjNPJd8vA566bKRsWJi+cGjqZBbZ8E63k1s
	npT/n/u/wyABv3zJlhgSd/P1sRgKZEqDK8xU6c6YLroKi7MAjFqSVkufMBlrF75haRFkTvh+b7e
	GPqUQApOQRiRdD3g9/ztgArME0/+yosKK+O1Glq9i8EQnVamG1QDRPmfKws6vB/Jzeg62qBec6H
	xnBjQWoKe7eD+/TG7DgGNaxb10FS1PoM4+TjcxpIRjMx+/DGne935w+UGqxTWCxDWagmOct+/ns
	31StC1sCU4EHo/Ts9PKVS+68VM0kBPBKhXTo=
X-Received: by 2002:a05:620a:4503:b0:910:87f4:9a26 with SMTP id af79cd13be357-92e9a419085mr1274121585a.41.1783321885165;
        Mon, 06 Jul 2026 00:11:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:910:87f4:9a26 with SMTP id af79cd13be357-92e9a419085mr1274118785a.41.1783321884602;
        Mon, 06 Jul 2026 00:11:24 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:23 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon,  6 Jul 2026 10:11:12 +0300
Message-Id: <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX7ANwOAwKdhc1
 MubW7Q9pv5JjFiP0K8ejJ58pPkx9Nfl0zvTJJui/3FMMqCaBa4+lzxJV9sMpLu9DO+y3xyhDt1O
 0+3W2kZH3KhaizAwGHrnC/WB3jd7pa+d8DNtLjD7V+AazfvSd8R8lFSLF7fQRapjkqIBTVy5Jrt
 kCO+tdAah/2hhGnYJhtwzVLjAIkXDNTt3uiQxmlJ3H+MLEzFfMU/bHyhYfI5AZk+De8ztcVfNGk
 KsPRpXMwGB+375bVvTjReZQ4+JBxU9gAPZ2FJI/oIjZ8SSeNTR/6CAACibqVOgJk2gdwaWrjgEa
 EaBCY8VmZaxx/0s5SHKvpNQDKHoOFvaHqWrSSYThxThE6BKznJzpUDBwrXgQz2Pcu4DiqUz5dJZ
 F9qF8dAuBb+QGTgMup6LDBC/yL78UMRy4bKeCyDECR8XuOOUbrsyIv3HxiOfKXfwymye35+3Lue
 eQqV0xC8nVifvlFtq7g==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b551d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iYwodULRRiReAau0VbEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fOL6IuPdJ2Mi9GBQ3vGevL2GBRbS7mcQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX4p/jUyklFM4f
 bgghfYONjoRqzeDBbFrpwXhvFYdpvyHIkFazP9DHSsN6Nk6hNxGd9bc1kUSb6CgFF7xJtLXhHzT
 9cfMGJ2tFNKsZvSfOoMdpbt7MdqrmKg=
X-Proofpoint-GUID: fOL6IuPdJ2Mi9GBQ3vGevL2GBRbS7mcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116671-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6342F70DB35

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..a089b706f60c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
 
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			status = "disabled";
 
 			reg = <0 0x0ac6a000 0 0x2000>,
@@ -4649,6 +4654,82 @@ port@5 {
 					reg = <5>;
 				};
 			};
+
+			jpeg-encoder@ac53000 {
+				compatible = "qcom,sm8250-jenc";
+
+				reg = <0 0x0ac53000 0 0x1000>;
+
+				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>,
+					 <&camcc CAM_CC_CPAS_AHB_CLK>,
+					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+					 <&camcc CAM_CC_JPEG_CLK>;
+
+				clock-names = "hf_axi",
+					      "sf_axi",
+					      "core_ahb",
+					      "cpas_ahb",
+					      "cnoc_axi",
+					      "jpeg";
+
+				interconnects = <&gem_noc MASTER_AMPSS_M0
+						 QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_CAMERA_CFG
+						 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&mmss_noc MASTER_CAMNOC_HF
+						 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0
+						 QCOM_ICC_TAG_ALWAYS>,
+						<&mmss_noc MASTER_CAMNOC_SF
+						 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0
+						 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "cpu-cfg",
+						     "hf-mnoc",
+						     "sf-mnoc";
+
+				iommus = <&apps_smmu 0x2040 0x400>;
+
+				operating-points-v2 = <&jpeg_opp_table>;
+
+				jpeg_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-100000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <100000000>;
+						required-opps = <&rpmhpd_opp_min_svs>;
+					};
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <400000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-480000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <480000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1


