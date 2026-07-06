Return-Path: <linux-arm-msm+bounces-116893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ryf4HZ3CS2pIZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:58:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E342571249B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EmWcRpaG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kp+8MLA2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116893-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116893-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2E05316346E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2739E41A779;
	Mon,  6 Jul 2026 14:14:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C840A940
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:14:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347265; cv=none; b=h1PsC9PciTcgeWQg814aBCuUS8G1nXRZkew5ZaxZbBNDznaAttErFtlNOHROyuxkyj42Xea8QYJWJVRfdw3yWZfWhFEAAHcu904dyAj6oOLJLYmLczRZ5akOneEiQ8VWlEiL9Lbep178ZnoUnva6BVAzoS8TNJkSnEairMUjYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347265; c=relaxed/simple;
	bh=++Jn1nR487qrfJxCIQA2DErxu0O1PAxMcZqTtrZPzQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=McRsD/YIQj8Tti0ffizJgpAZVRlVVDAtIQN5x3IreKdr2R4Jt/cRRpVnlkVvCdjc4MlhxAbZRQCW8DD5BLyAD9oDWTGq90qsy0BcP83lw+3L0+hQtO2CfE+95DIq/pC7vTwBRDdluqxbyowekKvGYMbyWlAVr6uOQAc5ExO3k90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmWcRpaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp+8MLA2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDqO9834832
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4oHxsF1MHj0
	DkD5MAp7qBNYYGmAA3TUieSbrw1Lq3Ac=; b=EmWcRpaGgZQ3WVMXFIRKWc0kkae
	XPgu7KUNVbe3eNFCCYRyZnpIj7q/kYgp7JU39TDXyTtgSNVLSOj2vNzhPJinFEGB
	/RZ6gdroakXmw05FznLeIj/IqUGfRi0+kTRexH/UVLQEKB9R6tqleSF4gcTI6WeS
	0qqtYZspCKL9lWanKe4gPacEiF4rCtWzQLk5soP2W/Ugcgr9AuLIlP11cT4TVNO/
	gNxXgXZm4r/o4kKFk5WrWGQmp5DtVjHYqJ00TUmlD/+BBGIlVS4IZfc7zUW9K3Lf
	RLrt3ZSHezd3wXiIVsWmst61lo4jEu/zW6xHplcrgrjutqzO18UaGJ4TQ7A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgs69s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:14:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so3084979a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347262; x=1783952062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oHxsF1MHj0DkD5MAp7qBNYYGmAA3TUieSbrw1Lq3Ac=;
        b=kp+8MLA2AOtIzZcKPDf3OjA/f0/WEUiIF/3auh9WXKiU69GoOtuyIZHyUQ8UjMTr4Y
         kwJLsOzhZxaOtB11+pqDt80KGt9F5jHrkKLV4U6FrKwoeNidGpRJSsarXAAlN58eRJsC
         DpBIZPG2uB6IV5i8Mf7TSJ0Zxf4YgBsdSDUeOGL66861lLSJ2f5a80D+0sFN8r7IasZw
         3Cipkao89EYSQjxA4yvV2OPoGPf/ylDDijW4pZ2A+wdtGxPStGo3GoWO8Atf+FpAtcBy
         bzVLu/xKV2i7BefvoQC7KkjG6a71dmeY4iTeU7wJwaKM6ZThc0VMY/3AYTXOcqw9RvNL
         MwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347262; x=1783952062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4oHxsF1MHj0DkD5MAp7qBNYYGmAA3TUieSbrw1Lq3Ac=;
        b=O9Ks0CX1mxYSQzVkTECYDMW5awkw6+cpj6+T9dTyzAqhKsA4+YY0ZRMhuvWbdrs//r
         uOVHoleUqe1X/T0yrBTeajsW0rmYCYFQIXrayMpFfGS2J8/aFprhxWZJu1H+z/ud7g/B
         sU09U24qPI+xUHLRxWiOC2IOYnD9NkIqrcu5qk7Xs40yoHc9xrJaYy3b/XHfKvFzc7nX
         0EgIig+qGYIOLCfwl72GJvgOJ7/9n2GdbCVDdtO6zP9kSOQ7RxqC1Tr8hy/bApFsiGgm
         eVx5frCMuLtC40dVdAfMaQedFDCT2Et4V71dqA/XGGfBPIQc6schsAxxiyixBYE1ivpu
         OcTw==
