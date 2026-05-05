Return-Path: <linux-arm-msm+bounces-105843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K3mJuKW+Wl9+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B34C7773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41DF43041890
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92FB3DB629;
	Tue,  5 May 2026 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMGiYZgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwJ0R1m3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE53DC4C0
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964451; cv=none; b=GM6zKT21DfQ/JpWBJktb7VKDlAs68En5wo6xkmE5FKBcO2xFqYtP0DL8AAduhMpx+ZM5pKyhUaSz8LLzAVgx3ih7C9E4Z88RIEgtUI4Up5Vah60HAf0Axq32VlXlm6oFUL50qfHVe0/udh/bNOPvvZ08t4HCKPGRxY8or9uBucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964451; c=relaxed/simple;
	bh=haVptpgq27xoiy5H+ghFCWo2lm0Cu97MuoRlma08mjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=df0Kr5kLNNWPUQe4Bg8gFjlHtutmda5hjcjgIdYTvZoxPsfyq4UxRPHv/KTLgUe9WYgvHPjajBVosl1ZB4YfpN2C3kTV6xrGBWHjp2zTJh9o7qySdvFzhCXSrF0lUCuRHHudqVux7+hQwDvvm2wtpCoPWHkObeaeq1UbzUvTMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMGiYZgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwJ0R1m3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456SPOp299537
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTrt52egNPme2cgLBNhr7G7/5o5IRugC+NSDZDNUkq0=; b=hMGiYZgVRzlLM5re
	EWl1vOVARYnltt3r26HnMW1xGYcNJ1XUKURvFr10miEPXmjDieegVRFp2qVkZadn
	9f0/DoXHJ1AiwJ/h6XbZ3aHFvIrBEvLDHbs9UEu3vLY3P2ybtSJ/ZAFFBUMzPD1y
	+F1sKGusrTjwCnAgcg8O021nKdPhpSEwuS8csbWPFNxdTSMqJIYw6vrKdBnQOM93
	lzebNuBHIlRok8m+x93X4cl+2Oy9JMDM2GW9937UYZzNKbO8LGiHzx2adskZzaQg
	2BSaPrZ0ak15pQd291keStRGp5jKZjYq2K3A1kKiyDk6lMCaId+PnK5Bk7ahq0Fy
	A7XgyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvndb8vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:00:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so11847328a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964449; x=1778569249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTrt52egNPme2cgLBNhr7G7/5o5IRugC+NSDZDNUkq0=;
        b=ZwJ0R1m3MSV9guI+1nuasZsZ3CnCRfPi/nktt558/ZyHfIDujNZKMih5jMcJsuw6mr
         lIFj+HpgnzA7WeFKqIxNDcS+OUv+3cse+KIGbmftNzV7qD6CGY/B+RBPpiQ53j8ARnN0
         4CLGVUAhXTezLKgo6H/rvHx0ulpiMqjU68eMXrXSkbjDLEAaRbW/0MAERgOEtEs8/gGg
         I1OJPpiI89XAlDg78vqe+19ZeE+qw2YOCKOgRP60BZrXEUEwBj90qc/I+qvB+7qrwfUf
         kqjusU5/Upt1LZFJDkEo1n6bHfXEadssa1Rf0e4X/f0JShzskX3NYOGksICF8rjCmoxp
         MRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964449; x=1778569249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTrt52egNPme2cgLBNhr7G7/5o5IRugC+NSDZDNUkq0=;
        b=U09Lywy3zDYEZ+foSJnxujg6b3Xwk8blMV1w3UrSsAKOhHDz8Tsv+MLSelDnryu2Ea
         rGGiyNjNoBPdaaWYZEHzyhUDQvO3yNYIdlT7/mY4F8XAMSKRYibX06jvnoUkUczHnE/8
         wrPDqMowdwMyFMsohgZ858tZUIw3d33OoLGdgnvX5kQWVOSHjwex43zOzScQmCdxpuvC
         hKp9jW5er8ktvJkkGhmyPheNPYWBey2Lvqr1HVcN/VRvpqpkg+l6Hh5rIxAQPHysBfi+
         p28bw8ZTT3UeAeMhbNg+amLPu8NnUDXDrm8jIYhcT0etYZO7FTEUW7sa0wsMWk0ecBdW
         aFbA==
