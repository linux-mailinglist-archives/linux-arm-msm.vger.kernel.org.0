Return-Path: <linux-arm-msm+bounces-112591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8hDHPRDKmq6lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84366E709
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bOS5TBUU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=etHaJy6l;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112591-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112591-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB89333A6977
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDDF37C91E;
	Thu, 11 Jun 2026 05:00:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041753783BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154004; cv=none; b=Yv6g3ibgLyEF1sxCk8edHf8ozyKdcdtTkmXfcxWAmWGCZRBXhv9IRWd0TveIIx8Iv5G4ysB+DOmJoapqDl0m7+/uDW0OCoHnUG/gA3aQP3WsvTfQigIzptmTE6ZpT3oOMLiLyH8jZSqZJhy+EtRxN16w35hWg6Q3NM2fGJcCy5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154004; c=relaxed/simple;
	bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSKqVURh8lgRBdrUy3Gl/SuAOvIU/CpR0c+Y8dpxJzHFLTqibL3POiE/rw2b0m4DAAOlRpQwt8AizR7dc0RmOAyiWBdPHq8ri+3Vb+rZh9gZlPgdDjMG/Vp2BrhsnITh27tXXfDx3lJqg2MDJKWDP7HUAcst+kpkCm/b9+GGL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOS5TBUU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etHaJy6l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NmOb3082981
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=; b=bOS5TBUUeuF0rMI5
	+M7zflYkWTUU3a/kCs8UfRUroBlLM4xAPXjt3aSBEt2g1/1V1Ip8FmyL/VO+OkYJ
	zTNxwTHwUw7lzlbepWUGr5g3JWB4qRtJdCxG8jmOl5TvHX3FHjVyjQcL5pfek3pl
	IyYjBdFzHAtNtpnc3Bu+1iNPGQOBNQt90B974CPgATBRHRyOd3rIsB3y4jFg3mZo
	6OR4hrrnYPM66mJdkOdSTyci0ly2vjRjipQMxM5XftRNViLtXPuxXmDwI7hlb2TD
	meNhOtz93HcQu7RO3pWMTE+Dyz7c8MqwkdrWWXDklLEFFJznkgI5DyxKakM04w3D
	Ww7NYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2d65d9792so6397785ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153990; x=1781758790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=etHaJy6l5K+uD9m0o5QIWyLOvHszPtXdxXO5wgB79uBIEbuxGuYAxXWq4gsbWj6L98
         kHX9vBvI+F7Hjp96XpgT8IdVW16wYBGEaqLbOfRNlNyFpPePrgncAPaNjVJCoOGd1Ror
         YO5hpwI9/FWQovUUzIdCQsXAtkKHc3YpIeSp/CxOvKhuRNE4zuy+IJrRrLJMCbOPsRlL
         BhKQUTdriZ+8yF4g+agKSuhImfEqyloATfSyh8vdwUHw6Ybh28oR/CM1B4Q0T2F5O9mp
         RdfVUBhFz4DoOXgqjAUS2rHE/UNL2DMsq2Fqm9RRYRSxQfXIZJRNAOkw1KT4jTeVpseK
         wJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153990; x=1781758790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=HiyYnXvynIEsrG1pVMujQ+ozqhvZx52GUFuBnzt0MOFcaB8Ab0lHZ04eOa9ynz9d0D
         0HcYMpx6GWuJvJkDP55MjTfRvCSdvI75ioKZfhVg9rmScE5WZ2/XsBYFubdHMjwh1dg9
         IH5/U9p3n7tewFc/wMAZkkOr5SusIhyFwQrUmukt2v0Zzg7Pdb95nmuOBzhds8WW5Sd3
         dIUmBRFd3qHBKAtaDBCTo21g8wyLgqaI1p48YeRsErDlyhcNK4lj+5faK+B8Pk2v+X9q
         ERTvJKiA+AzRi8Yoz3MuWBhFTj0pEfZIeFX/sG5qmkfO2IoW/EZVMNDR0y49Q1Y6rdaN
         6qGw==
X-Gm-Message-State: AOJu0YzX+HzBTXFpdNBj867W03MQ7rbGzi9M/guBYywlGkgCk8+A/lTk
	azTx5lWTu8s7SO1tgjN1Ua7zB1hRJWleIGqKKwcSAomw8y9wImY/KHHWhyA77l95gt/cMS26udn
	MgQlDEvZssGx+/Cov0sJ46mj9AzBbzz6ZI4J0FpYSNRu6NDxo5c08B/8Tr6q5kbRsDGk8DmWNz6
	BA
