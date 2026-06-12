Return-Path: <linux-arm-msm+bounces-112968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6aG5ES1iLGoOQQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 21:46:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C664167C2DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 21:46:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EIOFReCy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dO6cjPwp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112968-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112968-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 797B33450996
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5483A390992;
	Fri, 12 Jun 2026 19:44:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37239733E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293469; cv=none; b=DqQTjOu26toZGK/m/VtaV+Ynu/ejG5gxtZilRxlGkf8yb4ul2FWkz2x0tPlT2Yh575elb8cFsVmRfHXJICqc18T/RUva6iAgvK7Vn6SIsZNxRJ7lLBA9mryYFbPKMwLvodlrZkcWcQM/zDK9h492ZfoH/EX8ibVWirMZMx+4qOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293469; c=relaxed/simple;
	bh=VOMbj2ZE6cMRmBwdvDtc8IMkWEVRVNHHLBnh+HmMZZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBTbuX47vSg5VXRoVH+SU7UCErSikl0das1cySNNWs13zQfYMcmcyJ93fqyrE0u3o44NtAMBhX/f8e3oum04F4w3AuaMIITJviCjngkREH5TUISgUI6Y6i9fAcG0d9WPs1iqPOLRaBdp51FxA45JISVZeJPgkxbjd8bY1XUaU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIOFReCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO6cjPwp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSkQq001448
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UeYZzjCNeIR
	vXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=; b=EIOFReCyWj90CdXptjNq/7Zb8LV
	BA5d24GkO1FG1Qq31A+PFf0nSNgb+RKaXsyxZn++s/U+zGMm6I2r4DoWbfigiy+F
	LdvFy66YyJG8gZg+K45WAj+nZDbxcVfEdyNK5cX2F75gKEdZ0Lnpho6me4cIdOum
	KV+7yCn6Hx7USAyjYkH0UgsQ11EzLbxhpjihFiN9tvSbAV5e8EzNgjO91jPhu7+w
	zu4eralScTKJoXDIx8ALSHbWv2P3UaBUIrJlA9b5/QcPYZNPoVS1Iqsd/mlSU+mY
	sHG1Ol87fjunxrZCjPe/KtaVJjeHaglDnwdMRhn/JgLJrn9zAkgMchqcl1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7mtjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91598af506cso141385185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293465; x=1781898265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeYZzjCNeIRvXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=;
        b=dO6cjPwpzmOxEqbBvvw7IJD4xorpqukIcoXhn5+jDo+u2fOsmwNetbUug2TvBc3w37
         rovoNcXndcZK8/yo/+Y+woIhLtyhOJ3z5EXlvyJ5QfKoxRioVuf8VxnKXYDjErvjEIFV
         2JYdHOtsd/yT9422tFshJGF8pVBhw6PIJSax2C88XMj6NtlaBjqCjSNNmwdeRPoTQuV3
         NKUVeyltNMBWRftyb/3m4Tv+6/Mx3V97JqwyaiVO7m9V61mhhQtqPbmS6lqg0F8AKkzM
         QQt1x44u2C+no/0G0iD3X69/5XaEnlTgInFPaC/HJnSyC4+MnrtSJ4BA8rjy8L01/gNE
         RyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293465; x=1781898265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeYZzjCNeIRvXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=;
        b=avY6Ji/judKpAwwjYtPYkzcpMHRXsbUeszU0FpmEIa75uAeEx9RGW49rFGAh8tEeLS
         8BQ0TALyzTA4gGWt3JUzHEWVbS5gCfrrvSFJKR58+eo2KVCgaaqOqDY+TuMZO8A8f7UK
         3ECjdjdcBt3VoTlehkQMRzJKj/Q0czx2dsXg2u50gbT9JYeajUMEomL6UwNYg5rGYInJ
         VMKlsHuWvJV5NPa+r1gQC3dkMrf7udb0wMHkbx+gGbnDLF3nLxlnIXXwJtk2gRzJUYE+
         /Gi5V4OoAxWLKHdDhauW57VA6Fr1a62414TeP1Ce0SSQMVVmhUsYEiDMPVbEFvBNljuj
         5SCg==
