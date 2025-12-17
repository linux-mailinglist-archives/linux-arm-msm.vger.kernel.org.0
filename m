Return-Path: <linux-arm-msm+bounces-85439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA4CC64BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 07:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E65063005B91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 06:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B485332C33A;
	Wed, 17 Dec 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="US/dJB3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yrac8ZJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5132B984
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954289; cv=none; b=ZSup7q2/oE3meXe1D29pRTgIHiakngJRmBCpnkBmwyVN3M5O4SSsvTdm+Yf79YaxiOguhI9nTlOKO6osd6X8UjxQSefw+lba5gxV+bgsJ9/VhYWr51HIp+lFdOd1z+g9PgtVitLvUozIbkjMV3w/owlbpfQToWWtTfScMSODhIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954289; c=relaxed/simple;
	bh=xfcrgOE6OJ222SJo7VrJmEsMYDm4kjzaI39zTIlVu0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ETTIe06uKZn5eIziVutFA0wanT4vslQ6MNWbJEML5VlQAFlrvkSYebqd1iqIaLGS6HAqR+Ks7oWffaSRCrSkoAdwyz2YBrCwVlw+90pkbWkx6/9yjRgwgDnXOeMQpMMRde0VUKux7KVjvTTaEYtPmBsA2hoaS4YNimbzW/qq4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=US/dJB3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yrac8ZJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FJ0i1215333
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9b7TECOmfC/ZprO7FoeHi5
	StqNS5aSU94qGGJSYZB3M=; b=US/dJB3IE853Gd7Qe8IQWIKveRwkxLhq6zz+gS
	PM9Q3KxM6O3ivCnO2Mv5XmNFVMxGhQavYRM61IGrOf8Y5S6g+7vELH+b3RDzkLNq
	iq22z2DcUMArD9IebCD+rKOrQe2TL7ZPdCLD+vAiDP6L+zPhksHDHxFqfCFd2zpx
	lA3VuBOUaFv6nD0kUtASx4bX3kVLfVXM0HK6Fe5NPUAfaiAF4rd2RnKlojEsu9hF
	wobiDGHv+oL42aT43Tu15ASLfCdFXAq84kF4Jp7Lh2jR32IkhokiT9GX22NFXQ07
	ItZLfAsGUNsxLOBI+R4DOrtOPb+vZ3ApFvwuRWhKc1+ze00A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g266q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f47c0e60so69603535ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 22:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954277; x=1766559077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9b7TECOmfC/ZprO7FoeHi5StqNS5aSU94qGGJSYZB3M=;
        b=Yrac8ZJCEpitFoHOBI7q5RNJf/7gw3IFOfQdFj/PhedT2GGY7BV1heORy3Y4Bd7Hi0
         mqpTgk537fdO2aj+P0xvmo8RXOlddc7UM0RKKw3LHpegFPp5kjHjNK4JA/OC2V/7gaIi
         EvYkKfYR+KxdxNcv8fo35bf2w15EmL2i0Vbf4DyBUYx4Kxa9EyTy5mz0m6CksmdqGJm0
         GaP/ALWbJwIFBwqKdiySTvRChm4izLAO41L+b587ZYxnS+WEelIdQmjaH6xrqZ8tuwa/
         362kdl3K1ffeGDwn6ODT5DlKhQDNvMxcjao7bVbN2lvZki6jLjAv1vH6+eOkUFEyjTAB
         IAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954277; x=1766559077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7TECOmfC/ZprO7FoeHi5StqNS5aSU94qGGJSYZB3M=;
        b=mN8Wf7W9cFFg8PIIMimLN92BDfo+DDXVqhqCItALg+Vkv87gJxt4gjQc4pRcHIMzYk
         2eF8sys6BdvXPEOFxlVHB6qkq3mi8+VGQjPI7aWZ/VUhN5AE+a/bwZTHRVakNo4Mxd3x
         iLTGElt/ApigLqbBy336bzfVXLXmV2e5T8lM7U2ChXVEa0cagAfK78FUL61ZYzD8g3Er
         pNVm62d1RAMcuw3aAlBadRusb4PbsikyqPEj9Gl/YuF1ofWDblCWxyH7NT3IcUMkPrc/
         sRqs8+NLVqsMraOWbY/bSNFSZrkFGCwlHqXfZ912Q/Z4yb2wjdNv6Ui7dk21r0a3PrnJ
         b8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+sdBFOYWn2Osz9ITrLjxQYhAyNK+tQ+fT08Rgt32ZkRU9GdJOTqCAhrIKOrHIP/LoKCq/CLaCSCL8rqeK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxze/WTk1JDbRA96n3Ic27751xvaMFdSNqxslVWdID9+YWpKhiO
	wHK8pfBAfoAThx9vdyB76F4q2D6ZhIHQ8YPeBltI10d7OFpf+CJ0LTw0SMZtlga/jD7Nlj5P1nE
	+FS3+vvl9PRoQalR1nOsLrCDSb4MPgLrsF+sVR+FpXhMkhHdc54t8jSf9ZpwbOcp2yJYA
