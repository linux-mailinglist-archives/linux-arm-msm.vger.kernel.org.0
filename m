Return-Path: <linux-arm-msm+bounces-105609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO0/MDJ192kpiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 18:17:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E74B6645
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 18:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C79301A717
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9323CB2FA;
	Sun,  3 May 2026 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7Sk9Vy4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLxLzzDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9D3C944A
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825029; cv=none; b=UAdbJdQgL75X55UlXiTbjbtO7gB/3TJl1+esyIG+HndFee0N0HMplleeTt0MEE9u/Izr99pj5ycfSQvxqXv8UjsB/CLh6MQB/v4roIK6lcTblZ2YnqqH4lQu7Aeg2VP/hxOIkUDdtOMUNUiYHKyx8nv/ZQlXtyQYCuDKZBRAKOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825029; c=relaxed/simple;
	bh=PkrA902oCgn+IeJNZKZpPXeZDH/4kasO5jqKwwCH2uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGumLnsRAf0s6AS8AKYP1qbk7slBsWGCkd4RpCr0P3Dcfxcgug32zIS8ixl2ro19yyvyAawGsqyqLKzoem6aHa0LOcHVNDhNzZlCN6qB73BDgjeIShZBbu9CHoLAmHrbSkfSNkCEOjfqbbixzBcjBxty6LLh8paiO/4evSemuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7Sk9Vy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLxLzzDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6438rdcI1708522
	for <linux-arm-msm@vger.kernel.org>; Sun, 3 May 2026 16:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/NKDtmZPPlV
	Ttzu16Ne0F6Nn7aFiPLLXjpCM/e8lyd0=; b=a7Sk9Vy4e3Qyv1yC3bnv5AcFzrx
	VrIM2CJlgwwBgDBMF3T0L3DwgyiAumN2nNIw3f9duF/9tLPn+tih/etv0wBVrsF8
	lmvxK9qG/M/OYTzaTa+6E06BIRi9s71KZHmggQxAlhSNOIzBhyKs3iDNoRHA0llI
	9zKJPFRja3+oyM48WUuKBGf+7lX6Wckko9hnTo9D4Ys1++FAm/znTH9yTSrJmbKK
	61KoY0Wa0U3+X5NfdmLXgwGUDJj/yYMaNI6b6QVUU4IBFNSx/4KOvTLVDCxtmYv2
	CWqS0XWkthvWWe3qPvc1wIsN37Z3mxONmtY+ILVcAojS6k4PW98SH11kG7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg38p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 16:17:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50df4c130dbso99215691cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777825027; x=1778429827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NKDtmZPPlVTtzu16Ne0F6Nn7aFiPLLXjpCM/e8lyd0=;
        b=kLxLzzDZcsztxAcxo7GXZdDup0MDCgqrHeZz5H9EeLJFSNdZGW2aXJU1rRulCaz9NQ
         iqzbncHcVDOPh7XDajZGcXJQ6GJta4Em+TQt0YHJi9QRKjFS4p6FiTVUR+1sL+y+xl5k
         DwCkW9kLgTt6s3kZnAldsNP8z5PTtwGs+JRBF3kgzOobjlBt84hc7ocvWYZjStvsIaGE
         7aVuL3j6Cm2n5dyGB/ij985DeuSoTCYzxZr/94j3MdJULwdCmUMaBab+xFGsTz1IJYVO
         S+gjx6lc221QATh4q9v3+Nwgz9fLiFxNbkZJlSd0qv9K4MVS92aAsSLryBajh7HCN7K3
         gx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777825027; x=1778429827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NKDtmZPPlVTtzu16Ne0F6Nn7aFiPLLXjpCM/e8lyd0=;
        b=aRc6Kf0/ZP2pqJ43BQHrrddKdu2w31ygAq54bGdXRfPZxsp7ZuCD8cpnZxC0pFThqf
         EVhI7sQJJXek9bFWRLBDi0UsIjvlddp0k/OaW61zOiptaV3+x8H1YDJu1Kj0tKD+GbuQ
         yIJAV6eG2CpjcT1+MksPKnp3o0W54Uu4uIrqwrujvLaoY6gS5LBe0XNhcjN4/YtDyJ4f
         Tr89tbUGQrjwxM8+9iOMEfBN78l3P9eWQuH9canhANzqtLxxmTbEgrXxfjo14VOYOdJJ
         TLR1TduusG25rlWYUeg4OsPZ5bUY2DaeDeupkTz1P7JbqjFnLfS1gnVKrhK7HXVYWz5X
         Bx9w==