X-Forwarded-Encrypted: i=1; AFNElJ9lNTVzUFRtYfXCZSQSDpwqKHgJNH98Gsq3YVja/l+dFhhxsyo1AMuqRavHMok2egi9QYtxBoVcdxmBOpVK@vger.kernel.org
X-Gm-Message-State: AOJu0YwXte/bu4u8LLTj5IUyoqXaXQnFGgOh2/ZpJtMvJIZba0/6i1VF
	Dn/OZJ8FhUR60CgJdrkhtFB+GhL+no69kxWbpuvKZSMqlQK44Yn0EtdQYaePSjb0mLPwVaeWg69
	4b4MDH3aAfnNC948PQK92RZAWaRj6mV1NX8Vj1XV6CSRc+ofD5+yP0HkwjJMlpvvLpLiG
X-Gm-Gg: AeBDietiy9VdmNsHrPSflxpZuZzNl0LnRcYOC3jkbmd3wJpKwIzsqgKpoXVMbcBlZLn
	VIZk6hia332H1edHcC8pF4pmReqx+mkCgT90vKbiz0dBQyV2GJzBVfVZjooetxfh8Qn1+NaVBEL
	G/Or3XWoTPyTIolzFamFvfKEG29/jqj/d6le0DVVtZlBQchXIU1IDHocdR9mAjsayrSq2CG2256
	unRB1PNAZUiC8tJrzf/8kCxmmiuxFGomkxYDWT89iRuuXz8FEwU+ioWWvNdSqD4Iv1t3X/X6aSL
	WOBZDlWYOF4UBbGhDW5YTFzK2eTVdV4uxeWpRykO8+Vqdxawq/ecISIkkwA9Yl9Jefkj4VPeXkk
	FwMytbR893IO7w8ARtSpBW+xJKJ2EXHScz6h1tzQA++F8i5mR7EtfG6w7eGkDWyAsFA==
X-Received: by 2002:a17:90b:2f86:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-3650cdda08emr12089698a91.12.1777964448570;
        Tue, 05 May 2026 00:00:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f86:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-3650cdda08emr12089665a91.12.1777964447971;
        Tue, 05 May 2026 00:00:47 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:24 +0530
Subject: [PATCH v4 03/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-3-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=7373;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=haVptpgq27xoiy5H+ghFCWo2lm0Cu97MuoRlma08mjU=;
 b=bZy3G0h1U+GGLGRzzqWucm2z2f4HazszlWBN8ifukLxO6srlCJmuuKKlud7HiHRbUW3vCoKeB
 6QRPnOjseFnAEcNajLkVD/Oh6Okei1pzRlxEE2V7Fmqrb8Iuh0FLYUL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: F0F2o2pDfg6kooB5PmNAvxHMk0CuLJen
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f995a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UwTKh30HLDACofytdwoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: F0F2o2pDfg6kooB5PmNAvxHMk0CuLJen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX2CPY5GWw/eGI
 By0wD2Dv40iaZwad2AS0FP2xMtTs8Mtyxh/NxSGs3cNVsn0RbIiaOKv05yVVpoKTBbKP0RuIhW7
 dkvMgN+AYuSZk0t0VHTaFAgEVUIjuLllf46lp4oJBDC1iqXnMq1RVUC9GyQqIBqKTunpsfJm2r3
 2ZhkbAn7Vzd/9ZyqggOjRCs2HTCAmwXnk+qD1RZVeJ1EpHWHexOnxs5yn9hSBkXH1eaXb2q3aEP
 OuynP4z0Rw+SHdMPJulm+W5td0rU2vB7T0LfrmArRGJKJSqAQxjC8+8ZPWDquFs/rsHir9SCAqg
 dstwSOl5Kk3SUGrSeY16yx2u58huR93n3FZoGG+Ymi35DQ23v6zO+c2eD3BJ/VF32uukVSv4N/G
 ml/iQttj2MzQS5ws+TrNPTepB9ajrqPYgiL33yfnAf8lZYPToN8vM/bWfkxuSSlSuatpOrrigUg
 8dom3ObGbHTK7aDR1qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063
X-Rspamd-Queue-Id: 947B34C7773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105843-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,aa00000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 205 +++++++++++++++++++++
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 2 files changed, 216 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..8ff02c302b07
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,205 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: iface2
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  iommus:
+    maxItems: 4
+
+  iommu-map:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+      - const: bus2
+      - const: vcodec1_core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/qcom,glymur-iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "iface2",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&apps_smmu 0x1940 0x0>,
+                 <&apps_smmu 0x1943 0x0>,
+                 <&apps_smmu 0x1944 0x0>,
+                 <&apps_smmu 0x19e0 0x0>;
+
+        iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi0c_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core",
+                      "bus2",
+                      "vcodec1_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
new file mode 100644
index 000000000000..dcaa2bc21db5
--- /dev/null
+++ b/include/dt-bindings/media/qcom,glymur-iris.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+
+#define IOMMU_FID_IRIS_FIRMWARE	0
+
+#endif

-- 
2.34.1


