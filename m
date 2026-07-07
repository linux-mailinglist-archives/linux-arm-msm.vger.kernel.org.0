Return-Path: <linux-arm-msm+bounces-117176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NrdcMXizTGqLoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:06:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD26718E10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:06:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hva6BdC7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q8p9yI66;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45E8530788FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFC129B78F;
	Tue,  7 Jul 2026 08:02:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDC62C15A0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:02:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411364; cv=none; b=cSy+j0bSdDiy9tHDXKJA6FzffRVSma5eV+xhGwf5XLB3Xqrx9KGLb9UlBr6bYncPW13MAsprOWMDTP4rnodp7PLyuAMrjEL5bCv3E1uT9TeYOxyI4x7xulHvIdwkhY7h1R6IXHzryGOtFvmkEDLMV3Y++GKrnBqU7K+MKW9QJRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411364; c=relaxed/simple;
	bh=05mTt3WzwqVURtsexFxJaoPg02cIOnA+8A1NAYyBuZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCopEgGttuFdCuoEhq0ur2HfOOYjW7g626VYkmW8IGYQV70tPLAdboDtMMXlhjNMnBUyjTXz87HkMYPDe2GLE4OFq0K6PKB4ydfvj2kHSCwf0JRF7F1EJLaPkYmyZ75zwiJbuT/Z8R84wJAEIlCXeYQ8XvNjh55wsuUCSrzuOUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hva6BdC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8p9yI66; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6677BJGu2935703
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+kTw63aCltmhjLTw8lsJ8qVfHy0eXwaijmW
	Z0RC0Bws=; b=Hva6BdC7JkOfqsmoY4tQtnZaR8mVlqD5DiprI5O2mYsVi+i3bp+
	EWwRgSSK3SnoJkbd8X82/WwIH6ZA+CjpkQsRgGKzOPVO8cQnzDyl/OktVodQkW75
	rrTAi+uFuq5uhqZ7ZKNvP7SQAYKGZk0wVSDToONy8GyHbbL+6rEFhkJCYppqEVah
	Uw6M9gwYia4QCu0c14JEsgTNjnUr5YfIlEtC0546wjxNmYD7+Gm0hG7HkGrWxHiH
	HLjOULIPyHuy7sK6hDOdUu8M12Zf7ri2Ta41cRlhqW48mCxyXNdNL90bprjUI9U2
	Ivns1aUujaQx8+vB3/EFVK4SR3NCCZWuIrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun06a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:02:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so4790855b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411360; x=1784016160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kTw63aCltmhjLTw8lsJ8qVfHy0eXwaijmWZ0RC0Bws=;
        b=Q8p9yI663aotuSB2RgMUOzidUGnLZidXnoL7j/FLM8rEXd07M5PWvFbc+plo9XNd57
         PHVf8V4wCHr0jdr2K1w+VwZNwsQlj+05j5oUcZrVvBK4f4oU3TXhMXMtXvmm+Qg2claz
         gXraS+2yRNVvpg7soOOgiVW7urdrh2p6vc9F7PtYXzYuwzmafdex5u7Pp+KL0SNaaTHO
         RXc0E1KPP6CNkzYk3r1Q5kkxo1UfvHqCQGfuSnR6XBE7zjl+9/qrqV3dGE2euyI0ulO3
         4KdGprrZvK2+YcgoH0rwiQzI2yj/Yq8Q5TjemRuYDBiK2xwqYFTQLvO2/cByPk0wz5xY
         q/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411360; x=1784016160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kTw63aCltmhjLTw8lsJ8qVfHy0eXwaijmWZ0RC0Bws=;
        b=G3rE0L98ikYDrPBikNJMvnRWOilWEORgvdJ+USuxWnQ89E9QkztRE8ncO/xp5aQA53
         SoR5DsmJ92Hs6VhuEcLY1mVtIUQOSXTVxHhVqDCN5xpmybgGaSOWWxNePemwd1Ac2K35
         bPMmIDSWFGZjSIMjg9R4cuPty1r9Ar5ubjcegEF2EeidIbZdb0sLrYvKxIb1rqW+FRFQ
         E+xyQ4OvqM5B/OuPRG/dS1SCMueh/1sFrn+8O/HJhRWFr51924afTslHiCUOM1BYsgyo
         I84YYsZ1AzBpBReKc51GTdf45V8ylotzMPx5gRELpILpxPZNiyoTUC6vl312TXZimtKl
         qY4A==
X-Forwarded-Encrypted: i=1; AHgh+RofaLY+qUgyl65Pcdl20EH+kd+Br81ju9A124+P0c7u1X9d0B89b0zluVLEBDSMq/bd2v6wz/f3oFwRUq/y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1XJAAEtFPTm7RYQJm7RqUAtEob6su+oDdkJAXP2Zo7gfojTrr
	1L0mTlmljc4pnbzO06YbkuVekP4y/zNPbVQf80wyLTrb84fy8OLnhAbWXjq7VcTY22cgMpronqN
	Gk+7VuVWr7aUg5hZTTP60sJaHHfxocj1t0bLHOnlUBLbNeQfc9db3gf1JZ8YaycNUHsSS
