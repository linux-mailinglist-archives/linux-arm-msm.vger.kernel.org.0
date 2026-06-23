Return-Path: <linux-arm-msm+bounces-114217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SgO5CtmFOmrs+wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:10:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7955A6B756C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:10:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TGMrIKdO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KMnBD0Hj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114217-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114217-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A3E3160533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678D82D7380;
	Tue, 23 Jun 2026 13:05:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D82D3725
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219938; cv=none; b=Ja8UPLbEmoaWCSWFJmvrioOivYb8bnEUBcfnzAKAXGWHpO1Co1c4ze0CT9pXZAcEjY6GHbzGxrsFv5JCncamMh436PIUINxgWWw0yhDzLxiPcVZ/EIbAWQCdMfTBwESh4NNuM9xzipAiuThDnr7KLNqLOeRJVxpbzj9Co76RiUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219938; c=relaxed/simple;
	bh=93/aBfJdMnMxQ1hbCH7NcblkNMni6c+McXTe75xVLsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6S3HshHfEZd+EQX5IWpOApLWjIUVqXRYDk9Vtfn46cpKmpcL+voWXT9vbVpq7qn152HnllXMWRoDZbDxjsl+qZJNnVsNsJ8iuJKzMOzwtybPsbme7UoP3fIQhOOF0UyZhBKuouHTyTeSNcqtYOaYby4OCOZjoHFEJbuVj9T2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGMrIKdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMnBD0Hj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXhdT3753500
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QBENkoZaYaXxPSASHmcaxsCEyi7v4L7vT5FlX6cyDyA=; b=TGMrIKdO+2KowRQy
	KqzlHrW52zH0RMz31yQPuY014eaaWZzZT7cOJhpp97cR6N++GJrR9kJfIQBPFUiD
	00BM/OogyRsjiQeRy6q3kGx6ZVeFjxMeg+R6hBNrB8GIpwqioIkCRkGAA8dTfRXQ
	O5+apzOTbwkiiJAv9vk7djC9dD/OyJcbMlRr4elNUIJW2GUpUjcKOGLF9FyhTW3T
	6nn0zbrhu/D+JviQpK/UJTo4T1OR5/2KJyYTHy4i9bqO/sZt5rEjkld8SFW8VgdO
	scDHXNYrpPkHnKOCUY8iX8DmiNR9ldrZyRjbVU9geyBD86aOk5npHxvTA0eE8QEl
	khxChg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29h86r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:30 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7ddd34a6336so113516697b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782219929; x=1782824729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBENkoZaYaXxPSASHmcaxsCEyi7v4L7vT5FlX6cyDyA=;
        b=KMnBD0HjjBzXK8kml3DPXh45Jp/yl/EwwQQgCMSd+Ve8qwHA8Ghc7acivT4CyhFyFE
         3yaDM3egMiW47eZ+BV1yoP8/eVLZm1EVNarPdeKdlHxjnheniPouoGQAHEArJ1BFXxHX
         /RLJS2WCgIC53eNdyj2YK34e8cOVVDj4gQmnxtVBWxBfJe1LvwuX4jEhG/QLqqdSkUQA
         ZjWn//LGMzscJMo009as4+/fUgMyB3UaOrTLc1mmhl6SjtNGTgpx3aelbqL5b3WLqzpk
         KATln7J9lWgMz9oYgvFZYhQrASN87vJZZ0W7Szh6aD3KPfFDX/p4bDWJbNdZ7iyOazD1
         DaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219929; x=1782824729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBENkoZaYaXxPSASHmcaxsCEyi7v4L7vT5FlX6cyDyA=;
        b=KgsU+Jc7OupmMy+sZFzCU/2Mdh4dKHdzmbOza+K1adzS0myFTckFgffioefPs5IQrt
         /s/ybynAo9ipT8v3ao4hOzPr8k2ToY3k6wcgMr1K1k1a9t9qn5ZLiko0Zr0TGcsQqMkB
         5UcDTZHKXhxaJpPLooqqOQ63unJmlaZQOMtlIWK3nFL9jcW25d4/Bj9hGp04KJufzu/i
         quf+KzGJRQiQ52GN/J/4a3j2nWE9+4BUsL8L7GLhF95Yc4uS457bSCP0BclhZHY09SZ/
         8ZOAx8d8FEGZYXssZ/6JPfVWYzE6PdrDriL1vxGjioYlNeyBA7pOAOpOY5K8J29He5GE
         rCtg==
