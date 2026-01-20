Return-Path: <linux-arm-msm+bounces-89859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODJDNIbMb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:42:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46749AA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E564788D02C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 16:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDFA346A02;
	Tue, 20 Jan 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwwJ7oNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7fC+1EI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DF83469ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927645; cv=none; b=XdpBucGZdvde5M+qlKI00wFm43jBV/KwD9jaVg65UtOU2KdvCnnCD747UWv3cjjovzDKBLWXIn+ClhHdXa1P3y2YgCK2H1uVMqD8coUngHNbdDkPoyHP3/4Su4gMyoEMedibCnNZRe7R6DguBKNB2sXLt+aahljX+uB2eteWmHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927645; c=relaxed/simple;
	bh=nt4BCAsHfXEbBoq5VLR0xGk2AL7YFqXXUjWGRrtSoAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IhOsQiZuBagJHzI+oQOA8dKBAm4Ya/HH/lAEumFrjnYzjRJmdVKwaf1AoetayC0AmiiII4xajQj3uDlh34/gOvqWD7icFw8vzWT6eMSsuWoZ0YQ5joJ/M+sEMoKvZ7LkhS+s72nnhvIcMrKi3spPgYBSEoni2k+3JQYfGnt/kIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwwJ7oNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7fC+1EI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KCrcvP877762
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7p1NpKJXFYaNqkRwfqKle0ekshAkxhMguUa
	TjUz5x3A=; b=BwwJ7oNFIBEiissxf/pZMnj75CTddgnB/NNMp4UDBS3I2F7v+Oj
	AToCkUlqfELF58arkHsk0h8dtxuQjjhUxEWsCj5kQBsnRszynlS65wA2ZooYbBRX
	qmAlw9Ur0km/WsWh7/sdgK6GSPR9vs6ig1OLup+kJqJ2FEug9Mpl6BCP5KLRyzwt
	gWxCEmjdUve+aBhM2ePvAj/Foyeh40LzyzS3VvBY6wdNTzbB4XU1cApu3UEb8tcx
	VMRT8kMYliIesZEyhPX9KmBP4RtVE5eWTQ6HTtVVMoLJgYNRNqmpxnkMj2DMzh2a
	0w5BpwtDBfZcJGik/xie9mFR4blY2o2Pagg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42gs8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:47:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so127555785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 08:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768927638; x=1769532438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7p1NpKJXFYaNqkRwfqKle0ekshAkxhMguUaTjUz5x3A=;
        b=h7fC+1EInTuIkJjrzE3uI5EWEkbQhnL0qeOS72xwUJzqdO+SWBAxTSQ01N0maqs8rQ
         8P+vmjgpnbSjM8WW1/m0iVt4NOiLzi05CbO4C2n2mWRvJOsuFsgK06HPCGumrB7e7LhU
         8QaWwpn/BhLGD9NLbrFJEYqHA7QK2pQ1qJT9EOtdxQkJARvc2U2YMusDEVtL+UAlDdNp
         ja/yearCPzKAX5ecqR8eB/lyLgqRHC6mc54m1Jfg+xW6X1ck6xYkgk8gQTsqgzkRggHk
         2FxSOeFlqhvcFFnjB6odYXprN7+8i+wUbC6OVrEgr6pgkjLvDSIS+0uztquhYsMHqhsE
         QsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768927638; x=1769532438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7p1NpKJXFYaNqkRwfqKle0ekshAkxhMguUaTjUz5x3A=;
        b=MTnkuwag0pYFRrKk1x+mBNEZKQ5dT4XlFNNl47ZNg08Lgs237yECIaRRt0SWhj94xU
         r5o5OHfrG9JJBI6iu5JbcoIlUU6fmfVMjkvbkOWVf0Ws6mB03PHH3ZZirBsvwKMJuB9E
         fIxmXvcbV1V42kovpSMKGABcSMqFQZ44jogoRMEhSjKAac82W6DHB79ryRteWatatC/D
         DFLNQLfV5+qa3XLhPdEwC+g3ld3Cg94J9RE10niBcgWpVar8fDcg71Ur/+1AdXnP/Gh/
         DjbGVAOuwinR9bNZsCbsPmb6kr8UuTz7GIPwTqD2SERk++hzNNBwns6B6PHHO+IAweSm
         JAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1RHF7i3kpswdB2g63VU45Wxlif2CnFeflX2dJsmLXetiuAAAGFNxfKiqUBRROMuypo6kEcijeJQUVBp9d@vger.kernel.org
X-Gm-Message-State: AOJu0YxEwWpvG7uYloKS8wdLIjCpVeURv9fDhI3KyOOxHTt702RjPoca
	gwowhLi5DKzQEaVwLi2pC5Wg0ZZKDfQOS1bfNy6ztlb2LZB4Xd4Vd8r07Pq69i92BR0/5vzt7sR
	Xg42G6un7gtrgHc2T82K1JR1Mj6rw8MYZQrxb3ry5za1sKbzD6sBEZV/iwbhkiy3gXflF
