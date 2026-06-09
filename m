Return-Path: <linux-arm-msm+bounces-112013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PSOkEOK1J2rU0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:42:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B10765CE15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:42:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZYKDhWF6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NmeiTuU3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112013-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112013-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0962E30449B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0233C871B;
	Tue,  9 Jun 2026 06:41:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD833793BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:41:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987261; cv=none; b=myVtvdtNgZ0iruEzK7rM6nubiHq7+ZjCBM34Y6aDh2ZHWIolDXKXcrHM5WRY4IwUUjGqkjIElrWoGcltEry5l1l9xd6wCHDulfklrzPBNvhArM1oQ6YN3dPKiyX4seEnthzZYneThPlD97R/KdLv3B567MYQUw2ZEZQRqlTviKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987261; c=relaxed/simple;
	bh=SUp45uL0Cj9+ZynVF4O6v6DjZsBdSrnlPjW29909kZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S+i4zwbIBUHJse2NxPwsihu6gscpBD9Rw/u8NgIv+y2FRdPPqCsmLYO8/7Bp4UwGT7qC3J/eCdsU95MSfoFXAyb9CLgkp8ay2AntjLxwcFCl6JKBUaKdB/fFTCRD+7gj39FprS4W9mf8lTLmEEDMKQzk2KKSnccXPrZqfTWrIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYKDhWF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmeiTuU3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wk551498297
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c75jWvAaoCA
	pv/IIOdNGer60GpfGqCeVoO2cPGCyclc=; b=ZYKDhWF6gYt+8FKsxPmYrCH2k39
	4ElPvVKrdOmoXYurPRIzQWcMLKq6JMAOhVlRvZPNwd8r+BhI1itxVoB1tQXVFkj7
	PcNvNaiU6olFBgsL1WUO2OAg5ZEwyi4MlGWQTeVDxYpEjB0ZKf9wmjBelqluF2Mh
	WTS79BOzZilCLtqgcaE+/LZalPHtknkGG88jwDpvw/I2MBZo0Q58iXKUul3IylHP
	cmbkU6acjNSaXDOPINQWOMTV+bihURpPb08B4mO67eDtf60qarMAsOTSy9Lp0AVy
	VKcBxfRsgczVgs06P7BRIi2VVcaB/jITtJtA0IMrftHo0GRcZQb7roj767w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8mug4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:40:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso4944489a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987258; x=1781592058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c75jWvAaoCApv/IIOdNGer60GpfGqCeVoO2cPGCyclc=;
        b=NmeiTuU35xt4YtKrqvuWjDlQit3SRfAhAHfVnFUa+5Ux0PhmJkbJ5cyGclIe6oDbHL
         ryNqaNcDcedv7GGOVJELjX2ya7fdPLQlAVXU7PDkgXtCbnVWWtK6TTMPRSYoY2EK8ypH
         mhUfRuY6MyUpzY7Aip0GDAchuJiMi1sa4lWngPpC5rRo8VtBVTxPwsTgIH/qxz6RWlOy
         t8P5imWfflHqwv5vC27f+hrMqfEdDK2TeevEDu5lpTrRc/2p97gYGqHWPHROY6NDZOJX
         T4tV5YMboY1rnnkx70mHezCZAHbRp58zWFKJ0ANhBnSQRZxa5D1iHWIiFc2l2BovEG17
         JFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987258; x=1781592058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c75jWvAaoCApv/IIOdNGer60GpfGqCeVoO2cPGCyclc=;
        b=lSbBpH65OLkAeafiQvan2spFUl6krqJiXPmU9Mn2d3irNvehXTqruZH4jyLW9aRhjb
         skqkJOWA1ixP7siyzIox/jpd5WI4L+LvmA0PcjitYI2yn1Vqu3nJjvGxUqcpTrfFFSVM
         M7PHuurjLvi17WH4B5cTqhgV0xsQd6/KNHUFDxuE1oR2ea/zydrvjFQbyoL7JufIlBcJ
         CUvBtPD+gyR6cDiO/4ydQ8LiW4QuR5XRM0MdQuKMobGNNwI403peowx618WNKdiy8HKy
         Q0QHuBrOmPZ7ND3oB9e5iX3/c3Ytbztlv7CYRZSEJzjCPM04I9wgzjl0dJEKDfqMi4xw
         ZOZA==
