Return-Path: <linux-arm-msm+bounces-105147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDuUAuXH8WnnkQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC94916D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1F9D301152A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B429F3B9DA3;
	Wed, 29 Apr 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Djtvgdbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7oZdhDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425C03B8BD1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453011; cv=none; b=GdPCHR8nyGvp89LiUeLDLPNXnmMnGHcFMgC5/izFgBc+wvJyZwDRkEgruyt/y0aSNQGpPZqy1hIpQMMiZHcQnu0s5QORhxVODsW2LnuLSKnEFo8hUBGtan5KpupQWVxCjOD7m1pItcT/95Ed4XrEKczzvah9tsu35hF/mtlde60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453011; c=relaxed/simple;
	bh=giY/YtSTcAx8gF+B1CvPG9d6KQ+rn1XLGxVVedY1+HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bU/cYJTwwy8Gel7w9UG0ifJjLJp8+wIE7/6Qn3HNSJRY6lSDpxcU9QAn2v/QP1ZG7vGJBInvPvFBOAhL7jmjtESdjqKsb0hiT0TkKUjIbXbzp52H4xBEwDtv9IHDsKaFEEpuvJLmFPgj86ecLBPQSoSh4zPvcJ4UU2guArYdBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Djtvgdbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7oZdhDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qjMf2016307
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwSQ0VZA7av014duirYVDBBsW8ydQ2V2bYKdiM2Oq0M=; b=DjtvgdbuNgrv3SNW
	TTXdwNBjqo9a7JGdBwnZ32wRfGS7pxMfMkZOu3jkuZOmBC1NzVdrVAkOBqaCFC/t
	ndgs67g2XUtrfwQHW0ZlPeIE21YE9KskAUJ0TqR12UnqgOne6sbXrG+zK70ehd+J
	3qSy6z/37/wuCKg3FUV1Aj4rgTikDDqWWU0oyV+1g/ou+HIUe+qKIR/QhtC88kzX
	Q0JPRBvya+43VhHDcJ0OC8lAHJPd+xsIONqbdSh6IvqhZdwbX1RHAl4HjhZJW44y
	Xz+KzWSpd+niRX8BsGch1ynnaJmalJ45+DZeUJZfa01chlaglx65eOe9A6q4RKUL
	vqf1Bw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eeaydc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f13da9684so129441991cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453008; x=1778057808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwSQ0VZA7av014duirYVDBBsW8ydQ2V2bYKdiM2Oq0M=;
        b=W7oZdhDwDAQKHyEI8vQmio/6hT15+xtOA58tAdyoiW3yXuaCO+7Tn+xdm9YUeyslUs
         a05CMdzMywn0cVbFB9Uge9CFbdYlIz3ZTdu+kTR2Esj2hFGZ004puKA0tNqoxGuQr7ce
         rXScJvh17PjRUuWZ65cgXuJBkD3HiOQA2iRlyIq3jtq78k5vw0QhIknUBtBDQcETLMg9
         DCM8G5F+a7EwxntlvMBEL773HWW6kvYbLFmKrpJJn8ljVFgN/1mJZEerGUbJMF+S+Hmm
         5+uqAy7U+Ctf2AwiFbQ+ZONhTnu1XYs918YzQ+o9SVD05Q9hMGjTgQz/v8gjZesj2J2t
         upMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453008; x=1778057808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YwSQ0VZA7av014duirYVDBBsW8ydQ2V2bYKdiM2Oq0M=;
        b=W5H4M1GYO/awlZ97/S1f+incao/PgtHDPzfiGmJoZT2wU4xYzVa3RASaz13l17bptA
         HFrptVjC+WggIQIlC+XEWoem6zIqOTDs1JXet8goX1paDF5K8l7NwFgDyRZpK3qFFc2G
         cZSGFZvJHVxzRMuLPq0Fs1XqqrdIDi1Uc8S2c3ZYbGKNiBq3G5B3h7G80v8BVfp//OST
         18oPv+0N9LUndaKgodpoko8W/wgRGa54cBsy+iF2aunaXuRCvJR3j+i+qmOBmJjpNnnq
         UmOXWrMvTvcMTdQkQi+kldB/4bYR4Yp3NlB1R1v7FseW+gTjshvoitA0yfpfb6TZqLhn
         7pmw==
