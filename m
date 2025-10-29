Return-Path: <linux-arm-msm+bounces-79512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC42C1C741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB7A9602BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1579B3546FE;
	Wed, 29 Oct 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DT/xK2qK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHWVSwhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025E33F36A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753671; cv=none; b=iQ687emzFbAeJGfEEdT6t4l+SCKGPRr9tW4t94mKQSUSEsjgte6qzeMdFuwEul6NGmHYvCyRtRPMKgt/yuVT7o825CNYixZKTUFNZ6a0FVcE3zuEm6C9gjCCqQ0RQalbe4lz9nQxjJ+ktolgkpu5x8ZnsAEOoXX9VQ+Q/hjor0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753671; c=relaxed/simple;
	bh=TILMcgRj0kC60wf4eiNeL+x6Ppo3TKOdtnZW13u6rEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UeuzS++kvgX6oKQe8Ds8//JxKSj0PEUdNFPufquGfy00CUUjdyQKDxAck5UtNAfASVnrrODqRMa/2TJPNrq3/Y5jhAMiWgqpcIf8PiAG+sKNtL0Wy/6Wvi9eKO0fHATzPX6BewUcHDRZ5xxsGSZw3WsdMaBicCLyKlq78pIw/e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DT/xK2qK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHWVSwhg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TDcxVN568009
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kkVD4J5QeGsAGYyihfrN5ZhJkOber/W0iUx
	3w/k7ZD0=; b=DT/xK2qKa5JtmyI1WU/9Ici3j/1AerHU2c72sfVfVIUjIdXfN+Z
	Qu3g7J7XfnuaIlQZue2mW4RaMYRams0Z21n1Xa9fazra/g3n/aznvtF/m40laJSc
	ypwOyATWAXTDhkil2GdxtRkbFB4jtjN+AOFRcWF3vOLdqpPFhC1uq8QwPqpV9UF6
	5PjtMMEVcXpGmZKHwmNoDJv2pD4D0mzOVUU79tGRa17Jvbgp7dATY5ZpkjtcDB6b
	nNdxD78crJTnHXodf7ib9z3tn44kmIn16lWjynDOevTrbSnw5M/ipqoMeXyTQ0LQ
	g3cvp8x63xhDvSpGTjq0Aq97dsQBEY2fZvg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bgf7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:08 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5569ecd7afbso29576e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753668; x=1762358468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkVD4J5QeGsAGYyihfrN5ZhJkOber/W0iUx3w/k7ZD0=;
        b=bHWVSwhg0KGWjSDQWY24C77vKygdjW6Rp3GLrV5PMeyCDKrJJqgE+fyLzqhvHSzwqt
         uK02FWkI5A7N0HU4KSECWEoriCswixnwHwUQ7jNw4oGaGGgZDsScG5sv4tQPqTDQfvfv
         4fIMSggkNxOW6/62z2Kw2HCdjsRppKw8Z3AS2QxL0OFsEAXxT2SxKP22sV7E3Rr4/9vY
         02St6K+EsCAmfV5WWELSuOowKVEFgNVClRwzKWCPg71IVOH+BrkmJIxoHk81Og1Fy8pe
         YSlRpRz+8tkv9vmCcOX8tgm62No1HpTNKu7++lD0TiJ34CT5YaaWfkaMoPSxTQCc3OeM
         uz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753668; x=1762358468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkVD4J5QeGsAGYyihfrN5ZhJkOber/W0iUx3w/k7ZD0=;
        b=b6vgm4mzBOWsxo1n9ocWxI98KvPUsqRXLMb6MDe1dKeR9icpN8Y+2WZhRPSg/d5w3h
         Po284Esm9M0PPw3QUvSolJCCj8zzetgUu1z1w4G8HhiUcd92S2zak3KlxEJgZLl/T54d
         6JINjCxAvjPoKX10/6KN+tFdcJHqNAue25Cv9EQeo2dr5lwDqrGmUAVaupxe78C0j8Me
         NwYw+XdcTsarEotxJ2jMZog/bXqqHr3KktcA2b6CSnel6iwHcahKCru2rlz6G5pXyRK1
         dFpfRbjER9NX39tY3Fg/EvggZDquLfBc8DW79fCRhmy1VRYiLIelbovbVXeOd3QT1HyU
         WXKA==
