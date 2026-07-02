Return-Path: <linux-arm-msm+bounces-115917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YDh7DU09RmpVMgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:28:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C40E6F5E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:28:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SR0NRDn2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kwj5Ln8t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115917-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115917-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C79032CDE66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A4448124C;
	Thu,  2 Jul 2026 09:51:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C984C957F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985909; cv=none; b=ARTc84zeQEZ9CKH9erd/KDdFmc+8qaL1TQxOucR8nfDt/3Hu/z+iBM2MM/xfexIYf8dJo28EGqYOq0xp5Ups5I6OPSKsLAHqGPDXfvh0MXonea4abfxBRKaW87SsrfV/IG8KaIbm1lqUNpl+kMgn1uEo8Ri2tOPsTtsVQP/LiGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985909; c=relaxed/simple;
	bh=ZtZsdV4JkXxbOxcKUCwhxX6Lrgj9McW3w3WH/d5uxLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4juGbY2oJonS2noJsXamfNUCygD2nI7E+7/V7BQjxME0N/qP4IX1rsB5mYwHatDfPT82u52mdFqXlbrf6okdeCU4acuFSEUGZtgcjQK1gEKqjsuVoUAWLSpmVsXtxWeeRmLstIC0H/S+n+Q9Qdyf7/bor96F9FDV/DCaKfqukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SR0NRDn2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kwj5Ln8t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KPdH4115627
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zlvi4GBsjhcL++MyzJOh+e6LH6/D7aaIomb2JYpGLck=; b=SR0NRDn22lvQw/4x
	iobZjKk1eDXxcfnFV91OcbgryKNA+zU7UWCE6Gc0atJjFoOW7a4ZZzMaEVtHYrEY
	+T9COn4qyMYwPO+2r9tCYzMeEgvXqpytCNYLRVvY0ToP98yS+CgGBzPM7Z6UEbEH
	TZJmsLPGB1HJWxNwHmsXBf5eHsiCuEr5w4at6SQbSqETsd39Unn6CNdHbAd+c99n
	UbrJKV64QaBKrRLa1P6DwtF4or/7sY+9IDEi8bZdlV3YDHOP5iUWUT7h6MTT1v5+
	DNzjevcW2RvMkw6sxS6ecOf1ljlXfX1YfymvN1BVUGWt8H7TiTB56qzqr4ss1m3a
	ntClyQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9403v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f544944so1293787b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985907; x=1783590707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zlvi4GBsjhcL++MyzJOh+e6LH6/D7aaIomb2JYpGLck=;
        b=Kwj5Ln8tHb3OIAjyBOjXQV8hZYb5U0vUVHWTLUiwpXQG8xI1x1dJehqtZ1PFdgxF5n
         HsyCBtRKFQTJCIhqux8Au47k5sJZpts2XWaS5Lo6O5ogVf6QBKrIqpyJj9UIYXYyMxBW
         DUkK1WFBTCrgjddOcp5IO5S2iAJY2pkv0moipW7EKGCaB7ICiY6u6gUve65/qucQfiYF
         P8P+Af8wq/89uyWczmZ92ZVR9kyXZlPinQWb8b8hELtIODr2tl+JuEtVa4op4amIOQgv
         9IVG4baNloxUjxK3E+N1KGAWcPV3UCAYpFtJs9yGZCSAx7+nDLhhgcpEW7J/EE4XHQi8
         NNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985907; x=1783590707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zlvi4GBsjhcL++MyzJOh+e6LH6/D7aaIomb2JYpGLck=;
        b=QHjPs0N8NP3WCck8YAvoXvh53fXml6wfJx3n8SIbrcwPmD8HteiceYNXOyqVE+baPm
         q16f30FstPRy+3oYuQpFVqfAItOVc58ynW22iEClqMYzgt7ik+X9Wu6VYud7vsp+0G6S
         248MOvHGVHJv7WRFj6RRO9A3JsHNQ0tXy6/J7SYsHl7ltR5QRllXyrZa+8NSrwlEqYj7
         0laO/4qnJMY0Sk0QREn0Or3tRzreGXvvISsXkBrD8hbN1/g3W1i5Y0ZS6xAVCPJrSjZ0
         7cIvDj+telFBLnDU2jrrP4VMm2Lyh4N7+fafmy9+m7ZjE+zhzDrM/dtV3VCTwnYyETn4
         gnWg==
X-Gm-Message-State: AOJu0YxYLt4pPkCeEBpLhAxWCOn0jDUyR6ARclkO3chNV8Mb3nKFdCpO
	taGDA4WVhMROoYazUuUTDvh2edql0ntroGxm6KETGwYqsHTP24g9B9eIyJRIH9E11OtYYnCJpxF
	u+XsBccpn1rEPywV0l5Apzxw8+QGb+UHOjD/pkJfoBDrWCk/OSNK79uzctqKYlbL9I8TI
