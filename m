Return-Path: <linux-arm-msm+bounces-84290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 394D6CA2562
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF9E13057588
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FE530101F;
	Thu,  4 Dec 2025 04:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfmkRvPc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBoXuF/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0070523C516
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764823395; cv=none; b=qHp4Tx1w8o77+nXVyaaIlQF4QdM9zvfOybZoeJ3mO9DOYZyHdGg9w74CdGFt/kk+W5r1s3OpiIhgBxY+9BNsxaL0ijporbpPTfTI0nbc8dXvwR8bml+pHgyuBTzJ+P2mVAd/CCqdcQfvzuJNqa6M2jPLOBVEGiwYE2XbiQEB9eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764823395; c=relaxed/simple;
	bh=tBet7xd9Ix+7i7/6lFaf25DY48b+0wTDWRETSg/THcQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lRaBjjTIx9ztJPKw4YhoZG5r2Arl8Nk6DLgn4iBmCYhntxFCECUUtvuyP/CLTm+l7SK9sMaPLxR1OES6DLN86bHZamRQV1rE8yL8AnZ0nSYzS9bnfXB8PIVf3mSNqf7iUeyNKu/EwbiktgcAnObYWarWnNWLMkXAUjUXlSz7fmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfmkRvPc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBoXuF/J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3H0ePw1969575
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I0tZsr+X9rb2BkuKPKohL8
	wWGapUv709og7lMSnyxu8=; b=BfmkRvPc8agafeCKP/GA3XZ7lToaQn3EvMek90
	5J1SqUfA+2dZKX+6dGWQ4cmfuxdFiAhAj97RG2Z2UEgZ9MhotKk/49bAksbRuHcC
	nUi2ZypI5evAicniL7Xn98mndzzKLJ8ASAsBodggqJ1FRYf/uZnl+5B95uVlSg3M
	sSSKDFYtZczFQuBF/qpR2qiJUc/IN/7lfaihzRZWREqRBprAKnzv3paJIg0bokZr
	nnnwqcfA9lbp6gZv3WpD1L9V8AeWsNB8bQYSFshxKlwOBKuFVxj+R4FoYt9RAd9h
	JtNslej7vhakGhcStnbKTgng1kLSyPRJHv1I3oiqeilblcJw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs330g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:43:11 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c75b4d04acso1031906a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823391; x=1765428191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=;
        b=SBoXuF/JqXiNYpXuYnQP6T/Dtiz50XZE2EGWhdQbutkLyWv4fjVndYvWbQKSQI+0e7
         eHtwh3Orz5mGIp3EW/FjXDkV1CEB2hf1JRajWhL7o5CwbS5XysHHao2JjgvpKGjTlNpM
         tlIhXpS/vXqB5ys5eXAXGjwGA3X+LguhgfrC4rECL8Uk8VE17+Vy1y04EDBqUzq+QUxF
         XiXbMYP1YGXwBwerrFfKk8+bHNYteQXwDMDXNDFMjTsRlS5rIfZKCy37329NCE4MpZl+
         WPjEBAwdXnzDHo2qiZp4c2VPs9TLju1LRvN2Gqeu4mF5ZUcxJLLFK1ZPKSiSjeshbOCT
         NN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823391; x=1765428191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=;
        b=HesjIf4noL+FV6DVeprwxnrWCg6AYUVlSAubIJz04ZeboTbOnWIv+5gXaFij7Tp8bI
         NXiTtMBi6t4rM+jdGzVfkHv5lO8EGW4Xy1C6qm0L8BQaQ5Z8XuzhfXGFMnRnDmv63Zav
         3u/fpg544ZhSEiHdMGc1f7HvIG1PxMBvlc07d/wgFTtE7hmFiXqltcK67bTRdbH+f8ur
         ZnLEbFBmIRG2KnvNM4ZVraPADWrAmRxJgBJM9eBVcnCbxwKRCrMhT5bDFKyprumiqhZU
         eiPF5lDmV7ATeg+2G80l5UG1wlcG2MTu6w86w9CDtdDTuFIC7yx6fJfT7VHXCrv7GDNY
         jI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyVaHkhSSJXgG2iP5mnhsVa8gFwXChZ8yHCFxepc9W31srDNbfAy698/eWExbThf5fJcCN+jPiFRoN5tdg@vger.kernel.org
X-Gm-Message-State: AOJu0YyiATf3HSx2HsSsAzRQ0KKjKd/eJKZ7gloFnYbIdWPUpu+lKM6Y
	etevQJcwniEXXzIsCt1Y5Y7LNEkw8u4cSQgP+aAVZ04hdxlYbXmyCHjLDv4ivIoplV/qY6wRjd2
	MI1Md39XWghFFzCNmjmuk9icD0MJ+ouDd2awJPBTXZcwtyTXM+E+0TczTLim1ygOoTAnGxyuDxx
	BZax8=
