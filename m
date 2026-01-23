Return-Path: <linux-arm-msm+bounces-90325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PrDHV1Lc2lDugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:20:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C47439A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4250300C01D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774DE2BE7BB;
	Fri, 23 Jan 2026 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaAtGVjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqDl7TW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17982353EC2
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769163380; cv=none; b=D4+DHcKJIzK64TyRwa0wcbDWAX2LF2XTWpzcb+8Ci6Xk5N6Pq0xWWN1UzxFO4ZwKjhgAKSbhsvuK9klNVGVVpXY2a6X4wA10ODWDotdD0ZnTsnsnB6XbXVjn7FDklpoAR4RebBQCsK76bXHeIarGyb8VqW9ZogxNrzT4AzIc47o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769163380; c=relaxed/simple;
	bh=AHJbuwH/Zwdu9tWlestwyzEI50tn801Lp7fEwKmUG1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nREYEzfn2THIfInYYXIdUbCVrtwGMfGvjf+KMPeqzM+sDY+aXlT7H35i6LYNnS5+/or3K2fLo8CMy58FWXvSWYimyyc28hWpsYwb4PaQTRy0H+g8ON5PApBohXeofWqz09yF4lHgNiL3d3ZaOikLDtwlcqapEhQJ5YsSI4uNb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YaAtGVjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqDl7TW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N9xklt1117608
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=MUufVgBotyj/WyP8c5XioQ3hG0UgHe34qoQlJUGdEtg=; b=Ya
	AtGVjzNXXXrjjSLS1SqF7PfSD7WHYCdNW810wUY4If4CadTf3knxXLLyVzWQDvvE
	MLP5heUMowN8oZjq3fSZg1J7FQ0WDC+YiEq5BNAyCccPWgGP2ZYbnkQK0FSQGgU8
	vnYnAFD8wdxxcSeWhFIhtvtyYo+jilhxu1E9+9i5BvUf8D2khCuJyaZrz0GHMxQv
	5Um7zIrMpEw8VVF4vA5o6aGVhIbTLFdvQ4jNYIKGkoRH60c2seTVqeej/hDYHMvp
	5iAtMV7znMU9UW6vREQfDZ8I7nCFrdQY8ExtoclhZjb6zIMRpDGKL+tzzWmXH2qO
	OBWDLaQjjjrhoDtGjh8A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bur1cb8y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:16:10 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1233b91de6bso3584472c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769163369; x=1769768169; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUufVgBotyj/WyP8c5XioQ3hG0UgHe34qoQlJUGdEtg=;
        b=DqDl7TW+VmN9wTJn/kixTZMcqcjVrQUBq3JbUOp5UwuPY1v9CanSaT8gxLinIUPkhc
         LROv9+1X3aPypQnrMDL1pFC9PxK7ebzqoFic16DCXyjZPVZ6k6nAUNTGUe5AN02rwOQj
         lHxSk/4uN+GOAHFjU5fwYMJ5qQY6pUYnw8EJYtkNl8vJ0jVIv4w3jHi5IMtSmFhKnrni
         x+88V7fvlKCaMYhGQF7h6iCEA/8AFhKWjlPwOA1ZcRPf0K2mj/9BM0o274RraIiz5NWP
         7jznJI3ha+Evab9s1ZoI44lObks1v99DsWgokgWnLg50jB4ZNDeupe3zd5BnjsvaclZN
         Cbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769163369; x=1769768169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUufVgBotyj/WyP8c5XioQ3hG0UgHe34qoQlJUGdEtg=;
        b=fWKfIpIKsNWc6434EyQ5BSfOpaeLtx9NGpUDqOVWDdmlDKQGh/WqNS/XpHUQfEKvbm
         kobzrY/Tx/HhRrgzpZIPEA1TNmd2A2/RzW2Xt2AgZI3BwEyPIoAUVcK0lnqrOvi5vYpH
         rqzGi74vpE0UkuXeAFW28FTGFXIA3/eVvFN5VXfxETKPhB+YyHiH8newVWHE2yQawgFA
         Bo2Gbt4W4iYZQrt6Fp5nVwMEV1u337KWxxIT1bW1XjrD8kuRe5CU8qNK/sYkqnZUlvoL
         YLCerjriayC2g6jLcLnppFP+Adf6SCGl/AODKgeOFpIE0jK1dTK8uXacC6aSrt39u5jy
         vijA==