X-Forwarded-Encrypted: i=1; AJvYcCXOhRmfcILLTYYnz4tcu2lsI/trAfgQVc9rMsBM7CDr2RTDgv+ZGdS5/bhU/LTwTFhr1FpUZoMbL+ArVXsO@vger.kernel.org
X-Gm-Message-State: AOJu0YzQYVJRwMYLsHDQxAZ4NxBtRGGDKcnU8wTFNQqkAsC4YUZq+6K8
	f9FaCi/SYZ5m9bqRx/sVIWw3lrxbdr/C6H6fNZkVS+3K5WTY0oUi/Y/3YNp2rGfG2SgcS1EYXN7
	CKRmv10yM83EYCsTzlE1nhrNQPGPMMVVv66IXkAY+KgRDXQGxIJfnQCRzwFeMoQzmYDrL
X-Gm-Gg: ASbGncs2ZI0seNSgGDAC9Qjngvx48VRIMiXmQPwApogkkCN+FmhfqD7QHXD85hgNKg2
	u7Rpo9H/cW94KymeCVQ0QL/orCajexc1fqKL7kFw36/6IGdkgKYuU3d7ygRKrLtQmW8lKIhvTBS
	Ksv4U0RrL3jPDLHWAsJuaM42VvA9EFKHcaIcabgEYZgW/Phic8oVV8x/sd19Z9jevzRR9vxcAhx
	ir6Btuqg+C/jMJAdStrTJLdCLv2NDSdYVKlgiIevAHSGfkHOJCBwChmmuhz70iIYewanJqVqrLI
	BuedxbOoPmuxM2jGWG8c/TD+ZwK0exhkYdBHSDum6jj9rp7TlgJGrZLDY3UOIS6ghgadaMUlxDU
	NbbVxu6aCPFBA
X-Received: by 2002:a05:6122:4f93:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-55814168731mr1307445e0c.7.1761753666715;
        Wed, 29 Oct 2025 09:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjTP9FZKurkzCHatar3BEeLS2nx9Ae/R1xxfOgAjHIz1P4IfYhsPpkU2tFJSrFrwOXmEN0IQ==
X-Received: by 2002:a05:6122:4f93:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-55814168731mr1307352e0c.7.1761753666080;
        Wed, 29 Oct 2025 09:01:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: codecs: lpass-macro: complete sm6115 support
Date: Wed, 29 Oct 2025 16:00:57 +0000
Message-ID: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ld37KdJK1RF9Y3VaPCtBsJsvmPJkqha3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfX7Rc1Vq2A+2OH
 MbzNFfctGWLb+7cVt4QIIy2YguNrGwkxn+xEvntp3dUJXtKVBFyFOVhEnAlXLHa23l7OG8iEGJS
 m30/dAAWZZSg0Hp12gfKQx2z9Qhgjk3TyAE7DmGB8s6x8RgLUb7soco3wD0VwmliNXcZBm/tVYP
 NSr029rhdjCADeaj3BJmTZC11/+EZ8Su5EkORYqemx2CqxHwPMXV/SQSiz2eXHcZyQZ20V3qg+1
 7FFLy0iQfMxTn0Yh7MEPPR6+EoD1vctgdD8nyT0UZIvRjOz6IPG31xFrvMS6Z2SLmVqrJ6CJ0tJ
 o6F7dd1UsWhY3+unrSQtjwTW3WFG0yrnPFO0GFFQqkA3bj20HqaTsfOZpbJy/Osy2trxv2AmjP+
 +in7ZW6atqlrg7GhRgKB9TD3iHCzLg==
X-Proofpoint-GUID: ld37KdJK1RF9Y3VaPCtBsJsvmPJkqha3
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=69023a44 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1oLurHACul6UgZ_C9z0A:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290125

This patch series fixes SM6115 lpass codec macro support and adding
missing dt-bindings to complete support for SM6115.

SM6115 lpass codec macro support is added partially and broken to some
extent, Fix this broken support and add complete lpass macro support for
this SoC.

Srinivas Kandagatla (4):
  ASoC: codecs: lpass-tx-macro: fix SM6115 support
  ASoC: dt-bindings: qcom,lpass-tx-macro: Add sm6115 LPASS TX
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
  ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA

 .../bindings/sound/qcom,lpass-rx-macro.yaml          |  4 ++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml          |  5 ++++-
 .../bindings/sound/qcom,lpass-va-macro.yaml          | 10 +++++++---
 sound/soc/codecs/lpass-tx-macro.c                    | 12 ------------
 4 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.51.0