X-Forwarded-Encrypted: i=1; AFNElJ9CcD8wab188cQLDzCw9fpujlv7Sd2ubxj23UkDT08QSTlBp/vrSyISTAPIxT5LEXzmL1n63Rr55NZT27EH@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNH1Hs7sfpqSEjWiVruCTe3Y8U0EmZMudRxx1GHrjLniLaBgm
	8Bmk6tT8wqIPTTa4uSkCDRpkRUSq0LBsce3cBqmmkhUT7QiAOdyhMmvCofgQmsc8H0vJeutmEz7
	/bbKkqNaqzKE3oW9aBGJNCBTIxRYZmDv2qidMw+cFYWsIzEuBUlO81UYi0SXvm1jczGxE
X-Gm-Gg: AeBDietEu14QJQZMZTXB4/9vBeapi6+EQMZhjaqrciVdvFm0BV2IpeDVOsu6jmxpq7r
	c9kgAoiQuHci2YCzyDn8ksCOFgyRSEOGjDvKBIwuHc0e7z1NszJtXLboMxGDHFJmJ1izKjS0ta0
	bXWxOatfQi6mPZrYokCIqLhQdKTDktpe3YZpF55yBKWZ1ZabQD0lyRHyV6DFZ9qwFuNjUbtNXAG
	2aJsMZ337knPGBy/lBINSrGt4tpReEOoUW1FhgROT53DsWConUuTFbdIE0ktRC8BT1S4PWv5Oqj
	jIUPGamSvqVTDBT2EkN4cz7TXDkBcEDMdnTkD4VIBk7fmh3LmwB4UWOyUBY5llWCK+swxVXc9iq
	r6PMBZgJtFjYxigxVy7bFjH2uMai8DX2EHjYPPSGQ2txk7E0=
X-Received: by 2002:a05:622a:594:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-5102d0fbb4cmr182729801cf.16.1777825026733;
        Sun, 03 May 2026 09:17:06 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-5102d0fbb4cmr182729501cf.16.1777825026314;
        Sun, 03 May 2026 09:17:06 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69800sm198912675e9.2.2026.05.03.09.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:17:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] dt-bindings: interconnect: qcom,sm6115: Restrict children and clocks
