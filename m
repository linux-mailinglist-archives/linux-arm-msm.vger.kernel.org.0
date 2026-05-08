Return-Path: <linux-arm-msm+bounces-106668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFIPKQ/M/Wk9jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:42:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039C4F5E53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE68303FAC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4203DA7E0;
	Fri,  8 May 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM8N0uOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9blZh5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF431388E46
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240470; cv=none; b=dUPimDMvJqLILRNalvlQS98PySmWjSMxmQjKTlMhvuhcS3pFLQG82EnaYZqJ8V3fvZ1sqyNuvYKkj6dzRnqMOtvU8+Ma4d4KoJD+roU82jwrskMFAcPebeUtx7eJWghQHshpGXTrbtTMvK/lPtmfAJF38t+w8SN7cwxpIW2xMYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240470; c=relaxed/simple;
	bh=wL+PFPuEZjGfoGr6iw7QtFmEgPFcLQXjULTTfexQiWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkj/Hgb0tiAStCq3sbwQAVyEECZxUvqccSQ7GIzr4ZRh9ID5xbMceyKNokQwy16tVJS79wRnO+OOPW9IvX8uX0PAOgQ3izb3IGxBIigYCUBOdGuh361Ca6e9cHjEDEVndryRKGxaZPPw9dEve/HE4a+Dqd3u0HFVa+jkiA2hjK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM8N0uOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9blZh5J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489VFAf2771491
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=; b=WM8N0uOxtF7HrAkU
	77MJPHEkWvD5zCcGnwNlz3B7OvgUokhAQXyQHbdJcRXLiTru2CRxt0DxVkLgO+Xu
	KpCiSKGm1hhTUiSa95H8c8OgFTHVLsxSYpl1LHIRVm94OjAUEaOo7RYxBK/Hv9LL
	l0rbTercJYh3aodq2wgawgW6argjLv+DswbeVxdW1Z2oeacOjXnGkH8M6pj+q1MM
	sjXpjd1s0ytLk0RjDxEYIFi/y7xcl/EEDnbxXEqFPlVxRkFqbFmIrIdFMT8HxzLN
	tXBIwvOlZr7CGxrzktnWqMSQbmAA99tyG9NyUJRUt01bxi/hX64nVLF9MWiDC+Vi
	3NlSmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kh5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:41:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ebe2c596c6so328236585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240467; x=1778845267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=X9blZh5Jxvezq+6jiNZsKGi7MBeHBYKa1VsuQFx909xPigY7bnzb8cvSgUCT1tCMrq
         DK4g3c+bf6k6m4gyX6AEaZSjPMzT9hIGjHkqQn0X69HmZAzPX0hsUjvvJRRlnBoWoMEA
         Se113/OomC7ZzxzWJ5q5Ov/QutJwMfw5tOuwJWqiaqYBaU0mqWjjA8XGVinGe24BqdwU
         r8CuRsqN+URIdMfglrSMtMbJ/T9w4Ps5MgtjVkTqePFQwIOqIKcX0RjfVwM8HI9QyUnR
         QQvXjZnO/a+ZGbeG1IXd+WOc+qjumz57Q1erqbMOwU3Snhry771vYKO8r1xmAJxp8k5c
         SMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240467; x=1778845267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=Pd46RdLQdM60bt1VNsluupx8ynvv/tuDBv2rX+JcgaFNwgHHH0b4yUx7ULW4uAVV7T
         lo8E6nYFX0zFxA/J8Rsa/Z4MGN/eHu8r8HOBVWqoiNcLd0yomWbPeD7yFbnp3SSimzXh
         BcPvf/852FmAxJnx1gPrZ3pZnjvAGODBZNnArkj/imAy2IZRBvJifVkqoTJlHKzTlGIQ
         Vysk39wU6ZTvaFvBQCxQ6MxzlUFev07sHOLaaFLGj2xk+mOIf3n+G/rVf8/u0gkiGSCI
         /QdpaJU5p0ZLHTzJhVjU0Fm18pXcIOfo4cQn/zFWa15sEWbWO5h0v1tLw5Nw5VbBRLKq
         0IUg==