X-Gm-Gg: ASbGncv93wcyVk6bQsaRGhWB94vL5xePGRo38+P5UUYvif9YBeGeytGjx5R96qsJegq
	1rwQaO9cN8fRoFjXjMcQYdpu/on8wCdA2rhzZOecJduQLxNTKPpC08Sq0eYwL/laUgUU1Yu4j1n
	216ZbD4YC0cR0xGeE/gm3rIsFS9dnF/bUMDYzGy1KtiOZCo952khZ6C37KsMUJuCdrSdDmhORcQ
	L8Ko8ZqRkQdJWEAqQACnEi6bJzzYBrZ9gWc4lbJZX04JdDrRqWHi3wZB74E8ILkq04PImBTNksS
	Fb8Z+yrFPSfDabhc5En1AUhlqcFr4+I3ETp9Hudar7Zck/j1v2gymcF2epb0P7uDrl38SWIWfGV
	NgnbH9SnnAH7xMk9e6rSRb7kWCuCsdtp/taO/brNpDJuc263gM76R7VrN9Kqs3Pj3ejw=
X-Received: by 2002:a05:6830:82a8:b0:7c6:8bfe:f5e with SMTP id 46e09a7af769-7c94db3f05emr3514922a34.32.1764823390817;
        Wed, 03 Dec 2025 20:43:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW8gU9SGAOFqdeOOxiZRb+i9FiBVHJbuzeoo5KLUW+sLNoIN5YvCzAMAGiYHOOjWH5MA/qIQ==
X-Received: by 2002:a05:6830:82a8:b0:7c6:8bfe:f5e with SMTP id 46e09a7af769-7c94db3f05emr3514904a34.32.1764823390412;
        Wed, 03 Dec 2025 20:43:10 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm213766eaf.7.2025.12.03.20.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:43:09 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH RESEND v5 0/3] coresight-tnoc: Add support for Interconnect
 TNOC
Date: Wed, 03 Dec 2025 20:43:06 -0800
Message-Id: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764823388; l=2209;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tBet7xd9Ix+7i7/6lFaf25DY48b+0wTDWRETSg/THcQ=;
 b=liS7F1EO49CTHomciNgURMU6I8L0j5wX8w9pGISUp+pHU8zh9jliKXP1i3Q/dIVu+LzYg63qF
 fdsWJBaSSrTD9NJGIcf5f+naKhU3A72xiiuBMk9u1fhha9pKips0SdB
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: _1CVtKS6_pa41QSOBTRtSXl6nr3QGwMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNSBTYWx0ZWRfX71lHtJzZtImq
 szjCNjSvPe6cL09tUTPntSWPzHEIDhot9yL4kPO89wzvibJ0yPCd2TmNkAZFy3/JvsZjkKZjDy1
 jO8k1DHwJVPm14ZK3AsPSIQXg9PQQDq/KDSPyFr1P0DHW3W1EjZsJkmnErpu7x33bHFwl6fg6QQ
 AtZXKkGsLeFMBNC0i+fRa051OFij5ruDkbVN9LP0t7oztNBMEF8ZCARqvCWkhALfrU1lzM/XkwA
 Ptdq50hx4HXlgQEGDpXE1eYKuuoT/3e5K0AZksv15qQHRbQjVyfh5NVCWgmZUJuiY/lGSj5xWmd
 EEUwgepRnfzuXgQDp1bgx8oTjYhIkiqBLSKkkUoMRV/xUC7en0UH8Xk2oFTD6epXqycX/cmzL08
 DSK+OBfyG9vRwfvejY3fu+Nf8nAAOA==
X-Proofpoint-GUID: _1CVtKS6_pa41QSOBTRtSXl6nr3QGwMT
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6931115f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G-CQVniXWX8y_UMPSkYA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040035

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v5:
- Add the missing review-by tag for patch 3.
- Link to v4: https://lore.kernel.org/r/20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com

Changes in v4:
- Fix unintended blank line removals in trace_noc_enable_hw.
- Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com

Changes in v3:
- Add detail for changes in V2.
- Remove '#address-cells' and '#size-cells' properties from in-ports field.
- Fix comment indentation for packet description.
- Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com

Changes in v2:
- Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
- Dropped the 'select' section from the YAML file.
- Updated node name to use a more generic naming convention.
- Removed the 'items' property from the compatible field.
- Deleted the description for the reg property.
- Dropped clock-names and adjusted the order of clock-names and clocks.
- Moved additionalProperties to follow the $ref of out-ports.
- Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
- Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com

---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
 2 files changed, 215 insertions(+), 11 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


