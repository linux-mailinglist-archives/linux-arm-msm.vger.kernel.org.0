Return-Path: <linux-arm-msm+bounces-97494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EX1JJkOtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:18:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7F28397E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F50431A8959
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0A240DFB5;
	Fri, 13 Mar 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSLVS+aX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQEIPc43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DC814F9D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407884; cv=none; b=NBmT+fXzpwKe7bSNrEv7vO8oDmaXq8KdMJmr28/KgHujfLir6i6RGWCmim/+prDfqoVVqhhPGiVUaf9D0UHkyeLluCee/RnlnhUKK0P5hfpdqLufBl3i62eYscjNrF/epnDYyDU/jTq0tAcbq9xH07XlxivaMFr/P1tpHZYh3ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407884; c=relaxed/simple;
	bh=OM1gxmg0JWx1jl8o1gHWc0VOCOuMtRvWKZiZTcQPUgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=knBxK/Yeygu/NW99IgGNO2iUyNDY4EHa30W1rsIAysLXcPs9rlD0D1rR0m6VO1RrEhk2zfhxprcwlaANG80lIgTWvd6cp8TGISm2OTYry/l34g1iAkjWHb810J76RRG7W2NS40/WwwkfmSujGf5L6TQvHr2Rc5GH5qRdYpuxgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSLVS+aX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQEIPc43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmvJd2391114
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C4NRGGIwl9B
	oZAOUpjKtAbMbjvJkHNs7AMWSEkulpRs=; b=DSLVS+aXTEThVZiuHUwnazaFHJK
	EqLLJc7FPj6jGJWaqvrvW1Vl37JREykFYW9kohrqIhpybr1q+LMr6pSNwQKAVsgr
	+a1vJcrGsTaxAZ/PwqEyQ69qtjI3HwfczVjJyzv+9pH1YdsSpHdd4RhYYpzOZANc
	qYowdFQPDaGzX73q6WSEMysXApgS1Otkmx+aCP51kXU6nHGdAgh5KaXaN6IY2tiO
	49U0Yu4YZmCY7q0imK0w554MUTIUOH23dofuIniAHHGGlVezSm8jILgw+RXUuFxo
	o2TQLTWn/Beym3P+GMlTDLU4YqcgTLBN2gmD7LeZFFPDqO22kB7vPK1cdLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8e14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:18:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a17ec1eecso187522676d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407882; x=1774012682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4NRGGIwl9BoZAOUpjKtAbMbjvJkHNs7AMWSEkulpRs=;
        b=YQEIPc43IWwZl8Apd96NX2y3nIVrKi/DN3pVc6zQbnimbrICmGaXXZ5MNtxEucTMlO
         qjarKC06PNrFtMhz7AMh/EBkxBNBPKCGjL8YmIoz8UExtUbEnin6LQG/EGHeRj+OaDOF
         R6NFjl88q7W9wf1wSS33286rgdOB/rL83Ve7bwEjayLgtjTuhkUBC/aBc+qBFVmdL8d4
         H0Qshuf0AiegLra+llNOPxK4Cw06Y/O81J9Fgn/0SjZeYpbzJOHo1RVkcw4JKtv2ABNL
         siIycgGGGnbQIOJxoykFe7pZDPph9rPGJdqCaEvqmijacB/0NR87v/Pzi8874XN6aQPQ
         ehfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407882; x=1774012682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4NRGGIwl9BoZAOUpjKtAbMbjvJkHNs7AMWSEkulpRs=;
        b=PsW6Gcmfw2nXTEyWQpTcRGaDIj3aCuD+Ke/h2bMmQtoXbBvV/IBiyXlJCDizFgiiWU
         w2lIgaaFwmCOs4+zSvxap2ee/mxWsM0ueuLkVWYPGYYf4ciJr6f/iSVrJqp1uCbPGyQq
         PsazrMvv+AIq0eZMSmUGQ1FToziGitROuX6HYg0bxmZEqaURexr/XD7yRnrVYpbXe4Ao
         QbXuYIQbk3vByvA4q85LZYihOB/N+lvsO02qF0G7e8UOhOveBz/YdtfZFn7/cLPtG+yN
         z5/Z4E/naclz3E0Q6X7Lzi+NlHCHscK1NH0xEzW70H+j4JiLh1EOyMkxy76YD0zQ3r3R
         mKdA==
X-Forwarded-Encrypted: i=1; AJvYcCXsmtyHbQVLxUtFGQ3EH9bnbEcKw8Pv296z5w0UcmqZ3MUV5mku7/I90+t1beD/mg5QxB+v+FPoOpu9jNKa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe2m7uyYQMoLKUs4ADOPW2naEjv+zlgxKTXf8uMzWfAwRS2f/g
	qaiziQISIyER68WlYQazKgRoFDVRxsv0CF2PlAr6Z8VEHm2ZwYl5W1ggkfZkOa+d4Gpm8+vxdCM
	fEbCXydokc6GHW8pftHjksT3HjkfD+FJlj44X8TXV1XR2lt5XrmfLC+d0qcg/IsqPLCa1