X-Gm-Message-State: AOJu0YwJsXx2r9zXRgZ/BGbSZAvjx1wb5s67WBAUPKfCZDaDMVa3Xi8F
	gsRblJKSzR6wx3SbPEFIc+jnon4hsvmPO8+rd0Y+DSol/7D7wihlIEiyYEiUA+G4pZFh3+8MXAb
	Q6bjKhrANBpDqNJVU0Fg8O+VPwquhJJhLrU3MfIuDddZQOGHPqoK3X/tlrlouR6e1S4ws
X-Gm-Gg: AfdE7clJlkT28T/6BvBnSxdplx6OsE3/h0AZlbhH/0fZxdJ9dbMzUVgHACWUv//RAb3
	ZN3dovwjOBltKXvF4+dQiQO1FlMlmkv3niHGN0oMUzM/hYnD4zDmPm+cziuc69lb8m8FqMCmip7
	g0370d9Zxgdll5OR0mCriKbazeqvwpf/hNYv+Cn060gEtQRRdDNdTancxYCtCBN2b7EkPjriH+r
	n874CKZ0IcAy1l2jgHimmP2GMSfRAv9jH4pW0D9uOycJ4aWQHfP789d9vDO9rsCS9NSX6aNRlKV
	XYRdnBcZkjlwuXyOZmC8uqdZbDWKG3tfF2ZtnNaAMgptPK5hRnVMg58v7Rn2KUENqkgwRjFYAbg
	V7DY0LHp8IS5LZJKqnIva/4jgm5+6vf4NBr4s/IWN+hA6RjYxOYPRR+Kqeg==
X-Received: by 2002:a05:690c:3706:b0:7ff:f11:24c8 with SMTP id 00721157ae682-806dbc38f2emr22464087b3.6.1782219928951;
        Tue, 23 Jun 2026 06:05:28 -0700 (PDT)
X-Received: by 2002:a05:690c:3706:b0:7ff:f11:24c8 with SMTP id 00721157ae682-806dbc38f2emr22463487b3.6.1782219928411;
        Tue, 23 Jun 2026 06:05:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc700bsm44091127b3.36.2026.06.23.06.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:05:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 06:05:17 -0700
Subject: [PATCH v2 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-phy_refgen-v2-1-4d15983bf91d@oss.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
In-Reply-To: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782219925; l=1582;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=93/aBfJdMnMxQ1hbCH7NcblkNMni6c+McXTe75xVLsE=;
 b=gKQGrmpz/BsL9ZJoibvqsJOvbxakAkEmoj0/Qy8a/gal7/BjPkvx1Y402RQQVlpkpoxR0FMhq
 MMGkRMKXr2mCLOZh/Q/rAZpBV6HW98StfY/eICJv84PR6j40cPfKEMP
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a849a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vs92Cf7bL59LNXS1VVEA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: qnpQGntXBx1O3MW9nkzECNrHRcoqmjDw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX8/mbVS855LES
 qmEiC5L95hPXAqgdBDkh6NKxaRN2hZdyz2vlRYX86d5Zr4pknfRSfXPKM0EOs/c2TQwLN1kkl/S
 s1zVfCZxDwL+X7JRwGdHQpCSkQ77DrQ=
X-Proofpoint-ORIG-GUID: qnpQGntXBx1O3MW9nkzECNrHRcoqmjDw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX1dCnLyVbuQTG
 truhnDJcQIzSNFhVcibCEoKhlycJeIh6mkaodvMHa2nozhxU5ovTY6BQ28Dwe4zm0PdF35kusby
 4bEUtPWp66hWc1Hld4/m2Ne9SAIviX+F+21foRicxvuFCZw3hJcRNvp1xVhwuPbNHlXZsFk3xcg
 hTnCJfX4Gnr53vvDRg29BqxixBvBa7X7aDEgYyeDTpn5m74IhSn7HEa7hR25A9pIRxk1SSIU2Wc
 j2ehFOX6MCW5fB+Nirz686ZYaRqL6gUzhAsyWxA+qxi/eFSwKCD7QhBLrx2Wcddye26CO/B13H4
 85h5eByeEFLHzOmNmXd2mDOVolGdOdNI+jfDBJtQowOKEdLU4B5oVsberzYs3iu5FbtnnhsCHH+
 wTYsTONmoDKk1PZ4opbdeZ9mPRK0QEa/0+tGrl0Nb9LbFZ6dMWTgnvwT7tstT0ySysCQEekqQL2
 AsASYHpuYdlcVgy7XDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114217-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7955A6B756C

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now; other platforms having
the same requirement and can be added later.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..375f5fb2111f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -91,6 +91,10 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -261,6 +265,18 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x4-pcie-phy
+    then:
+      required:
+        - vdda-refgen0p9-supply
+        - vdda-refgen1p2-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1