X-Gm-Gg: AfdE7cmdonIXxDo1hMxxs3tAVeFb9IlWtZksXsEYVwv4ajzg5beaxNj4FMX2Q3dkUhn
	TEYL2g7vUFDXiFAlOr9o75iZBC+Skzzj5EwmiHsAPSl1C0W9Z/jKKhqKvV4ErqalUZDkhz/nixX
	LxEDq0YVMBdOIUgQQTojUAWRydWuVWG61truc4nRV6DaGV/Y6xNQ4AzVs5ONju8+Ox5Ld2jdIpn
	3TRrKK5jcMV2YlH5ncN58VA11mOxfZDtC4gpFdMtBZ0GFvFpDJqMJiu+EsACNDXqDdxR/7sD3u/
	r1vwiIZNjkjvkarWEXwMFba+FmX8ZlmNUu6Ih74/VS3akVdG3AfrAf1Io2BsxUYwu94lJxvgDBS
	nL0bo/eBlpZpDm2ltq4tFcURdyw==
X-Received: by 2002:a05:6a00:3d04:b0:847:94bb:30db with SMTP id d2e1a72fcca58-847c51b72b9mr4232449b3a.49.1782985904072;
        Thu, 02 Jul 2026 02:51:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d04:b0:847:94bb:30db with SMTP id d2e1a72fcca58-847c51b72b9mr4232416b3a.49.1782985903508;
        Thu, 02 Jul 2026 02:51:43 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:43 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:51 +0530
Subject: [PATCH v5 09/11] arm64: dts: qcom: shikra: add WiFi node support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-9-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=1847;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ZtZsdV4JkXxbOxcKUCwhxX6Lrgj9McW3w3WH/d5uxLA=;
 b=JHIFUjwh8ZTgiC3GBrS3iPiXG1b8RKwl2fVzZhOo9lgtfDqizMApzLt58p0nx33cBYI3mp1fr
 lfHfzqFj66jADU/uSZVWcLxfQnsVAEg6+CIfIDZhq296tyRrYgjsyvd
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfXz9t52Tal4u0q
 hh+ehiOz3SJRECIR7/un1ubVw1olP+aTqp+FsuiUC+8B3viZIG2bthmJMPifaeVKFM4scIg5X/P
 /rSPnWloP9CO2FYSRzgcO8QxebXgr//4F0vskmOY9rDGN3PIQFXPsyVG5qhUHPgVN+4L4yLhwNP
 5+A3kAtF+ip5kQx2nrqxCW/Oth1dKmv1WExftUR5/NjT/PNPAxMeZS+5O9vlSJR2t+70VSuvGe1
 e83JcAaNStq/kiQjkXq7o+qiXpHZl1BPlt1HDlOSl/eHUIAisNsUdzTPIzICMwVk6n18IkNOZt9
 OK2O/hVHUSHjPOfVuZ1vzv9lchW1KWSe1DhWOt1GfIpgWuXKhYIfsLDoF3GpxzW/N7Y4PmBmp4e
 /JYUZlPKnSq6v0uMr045fXxpfC6kDg6iZFXSXhYolN5RJLBst5yPMXu+fWjixYMBUermMTAEkPx
 jD+GhN82tQpBlXdGpCg==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4634b4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QXJAvSDBUSNnL2LUfNIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: D9Wz9d3tDEzl2rkegqtihTPB5DEqOanM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX9YpWDM9NC0hx
 c8ZRR7TQSyPRNJUAniSMX84ECo6x7f/5YZfVqc7VqErjm5IKxBIqlLMGxSqksk/hW0H7gkg0yVg
 Pxu5wG4l5TQRF1nTRzORzPs28MNG/eE=
X-Proofpoint-GUID: D9Wz9d3tDEzl2rkegqtihTPB5DEqOanM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115917-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C40E6F5E91

Introduce the WiFi hardware description in shikra.dtsi, including
register space, interrupts, IOMMU configuration and reserved memory.
The node is kept disabled by default and is intended to be enabled
by board-specific device trees.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 3abd0a686d0e..205814c4b349 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2079,6 +2079,29 @@ apps_smmu: iommu@c600000 {
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		wifi: wifi@c800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x0 0x0c800000 0x0 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_mem>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&apps_smmu 0x1a0 0x1>;
+			qcom,msa-fixed-perm;
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0xf200000 0x0 0x10000>,

-- 
2.34.1