X-Forwarded-Encrypted: i=1; AFNElJ+yPWoJT57SLbgqTrUl2qETdcMv+O3z61Alu79HvP3c/s2SsC91H7j6WxOECjzRFyV3bh8+/INs8oqztJ9c@vger.kernel.org
X-Gm-Message-State: AOJu0YxKNLN3Lm5GUPXkdvczOwXf2237s6Rf4eo5y24t5+H0Ei5Nm1Yu
	CGzv3TiKHF9S4XFTTuav2rb1533X6Xl6M9XSs2r/qxPMIM4xzsN9XSdl0sgir6UlJAR9ARVMw0W
	uOpfZ1QiYK2qTyGC3JqaxuWcQbsQvi+5duahi42HQy0t/KC7j7hQUAkUBOQgLW0EuIXyg
X-Gm-Gg: Acq92OHLM7QocQB3/htAi16YhmmAFU39nx8Q5pbnE1b/9bA9SYSPqvCzpFMECioYF6d
	bNx/WGlgrvjAF1z+B8haRiU1zgIx2nYVwBrECM1YBa9p9O3O8h2jpMhBGdgtHLjBtfqH8XXCEDt
	HhX09+kIcPF405IjYVUP468MttAp9VLacq2KnuKrzdBK/92qn3ic80oYy9ygMIaLMjJtr9T87iV
	KHgKWoSq3+1EiL2Im2r7J1mdzEygM9XmpqD3qi8k/dfHvtb0Sk8CAy2uKe8bnCB7ZQw+eRTRxOJ
	RGicXWLIGeAtWJQmFRGTKo3Hw0oFBJseGqN+WSxbgehuSo4rsmcxyMazi0lMXvF3pF2zyYo4xXO
	tiv3KQZG6JzcgVqeIMnfWXZtoMP5djaL0eZWcW6RNjcf1lZEB8X1RxFEUXx9U
X-Received: by 2002:a17:90b:3ec6:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-370eeff5ea4mr21160277a91.9.1780987258488;
        Mon, 08 Jun 2026 23:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec6:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-370eeff5ea4mr21160226a91.9.1780987258054;
        Mon, 08 Jun 2026 23:40:58 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:40:57 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/3] dt-bindings: sound: qcom,q6apm-dai: add optional qcom,vmid
Date: Tue,  9 Jun 2026 12:10:36 +0530
Message-Id: <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfX6m9N9ox6B+cl
 V/7QxR/K2gUYTXdz1Cw33960BqluOJ7Tq3ZENjd8eoLjjM3wACrtTvtMrC53eN/ElnhZAM8ZbP+
 R0HJRyEKEW+2X/s6XZHsqk7D8Aw5NojHsXDz7N6aEuCGIPE5UlQepHRRbyguM0Jc8MMbEzGDK/9
 +57NRhGFJ045LDEq+qEYK77UmzABwLtRfVc7OfIpqZHcEG3lV4vb2WGaQhRBHhU2x+W0mOmp7J1
 Jt0R9V3ndL/w/7waA+VU9itnYGxQ47RaSq6OmULZ7V2OJVEIo88U9+aSVjVEu2ArKcxXPBCJ5HL
 xBHvuRAWRs2jh9umYtk8QNG8mQ0pxjXYVCPIWsp2Nna/H7fN2NfDi9XVwCKrVVAGeUPiILAu5Ps
 0kmDoTKgFOwFXufHEGFRPiJuu3Xnc/1ZPymTVK0vtjs4DZpjaRLBX48QzGu3v8p6qN6jjM+Umcu
 zeaBcUXQACbJBhAeD4g==
X-Proofpoint-ORIG-GUID: Dr4vf5mM1EggcikVuoI52GcJFoXOmTIv
X-Proofpoint-GUID: Dr4vf5mM1EggcikVuoI52GcJFoXOmTIv
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27b57b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=CLXHBV2uJxG-_-RflmEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112013-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail,vger.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B10765CE15

Add an optional qcom,vmid property for q6apm-dais nodes to describe
additional VMIDs that should be granted access to PCM DMA buffers.

The property is optional and bounded, and driver-side validation will
reject invalid values such as including HLOS in the list or VMIDs that
exceed 31, matching current SCM source-permission mask handling.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..b767625985a7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,6 +20,16 @@ properties:
     minItems: 1
     maxItems: 2
 
+  qcom,vmid:
+    description: Optional list of destination VMIDs to share PCM DMA buffers with.
+      HLOS retains RW access as source owner and must not be listed.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      minimum: 1
+      maximum: 31
+    minItems: 1
+    maxItems: 8
+
 required:
   - compatible
   - iommus
-- 
2.34.1


