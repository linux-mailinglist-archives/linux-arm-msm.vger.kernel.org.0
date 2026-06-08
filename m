Return-Path: <linux-arm-msm+bounces-111868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 63tUL7m1Jmp8bgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:29:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 353026562C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m78D9bQe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YltPyVfN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111868-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111868-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2437B3092D43
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18C437882E;
	Mon,  8 Jun 2026 12:23:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F20378D6B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:23:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921390; cv=none; b=e8f/XPCpmASK+ZdZAdiaX9/sqwnpvTCN6xmzFzNHLFa7ycaB7Wu+jDtxV0QqM16GuleXa7/va1qI+MBXQBqY7/cihH7PcMJ2dZjQI/JHycs1v505zrqp/BrhcgI0pZSfye+YsjdFj98waT2bEmBFuhmI/QPwjrgn5jcvPhRuYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921390; c=relaxed/simple;
	bh=KgWAs6uln74wF6T86ce7PoBVL8SE2Q+p9u3v+P4rhfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bWPlXzIoCPRiSkZ5SZa6m60P2LD6EB2y9Q0ch/oLCnrcHMDb2VVHlEVLWAMmXUHG4Qi9tm06IhRQmhwYpnkDpXyKATSbwhhutk6mL1p0oknZuicUQs3K8i0pJjMmUGJGjdh6d5HnRexUtNO9D1ZB1DQc0P5cgqual5UJXjx3qeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m78D9bQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YltPyVfN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BA0mq2920837
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 12:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=; b=m78D9bQeing/TbET
	5It2VbK2o6oenwmmceGxgcxEsKqJQE1uubWkm3CsLCnhM+0B16LkBZodK82ywIrS
	oLU1h/N/sGNBpalMO2NlMKl9yWlCU8gkZFMbo5pwptwKjYZk//VrBcNGX6aXm25f
	Qj30gMicKwcNldX4vcoMok0f33D8pb+dfONUcaTthsaTcO4+9pcCuMRd789wRMKj
	1utS10vR/yyuNPWX5pj5MaGvsjjdALy5ref/LiN+DcUZG2an5/Bkwsd3vcwD/sRp
	X8DAp0HnOhwskYUSboSN94ut/oXBY/CIMglVNFeTQ0Tvpt3MyjICOmiE1I07lZkb
	1LlPZA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgyhmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 12:23:09 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7efaace4bdcso20235247b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921388; x=1781526188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=;
        b=YltPyVfNrS7ctz/GL8sC9Kp41eNO7AhY1brUEOf0/NIsVnUiTkIvtrZxkY71SThq+1
         y+e4EVzjrWbTwPxTLqmnNNSsWWQW9TJzsfHtOjYrZOhFjDRcvs0URVsba8ULJi0+RKdR
         QLDOoWgT0OTBNYUXnwms+Cw8r87e0DArpLFn3Zpt0wFqs1jFh7WCK0aYpNFMMUi5kqI/
         ZMb74SflTkis35d8yU9LE3WxX+ZpAC8pFSZVopim78tOB+vlubnOBDvwI1F5tkt3XQ0q
         UrzUZL9mSzSlEcxqoH1TtIrz12ASdV+69zVHllw78i2AOW+jDPWLVh8TegYZasPJ/Oby
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921388; x=1781526188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=;
        b=tBD5q2TSw7mT4LoOmx/aO2DYAAxT2fG8o17fi2T7PZ5TJZw/JyOT3oD2nsZWwFAYkA
         dED4BOeVeUfZFM5ypiePU0i0avWmcZm22VLU2HDyh7DsS1rmJMbbrbutl/EN+QJLLiYR
         QxSGOEmIc8ssrOtK9o5AFWekBm3/DVlMHMzU2AH1o5ynQ1RSd/zgaV6yvG12Ud2iW9NM
         4Dx1iRAtaKnpv9+oDBoNenqpae98IO596T5s4yMERTs/yD4IjQ0TjYieQMjxSoU/JX9b
         DqxKO4QbR9sOBkdIin9PCfxpgMtL13kA+gJ0xgZrqK8RREVggimLN3ivstaN4vtbYKk8
         63Sw==
X-Forwarded-Encrypted: i=1; AFNElJ+aEkuvEbps+HCDgQZEA5JK6zT/7dcGYj079SiphKNvGICi1dkSTjciYW1gblHC8w3tgywe9cMRYwKFLsBn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Rmcfusf105AYZmc6NNZyVgYuPO8JWzT3e5vdvo8nB0QztxcY
	FlavJq8QJgC1zTyttzkEsbAWh3htKkFQ5Wg9fZJf45VKZ82SxnddK7TGjOAzip97M72QvC8XBvJ
	fTzYBAjybzuMthw9pDmi/7bbtuSJjUU10L0OSoQFnRDVlUbBOEXzUzQDsu7SCnOcSCe4c
X-Gm-Gg: Acq92OHumZ8+GqHUIN6en9wSbrB2jss5gsz7lPenmiKkJoFw5xN1YdBVQ1tqH9uEQf9
	pTzQmUrCqHOAfsfntEAKTDpcE6upTbGkvunu5aYS3MckaYnTEGzfZT3jEzhu7wVb3H6pjeceUmb
	7Utn5HysAsqA9dU6LG5VGscidNFJ2V3ySbGqbUgaXWT+N4MijxQ0+e4kMZW3BqOhkJbSxsR8sXJ
	hzsHZxsLZUW2tTgg0EjAs3X8NPqOXAgQ0fsA3Gwo1IMauMijPLsNZptnfws+FyG2crT83gPsmqp
	eBmOrRSvPNlt85zFpFK01R5S3wKwpm3j2ujU4l+56bPGd6LCOYkEIJWPAUAxEEZI+fQgp9MEOp2
	HWFhZ9MXI897gZnhR+65/G0vA+kV3914PO1yPxdOPmFcv+MK01A3hxEHA8HrEjtA=
