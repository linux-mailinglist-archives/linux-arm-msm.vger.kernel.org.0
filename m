Return-Path: <linux-arm-msm+bounces-106669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD0TAOfL/Wk9jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:41:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0774F5E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D3FC3016245
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E883B27EF;
	Fri,  8 May 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNyOayMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fshGi+zx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E7388E46
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240476; cv=none; b=oY1+bVY3/9b2S0S9g3M8kYxpZJ7H4d51X7Tg3SbawK6H77Y4UASE9x12I7Gy3lSUVVup93hbO8CFVkibB65OWsAIH28jj/5e17gHtQIwype2dVW4XJcQU/kW2pxcfaQLw9UixnSsy6zUlU2X6702XEX8TFZgkvO5ZqaSBd7O2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240476; c=relaxed/simple;
	bh=UpO0rU0mi9erTIQVebp4pdEk7Xnc5TEa+Cg/sUI09nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQsGPQES1EyD0bzWc0gmajCM8ZM2BdYbpi5T2gwpUrGqdJJh4ak2IusppGiiH6c9IEvZeFCjdx2lPmjfhjrpqs2mUX5eDSXM6Hb7yvddaH2WyYxzpXDhOf76dqPUpWu/NR++Xr80cSbkszolq+yg27in5mASgGIA7OSwX3lP72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNyOayMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fshGi+zx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489iHDc2770840
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=; b=FNyOayMQZgekDSWV
	wwu553aUT2EqbAY+oCGT9hGUfsG1DdscEMmYi/ew6eTYyRF9kEiHGev+XaUfYxwc
	9mZXX6ICNv8w+crVOl3XUK2WIw4rZhEcSe02aCLdbdeTQ6BHp8D3pJcUCMWRgtP1
	UIuXmEoKk856ccQtD9SeT6FsRoO7I0i5zA5Y50IqDh40Cmo/3YY9eaDkZDToOL7I
	7yES11RmInFD4u58t06y49/i59R4ch8JqIubO1Wh9KY62EfJ1OCxLBpzLEeQqhGu
	0X7VwUtxmMNSkSBWkrrFuaHNSkTHzQnn+jQjZaas3JD6TX3spymmAWDN17K85uB+
	B8DX0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kh64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:41:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ee1a909037so382738885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240474; x=1778845274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=fshGi+zxVthPFkpbvZCsTGiiYEMiRV9I2ngXeAFu6dSbbY5a8MrkaZkWsjTEiZIkiD
         BYkh5kJLdIUqDoOf8WzMTwIYWnW8K3Qv3QUbWnK5qjfPL4Xx5WqQyKcoZLAAxhClcuqa
         Tp6P/kd06jyOnLw0RO8Va4Me4ecQWsYFbu8YVEBmx3cXwUpoCNB+SkDRfd/i6rnCNV6e
         2vIEjtDH6QEPIaZ8QiU5/O1FAw+KAE2vWA5zRbySySEOq2+a7evL1LEicPopxeTu3hX8
         ngKKuBAueTyVq3g9pksebe0mm/kP1kbxs1lP8/7SOJgAroFTFS6Mx526T4gDudtawsRy
         4daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240474; x=1778845274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=OuYvuFCbklsERfXOHb+16iHKXJwttVMQIsTHteOP68IeXXFKsYXIY9XkjdMj2WAkHi
         v/0Xg9pyII0nz+JArqg2FlppeqOQFacmgpowOXIXjjZEqW27KJ+7nQzEuNLtqpFwZTZz
         dIEHhnbD1RkWq4bkW1oYJNRlazpDQOcmajTCM/xxNqxCC5fdLGLyNrqNPOEIVDumaA/m
         IFrdHVNbNao7WROAJU2jR4q7+PbFiSJl1PCSCx6M5oVFabkG8nifnhBZKTF5ooJP7ETl
         Twbt4NgXylZ//DzrmtZ2LCjiE6ZWMVjqWcKtN84j5BbaZ8bOslMN7HBkoAld160Aq3g9
         nQ1Q==
X-Gm-Message-State: AOJu0YwjLCoUsC9Yjo6VObYquxfPaDb1OL66JLEfgKjRi+8JcNxRV2eP
	Pf9rGLN0PvjnhdACU2GNWByU/uO2Kloz2F03L15nEJfWvov0jbIp7jHR9ClIikIi+zCzT+CugWl
	8nNW0gPT5aN8wzTPW6NjsoyufLEk1qGtr8uWLbdUkZGjPVX1EAkcVJYwc+10r2LKcdmcb