X-Forwarded-Encrypted: i=1; AFNElJ/5g03rQBXO0LmF0G/HVyhE0PHwK7qXzYXijhptZjmnXzaEh+BiANL+pA4DOpeWjF56sM9LcauGeInf3NLE@vger.kernel.org
X-Gm-Message-State: AOJu0YyrXdXM/9s9zZZI2FqO5/KKUDl9Z7ySXnXPaJrbgG6wlNG+v7uk
	l/nrRyf2mktCZcaAcE2wTr2avlcz1/RyGATuFOe5SRsKJCzO8AszIfOE9MNcU9TByUYdF4EkKm8
	PZ4ulk/aL0Blrd9YLJGIBWGDOZwGAaqhetGBrgAJQPRDMiPKFma6YE6CcTLtakzcO4tEB
X-Gm-Gg: Acq92OG4ZLOm9J2m6wOGeQ5onmJXhosQUeidydJg/XNrYep0eAjwUKfZXmSBU3Q5vj8
	u1ycGcoBniiy2W4xeTw3o4j9W5gYcIsWR9dFNizrWoMlZrAU1pQ04IiU9jgv4GpD8cvGUf6P4HN
	D/b+3UxbggrnQR4laR1+H1jBatjrB5dM5oPrj6JmSLZDAG6YO83fAXtxRBbSWOfgHj4AoQyg2Qy
	EGCWnO/pX7LzRVXKQ6z4F6Wole3LXe/ljwmt/6ypU3Nbvps17pjxJupmZkL3tSBLjKq92CpjNo8
	/qowKDJzMZY0c0poJwcvETQUEP60H/fJ6fruYsX7JvtfMlDzmMF3Kox6VUltyVUO+1HDIe293of
	HBLy7hExBMKNWgBWMr9an8LgAuPTD/6YLoPHzT9Amja9Bkg==
X-Received: by 2002:a05:620a:2848:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9161bd65c64mr634195985a.41.1781293464696;
        Fri, 12 Jun 2026 12:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9161bd65c64mr634190985a.41.1781293464289;
        Fri, 12 Jun 2026 12:44:24 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:22 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
Date: Fri, 12 Jun 2026 22:44:15 +0300
Message-Id: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mxUVGRVv3wqk9ccqyg9UdcC8eHhPQfxY
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2c6199 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-MlWyOcUqUnKHFJa12MA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX2GgvL4R97VP/
 OlPLgsTKpt+32DGCtOF5W2RrPaToXvzMjoxmJiHlNeD81jdOLGl5/PwThf+KccERnef8qSRBVSM
 XcKfIa1Xne4gKbuJP91tYIWcsRZniLNwa+1hkUaSR5EtSiqqhzgsD7jeAT7EhMeJT/5nFPmLSKm
 QNlmI25fTmYQyFnDCeAjzcmEXSmIDT5ciB0U6XH5mUUPF5qLtwyu0LtOW0zKstFSSstDPChfs8t
 m/JAoe8RXKGRqOzfKX16x/XsSFcUxYGNvIOgqpSLWWyyGjx7BCq9HWyPGd/ox57CvVqeUZPxK53
 Vw0rmnjBa9GA5kBD2DsU7xIBVl4HXu2UdsjLCH8h8Xcaza4yACB1l2Y2rK0IdsAkQTBUR6ZVz2K
 FEzj+g8hRCG7JYKkhVtk8rUdNrMngCk93affprZyJIkGIyY3fcl2sYAlyruebkIuWYfdFFtKuoC
 4wFT6Oqfw/p+jJY4kmg==
X-Proofpoint-ORIG-GUID: mxUVGRVv3wqk9ccqyg9UdcC8eHhPQfxY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX/aFsFH1FPa6u
 ITul6uavVa6hWhWpCHc7fXYihLOOWwIiGSAD454P43gvqkqj1TZzH4OULbGWtWVSCO7iYu2+GWU
 iTyvrEqUi7AU653J4FSg7xTAvEAwpoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120186
X-Rspamd-Action: no action
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
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-112968-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C664167C2DF

Add the missing JPEG encoder hardware node in SM8550 DTS so the
new qcom-jpeg V4L2 encoder driver can bind and operate on this
platform.

The node wires the resources expected by the binding and driver,
including clocks, power domain, IOMMUs and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..8090b8b1d7bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3677,6 +3677,48 @@ port@7 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac4e000 {
+			cell-index = <0>;
+			compatible = "qcom,sm8550-jenc";
+
+			reg = <0 0xac4e000 0 0x4000>;
+			reg-names = "jpeg";
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "gcc_hf_axi",
+				      "gcc_sf_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "camnoc_axi",
+				      "jpeg";
+
+			iommus = <&apps_smmu 0x20C0 0x20>,
+				 <&apps_smmu 0x20E0 0x20>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8550-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
-- 
2.34.1


