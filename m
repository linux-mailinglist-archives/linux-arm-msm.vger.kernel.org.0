Return-Path: <linux-arm-msm+bounces-118695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y36dGp6qVGpspAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:06:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28D7491AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:06:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d1UZHiB5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CmYVbNpz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAA8030422E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DAA3DCDBB;
	Mon, 13 Jul 2026 09:04:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D763DD873
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933473; cv=none; b=BDH99yV2gOC/hQL0f7C2JJ4TxzqQdMOET2zJSdHOTdQC6lwE87Vpuz0tKeF3kgz33pBRtUtGkUOM1o1tQSqMRHi8FiKtxZkuyNgmwS08w6rtpthKou+1qQkK9PI79efsFkoouq3cgJyfvSYQznJJtbJcKMn7pJB7Qw9P/5buIWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933473; c=relaxed/simple;
	bh=YdR1uDQI01UrRdwjInrusY38ih3+WE1QOwNiA9AQEuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNWMyP4pGtqyHXOdyVTLpbIBc/ZX0Yt8K+hlCc2l4rtD5Urz2MDT4SwaxFMVl/B78jImCPN43USrCDQDANkoNjm6gAPRxhtynYQjzfhIDNbPrRBRoC45+LqewQHOJLlG6it3v79fLXW60LeBe3xsxpbw16r+z0MvtLQhsqz+2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1UZHiB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmYVbNpz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KgHi774881
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=; b=d1UZHiB5ZDe+Vlfq
	D8lLm1/x1ZAt3BDSnZh7zL5teDk63WQiXsHGY+0u2UaUmE2zWQHttZEH9p4csHWd
	cOTD2SgMMBpBLvGdhV+5kTHyXJvcN+CBU3+rNpAtHed37e5d3enGipmSVeAb7Yma
	xW7a3nOucJQzK4bpj4gNWEjR83evKxGvwWUc3pDXB0lobjJkWP9nzswtk/ZNmyQ0
	/QMstNliJr+4khVkk63yaVWCDNcC/fVLqnL/cES/V/r0HEvJJvMtHraUBl/nwo4B
	b0+S9Uk3o4cE7bt1jpJmyYGbF+VJNtfbDUofs+GL0vTI8IV+lm9jTQGoKI4+eZzL
	Y6JExw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00cww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so4888590a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933470; x=1784538270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=CmYVbNpz8yOfxF1Ef2MAuQW+1R0jxP+IhDCwgPwZbdC15rrTbUtX15mjIX3tjFuwrY
         kXCkKFeeiez/VoXskibHHbaAdTkuGw7UbwrVhl5IOk+iDuvu3Pm3BDlvd1tBGA2mptT3
         VTSdL3ORmlPrNb697pwngB+nyn5KX2pg9Wp3ctR74jftR6abCVOuW43PNgsXBs/UY1M5
         HaQgZDa5MZOgHvnWeAnC5gvqrzKai1rbgZFMFtOlr3SczqF5PY4BrFXXCsgkWz719hKF
         DHdBN3dT502OW9RkaE4GOGO8+IqF2KJk7a1oRWYhvrulTvXFqeVAHKXfq1meziE2IE5T
         vnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933470; x=1784538270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=BwSHfZnUBMiFbC0XwDXjym/sK8w+JF5axKq4vnJNeN8GWa/wIt0KTx9ZFjpkOvcjgI
         83T2V/wpmJtoAjo4Hxyyw50Zwz0TrclxnBQY4mPnbfHDQ3NOoQAy5l21IW71tEfuHz27
         KPSBaD971otPKUEh9fS2s8sMkY9VVKd1XYRTd/0bfHR9z63Er8mVM3WQGX40/Odl78un
         kRFi3Z3Y2QLyfvECiq4Jd6ilSUqX5G4cskbNAlxn/pnGgkZFlMQn7rLu4y6w7wT+JZR5
         NDpnlC2yymQtv5pQdRxqh6BIyDHwdUcA7kJfQBZ+S+fBSf9PmEK3bTxwRGjApoAd7Kkk
         y+PQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqP5sfnmLc/FGrRZfkJoDUQY7VlskqZeAclfjBerl+F9+wlqG/i94WKlYVslPhRx6+BmAwmXjIVEy2aYOH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6oS/l7mDZX9J/A1W62yx1VTTfGKXyPtkqe/d2yOZP2JA+ais1
	LTo8h90kX4rmPHU+IEf+H2BDRxeSRGgjdPclcdg9hJ4RI58/uRd/pILtpaiHhF2q+bWyk3vLCzz
	ztk4RvfSOlatsq50xkd9cGH/c36mRj9YIOFhZ3ddnm+SIvHkWSoNhCOgSaCAfOBsn/Btz
