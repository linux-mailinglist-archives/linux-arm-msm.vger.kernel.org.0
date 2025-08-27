Return-Path: <linux-arm-msm+bounces-70978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74AB37905
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 06:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34201B6224F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 04:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542A9273D6F;
	Wed, 27 Aug 2025 04:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfcQomCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951C426E71C
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756268451; cv=none; b=gnCz6z9IaiQMBkwGd1VnCDhxKTtgGV8hub68j4/+dXmGCDrMH3kZUw+qA7BJL9ln+Bdhb1uDHcnw3CI4L2d1t10YJABc2rX1u7VVRlE0jBKxON5T+4nC1iuZ04nSMldSBwHb+w5iiND2Eli8h/2n9EQACgjbWdG/QjCPv9VliJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756268451; c=relaxed/simple;
	bh=MfMFKKyIqzDyAJ93CB1K3VyONPZAScQiZmkk2FhVtsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cGgXEWRNSUFeTsvCGghR2wTg5vklRlZFRDmvFhBEWrKpPpbolCUUtTF1Uey33NdNfd+VHDrW3vg49pgaX71pa0WzA0zHLaFfqQhSycDeGLAQUl4mKnGcFD02UP7Z1Elq4qBUh6ymLrDtZiO3ZnGYPU5LAYPHhDqCNE7cd7j7+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfcQomCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R3nN1A027963
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T04OEWuWzVBwomdwOoyEw5q5260zvNB09Jp
	MDzKCKSM=; b=XfcQomCk0c62Pro2ehA+rjbmXTTnnLX22TytPVn4LIDxDi4uOWR
	ep/3xdPCNNPFLz6DrYHBDPuP7tjpSIobUwddpVSmZpYD+zZnO2EptNXnoVCYgThj
	xo3sKAUoq8fqBCxOHCtlPmSbWkkUVjOg45wi/z8QmEZ9XaZEXGeFMFAXdkW9OQQB
	aQg5BIi/c+b8hMC9lTMErncFB9muD00+5UcgtOM64PdiB9Fb8qvMnP7LYCA90ymj
	TtkIzWsLT3qj2zq+VyCHqckMAf2NLgPCEEUBJxWzjQxC8xU1bRdu7N4N8RhyiFGb
	BhpPD62QwBgobdADzBr5EiLSj+/QGKC6NjQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8ahmb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b474b68cff7so5050617a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 21:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268448; x=1756873248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T04OEWuWzVBwomdwOoyEw5q5260zvNB09JpMDzKCKSM=;
        b=tDqXPnLPGFaAgZlSEq0mJX2ndxx6KGP+4CRI6ev19Gz1TjyHjY8jAz27NN9l2J3Ju9
         k/zNfFwjamJdXdpr9Op/pCsEFA6ll6UYhC/wK5d1jMtYuyEKuvUuDNCcXDgMV3mxHNfq
         ZCGlacPpdATjnoGl5a+uaeJ9ydpQhhN4YQFndYhWoI4HsIh93ZhBKetgCIlcS8ykBgto
         XvJEPhhMbpMO6s0C2is2LFz08k+VZmnLORcbNaeOTliUh3wzciyzhngj3HlJqakMMHbu
         XfxWDJC2xN+f+qa4IxxcuYOZuxyRAqS9zT7Urt+7XTPPgf5WDajsxPuUMUz52AkKPai2
         Wb0A==
X-Forwarded-Encrypted: i=1; AJvYcCXM26gvg6C95MdZrNiiBbyEpoz0RjcOCiV4hMsFHT5KbyEGy6u5N9769yNksFAbmNKmpCcEScimVwEdXIUM@vger.kernel.org
X-Gm-Message-State: AOJu0YxWR1Y+XZbmkU9QjLU0CvzebvqbuZLbSY27gd9XnY5QjDlSj6Ht
	cT432bGkGPeXD7IVRPhEen6ZXYGjLWlUyyoK9KN0FQy1U6bHSOpKnfd99l7uR68qJaAIi9wS7t9
	gOI+yhOCbXv6FusTMGJllMgeP0oFu0bPuc7w0p7NvFuA8aOXyvXpAtu9R81qJCZCytj5o
X-Gm-Gg: ASbGncvM5cobQYQuzreoa/hB4ubR7rPXIp7ChBFu2LmhiDd58fl8zl48TjAwcz0taFi
	WidBicT6du2/NNXRUqXRvETaUS3oFVo2dZz9StteCp3VDj/3J2Lb7+F2hqN1XuDmfpvSJHk/gsm
	i/xEJN8hPVoB1QBbe0/aN6POCrp5SXXhOY1kFw9dp6xupg+hzqVfyrMhZ7F/EQE1EAw2jg+u0I0
	sBL2MoYYwPtTeZZ2k5LNDKc32RekhboCsrqjfB0zgYdQI58lRkDwgbsjCQjLaNTtWB0wAJZ4b2S
	FoecugXgcUzlv+2LwFMjxT0ZbPAYGyVoP+MyXLbxkZ28oJBYaceNXMsVCiWlpBzINHYOPBvvHu9
	XJyY2xT8+R307DvE4NOeg
X-Received: by 2002:a17:902:ec88:b0:242:9bbc:3644 with SMTP id d9443c01a7336-2462efacca1mr280998305ad.54.1756268447944;
        Tue, 26 Aug 2025 21:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8yeApLKgwQ0EGKa3A8XN1Dc/sQ57Z9I8ff+HMTjh+PnlsLYqkDSMbe5YRBoxsIlMbA/qSA==
X-Received: by 2002:a17:902:ec88:b0:242:9bbc:3644 with SMTP id d9443c01a7336-2462efacca1mr280998035ad.54.1756268447437;
        Tue, 26 Aug 2025 21:20:47 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f4072ac4sm4323076b3a.34.2025.08.26.21.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:20:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/3] add sysfs nodes to configure TPDA's registers
Date: Wed, 27 Aug 2025 12:20:39 +0800
Message-Id: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68ae87a0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=obe5h0f5hI_ELFHOeysA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX39Mos0kjsS49
 4hIgTIQwz5lhg/qNjjYiI8jUBP2T2jjjwi/dA9cw5oaOSSJUb/L2Z+TnR66RBM/L2UxRgF7FCzY
 1kd7eNVbjQSUIY5aHZZzB/hVdtc+6CmE5ggXkm7yHnfYV6PN9eDbwYXLbVUSU9Usk/1LB0+JDWF
 Dit9Fa1jGtgl1DkFh6FH7Yb23oIJrBW1Nwlu/IeKsFn0GG5xYUbpYbiIzhbO3WrfIUQkBk4WDH0
 g52AclbfP8UNnfhn09Xku99kKNOgyEDAUljSvRZSobTiH/bePj8mRoIilTaoE2BdK7pCyDzg4IU
 q1jF9Q6XbpBpgZr7M9XyBcIIpXH5VVtw4LOavo0B6t90TphOLY6vLG6grzuQyAvb+qP7U04x3QA
 1i21a+w6
X-Proofpoint-GUID: 8MAy5bnlKEfZu4rNgH3SU1x_KFrYL2nU
X-Proofpoint-ORIG-GUID: 8MAy5bnlKEfZu4rNgH3SU1x_KFrYL2nU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

Patchset 1 introduces configuration of the cross-trigger registers with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Tao Zhang (3):
  coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
  coresight: tpda: add logic to configure TPDA_SYNCR register
  coresight: tpda: add sysfs node to flush specific port

 .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 276 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  35 ++-
 3 files changed, 360 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

-- 
2.34.1


