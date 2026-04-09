Return-Path: <linux-arm-msm+bounces-102535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAzlM8Ds12lEUwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:15:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A23CE9F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 148513015FD5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2EB3E3168;
	Thu,  9 Apr 2026 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjIAyVLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsHMAjtE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1BE2D0C92
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758420; cv=none; b=e7otWiAIm9yihQO6u/NeAYzza57z7xnQcqj/13Lc5rNld9wAqRrNopkv9JiXNhLjErvonhta7cQtyKzyX0t8lWzB0uqTjlSMJ2wJTgNQrO6IwGvXM6bin1/9R6xrT/mcfy6iNcF5yAC63xmVISA24JYrVlgM1hA7twvfd8aG7eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758420; c=relaxed/simple;
	bh=0QmG7Nj0rfKWZwBLXocajkJRio7sC4Gbptb9TiEZJkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2/j4awPdU9i8ADiJApDZubw9c3GTfy2ZhU/hXI1wwNJGQDIZL7sYRyurk2d9uZYKScABwauh4EqMycdB70L/FeL77YtGsuvsaA0jewlSWTr+99jc30RNURRlj0bc/TpI2GM/RG2HBrSigsPz6f8/qST8YSaZXRilKcc1Q7uKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjIAyVLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsHMAjtE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DbjEK3934532
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pBG7ZZRIXh2T9+RFidk6AGZvRVTXkuwriiF
	U0m91UG0=; b=TjIAyVLXmPTN04g1YLrxI7pTE1Ke/xDw//ZOOjYC+iNoST8Q+eT
	7FCtZ2obD4HoEtVVGBqZhazMaTBa1tHCXTPkx9D+MCGye702Xu8Q13EYRMrSzaKU
	6wWwp1/4vE01hfTF7/C7xynTkWvdUtAyzd1lkoRRtyUXcL/WpkW5Zmp0no4wyIkm
	TPENxiQ89fHVRWwb6Xq+J8mKa0LpCGjrnxCb+kCydAKnBZwqZZM5SfaozaD62O5Y
	EcJdHRmqHv4YmJJzAIdTxmkF7sV2Rrgw4SwH79nD3LptFAeHoomobs+Ozq2e5ZWy
	S6gqa2Toxu5X9M3evrFvMz9kvlaxQPy3yxw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5s91p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:13:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso1748972b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758417; x=1776363217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBG7ZZRIXh2T9+RFidk6AGZvRVTXkuwriiFU0m91UG0=;
        b=LsHMAjtETQv6T9lGWh+paLrPXsyqw+ajI3bAoetRJycHoRqasOq2AtxHvUpwSKuRsm
         5OE0iM+5+LOPyoK9CBwS5Pa839CnGufaf+7rFVtpqWXxg38heAxj3AIfHwMGCSdE0psm
         TdOQzwQYeOsPTXzfwzPb5jv3IKrmonWAeraoYWMXEq+AmljiK0JKkFYEArHK4AAVTWNC
         QERU5AREaHSoE9xz5Il327sxzNqEVvThDa1gshtMEa44fvNGNGdpcDv9skRwsBNpfQbC
         9J3GgyfnFEg+AExMBmwwFHgGEUa7fDfTL9nL9Or4ytPNnorVzYr9lUJS5nKK1wPmwint
         g7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758417; x=1776363217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBG7ZZRIXh2T9+RFidk6AGZvRVTXkuwriiFU0m91UG0=;
        b=sSBic+s6y/xHDLwEPujyCncWwPo9SCcJrdpr9xnXD34Ex41SGdQIDikd85+x2X9jl2
         lHvbkxcvOHckBR0+keXqKRYW/AkoKJRHdHZI4PV8mhBCqDy9w7xrVu9ZCJIvCVvFZjcw
         30MYRwQk4dKF0hwAKFDicDRP9U2FMQ08c5YKutXQNtjm611cALVkbZAoF4JyjEJ7mClU
         yNkkEqqPqoXxFAk4zaefNQVFnbx0QhxZXXSrBXbRt2yh15ikxln/KNTzF9QC/RQW4ZUs
         ejWL6zsiqFA0qHlBNSx1K4x4BxaIAMzp1TOY5ET3uUT6J6DAoKJVBvlB29iyVup27DUR
         h50g==
X-Gm-Message-State: AOJu0YyOZPyJNzU+pX0ZR3P4EkDwOz4lQAsGOqQrfBGE8C7+W8T/jm5H
	p/kvVvF/1CNfB/jREkiascCFWTKaZkDYPGfsa2MA0innrbCZ+Y+vljS/fX9EHI5gsrseJ0ljMDJ
	VG2Khw5p057Q9pj8pv5hexETsubCLsFgpq0LekfsGjkkz55YxZ3qbjkLPWVtpgxq84g0b
