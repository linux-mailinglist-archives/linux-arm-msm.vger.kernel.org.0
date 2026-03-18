Return-Path: <linux-arm-msm+bounces-98352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ3sNCNlummHWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:41:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788E2B8388
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D294302758C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8D5386C23;
	Wed, 18 Mar 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqOuuOYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SM8zfLDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFCD386573
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823215; cv=none; b=gzjD6VwFewen6HwHGC7+wPAu8TuHEr+yfeEndSFJGN3d/TmETsE4YwlIvGTok9rKsptiqxGfEKX41s6noTCEighEEq8WsbpvJH4+oGjvSncRgTG1rM42y6PaBKds/IK+1JUu67LfOZgmqy9YmcQq4hcuX97CP168QxImet6/JcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823215; c=relaxed/simple;
	bh=cvQ1+7+KJ61hX2E7lBAYjSXTUx9Z/ZsV1ErUURaTUTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tmvcZgx4/EgHT88ffyJGrJtBhMRPfmIYxKQX0/Rf79Pd92/hz/oiVFwuAbyzPHHQ7nR9Rk1ThZZOKvNmOkb96JV3QtqPx/pIGaXAY991Oc6SLqRR697QrPx9EoVuF/aUC1ckVgxh8vzcLMJPIdLrCe1Scr+zYBR7ATb6p8mqjtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqOuuOYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SM8zfLDv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3daiR1370769
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=; b=iqOuuOYlY08CPI0E
	nzwAzHwgJI8bmyVhe1ev8buDnoyexZMwzpKsGaGPT8oxFIz9DVRco+qheS0lfGOi
	ZFFN1FoDom8k+n4tiXxbbXjJ7FNHpQURnxCd1dCW43M0fVeXBXV5mHraA4CzGfkk
	MTmM3chqrjm9MSSWyP4eixQ/d1QXJz39VT/6EvheRQ5Wdqyr+W4pvY/ydC/7QevS
	mX2LyBG7KY0Mo/DJDsJJKB+rU8y5SQVyqpnaLMf8Nz4n1q9o3M2APp3TRDHG97MP
	EqFiwGOe729xYJkLYKBFwykgx6TAHwCAhS88S48N/P+YGjSwvjvlBs28JOO4VLz9
	+xRirA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy7he435v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a18d37a91so3251634b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823212; x=1774428012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=;
        b=SM8zfLDvYB55lOkdjqo47Gzagdmsj0X0UFzQwtNYlrXV6YspH+exuY/l1ZwEFwSBAL
         oUgMePntAWPRDnOF4YGoFVYR9pj0RHbR0v+2OcVaPUk3bA4+3Vjcrl1fTWBM6w6CdF+R
         vlVRMtySG+gkS2l2oPynigVLd1vAx8+YYWJRHFXy1voaq2Xk2Wt06F7yHetpzfy1Ilx9
         JGSB4tCrFkDaCa52+mh3Tl9v8upOsl/cqwh+/Dnvig6XJGbxSK24+dcds+tLnTOneCvD
         hj+zlrxaWcfJmKelo8KaGHw+rM6aQ0oUC3EwIVFt/mE2pUGo3k5dY/NFnrZ7cElI09nT
         76Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823212; x=1774428012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=;
        b=DDVXZD06sWbj89ppLkf47MZE/ZTXDQC376dp7gsk2yRgyIElR02fRx3rFE/3UjD2M7
         F2CPDxppY+kAMeCrcw6qX/z/Y3wA6JObN5iperVv9OYfD1k3oeLPA7Cs37ycfuT8eERm
         +JITKeaQdkP15A0k53uLNPv7qgAFIsiKF/e2sXFClJaBe9uLn4zk13Xzk4daTwil8EgY
         7m65jtmkg6uHmLhYXwp9IFXjRWInyzHYgQrbu1RbkmOdxdHtUCtHana9ROUzH2qxSEBS
         +Mq1eUs7+QxJ0yccRx6R98OwBIMPuhGZFwkkgSuRQFx0KjEUWDxw63QnpBQ5743A2uy4
         mX7g==
X-Gm-Message-State: AOJu0YwHhiQxB8jsLcERVze8st+LAz9ukWLSJjuWdfvcSDBm/845WjyY
	d7l0LkdtrFHrseIUVlR0/GC4WvYQy6B+tvAbN/iYA9D3DgnpvF0ZQPhqPrWLV0gImjYYLLNwX23
	5zdFhKB97gthdFCx3nlOovmoDyF+5Edahc/m50TK1FrvgTi4SASEp9zs9Q3MC+nxOn4RbILo93C
	CU
