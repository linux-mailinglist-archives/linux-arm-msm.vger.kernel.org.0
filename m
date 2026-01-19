Return-Path: <linux-arm-msm+bounces-89579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D11DD3A139
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA2A53032AA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739C633C526;
	Mon, 19 Jan 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9qOm5JL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yj6pLkKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203F30274D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810640; cv=none; b=g+d+r7pxjhCUddUhimkxGDJ0pLTZViFflM3Ak+o+FjR9wANdJJsqnnLzVwzrTNT2FtLuxSRQX3YMR1qfxKXdGSZox9wQTR/4n19kdHH8TUfq0MHO8r6kfCvJmXlyvriPNP1pHBtatb0JmguWVnmDyjEdFWNqpJMTfqD+lG6RCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810640; c=relaxed/simple;
	bh=xTfVqbjF2EEF4a/GBzAvQJo/Xn7hoYLjKFLQN+ElBFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=llm78CR4yOvOVVN7ILYu+uAqd4Py5FVjbLJRj81ORxKpv8TRICg0fRIxVpqGt8X+XjRxuWo4G+29M/yd1g2ir/8vr85bvxTiE5D87QFI/0fID3Upfa9lnw91wH4Ng5fvc3or/jVtGa1FbR4222cNiyqVoT26uAADG2lJ+dWNcgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9qOm5JL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yj6pLkKT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J7gIP73152175
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zKKpF+EMehH0PJv6f8uHjk
	tkBJp8RECGD1zdM2RjWR0=; b=A9qOm5JLdVUh0UaUT0vUkJgXX8xNtZbyUtyt3p
	5EgwopA8Tkg0NJ/cCMqsCMpYqKhYwBl1d6+8vBX+P69iWTwa8DqjvmagwzYivnNf
	45MdlNrwmhtSkwP6N3wRf1WKQ9LCsIayEwiGFbJYMz/eVhZNg+rvaSxbj8sNwT3d
	O2au7X6CMXYbmTwW0vbd7rqxqqYN766tgkayuh2KTe9s4K6piRwQcNtse0ZtDIK1
	SZxEMzmHyw98oigt34rFkZY/EONXEmef8//oTZ2cwAAaR+qpOok7Gm1o0yUWAZ7r
	upGscwxRK2HBrmMdIZ60Q+8zPTKMqzaE8SsQuHjXimKOkuWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs7881aaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5297cfe68so758371985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810637; x=1769415437; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKKpF+EMehH0PJv6f8uHjktkBJp8RECGD1zdM2RjWR0=;
        b=Yj6pLkKThoA4BBThxzEZiCHUpEkgzknqd38X5kv+GuRSCJEHLFe226zeSBPA8XcEqZ
         60l5faX1k8eiv0H0RjgkXGmfcNqJ8RHAwgCB7K0I6LFnGhW6m/XgpuCq//kAqQBHBwTv
         j7CAIG32MQrO2sWxbRE+yf28bo+ISIDxa+pNJ08BjCXXXJbgDnq11HvRmviUaSVYMiUG
         qsbfaiUGUqaVSUES4LlmO9O72ea3Awr0awJWwnQxomwcGLF8VUPp3aOoc/CZ4R4CDoQP
         d9r2TGv20xgbX2on5Caym/xSMCS3UUa8sFqulqHdMNf0I9t6eXxv67vp8VcsJiUN4rUo
         mJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810637; x=1769415437;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKKpF+EMehH0PJv6f8uHjktkBJp8RECGD1zdM2RjWR0=;
        b=PRBsqE71lm29yU12NnzZwEBOH0x9+KrpurDcMv8dvF4fcHIvDUBtEVHS0M2MP2UidO
         0wSrJ58TQR3L9Q5zgEUComKBZ8mKJ36LXR8BYvuVqS6GDoucqGoi3AXlkq/sxXEqRvZt
         HLEUJB2aSTd7/yXOfTAWSDb0kVsFhPIpmGoXEWA1pQ5dB29tdlaULyOqrHoFSwR4ctgd
         eeX/EyvX/fUFiISMaQI3x/U6RW5vouQb8+uI4oZYws2093v+VlKJ55O3xBU7AuE1un2f
         Xoc9KJyLXZ9B8StlGaZbocGZBrUtFbFQH7PbAD2yinGzA7A99dr5ts5GihFe8jnsvpjb
         Le+Q==
X-Gm-Message-State: AOJu0YyRp/Sh5YGpIjlrNBWIW2qKTwJ9xER3ZE1f+dUYfDkyVKaHHPlX
	a1Rxo5Ik66TopyBzMXxVHzbIpzSZhrpihIgBHsU1AQ71xzti4fuMTSGE0NXFF5+An+Pf/NmVlCi
	9KWiROd+Ei2uw89xiAXDiWydUu/ih6pdW8+w6I+yN0UjUsn7Sdh7PnlxZuX2kwzV5bBIC