X-Gm-Gg: AfdE7cld+ly0QTnku35gVgCr+awJi/bdJB7VsfF3U65PYV2aDiXrTdiFLi96tp8nx0l
	p0XJ6m6oc/GcX55Cnu6ksXT4Ljy4f2vopL/rL2n1oFb38iuNTA/cNfldrgDvhn6vs91+T1nYwIj
	pFqUDoKymnK2xe2rj5PgQvLPJyUE4Ee1ehWnS+B2IMtiV7R0xhYhq/ELWoiF58ALz1/FJ+wNqsz
	hJwEeTfenZ2iIhakjm0fyQ1oSK6EfyZrMit9XGXq3LvlHZ96ZnN3RSst3XErS6PFWIYQS+S8Aue
	6oyMFBh63E6iGaxjnW0DvQ7/adOY4qBPEzlpElLHq+k2M0RHjeZ7YDLfvkKjNn7eyzNXAqmN7dn
	gwrpDqBx2lIO/58qzEtsFbYDKQVhyihSRaOtQOsIpwGCEoxGP2jTt/y6sRSaLlKlsBwBkYfs=
X-Received: by 2002:a05:6a00:32ce:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84826d69104mr3873759b3a.26.1783411360043;
        Tue, 07 Jul 2026 01:02:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:32ce:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84826d69104mr3873725b3a.26.1783411359467;
        Tue, 07 Jul 2026 01:02:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm5061005b3a.60.2026.07.07.01.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:02:39 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] Revert "dt-bindings: i2c: Describe SA8255p"
Date: Tue,  7 Jul 2026 16:02:29 +0800
Message-ID: <20260707080229.3795971-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX1++vbF/P85J8
 c8sacroup65KKv+78LWTxRAgXJLL5feTLStmNn2C49ryMwYnQ5X1zTHj/xGUMRqP9qDGA4MHrw6
 k5UFaxuUw0lFygopBWl4ES+cqRSVc5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX77m+hS9Q7Xku
 Eug7PmlswyzbqEHc59xTzS0XXurG1jj5kNLP/c8qviG99GK/IawiZoDr3i4UT5AQUkiUzD9Y548
 XnJD0ZekEc9YvOndS3TxL8OAAZAzedj8TNDxMKnQl7p8dc2F5/8AaxLIP3sU5kiMOfIuTC6c7JE
 d7kAChSFFpzzg89vBUE4aoVFJeur8dH9fYF97t5CL28wGluoGrzm0WONisgpPB6KSx5Bxcf7AJ4
 H8CcDwbCd6yGteNuxwuXq3on8NHg06qE9ZzLnHCsWSXwMXD8RUgOIcNEypseJOQi+yKeRF4EMJg
 +wwzxqHcQNktcEwpQ84B4aawR7nSeP2o/RxnuAPW6u8q8bGoENSonlc+bHZlqTP73+13kpZt2uY
 Qg8yhqspOQKcTwjbYNHoNybKVoch1upzG8Ym27N+JezW+doEXrIIRQSz10eLMlpt03V8Jpm/IaH
 RZdporsUiRPXIjyxrNQ==
X-Proofpoint-GUID: LlinllnQ21GoB6zEKqzyoMZhRvHUYbnf
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cb2a0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=uNDNTEcSI2xEzEqYS60A:9 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: LlinllnQ21GoB6zEKqzyoMZhRvHUYbnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117176-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FD26718E10

This reverts commit fd359c0272bb4078f3a7ef34c1d53ee0deb59900.

Compatible "qcom,sa8255p-geni-i2c" had already been defined by
soc/qcom/qcom,sa8255p-geni-se-qup.yaml. Revert the change to avoid the
same compatible being defined by two bindings.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   | 64 -------------------
 1 file changed, 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
deleted file mode 100644
index a61e40b5cbc1..000000000000
--- a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
+++ /dev/null
@@ -1,64 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SA8255p QUP GENI I2C Controller
-
-maintainers:
-  - Praveen Talari <praveen.talari@oss.qualcomm.com>
-
-properties:
-  compatible:
-    const: qcom,sa8255p-geni-i2c
-
-  reg:
-    maxItems: 1
-
-  dmas:
-    maxItems: 2
-
-  dma-names:
-    items:
-      - const: tx
-      - const: rx
-
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 2
-
-  power-domain-names:
-    items:
-      - const: power
-      - const: perf
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - power-domains
-
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/dma/qcom-gpi.h>
-
-    i2c@a90000 {
-        compatible = "qcom,sa8255p-geni-i2c";
-        reg = <0xa90000 0x4000>;
-        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-        dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
-               <&gpi_dma0 1 0 QCOM_GPI_I2C>;
-        dma-names = "tx", "rx";
-        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
-        power-domain-names = "power", "perf";
-    };
-...
-- 
2.43.0


