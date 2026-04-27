Return-Path: <linux-arm-msm+bounces-104727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBFwFbVb72m3AgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:51:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D90B472CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C747300E69A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2583C5546;
	Mon, 27 Apr 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFX8rnwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1Wi6fqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C13BD22C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294018; cv=none; b=s04RotQCFlMu/bb9hDeTMtmyhvNzS9Nq50ITVHzDA1DmBgI8FGlQ5VOlwawmSKksNDDS4+/3AZkoCj6Tze4OrAjgbZXlw3YGHEDtOPIOupCZeebbXWd35TOzuIPqQypK5JuXb+T2b6QIp7BveRK2lhr1WNq705UmV6jU/I8N0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294018; c=relaxed/simple;
	bh=t3oD0Wav7XG6nXX5m+LNYCFF8Do+gS8hdZjFgoDgo8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lk/vKEmv5KJ5O1ztRdyy2pjS7zminI2/igc6pd0rMYrQlNJ8nNxkmifsx23ypp9usM9ZiDm+T4y74Pd+Ja6NOtlSexlNRvC1TdQ6JsItdFNEza4bMTwtxVptX9mVx2G2SoKCpCrc/bXAPgi8+AdEu00t90xDWbn35LUB6AOfn7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFX8rnwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1Wi6fqm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3vFa3123830
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiDzM8ITkpj2w4YZF7EhsRvWIrQfPBSfCjKhrtsK9Ck=; b=lFX8rnwFiwmXWMMV
	uKZWpXFNFFpewz5mV4Blv5ebSfs0DLv/1Evh8VsiDfUtNGIQqCR09+Mn2KrVuyfj
	DHzwr1ZJ4uV8Fbnbz2MOo2nfsluC0WQ4hS+3/gAcIBqAtDcmX6cEU2JfDf2Y9tlJ
	t8fFMJC7z/bDl8Xw/q+D1y89VxTjtjhh+MuC4q+yp7dRP/FvQgmD8bn725XU3L9H
	wy8ASAHmObO8Um5OyCdIaiPHgDmckMhA672HEQlOuSNr5Z8aOoW9W0Z2H9CRZtd3
	NU3qwxGWzqBiwD99SX1vhpOrDjm11MVK9fd3hNFTLCpemNH+QtlYWwV1lDLVfbs4
	CK9oDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgghst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so217493541cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294015; x=1777898815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiDzM8ITkpj2w4YZF7EhsRvWIrQfPBSfCjKhrtsK9Ck=;
        b=S1Wi6fqmYU7Y0sSWuPDqDBkwHXyUemTAAFAVl4VoXuDVHqBIv6q2PLWNsDNz8NaMpe
         3pPFF3Jzm8HbAHDa8/PdG9XlJXMzdDi7l1jLDSQyIuMWxCOoyd0iYLPeu26pJ0IeYrX8
         E8hDaqcIyXW0YrV8hul2rq7JjK5pfxaPlcT+QcCQjDD37+gClRSu1rbNRYtyEuNvm+pM
         IELOVuFL6IDG8DpNxcqXzBhWN15sH+3tLC9KmXXfHbby2DyDcW/GPwTfKjtVHTquykre
         a8O7wusZxVl5XcOokSH4mhQNHGKCcJrgYqNNdURYW5RFiktADFvp59fWkUdXRyNkCYYR
         QkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294015; x=1777898815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiDzM8ITkpj2w4YZF7EhsRvWIrQfPBSfCjKhrtsK9Ck=;
        b=Id/fm5W2UZr7gYjbG7bAj1qO0cZm61X5kPZRyNxLHZTvJ1rtQdvwVoigO5qVqXNURl
         G4xtSInqAqT+xP0zMCmpxLg+a0HrKIrTaP13qQAcFfVcoYXyFX1s0CXy/MQKTBfnDCIT
         kwCTNBxkXgKydom3SemcKr39DwqdNbwHw3MGnLnd5fAIn4JJBfEVRSJR+OoKOqjnQQi+
         RJuRXt22cm9mUQRilHcV5BDXQ4vBoKgg4ZSu0qmLfZjLwq4wJJOZF5LMFHDqYbbQXhbA
         WuBfFvoBVKicfczRcFhPhfJQR0U5ZlurRCunSNrvm1FJB/E4ZYtc8iUVTqKznvGxiSl4
         sQrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QpD5z6h60HErZrbwIJzcUx6USjQ/4qKE1AeiKTbPROQNNt6NRw0NIm5uWX22yrOFIl0LcE/41OcmfTg2n@vger.kernel.org
