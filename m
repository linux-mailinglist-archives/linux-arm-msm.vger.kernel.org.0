Return-Path: <linux-arm-msm+bounces-119014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U/MVNPkmVmqq0AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CBE7544E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:09:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aGTXvnxz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NG0TyM32;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119014-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119014-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1B453069737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DC839099B;
	Tue, 14 Jul 2026 12:02:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0C538F23D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:02:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030558; cv=none; b=d7s28JPJb506I/eh2Ud+XXR3wK01UizqDi4SUtDVRcGl/reQ8gVed18DEZ4fQYpbxjptsRkL2n//HfPtAV92u5wb5tUM9Re8OZ71JID0dwaaD/mVD40RcaBH2jfF/lNIt+LqXIMrF0f936a5mDT8QLZIMEgd1fydxxf7pcs+BwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030558; c=relaxed/simple;
	bh=mT/J0p1jnX+6QgzShInZ//DKc6SSmtQWVaUr9yNBCa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvB6Qna4LnCy5v8i0U9q3JWK8L0izZKM/+QswMhOMeC4VgQiu7OGuPyFNggK8TKI0NHXlfSrIn9+hK8n8dJAS6VPOWA5LxnBt3d/nn3AE2Cx4UqENM+nCkZmA4Lb9BMrnT7sqHeYCUMk+Sm5McY8r+Jit5qJtakX0ieACNTHfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGTXvnxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG0TyM32; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNjq1494330
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ax64JMF/5Cw5Bh6xQ4LCelirXb5p1wD9gT9
	SFhvRP34=; b=aGTXvnxzp/94nMoX4LiO4gxc94wG3FxlGOugHAFXmNO08Thja62
	auVAWVIARCH367TWQunC9IexljHN3KaiCxUpdJthqacy7enPMWpIB/+iA6n5MuJt
	R8vHN1jH/7Ild+UJUyZ7KIH2fEe9yA4gnjKC+bBhmvOdzVKNsjXwF4MPb3H7lfsd
	DmJ3t1Psd1CtIOhHZh5L2NBsY+w2BoKfYN9h5ZoOYCFXbru9C5UJDwi/35Eqk0nM
	wFgxxusCZ4dscSt32lpEz8mkY/t+jdSLIlp5/6NxbCkr+eaZT+hYsiqDMH/n2/8/
	LeVKTj8PCIbRo24CkHuz8mZuN1GzxvCvnFQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cujgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:02:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380b630c505so5110953a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030554; x=1784635354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ax64JMF/5Cw5Bh6xQ4LCelirXb5p1wD9gT9SFhvRP34=;
        b=NG0TyM32LnLGByxB3ntpYz2KS2Ur16DUzqGGVsxarCwa9cUW7LwdvlHws4zJX3cXpH
         rLsGtNFXCJf5b3HUX69GbOt0USlZREDeB2IKB7lB/MqaJbgBqTRInj7N/Y/9+VjOwowI
         iOqxVPcBP1csd2Ic0MOefbK4BKoEHnoMqpQNQPlBVlZmJq4FXo57O6d4HVx/E/REt/6P
         kZe/6QgzYUPHHT2KOfj34wsIJ52xpWKFok/bVf7GDhKj4qI+jdarX0kTIRPM5MBfopsM
         KFzhA2+LLJiQVv7oDL5vNcwvbiQrPVtK2kerAgwB73/CFUoQZROybF1B9BNiyE13P4bd
         h2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030554; x=1784635354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax64JMF/5Cw5Bh6xQ4LCelirXb5p1wD9gT9SFhvRP34=;
        b=j3DJs8jPBjeOIp+1NeUBIAbS/JK9OIeS7untQ+7VKMfJ1Wd3FaVXpVW1MNr70FD5sz
         FyndXt/F8WcvXnFvpU8LZ5A84GYWto7mBjnKP2O4p1jAXX721KikQ04MKmuP7LgS6LET
         2Y1E5VM5E2bxHLoBZqjfN6xIx7nzRLgCQBWcpDg9bEym/yXzIyNjzcXfn6o29qRlkr9o
         kE+w07He/4bxxKjLedm4cyFE3oYBGDnj4nvgVQWFLBjCj1zYtq4oXWEjXfR1Hc9cCFxO
         Jszk1wyXVK5GCeJLIL5ZlqC/WvUJO68SJCHxA/OmVlOT/aA/4v7UPDQLDdI1TCT+WDSR
         SmZg==