X-Gm-Gg: Acq92OGnBNs4yJo4Ke8KmFU5IBQhAUlWyFtyPPibEUhmGtn5vwZ9dGYGYCuYVxiProc
	mkZZDFx7ujpfbI34A1HDDfw6+CE/fE//6CgXc5aCJwv/1BftZDDX9q8Fei1JxLWlov1kMMTSjpK
	mGw5noHimLNC1I5Qru/HsQyUVe45Rp7XjPo62fuWSFe2X3B+az+XVVTH5oyxm8lK5Gw7y45p8uB
	R89bSg+wQNuHwB8gCTGijoN4ncEkDKg5o7ID6js8PdpvByrj2DzxZ0dFVjaM1baNqOt3yVi/5ot
	EPxHFhfkf81fv2q1989yr352mWveRFxq7gMvGo6yvUb4YjGSVlYMdsjAx38UQdPo2sLxsOAsvsq
	fxPzZz9SDmHsA3qH7YPXXKc/5gUR83+G31AL/bU5CmN7vbaHkUK19sX1D543eemTRMYg=
X-Received: by 2002:a17:903:2310:b0:2bd:9b0f:5f2e with SMTP id d9443c01a7336-2c2f2c64ea6mr13681755ad.22.1781153990520;
        Wed, 10 Jun 2026 21:59:50 -0700 (PDT)
X-Received: by 2002:a17:903:2310:b0:2bd:9b0f:5f2e with SMTP id d9443c01a7336-2c2f2c64ea6mr13681435ad.22.1781153990106;
        Wed, 10 Jun 2026 21:59:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:50 +0530
Subject: [PATCH v2 14/37] arm64: dts: qcom: monaco: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-14-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1812;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
 b=QcMYcPNer4wJPXKb5G8XP/7QwlIA6BrsZdIyhVDxDbUY7PrF0juJClpL7tMhpTWVpz3kcOuq8
 5lmIAj/MbHdAoiELR62pH7t6EEfGsI/lMlAvfdK61j5t0vzNbaKF2ch
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5x7tDTDCQ/et
 r83ZVcqO6N1L5FW8IDNsq6CUP6/L7c4THwiwijDxZFQ1YCtAWZvNB+QD9Qb3ot3w1scMgVaokTe
 P0dwbN83aX8PrmUwnBM7Xq8xqKzyCuk=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3/qrR/QGNYcR
 IHGUpcadC0MxaHf1KdbHkny1wFcXVwvlDLNl3zivYBv2DIIqpmpSZNj4nYSKulh5R3559uUVQGB
 tlrfYk3GiF920QED3N1fK/HasGfLakbIfRj6goO87AUBveQi/lbf669RNOvDHDZXLChYpYRycDh
 XdKK4jz/Xvojyx9kQMeu0h/lFuQEwKZVrw9qSKEpSsrjQKncqY0KsXofAb/ZDOT0VSwhvmLpEIm
 CbPakttqjpKxeXHeQqSfLnqR3Lit7o8wOCH+73p5/vekKQV9I9IltI1APE0C01pbtOkTZoT+5ir
 0jaUf9oWmpU//o5jCWoGU+JLLYgal5qtwDyHFo2p6IznbX/3+ch9/Wu+nYUrlH37QWt8dCf2rnE
 3X84mz8w155tgCUrQ1T4XcBkap4i0G9rUahs/zD0wTuUx7Jb3EaAftXCpgk6vesjSUDGne+jd+f
 FkJJkIaAsXiMoAByUVg==
X-Proofpoint-GUID: iN3KNDdeTOOLZsAmvGlOXYKEWwU2ASyF
X-Proofpoint-ORIG-GUID: iN3KNDdeTOOLZsAmvGlOXYKEWwU2ASyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112591-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC84366E709

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..b30fc7ecdf32 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -643,12 +643,12 @@ &pcie1_phy {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 };
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pmm8620au_0_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..f9891fbcca90 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -615,7 +615,7 @@ &pcie0 {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {
 		compatible = "pci17cb,1103";
@@ -651,7 +651,7 @@ &pcie1 {
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1_phy {

-- 
2.34.1


