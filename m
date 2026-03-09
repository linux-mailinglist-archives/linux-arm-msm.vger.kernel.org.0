Return-Path: <linux-arm-msm+bounces-96353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIf4Nb4ur2lzPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:34:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A28240DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 621983064F0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13F336BCE4;
	Mon,  9 Mar 2026 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjPS25cO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RuYzwSFL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8898F3630A7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088423; cv=none; b=P8dQ+3WMGgI0WLxzhd3N83Ycayjh6KwGza+CTJK8V+Iptq5unRd5iBHDvc797QqCOoBY0lR/Sz1/yenmL7e3+0H3jSAk5c2Hv+gD/CtM0mvOPy3sjM7e1WuKAy2QQfF2QTgBYBa/uB0SpT8B5QbZGd1RVN8jI+pCJ9koxGUkcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088423; c=relaxed/simple;
	bh=aCDVTUxh9JogQ1hy2Lkd6pHJ7gHWpePVPTc1pZmzoL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MnThBEgTsqqMTBTu/I18dgLS2ZtV3ZggBbBWiO01EHMu9kkqKFB0qb0e+miwNJ/FwNmcfSrsX8SWtS5cwM2nXOAn0pEWf4fHw/jbinawpCojPPhrZCKqq0ZA/Txx5qtAwns4UJdQTHYcnivErpg4ssB+PxOQ8J1sXHtDuGnJY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjPS25cO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RuYzwSFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBqIi3148234
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pn8uTGxSK3j
	IfZEqYoCdq5gvAWFHg5kvAAHa3xK37G4=; b=JjPS25cOSsYrrBx669DzL7wnJ+B
	b6xgQ7WlB+CRk7mwwuD6Gh+rdyA8kES0OHsC9w5w2yylFlvkx5UbAACtq03KBSZI
	nG7gev9sAjeZ+BeYrkz7xwyoThpVWTJqSR3NArHypAdgmsKdADETEe8NPpOCFnn7
	de8qP9vXvudVzJ3PeRkjpnnzltH/1Eo7y7zr9WkdrIAIjz3de0UmDzSKHnsRJviG
	lS6ebhndz6gHzlpCMCMZ27sm9ZNu5/UTX7j615wy1hk2NJs+XAsCuo0+BWwa07uD
	+z3pD4vJqBEqJnKZ0zSqBIZZLkrHhJj1dF3oUGPCCT4JLZBy2DuAEZlxyLQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ua1gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:33:41 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4d4db1523so54438051a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088421; x=1773693221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn8uTGxSK3jIfZEqYoCdq5gvAWFHg5kvAAHa3xK37G4=;
        b=RuYzwSFLLXslJM+h4FuYjzMA3AHUQOTFL+/UZysAIqgQeTEjYZuvQ7qcfp2aHkT806
         KGIhBa9b+C4YPoup/KOycywGhSSR9i1djtPa7ZVi1tF3OBXr1xLGmrFa7IL4qjpAJQAb
         10+DGW+Kqbw5oOxaLyMVII/76xdgmzIyVF2/zhavz8EZ6FoGyzONBxvbXy9s6O1bpPh0
         1hg9mCFwpaaX1In+rCyM/FJu4LVKEWTVCdpbKxhnCF5NrjU+OYAJOzbRh0g+nC6kCjz7
         PwyzVYy4CURWtdIUQcUhJQZVZmp5FNJqMjb2gxvyBiSNMlDiIe5vdxfAovlP1N6yv5bk
         Ic9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088421; x=1773693221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pn8uTGxSK3jIfZEqYoCdq5gvAWFHg5kvAAHa3xK37G4=;
        b=KAbeJWfm6TOczEkg7WL/W/Gsi5ObXQtr6ohsuMmbBKDxCjFY7wAYNl3Pt6ZglA0JWw
         VNiuK7IttsENdg8F/z07zYGkUJMT++Bb6HCdUrZRNqbYrqAutwrkt7xDsa7mkJxQUAOn
         eSv2btdZ2n1uGIkF6aihR8EiMHivdIRNxi6enYDahW2FHWCgVandHiADXiW03oCSejnl
         piKXgTNJLzsIn01+qt0fJGKbZwbbLQ0w0lkJ8u/S8vzNPs156G3+6EnFoCOVeLfuXm75
         tAm9tMBr1CrC998Swz/3NXBNs+81kyqE58PHjB8eB2QdDBmKv346P7DvzWtiEufoJo5s
         sh/A==
X-Gm-Message-State: AOJu0Yx/Sgt3tValeg2H3BMws547ZCACJFrTeS+xig4ZtRz4/+LZXqjp
	r9qfJetFE5gPhVg/xg9ffbBUOsH1Wl/HyIJaX2ZMJe0OjWgMSFE9pc65GXMCixug4IOYG4LwqpP
	BGhQ0pXci1lqzJ2Ilazr6YZOmMZnEJVfM/9QVxl2E86kY4hEKC8pcLIF6sIiIfm1bZc20
