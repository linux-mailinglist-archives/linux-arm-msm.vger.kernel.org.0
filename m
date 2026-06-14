Return-Path: <linux-arm-msm+bounces-113034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NFMONBlhLmr5ugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:06:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 674136809AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:06:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GAr8pcMi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JDC1LqtA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113034-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113034-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12AE43031CD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36EE2D7DC6;
	Sun, 14 Jun 2026 08:05:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F1175A9A
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424343; cv=none; b=BtQsA/T72hbkZrIItiPiAu1aSjrmIfLk4N8WL2kDe6DduCBXuH4cFury0leBc4praqY8nRQCw5+Dz6KCLE6WOm0DcFgW5oG2RtiW1l2gvSZBVf74clHg4Sjf40o7Q65egTFAxeeaK2wKR7WN9Dv+G1SUxJtXYQNWrFo4RDq+wYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424343; c=relaxed/simple;
	bh=bjspg4RGlRRJ+lWkvFxPGZiaw9MGEJLfXMpLoztY8ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJdqMoG0vDnMaUcfwExgrlpIUAfz4BIxoztQshK53V90I5N2J1o7tW1vVnHyGUTcSpKHY2NJLk5ZGJ+UFUDxtlEZ4ghUuXMX02hviRje7q8DP43OUoMvU6XsBCdwC8qzD5gyDlOaqFnOGk6T14yoRE35Hk92oGxi7p3b3Xzo1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAr8pcMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDC1LqtA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E4aF2u543524
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=; b=GAr8pcMiT7ZgK4ZD
	yhHYQIlVTgtP1Rls2ymm+0aVnleHeU0Q7BVr0tdlEvx0q3f0rUEtwvyR5/5syysM
	cYsgB9zKwcN0ZM8s1OkOoPIrufus6tJhIByHLsPO5u9f1xbzBsKMlfifeKjomaf3
	RsqZLO4BsoWobGPCZXMuwQLgRWvzSm8krIgLEI0ogMjN9VMuuNXUjzhevusCXmdu
	QHTGKfD411Myo+W4K9dYdhrW+GvwPywedgT7LW+9/NUT+MabWBIYDSBrbAOh8h2i
	9RO8TjHfTh6x8k7KCRQKiMEZz4+Z4T95xiRvfGNBYXUFD2dWj+qmrYwJbb3o2esv
	GWp9Bw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9531ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c272e532so24431185ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424340; x=1782029140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=JDC1LqtANaYejishbPTnllGXTbkUsE8u7v/X/QDlaAXnsxRdmjbiJwXO6pzQ+Yr6JP
         1CIz1CFGcRvmePQvM08wq2TKArAnt5mq+oJBdgelwNYdrnCjkOu5nsUIQEQcNrUcKw4C
         APlZI9Xlo7XS90cUXcq7EIc9UGcHO6uVBvAarfzXL7DGifHyB/G3YqXyZOyi7ERAmSZI
         x6Q1GyGPBVZwBvEW2cWpBKx7YqFCjduGTn+mqsDi8o37MMlgCee7Tp+PySGCIIXgqNTO
         g3oWd4RtbWb32kFlcuDcu9FLuz8IV/9Ww5D63uZnpGwhuHhtOr2rcZfSCqpN7n1qLi4K
         nF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424340; x=1782029140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=SD4n41uoxYtITrAgqCsfXXVRQF8w2axEb9PSlqHnoCH/DQJ0CI+puy2+U9YuBPR7X0
         u5XO7Foksyb0nSbNIanwn33RvoNsmYJGC7QTNgYzkDU4TUYcGBef+at7Ww5MNGXddAfl
         U6cTGMTUXQZ9cRqrBz2DNjcD1peohdGdkJkXaaLDP1tk7LiTwx4QnF+QGiZnKKrl5jg/
         yGi3mh9fOEpaUj5PByuJwSMiKBxjR74h9oeTSbKSk4QU2fAK8+BKLcDdX3ofPccfOGxq
         SoQB6YJ01Ktj/mJpUMOoQpGn1gtS5y+IfOnvZ6QuxVi/LPb/FpF1VDFMA+Cf8gSN+7Ya
         uhlA==
