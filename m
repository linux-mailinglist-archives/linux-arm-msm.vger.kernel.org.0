Return-Path: <linux-arm-msm+bounces-90489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNsSD+Aed2ntcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:59:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F3852DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83C4D301C513
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F959316182;
	Mon, 26 Jan 2026 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvG6i0KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXgGiYaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75DC315D52
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413742; cv=none; b=b3db6gc1/SsrWZEkokDqYIICYATwAgFchv/lZxlOeZ5inbr/s61jvN9O20B8212hVIJWHSdLMt9WAyRLwhkL1uDeQg8GSMY2xFrMlHv7dcg5OjRbakTNCzVdngRGjLiw5uwbEtjYa0iIDK0CEItM5Q9najntChKLTyBOhGj9Xew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413742; c=relaxed/simple;
	bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5OxN5AH8dTI8caPbu4iP1rz5DMYAsQJgkQCj2D7MjamzxubcDlF7s2MEJGdDkmwK7NII6ET1ICZXLZoZoUQwCXZi431+VN0w2WqVcxdw28mRf8btaQD7eb2DT4pj00ig3nOtutpEl+SXYHhA6c0KbxZpvZ/5+86NlKpGRyuECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvG6i0KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXgGiYaM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLBsZ3429459
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=JvG6i0KJu000BHx/
	yJ4pRSOGXpc4R3PDb0wcJb9DpXylFMn1TRFMq+UbwF+vDkDaVwUmu0wpye/Nud5R
	a2YeecFgDit2EAjZpQRzJUItgEZ3sP93fIAtNqK1aPgEwHEdgXWNEjLvP7BSxnFJ
	lZSEPgUY9IOrDh+rai265rJCYxTZ8war2AEMMfdzozvtS8vuYjvU+B/skAd2Kp3f
	k5z3JlRLmAKcj9Q0D3uuZ8MxdUSQFmnqOrcDG/uq+wN0DX8yv9uE2kOZrPROg+y1
	mnoG60jfiI/yfr6YjSt0pt2b5rgTPsnvyKRGk5LqwWTNfzevmS65V06JmLKvkPgp
	jS37aA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uus65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so6748738b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 23:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413739; x=1770018539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=FXgGiYaMDiTnJsPPIAVvawuwRxz6AGzLtrdfNHZdkpz06ncif0K+BTyM8QqT52QXVf
         fVDyw0ITObIyg6/YyNysqXO8XAqcBnEyk9a9LbLD19D9KOZjIEIc6t+KsUNY7RImLyQj
         w77722GLB5pyHttC6/O0IvUAMXed989uAkV/Iqpc72zw6jjqAQlMa4o7zu7BLOsPSeYz
         tSNOV0B9czJpCZipdMU5G5RKCvwDuIQ6/vaJ3SiQMLukAk2NsZK45vrM0QInxws9EKhd
         PruUbPJ4z/HnxJRrtrQ+cT7akjFrWjefF//11Rw6OYaX9bQdpi4/pqck9LmuXr9ZuzvR
         seHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413739; x=1770018539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=j5dFR8kDG0ZkOagyeVS65PYESz3HGFrBRSEg8IqqVqsAzc9kd/0PRkU3aOXxajaBUN
         zZ0qSi/6poh++u+TDJi8Gae54EXrgJX8e4q45SLHD5LEPmy6FF00NEjBY+eKYCWFxoNC
         7k44il2X1QmVDKiHb5KNYQDpVAWybINJaoEJds5OTtkflqybVQNEDQBic6x1vIunEJfH
         +RNKRnlJpzuLwZnnrpCDNLziwo8Klr5dKhBYyL55GqVLn6ko2DXRVz6kKbgeCCOuL9GF
         rD6dAyq/aQ542LmPuMxK+/rpxSLwb/VHfaRZzXl/vjRIb4UT/RyZ1IjuYTAaomJHrwHU
         vwfA==
