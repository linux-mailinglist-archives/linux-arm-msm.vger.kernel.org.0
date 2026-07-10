Return-Path: <linux-arm-msm+bounces-118202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u1cSGi+9UGqI4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:36:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C9739223
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:36:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b6g0Ju2w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="kW+em/Ni";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07B3130D7A57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038113DB324;
	Fri, 10 Jul 2026 09:05:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D93F2100
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674310; cv=none; b=WIK+KZNNMc/tB1HHbjzieYiZ3SLaIGQbBsFnKWlaZo+VxyowfxujHoLoJljLegxLrOLfYwiLSMGjRgwhs1lWEQxPgQpjK7bsNzBWcGH9pgKibCUEH0jNvDqB4c1RZabkkaatOrUH2T0+mvC3nZoMr3IeoRDi0zx29S+LbI+XAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674310; c=relaxed/simple;
	bh=SzvTslI/0rJw+ojS6p2oVMofrR8mq52q6PRHLns1hqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSX74d8XYGb4oYrO8jglDJgQddDnkB3AySt+hU/8N/QZLnbvbJH2u7EH4ZBYht3lMQPXLSbnV6QbAo6HXCrXk1/KWJjxMmHopwfrq8MTWKkByOL+CFol8uRvhoReAActA2upBTZpVq+KhORjvRwT2pGOku5LGKMBpd1rdyu+jiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6g0Ju2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kW+em/Ni; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dI5F171948
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4yczvZPnvjUavtM9iyfNq5RJVHkn2SJJHAhN5SbVGM=; b=b6g0Ju2wuJ4rnKTx
	F7t9LsGn0cpBhoJgBYJQTCK+gDqmIjHboPgtuR0/Uqx3DP2rxw1Jd6qLXxIiVZ+r
	EO7v7SouPiOtBXF7B4kuqcLScjY7o9pz+pUhwe6zyuwImHg7LEVeKc9jtcI/IBW9
	aF3FvuKg38GE/eb1NCT4nefkHM8YuWPOxbsuHl0UBBekQOGpXMoOiEQvJyATnFGd
	iVk3eVTWDZAZFu6bpNbdbhHzA/0BBFn0O3/9VO16YZ4Ty5Sau8TqA0SmAoURGdo8
	mj5NqNH3huYpzuZ899ngpQIO7dKkQCAB5p+f5IIO69V2Jj2wL+kGfxIHO1v7HCUy
	1KTgVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9qm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso21604271cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674307; x=1784279107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4yczvZPnvjUavtM9iyfNq5RJVHkn2SJJHAhN5SbVGM=;
        b=kW+em/Nia1uxmyJ6BhN4NkF5Ha4vQum7wwruzfH+yKkiYnVbW5Nm1Ipc8QsPEwzQjb
         hDVUaYUCujF3DlHlsePCoIPr3ueToNdcDh8ZGR4pNL8e/EqnfFence7u5UW8KigCqld9
         NFwuEWONfy/heb2RYPf6j6QyMZp/PZPK0WgnfjL7qoiiSRVZZshJVfUAipdA94Mt3Ful
         5K62BeKf1rDVWVo6cexYU2E1GrfZ9n6U2s2UC5uQFAaqBLrtFJnqmERGZA6ToV9hZf4k
         NgmYyRwptybW+KX8/d+0TouIi8x+s+FNM01o92VdyYr2PCTnD5Ral4d1gx48kE9LNh5W
         yyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674307; x=1784279107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4yczvZPnvjUavtM9iyfNq5RJVHkn2SJJHAhN5SbVGM=;
        b=Av5Q8zIwolUhQTm+lQev6jIuFYWgoMR+NVEy1oPNLxRa5/jUkniObW8xtg/y6FgYAI
         7dxAU4ZNobvis1djnDap3ZWHubvfudRhzTiUdmFpeux7pB9cOuPSzkemQoFqNJQSCHih
         EDad0Vjnb9N7nCX0ZFJKC16G51t4sZTiIn0glXGOXsmF5lmsSKKeIXBB9eEtnTwlaVzu
         57J2tjTGh1UQWrxH5+KJAcZN1UMCAHXfnrf6BkySsNTOzcGQY5uGLu0T7QtCfPb84rC4
         OGHrJaVKTeronDBTQcYrGuNVeyerhfgw5/2KlOrIQn7q0lLZiGGyFcy02HQeYZn2Nz+i
         LZrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4CdIbVkc6BoodvLihwWTnEWi6uGY80HWHlyzVstP1lMa+racAu4gwoGaUsQlHyHwDdsjze+qdp3H1FVOK@vger.kernel.org