X-Gm-Gg: ATEYQzwRW1J+Ov37EecmO1p/+p71SXExi19RsKMsKT0xyGC4xCGqk6XgDoJJ1UAnQfX
	XrHWRwshE5TcNPmB5yTTR63oRc74zfDMtKZmnmYYeJL/VUHE4Z0WCFDuKjg98mD3UwD9aKLtrv3
	NNu36ObgGm9KdXiDmB/qAgqcXEYciT47qtwB7D+IwbK/Xh3Q68b2iU1QPqbl/q9MzoqXWSMVt0Q
	a6jwwjvOpNbNSL1HRM4LBZdcNG0RtetcVCXP+AWckEdME3saoSdoX7whs/J5epDuRk3Cx4wCnxQ
	ho59ouajj6Jie07i6PYHwXRyllRM2fl8KSYkNgB5dxa8Yj1kIB6KGdsUnk/Sy7wDAgJOl493sE4
	BWmeD2lEhPYy2eDJNMhc8S29GiJ6pJoN9Z4AfR0JZmr4Pe3WpU+Oo0jq4h97SMWrAJ5OwcheDkl
	g=
X-Received: by 2002:a05:6830:6001:b0:7cf:db31:1b7d with SMTP id 46e09a7af769-7d726e75a8dmr7897580a34.5.1773088420576;
        Mon, 09 Mar 2026 13:33:40 -0700 (PDT)
X-Received: by 2002:a05:6830:6001:b0:7cf:db31:1b7d with SMTP id 46e09a7af769-7d726e75a8dmr7897560a34.5.1773088420207;
        Mon, 09 Mar 2026 13:33:40 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:39 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 01/10] dt-bindings: soc: qcom: eud: Add support for dual-port configuration
Date: Mon,  9 Mar 2026 13:33:28 -0700
Message-Id: <20260309203337.803986-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ukFvsOPAkYfyT2Z4W-T4wIO_D3JTbi7m
X-Proofpoint-ORIG-GUID: ukFvsOPAkYfyT2Z4W-T4wIO_D3JTbi7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX1mrF+E4HYz1d
 2NI4BHrP4WvlzSP5q77k6ZLbXLu50bS7JmtnCH6Mc3bASjFDBl95jeLwn81QV/+haBa0uf+uwVK
 p5tPi78/o4YJmN8uhh0DqsgweHaeVomxQDqkqinw6U1hJMp7k7iQ+KlCZc7QLVNu4XcU8dhzvQm
 1qHUXOUCAUGhcHuhu0PgLYZWkt3B8vJ4J9aOn8ogWYQqkH+Csvn6tGP8PvJvWagOrRMV0Dh+jBD
 UvOt8YBaz5kGNFlk1aB8kgwzsBY6Q+WXowsV33jtzUGw1JWxcrgkWRyIIfyQHlbs4a3ajZnLnt6
 dur3w5HS0laAjmcDsoaBY2jswXUYcDBDkRhg79rVs6CBR/BDjvPoYb7Mc4dG7ybHymx4pj+jUAN
 ea8zQqUNIm2Y880g4CihplY8rzTLQNOW1sNrGxeQkQ+3xSC/m1jtorvJTFLrx8flRHcQovs4ATe
 USU+6LGxQsq6mdB2GYw==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af2ea5 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=COdb67ocejTnp4Lj0MIA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 42A28240DA2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96353-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.3:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

EUD hardware supports debugging on up to two USB ports depending on the
SoC configuration. Debugging can be selected on either the primary or
secondary USB port as controlled by the EUD_PORT_SELECT register.

Extend the binding to support dual-port configurations by adding port@2
and port@3 for secondary USB controller and Type-C connector connections.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..af89b9e0be6f 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -32,18 +32,27 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
-      These ports is to be attached to the endpoint of the DWC3 controller node
-      and type C connector node. The controller has the "usb-role-switch"
-      property.
+      These ports attach to endpoints of DWC3 controller nodes and Type-C
+      connector nodes. The controller has the "usb-role-switch" property.
+      EUD supports up to 2 USB ports. For single-port configurations, use
+      port@0 and port@1. For dual-port configurations, use all four ports.
 
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the DWC3 controller.
+        description: This port is to be attached to the primary DWC3 controller.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the type C connector.
+        description: This port is to be attached to the primary Type-C connector.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: This port is to be attached to the secondary DWC3 controller.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: This port is to be attached to the secondary Type-C connector.
 
 required:
   - compatible
-- 
2.34.1

