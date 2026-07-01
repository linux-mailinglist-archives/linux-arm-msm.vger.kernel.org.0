Return-Path: <linux-arm-msm+bounces-115672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nUfxAPTzRGq53woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:03:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C16EC821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:03:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IvMCLQ7Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I1qMya/G";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115672-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115672-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A413A30C715F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACBF42B738;
	Wed,  1 Jul 2026 10:58:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352CD3BA249
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:58:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903522; cv=none; b=IP8IGKzc54xWh+6WG3xoVBTJ7qlmpePqE/LIYRtaX6hZhrkkb1Vwjk3P+vuWDCod4Xqj6DLLe7BO+YmBHu4KBWIm4udReHPVNLHmGbJE/H2JOLnzYmM+CpuOIemN9TixJWdKNGgelz2OvCRAmQvKu4INgg+mhUVEqUHf7fyhJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903522; c=relaxed/simple;
	bh=fNkH0eOHPZJEtlvIE5B0UGTeoRzJJbYjhfyye3gYog0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4pUcJTiag/Fk7OKSohLkJke/l4dwzHpimVR88gape5OoaDXjKyCfsC1HdQyi/TRt+8O421DZIXtGEcxgZIh7vaCnM8+KDmcE7GqobAV/62NpyqHNgMTnpYRYs9PZLuo4bM8oEVs5K+V2IpzBNK1bgg3e9JcmnzKvnig+6CT6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IvMCLQ7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1qMya/G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8t7F762327
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/t1PO2v5nP7keoCi5wzzaB5/xXCQmzgfOJf
	oKsWa+Dw=; b=IvMCLQ7QrcxGfHw8DpAvEorYg34kjG2gWGuawxw1V9viaU4lVfc
	Dow9HIqi2nRj1ObWuxyfxJNjvUbFQFIpsWEMoawgFTrIgX9qUoZDx16fgPuc6ujU
	RmeKCbFhC/lI4yUAzQQv07Wb6FNM1uGBfLvnk+O7nxrAMWRQquPqa1kI2iab/wfV
	S+V9MVAvL36dTtZr+mM9D0p5ketMu4/PoJ4gbpCMwMMnBw7oRc7YhQVd38obJDGC
	m+dluFiShqjXMT/lEeSpz5xXm4vQ+exijkVpJxz26JhuGs3rBuxpVlzxp2UJMd6E
	HzKSMB4eUKPXzh/HnQfcX7TGJYDwH0ZqtLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd07qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:58:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so66208785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903518; x=1783508318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/t1PO2v5nP7keoCi5wzzaB5/xXCQmzgfOJfoKsWa+Dw=;
        b=I1qMya/Gtan2KgaFJP/VoLYcnBov9D6RbkUEUkuJ7gMLtsoBUstk0NHGKHUJ0hUXYJ
         PlJXUGUGdBygq23lzE5Qa2UnNP9bpekhe2i4zqLU5PDab70M6+5FBqpMsZsC7r+uXsFx
         icY/garnp3Gw7D1a6x2eJEvXMj52L9wDKiw2UfgEVkjBaj8xUrUJ45QQcQajkkCE6Giv
         ebzPNsLZ1Y3DwZk8CA0U8FvL1XHAMNYGcSiy4kGbpTjXADO/FDcpGTzABO970v6xTql9
         K9fAU4jn3qWlL/l8TK2bb4gxhh7tE8i/VtmEvgPm641Or3yIAfdc/DbiBB9a6sBj6Z13
         Cztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903518; x=1783508318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t1PO2v5nP7keoCi5wzzaB5/xXCQmzgfOJfoKsWa+Dw=;
        b=ZxK0+dNU6G1PsEF8vQ94jBI0Z0HkC7Mk6X7IuOOCf0RMnEO2HRn6E0E0DqIIX3RV0L
         e/IUzmH0SGhm+yYDzTuVNExOaqxbH0Z4Pe68ti8nalp/v2fJUf33l/OgwUnEKj38rDV7
         0+Vj13Ub+ub9FTKYWE2lrAm7+Fzl/aV9za2M54wJA+ZqQskf1G/ROqhIQEG3o9f+x16H
         HBn2CGplCtidY8jbJHS2O/UpQ52QWIULMeWFlD/pVoOguOgwFptvzcY4Kq1o6yfkUZET
         uMDhHFPb8snWcxuujD2YCigR1sjealF+OWWewX6gr82ugEeGBO7sNhnC1ti/xw0FCuF8
         Cgrg==
X-Forwarded-Encrypted: i=1; AFNElJ/6znwW4L7tW8mPhtxTWzGSNkWp4zpZ8A1W3wYsZdoDDZcknvLe3+frM2rwo0BCnIKALtq3u5lVDfOYfSXv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz343nlUP552dZeqB8osZ+XGLUXdrrzA1PbPZLtbPcYNy1OPE98
	rVZdjb4/2+nNGM+Zq1IIm9ujdOVdWRRX/m7MSXjMqk4hO0MtEWO/cQFD3EV+AAvbK7dw9Szindd
	+MgR5jEl6ze9o70OsbdXxHiiDJ5isylTS5FK/cj8JEljWfqn79MHNILczR/8FBU6qhJKl