X-Forwarded-Encrypted: i=1; AHgh+RpWc8h8llzXl8MjDtMGYeasjThZHa4h33GeaC+TJIVCmhsBBqONS2HXLtlo1UWWRSuP+wp/iaeFjn/Oxt+0@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcSuKziegm+K/PNPq8GT1WcWo6UCBHvkEp1IG5PH0bSw87J2H
	QVWCdZ2zkRNzXupIxfh1x4Xtt46vCq8yu23JimOeB+yqxJWOLBoAZfRjDmu/VyStyDVvBRUOmeC
	AnUj9eokbNFL71QqfVNg5z5Q4LfyYSUAXlXFqD3leXxMrGO6giR+NjI3ArYYHjma0oc8t
X-Gm-Gg: AfdE7cn0HzgMLKiwwBLVQdCnucHU72pbu6HvwPUQFFiy8qcU/PVPOT1BGLfRY0C+MRs
	+yuMM0Zc9u65uYU0uLkbUE8cCZKwRN32dm0sIBH8Qg29PwMVsqAzqseozmeQrdA0lXv1CTWiGaD
	N/b37cYSvO9QDa2mF2KkFIML0TMKOX2dLQE87PvUFkAWPjpJNl8g+30AkOb0SP7JcqGeVxDiVRm
	TvmJWcblxf8GNaPk2wthoZh5avv3+3dBj4ulyfMR1fa8hDuuxHuv9GWioTf6eATQpnn8ZYilQ1l
	69L0O2zWWotNXbvB9Cqacr2FU6cNBXNiXyolcxBKvvIoUUlceT3CwgFAzOJ9kWfQ3sDLWrX2+PC
	0/Md5e3OpAwFtJFGEVKyP5tcMnSzzqCSo1Vkmdw==
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr832720a91.10.1783347262476;
        Mon, 06 Jul 2026 07:14:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr832654a91.10.1783347261987;
        Mon, 06 Jul 2026 07:14:21 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:21 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Date: Mon,  6 Jul 2026 19:43:46 +0530
Message-Id: <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o5tFvJ9oLdA8qBN5EyROWS_lkF0O2wh4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX/ITjAXi7m7NK
 u4YtS5BKoyJ0JdmecDCpEv5hdr8b//+n/3KaZ/REcT1FA5vX9JiY2+6GET20CToL3LEu3Meiy3J
 /sSOD66IaOnXt2uKQokAN9aKChZRXycXwQLwMAPmBeqXT86IyMm0hXO0PjW504+gQDaZokyUCMY
 NRdyd0Wu/1B3v8grRNFbchbODrBFyBFpqSQwnmoNfWZAYoLWnKK0ndtN1yYu50TR+wivLBVDHJb
 d+L7u3lSq2kARrWxhA6fahra+y5wvFwdeU3thJ3KEgUwyoTcLY2dQDAZCwgGRwX9vUVP87S3tNz
 9vZPw/6ladktBpI26+/eE4xMDd9J3XSc+rr0tLTMHvOpChI4figX25sWlqs0br8CLVJR6DvrhqT
 5Bu7FY7oFfqWb2Ii8QrrpJs99qnvzs+lE84gQEE1X1fm1FfxNpbNb+1mGviLDhsxChskuw2+0Qj
 /5iknD/O6c2lpJyGRHg==
X-Proofpoint-ORIG-GUID: o5tFvJ9oLdA8qBN5EyROWS_lkF0O2wh4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfXzAN/5QMrqcWX
 iqIPtu16MJqCWpcQWFTVLbbM85AMt/z+86nQtZ1OT1mJZ/H2bWiIRKlyHd3cdiOdsP3S66IvxrC
 GD0Gz895IATKJ2ChRhcHyvxZnw8Yz54=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bb83f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BFOuVXoWwltGLQr-ouQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-116893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E342571249B

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
regulators and gpio-based card detection for the platform.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..48407e47aaca 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -268,6 +268,22 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 	};
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9b_e0_2p9>;
+	vqmmc-supply = <&vreg_l2b_e0_2p9>;
+
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 221 GPIO_ACTIVE_LOW>;
+
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
 &smb2370_j_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
@@ -319,6 +335,13 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &usb_0 {
@@ -427,3 +450,4 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
-- 
2.34.1


