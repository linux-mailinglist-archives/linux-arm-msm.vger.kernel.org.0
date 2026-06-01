Return-Path: <linux-arm-msm+bounces-110666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ClxLY3OHWrHeQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:25:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0B623E91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AD10309F493
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47F737B028;
	Mon,  1 Jun 2026 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsnrWI0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLGR+Tj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12C30C34A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338144; cv=none; b=egoGbGqVDp+llgLWaNlGR9UY/9A1Y8KxDF4jW5c8EVm6BXW1aHlJLF2fbMqzPKMBAN7277tbV8ENcKO8Zr4HxurMA+7YCm4ZkmYecYJFOnLt8uu7zKVo3XSgbIR0+1P7JKhKpcO6JzbgGVnvOsd+IDgFuIHY1Mrtw3NbZGkoFyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338144; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFStQfNfcVriUweaxG2ZSwiqwppw30M9u2YxxOXAEEkMxAywrdE6UHvlStcF40miXNKQdb4VnpfDePivS2YCAvC0Wjaf1rj8clh9WY3SwAVwhu3H29q+Aet7xKyB4/aTrdCQTLCGcAF+I0sDmlJSRbLibK1FcYCL/r06UlTBgOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsnrWI0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLGR+Tj6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Exr3U1257502
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=UsnrWI0N1r8T0WJ7
	j4U4silzRRFNM7hzdDHkQ/OTQHYFyMDpgPsBtRYzDODSRiHToWBw9f4rLLd72MMh
	McjmmrnNKMB9c4XRF4F5icZ47c1OJpY3k0sIjw9QxU10HmkctVKwX+mX9RljINlq
	mFUyGF5oId90sPAUIlsnlcU+xP/LMqtoUCQjN942v89yQU3gqQV+FD6kZq1xbZ9k
	hq3l19SGD+sDpKDQY7S1W1kPdqIuLRAXFeNalz3AGZfybqvkuIlcI1E/jc96CXkz
	iDOtOuMOU4ak9DQS9Ong8V4uGaYWkZr11uM5uCRazM0dKFaldZw9afTev09n4i1s
	yg4Ykg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sstf7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b982ec338so4546448a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338142; x=1780942942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=TLGR+Tj6c+3Xxv/txBuHZT+OvuBbUq6V0NmiT4oJ09Gym6KrXMtuqdtkTAEqMEJHuI
         wEsbc94bY5GkRRRwHAY6bHePK4O0dtQV4E5ndhB2t9jznAYqnULvAGo7ZGimzMmxEd3t
         l9gtUfSviOAuU4rVJew6Sfv4qSEG5EYlNydpdfFie+RMBwK+LyC6A7vzdXWBIm49xDkT
         mDRG2mZ5u8wUjofPFaBIhhxWePkiyT8AbFHuBYSTpBkDOGM5QR6AKBsw3XTEUtWAvOH8
         SLrBcWC08+S29HyQUf3YRHuURBIwTFTjJ9nmMQ4iL2ESWsLaGErxuS3W6QxxYgAzVVaE
         4MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338142; x=1780942942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=HtJ2w/EoOwckF4UzJrOKSwtHNVbSJbWghDkzjdvvUr3399MyZoHMMPBvv5ebeEmQg6
         GDwU1eScFOJPDIG548HUhJ9EsWuDKJggPbnYz22oCgVGTi/voBIfeiQ4DBviOvpgvvAK
         Kmj5gPYS9dbOLUlXZC1mk6ULAO1UZ5r5fUVAl6b0q54y1IfBBzYlgdZtbPrqboO/SfmN
         pk4lCPWvwxlOUJpgAFzXbOU/Olbzz98l4jibZfXipLusZ4WKzrnMswxFWX+o1gaaKqGC
         bnYbrWAf/9Fc8bIfK6l3OP6/IgAG2YvtHsZI+dzV6cm96D80mDhWHbSFNlPz3EQdxN/0
         XnVg==