X-Gm-Gg: AY/fxX4MMAek9VNKTViIt8CM4CRCzfPrecuX5c0TEWchG4IKV7Ij+t2G57QdoVbWF0N
	KU52sWFWiaXJk7iXeYSGRXSTdXQOuA24bDy7R2844D3/fmw4lqK4oObjbsfdKcB/qtTAYIz0ltX
	3JFXZsJ2dywFZdgUhDDF+raGcOjBlpfArH4RoPmgi/S8OLTeTDNQxyMVk0FpOumlFjpCA2ByvBO
	OTRIaWDRRlv4Q8zCrjHCSzPRuBvoJEnZSyT7tl7lrviW4EcF1h+ca0YeKhTJYE6qCitxwT+FZWT
	ygdXBK1V0QwlW2v8kLHYe9O9L5Gt7dpwBJ3HIg3hm56Ps8oDP3flx7GCNUD8qg67oYcM0PiW96j
	6QP/VMg0oLkhm9Cv/Wr6AlfoAIQ==
X-Received: by 2002:a05:620a:46a2:b0:8a2:a5b2:e3bc with SMTP id af79cd13be357-8c6cce508f4mr269245185a.89.1768927638369;
        Tue, 20 Jan 2026 08:47:18 -0800 (PST)
X-Received: by 2002:a05:620a:46a2:b0:8a2:a5b2:e3bc with SMTP id af79cd13be357-8c6cce508f4mr269241885a.89.1768927637907;
        Tue, 20 Jan 2026 08:47:17 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm29511772f8f.24.2026.01.20.08.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 08:47:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790
Date: Tue, 20 Jan 2026 17:47:07 +0100
Message-ID: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nt4BCAsHfXEbBoq5VLR0xGk2AL7YFqXXUjWGRrtSoAw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpb7GKEdjOO4jXSOoREC47OMFB3/qfjp8qE9AFv
 bt6J7DrgViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW+xigAKCRDBN2bmhouD
 17CTD/4yTdvbVC0bchuWrHssk+fNU2w6pIbDifSOLXwvpWNM2X1ClJfxQXobQQRJ2vgcavSYNJt
 Q18PeRvWFLCdTZV7TMOBwJc7DihETE1Vw08+0e2/IZlGI+wXkXG0LUsbIbAL+XXiBRIEw0eGWuv
 tNzG8tonMNbWBoEHVIDlpMC/PgILATRnK9Apt8c/0VX7zZSK0dgm6mPW2jMc6cvefz+JmfTydHI
 4pFW5ewCfD5g7kgYMMImm6m1OX7zL41uVtlTLs0DEPS240qemIgT3s0X49vdkzExw8Q/r+pp1qM
 2nQgxJXWLAjwnOQxWSTl2eL6c9IiX1/TfC3LTAvby/KjREsJvnyaf1BxZxkNe59wzMcmPD0H+7J
 ghAYpb2lkyrZ+Jvk0LOmoHhEJ7FhkMQfGJZwYSbexcBo7FfRahMumedZLKKqCI243YoH5MFoU8C
 Own7Zpu7JXOLs4izuSeDEjmgnCfxIgaDM/Ni9KDCBYMXK46OhafUi7yLs4JDZd02RCn7hppXi5a
 IP5y47oAyuDtILRY+C+SsbvIamT4EM9yUugaelDYOyra1XZOQHYpMjR17k0yrhPGU7r6sKRm67x
 YWw77o0F22bMV82ffKaOSOdfaBpKcdvl2qOv4+Q9dFfVqFOay0PaYN/hSuOQ2CT+2NWFtUtDfsZ y1YVFqQaP3AnSsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0MCBTYWx0ZWRfX5GxbEoqFr5lv
 ww/2mr9fJrjqmDSgqjbPkWEmgMDtVBwA/3dcFvmdgkcrptxLGkEDI4pR5PALP/+/k5auu0D/1b5
 Udl3e12+myYg6+PGcPOHqQUHcGYCuakmKD0doQQHVGrfUGqJDj1LZb5H5ncoXvhdWb2muLpdQ73
 ScMmj1BDbgxEhWpgdueKX4lPBt/1htLqL9gdXGS5HaJoqWfx3nkAzJTA/E71YaOoLhnLqimb2sL
 HUlNv/blyJ/3JRQl4NYYWhl7OUR/MSP2rXj+vbTAECNQLFPbHD2CGB0U2CG+Omc7pKExQA2Uppv
 D+wxN6tQTXhF2cOMxtBlQztFeklvUlyRep4ItYqn6oiVuM4yp7H0N4fZDcVgYB8NTWIeLdZZToR
 MOSp58vOHAUWkyv5HQEHe1TI6q5CpE42bcoTt3DP9CAOl9f0q3yJI5mL0JN0HhS2a3D+GYSCbTs
 PqLz/j7lVFx5wLJcE7w==
X-Proofpoint-GUID: kvBlao1fJlqAfQ75azL3lGtUIi9hOaIR
X-Proofpoint-ORIG-GUID: kvBlao1fJlqAfQ75azL3lGtUIi9hOaIR
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=696fb197 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ieg599Pkg-FuY5gSfokA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200140
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89859-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B46749AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the IDs used by Eliza SoC IoT variant: CQ7790S (without modem)
and CQ7790M, present for example on MTP7790 IoT and evalkit boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add also CQ7790M, extend commit msg.
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8776844e0eeb..febb69b0438f 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -294,6 +294,8 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_CQ7790M			731
+#define QCOM_ID_CQ7790S			732
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and
-- 
2.51.0


