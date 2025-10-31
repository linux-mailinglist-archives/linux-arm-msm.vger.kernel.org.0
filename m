Return-Path: <linux-arm-msm+bounces-79871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 538A3C24D6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E0D14232E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7AB346E7D;
	Fri, 31 Oct 2025 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8rN4qxx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tr1VXJl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0A3346E42
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911305; cv=none; b=tXN+Ye5cNavf1/7u07YRfLXR7gzqKXSOH84SZwVqc32B9rxXz9y4/3dVm3dBu18U9de0spuZ8qdNJggm3SEO8O7agQ/cTlgCBQ0c+nnV1ncrzxWd52x72gF7YLEdY81nAe6TGqprPsPxWA/eVoDO1wg0SsYLgUG6QgWHiUZfqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911305; c=relaxed/simple;
	bh=dItJdgHUJs1UViTcltNYdVRQKbflbnmQjHFvKJeVGJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MqIDB2BODbSyAr5cK9BPXVNia+kANj6R+SNWqb1ry07+6Aai3gPBxccDGtpnfbH4vQ8IE8xwcWcx8fl7ghwFUtLZshKvPn8V1qR5dqYtEngC12T93USMmcAP7bfc0ioPLe3G5Ae0RGN4ALJmhuW396HtLgCeCqzX5dZR01I+vRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8rN4qxx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tr1VXJl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7oLFd872685
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CREb++Zs7HHNjOQFOKPIizCrDGl0LQjv6t/
	Y+I+Q4V0=; b=P8rN4qxx7VmSIKd4cYMyGrZzDcDD9V0DO+LHGZYh6a+YBb0rwOn
	qFCnFDVV0NnL8VALMM8N6X7Ye1dY5x98HJ0yddxuM6VtQUXclxlCGQISmfqpl5WK
	IIcKJiPxfSEdhjxlhFh2PHuvD0W3mqOrwZ09l0/bn1vQXo8Abj04kk55oAhBhLna
	fOc6M9gAdkN4cV8SXgoXMJgj9rlberGWiXQWFCzKgU7dzi3S3PlDaA/KbxzQgy8g
	qtuinX9CWMNVpa8d6ImwbI+h0xrw+kVsMXuCQkw8BB0Tnf7wuXWF3SlKcuJGAvZY
	8oShi3Vc49EJSBHBy356qTCbcVlcy7zz/+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn20nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so26989221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911302; x=1762516102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CREb++Zs7HHNjOQFOKPIizCrDGl0LQjv6t/Y+I+Q4V0=;
        b=Tr1VXJl0FZVkD+0rJC2o4jsnuKafhMOxaRJDyn3rNq8Y7BtCrFOSM1S5BDPjzFixYN
         aYrQYjAcA3QKbwts0vkDoZ14i6G2wdhVSsng3uuhOQmS77agCekAerTIF+YcvlngjO/P
         /1vXSiGMpHlcnrR+g9zgFVYuZWeicVy+J3IckL2+ureUrYJ1fJZbG8iDxztMEm+YTiEK
         QN+3A6PGzc0cPpEO1GNoqsJ6NAUkAJs2/sAkE/NH7wYNHTRz3wafaQPUAoRT4KZP/tk8
         XEtbzNP2FC44d96FhdnxSkr8dnuWDwgooEec/H3faaAOeJMMdFE/81NP68fSJzU/1fnt
         SONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911302; x=1762516102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CREb++Zs7HHNjOQFOKPIizCrDGl0LQjv6t/Y+I+Q4V0=;
        b=LiiVoraksoIcj5qxspwP5SpPAS/ySmG8vBtVLRvCUbGtMh+z8IFx5aD27iH84DUhLQ
         1mJZ+MCE7zRaVe/q+4xzx7XEB9P0388sOS4UdmhFnVXnHv0Bhu1WkUi355zH9rmK8Ev0
         TN893mBynhEddzt6thy/5gzQmgXEM4g2kQs9DhPGbWYLHG2cWQXWHtcqAAqRnbMNIW3c
         5APW1w1bRYv1v+C1a+mUCUadAoBebmvcYbJfyyFKeFAMMoRJZIgjbNzE/ynAmnNj/8LW
         ud5m+B8W/nAz8Geg82Y3f0zCfAwtoqMdHVyT1Ppe9p73ZB3VTmIngq6ViXt8sof1czON
         gQOw==
