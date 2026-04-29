Return-Path: <linux-arm-msm+bounces-105263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMksDWA78mlypAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:09:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E31498046
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC4AF31378C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F30B41B36B;
	Wed, 29 Apr 2026 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3rhJFFv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj2cFFQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4349C41B371
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482141; cv=none; b=t0cNp1VheXHGJlVIZM4R3jjNDpSHbbf80XAIi42x/bNnkV4wcwAZSt0eGZIz8LQw/7hAH0UsXbyNuUssGvUG0XBHNmVyJiNlbmzcS/BdDPKU1HN1yIk+HxM3ttlEm0weKkLnhMXbaVLsPA+SFiRXYRH42qW+4WLYnjuv+tl5ZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482141; c=relaxed/simple;
	bh=GR/YalO0fiQsOhoEWoJSrnxXoPSU+BG2jEl0tP4uuOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Smnn5fUG0VY+pQNa5EuXyybu1bEJA+wjg42gWLuxUDvu3Cp0H90okdkWGM/99rXPIH7heYkPFq4y7AwNL7Efbbz9fvADjoR/HFRS2w+MDnFKsG7Zfa+NPo2tEMfUqNVo5GAzn9Wgc5ww1baXM7NRY6NTFnTOx32LJ4IMxVESGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3rhJFFv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj2cFFQ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF4a513066948
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJMUbFM9OeJCR/xO5RmbmZl7e2974jJLhUj6r2MozRw=; b=L3rhJFFvcA42JGRu
	OqL7N/ZWsG9a3fJaUrl4ziUIH0gg+UoLkziqNuLnU1FxL/VQOoUPjHsh8vmifC04
	0e5WZitGqPXUJQ+MJ5TgiGTdSHUIvbf77+fMlN8PEdiTd5N/ivtCZ5YwmRPzHvv1
	+fwbAY0y8kSH34JP1oH5S3Vf6rc8vYDdNLWVY+oVaT3Z8ogN657cysLLMWUg7tan
	njHUCMHFL1T3kPXdMNy7hPLYpaBnh9yhzQm0tda1j9GrSG1fwi/ekLP+odJ3+HJG
	cfodAdgjkZlWE1ukVJlvMylWQq42QnrLdSYBful6xJDN+t8jzpEvZqkyVepmnwNO
	50qETA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxbnkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242b9359aso189385ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482138; x=1778086938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJMUbFM9OeJCR/xO5RmbmZl7e2974jJLhUj6r2MozRw=;
        b=dj2cFFQ5WEDC+8qNUAnV8hJ72EFWTBGYBAcerRLsUnciJEYkcU5WiJJLTG+S2lxNo6
         BsUz+AO+bSPl6rHdyjHJgJXXUh9c/h5ZXyZHtVw04pR1SdoUq9qFcpoVJwQ1hhaOTV9F
         bEDS55bT+3noQOz/wHsLTVlyZlnZEijEQhQVXtvkcAiGvt/JcbpUt+6mAyN1+tZeW9r0
         XUzsIMC6Fb1P2cIGwOB8N8gU1YQIYYHgn/arEqQHmTKfOsI91oW0wjJJyFqE3GUP9Jwn
         s+upsM41t0vepMUV72j/34uKcrZbZX4KrftXDFYDHf/E968mdG04c/xd1NA2QG1dmcCw
         DZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482138; x=1778086938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJMUbFM9OeJCR/xO5RmbmZl7e2974jJLhUj6r2MozRw=;
        b=WlQO+B2B6Bp2MliwfYN4m7tcSIRC1sGSj/SfTnM2JfD6TM0KHBUj8eJIHh7DWuCxyM
         usxug6YwlDzr1RwxlEUTakxA2/u44osZEs35UDCk3UO0HaCh+g2Zr51s5Co8oTtkbxg0
         yVSjm6HBZLAEscWoVFrP5mu2DhG+7EOKD/BC1KTQAGPWxRtHS0R/SKZq+4Xlw8RCgQXl
         9BXfbkB0Hq/ZuOb4577MeOWpS8V7CPOWCJdtnpKXoJyHdaiz6bexJPNid74GEUa7KEmJ
         1BDWSwIRKlOOZ3eWx2rKWthg3az4GO3dLS8IF6ycbDjBenfW6JSCPtCo7PROi/lKSaep
         GdUg==
