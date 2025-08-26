Return-Path: <linux-arm-msm+bounces-70814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B0B354F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 65E0F4E052E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 07:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2171C5D4B;
	Tue, 26 Aug 2025 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6MUGUlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E3257842
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756191720; cv=none; b=NxdTT4wOClfKI0kaDeOchOK11E2fMR3EoHnpwcj5EZey1u1yiqyYg9bk3ZGK7e/afyb7mtdpDJF7/DaOUmsq4uXJjHOjhyDptkocyuDLq0MV3htfcNILiPbIUrq53wK+wwE19Epgr9iJwGl8ovPplqockl3v9+OpLPXdqNcWsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756191720; c=relaxed/simple;
	bh=IxbGNRJh6QVdCb092qdVbg5xwq8zrZfDy6At55ft/KI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NrhUoL1GPMrdvM56iDLeLQp+aLMHXNFhCLGshSXlj7S/9uRP8uv3D1dlqsrakqLM/Qr5wyT+ARYOvFmuEOE7uj5AIFElaj9Dj6mvgXWmSnkHjkiH4/nadMx5Z/GmRJBc5AgCqsXNdEdfOsC7WkQAtKDGpvpDorIZmvwzXNvheGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6MUGUlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PMkK79020022
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o/PAU65y+x4pXgWv5a2hPhaymtjDm7AI43/
	Wgvmb97w=; b=k6MUGUlNzMScGMv7Mn+SeG16LjB2/zI5yNnpTkoQXCQrdzT8aqi
	b4emxyvi4RDp74rkg0In1cyD3L+3mpfJaJ1Fva7vj+dnFuDUS2hTukO4HG+A5d3l
	GpVHoKR4XI3Gn+TFp4FaQSdi66SmPoQ2pEocvJ1+r3QyGEaUJv4RX9GAuObcqZCB
	uPnqEW+POyXQ8TvGSQtDi/sngfGhstkZBZ/nJdF6iysPsWDgQF2UCq9k+mMgDBRr
	r2UVsrz/g6qMeJ2MsHWCJk7AA9Gm398+pUpNPDhqGU0MhZj6CIAQyuqkXcf1x3w3
	3AB23yyBDAWgeyd+E8t0Fo1CGQqFW6oWR7w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615fnwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:01:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b49d41ffbb4so1897602a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 00:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191716; x=1756796516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/PAU65y+x4pXgWv5a2hPhaymtjDm7AI43/Wgvmb97w=;
        b=U0D4O7cCz0wpKfOXzJQGtx7oiI95Y4IrwTjxeYsu9b+e65oSHvKiNWyfpNZphmm0iD
         b3KdW+k2DT50wMr4S2onyNBWCPwHcEM0rQFnD0xzThfXUPT/Hfg9OshfoPpYkvHYvqfL
         CRLQDVPLJgo1/R5ZlsxfoH0aDdPNLx4T17mZViEnkBJI3OjdaxEstAc8KEdaENKdxXSp
         qxbJgRjyfqU4LdyJKRQ2plDOaotOO76oSgAcK2iZLaRd4bnuqWHwxM09CiAc7y27e/QU
         Vv0/2mZCyIwzzi+eFrpaT5TPqLwBzZ3nliwudn+x8DOOuEl7QSJ0K7jVllpAgdokny34
         RhCA==
X-Forwarded-Encrypted: i=1; AJvYcCVlnJCnMM43doqIca01nmEQfzqFGMCsF9VidAYzl9fbOHgL3hV83E4x0xDvgFEc0eEPkNCvShdIqPVutBQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRu34Vy04y+21sVM/6LWvHn4JOino6QxRFQfe+RPG+5luWAuI
	Od9tUw1lY1u3Wotvp5rDKNoRXEaoHVzq9GQX7wac4JsL07aIXN/dvmDqpfHmA+FGe69j1PnQqVF
	sVULwBJls42NcEGaYdwU3QxR9YTlBSUueCPoE3DTb/DxiDibKRWc0wBqkjtKte3HCz4tO
X-Gm-Gg: ASbGnct2swmmabVMSBAdcEXZ3XGbi+1elfrjNQjDvVsQg7rpSqh13spA338Fi8F7p2N
	lniUQzLonU8Z/BhPsBnvyeQrtSVYtFQZinLrJQI5P80P5pMXYeO4qBsCURAFzlU8tdn6LiF3zzC
	PV9lipCsZt1/biYV+XZ/ShLKAC/pxzXkcCg4TMaw4E5kvTS+Ya0f3cDtVp11NrarvnYnzvS1Yyd
	FzErdTmDRGnfLxn1bdld59r7OX3NqzMzg1BFplhrASXHfGsG5cQmHlT1ZO1aTSaSPY28H+jsbt0
	aR4t3kQZ6eu7P7Ws0c3SALA3j6gOHuVHMhDvTqnDrXCHXj3iorE+4LofoP4kf0uhr78GzrPZdOF
	WFNCx4xeCjMI+zhvxWqnP
X-Received: by 2002:a05:6a20:a122:b0:23d:4777:49ca with SMTP id adf61e73a8af0-24340db08c3mr20573604637.34.1756191716242;
        Tue, 26 Aug 2025 00:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa1tnLz9RnVmTqVK1eB+6nF3z2owo3uluL6pLja7TFL9iYo1XEunkDWrl2sU66obDXiJuEmw==
X-Received: by 2002:a05:6a20:a122:b0:23d:4777:49ca with SMTP id adf61e73a8af0-24340db08c3mr20573552637.34.1756191715792;
        Tue, 26 Aug 2025 00:01:55 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:01:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/3] add sysfs nodes to configure TPDA's registers
Date: Tue, 26 Aug 2025 15:01:47 +0800
Message-Id: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXyQjgJmev+3OM
 knSnqqtWmeoAuScESZtMj70ZC/BrblvKgu+NWVQizoBu6D3j+MlYEN9ub9TvZniZIpT62VdDKwn
 N7AbEpdNaCBB+uURTTSHSl2jkj1ToaRness2yUzDqYMo3cKqfjQEm8tx+VryIeYEhck7k5kbkE2
 k7cOrAF+sJNwRmgqyPRy/iFig0MloPMh2oV0pUkFEHZOWzhjFBfZrtpdETczeHR6PYXwBWxrY16
 Y3tdYPPj3VmYWyYECmccBZvk/p4pfStPIw6XutCQBBhyiWfOwnF77t0wRrZkEsC5/xHenmsPXvj
 VK2q5nM5B8LWqGF+4s4E92RHVmBVJm/KFcxecAsW6LBPsen++HepFcdWQv7bn/Vk19CtXaGQp+R
 NVIkHRHd
X-Proofpoint-GUID: uzqqC9TL8a3uQYKPLrWDJ0PchNWA2zBl
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ad5be5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=JXyblE0GroTofN6fZGsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: uzqqC9TL8a3uQYKPLrWDJ0PchNWA2zBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Patchset 1 introduces configuration of the cross-trigger registers with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a function to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Tao Zhang (3):
  coresight: tpda: Add sysfs node for tpda cross-trigger configuration
  coresight: tpda: add function to configure TPDA_SYNCR register
  coresight: tpda: add sysfs node to flush specific port

 .../testing/sysfs-bus-coresight-devices-tpda  |  50 +++
 drivers/hwtracing/coresight/coresight-tpda.c  | 301 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  29 ++
 3 files changed, 380 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

-- 
2.34.1


