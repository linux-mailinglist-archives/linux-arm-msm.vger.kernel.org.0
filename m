Return-Path: <linux-arm-msm+bounces-119276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c+OkJOuOV2rJWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:45:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954175ED6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:45:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p1dXWGvP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A2rq1Yln;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119276-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119276-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CE7C3017B8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565462EEE94;
	Wed, 15 Jul 2026 13:44:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B2A30276A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123078; cv=none; b=kOxZklHC3Z6Y5YwgRjDhwFedR3AettqGbte0imDkH8rQ+NBTvXyVHULVV96m3RyueY4dZdUeTNbBGg8iUGoCPNOCAGpYRCdHNba2sagFzzoh9TMWGJKCnZ7AoyMTZ5lv0RxzjfhXCAa6UdlXwfpSzoiHg+4k02kLBoD9UjzK2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123078; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTFt7M8c/D1v3c1woaoAJs0FDk/K/UCnrtw4ygRbN9VN7nZEy7NBEm3nPwimhGVTcWAaNdl+yZWIIqyvLMdLA0RVp+bsJbeuZ6TzG5HpxZAp4ngO3K2WPzUVp1pU4y8VlFub/J2DtqJ9D4yyMQJWIw5LTidteNkOvviHugGwTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1dXWGvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2rq1Yln; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBci0u3479148
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=p1dXWGvP4dG+CwZb
	NO9LA3qIxwGeSZzNM+Ae2No+B1X3BnDvD4k0OBAXj/3bCv/HWPXlyzBQ8PGAcBRn
	CqjXWTUwaAU8RIv8XT2T83Sthawpf0V7tPGYxRIQqtAZMLCklr0BEYyCGqTr/GvI
	fgUGWC+tY47ClD2oknu2VyxAEujwSZjWDXt1ykxYQKqXQ6upKrsHLxkYsshIRIB9
	QWi9gOQJpvy4VjANWDgxDPVSDyy9ojA/H/iATkfFG3/2J6XcWbo9B3jH9IJeYS4e
	vuyBeZd/1H7Y+1ueNK5iKb6NE4N8vfdkoBn6VBiBu4xHWK/bTl33fDp2AlP89/bT
	LL6jsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3vwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso41230491cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123074; x=1784727874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=A2rq1YlnY2qKkHzqsDDXtebFTIbe5lJb6EPQ271XLQd60ykQqoQMVKK5hac9l3ierg
         qGH6II5cjP71fJc2gFAG9uXi48b4PHSUnM9zhrS16IGDX8cULl0o0oy4Cj3kqwIur8DW
         rEvzicwXCUBO1uFbN4oPI45VHqWYw72fBNBeoN1srehOnnusUxaT+xJr/3C6mgwrVt7T
         0XZk+2gylxwaOg2JgmDBS9GudJdU6vITLRW2Yumr0sbQNqXBRdDRwaWAe5gyVT7aJQVb
         BAtEiy/cteoixEjByK07lctbYcbLwrAKN0zlk5SDxq/Z8lWVZZDLwurW51vHswW8P9Q/
         qsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123074; x=1784727874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=AS2nJO/waFBkj2RQue7J7iFU1lO36a+iIagfWVWTyZKtEwc//Jfxicchmnw/hTnPoo
         lhaGJ+2n80Xe6X2LmGgxOON5AyYfK9E8ZUSPWj9bO3Qcf02YmYQFVaXTyROzpeXfmmVr
         zOOm+Pn/dDldL5ztTFsapFNrOpYoMBtcLtenkfwmI/D5ysXrNacIufLfOeUGoVGSE6zS
         8ekO6q6u1BxXNHtCUTpvb3YAFHIjWpanc47xeFNT2rvVsz+fCRlqUNlNKYrEtXUeE68H
         mrFlYcNugSTZaIqtAPnVVJ/QLTDUugkxVqs0Oma2QkROYOjRNbe+AOixFxrjURmxcFD5
         /GkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrcbr+K42e0i9Pfj+M5lW22soixSBykgrHxDWDl2zrKbP6foz5lKNlUixmvagBY7rmmW13eWv5kEkLYG64M@vger.kernel.org
X-Gm-Message-State: AOJu0YzyaT3/TWFhM8vZOMwcK3a+3UnwOB24vsDDXqoWrg6EqsKhJfeR
	9rku6+e8Sjor6quhvO5nX7wm+v79q1+ux5zWTlgx7c7u76qjqjqCBA2bx/UP09Ca3BOWQ2VIH6d
	83i7kChWZOcuSa5m9wFKQKI0XWdzm8IAU7Fp3r19hvNyCKbztwEtxRitNqBA9B15o5TGb