X-Forwarded-Encrypted: i=1; AJvYcCUjoRgdTqK8zu/WJx2NHepnNFnlDks+BAQ4VAv6m4EUn4XAVCpO9rGfo3AJVsGv+wxmypKMegka/wOBQ4ZX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaw3RLKqJrcZ1nS3SNxByXkF7uJjq+6/rMz0/OOvC/o3koxF6/
	1Cmiz0ugQ/4r5TtKIHnWCul6eww/KBlsMde8wEp9f92XNcVLip/sbm4oMJ+9T3dFhbHjErYy0+J
	wTbGMf+0yxxNoB7GGmZl9JR9xR4AGEGcQS24G+yCO5BIXIUE2rDMhhL8HPXLukCQb5UOO
X-Gm-Gg: ASbGncu6VyRl5/CYweGEPPfy7fxVyxtzmzyHe00folIU3bzRPQJ2QYG4KAVxP46ocxp
	vaoYKOpQhRhwLWZ5YgdW1vYCU2RhdaGgR6aw9tBbAmB6S6h6V7zDNFvHA+K2rQXeQjdFx9amzw4
	E7ZbJ+aeRV8f4In2MMKwtaTTl4EI2Jcye3+GJGu74DJKl3AbkHej4YxBL1DNJA2xLYWdATD5eLr
	FVdmpCk0K+eKID3EFDOyNPPcZ9KYj5jAtlW8UuKpeUS92iDawnrUcvngZvmPNzUmUxNBFnlHxuF
	ufzE9ktL3r3W2ZwN8ETOS5gPoW79bgOV4XOsWuCaqmn7wrYo2EkdErm0FaKxX9+K6x7FKR/s5Hy
	z5lQXCxJWIGZT
X-Received: by 2002:a05:622a:1a0e:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4ed30e17a3amr35245191cf.34.1761911302350;
        Fri, 31 Oct 2025 04:48:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrLMBqXq1lpss5fYYEYEBdkpGMMktplpYGgijhBBMxwiDCmZvkiKiAaqFkPlxpIxhU0z65pg==
X-Received: by 2002:a05:622a:1a0e:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4ed30e17a3amr35244861cf.34.1761911301871;
        Fri, 31 Oct 2025 04:48:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/6] ASoC: codecs: lpass-macro: complete sm6115 support
Date: Fri, 31 Oct 2025 11:47:46 +0000
Message-ID: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6904a207 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XNMdb2pSUVPagnxhOkYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Ci6QHLWKQzjXcxb13CM-eusOnpNRIXDY
X-Proofpoint-GUID: Ci6QHLWKQzjXcxb13CM-eusOnpNRIXDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfXwvm7jz+UHXn+
 iQ/FHdoIVtIeNGBBCEfG1zspngShMuwIuTp8ho1xW6zxHgIQKkgAuU6cl4V5c38fkzyuamTk8p2
 xHlTSr1VxjgXmIrNHXfAWtBqzpJ3x3BEXFU6FPcE0YWhM1mIKOLdygZJz0vGW2L4uzz7cP8q/gc
 Frr/38vyjWwR3KjuIyOUVz+KXgXx4Rfo8IfReRYMFFXsAZDhy3dTguGS3n2Zqh3xL5TPGdnblg0
 fhAlMDdOiwIuWbFfY4sdel/jbH/zflS8hggBUES1m3JC6r3d0KBZ7eZBmeLHNHkVSMzsQk8dFql
 yWy5tjNLXssew3P4eii+J4wdlVRfNQp3CJzdhrMAbemNBjXMLPeywOZKfwZvybLGIq+rnPTNRHb
 YagfUXDbZe43dYB57g8CHnX409hYBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310106

This patch series fixes SM6115 lpass codec macro support and adding
missing dt-bindings to complete support for SM6115.

SM6115 lpass codec macro support is added partially and broken to some
extent, Fix this broken support and add complete lpass macro support for
this SoC.


Changes since v1:
	- cleaned up va-macro bindings for clock-names.
	- cleaned up va-macro codec driver to include soundwire reset
	  for sm6115
	- updated tx and rx codec driver and bindings to have a dedicated 
	compatible due to changes in number of clocks.

Srinivas Kandagatla (6):
  ASoC: codecs: lpass-tx-macro: fix SM6115 support
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
  ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
  ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
  ASoC: codecs: lpass-va-macro: add SM6115 compatible
  ASoC: codecs: lpass-rx-macro: add SM6115 compatible

 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 18 +++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 49 +++++++++++++------
 sound/soc/codecs/lpass-rx-macro.c             |  3 ++
 sound/soc/codecs/lpass-tx-macro.c             |  1 +
 sound/soc/codecs/lpass-va-macro.c             |  1 +
 5 files changed, 58 insertions(+), 14 deletions(-)

-- 
2.51.0