X-Gm-Message-State: AOJu0YzAzlFM+AX6vuixosMI5M1jjFpZmElYsFEGGaUej893tWdIrI4D
	MqZpAL2wlkS5GJn11KZsZ5eRdJebgCaRSHkR73+78S5PnliJVJBU0FjLiEggXmce3dd9txR8UeT
	qli8lxJYPlZZeayOboKiJDHNK/dKeIDzNiECEqtQm1nrruPXMB504ddh+GIGmBDzt/S4D
X-Gm-Gg: AfdE7ckvo5Qjrt0U3I3iwCyO5bmTJx2F3MbIQmlhjykuyleD02VQM20q02YZyMZybFx
	ms63apQSMCW8CBwMg+E/P6MVQGrgIIDxTBqpu6QMpZa0rtcMxQsOvuI8l9fHzrex3Quyv0rrDe8
	lClasUMNNTuDJMX8K+2UcQNRgh+plj/T2NCsp0S5ykKreiwVvJuiMBw4I58mrWQ0TRsN+OPzxkA
	T1J3AUTknUjqeIbZHfy8/JP2Y4BXJ4X8E1WJcX2NlcXwut2Uk9Dt7ycKdS0U72p6T+Kf8pbiaM2
	cbYHKUCIRrhgtKMC+7U8ToZbijjLz+d/VVfyNjPG2U1nlZq9Ipp5RigG/5VdDbPx9wxu1jI9K6d
	b9rDaIK8Crv6sfkPeiosId/c2lzzYbbCJXfrGli1j0x9l3JSOF4ctxZcmOM2PfbMducz3voJcPQ
	+fg21MTCbvx8q2JnCctTpzV5MocMbhh+3Jr3C+mTH3wycc7+CaBU+O4JW/xV+UtA==
X-Received: by 2002:a05:622a:11:b0:516:dc75:1aca with SMTP id d75a77b69052e-51caa1286d1mr26301301cf.26.1783674306947;
        Fri, 10 Jul 2026 02:05:06 -0700 (PDT)
X-Received: by 2002:a05:622a:11:b0:516:dc75:1aca with SMTP id d75a77b69052e-51caa1286d1mr26300891cf.26.1783674306432;
        Fri, 10 Jul 2026 02:05:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:05:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:53 +0200
Subject: [PATCH v4 7/7] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-7-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50b5c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=iG3BWBHXWT8vAauT:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfXz31W+z2CzBOK
 C4LG3wrrAIkpksBljxPFwhjD9Tp8yfeoCMWCMVHLQ25vrisv9SGVcYxMhcSh8FHU6j0zUVpaY4O
 oaERsIVE4Cp2zNqfY3zfX/FdY25D8I77IpSnE8DkL7WapODRRhnwOOFF9WJyqJuTHVdAH36hK/V
 TTd3EfCSxZGIWSEtUetukYYPC7KoqH9r/gXRH4+Fzfbkkn8k+NcOjvsC0c3ceh5WdtybU2aWy9p
 5uaRdYYzc4FHl/5WimyOgPy5w/JcJ5ZN+mdZOgujm3I130b+dAiQgJkNwu22pAfHpwQRZEafvHS
 ihqYjmt2CGKBh7/HBUTMijQVpY7Ap3RJ1icQ3bhk14FsnFlYrVOii47LbC3PBVtNEY/aODVA13q
 VFKMlAsjjQMtegdRg7qG8ezEYOBc/Xa77hPGeSi1d3WSNyn1yWN0r9Flj+KyG9eA8Esg6dCRaHr
 e8Kz5SRh+u0YY6wet/g==
X-Proofpoint-ORIG-GUID: Ie7CCTA3y4lgGDbYNredlU0w9XZxvTGY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX/azqKolLZ9ES
 39Edq7TP95G6R/C+Cqcq9nIltWH0J/Qcy9HtaZANiVq7UpOHbCpf2qTHJDNTHI2lEUkR4eV6K3R
 VScxR6WbalNacwGZRbrhKLpTX1bAlAU=
X-Proofpoint-GUID: Ie7CCTA3y4lgGDbYNredlU0w9XZxvTGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118202-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 542C9739223

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 74 ++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..87bdf9df4b16f7f1b9a5129cf8cd81da1ca9da97 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1935,6 +1935,80 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42400 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					      "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1


