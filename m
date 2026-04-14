Return-Path: <linux-arm-msm+bounces-103125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI4xBuUm3mk7oQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:37:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 185863F96D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC5CA301A15B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8DC3DA7DF;
	Tue, 14 Apr 2026 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar+hGBjI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMDVP783"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7539A040
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166602; cv=none; b=UWAhPChvA5poWe9M9are3XQOKZFoAgT6yD+s6x8g2P2o/K7n9Gl9OwiTCl7WiBpWFjtgvAA4CkENcMTkaV2vAwz6gj8I0E5yRsnw5stXkcpJmfqCyO/5dxnEPjZI11KEqlYgGcN786NE6jAqgrH4Kvf4qBAUxY8f/pyrXxVur1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166602; c=relaxed/simple;
	bh=I/9izMt86W0zu0FUIfR3xR1q/qO+bo4S7Y0fcA+uLco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mnP9oKU8ZaCAcVI9be1Tpudw5sLyRQN7ct/sHllGwB2GjhOAA/ui3QCiiAlsJvhWZgn4qapqeE0LbvPy9jvRuBPmrRqhbNI8IoqM9UgrkaU128qDCrB1SGscObNZmbb91krh7WI6RpJeCpbGFDLXnBCF87jcXBW/4iE2/Y5UawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar+hGBjI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMDVP783; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBMf883683118
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ud78j0UG4YIq83pjzEaGfQ3x4ol10GmoJ9e379iYrq0=; b=ar+hGBjIiQ4ljoLU
	iPFxfnplQZny/E94OUOOACz5sUCodyNnwaO0TOj0I5zx2oGFbZzXF32Dx35epwNr
	dEGnaJso26u2cCk1TCarnvPD2nyxZkymdMfDhc4I9guxT35NHUElvmakX4rkbbPd
	MWsza+z74TBlehbpNNkHtW/lBOgEYJBLnNeyaOLIyNK8jn/ykyxfwPDn09q2LHQ1
	nzpNFY8c4eW7FpVP8exIW/A/IpDiAl2rS8soP2tDhmLyl0FLJ5m6yx4ksLDX/RhZ
	tS7X1p9mZoaaDOCPthmI/3cPqIdNHmsjvoG+x+pfetEfEf6rLZEMH3NWYJmzmebg
	9+5IHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d2gk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b454cac322so22464765ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166598; x=1776771398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ud78j0UG4YIq83pjzEaGfQ3x4ol10GmoJ9e379iYrq0=;
        b=IMDVP783Ulltf/XNfa8lwdU5Tma3o+WC7sPFmu4Li1EGtTR6m0OeQwck/bw/EFxDup
         opJphehwaJ3bCQ6pD8cxhiCH6A/1Y+6C243pOCg4f09pLwBPhlz3MS7HfFWWicGFMa2D
         WJfQFBbHYHEgd1ly2YJGJHqdkd8u/dfSndH8Mow86Tr1jn9T8Sw0iRTABLT4qagKjtPC
         E2uCYmGD/613yDOA4YDDu79ACCvy0QBZMv8jmjF3sfMjBmRpIPWvVZPitye6zAKMrMdZ
         2Vfrf9qyEbsiT5NhYuNaOFYMwAtk2RSnLWOlRKHc5xbNU9m/ind2tMz/UntYzottVu+B
         slBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166598; x=1776771398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ud78j0UG4YIq83pjzEaGfQ3x4ol10GmoJ9e379iYrq0=;
        b=WDrDRofLFD5rKOxiMw1kTwCVz3hXJFe0LQs90v/X395MaFnI/8wKwf7n/kDJIeWtxC
         hA/wwXvbA8fm5wO3hSyvdoZS8xXMTR1plv3+axHNazdjA/CDl/YvnhTjjdQ26IrO7JWf
         ZYfuBcl+8hChIrPvUwudGXD7p1jGI2dRgIPHk71e97df4KnmPxwj0IyUILkMFm21FQpM
         fu70nXf5p1KS3hP91Iz2sHL4qRXnwXSCFujMxJT1IOjovZM8v0RFfVYq62RETh6N3RM2
         px9OMgwzu7XvjulUREsLZ9ODqzSkAZxdmv2I+dX8gAO0SJEBMM+ujtPJ5gIgY2fPbWgF
         4K5A==
X-Gm-Message-State: AOJu0YyVIvBPqfGLo66uneR+uHPF7lR44VTK6AaE//KhGld6RN8N9MEi
	VS7lgqzm7UPyKtmL/xkiM6+ICHWIx6Xl4W2acEESVGqT8UIZ7ZX64+rWAJfNwj5HTULhKGuwRvg
	3xEGTEXLElfvD7gSDoG0cXz7SyCVv0DkYEyhEs0VH8e1p1kTHTrmCUBEPeXrc3zxNW9KuR5FznL
	fv
