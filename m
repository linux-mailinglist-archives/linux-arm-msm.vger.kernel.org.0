Return-Path: <linux-arm-msm+bounces-106551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFG/EpsX/WlYXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:52:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D384EFF25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 675233022B81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E204B3D8104;
	Thu,  7 May 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LihrcusZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBU+4Uj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCD33D8107
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194239; cv=none; b=ux/OUM65h6WIErZjN9D/+5T5JO6oTVyLxJ+HCA5YRK5kvvZqU7JFGVJp47k/l3nv8Y2WU8EMi8CvOV5sGNzM0+LFxE4bZTQOqkGCFg4LJvkfT34HDRPLRklSnwHqZoMhaqlFwa9dOL1cMhmPSNGYEwxBD/5uXR9lV+VUU1wG81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194239; c=relaxed/simple;
	bh=y/+a20YL+ysQIFGE4+AK114lY8/mBSFRbp2rnNsk+9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDSXcCrm8DROyoVjpp9Cg2c/LZ4RVzRYcJLdQda2uh+WsRz39GK/Vzy/sR4kCnU+qm7MGW9G/AurEzSy5GcgxP4/etYtegiOtvlAWs5FZfcQwujT2xhsxEz73h8VjC3IV7bd5+DCapciGJmkRYm+wqzEI/HMo3W+VlLxm4QkKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LihrcusZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBU+4Uj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647KUQOd1424459
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=; b=LihrcusZCPNaVV8G
	/hcNguhVavhDf3AN2SifQLSR7abJ7MknEWJyaSPOQ54/J7nV2i3nbNXDy0sbMx7b
	TGJ2FYEFkO1HIqciqVsVVyJJc2j7ExC5M/1TxuwMtBYv+yhstnBx0xq9IBN8WtsD
	l9W6KeVz2M9tBSLWBh6Z5EI9dhpObyszrtiPGU8EW+n8QR+7yinUg9UaazD8AAfn
	qNjuafvaImrtgS8ZCQPeViu3nyTi0w4Cp8ut2ktZRhWMVkkwgZsesf63VcYwhu3v
	yweuedmyEbfgTvjQ5jkZ9n8TBqILvjtUFkNr/If2DoOo8aPGWB0B3yarBmBjJKvw
	MXJtKw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfub9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:36 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d2ad5df14so2613252241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194236; x=1778799036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=;
        b=TBU+4Uj/UoaKu+Gjxjb3mU0QSsRrG+pT+zcKgmlqKxPiCcgbAMTekVI7zlkUO8j6kJ
         aHGtCIhKcLhejN/jg6EpdpLGQQvXVHeFJRSbNVDc+5ABvre4m2QC+41Hehxps7joaBJg
         Cqw8eHTVO8thp7okVgFncfTxwV8BLl5rXLSklMe282oN2WITs4NX4830XifNWGHpV9ch
         ATln4qWi4cpV5sjqOfYoXYzzZhkk9bZawqVc0SyUOYHteHSwXsA4ma4bqIqV+ZrxDsRQ
         sBeqO65dj2dQYXx/5ob9U0LO9rJBsUx1mO2GmXSnXTFXPpk05bBJNfTAKmcIY0mbbFY0
         to4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194236; x=1778799036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=;
        b=CD/yWubOO+lvjEw5uoXZVcyxIs8x/oRlknSkbiCxgw/2C+qjKg2Q6xvcluOcCzs6jH
         s3u9wRkMIMiaj4dHs0i9VT7Xz1+Mv3sCkIcWCPFcJamfgUYf+xi6zvc+dfXIlZ2q8JHU
         Tlu+KojWG9VzBqFmKDQ1kFa5By2cYtiriDaoB+vN4MY59PsRs0QkFAE9rpQp1u8P7XrS
         cmMo9bi8+tcVcZI+iTeIf+4E9ctzZrPGDH24BsdAZ/rskl/uTmVGP9gKqSsHBfgGsgVM
         qSOzMPW88gkXK3nBBykRQOeK24UKBgWme/bPnwZb8Xa/4wFuTZijL6R67FOqlR2f8tes
         jmxA==