X-Gm-Gg: AeBDievxTYz8nqL9Z6XtYV80d5AWyhUC55akauk2TzHoGt2szyIu0mFH4l7BR4o1qHb
	bCLYMOexysTn1YWZtJCCcqo+qAyUCr+8vVNsJDpMV/9HaUwAsRHX4eekABu1s9hrcop1X7iqVzg
	FxdrByIeRDwWujU+n0iurve/0wy+tTAWe7gw7dRSGj+4456p/tKIZ5NS3FFQwkgm20Lj321D1gR
	CHPhob9vOLPZHil37Jvld8PcBOd1GZQvrDT0lT+gWjuphKvT1hbrV9UCptRUzFnglwkDxjhOiXx
	HhMdALQdwyC/+QN4Cg6RCgc0ODyWpyPLT/mO3XGlrzLYxVM6SFLMhIdQvD15N2zCO9ZFCEGEUty
	S5ai158Gec/oB7bMB0S0WB8SZL7551SBwl4siZD5xEwSdBgAMuihdSolHZhNvR2XkPrxxQljJ5E
	+RFC26t70nlMxh
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301029485a.55.1778240473862;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301023985a.55.1778240473393;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:12 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:58 +0800
Subject: [PATCH v2 2/7] dt-bindings: media: qcom: x1e80100-camss: drop src
 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1837;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UpO0rU0mi9erTIQVebp4pdEk7Xnc5TEa+Cg/sUI09nw=;
 b=1N5m7IXU4vcqQJsxsnYsp0BMpMjLjRx9B4fnHZosjGScLcw5C0SgfrQ/U1KxDULZ1OQulzVc8
 1guV2e05li3BYyqi9EsJrtel3LOtrNg7iR+Lh3fDZ3JiPLyMK1MR64f
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdcbda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5wa7HSqufaon_BCSTwQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lpt5L7xrEZvZNKPmeD6vuRyp2O-Hdhb8
X-Proofpoint-ORIG-GUID: lpt5L7xrEZvZNKPmeD6vuRyp2O-Hdhb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX/Q90SO4DcGRM
 qVZ4JCKdl3eDYr1YhrjfAQgKKEyyTGpTTohDzy6cXLBYyyKFd4cqCJPOKqV7Dac7f5igr7hFfjp
 IwlAe19Nrcs0bpsqiKfVe2yh9Y0BAM90d+ArI/DEX+IrliExDhxqI2nHK11sHKXoa/PmVvvkeED
 /fKoBjxq5eK8UHgNcsY6hqfZqV/I5rsw9C+jS2+cZ9f8XXqUZlvcltbXWo42j23T9ydqYDqG+kz
 gS9wPy1JS6UIaHUiwmD0C7R8bU3cdRsfK5xXZvbgd8UtDvYwsGFLNK4rQz0yOs70FH2XTBuXMSG
 edJAOziYI1He8TuyMPFqGydGryqKWJ3yT1vnlM2L1aOkPt2jfdBrIZFTEO0Iff3P5rYFn5yFBK+
 igxlWAqPZ3TGp+Qs9sUePKQYa6h7w3z+uvj/JD0dn68kPhbbvt7T+6iTr8sXcr7g6JxO+PjzJ7F
 awlChHxonl5lTVQTglQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: 6D0774F5E0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106669-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

The src clocks are always-on parent clocks and do not need to be
explicitly listed for CAMSS consumers. Drop cphy rx src clk.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028811c9efbb1443144ff4f264fcad..afb659b6105f018214a5eaac4dea7fd51c0d42bc 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -40,7 +40,7 @@ properties:
       - const: vfe_lite1
 
   clocks:
-    maxItems: 29
+    maxItems: 28
 
   clock-names:
     items:
@@ -52,7 +52,6 @@ properties:
       - const: cpas_vfe0
       - const: cpas_vfe1
       - const: cpas_vfe_lite
-      - const: cphy_rx_clk_src
       - const: csid
       - const: csid_csiphy_rx
       - const: csiphy0
@@ -252,7 +251,6 @@ examples:
                      <&camcc CAM_CC_CPAS_IFE_0_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_1_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
-                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
                      <&camcc CAM_CC_CSID_CLK>,
                      <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
                      <&camcc CAM_CC_CSIPHY0_CLK>,
@@ -282,7 +280,6 @@ examples:
                           "cpas_vfe0",
                           "cpas_vfe1",
                           "cpas_vfe_lite",
-                          "cphy_rx_clk_src",
                           "csid",
                           "csid_csiphy_rx",
                           "csiphy0",

-- 
2.34.1