X-Forwarded-Encrypted: i=1; AHgh+RrrvwNE9HCuxN7RoLhJnVCaUYNaqRJPu3cr5NPxTVwICF8CivJ3Kb86rBaT+IWZU/Zq5C8PeaJz1ZfWMaHu@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwDGREUCENrCfp4paoMqsAdJrjMo1IQQD9iHiOF6ziS3FhuNY
	pp1Te4rPinx0f5HFfrC/kdwSwS3p9E1QjUpOdhCFz0NJFZdGNOdkknJ+BO4fQYkx//dehwk69LB
	J8BzgyjReEGz8PaQ2IC7UPpIkYi8ooW/QDJHc2ToGGdcekYG/Zb3JZbmLs+BJwqH92EcY
X-Gm-Gg: AfdE7cmAGB27Ca5CKtuNGX3S0OfWbPfVOKIBjQeG7zs8vaB+oK30hB47QbmH1/pRw+X
	2/ONFvG4KNgn33/8sZrjW/IO1xS+5+bklcHxIC18L+lqcoPg+1+TrgmTWPX0dV2xrKAfzvhfvOr
	VO6e/oYwX4J4KgsxsqM1gw12EUDUTmvtklrV2A0aQFmlwXq5fGRfU72jVYF5uY/CtSx8eIcIHe9
	7FE8tglviDpTiGVT9CjcsqCu858AJihj/dmtNb8bHT+pVXQM4/wLVI5Yuc9uvsKPKbLmAbqVxn5
	VRMQu2MmJ+OPcu2xneNrMB3ggeIXa2WkUIybBY0lsFnIqx4wMen9tlXlm8373soXcRMU2G/KPXI
	O7EmT0PtL1W4BadH05bqcOaGjBwgRwYxAfJhvjWVJeR7iMNh0It9mZV2aSU7yMgWPzTkskxM=
X-Received: by 2002:a17:90b:4c46:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-38e1add8ad5mr2222602a91.5.1784030554168;
        Tue, 14 Jul 2026 05:02:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4c46:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-38e1add8ad5mr2222572a91.5.1784030553669;
        Tue, 14 Jul 2026 05:02:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm54484812eec.12.2026.07.14.05.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:02:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] spi: dt-bindings: qcom,sa8255p-geni-spi: Add compatible for Nord SA8797P
Date: Tue, 14 Jul 2026 20:02:26 +0800
Message-ID: <20260714120226.1788391-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a71IPEI5IE3L9YChl2IOqTEECNEFsdI2
X-Proofpoint-ORIG-GUID: a71IPEI5IE3L9YChl2IOqTEECNEFsdI2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfX6YdDDDT8fA3H
 gBmJGI/VSOVAkAsGyEZqHbsr78XLsgc70XEjjK6flSp6FSzsfN7qhbZ7ocV8Xqm0J0nT6CKKjvJ
 tFurfQ5inn5W6FN4nTR+2lsgL4XdR2U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfXwi8tLHNtPNQ3
 XtO1SPE+riClaU2mArwO9kZQAiU3MplbHSas1IARH60SqdkUt/xTxOQzz+BCgEi2py2wzzsBv6Y
 wbd9z0jUHHWP7RLXrhEQNu4I+4p1/w/VxLmaUXBI/Fd4T+RYnOF+w3VgdkhOZXelglTLRDyBN2B
 dXZcVCkOjHq/p3/ZVCW9EdnHu3hMzZML5WieZNtFbMiq8teuKlWwN9hLe9qahuOrEy+vL5XqV/O
 jSfXYyV9ZAFwOZBqjCy75XxyW4MN4sAUBv65CMkjDqosmcxJufyCeqHKBZWZHthXJ6h1w10GLHM
 CqnUjs4p48WUF4nE+GrXWHmZsEyD7CVOlP0WblsQ9zq145zXGVFLk6NIxq5nQ5rtO0jH0eRLKjO
 CHh5Lp20Pminh0PcgLSplVimVvOb3FJUq9KZRh98sFacbDpDceeeOyE5N4oqZpGRF5lqoHhyHXk
 V+nWfAHn6kp64kkuKQQ==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a56255a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZkAwGN3o1dXtv08uZcAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119014-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-spi@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39CBE7544E3

Document Nord SA8797P QUP GENI SPI controller, which is compatible with
SA8255P controller.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
index d9347d780ca4..6552303a4f52 100644
--- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sa8255p-geni-spi
+    oneOf:
+      - const: qcom,sa8255p-geni-spi
+      - items:
+          - const: qcom,sa8797p-geni-spi
+          - const: qcom,sa8255p-geni-spi
 
   reg:
     maxItems: 1
-- 
2.43.0