X-Gm-Gg: AfdE7ckjrz/1kHOXSvhZfOLuPwlyXayl5/dBx9ZUto1Gsw2e6KjDCw62IBMuMPBu7Xp
	q4zwl+at4nTuhDjFPTPGolruFnq0gGT5Ay1QRb1SBLpAe6xKsMxnQonBVSLcfn28t471znoplPU
	b3KTr3ydbDL6h1sXyINEOmwKW4fisByt3m/+s5sM0LkFWaSnjAosR5eWKMJ82ax8e0H+OUkoOkk
	CfD/YNk0s2VeziZgCgzTF+mYWp9S5VHZec92r79Groc9vYxC2PmuEgFJNR/LxenGTvrUtzRozR4
	yBzARHXCalPFc6xXBvvons+Kgt6zmBmpQ+gjPBRhzWWDL3OuM5nXK+G1EbwuzXV13VjBzsg4o1/
	hV3S/99LSvupJPr++Yn8Dex4IQ+h0ItzV3gqvkNVmREzxSNcg9BvZ8rAZu6KGbrF1Sn2KDYpDGG
	lxd88pGmhKM1eo4aGZh0k9eZ4KEaDO9rX7X+eSVzA224VgoecFG77Btb71R2S/qQ==
X-Received: by 2002:a05:622a:8c3:b0:51c:1ec5:d11 with SMTP id d75a77b69052e-51cbf130085mr181466791cf.19.1784123073988;
        Wed, 15 Jul 2026 06:44:33 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:51c:1ec5:d11 with SMTP id d75a77b69052e-51cbf130085mr181466461cf.19.1784123073563;
        Wed, 15 Jul 2026 06:44:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:28 +0200
Subject: [PATCH v6 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-2-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
In-Reply-To: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX4BIHxuMGqTJF
 j/yRadIqv8/1N5Io/Wjn6z/byWls+FQjWJda5hY8INSXSQUERDEHOYyX34Tvxxm7SJRNhnrPctN
 D1wMqOIsdBSlPmmH+TESuLW7+ZmVEI8=
X-Proofpoint-ORIG-GUID: UHXAoOxU7DgzR3A5BeakphQlYanB6l6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX1cBqkPK6ER8l
 WfciF0VOiCRWgY1RHOalodRNHaDI5CdSAdB/q9elahzgqrLp6X9tHYC3Vq94QYKigfHfXLuuvF1
 TqDHFBEykHXqmTzVt3Fl10F7aTF9dDjkm/+GvlVtvmqAFKXb8j4QIzasERtW/XlTjM/YYxI5A7W
 6P4C6HDJ0a7BrR+Pm8d0H06F8laXzcKnYxgjYWYXMur+eaNRKEp/SGQf2hCUO11WqMO9VF0+JW+
 kz1DwpjDGYETsx0op7horBk8F94MDuzsenTOjLRXUUXm/mII9E9ZA9k09J6ltyz3IyTGt6M1fGh
 RHEz5XciTJ5f0VrH9ilugneZPTEJ4lEBEwXfyeyMdk9wepAt+EavZ7vuebfbXLlYdBOvy07iBGU
 8S403IOW7VPPgQ+Kpd3Mtt6EvJD4yZeL/ggrQeI9Grs4FYcWWduEHDljpbB1FAgMdLlZDKVYY8G
 /zNaggUcYT2XyfU7bog==
X-Proofpoint-GUID: UHXAoOxU7DgzR3A5BeakphQlYanB6l6u
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a578ec2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119276-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2954175ED6E
X-Rspamd-Action: no action

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 96 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4fda602912f7a9443b8a77e46bc015e244f82e08..eccf37de51285a0dc6d28ffaba2d47a9f93d867f 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 15
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,10 +118,16 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,10 +136,16 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 7
 
 additionalProperties: false
 
@@ -143,4 +189,50 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9633";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three channels controlling one RGB LED */
+            multi-led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RGB>;
+                    function = LED_FUNCTION_STATUS;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_RED>;
+                    };
+
+                    led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_GREEN>;
+                    };
+
+                    led@2 {
+                            reg = <2>;
+                            color = <LED_COLOR_ID_BLUE>;
+                    };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                    reg = <3>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1