X-Gm-Gg: ATEYQzxNSCtW/cWdYzL1sFxk2d1wbRCSahO0hpx6tBzQvPDEs5WjuHmzbk067X8SE9E
	cxvSKe2Fe28yBO6E7sWCOgmkQgl5grCCJWroXphLTgpxD3w/ZJTTohlm5glJASKJHmEowZEJWFi
	aoSIs+4DWhQRHtgRJcPUAXO8RJXj7yZmt2jNkPSDxqpWP/jp0tz7whPZKuGV9krqOy62SfMJMMZ
	G3nz8+UVlmLYKeqsWxVaYgxzGexj1Gq1cu1wrQA64+qnd8Jl6xwf6s3uYSO4T3v/jOpBdiBTgPi
	qM5iUQSzaN6PVLi+/KlxWZ1k10xTs9xoNRqMEq9B4wExv9ePE3435Hd5fRVyHadX/Mtgi8Y9N7t
	cuOMyi5HB661zjXKeK0aE6CGxO7r105OKP5J9wSm2/3hw6yJouIsd2nJoxdLs/j+EO7LPYfevYq
	f0TaovAWGmDlo54HSIEGvs0fG2ndUW0yh7RH3hYme/h4P+Twn0NoIoeV+L
X-Received: by 2002:a05:6a00:a216:b0:827:26e7:5c23 with SMTP id d2e1a72fcca58-82a6b260f7emr2323114b3a.59.1773823211866;
        Wed, 18 Mar 2026 01:40:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:a216:b0:827:26e7:5c23 with SMTP id d2e1a72fcca58-82a6b260f7emr2323083b3a.59.1773823211364;
        Wed, 18 Mar 2026 01:40:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:45 +0530
Subject: [PATCH v2 3/6] dt-bindings: qcom: add ipq5210 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-3-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=949;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=cvQ1+7+KJ61hX2E7lBAYjSXTUx9Z/ZsV1ErUURaTUTc=;
 b=GQupGMUhdSmoRswbGDv/Usp5qjiQYBR2bY9062OSCHWmkCFsZCKKdCus3Lu1RBG9LweDS2FgT
 9+pB2wFzxRlDTipe1PlHgpEwLg4i3CA4SmXzSbReWC42m/xYIPzJNHv
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: Yi4eNt3I3Rde3XWIVfrb35HC7NGr_OHs
X-Proofpoint-ORIG-GUID: Yi4eNt3I3Rde3XWIVfrb35HC7NGr_OHs
X-Authority-Analysis: v=2.4 cv=QsVTHFyd c=1 sm=1 tr=0 ts=69ba64ed cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7cFofPlDN1olvp7CM7gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfXxZm+nLBivW66
 korg1mYohQqSqJubo8NWA5+3zXqxGeQXITADppW+AVLw02xj0DzV0l/g+Z+Gea+v+ggjmfE5CFb
 bZtr0azDFf+2CRDEpJ82/mcZgInVrAVEmFiKrwkspDGjGQFMm9j9bTgAi+a2EFbtj2ap7igPP22
 Wsg4Baqk9e3xYgXPuN1mAD+xVo2SyRQwCLRNXpW3Te+tFmq3J/Xw0jsAXIWv14qyFnTv0IFBxZa
 dWmVYPQbqUexDdOk2VI8t8VcezhNfNkML16BTvx0hQ2ulq90zxczyCaKqeP+KrozxX8xUst7EGI
 DCPxLd75RuqWP/qv5/ZmVBVDn0VbBdtGDml/HbxMQgYZuRTAQfW3PChjXPoCW7AQcmK1s/ZPYDN
 u+fJTxmii+gr6/OnJmAFOkfa4ZWnmdm0NGU0StaKsUM66jmJwk4c9hqMJKA/TiW+ukPNmgnWsfh
 fdHdSLPzfIkhRAfYuxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98352-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2788E2B8388
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new ipq5210 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f5632d853509b7cd37f07f02473cf6bf71..7a36da412ab82b425479fbf6d81293f24e66ea36 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -309,6 +309,11 @@ properties:
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
+      - items:
+          - enum:
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
+
       - items:
           - enum:
               - qcom,ipq5332-ap-mi01.2

-- 
2.34.1