X-Gm-Gg: AY/fxX4ZZXWMHVAtTfSqijx3hexFyGsFoqWzS3oHGUGSRmCLfstD1o1hrw78B306b2R
	Al2II0+xK7IzCwd6UuBdxJumpgXqa1mfekJzfIHUsK/xNeRHTu6hqhuLFQl+4y2UbwkJiUjvC5A
	qBnnwgl0+eBXVW8LCZCkhc5VJA6beH/RfpSdOQ2G053UBcA03rfUGVB1sWiygV1CEaK2VC2bKeh
	g8Xtod73/rAB5FKJBNjLsQpm9Fc1qYCDGFOo+RqaWRlDNvCLP733C7dsPDGzmNRinPCFLPhr0+K
	R47KMCug4Dvbf7Aq4zsei/jjQDCcqe6ggVkBBHihE6h1TtLQ7vqmR9VSvVRKmJGlmm3tAJ8zACe
	WEJXmkuDNDJOG5cyEs/RgPQzVzKrVZUX373VqKP8uuvxMEMfU61pCgbWJwa1/kq2zLLntDmh/ik
	D+xJ4tDl++z4ZoAGfkJbB5ciU=
X-Received: by 2002:a05:620a:4627:b0:8a1:ca96:5d39 with SMTP id af79cd13be357-8c6a6789094mr1368158085a.59.1768810637435;
        Mon, 19 Jan 2026 00:17:17 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8a1:ca96:5d39 with SMTP id af79cd13be357-8c6a6789094mr1368155985a.59.1768810636854;
        Mon, 19 Jan 2026 00:17:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:17:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/4] drm/msm: UBWC-related fixes
Date: Mon, 19 Jan 2026 10:17:13 +0200
Message-Id: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInobWkC/3XMTQ7CIBAF4Ks0rKXhJ9DqynsYFxWmlkSKMhY1D
 XeXdmWibiZ58/K+mSBEB0h21UwiJIcujCXITUXM0I1noM6WTAQTmnHeUI+eTqeHob17AlKpWK8
 b22pmFSmja4S1KJvDseTB4T3E1+onvnz/UolTRq0yWkGnlDDNPiDWt6m7mOB9XQ5ZxCQ+le2XI
 ooCzLRGS9ZbK38oOec3M0qhCfkAAAA=
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xTfVqbjF2EEF4a/GBzAvQJo/Xn7hoYLjKFLQN+ElBFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiLCWZhvvNxvONh4ccavpGgy7jhD4KqgKsEb
 EcODZ4fAwuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1XtqB/0XtIDalhO1SoiQ+FC+rt1g1muICmY3qBagvWhn121YOJO44+agNkC02t69CI5hK0NGTKG
 z4n1ivvWoPi0Df9NsceiAbi+Zrej/7+agyemeDRE/xGTIJFL9XRrZYYWGLaGM9Apy9/CLomgpUT
 7QfrUI5+T+82+MV+zxNHD6AWdEjXp3U6mPcQ2hqmIwtNKBu3KmJoInX8WpZclBAgjIRs/703Q7B
 iogwiYtASc9yVu+0XDoEv3Z6Fik0Uy2TUjXDJRTDSEcUrBVu42MvHocoKuflP680VqbjGqgToIV
 gI1oSDMEikWP9izwITVXuT8keuihbbPrkdq53Aj7HIJFGNYW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KLVXzVFo c=1 sm=1 tr=0 ts=696de88e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xvqa9-5REf62IQFaZ80A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX9Re40ck5U+5w
 zyQg5hwH05EYBj7MwZ1uFCqy5tpKt0QvS3axO9zAZBHb2Id/q96cth+BYBTv6kTsVnoskbKnW4k
 ojBDYCCrVZA6sicoEg9FU7HybA9QHNdBjuzbu7D7dUifc5xfFxX3NaPeTNud2tfq4mBn3qmlJHj
 BgfgHX4Em/qfNH6xcQQGt9yIXL7kZNW9dpQbKXPA0GKJjaqlU/hHhO8eNkci7m59m72PVy4OlXX
 U5y0CAp5xMssVOKfWSlrDkfInnm/VCn1vq8LVuon57X0MXCK+IkUCfOkOmWtlF5j0Va5mUSqUz3
 YrLXrnlFmAW4qGjsMBWA2dD2/M1/ywpZW7FnztQZYabKb3/EtFMqmb74TJcoFGUjnXQZGJNILvC
 HLFSKoo5rneDDKh4UnpiQTEtoF7Eg3bgXloA4osEcJvBDvIqoKZvSSTCx5C/AQ8z0Rljbgmvclt
 +ga1wW/CNRtQ6aaMOZw==
X-Proofpoint-GUID: 2D7ckeBQaQumCT22h3Z5Ycb4FUIZO3Ux
X-Proofpoint-ORIG-GUID: 2D7ckeBQaQumCT22h3Z5Ycb4FUIZO3Ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Added Fixes tag to the last patch
- Picked up t-b tags
- Link to v2: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com

Changes in v2:
- Added warning if dpu_hw_sspp doesn't support UBWC version (Rob)
- Link to v1: https://lore.kernel.org/r/20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 58 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 36 insertions(+), 24 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry


