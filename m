Return-Path: <linux-arm-msm+bounces-99250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPxrBec5wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:02:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FFC2F2664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 507C530185DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A6F3AB26C;
	Mon, 23 Mar 2026 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtkYH8Jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/+j7O0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3703AA517
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270717; cv=none; b=WhrQTvW2WMWYsQ4cYarBA7ImJnPcxUq2ceDexHqZq+NaKDermrpdftxFQWQ1CPFY5klzm7N+oadmV/8Gtrczber8zj3gy5zrbwSE7UvG7dTRYuxB3Aq3ylAtEiN2mxKm2hMvt9Egk1T/WAoq4LyXn9cmb8bDu/1+2auydGIyVks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270717; c=relaxed/simple;
	bh=O3qTqvPrEAM2Z6DMps4v+LJ+XWKaRSdRt03qEk2jEP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KySZjcK6AveOFT7xCXyzVmz67CvgLtvbqVekAJx4BGk2DUKGbrwhndXhRsLckof4Hl6pFi6KcOTEXS5zxg9KHTVPRMXtSQXjpycZI2sxqmjbAAlHvymDw74iAO/4jl6HVxTK4PEsrfVuO81iyLQweqzHSlTeG49e6+BHBeKMHnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtkYH8Jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/+j7O0F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCeiKo2476065
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GuB2uDFgbIo
	dLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=; b=EtkYH8JnWZEM9Zn9vgVEGUs0ICh
	bMbqDwVxnDU2gUY2OYTvwfx5/NsF9aqMGV/NsyUTwTOQO4XYjEMSmQ2iGYzprZ5p
	9/pvYAGw/7fVvS/F+m4TiAaxfYk9/2KfDU/9/4ZJh9QXxkGn67iJeb1RBuDNGm2A
	yVDiN0XtRO5OYFwbhJMM0753qFPMxgsmqEgnQCf9GKSJA8sJvNgjiiSNr1Vs2jmY
	LGX/gUC9iubmQZRI3YQnSG4QyydAeCFFBwLs8SgknfppHJ105wMbT0RjMQVVJj/L
	+ePSFsjZD7boBcCoF2YvdeW+tEi6paM9eWvHjiR5iDzdSKZT3BAT8D9Xlvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r201v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so5162391cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270714; x=1774875514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuB2uDFgbIodLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=;
        b=N/+j7O0F7NjkKBw2miw9bk0jnux8S74mCyxRMJVwr3cSG+ETgQm6hXSlaPqDObWJk1
         fveXfWCYY1+cQT1P8FN+/suF7E4TQ6RGcgiBRhS7O2oYW1D+0pYafK/EZTpwHdn8AYAF
         5DysyFDKLW2eWLWqojfyQ9c8WKY248KiSyeE5TQUuRdFPUdzI0qh29G9SMyDYOn/J3/4
         fKyS0336NxIBSUm3dz01p/DhynlW6dD1eQCKRVOHeTKqFp+bWzgdOd4h1zupVmez5yi2
         dnXRFXNVzLJP8i1Tc3ptEMUCYncxFr8u+JWScLZD2Gg8poas6XysDbvMcFwBGL8febBG
         cRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270714; x=1774875514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuB2uDFgbIodLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=;
        b=rUR2ySOuBKk2WOyw7tBKHdYysAf8anbYBs9BbuYrwOtbcVEIN5vG92F/yWwIPqgGEB
         qlXTT1vHbalvy5Apx8s1k4D2oe26oQDAb9UNYiJl+ruymUnGOImcFOmGdJ5ByX1cEK8a
         0Axqa/v7pkMBv5aHaqPlgAA4Z2q/RFIK4B+uz0AcRxTKUgYEgFamizFI4gAGw3TehYKZ
         wJhmVHjWe7SYlQpqhdLCrMN+LxK0V9EzGGcQuY2FRcZ9xuzFoUCoMQLJicqyenGr/uNe
         IJoOgsf6UMTrti9hupdG4L+xA30IudT1ppfG73/rbDJm0tg05OQYYniLoasFNUh0yNG0
         E+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX+hMKB9w8PBt9dbW/3HoimooDmVRM1O3I4w0rCkGR0KSdiJXgOoTHcUhV8iPdKIlYfp8ywVGhOavO3I0yB@vger.kernel.org