X-Gm-Gg: AY/fxX7EeRNll5PnXVL1GdLLq//LIfryVeIw8h++P1wfs9QdcLbgRoUJvWTk4iaWDaN
	PkEDxEowI527KrZXN1AkoKfDsyVrIxoBibxe95PN4rbBZxXNks7i3+Qk/l+hYpg9nVg0a5ZuCm0
	e02niDCrJ+kF87spjryMvvEaURyz/NLuNgEBE0Ulf21jvIqEur7bz7Hy0qHxrPBLJm8rHnlVzJS
	Hdfx9vPcgBx8j1X/d70nbw+JbD4vT1w/8a9gD/jM2pIpZHDD729O32oVdtF0VBERExvmtqcMObG
	vKcWrXk61+WrzNjhsL0MuJjHKsnU81p9af7F+JYkco+u+sXs0WE7eotU57Bv01gSzTeEC2dFU2o
	gyDZiYB6qVTXQV4R5YcKqwUDBLZ7Cv7eCa+NrqNlz3lmW2xquSf2aSSDbkHnEuUPmeQbH8EEpSz
	Sa
X-Received: by 2002:a17:903:2290:b0:2a0:d527:4d08 with SMTP id d9443c01a7336-2a0d5276892mr122995545ad.41.1765954277227;
        Tue, 16 Dec 2025 22:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdk8SK6mYSXW4tV0n6qDdKnNl9i6F0VGGoJzRwhrvozssJefTBQcBTUemfonzG0lyTKIuUGw==
X-Received: by 2002:a17:903:2290:b0:2a0:d527:4d08 with SMTP id d9443c01a7336-2a0d5276892mr122995395ad.41.1765954276759;
        Tue, 16 Dec 2025 22:51:16 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:16 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 0/5] rpmsg: Cleanup, fixes, and RX path optimization
Date: Wed, 17 Dec 2025 14:51:07 +0800
Message-ID: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g42qXaiQ_bevBpbVRaWFDS6cgHatGuNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX3lhEunKUSkkA
 8gH4ipTfrymsVp2fQT4KfgIljPp6gFS97OgQtiO/3DZ0zHb8xckl3PIH1WyN0tLLkuZMEv3Our2
 QIQnQxy22tmKHaPcPeKcpV9F62nhtc/jB2XU0Wo2taEteHLoW7gK/Fmio28QLeXSNq0BGfEYoXG
 h3NhjfOOwbjd6DxVIUBi3XVKLj4FLW3olJzi/kimSw52PoocBzk9OYFnsf4Bm95ld5s8Xk21/B3
 dlEl6q5HJLUp8kC2fjyq1ucxtSFmmtESfLhywjVFTIM7LHIyAWZonoow76mnt4qTDcjdZnUxmuN
 N3/SlLt9PGdfMI6rFC6PKsyoT1RRnnWqe5xHSOyPDmi560JNJy2tNInz2jaNpC3P5g7uX7UNY7e
 Ajd++DwglLZhT3QDjKkfPoqmtTQqmQ==
X-Proofpoint-GUID: g42qXaiQ_bevBpbVRaWFDS6cgHatGuNO
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=694252e6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JR59mTIcGWyaVAYooGcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

This patch series introduces several improvements to the rpmsg subsystem,
including minor cleanups, correctness fixes and a performance optimization
in the virtio transport layer.

Summary:
- Cleanup and API usage improvements (sysfs_emit, comment fixes)
- Documentation corrections
- Proper error handling for dev_set_name()
- Performance optimization in virtio RX path using RCU

The last patch reduces lock contention in a read-heavy hot path by
replacing mutex-based endpoint lookup with RCU-based lookup. This is a
performance optimization only; no functional change.

Zhongqiu Han (5):
  rpmsg: Replace sprintf() with sysfs_emit() in sysfs show
  rpmsg: core: Fix incorrect return value documentation
  rpmsg: char: Fix typo in comment
  rpmsg: Handle dev_set_name() failures properly
  rpmsg: virtio: Optimize endpoint lookup in RX path with RCU

 Documentation/staging/rpmsg.rst  |  1 -
 drivers/rpmsg/qcom_glink_smem.c  |  8 +++++++-
 drivers/rpmsg/qcom_smd.c         | 10 ++++++++--
 drivers/rpmsg/rpmsg_char.c       | 13 ++++++++-----
 drivers/rpmsg/rpmsg_core.c       | 14 ++++++++------
 drivers/rpmsg/rpmsg_ctrl.c       |  5 ++++-
 drivers/rpmsg/virtio_rpmsg_bus.c | 11 +++++++++--
 7 files changed, 44 insertions(+), 18 deletions(-)


base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
-- 
2.43.0