X-Gm-Gg: ATEYQzypfrIIkNPXC+35w78jGOb9q7JdQicYKPrt+MuLIYCNfcI5VTLayb5HM6ghmA6
	WxYeRy5BxkjioUx+DI5wAOA5lDlwNr7Sstv6L9fOs7Mwu0Csu0U362javb7Fbz/Jdo4d3h3yl+/
	B+WmGSEBW3REBiVO4B7lhEMNbAoAu8o4qJ2b1V3TO99jTagaXB2NSUY8KyNVCybmo8o9XNszenk
	NKtrmc4JSo75wCzUYg9xVK2CXQysoOmZZx8vsrJaMvYcmXvLQHbIRrYKvvt9a1VvSJpOo9Pg06T
	QWRds28QOGqplcT5ZaTVE3gfYC4WUZ2R21KOZwMlkVtn57Atcs9kJh/pINz/psHOztlS97y7Xt7
	4xvYB8djWiK0lKKn0jnq8UhM1VGPrgRSHXdQA8SnTxC4crmXdntEiOT0hHBePTSK+ACjrTOoAx2
	IMOmFrMhGsp7NU
X-Received: by 2002:a05:620a:711a:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8cdb5a5543bmr440900685a.19.1773407881707;
        Fri, 13 Mar 2026 06:18:01 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8cdb5a5543bmr440893785a.19.1773407881072;
        Fri, 13 Mar 2026 06:18:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:17:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 2/5] media: qcom: camss: csid-340: Add VC-to-interface mapping
Date: Fri, 13 Mar 2026 14:17:47 +0100
Message-Id: <20260313131750.187518-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l6c-Ez3hvl2m079rI-kQtisjpvEinaLQ
X-Proofpoint-GUID: l6c-Ez3hvl2m079rI-kQtisjpvEinaLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX4jotIpGiXgDk
 DEbTC36vMR6O7iwbinu9XEAr5jtgp7sCfUWzvnJIDi8+FwSOUsMw/Ast0hWvZ/c99TWu13SogNT
 lOEmnrxeKEwZoHD/LmDKksT1udXL1yobipoITSLwXn6uoI6tHO+h7Jig4Y4naqDe0SyfTvv0n7Z
 S4H4L5MnRyoOqazhYYY+OJVol+NlZ4B0njJr8qp74ft9BpVClynSc1/Poxww+onD24pKErco45M
 Yrf8pZd4oZO/lAMcWuarGDV3yBElXi9b7eCqfYtQB+E5Y7DC2+/F+yZG9Q+N7IJCkimKQrGnvgT
 igaFEAtsq/naYaM+pT3wQO6jhW449ZlX05XPuHsYHUV6pDg17BKQgfaHU5J8H/fVdSMk8paI5nS
 eMcLUq3eKW6G7siP9IbB9LkE7VBoZk5/CmOomnxTq2FokVuENtjnhhy9uYu3vbTde1M0v3DQ8se
 Rg8HF9CLRAt7rnfma9A==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b40e8a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-uu0Hre1PwtQhwGgMcEA:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
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
	TAGGED_FROM(0.00)[bounces-97494-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26D7F28397E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CSID-340 block uses different register offsets for the PIX and RDI
interfaces, but the driver previously indexed these registers directly
with the VC number. This happened to work for RDI because the VC index
matches the RDI register layout, but this assumption breaks with upcoming
PIX interface support

Introduce an explicit VC-to-interface mapping and use the mapped iface
index when programming CSID_CFG0 and CSID_CTRL. This replaces the
standalone __csid_ctrl_rdi() helper and simplifies the RDI stream setup
path.

Also correct the CSID_CFG0/CTRL base offsets and clean up the code in
preparation for full PIX path support.

Like RDI, PIX outputs Bayer frames but can also achieve some image
processing such as scaling, cropping and generating statitics (e.g.
histogram), it also offer more flexebility in term of image alignment
and stride. All of that can then later be leveraged to improve
software or hardware frames post-processing.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csid-340.c      | 42 ++++++++++++-------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index adcbe3e01d62..ef13c4c50ab2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,7 +41,7 @@
 #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
 #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
 
-#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
+#define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
 #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
 #define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
 #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
@@ -51,10 +51,24 @@
 #define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
 #define		CSID_CFG0_ENABLE			BIT(31)
 
-#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
+#define CSID_CTRL(iface)					(0x208 + 0x100 * (iface))
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
+#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+
+enum csid_iface {
+	CSID_IFACE_PIX,
+	CSID_IFACE_RDI0,
+	CSID_IFACE_RDI1,
+	CSID_IFACE_RDI2,
+};
+
+static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+	[0] = CSID_IFACE_RDI0,
+	[1] = CSID_IFACE_RDI1,
+	[2] = CSID_IFACE_RDI2,
+};
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -70,17 +84,13 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
 
-static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
-{
-	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
-}
-
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u8 vc)
 {
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
+	enum csid_iface iface = csid_vc_iface_map[vc];
 	u8 dt_id;
 	u32 val;
 
@@ -106,10 +116,11 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	if (enable)
 		val |= CSID_CFG0_ENABLE;
 
-	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
-		csid->id, enable ? "enable" : "disable", format->data_type, vc);
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable RDI (dt:0x%x vc:%u)\n",
+		csid->id, enable ? "en" : "dis", format->data_type, vc);
 
-	writel_relaxed(val, csid->base + CSID_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_CFG0(iface));
+	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
@@ -118,11 +129,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	__csid_configure_rx(csid, &csid->phy);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
-		}
+	/* RDIs */
+	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
+		if (csid->phy.en_vc & BIT(i))
+			__csid_configure_rdi_stream(csid, !!enable, i);
 	}
 }
 
-- 
2.34.1