X-Gm-Message-State: AOJu0YwFKH504qVsVDMDX+iZimOZ9ZWN+nnntyR6eBXVuu6db8p97dBd
	8qjg0O6wKEbC3eRs1fE2vSBeTl5g8R68kx27L0qSCQVYkoRks+1Eto8jihy5a3KKJFkrc2AYiC+
	Kgb4m7s/BSvDz2hcaeFBpZWNfqO6Q/3JKNtR4F4JdAGy7DGkf5ibymXlS7LtX+BI/06OC
X-Gm-Gg: AeBDievSYIYuiFV7cRsEGAj67J78TGbjjrrEpa4ZnkcGbyh13qNRd3th9HF+tCE9I0D
	1bqJOSiBmsr69hOVJ1jr+s9GJCtVfmxNkWoFhMYs+LC0Fde6c6MKEEVviNen14/dH/Euru/A7+4
	Q/6W63d+9ZccTyWZu3EgmWpmpQpkZ3/Y1VZhW7KAxVMT2+PrNfSVX1SfWnRf8qp3WGshADHnghO
	Hoe79rmn1j7aeRdNk7u8Y4s6YeVW3HN070OGbtLwuVca86vd974DWHJIJzUArSKkOYj8pQDkrMS
	EUhuQHY7DzOXxbXyZ5vd730dGmGcZzOv4pEgJRJX8eB1SdfPc0mazIqUCaV/cmjvPG129Jz1dCr
	w5WvOsJ2wS106rbmp9qNG3UyN5j6U97w9S5p0KeBrJ9/ESrwnIOY/GKQ=
X-Received: by 2002:a05:622a:450:b0:50d:9931:7054 with SMTP id d75a77b69052e-510189744f0mr45386461cf.15.1777453008424;
        Wed, 29 Apr 2026 01:56:48 -0700 (PDT)
X-Received: by 2002:a05:622a:450:b0:50d:9931:7054 with SMTP id d75a77b69052e-510189744f0mr45386211cf.15.1777453007849;
        Wed, 29 Apr 2026 01:56:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:32 +0200
Subject: [PATCH 1/4] soc: qcom: Hide all drivers behind selectable menu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7751;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=giY/YtSTcAx8gF+B1CvPG9d6KQ+rn1XLGxVVedY1+HM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfJYD2+8z0Zp2W6Pmnr3t4mviwwpjG5OVrT4
 LjNCiT5X0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHyQAKCRDBN2bmhouD
 12hED/kBdE6KiJeIleNxBX36o4d1V+muBpIsoVt4YYfdNRIkQ6e+dS1HsKrjxRneEaFV8xnqMs3
 xNi8wAgxqNxtFuTx2aVUlgzb/e1Ee5bNg+ewCv52DFKx191WYBndBAa1iOajBccitXqO+jlg9CC
 HWXyCPLCWPv0vw4pg0NfDzlx3xCF2jHYPjb/Unwodflk06IGz1rqogLvoSrIX/4Ir5KBef2EYT4
 HLKCRo2VJ+ShVlYZvKbMAApfiOpy3akyu6CPxE+9vMiBq/azqKhjUnwJHqtwt2VOIVrXbOuGpxv
 25ljkj7eyFADlRtQEw+CI5BudWTfVDd4n8JxSVHV6GMygutrGmpaWCSZ9kyrL6QHpsozbJr0U+Q
 ULhKp8yV9ibD2Ma0wM0ElL4LMB0DM+sOiAUTHUlFF5UA47uSkOY6kP+bF93kaiiAX3IxMYWFc1M
 FdpPlAXlE6cJVWZiMuyx4Cu7p73zRASppWuCA16XueBJcOlZLfooYXA+laDiEMA+uiawBk699ym
 AL78qkxo4ciRZCknH9tTyVLVsb9Q+hUeIIk0n6KxxMRSA+i3jbSnd3qT7+IuO79EffTaDSmE1nI
 gOHIRO66ig4ur6+mv8WIlvi+z9kdepnNyzCRDVIG0Tq1/0tj2y89fsYchGKa8QDSICpagNyNwLi
 labrTyWwzrsjlpw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1c7d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6WWCBr2p4RQoEn8978QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX15ns4oRO8OOi
 FNx4hRuVut40meVR9No/nEnRrkbepbPhqkN+yRPLvvZSb84rzawFXGVakK2KOYIHrCogj8nzS5k
 tnjX5YTJ1yqmxY7rD50PsTZliqa9SMxvwQl2rJSfWH+PV4demojX3PZh9gmig13OtLff7ueysqr
 tu0TsDLU4xeRG35LPc4jBNqcOAR76DFKz8au9f3sAce390MbvMpmC96b6g7cg6Q/TUPxpfW3AQK
 OcTC+12olIANlEeDm/TMWt7ozAQHt7JdAv5bJZxi0zc8cJE27hJ5kTffkJC7Cf9VQufr/N6Q4zI
 PpTpRGal/vwdszLQMcOWLmzGs62l4TjDOfC4MrrNIiZHkYKLjA+a0Jo+Z8I4OIUBJAXYFYTBMaW
 QkVdvRTygVxC2j34vgzrDxYYeakPLLkRHvOm2k8yc1giDQRkCtuan8NHqfORMDBbhY/4xQQ40Bq
 bz98DVNhGoYNJsgnpZg==