X-Gm-Gg: AfdE7cl8mYv/m/ZA3jloNYbvDGntU2YmZU+ga3OA678+hWH65uCqJs8Gb/G0E+8XVxr
	xSnBiDXSET1n4Du/mTHb6D5oR/FkHC6Bv3zwOXZU69MKQdtrSMYVh9FiATmLSd9SU8ggRhTVqmk
	G6cn5bmVIjV9Acfq+UOpaPUvWq2dA7VuUdLH+W0JaQPqGSm3D21yms7NO8v6COnpx7emA0GjJ5+
	HIlQad6d7Z4PGqausMvE5Nh2+nlG2VYhEnNf8qenebeWGcoJHFDQqAkL8Mxsgb2pwy+YzTlulQX
	oNM2huHT7pVNdbJ8YPzt+bCiWgoKU7FLHweeMJZhH/k4WkEZgjjXmL1B0T3FUZ2OojDoCQxK3rd
	wEGm2hARNJJ/5vVpDq+WM8lf+xEggOqbC6gg=
X-Received: by 2002:a17:90b:4c8f:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38dc75d1ef9mr8483880a91.2.1783933470414;
        Mon, 13 Jul 2026 02:04:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8f:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38dc75d1ef9mr8483853a91.2.1783933469996;
        Mon, 13 Jul 2026 02:04:29 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:08 +0530
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-2-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfXyTjXZ0X+Vq3M
 3a/3b97hhNMgy1fdRZ2/m6Q2Uv11F0UcE7baRGxP8S/1pfWoLoNhU7Vs2HQCjum7aFBoQrOh3aV
 VSVG+za0W7Yb1pUvkJOIWDhWArXTE1c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX+zY559rOZzXN
 YqrfP2wtQiqGgx8/n7hhI4e2MGsZPFXch9zQVufDlTbcw8q3o+EWulQ5WcMPlL9rZHq3h9kubXF
 fCcOLH55IQduIv09K0EJydhwHFpF8G+EgisFHvx0wdZI9wW3waBsLx0z0rygeSrwv8YIlPHcmMr
 m6CcgZas5n3wqprdq/ejMflWGdLpja6L4ECtwHo86Zy06w5Q0fqQfA1XO9e+7J2dISrEHNM2aL4
 moA4wW9975lT7643lk3QjFf3EeLWLDJEOUWcvqWnDtOvSGBXtnYbYLkiDQO1TnP7WJKg/s2DrbG
 URFNiQjhRtQSU7hko22BGhga+VN28V1M5O0obXqt93ASnR662oPxmZyegFsavwKcUUH5pddbTDo
 6fhtwem2t7b/kMGVuiOcqo2pryLo4VR6P3Z1ZM5JgyN4x6Pl1M7pJzP6UKR+CyE4ZHcTJEgjH1w
 UVtfABsihdt/pvwXwQw==
X-Proofpoint-ORIG-GUID: 0CNAkB0OgmwugIyERg4LqltQq2AozCSb
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54aa1f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=e1wQWcbTFuPEDoJv1qQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0CNAkB0OgmwugIyERg4LqltQq2AozCSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118695-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC28D7491AB

Add bindings documentation for TCSR clock controller on the
Qualcomm Maili SoC.

Maili is a derivative of the Hawi SoC and the tcsr clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi tcsrcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 34 +++++++++++++---------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f84897358f2f7eac58e282a507c0489b5bd..15bdf055db3c012ea98217a0e7ca729ef41071a3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -25,20 +25,26 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
-          - qcom,hawi-tcsrcc
-          - qcom,kaanapali-tcsr
-          - qcom,milos-tcsr
-          - qcom,nord-tcsrcc
-          - qcom,sar2130p-tcsr
-          - qcom,sm8550-tcsr
-          - qcom,sm8650-tcsr
-          - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-tcsr
+              - qcom,glymur-tcsr
+              - qcom,hawi-tcsrcc
+              - qcom,kaanapali-tcsr
+              - qcom,milos-tcsr
+              - qcom,nord-tcsrcc
+              - qcom,sar2130p-tcsr
+              - qcom,sm8550-tcsr
+              - qcom,sm8650-tcsr
+              - qcom,sm8750-tcsr
+              - qcom,x1e80100-tcsr
+          - const: syscon
+      - items:
+          - enum:
+              - qcom,maili-tcsrcc
+          - const: qcom,hawi-tcsrcc
+          - const: syscon
 
   clocks:
     items:

-- 
2.34.1