Date: Sun,  3 May 2026 18:16:56 +0200
Message-ID: <20260503161653.60785-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PkrA902oCgn+IeJNZKZpPXeZDH/4kasO5jqKwwCH2uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp93T5FoPq945j+z6yFjr6XMHht38X+e8RI5pV9
 6eeuxXc6N6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafd0+QAKCRDBN2bmhouD
 10g0EACPuImuW0DZuxamCKlivHWVZE/wnsaxhGNMbiqLh6/dXE2WDBDkg9rnaENFZew2MG+KZ9F
 trwc9Qi8opxlxTiANc2N3RtKNP/z6egjk67fN9EyIne756Y10H6FN50B3+3N8UESCk72cG7tg8D
 NbxNejxnSb65JCrbQczPhvn5mU1mASu+zVrziK+eHqrMXcyxSNl7BXN0qKKrVFQi35OtP/9CBut
 wgxv7ScwK0Kuwk1TQxk+8YFiJG0sfAYO79xr5LpOqX/83TYRuon4E6rsIcQWlcMNkbcpXn7gVxv
 SStHdkqAFA5PCM/CEirYIt5sMH3u/JmYNphfBcVrGur7im840lTsfxnGOfnIQdmeMYGFoBadnkA
 NBPNRIMw2ufVt8U/CJpRuTJBFj/YIzdpFpA1DrfHLFOm00JcomIQAEGejssuxRWEDggwXB9NNtq
 0A0rprOjbSkyIyeNLCx1PmL8HtE2NT2gMU6YcH8MR56fhhxq8D3EWsWOSGZn8NT9hJEBQLfDg6E
 qUMJIrbZAgB4WJt3XzHHOOEO2e8nbwrTxdlnNrtdgtV25NKtLgdLN2lYjmxRpIwTZbdoLaZomva
 Q3nV81h2QTlfAQyS0mwE3nURx8WzzTTt0N329fDO3BxZeeoE9v2kIG+kXokJzjXhiowKSggOScb SbsUiW3r3yhZbMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f77503 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SRmnlaPtUuCDtAFh0bAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ai84NnHpveHAnmLKcY1W5UgPtQ3RAcuj
X-Proofpoint-ORIG-GUID: ai84NnHpveHAnmLKcY1W5UgPtQ3RAcuj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAzMDE4MyBTYWx0ZWRfXwZVCj6rNLzvl
 zK9CWWUBTszrjLG6TYI4EKrtKTy4OI27emawpMaejdHx9KJR/m/NazJC7iP9XGBWUnC0Zs9uCt3
 jUjOuxf9xf3p8QO26T1Kz/Y15GPdwLFY05DctL9bMTaP14CznkmaKxQDorTdM4N1fty3RCILDdm
 3fd72bHRZKDJd6w10e2rfmklfjgqZkiw3FD0GVUJbSStIJs4kFRnqNn1Nz2l0Q2jyS8BiwRaeEp
 rZUdGi79KZhiwaYH1OsktvkYA+XrRd/o1t+Wdxt/jNOBKHtVpy8LHhYJZs9InKGhBlUZjjUSWOp
 2S2s/CCHrZzPB45q8+p5hXCgZwmHQp9wZ1VvhXyk6PE7DISgnKlQ/ybynBE8QgrEfJOoq/D2lll
 bZ5a2ObFKRBBUgHxDHRPpUQYt9EHJ7ZtgcZ/U5ErWZVbwa9Sn1nfYaD2RcckfJNx0GNXdNNRDWN
 EkfJY1HAd8toTigFIoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-03_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605030183
X-Rspamd-Queue-Id: 2D8E74B6645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105609-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Some interconnect devices described in the binding have children and
some have clocks.  The devices which do not have them, should have this
restricted (disallowed).

qcom,sm6115-cnoc has a clock, thus also extend the example to be
complete for this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,sm6115.yaml    | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
index 67c1705af50f..cdae0acf3a1d 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
@@ -62,23 +62,33 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,sm6115-cnoc
+          const: qcom,sm6115-bimc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+      patternProperties:
+        '^interconnect-[a-z0-9]+$': false
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm6115-cnoc
     then:
       properties:
         clocks:
           items:
             - description: USB-NoC AXI clock
-
         clock-names:
           items:
             - const: usb_axi
+      patternProperties:
+        '^interconnect-[a-z0-9]+$': false
 
   - if:
       properties:
         compatible:
           const: qcom,sm6115-snoc
-
     then:
       properties:
         clocks:
@@ -87,7 +97,6 @@ allOf:
             - description: UFS-NoC AXI clock.
             - description: USB-NoC AXI clock.
             - description: IPA clock.
-
         clock-names:
           items:
             - const: cpu_axi
@@ -135,4 +144,6 @@ examples:
         compatible = "qcom,sm6115-cnoc";
         reg = <0x01900000 0x8200>;
         #interconnect-cells = <1>;
+        clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>;
+        clock-names = "usb_axi";
     };
-- 
2.51.0