X-Proofpoint-GUID: G0Wo3kITw6qua3grd69h8h8kF-B3FdiS
X-Proofpoint-ORIG-GUID: G0Wo3kITw6qua3grd69h8h8kF-B3FdiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-Rspamd-Queue-Id: 25DC94916D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105147-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Switch from a simple menu to menuconfig, so all Qualcomm SoC drivers
will be under one selectable option, allowing to disable them all which
should make kernel configuration easier when preparing a non-Qualcomm
kernel.

This has few benefits (functional impact of this commit):

1. Allow compile testing of QCOM_OCMEM, which previously required
   ARCH_QCOM.

2. Hide behind ARCH_QCOM or COMPILE_TEST drivers specific to Qualcomm
   which should not be available to other kernel builds:
   QCOM_PMIC_PDCHARGER_ULOG, QCOM_PMIC_GLINK, QCOM_SPM and QCOM_PBS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 76 +++++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..62ce1c67d684 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -2,11 +2,21 @@
 #
 # QCOM Soc drivers
 #
-menu "Qualcomm SoC drivers"
+menuconfig QCOM_SOC
+	bool "Qualcomm SoC drivers"
+	depends on ARCH_QCOM || COMPILE_TEST
+	default ARCH_QCOM
+	help
+	  This collection of drivers is specific to Qualcomm System-on-Chips
+	  and most of them are necessary for a fully functional boot of the
+	  Linux kernel (plus a few debugging drivers).
+	  Drivers can be skipped when building Linux kernel not intended to run
+	  said processors.
+
+if QCOM_SOC
 
 config QCOM_AOSS_QMP
 	tristate "Qualcomm AOSS Driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
 	depends on COMMON_CLK && PM
 	select PM_GENERIC_DOMAINS
@@ -18,7 +28,6 @@ config QCOM_AOSS_QMP
 
 config QCOM_COMMAND_DB
 	tristate "Qualcomm Command DB"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on OF_RESERVED_MEM
 	help
 	  Command DB queries shared memory by key string for shared system
@@ -28,7 +37,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -37,7 +45,6 @@ config QCOM_GENI_SE
 
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -46,7 +53,6 @@ config QCOM_GSBI
 
 config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Qualcomm Technologies, Inc. platform specific
@@ -56,15 +62,10 @@ config QCOM_LLCC
 
 config QCOM_KRYO_L2_ACCESSORS
 	bool
-	depends on (ARCH_QCOM || COMPILE_TEST) && ARM64
-
-config QCOM_MDT_LOADER
-	tristate
-	select QCOM_SCM
+	depends on ARM64
 
 config QCOM_OCMEM
 	tristate "Qualcomm On Chip Memory (OCMEM) driver"
-	depends on ARCH_QCOM
 	select QCOM_SCM
 	help
 	  The On Chip Memory (OCMEM) allocator allows various clients to
@@ -77,7 +78,7 @@ config QCOM_PD_MAPPER
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_MSG
 	select AUXILIARY_BUS
