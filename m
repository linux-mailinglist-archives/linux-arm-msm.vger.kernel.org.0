Return-Path: <linux-arm-msm+bounces-115768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8l9IB/xGRWrH9woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:57:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E236F00E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:57:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U5qAUNiO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SANYqes8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115768-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115768-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ECD930668F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287D7382385;
	Wed,  1 Jul 2026 16:51:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F0636C9D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:51:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924682; cv=none; b=PZy9VBmdhb5jgkJsX6GW5ofsptX8MfbqaNBr+V7c/Y7g4aHzBJ8uOXbr9+EltzsxZvEoUBNipLQShTdBcRxmiD6BCCTEmE3fRQxOWkLYmMS2I1Jh+40COUo7H4XJxnLtzX2Wx1ASrQQT3FebThWH7/RSM2scc9AwWlJuOAok2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924682; c=relaxed/simple;
	bh=uZZBnjFQ8QcklmPaJuZ4cWwHip4Nj2PHpZ8YA4Jv8jM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmhd5LhI6ljQLGc/Q/kP9ZIe3J4o63JcKk+IlT9AHQje22aitUEiMQ8WjE9NK0eXBiTxik+M5WtcnppyAGzxZTgWVcAuvZNlkERvLZOQteDiPfPOTiKCk3ebDEzQbocfaZqkteUhmfHxXIOuZ0+Xx6LhGEFCG7MSjJ+9u+rsn7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5qAUNiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SANYqes8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmYsB1710568
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xiz5ohHlOSI
	vlO2N/i3IWz8Du228mi1b7RksHuMyzMA=; b=U5qAUNiOMBEzRWP+r2QUfT/pB1B
	NP597bUwZ5AkSjgKoh+3ntuBqUIKAl4VmLJcSlO7Dqtqr+7M5Tul4gmsWzvb4Ay0
	ekwtImmyLNuvV00piF4drsLKQTGl2nu/SlygSADOcyFw22dxvZRCZiyk2nGAVIn5
	kSiYLw99l+oFeVND4lPzHSKaY9w2W5T6ab8ILefDUAUPeI5V3EQxF9ZDmZqTqojb
	IRKWHIsW9UfkR3KAQZPGlULtxJrB6Rfqs0/h4HFNo3IBW6rT1JjufGU2JZLi9ouo
	84XFdjQi6vOL5yjlbLeqaQgYY8Uh+kJwCKXKqnpXTNkYBdIsqJJTIiyItNA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpr2s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:51:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8969083f23so674135a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924680; x=1783529480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiz5ohHlOSIvlO2N/i3IWz8Du228mi1b7RksHuMyzMA=;
        b=SANYqes8BH3KClpyqtGmNrqX2Q+T3cgdjOfJXr+aYRmDepZBSseSlAZL+LXd3H0DpL
         orzAsGZgyZMRKUX0J64YthsIrZ51h7p5dbDVJKIx8Plp/g9eXNhJA7u0pYRejlfbK8hX
         brod+lo1gQRqd35yY4hY9HSuA/9Y9P1glP39UgXg14sIUNGfkNmgaRWLcM5LM8j7azLh
         +zJQUrppC0Lh9Brn8JvSqOPpSwoDkDf5K5vI1/0DI6BFKa+ASgqI6Iq3CeeBdottdgQT
         fle/gdiU6jntDqbFNWtmQLRW4jI7y32lTk6391/TlkS7XYjPoMp8NF3jK0ZTyICUd40L
         iuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924680; x=1783529480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiz5ohHlOSIvlO2N/i3IWz8Du228mi1b7RksHuMyzMA=;
        b=MpvV0Kv46ZM51FDVW4waSByZ2Y4FkqHaiIvJE5iTgK5zivUkdohqWjDA6AvAdFH2ZT
         66+JrWTGu0FjwKRyAYZjFvgDZaE4ts3hdcid//zFFWWwrM3Bbbq6vhRHP/lWoriBawyl
         9BjAiBhBaGB7Z+7WbjOUu5EWRml6AZZ/TLwHdzEtxAEgKyVLYNxSVlOpVSbWFcLWxusG
         Ix5eIqyDezNGVYJ6AgAgCzZUn3QOamumsNWNMzM6t8FnyRa7HMCrC37KqBilpooh/box
         +e17cdqP8J+P4PQqEFP3OQHCRRqOICKeCp/2GROlutn6lyqh9vl7GQd/LutGqH98WAu8
         FNMA==