X-Gm-Gg: AfdE7clUWo0TM4HzEMFxyViYuuSy8o5lkEBAOxqqhikt1+7tc1hxDKKQREVnkGYANdd
	bn48RnTkRm/ocRjDlq4bI7zp81KMYDELGFaaLi4KqseHMYWNmiXoy+zjdKBWPrHKLYeJkrWrqp2
	zLmWRcXPjLjDxelCjCaoAlVGUU99mojgzbG2STTIp40KmU3REImg1FUc7ihULG3Lwgmh8/lRoKr
	NIRT8YAelo4PW8r/hSpxsGYUEtWQsrsWbppndrVeHFYTUYlHywXyjpCNlG2ZuUVv17IfJmqHKTU
	7XPAbow39+lX1qF3EvIduAhTfRfU1XShmmoQtTO2s12aaL3b9B7c1vTaCKDBQ6e5IfpChyvh8+Z
	Mj/NUgbq8/AbkxftgK9W5x5VLmsQ=
X-Received: by 2002:a05:620a:4888:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e785220ebmr138277285a.73.1782903518570;
        Wed, 01 Jul 2026 03:58:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e785220ebmr138273785a.73.1782903518148;
        Wed, 01 Jul 2026 03:58:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81df2asm126262125e9.12.2026.07.01.03.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:58:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: sram: qcom,imem: Narrow allowed reboot modes
Date: Wed,  1 Jul 2026 12:58:33 +0200
Message-ID: <20260701105832.197036-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fNkH0eOHPZJEtlvIE5B0UGTeoRzJJbYjhfyye3gYog0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPLYVQg0/fkpEmVcibWWKC1xlAoZZIO9tLlU0
 5ddB3Qms8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTy2AAKCRDBN2bmhouD
 11RlD/0X1a+QjH9839s7BToAHEkenock+BB8ShmgnxBXSNNmGHVkMST4e4n2vUrrS90qd8G97eY
 sfFK8mtsXMwW778L6DQp3ZxS03rP1ecEjFia1R1vDdaGunkEGIPN2coa8M7x0POD0k8pZENhXHb
 gxwLegRe0oerufQz4Gi98cUd2wN8ZKOVFviv0NOiQCYcCWfONKWrj19a+XKKpYwVS5dbIRKQS+P
 L7kYMWSzxFOCKmOAwBNDQUF/rs+hKWCNSOkUMbhKG9w+8x33S92UYVqXPSQvb8w0XADYTPHQ7Q1
 0MtqlMIvlYSkjn/ovBUKYs3mAIeDQRXF1TOqx6wDVeFCguGEKkhmJKfAGo9amwW4gSo6XndlJVf
 EZ25q8FoPnlD7HQgDBj23ZLaFr6zkiwy1I/yNi6IpFwWDrUBOMoSlCHhmLym2qk0jtPEY7RM9dG
 4ULTNix5M+as9/JgLLLLtv+NVw+AmkRYkPqFMr/FIoIbwvsr0HuwXj7zK00GOQ6Q8DVrR0cRyTl
 94BdWFlBqbHcnM25puBfsiNfSvJGlj/yEjxj9f8QKMOk2WNYdpJDrZGwIxhbud5nV5EhMDs/WsW
 ywF7/JxEXL76b1VhIxt3Vkcs2hhp+Vu3WLqtMoRnXX6YLc2P5u+Auqq7hFXrDfVxT0NnNWKUZDg sx2UDYWX/59QZQg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44f2df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5Ns_PCRctq0m1xQJbZ0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2rOSU_rWvKIRUZ_KMfQyo_bEJ_kkaAnM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXwddkUsLhugx/
 h3Ymmc9RBWWfxRYE8Bfb5SOD8VyH5sMBC0AYUB2jbL7zmzV09T6CGX7czrmX48Ac6hCVsib/Dma
 OMb9iWqKe8qpanHPkAl/Gx8/uNe7q/c=
X-Proofpoint-GUID: 2rOSU_rWvKIRUZ_KMfQyo_bEJ_kkaAnM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX2RwHrl75jnEa
 sHWiPKpqYnHpRlZroBEl+oN6YpnwxNnjkXaPxdCdQli1xgRIC91gc80bkr65jXGSmbApJ2GAXpj
 pua9pooyi3P/MxWY3CKFL3YsTamzAaOV1Eymsz4HEG5VmU4QgFvT+BCFHotUZ8bxyDEtGSG5F9q
 X7G9OLAraLYMGhwznXGplLJOPwYK+9mBywyik8Q7IBA3jhUNyiZiJKmMcWoWfr0dbM/FeFHEF57
 iD2MIpklE7AJcKznXu2xCfZLAGq46id06AnLHk21KjEc+Hv0EoXqJ15ut960GN+x328Qerx9okv
 IKouzaNKZis34/WmEYfkE9a22gwP+f0iyA6Mlo4ZwXTCke15iitZkuuKD86RnUlKZKz3LpBMIfx
 PtgqLFnXE2fJVLPVu5yrNGFa+bAjsdZaxUQKDnnJmgME4WSgS4EwyNW91mdtraZXUfzLiKVD9vo
 beoE+h73VeX1RaEUXwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
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
	TAGGED_FROM(0.00)[bounces-115672-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 607C16EC821

Only few Qualcomm IMEM devices actually provide interface for setting
reboot modes, but top-level schema allows "reboot-mode" child for
everyone.  Narrow this to specific compatibles.

syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
a subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding even more.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sram/qcom,imem.yaml   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..eaa8ef367ff4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -89,6 +89,26 @@ required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8064-imem
+              - qcom,msm8226-imem
+              - qcom,msm8974-imem
+    then:
+      properties:
+        reboot-mode:
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|normal$|recovery$))": false
+    else:
+      properties:
+        reboot-mode: false
+
 additionalProperties: false
 
 examples:
-- 
2.53.0


