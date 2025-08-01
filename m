Return-Path: <linux-arm-msm+bounces-67418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4246B186F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 20:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EFDD627996
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 18:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6521F1501;
	Fri,  1 Aug 2025 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW2Ja2EY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7BD13B2A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071218; cv=none; b=fOl7QQ4Z+KgWEBlvhDTNdfaGRYP9NJBHzM2XBihHT2k52lOjZcZJsFLklB/dNpOwhRzaf/fsWcseqe6D3r3Ovmr/DvGk6+T6uk62DH/E6aJ68xl1xukH4HEihWOi/UsHWhz4DVF1E6UnRlEjfb4r0qyDchzxEDWqAbWJbLX4+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071218; c=relaxed/simple;
	bh=EvQ+6IfQMsPUowcbChu8GLraQRRsmBVri80l+sOVixU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RAh1LNk3N06K9qv943vEt9NZ3Ts2YaxIc/vrHC0mW38qkUsJ92R78VKJqppcz05zwepz9HnOTQvzYiKGQXHsn5PZV0CViBOyGVDFLJkJLF/YoGan2CbpePOQLNaA37q5jrpQ6jD1a3n+09qaZeUXjAleEEp2mv6W6n7EHTCWNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW2Ja2EY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfK7n003194
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 18:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iHQTKYkj0qpzUWY7+WEgpg8wdP0WoJQ6dPs
	zuReeFiA=; b=EW2Ja2EYQ2iz82iQwENTK1cE6hsXSob9TuTFT78v5DR4od4kq0l
	bNpMMTYnpLdAR8uTpw3w8ELN2i9GnUHFAkdCmdUYlMiNKUon42n8B4senmalZrpP
	cvNJHyOOE5+O0xqN3mcb5rlLMmraYuS6GmXye3YySW9UG0XCnv8jhi0wtpSDO0ZW
	+D2XPZJLwn/Jf4CjLj3ZXcz2ymo1I4sYq1P6ioognzMkn4eWcPoVcyE2aARzQdlA
	3kmkZnYfdlwejawSvbqrVR1QN4CHuEFAEDu6obhRcCPrKWEavBBiJ+QH8NQZx0yx
	UPxkFdW1u8LQCAA3k4RyQq6dW3KgG2Q1/pw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdacndm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 18:00:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235c897d378so31288585ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754071214; x=1754676014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHQTKYkj0qpzUWY7+WEgpg8wdP0WoJQ6dPszuReeFiA=;
        b=kYyYuXjNcFy6yxYN8onQe4Hn/43qyLdHI3xXTSr3nFa9KzVkOkRY0y+aQVzubZOVou
         WoFMMeTdY3yEuNCD87Yghapckni9Na/R9kAoVHS7kx9qDSln0CRiOZz49DL5sUWnybnH
         AphMlV2QRg3JtDxHjyZkcefAdnzlNLzkziAY6ioSBpUVvUmeTxgZB0tT6QDWLtgaoV6/
         F6AJ7+ZCFVSQWjqx233FE800wDB/l5AY4PqQ6gR/qfY/embNBjLWOplvxe22cvnZx7Hv
         bDoFcTHyFvR0ZTMEZQEe0rExfNtRtLiiuoJC/Px/iGrP/YUNcKGGmOhCqiInL0MUEb99
         johQ==
X-Gm-Message-State: AOJu0Yz1G/rm05mi1qt0opbsjjXCv1rPXt9XW6+a+eKTE7ODTSSd43iv
	wAkyJQacfVpbKMy84VBF3XYzbKMk6G4SxSADhYvRsPkDP8CRy8CFwFrYW8H+djhuDpWo3/FBYoP
	ZLN7D+nsmf1bBuYqlYe6u1mqUmzlp615eplhv0DV329T7sK4Zcl6O/3RShwYXA/CcdQ1A
X-Gm-Gg: ASbGncur2KRH/lhqm4NJeFKATLPv8GqYNFfdZd+iIlgKS8WUYqPf6bqqQ0flw0xOEGZ
	Ur55hrnKDFEowexvRmzrqzXHTb2Pdu9LTUER0h2nxm2Z3xRxsxfXpfzZJcFkk8DlB00aQWmtPPE
	63arDrgLMCMVcy0ocldvP6kwiwwaTl485S3lAtO86DaUPR3kfYaKpgUNWk45gQ3s2krCqDazp16
	ye3TfwAsLmKBAJWVrTjuVusSTmojS+bZyZxQiDaA+tdGl4R/49Z866y8F63Y5IPibBN72RN9Jfg
	xJsVfqqBZp+pO6T1lRyHc2KugjIZDWxasluOpBOkV5m4I7ZyGjA=
X-Received: by 2002:a17:902:d415:b0:240:417d:8115 with SMTP id d9443c01a7336-24246f595eamr4151505ad.16.1754071213712;
        Fri, 01 Aug 2025 11:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIiS1uNtFlKO/TgDqfd33YVLs9CK624JVjnlxU52duE5nqqItwb0e7s0qZCDfogQasU+SoRg==
X-Received: by 2002:a17:902:d415:b0:240:417d:8115 with SMTP id d9443c01a7336-24246f595eamr4151005ad.16.1754071213205;
        Fri, 01 Aug 2025 11:00:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef7562sm48517715ad.24.2025.08.01.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:00:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 0/7] drm/msm: Various snapshot fixes
Date: Fri,  1 Aug 2025 10:59:57 -0700
Message-ID: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yN3voXqxRG8sFB2cSyaPJUXcIlPfrLmG
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688d00af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yN3voXqxRG8sFB2cSyaPJUXcIlPfrLmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzNiBTYWx0ZWRfX7/yYlg2HLNRA
 1YMNKRILcDtyMxy99MZduXT/E/oCIPEzIBWnoSu6utMohuQaDbMD6b/Wa9XNNnbtrr8ob73SNz9
 b594R9RccAfj8Zcoqg0+AOjpeWYEfYRBQxWEKuiMrwluVBQBpV4x18x2til67Zocm8soTyvJjlv
 4Z4fxkSt8NiAsQ2SColf3C6EzjTo5Cqo0qTGBJzzpsRX0ov/FkO+eoZ+b7QtYZ30hpGnUqM28dm
 gUNL/2wRrPvBdmN4IyJKSULr3VSkSmYZ0MB6CNsupLYzio3xSJnpMJLz1+u3A3m/hahhUBPbiOh
 j7mFD8auS1rqNTgw0zpuwCnzLx8oIS5nsnzJWoFOCO9dpSuE4sBoRtCj7mcqqVdIJj6dE5KsUyX
 jcTbGd0qBlsy9f3j7Kni1EgI+TbKfWGOgka3UnJzKS5BYwE98WjkplCk2NnEkGVXgM5cKz1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010136

Various fixes I've found so far while ingesting upstream devcore dumps
into internal tools.

Rob Clark (7):
  drm/msm: Add missing "location"s to devcoredump
  drm/msm: Fix section names and sizes
  drm/msm: Fix order of selector programming in cluster snapshot
  drm/msm: Constify snapshot tables
  drm/msm: Fix a7xx debugbus read
  drm/msm: Fix debugbus snapshot
  drm/msm: Fix a7xx TPL1 cluster snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 47 +++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++--------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 ++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 +++++++-------
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 +++++-
 6 files changed, 101 insertions(+), 61 deletions(-)

-- 
2.50.1