X-Forwarded-Encrypted: i=1; AJvYcCVUkZC77Dt/loZe+fbyo9gXsQGxJQQLnd6iIm25G2q0+awO0/eOsqS1Vom0VT/2QjLwyHfKUVcKuxjpFHvE@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWOxMw861wg1lJf/l40XINOachytHJDrvbUYt+p9raLbE9w34
	OM523sdk652z8ql/AUh5KS1JrCTaeh9vVxJJ1/uHhoFIEqJyAwy7jE0aqf01TdC22/W7T47yK1y
	l5/GCjJ/YNp1Es6pqFihwS3fjb7+f5LQGPK/MIfn2ZwwJygJnDriBeULdf10w2kXU7s4X
X-Gm-Gg: AZuq6aKOmVGa76Iq4JVHL39JAJ4wv3E+mqLJvLE2SQk1rHys9UepKsle5qPKFdQ0OFj
	VmrtjFwvAFSNj9mxg/wujxLxNBR61/8YLhrtpewJd1TcOQQy5oYzbVd2edBhGLC0FUr392SzZB2
	QdRsuyJRhNUl5kFWw7RAz9QxKaKtmkw/QrFYHKZtSHjkCDUe7dseodwzcpWvvYxCnbg8xl49DDt
	75wgja5bCxfzm3fUtDDthkKOU/tpHfAvtXvKdsLu2V5M+D+iUFe6JbjoslAgKoMI568/zuhOJuC
	UoYYPIraIfaDzTA57uJiDIWopmPds2u5gXgZZ1lgfE1+L93A8aHlUgc1dRPsQOUXqggi8OKLgh6
	PXA0HG3VxIhvsXApKfzY9x9TIRm1XE+cA+sZCr6uVkoRY5GqQkSiXoxPY1ClKly8bagaCOj0EwL
	tC
X-Received: by 2002:a05:6a00:2294:b0:81f:4566:cce6 with SMTP id d2e1a72fcca58-8234121c8e5mr3573566b3a.28.1769413739261;
        Sun, 25 Jan 2026 23:48:59 -0800 (PST)
X-Received: by 2002:a05:6a00:2294:b0:81f:4566:cce6 with SMTP id d2e1a72fcca58-8234121c8e5mr3573535b3a.28.1769413738792;
        Sun, 25 Jan 2026 23:48:58 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:58 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:57 +0800
Subject: [PATCH v11 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-5-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413706; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
 b=CwJwXgXX7zGGBu6bOdUjbp0ej8SuneGsyvWe7mye7VP9EezB/SML38TmlJ9XLKhPIjJm4m9om
 rpFo04y2Zv7CFR1BoUf8tb60tXJFaMNUOZS8w2ILqThhNhX1QRTID2/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX6wCdl6eIpgCc
 QjE99EHIj9xdtgLJrfNKsiKE3moy3PMYERfPqaD//ct4aWxH6LDu/1X9WJ5VIJdzthp1PLBo9BS
 ERd1WoBk3Cf0O/P4VvS3jxh1x8CqnjNXDe//a8+em63SyujZ+y9t+yMRyw/wFZAA6k45x8szKCS
 y5JHiPNh8/8GMHbZLDHMg71PNxrbK/CouXAhhCvu3W+5mLviULfq/qAxJTJNIJfQ0WdH9kC26JC
 oxGE1lkzA/HvmehDdi2I6JrOGiEPNoT9K5mh4tJeT+a9FaHAnGrZlUoUsk+wWkrLDDqpg1hFreX
 R4oLFrAX+ZjXWeRkV6ImhNS7rSic3ugkWa6gv94YExpnxdYLbQ6YgWbB3gMcSdk2q1b1Br1Cnwy
 Z+iQQ/RLsd2tNU34oc9nwxfb+iX0HdTS76+7fY9CbnHt45Qa9h8Rtkwz2t9C9Ftd3TYlQBFCtii
 bgTIUlq+5p38VrrUrBA==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69771c6b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Dt5ilFQTZeaDK8-X6PtycDDG-xxtT_FD
X-Proofpoint-GUID: Dt5ilFQTZeaDK8-X6PtycDDG-xxtT_FD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90489-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.15.70.40:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 481F3852DD
X-Rspamd-Action: no action

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..ac27a8b89085 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -60,6 +65,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +74,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