X-Gm-Message-State: AOJu0YwtFyKAGBgxlauSZmZOfxi45ZIJjyu5q2c/JClhkuhV25y2GWR8
	/lwPN1Cjt4uH0pMexoatbSU8Nzq5WWBMsNYyPUBwQWjBgd369R4/Jr5xJe8n//Ea/KX4aJ3LkKd
	0OBhjz/qugTK2C5gc/3ehzs9R0MlDB461OCt1ndY6smq9d8r6WHCdkhGNSHCo3ULB+1c/
X-Gm-Gg: AfdE7clDRrx6ify+v4b0goBOGTIL7O/q7CVKZZaoOAJen31N2Qc4iqY6y32wLKIKmVQ
	b9+sfhdLPvDMS03qmJ3SK8tmXlPmgGJJ8LXeg/U3hboaQzfIZXV00Z3IVun7il57xOEId3fA/7H
	nHxRP5sMlaWJoJ/4bPyGqwZextzHNCy50hn9iupBxSn46eAgKVSUChRbKMQRxzzmJT9T05G85Sb
	UX6kRxqKKy/bZ8nuyNw2ln9GlQRnR2CUGJatUO7gYLKLJLZ4lPskXj8fn6DbvyCedx8wZEicuYR
	adQMK7eGfdJaIM9PZPB2iDkdGQndtANLdh+cu0ME4S3+Aw3pGYhJqcmSvij/RFc3JILeuo2q4pF
	qMmSpts4GNtiHhFCX9cAfyWDPdIfDOv5diU94wcQfgUzZKZdOFyTHJo9Vdk/aMNmkyALWc6cu0X
	g+rADI
X-Received: by 2002:a05:6a21:4c08:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3bfed3e923amr2445231637.38.1782924680215;
        Wed, 01 Jul 2026 09:51:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c08:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3bfed3e923amr2445193637.38.1782924679776;
        Wed, 01 Jul 2026 09:51:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:19 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
Date: Wed,  1 Jul 2026 22:20:49 +0530
Message-Id: <20260701165051.4122259-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfXykpOCpWKvCah
 ljJ3S7pedt3aZ2YOwylyFOJ8kxOAYPsA4XEUeAFoWHTr2rtxDUBArK6Xezux7QCs77QS/RoiOzn
 koHgWvYRGMeE7NWEFUP14hjEul1IGs4=
X-Proofpoint-GUID: nUZ7cj8lobUimj0N0ptyPPWXj_Y13AxC
X-Proofpoint-ORIG-GUID: nUZ7cj8lobUimj0N0ptyPPWXj_Y13AxC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX27R4Q/Yh5bnr
 OZsGRiq6Obbptqk/zLalCfQXOoXO2mxEL1gKuAYOAAfXXAW790UkHIp7wa5jlFp8Yl4lKB2Je0o
 Dna4RLGjwosmz9+hRoeuRhChAMrRVWC1+rKsHsRCKK09IlbRWqIYpc/DJqQbzDaGOWrdlP4hbiC
 H0EfUzLt6k+Y2Qprw3/k9nCmoOtOtE9ci4wjfSQ+56lKL31s9Hk/jfMAY+YM8lfy9V9b6Whwnop
 Rm4lA/iScITv7KAC6rGV2PboWa5iNR/4HXi+WZMPE3njnofAJ11/Oayq5ND+CJCCbn1VcDayhWQ
 eZT7Vo5Lxj5jJKvI86Zx7/6Y1VFNM497YIbTTCi2yEhYqtxopoKpCw18PEkXTbBHDH4driklGwo
 MIgPo03wFL6z46B2VAlqkuiRnAMBaE26UNZKKzqe49l1CLh6y9EQj2Zghizj7DA0xQrreyVVebO
 xaYJlHuDYLATzzUYt7w==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a454588 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ufZ60yBX7R2ALNXMlhoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115768-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97E236F00E4

Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
3 resets to be programmed before initialising the phy. As per the hardware
documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".

Also, add remote endpoints and orientation switch support for getting
Type-C orientation information.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../phy/qcom,qcs615-qmp-usb3dp-phy.yaml       | 54 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..ae3f0dda3bca 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs615-qmp-usb3-dp-phy
+      - qcom,shikra-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +34,15 @@ properties:
       - const: pipe
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reset-names:
+    minItems: 2
     items:
       - const: phy_phy
       - const: dp_phy
+      - const: phy
 
   vdda-phy-supply: true
 
@@ -63,6 +67,22 @@ properties:
           - description: offset of the PHY mode register
     description: Clamp and PHY mode register present in the TCSR
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -78,6 +98,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 3
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+            - const: phy
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,qcs615-gcc.h>
-- 
2.34.1