X-Forwarded-Encrypted: i=1; AJvYcCVSiBpXeqwDhNCtLP6luMu5Cyk+K+bvHyr2SmzpiL36mM+J7fXSFM9rFBccEcA78hTQOSycdjyU8aGJ+LFx@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLwzzxhzt92H0CC5yXWaNsReOnUz2Zyz/JPTQwexAOgjBJfYZ
	VupuhsUeGIQ1LmqkZmufpOG+LeVhKKXghuWrSRF+aa69Km/1Unsuqsco4i5Pf0qKvfsJGMBYbsX
	vPdBmSrUvcb3ZuERfhATlz/Slu6JwsE4gTLPG76qafIn5E/3DGE5XsjKBqLZqtIUBY7no
X-Gm-Gg: AZuq6aKZZquLgkY8RQPX99y4BxXJtobAfkLQWn5/bzpdvLJDoXZZaJAgDAv/p/xNPJc
	72k93/yOCcwxNepIY22RPQBmrLSc2eei4989YUcowOejMzhm4joBfbgrgETurj15lYmBUU8oO7+
	d0GUl+056EwRfkgktnl1rScEsqZtItKEiVLewI5xFGIlRPrz24A7bWpVpeMHXrxjLAkplMAUIao
	+qzu7TuLu+c1Xnkntg/9SGcb3jwyHzKwzzz/xBwZZTElfB9VOvLYauspqb9u+Cj2X6PxosoV70h
	r9iCU2MuiFG3yVmUr7SfS/IduylJLS/yPLqxDZKKTRuqRWoQ0wyVJ9WVnX6DS0P1UhchLt0u9Dg
	d6zaNIJFm0U4xWFJE3ceu9iPkZvmBabuPDf2f2W172MayMFPm7FUDYG38sqw=
X-Received: by 2002:a05:7022:6881:b0:11b:b3a1:714a with SMTP id a92af1059eb24-1247dbb3165mr1091841c88.12.1769163369384;
        Fri, 23 Jan 2026 02:16:09 -0800 (PST)
X-Received: by 2002:a05:7022:6881:b0:11b:b3a1:714a with SMTP id a92af1059eb24-1247dbb3165mr1091828c88.12.1769163368806;
        Fri, 23 Jan 2026 02:16:08 -0800 (PST)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm3326594c88.1.2026.01.23.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 02:16:08 -0800 (PST)
Date: Fri, 23 Jan 2026 02:16:07 -0800
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ananthu.cv@oss.qualcomm.com
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: sram: qcom,imem: Document glymur as
 compatible
Message-ID: <20260123101501.2836551-2-ananthu.cv@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0
X-Authority-Analysis: v=2.4 cv=FswIPmrq c=1 sm=1 tr=0 ts=69734a6a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8L1wIjRprNIJhFSkvUgA:9
 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: xghKuN_1ICTVPI_0aeew4MU7nyXBlHIp
X-Proofpoint-GUID: xghKuN_1ICTVPI_0aeew4MU7nyXBlHIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4MiBTYWx0ZWRfX4M8WPS2cGb8A
 O+RFPuWJzO2JbbPMyzSWC8LI777VjDH73a5f8GkgTbGAhAe3nwwrhFEeB5NDBUgS7kNPD+/LU9C
 72qpgH7YTQgkZC0BEfT9eKbrTsqyLWsVuoL6aL17l6Pe5hhOGTtbJJ7SCWsYrc61IPuGKeoU3Uv
 EPimdrE44olYyFABgmPDz2pV8d5r3zlp9IHldhwlchdUCN6cDGK68kqq3lGJHT6Y5eCNS+rxptI
 YA63SKybNqN8j1OyiDEtQmis9GMBnmRlZ1Md//GyXUBYV5nThIufeDWAteX+SfIjC+TPuthQLQf
 frenJ4xM+5VQxQGLfQj9I6lPmH2icHcw6ZuFUW1UEFFQ/p3xQJwUcIx1MKx/OYZdo9hue0FK4i4
 gB59ghMoXiMjGlv+Wt7FfCzcn+z4rr4n9PUVHSCoC1Bb9u6t1RZ8AY/woAOsA7IGzDhZmDkT3So
 DZatiOfa87vfJbUyOlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90325-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 140C47439A
X-Rspamd-Action: no action

Add compatible for Qualcomm's glymur IMEM.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
V1->V2 alphabetically sorted the placement of glymur in the list
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2f..5a4a2868388e 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,glymur-imem
           - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
-- 
2.43.0


