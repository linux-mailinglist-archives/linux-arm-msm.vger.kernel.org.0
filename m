Return-Path: <linux-arm-msm+bounces-106750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DDuGAFNy/mmjqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3D4FCBD3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF503015E3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5A03624B2;
	Fri,  8 May 2026 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/oAhwzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aqh73mjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99312E5B2D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283087; cv=none; b=Ze5Z25O6B4WD8fymdSXSLdc7uJ1N2I4BZE0u/dEpMeB8sFXqEBA2E8JICREJCg2k1UiuxW7LchTKpNo+ddhPYfCcwPEblySMpFF+YFy9M82u2G/b/KUk+hl0KLQHGQimtqGHaj3ueQ6sjxFBHeSDaE6QfBEjpbs3TTDBUmQR8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283087; c=relaxed/simple;
	bh=no90MUHQf0OU+v05z3Y3AE5EXvbZVkBlvgnlrpROr2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVrvtB/r6iNDWrvJ8HSsIDAfFzSQCjJaBRLlSNhZkd7LRD76CeJrpQYLQ/lyh94FELi0RtGTkwSTK3t5jua7fg+Sbd02ie0yWuH75FNP9mVu2FgeqJHSIlB+oZTQw6Teb16myvrBLcYP/tyG4SVd+x15MrKsKuphOYhL+0S9Ysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/oAhwzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aqh73mjV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWN8m2335604
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwbXEeAHC8SP0aDjVXo+FanDybsG+kiz/tQjL0K3yW8=; b=o/oAhwzSJz8mtM2H
	S7G/xvMLv0JmW2No6S38mS/MPv+da5MONsh8OGxDswcODGCQTmCZ+MPHIORyd7t9
	/3/hs97kxdtcdAtrY15u6D51pwTemoVFSJkyfqYk2hUns69WsVN89BuxmyA79RJN
	iRS5zEEvf4RwkOQxzXM7zGzO0d26BUi1NHZIjg4/FAEaSvodO/I2rMyJlxhdP0og
	21HjUPcTsD1i6mMepzOapoE3BY7oPKSBqH5GuVJ26Kx6lABFHAShWdWLkE6vY/Qq
	tODv2/XUSJ0JyHrGl/T2xr9f0YeB2aXinRCMPeEbZZINqVZtYkvITTPsYDiS+c9y
	ODFWsQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh96fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2eebb099efbso185112eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283085; x=1778887885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwbXEeAHC8SP0aDjVXo+FanDybsG+kiz/tQjL0K3yW8=;
        b=Aqh73mjVOswZVPDVK55q3iZYcroNRDMy2zUh/qv6c/atVJkfNfvmJH+lKWqXlgwH7u
         Fp0VfECT6lazB+PhxFNOOXRLBdlS95ckp3qb6tzBgTavP8FNBuY6N6kithnxNWmQMB83
         ukcUCgj9fdGuuXrdjJw78DDCY9kbqO2ZadChqNKI+2A39j4Q4DGstZPtImgcu3dG6hmd
         wzeNxoAoal/J00Uiy4EZrFrIxWsqJbMVNmq0FIYR2pEorDyLRkq3md27YnmEQSzOc587
         j/AO2tSXnK/meBxVieKLP+fGtiaqWFozavTHedYGZnGfOrkxZQelcwdgeHP1vUFOW4hm
         1FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283085; x=1778887885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwbXEeAHC8SP0aDjVXo+FanDybsG+kiz/tQjL0K3yW8=;
        b=kysAA43kwGgKnIvC50kUwB67lVZYC82/U8Pd6VlJIb4RK0K0wLEsdzFa+3Thy4RSEV
         NMVxC0At1y07PwhN4dxU0qiwj/23ttFZgSMhmuvihB92xgL/4WTlZY/u1g/CBRYIVETp
         UGf6gmDxjVgOYe+0FqW6ve2afK79bhIWJTMt+2OaCs+IqQSU2Aqysl4DS5k2p34sqQfg
         re9PQP+RvjwHZi4PrMgchJ3aPWqBwZXhQd/0f8iQpkAigpAHGfZclwOOnEXxgm+NWtRh
         c3pEZOrUHu3GbSf27td3FptQbkI+ZsbHuc1Q3IxOr5j5uwmtUgULrGNc0r0bwEoLfOla
         q8yA==