X-Received: by 2002:a05:690c:6e04:b0:7dc:1609:53ae with SMTP id 00721157ae682-7ed0ea5d4e1mr128120357b3.25.1780921388226;
        Mon, 08 Jun 2026 05:23:08 -0700 (PDT)
X-Received: by 2002:a05:690c:6e04:b0:7dc:1609:53ae with SMTP id 00721157ae682-7ed0ea5d4e1mr128119877b3.25.1780921387682;
        Mon, 08 Jun 2026 05:23:07 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:07 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:51:49 +0530
Subject: [PATCH v5 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-1-94cefe092ee3@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26b42d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=59sZcjbcK_zmYAmOVRMA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: WCC39lk3PRFb6uzhFHdFPFkXjtN9-Iih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNyBTYWx0ZWRfX5eq7dQw34Z4A
 pNmiIrwG6uEPDin/TLooihMEGFWkLvZQ5TJkm75k2SOInLjhIUIRtM47QaF1XDHLPEoeURqecEG
 IxB64pj3Q/pv3ur7R421V8H0exNwSn4d8GtrHtxrifkuWo0ViW+woone0d5dYAXbVwj/5OCEAay
 m7Nko90Eml60gLo/D9Hajs9c9jCQuboovBpdY9Krk1IegBthLudTyabGeAoJ4WoknUTqxNbO0c6
 5OjDNP1nApJfM6xGmsnB7UT3Fa4KC2FQf+ItgkiSK4V38195E5NMQFO0scSamUci/edAxHpIURK
 c8gmisFtVCP756tKhWUE4wk6AjRJuKJ3VkDxxPo0tMZJV3CEb1yurNXDjniHzNtUxdn02kWyFcD
 6+JJQza1CgiUUDvOWtVqq3kYYV9jYwcH1uR9UaQeD8OYPNDkyGgEx9b2zK+XEpZV1jCo8PdSFH0
 fXUJJxmO1j4wK4UZ0Bg==
X-Proofpoint-ORIG-GUID: WCC39lk3PRFb6uzhFHdFPFkXjtN9-Iih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111868-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 353026562C2

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.
The Qualcomm Shikra RPMCC has the clocks same as Agatti (QCM2290) RPMCC.
Hence, add support to use the QCM2290 RPMCC compatible as fallback for
Shikra RPMCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      | 65 ++++++++++++----------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..af9fc5b14a8102073f24a2ec4f5c8e79d492a14e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -21,35 +21,41 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,rpmcc-apq8060
-          - qcom,rpmcc-apq8064
-          - qcom,rpmcc-ipq806x
-          - qcom,rpmcc-mdm9607
-          - qcom,rpmcc-msm8226
-          - qcom,rpmcc-msm8660
-          - qcom,rpmcc-msm8909
-          - qcom,rpmcc-msm8916
-          - qcom,rpmcc-msm8917
-          - qcom,rpmcc-msm8936
-          - qcom,rpmcc-msm8937
-          - qcom,rpmcc-msm8940
-          - qcom,rpmcc-msm8953
-          - qcom,rpmcc-msm8974
-          - qcom,rpmcc-msm8976
-          - qcom,rpmcc-msm8992
-          - qcom,rpmcc-msm8994
-          - qcom,rpmcc-msm8996
-          - qcom,rpmcc-msm8998
-          - qcom,rpmcc-qcm2290
-          - qcom,rpmcc-qcs404
-          - qcom,rpmcc-sdm429
-          - qcom,rpmcc-sdm660
-          - qcom,rpmcc-sm6115
-          - qcom,rpmcc-sm6125
-          - qcom,rpmcc-sm6375
-      - const: qcom,rpmcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,rpmcc-apq8060
+              - qcom,rpmcc-apq8064
+              - qcom,rpmcc-ipq806x
+              - qcom,rpmcc-mdm9607
+              - qcom,rpmcc-msm8226
+              - qcom,rpmcc-msm8660
+              - qcom,rpmcc-msm8909
+              - qcom,rpmcc-msm8916
+              - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8936
+              - qcom,rpmcc-msm8937
+              - qcom,rpmcc-msm8940
+              - qcom,rpmcc-msm8953
+              - qcom,rpmcc-msm8974
+              - qcom,rpmcc-msm8976
+              - qcom,rpmcc-msm8992
+              - qcom,rpmcc-msm8994
+              - qcom,rpmcc-msm8996
+              - qcom,rpmcc-msm8998
+              - qcom,rpmcc-qcm2290
+              - qcom,rpmcc-qcs404
+              - qcom,rpmcc-sdm429
+              - qcom,rpmcc-sdm660
+              - qcom,rpmcc-sm6115
+              - qcom,rpmcc-sm6125
+              - qcom,rpmcc-sm6375
+          - const: qcom,rpmcc
+      - items:
+          - enum:
+              - qcom,rpmcc-shikra
+          - const: qcom,rpmcc-qcm2290
+          - const: qcom,rpmcc
 
   '#clock-cells':
     const: 1
@@ -126,6 +132,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1