X-Gm-Gg: AeBDietRl1LRkY1vaS8IKSUytxca4lwik64ER3oe5DXuWI8MvaH0xh7l4fmTICi1sUr
	cQkZTAwBjI0ECsKOi+niHWCNSSJWL5NaFmCMFZNFsZFRr9RFAanVaERCUSefXlzvjCHlCbVC0Ky
	Jes15weuqwDYev1QiE91XY3VgbigIsQOgihUHRBLhSY5OGiw57iGsO0drPV1MF0+HGmf88pJFca
	3NB++ecXKST4C+8yW90hFexF29fXKVf+6OSQgkA49e9TtZbgWheLBvJQ+ez3iN/unf8oAI2NOre
	6F1bvCQAN+EdWZED5zpaS/nQG5Tj7HnJNhu2a97bBL1mr4dRx2hw3+66k68hCEdQXe8RJgEKCvX
	PsV/n2sAoG4LoQ1G87QBF5NwBcvMlvOz0uhn2kNd1Wka9u/ODcIurjk7VKVgye1A/uDpBmmtO+G
	upG/A+9uE+
X-Received: by 2002:a05:6a20:3d8f:b0:398:90c2:f6b5 with SMTP id adf61e73a8af0-39fe40c77ecmr18081450637.58.1776166597468;
        Tue, 14 Apr 2026 04:36:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8f:b0:398:90c2:f6b5 with SMTP id adf61e73a8af0-39fe40c77ecmr18081404637.58.1776166596831;
        Tue, 14 Apr 2026 04:36:36 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:36 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:01 +0800
Subject: [PATCH v2 3/7] arm64: dts: qcom: monaco: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-3-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=6185;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=I/9izMt86W0zu0FUIfR3xR1q/qO+bo4S7Y0fcA+uLco=;
 b=B9RKru90BtXdsOY0D4BmYIuI/+J2Y9ocYQ42RbrHiaiTwcKvcQEZyQ5CvvEo0lYmwRKXhR7FJ
 YJUKw0pkrvaBf/kUPo6LpkXY4hLeAOcewpDcEr0ZnV0JMfMF9JVNPpG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX3JMM2qYxKT1S
 V/Uup90rfI/QQrCfRH1XG7TgBoct+65m4Ztd09x/PTMrI9by29jqF8VGKFA9h4YNHEJ96kx8ERB
 4mqRooMI+y78OgWPR/jTXYhVoGMOacGhOG1FdxsNAxdERvg2s0ATHlheZNWGjdEP6nSGbzuQEfx
 RrF77siiFxZVJ8E4FN6LpMRIfvXJPeLrQgbM+njGa7JUGzBJocLVOS0nNKSXaBPEhuXDu+VnjgC
 IZdaNbYA63Ka325nRENfa/fELBMEUFNsCtUm/4OSkJGcrhQVVvWCohveRglmDAX/kuPIlLSua5P
 ihHfdGVGv23U1Vse7LstqLqwNQl0jy1lTwKhd5FDZ5ewn5RNfggmVbBE8OWsB8WE/sGShn9Wryg
 dWzrbXP5tYINIKspMpDAU01QjmY4JMm9Isab5ayU09149YO8DBecy+wjAuHegCFZneX/XrDGrrv
 b+SZaNZ92jbTDN/YQ+A==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de26c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=swnd-9OQR8il28cGCz4A:9 a=l9Vmz6SG5_cKeK-2:21
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 20bnftFkUDOPbX5PqkK2oS7f5FTnHENl
X-Proofpoint-ORIG-GUID: 20bnftFkUDOPbX5PqkK2oS7f5FTnHENl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103125-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 185863F96D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the monaco device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..3e076a1df1b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3045,6 +3045,7 @@ tpdm@400f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3307,6 +3308,7 @@ tpdm@4841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3326,6 +3328,7 @@ tpdm@4850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pimem";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3347,6 +3350,7 @@ tpdm@4860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_ch_south";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3440,6 +3444,7 @@ tpdm@4980000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3483,6 +3488,7 @@ tpdm@4ac0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mmnoc_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3555,6 +3561,7 @@ tpdm@4ad0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlct";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3807,6 +3814,7 @@ tpdm@4b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3826,6 +3834,7 @@ tpdm@4b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3845,6 +3854,7 @@ tpdm@4b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3864,6 +3874,7 @@ tpdm@4b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3883,6 +3894,7 @@ tpdm@4b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3902,6 +3914,7 @@ cti@4b13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		tpdm@4b80000 {
@@ -3910,6 +3923,7 @@ tpdm@4b80000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3977,6 +3991,7 @@ cti@4b8b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_1";
 		};
 
 		tpdm@4c40000 {
@@ -3985,6 +4000,7 @@ tpdm@4c40000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gpdsp_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4078,6 +4094,7 @@ tpdm@4c50000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_south";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4150,6 +4167,7 @@ tpdm@4e00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4240,6 +4258,7 @@ tpdm@4e10000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4283,6 +4302,7 @@ tpdm@4e20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4608,6 +4628,7 @@ cti@682b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss";
 		};
 
 		tpdm@6860000 {
@@ -4616,6 +4637,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_actpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4635,6 +4657,7 @@ tpdm@6861000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4715,6 +4738,7 @@ tpdm@68a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4734,6 +4758,7 @@ tpdm@68b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4753,6 +4778,7 @@ tpdm@68c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ext_dsb";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4772,6 +4798,7 @@ cti@68e0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_llm_gold";
 		};
 
 		cti@68f0000 {
@@ -4780,6 +4807,7 @@ cti@68f0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_llm_silver";
 		};
 
 		cti@6900000 {
@@ -4788,6 +4816,7 @@ cti@6900000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ext_dsb";
 		};
 
 		sdhc_1: mmc@87c4000 {

-- 
2.34.1