X-Gm-Message-State: AOJu0YxR9HGKpZ7qd48sQTWr56A6RYwFZ437Ta6e1zaZmcnLQRlT7DIg
	cDGq47pX3AXc3NAAlinYbyIVMVr2d5kAZ8g7dV2JZv1I5HQtKelSKZSnkoCmQ/iyRGZMSD8+apV
	VbwkOUp68/iHhuZDLmXGmyDAGHDjO1GUCag/H8I12FSYpL8yPiXTpeuGa//SHFYx3OdpF
X-Gm-Gg: AeBDieuBvoDUQK18zJFyi6grlpzTdCNsNahzfgHc0rzHcC6B8JHYW34LhdSO6UQFLrk
	xATicSzrY5vlnvFEeVhE6cc3JWM3Olt8KZm7xM44ciTpdyxmuMwmXEFKsPwWf4pbelEoB+xG4x8
	AgkyLbafNCGtMsXv5wwvWGm6HO0KfKCqfqEf0Af/S3PBMXP/cosyGUC4U6IyAUMLiMmgMDkxYtl
	UfiEuZDvdvkJNkx2ocwjkjtw1pyP/cZwhJYBYXZsxJM4ueIee3Kj0hR3gT9dTGTs1fXutGAhfVo
	yV1is9dMaNecM9CRsVzVuW7NjUHwdFl1Uy5qbSQsGi78U4U3tFj/OQFhrDySA4TnoBqsDWgC6OP
	Gvx/2nUMmN78mb4u5L0dj4UWLWAZsATVWdJhwL/tsf4JZb7IEsYx1YaSTm07kGk6Dli91rjyVyR
	v4hYmzzO2z49x5
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788516985a.46.1778240466864;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788512685a.46.1778240466256;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:05 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:57 +0800
Subject: [PATCH v2 1/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-1-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=2779;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EgoG8dYeMOUsaStegKZNiGtsdNqb8ep20lln6yJOD4g=;
 b=gplcoxsXbwOQNprb2mtOphiyAsN4q5dxQl1NJCfFgaExg+NyoXXlMSSE5kuXRYjIG3/OjJ1B0
 BRszlaW/QF2Dwe439yzT1VZJvuEXFAs4f253ypvuNDIAZeusLcrQNx3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdcbd3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DGnd2QOFyrMO3axh9N0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EGhPiY1pAfBy5euJDPiJEuAhic0sr4qQ
X-Proofpoint-ORIG-GUID: EGhPiY1pAfBy5euJDPiJEuAhic0sr4qQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX/Q34ZYX+1r4O
 VudqMZQJLh8lHvD2OHVIR7yxdv9+d6fW1lXONwCCWa1lAT5vLiGSflL0vhEwlPQy2WgbbJrMAia
 wQsB5LZg/vuYwtgl2J8UCRcfX8nP6JrQPsxzUFEhDBgDrmuoKKl8SUzXT2Is+qz6X6O3oFvmFpu
 MciOHByEe387LQ0FQQrcc22Nw4KcbjR5Royo05O2a04x36zuodq2nL+6+cvIhideB13EUPAZ+hJ
 qxSFKSL5va/CntOiXcWrh7bWcJ4D9Sv2u4WVgqI5WJHEpfK2tmnK+bW+OIuvm4RRkFPSpPeIib2
 dMQJSPSu6HphGLYdxygaYMEFlTVlkOMZjsO7juGUbt2hdE98MR1H3qKZWIxquZ/0KKVSjJSqfto
 thHsBWaOQdySZoUHRi9IkvSAki/mFjj8NKJz46O2UWmfgtPeq4oJsKz2dYR+YfGwptGxHd3NRl0
 X7459lImwkaIBR0wI3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: 1039C4F5E53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106668-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7b874a3e308e374044255bce5bb8..126400772d028811c9efbb1443144ff4f264fcad 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.34.1