X-Gm-Message-State: AOJu0YzyRs/CUH1EIdWpUQrLN7+SFSnFMpn8VMHm4io2MJ2/snKZewhw
	RiqX+0xyGzC2a+Pb+vudItJxF8G7EmVijjRuKby4nGrf7jIwU56NRIOuUdoSKfsoZ+1CFM1SAXn
	MPpcZ0AM+iLTlNFQAVRz4YzGgPxRfD8PqdlePi4NosEvmaUUtUF1zn9AIhzJzKVG+8TiC
X-Gm-Gg: AeBDieu3R4t3cwDYEomjByEUKELL/A0oFfK8zBeTC66MHfmFsc21A91FkMtbiSqQdxd
	sKI3bfzDkXVvp9UV8dWspgl26wo36cwxyqkDIC+y69OZHimJC7S87txFq8F7a41pnslLX4fGz8J
	EU8pFCwX9AeoTqeks8OrfU7IZ4W5Ur++gDUuhVJ8Zx+6ock+iTSIAmEDx/6QDCcuCNQFct2DfJ+
	BQ/1cgVFAVi1Qp0tgUbfHZV0VHnw6832b2Db5+Kl6UYfH3bCPAGs9unT8MzTErJHKAmTRp2vyJa
	Tudts5Qhc7N8JfRHPJtDn2Bp0k23HLv+xwN+lekJelqtvPHHtexqnxdOpTOojkuqPEk3BqdsOPL
	9612LqAJhl/L5uQ7VsOmL0aRVhKdj4dlDNo5v41UHdugTewUzVusRv2SyUSV3uamSPC1yJyoohQ
	QLB5dN3gYiF1mmpsEE4Xq5GdCFmtw=
X-Received: by 2002:ac8:5d12:0:b0:50f:ba44:ce4e with SMTP id d75a77b69052e-50fba44d76fmr368833311cf.6.1777294015201;
        Mon, 27 Apr 2026 05:46:55 -0700 (PDT)
X-Received: by 2002:ac8:5d12:0:b0:50f:ba44:ce4e with SMTP id d75a77b69052e-50fba44d76fmr368832821cf.6.1777294014697;
        Mon, 27 Apr 2026 05:46:54 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:38 +0200
Subject: [PATCH v2 11/14] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-11-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX9TIv5q9CJ9LG
 0TLWEksIj9JAgUHFc7CSzODauOeiMpj91ZXG0NU71Wjdqgp2qt1fLTjopibW/yeLd7It1h5YRYB
 qjh4qTYEvc15n9GyYYyFU0vD6/ax2B6DlAsizkHvhPKwCXw5XVmrChJalHfDuJsOmlfDKNYlrg6
 0HuVFog/YuFu1TFOeQ7Zfm7o3LIrCCRJHLIVaszh8jzx6P2qySW5XbGQlvCa199rENyGwrR+bC0
 cPeQY/xtvMGqvGQjtD1JgR6vIHaDaW4jezqcbCgcCzA6gkFwCw/0SdGS2maGSiawbT5qoq1d6aS
 xav4AJOMr7AJKbkf1Czk9N3eJ7u0q5e3fPaRITaT9HrHwIHdEH7AsJAzKuA7C4dcdE7hRzRPA0e
 tOOian5iWw9vBjq63ex90OQuMgxbKt73Urmha4yMGDkJssBP+g9h7hgw9ZwD6qESYSqAmrDYvjY
 nlGLzJecqHz2izdZIdQ==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5ac0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wwXQJzIf0hz4qtelkC5Sw8BgOGM5AlBQ
X-Proofpoint-ORIG-GUID: wwXQJzIf0hz4qtelkC5Sw8BgOGM5AlBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135
X-Rspamd-Queue-Id: 4D90B472CE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104727-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
allowing child ISP nodes. Add the required address and size cells, as
well as ranges, and validate ISP subnodes against the existing
qcom,qcm2290-camss-ope schema.

On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
ISP (Image Signal Processor).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..d8b356028e24c3c5b2e9b7f20e220db7d491ad68 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -52,6 +52,14 @@ properties:
       - const: vfe1
       - const: vfe1_cphy_rx
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
   interrupts:
     maxItems: 8
 
@@ -117,6 +125,11 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^isp@[0-9a-f]+$":
+    $ref: /schemas/media/qcom,qcm2290-camss.yaml
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg

-- 
2.34.1