X-Forwarded-Encrypted: i=1; AFNElJ9YFwlR5xtDxpYeP1mwbBd2Tw1aG5xA1sejDcuifs1rTX5wMx0wzsALdfCom7841POJAz9ZTGKwXNiW49GI@vger.kernel.org
X-Gm-Message-State: AOJu0YygN9AHuCCREtvNWg/aNpZPvIuTs6VotfL/kzevGnV6TevA19MN
	Vk7FFJUPz33XfoXyDHSnGU9d8aIbtVM8mre0O7amgm8O5usCG2zo9by+lrjalrZrQwGIkuLzWec
	NQnwUfHHbkIm/dfrdSOtKPjTwsLjvwCJs0G/wXQRm1k9h0bdtOEz8meNc94sDFfPnANiy
X-Gm-Gg: Acq92OG2ot2KKoR7w1xSwCGb8PEDRR//C49Nh+CO0C2o5/sHWfj3KP8g0QY0bHi1P7R
	dxPD6dff4UqNPdc6/YrRzaj8AeLsMEAWMrsvKgLpSp8jAwQEdqNcFJHqteY3z3fgDWy+GRfbT7i
	7LOQ0qKoWMKex3rG9TujH0ZhBvG621/yHvJ5YVy551kDV+G4yYAtdqirsgjYfs9RlhFDWfkO1Cb
	f2tvSVVHNSeI3EkSuHm6YmbB0qtaECC1TG5uwhVyMXR52r7FhHISfqrj9x7t0vkhw5qlJ0C2WOC
	qdjP2HNYGsduKJKOmWMzvnQsKikEG14uvhqkEJb+Us/p7dNTimgwMzbujJ0nj98JgqloPlz1chB
	lW0RPALwzVSIEkqU9TBbD/QTpXE+MkgfnMl0LCrYgRo7FRsnKGpvVuLGUZVSdevU=
X-Received: by 2002:a17:90b:2ec3:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36c4ff277femr11324097a91.8.1780338142040;
        Mon, 01 Jun 2026 11:22:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec3:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36c4ff277femr11324063a91.8.1780338141615;
        Mon, 01 Jun 2026 11:22:21 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:26 +0530
Subject: [PATCH v3 04/12] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-4-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: bXwRfzRkGVbx3AnCGLLAwSPwXUsAFfbv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXy5CxFCPpj1Tk
 4Vnz+C2HdkXkgxyNrtJE+iyz8vuZ/ad3dSDC40wUzlkgRg5uGJIxtT3/LiMI80/reDWjM+c/n4Q
 eI1B9iF/6WbCc/UN08cVQGLJyvyNsrAkNaQR3YTWuEUMvYjXViMrOzOGd3nVzi7Ki1Mc56ZQaX/
 6BinAGYU81s1J3D6rMKFNFLdwtpHZ/sRNcOkhbCBQX0yMLLqZYfNj6LdIpLHXu6YxhaxSpY211E
 mVup1+QmeaV1zGVTzPqK0mgPx34qc+CkAEa7ash4IOfhNPVgFyj7RKRem2Aptkj3WPgTmPrcC7b
 R4e3Yl8hhw8Iyib4epGkpcFicZwUkwKu+umPbZFlhXRz6TkLQ2LdwS453lwZP1r0ZKqjPGuadMr
 DXbvpd9Z0qZbUC3uQ8Wj0il+mu7coWUpJZNt/U8zqDzHaNgTcaLG2qaS+VKuqV3IF8WTJQYt+dl
 7ZCC96oSxkm7loolPVQ==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1dcdde cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: bXwRfzRkGVbx3AnCGLLAwSPwXUsAFfbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110666-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77E0B623E91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
bindings for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b981a1c899d85435f83f4f3dd3ea9..1bd70d091fcd7b6d7805ac090aaf840a415c123b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1