X-Gm-Message-State: AOJu0YwtUJm3Gwc1WIwyeaB1fGv6QO+mpcet7PCzVvT/fJZ9BglejLc7
	Akc0juUg3skqnbnQzUu1MMDRVbVpMHIJ2l5Lu2wq+DcYzhO+JGwafEfAeatnZo776N4T3feq3Ue
	tpf1Fetj/XbwNqrQk50bKWWdtztlaceZhl34sbN4hWPtDtvw5ZRvQ8PWYHbk3/CgWXM2U
X-Gm-Gg: ATEYQzwEyvEj2v6gFGaq5IkPY4c5tM2cUbcg9zs5dfUWv7xzqIZPQPwqXsr0nlRqjIn
	LAx5lSYT4kpsEP1XMPIUI1TmUoy8kOQOVWSVegreSb2SUlygcGlRSIlpUG+w9TIxoIMQLEglFRe
	+eliCCB+kEYPkNJuPgIw22O+WWPkJn/9reaZuRciz2ovXP2YopcXIUpgGaJ9DlMi7qZUAjy+RnI
	eiLxUJ4SdQYYgbeNo90TDzrqur/1QERRyXLYiNAyPret49b3j8nOr9mXVjxtcqyLrggDgRNrD5t
	dHocbfEBZUsY+XSzWJ3uRHcCUs7gYj8BUA41cl4+vWOzgVB5hBZ1TX+Em6thEI4shjpd3cFTYJG
	lC9dGDnL//PMxOrTivYDkT+32eZiG28h9GDH88wzBE/7+pmaTxmNorlt5wiLVB7ffbr6fAWzWZO
	SlKQ43+6rTdWe8
X-Received: by 2002:ac8:5985:0:b0:50b:51f7:c671 with SMTP id d75a77b69052e-50b51f7d579mr94395951cf.67.1774270713909;
        Mon, 23 Mar 2026 05:58:33 -0700 (PDT)
X-Received: by 2002:ac8:5985:0:b0:50b:51f7:c671 with SMTP id d75a77b69052e-50b51f7d579mr94395631cf.67.1774270713493;
        Mon, 23 Mar 2026 05:58:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
Date: Mon, 23 Mar 2026 13:58:24 +0100
Message-Id: <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c138fa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=mzACg6t9QVaUiISIE5MA:9
 a=2O4lf2QStkfF1PFr:21 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 3pdn8tJb-NRMg-fQma8NblQdbAtUszBR
X-Proofpoint-ORIG-GUID: 3pdn8tJb-NRMg-fQma8NblQdbAtUszBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX0EcdA9r6mSvY
 z0k+U4m3sc8x4KNE1gRczykqcLNMvlN6SSauoiyH22J21g1u412pfIiC8MO5IWTeJcYt4KzrT9l
 XPKS5eh9LSkhX1QMBCzpyKv8Kl+F40h5lw17kIXDUi+Ynr/vEU8QRwHMQfPZVZQW/znRPXrWHz3
 QWCkn1Yx898mlJZ37pZ/TxCh5oWiG8v/2awBvwpfvvVdxZ7nVY7rr0s+rWIu3TggLHE3dky9g4m
 7+EVJm33sGaY2WhP69Db8crdx0aZmIbBcHTlXKEtIHXNtWlldLU5jy/4tO0fgBwB2ZV5RCetnvq
 m1cy/uOuBiKC6CDkT/XFwI1ut3wgYedfhuuOov2sGrx0WQS/w5hq5ZcaEYuYH0U+QaGpzpHTzr5
 smv64gEZmHrFNgG3k5OTNgMxnyfrE7tZYiBAAOdm9bcGz+aiUhHMklCi2FSwRzQrd90cb36Q/AQ
 MUny+6DQlLXokCXHUGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99250-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,5e00000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[5e00000:query timed out];
	PRECEDENCE_BULK(0.00)[];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[5e00000:query timed out,0.0.0.1:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41FFC2F2664
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
QCM2290. The OPE is a memory-to-memory image processing block used in
offline imaging pipelines.

The node includes register regions, clocks, interconnects, IOMMU
mappings, power domains, interrupts, and an associated OPP table.

At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
clock is shared across multiple CAMSS components and there is currently
no support for dynamically scaling it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c646..358ebfc99552 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1935,6 +1935,78 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42400 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c42600 0x0 0x200>;
+			reg-names = "top",
+				    "bus_read",
+				    "bus_write",
+				    "pipeline",
+				    "qos";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi", "core", "iface", "nrt", "top";
+			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
+			assigned-clock-rates = <300000000>;
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
+					     "cx";
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