X-Gm-Message-State: AOJu0YxT7Pe1w0oRt2VO7AyO7NoMpB8AwaqY2OeZBczLOHTi/VnCansJ
	n8NIhY81wbCs4xERLpI4t7Mk2FafiNDfXRFlh5+IbM9PwNUCvQS9SpHMKYvVfNQRdK/B5GUy475
	E/eudKhA6G07FbHE/SuLj8imQKR7gH8ekF5jgc0/+4DtH/oocEFSqm6j9GZwcu8RAiZlN
X-Gm-Gg: Acq92OGGoetBsiMrJAd+YXS4dnCG0PX6Zmuqx2hNP+bmVsVxhkrLnJKZlM5mTqe8cPT
	gJzLGRB6q4Dlu33RB9XSlyB5USti0YMn/LN6QuR7UstJyzg9XQ+qA4dGfyEgVyeVnNKBUMbJ2yR
	Hqm5ROBqAzDC8kgLQ3aPIpaFNnW5pu52ZlX6m0LuDRsnF4riNdvR3UW7I2Kws1+g9MckKaISNE4
	wWXQyuVZgV7KVFJgOg5MxX/u39vVOfNpUoiZreLEVpEeI3OU990OSLywbDbnIuv3K3Nd4pAskjL
	9GadFiCW71JHmJDFK0cBZU+n8AfWf9zpIphLSHJS68tP8Dd9GOQoN07Q3RZHwbSzf3BiHHSTUnh
	V/Bc1aOMAt3oOtTHvAN02fuZ6UZ1MRYDUpc+jN2oJA39dmUsJQki2mVYXcjc=
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr7510181eec.29.1778283084553;
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr7510160eec.29.1778283084052;
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:23 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:16 +0000
Subject: [PATCH 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-1-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=1781;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=no90MUHQf0OU+v05z3Y3AE5EXvbZVkBlvgnlrpROr2E=;
 b=tO6uWy+X+tZzhjn+/j0qZ/Y/Ny+1CtFS2gjhlSZhTzgMcZg31tcl3JpFsasFR81cTL5VCrKVp
 mXJy+hZ1voEC6eqhAPaohuGByvlM9hLylmm+H323MnAGZ8R/7v1tbhs
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe724d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZPVUbJor9CvCRQEu2k8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: PiV1-DojFu95P-A9q2wgEDRLZJZS17PG
X-Proofpoint-ORIG-GUID: PiV1-DojFu95P-A9q2wgEDRLZJZS17PG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX7arTcV4wI9l2
 6iviKAFO4rxRIm87KPpaK//7ywlR1sZqeD7PG6yGu/lA6Y9ckbDLTNNZgAeKrkGwzuRm42d9ldJ
 5kxzX/FeG7VMZMg6jzpE1t+dvYPU1h2ALEp3zEKbl7cLfpC+veq5tnq/cHoRRgVQRuorcgYOpOx
 o44rcxusp408GMbVU0XPYhH6MWR/iUQj55tQB5yltxcmjvuWSAAiwiGoe3rzgCQTwF/honicDfi
 fkAHqSJ4sWchyZio+Bn7GuyV+wj6NtKyaUnxKiI89WrBKJceQ9qASsQAKBXvZDwCgi7N0vRHIs5
 PkHejwtmhYHGeV45eFxufbJjmXGiHAgJqvKHGtdf5bqMiKwTJ0hNJt3RFM/Z5GEhYvAsPWLIM2p
 qJ5+qnvfQf6Sypn+6fSQxJcRNQQzRC/yLV3bWBbCXBRSE51l+hn6e4Umlp9DVSiLDx/p2MbG7Ss
 6ElUu4/RZTFnG4VZ7Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080232
X-Rspamd-Queue-Id: 4DD3D4FCBD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106750-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..9e9e34a63bef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,8 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -183,6 +185,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -208,6 +212,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1