-	depends on NET && QRTR && (ARCH_QCOM || COMPILE_TEST)
+	depends on NET && QRTR
 	default QCOM_RPROC_COMMON
 	help
 	  The Protection Domain Mapper maps registered services to the domains
@@ -85,12 +86,6 @@ config QCOM_PD_MAPPER
 	  implementation of the service. It is a simpler alternative to the
 	  userspace daemon.
 
-config QCOM_PDR_HELPERS
-	tristate
-	select QCOM_QMI_HELPERS
-	select QCOM_PDR_MSG
-	depends on NET
-
 config QCOM_PDR_MSG
 	tristate
 
@@ -124,13 +119,8 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
-config QCOM_QMI_HELPERS
-	tristate
-	depends on NET
-
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  The Ramp Controller is used to program the sequence ID for pulse
 	  swallowing, enable sequence and link sequence IDs for the CPU
@@ -139,7 +129,6 @@ config QCOM_RAMP_CTRL
 
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
@@ -151,7 +140,6 @@ config QCOM_RMTFS_MEM
 
 config QCOM_RPM_MASTER_STATS
 	tristate "Qualcomm RPM Master stats"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  The RPM Master sleep stats driver provides detailed per-subsystem
 	  sleep/wake data, read from the RPM message RAM. It can be used to
@@ -162,7 +150,6 @@ config QCOM_RPM_MASTER_STATS
 
 config QCOM_RPMH
 	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on (QCOM_COMMAND_DB || !QCOM_COMMAND_DB)
 	help
 	  Support for communication with the hardened-RPM blocks in
@@ -173,7 +160,6 @@ config QCOM_RPMH
 
 config QCOM_SMEM
 	tristate "Qualcomm Shared Memory Manager (SMEM)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HWSPINLOCK
 	help
 	  Say y here to enable support for the Qualcomm Shared Memory Manager.
@@ -182,7 +168,6 @@ config QCOM_SMEM
 
 config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	help
@@ -229,7 +214,6 @@ config QCOM_SOCINFO
 
 config QCOM_SPM
 	tristate "Qualcomm Subsystem Power Manager (SPM)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  Enable the support for the Qualcomm Subsystem Power Manager, used
@@ -238,7 +222,7 @@ config QCOM_SPM
 
 config QCOM_STATS
 	tristate "Qualcomm Technologies, Inc. (QTI) Sleep stats driver"
-	depends on (ARCH_QCOM && DEBUG_FS) || COMPILE_TEST
+	depends on DEBUG_FS || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	help
@@ -249,7 +233,6 @@ config QCOM_STATS
 
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	help
 	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
@@ -257,7 +240,6 @@ config QCOM_WCNSS_CTRL
 
 config QCOM_APR
 	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	depends on NET
 	select QCOM_PDR_HELPERS
@@ -269,7 +251,6 @@ config QCOM_APR
 
 config QCOM_ICC_BWMON
 	tristate "QCOM Interconnect Bandwidth Monitor driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
 	help
@@ -282,10 +263,6 @@ config QCOM_ICC_BWMON
 	  the fixed bandwidth votes from cpufreq (CPU nodes) thus achieve high
 	  memory throughput even with lower CPU frequencies.
 
-config QCOM_INLINE_CRYPTO_ENGINE
-	tristate
-	select QCOM_SCM
-
 config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
 	depends on SPMI
@@ -295,7 +272,28 @@ config QCOM_PBS
 	  This module provides the APIs to the client drivers that wants to send the
 	  PBS trigger event to the PBS RAM.
 
-endmenu
+endif
+
+# Options selected by other drivers from different subsystems must be outside
+# of the menuconfig if-block:
+
+config QCOM_INLINE_CRYPTO_ENGINE
+	tristate
+	select QCOM_SCM
+
+config QCOM_MDT_LOADER
+	tristate
+	select QCOM_SCM
+
+config QCOM_PDR_HELPERS
+	tristate
+	select QCOM_QMI_HELPERS
+	select QCOM_PDR_MSG
+	depends on NET
+
+config QCOM_QMI_HELPERS
+	tristate
+	depends on NET
 
 config QCOM_UBWC_CONFIG
 	tristate

-- 
2.51.0