X-Gm-Message-State: AOJu0Yw8X9Izgz+2xEU5vTedgWXK5WukaJSFSxUBIQ4DlHKWws/PdeLL
	2rS1D7URXekTGYGUIFeWGuUijFhet1/QjuYs9FgNb4RfIgKA+VlAXIrrXDCgTG044KpHcaWxxZV
	EvkiHZErMM+bTyn5Rzpiv1bBH1eFgXH5QdxkmBQaJwCL5H+BKjs+7VRU7dhmjd1JHR/UO
X-Gm-Gg: Acq92OFl/psSb5ogsUn5Q9GSAm+CvKzgb7OgQzHf/pMNk8pDTzoelduPEdLTNMPH13u
	aC3gvO1fwAyjByOkqJ4RLBQx4NqMQf8kvNSTtGblIBJU8f1vzdfvSvllhbHJhhbFm56wZwjnZP0
	qG6iuaTZKnPCV95cS7e2n2PrBrDxPKWgOFK96lL/rWfwSq0vIZ3QJcehIQ2twL+pLNBmPXHOnFI
	nN4ThlUM3DSDiN5WPGcdPlSBtxddZeZUTolWY0Qt+orcuSJVb64CwKJ53nKlmbX0QQk9HnL9lZ1
	b3dtjVGfse1WUNelQM4/ULDrDKZpA/gJSsYYuTaMN4B28p4he9mTx1V9uYWKKHmg8o9H9svTid7
	Snw6NSeT5KYrYJIM2i6ZLEzMQdpgOocIf4z2kWoQf
X-Received: by 2002:a17:903:3bcf:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2c66421ff97mr64541345ad.34.1781424340412;
        Sun, 14 Jun 2026 01:05:40 -0700 (PDT)
X-Received: by 2002:a17:903:3bcf:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2c66421ff97mr64541215ad.34.1781424340016;
        Sun, 14 Jun 2026 01:05:40 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:10 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support for
 PMM8620AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=2376;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=F/Dag6hAiI52pCaHDtbl8w7fY3rlU7H+PFfQz62PGaA=;
 b=WOHuach6phVTy4G8gMm5uh5c5CLcaOQzA3a/noo/rm7qiGbRgeGIY8ZNUiwlHOwiO/yHDU+Lk
 kvLGY7r5N6hAsRYirrpTjni1z/GymRMlAw9ry1vhj33RMWvKpfxKfgH
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: X7NM6HrcI4SEq7pCgwudX1jWPAfy6qVU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX+7bIcZ5WswhP
 zUiO4PuoHDvTUCAkjwR8T++zkzBawrHm5YQJCuelFtwu6i3/3I3kw4PqWcpN+hk+iZb9EL2huiW
 lcZmJPqzwqYuyjlQBWHDMy5Y1b4zdVg=
X-Proofpoint-GUID: X7NM6HrcI4SEq7pCgwudX1jWPAfy6qVU
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2e60d5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5fc2j9ygtCN5jjOEnLIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX1ueOkVXQU8Q8
 sbZkw+47NM1CbT0U3OmGhe3TcwrN5CeevbtdjwZhseBS9CMlBvUdvrAwaSTmlJbIqkyb9BDAGjF
 MsxBqGh2Q/cr+AJNBORVaYNcH7VQXa5PhpDUZTIRr2wIVD/3DmFn9jdMvebyReenokDoNpzEpbh
 v65NPFk9LfsFDgJL0YrbZTNLnNH++V+ig6OuUTH96Nd/tN2kaNX8ogPaHZ7mW5GiXkmcRLXa5Qy
 sFXNW42s3ud0FSuUAKs43gK3XwLL66JOYtG2xuxAKEJmjLrWRqkLlRGRkgerIBuiXd5xU1yIQDP
 7Wxqljkdm4D5C5n8/F9vxzLhq3wrp4ZtldDGiG4UNyPYEWvtuTR2k4EN/4Y7/Itqg7DRQOlv3Yv
 yTBxJpu7Umwoq605jT/HYg3amzFvYbcIbcEa3ZU2D84fxIp10EyQK0uk3JhNzWcJXvr1iMWPuKL
 ErxBYEJy3ZmUjq3eDwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113034-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 674136809AF

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
present on the Monaco platform.

Each ADC node exposes the following ADC channels:
 - DIE_TEMP: PMIC die temperature channel
 - VPH_PWR: Battery/supply voltage channel

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719..232bcb942b54 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 &spmi_bus {
 	pmm8620au_0: pmic@0 {
@@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8620au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8620au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8620au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8620au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -37,6 +59,27 @@ pmm8650au_1: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8650au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8650au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8650au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8650au_1_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0