X-Gm-Gg: AeBDiev1KiP87t/xysi8NmJ0bLXElFdNrEETqAlRZf5jjEtqP13d7QyP93oe4BiVBXA
	BgZDLGmp+3pp5SurCsDumuNpeMRVhW5h92x92Qnmnuys5y9nrqzB1ZoHLBZ3nNsrxaPqFBsF2WY
	m1qC+jMJSEdDOBHo60eSbN/rQzmtTtYiC5RVbZvhRi7WCnI+LzeZ58SdEHC1r1LzZQtYuTMUxlZ
	GCbAkO4IH5Hlf9bC6nAxWmetyET2Q2qyAIwKXkcp5mxkcrLBqnBPyUCE6ggHV9Dt2Eh/Paxw8x8
	bAQVStPY4HTIP6qpqaSXLDqgaZDLAbeQYHocjn1vreLxfYP6BeqVqWS2ZtydLKdzIWvs+PTJXxY
	X4BDMKGtKCry4rRL5RrwmTGNSSM0pGso5eWKDG7Pd1t7tiyko
X-Received: by 2002:a05:6a00:2d23:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-82f0c2695eemr228974b3a.2.1775758417340;
        Thu, 09 Apr 2026 11:13:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d23:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-82f0c2695eemr228930b3a.2.1775758416664;
        Thu, 09 Apr 2026 11:13:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4fe98esm82518b3a.50.2026.04.09.11.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:13:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Date: Thu,  9 Apr 2026 23:43:29 +0530
Message-ID: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n34sx4ytDIbtXjDG5VBBrlj6LtyjD6eM
X-Proofpoint-GUID: n34sx4ytDIbtXjDG5VBBrlj6LtyjD6eM
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d7ec52 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4CGqIW-RtR09rGJT4tQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX/zdAwRHXLn0L
 R8gE1Hb/az2eaK7fbmYqJlJNnbqGQVADg5XoMkoTpF1q6czzz0d7V0fn2ic2F7gYyw+i8UQOApn
 gpO/pnzlxF/YQlrGI4QZ1LT3W5OqvVUhAjGwjpLTMi4D01mPPfY0h/fwiJSXF5I2mPAcFpnpzuS
 v293h2+08GZS0BQofVkvwyk7ciAsKNIn8+qSczMsmx98OMtrZai5kKdvAJHNoA+apKbxQTAEJwy
 41Vmp4zjQNp3qs/n/qIumwJPMnBhjMgUqE67c9gWuwYbh10kjuc9CuiWf8df8mtWDG+w1YG/3T0
 cUoqdOWVRwhwBTMmBH99fhew6PSvlCVXEggdzqZFmI2B/AGWQA8eU/7T0UDjvaoSs0S8rJODyhF
 tOWvgtUrds/04Xff4MLU7xSQ7WCvK9wfDIV/ooieyMgX5lju5N/sz/Ildxyzr2ycpRYWERK8Kch
 Bsqq3hF5bW5azAXG7Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102535-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 286A23CE9F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The remoteproc_adsp_glink label on the ADSP glink-edge node has no
users in the upstream tree across all affected SoCs. The only user
of this label is qcs6490-audioreach.dtsi which references the label
defined in its own SoC dtsi and is left untouched.

Remove the label from kaanapali, kodiak, lemans, monaco,
sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Not sure, if these should be individual patches..

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..39aad33f42c5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2634,7 +2634,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_MPROC_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..c5976e19fc4a 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7483,7 +7483,7 @@ remoteproc_adsp: remoteproc@30000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..e44a42173d2d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2795,7 +2795,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..3c9529bb2f76 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1612,7 +1612,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..6d36d377e05e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3755,7 +3755,7 @@ remoteproc_adsp: remoteproc@17300000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 				label = "lpass";
 				qcom,remote-pid = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..416991bf9cba 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2956,7 +2956,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..ffc4ab021ad7 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2798,7 +2798,7 @@ remoteproc_adsp: remoteproc@3000000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..e5dc3dc19f04 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2797,7 +2797,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..a4b71fd3ca14 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4486,7 +4486,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..63fcc6c749a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2217,7 +2217,7 @@ remoteproc_adsp: remoteproc@6800000 {
 
 			status = "disabled";
 
-			remoteproc_adsp_glink: glink-edge {
+			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
-- 
2.53.0


