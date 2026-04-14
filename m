Return-Path: <linux-arm-msm+bounces-103188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLk8OQl13mkqEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:10:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E13FCDF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 390F0307FF9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B0B3B2BA;
	Tue, 14 Apr 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfMsmIsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3ytqozZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2591924E4A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186548; cv=none; b=dMkhtrbOCOVXM+WEdIr2lNMVWWsyemkHj8KjpN1cQ2MjK0R32whmEYXxbOX4iMdq7huUhojE0bKh7LmuhVgr+6fnBrrYMuZQGZ5j3G/E1ry6IOoOz/oNwRUXe68s0ZVfoZz2AgTQ7tXq5z1qwPGq+c0VCpj2qBcho4hunn88nV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186548; c=relaxed/simple;
	bh=IpvPgvKMIkkzzFuFPdE8c6VPCt08BcGP8tSrCPowhjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgfrfWr0JgsZ5lMR4yWyFalaw74hPkmFm1iopy0st/V9P5yLJ+JZoKw7JvwGxN28wi/9Vbvpo0tIHnhMrLh8WPI/EoZm97fhLLg2LemwTrXGhEbHe9ScFkCJotE05GksDjSGBxBHCvZOPkvPXVGvVwxFUKBJ7KT/vJ3bu9sUprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfMsmIsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3ytqozZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EFYiGH3936928
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PD6XdSaO/3pyxUrUmVsiAAOynJN3mgln1X4YOSNbMwg=; b=KfMsmIsyVs3OTNx/
	/F3lgE92+o9mgKmKKzRmrpvknECcE8mQ0Wqd0t0PG6brCsEr7NQIbNg4rymHPQ88
	E7IY9S7lVPuh94tLSa1Jw6BgtQlKsAuwjUNHum1M+LrIElM8fUHsggBroFP6GbHq
	YpidaHK/qY0dIINsPD+rq8B1EzSgVqC+H4cBxPWje/ZEgRXOOwsax4c32bYeL++B
	iIy2XJ16vbY8xkKwjLZC6Li/bRtyps3BiAkjVDShWjkKvHE15jSrk8apOYXQT2V6
	EyPdawnZgrLQ9+dpJpqMrmL7DTi7SKdbOwBSqGW7p8krWQnoShXFt6s3Tjf63UNm
	xMb0aQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf0cpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:09:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ec17dc21so30482115ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186546; x=1776791346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD6XdSaO/3pyxUrUmVsiAAOynJN3mgln1X4YOSNbMwg=;
        b=P3ytqozZPbF+xdxj99E1vkdXJ95wOBgg83LFB0ClLRXiLc4Pa8SD/68AsuFLZdOk3V
         /DaHSFhsY54ndqqAyNORdmWW9FJRQ1DfvgNgX/ZaQHtuVgZF6EwFHQEaVsqImEi6SL9y
         qqglPR1viC99Z5pZct3T42SRr7+H0WG1trMkqApyEsyHL4Wjodu3oMULSFac48QGcGu3
         sOuaJ9AGS4Th9qIjKkVq5LrKmQBxeebfpFDHLbk/V56M71uRfdY9NodOQb0L5u6F/1KH
         HmX8YQjH82cLhrurG5vFPLc2ZitKl3xr3p5eFDlsq+bewzYOjyMAToydCxYyL38zMxpw
         zC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186546; x=1776791346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PD6XdSaO/3pyxUrUmVsiAAOynJN3mgln1X4YOSNbMwg=;
        b=MYbhcmapZzfPhRAiem+1naZkueWcd6zexjj5Ieiu5TfXtNKldnV1iL2MS5uogjPlaJ
         BqrGmKU/vIz1hhb5QH3OLrdI07nvvVU1U7Ga0jVXOmrLQTwBTBrZN4caux48Nw2KvuAQ
         BP9jcgafUcDZT5V8qJe5q4b/+y8G/8FYql4OyBaxLoGZjg1lysD2ZAEcosqDRJS21Lnh
         L3O0rz/wE9lLtKm1Mmv1Y/76uUjp1p3Kx7DeI2Ack11KeSGFe6Rr9ul3bOvgVsswOayA
         OPqhshmOjU7eQeGhwB+bULkremku68gZq6695i6ftXGyxfFZ2B9F+GcdG0U0Yx/mxQjJ
         dO9w==