X-Forwarded-Encrypted: i=1; AFNElJ+5n4zj2WnOgX+z8lrIjdcrYkXxsvGvCM5jllYcG5ALLvdZsbaDC6BlzdsE18blRAe5FTgq3GUCy3Cl1Uvt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqam2016YAiHadTQDmJh85IDyxZdPJvMDvh34Oc5t0pPNZ4EpH
	LrPD6zfGKGUZlpPX7lxzzVUu87B2ix1ZN3YZa9kdwAICEb9/ArwKGkmvHUxgRGRdPoJ/AzD4dRd
	3X4iykBaauSHAataitmRvIugQNpeUMrRDlTYx+MUvN3k08LZNy9h+oEaob5DCtZugYUz7
X-Gm-Gg: AeBDievgFYxHNIWJpgTjCp54pe9LZpNu9nJfpe/TnI7htjyqf0AHc0U3EhJ7wBVDwfn
	/K1zlFmO2YpoAT6Jl+SJQ5X6M3BR4BJRKAi1hqrrXM99vFkzTTpTMzt7PkhNXttbaKV6PCx/Toi
	XQmNJbwRu/gjpS0HO7uTUyZVdaDL1MsRnbi0n+W4Y+esxjZoiL/uDDC2oUyaIjMugQFkrKVi0Tr
	7SjU7quAVETDhmk+3sPbOGh6xuiQMM4sKAdDo/W/qzBOrL8fsESE5RaWHCjBfDMmn3XBIOcmxZe
	oMxOPfnsChINZy9MSGY/bBWGwu7hxxwVVFaGVNOkAsREKzfdE1uc2qpoMLpsiT5qQcCDiotGqDa
	BjLk2VfjHxhU71bCd43YAnDtN6qfGW1fiAAno1J0USgLk6VdUn4eUz+w2MATP7uq/d3PQqJRYq3
	hPF8RtQF2KKgvVlJh5
X-Received: by 2002:a05:6102:8515:10b0:631:2973:5c2c with SMTP id ada2fe7eead31-63129736518mr1766711137.21.1778194235707;
        Thu, 07 May 2026 15:50:35 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:10b0:631:2973:5c2c with SMTP id ada2fe7eead31-63129736518mr1766690137.21.1778194235272;
        Thu, 07 May 2026 15:50:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:25 +0200
Subject: [PATCH v3 10/15] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-10-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
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
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fd173c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfX8mNuYMMX27V1
 SL5jxt35rphVcri3T7fLp92gLpAddJ3B8K/2KeriATnxkBPqSfJMV7CidFyFhvyQqIAEkOKoVYn
 q4psPGYNDOhZGZL0uCWBmzaT3v4OlOBu87Xa7jfq2COge3mRHZIAxlHP5F6mrSf3vmAJa1XlcZH
 5zU2vMz0tKwW9BqBkYjl+SS4WXxhSNldQ43I/iSIWkYxTXic1iUVQZEjD9qRYtH/MAmw5vQaldm
 LByi+ceG+fNeMsqPT0fPDt3yjw8mgViPPTIzEaKbweysGgA2T0m+QEQT/Sfys7FM5YxSoKY4pkW
 JChznMCwRxzKg3HLbilma/QBlU5CK8XtEFWhaTrWvCbN9l2+94UhUliYOoASWOilxYDfMCg6fpu
 Jli2CwrtJMRi8dPPm6OVt1LD2x0b1/nRX4HpYrdXpLJfJ+9zI+SnnoSQQH3VBNZXYRmhUoW+moV
 K7XyL9XVniaA3UGQs/w==
X-Proofpoint-GUID: JXSmXFBcvyTyDIVHfu3fwApoEgrTpUDh
X-Proofpoint-ORIG-GUID: JXSmXFBcvyTyDIVHfu3fwApoEgrTpUDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232
X-Rspamd-Queue-Id: 28D384EFF25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106551-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
allowing child ISP nodes. Add the required address and size cells, as
well as ranges, and validate ISP subnodes against the existing
qcom,qcm2290-camss-ope schema.

On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
ISP (Image Signal Processor).

The address-cells for the CAMSS bus is <2> (64-bit) as related
DMA/IOMMUs offer 36-bit addressing support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..e70f4cd1348b8065ee9f0e4448185cfd8a8fb7de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -52,6 +52,14 @@ properties:
       - const: vfe1
       - const: vfe1_cphy_rx
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
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
+    $ref: /schemas/media/qcom,qcm2290-camss-ope.yaml
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg

-- 
2.34.1