X-Gm-Message-State: AOJu0YyveaHVkyHrUktkBz0ZtIc9cR5GHcjCWfyoTJBYH/bsmkOTqLJ3
	If5SwEZMTqtigm1j9W04b2rDeoJGYTfbAUAo/F/K3oV1HLm4ntqLJUc6S34Ml8Ot4xDEpgLSJ72
	4RvYWJ4FxaHEWPj5I3HA+gt8nSWT5iWFNJ8vjk2a6F6mtIi6MAygXfyjTWToLhazF3AqS
X-Gm-Gg: AeBDiev/WgIAyvB3WXX/iyQnBKGdyeKC4ugS58p/sHaGovRMT3bFIUbrpwpt9Smoheb
	8FFGe8VSBpTbxSGfTbbmg8yZWVYqxOVB9T8QU9cpNiIC/pkKTPv6hhyvPtfnzFwzLAN92ZJQXgu
	OoNGso6fQCW8XAvEn5DdX17EZzhSATsf71RBKX+tQh3oAd6de2hATI3UBMtAD7BvUq5l6G/uR40
	L+iwUSHlVLZeZvh3FGY1RY3jfgT3ppGp2UKrhYH05E2mrMR6t9phHdYUBvPBAhXqfj3goOGV8hC
	schslr0m0Z/Pg/v5Bw7j7DKHQ+w20yqWpqfEXCg/0hysaN+yVjv0wwNnAAiLDDnTIiDVWOEtqBQ
	dKuIzMF6qGRtRydP+PZF0Rs7ltIhnqIcwdq91uvRoNUKh4/179ZZxLMaXhG4sftxu1NpD
X-Received: by 2002:a17:902:d2cc:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2b97c412667mr85546835ad.4.1777482137840;
        Wed, 29 Apr 2026 10:02:17 -0700 (PDT)
X-Received: by 2002:a17:902:d2cc:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2b97c412667mr85545615ad.4.1777482137140;
        Wed, 29 Apr 2026 10:02:17 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:02:16 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:42 +0530
Subject: [PATCH v5 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-7-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=1402;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=GR/YalO0fiQsOhoEWoJSrnxXoPSU+BG2jEl0tP4uuOA=;
 b=xFKh/7cZnMGeFn9XbPu8R8GG05s3Fm+Cx8/GXHZrWm/SthSw2mjw1pb7Ty9ZbqG06EhZG00ec
 aA0cVifpvCJBsjrjqODM7rqBur4XN2m6jrxp3PkoQ1kolmQN99y5SxU
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: njv22mxH0VF0yvDhws16sDNU8O5-HAwX
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f2399b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=va74t0jcI0ebB8ul8YAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX9zoQZcWhj+Gl
 f3iZDm0y5nvyx+51eupPOcbejKkIYaSdUGXoaSiVWG5EVQJlKitDczM6y5l06KI8yF75+fZZSCK
 7vJ8VCG6+79g/NeW4QzsK/2WbZET8kJJtKQrQATUWHrSd1peWbvp0gLBBl0VzpnRzwREFb+LpuF
 tHQ+8hOKx7QWIoIcu58RfpCEia3tm+VlLipkoHy91tcgutIHYVtMyiFRdMyK4jzfjF7V7Way2PL
 hlt9prZs1z1ZYFXPLtuY4XTrX3WoSM8c0/wM+c/nmh8smOdYD7OeqCPc4X6ImQr6rg0PDYTuC9T
 ogEB6ror8g61F2vILMOcL35hgRsC9dwS8g92Rwa+/9Gq/a3r1/AItlIKKU/RzQnrbzdQwkVKo8n
 Nvga/u64pb0gsAHEb1nWMOlMn0J6WlfboxrXHtJpdReoeqL/p4JYcMR7/loc3qtc0O4nebQfzkQ
 iI74SCzBNG3dNkAxKGw==
X-Proofpoint-ORIG-GUID: njv22mxH0VF0yvDhws16sDNU8O5-HAwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290171
X-Rspamd-Queue-Id: B8E31498046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105263-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88dc000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without this path, the interconnect framework cannot
correctly vote for the bandwidth required by QSPI DMA data transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a4b17564469e..8341a7c4a4c6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2866,9 +2866,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&config_noc SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