X-Gm-Message-State: AOJu0Yz3vt2GhIoAAmU5hWZeVikC1WVBUdXbSbF90t0MsnCqCSWwrvXB
	iPXPAxHR90YwyJVLCN2bxqDKY0nPO51uFIOstzZmZHSTo4a2b2Kl239cwGQ9yXFOIbvZny8lbfV
	N9j70jbXiOKasxjwtjhkjlm/xM1vu9WTpqiNE3wvZeWcIPzJa7RCOw8YADPqTe2qsebcU
X-Gm-Gg: AeBDiet+xOTu3UfFlpEgg7O12Z1hiH52d8ipNHsDGe9OFaR8/0lIv4Ol93zosw+a9Ad
	b7d6VbtAxp98Xr6L0xiI2On4Di2i7gY2YdsMyatCg2WX7kVVoTFtDfT/qCVKDIqbEEO9vxmdD2L
	LU2uBDFw+1aFYCFNtR6ZJ6fS4XxygSLev6ahUVT1RSYEcRq1xlHzPk7LRFMNYkCthTnQCM4cWY4
	xTk/WPKbIBeFT/YE0NbzacRGzW3P5EpP1SAo6knR3XzEIaP02kt2L9cEWpuBopVNsAUSTLnnTlZ
	eYoL54SaqgWtFeBZ6IEeAO1RU3R9zymAaWhpIZNjn2pYq7AEX2irzGdaFYrmTryBrz2Qufs2Ys+
	sl+ZTegGfBsCPN8FZwKmFVcXKoHR9D3rKhUupN42uLRA+v2rkyuoO4zSpGAledMgB+v8f
X-Received: by 2002:a17:903:32c4:b0:2b4:62b8:70a7 with SMTP id d9443c01a7336-2b462b87453mr76583985ad.10.1776186545717;
        Tue, 14 Apr 2026 10:09:05 -0700 (PDT)
X-Received: by 2002:a17:903:32c4:b0:2b4:62b8:70a7 with SMTP id d9443c01a7336-2b462b87453mr76583605ad.10.1776186545247;
        Tue, 14 Apr 2026 10:09:05 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:09:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:24 +0530
Subject: [PATCH v2 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=1326;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=IpvPgvKMIkkzzFuFPdE8c6VPCt08BcGP8tSrCPowhjc=;
 b=Tf/WwFzZ9RHByip5fK+/QOX//b7aOa3kLk9RgsrNcnKM2n/VJ44h7b2fdiG/8/UwH8FX4mFiW
 rBGwEzL9+FeC+K0NyVsXC+SVImbvnGl6tEx8GETDbEZbEQ/eQjpNlKH
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: OqFaI4T3DJ9cMAFBmmQExV6IX7C4kQ6s
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69de74b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DDoZI6XnaA0zmnrO1bYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: OqFaI4T3DJ9cMAFBmmQExV6IX7C4kQ6s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfX4cP2tYcDskg3
 oE3w1ozVgTgfYOw5FYgzPI+mP+t5zH9RvFTdpgiYNfLfwEwKT/51LNy4pCbhSzLa7wQSPbekvPL
 wJbsDJ+AJGfTSXf1m8kE6HY9XlW4ktFqAdJWVDChQMKoh/8UWgMbQzf2oNRD8cMjtUIVBgsK1Ap
 UX/kkgkDmNyuy6zRVBuMPP9pXmSGwnpSdlFBgbnorzABBoBhGB4eqopvr/X8qNZzoUR5TpZxeqy
 J45kdB6TuZbNeL24DskRc4vn11TYLGu5ppGdk+9RSbZP1a+tfDmaY7VULyJ+twF+QOKDuoT5YPa
 8ZvD8+J5cQZfdCHUtWlVy1XAwTdNcfCjsLubrQUWKsqHdJdYiJ0iI7LiWGh0LgdznyiC9YhvXjh
 DWtdsN8DjsUBPV/+S8rUHh3Ed/AdWdyVl0bSKFtOXoNz+gpO1s97YDRH8If8jwvfqsqPqt+Dqqj
 UqIaL4e+Y3d83KiIe0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103188-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88dc000:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 610E13FCDF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..105efb4b3aa4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


