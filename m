Return-Path: <linux-arm-msm+bounces-86786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F4CE6052
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EBE4300D0D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604952D0292;
	Mon, 29 Dec 2025 06:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/jTYO9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLAvqz3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4352853F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989902; cv=none; b=KWYIEYIQtaYFRoR+bnsvNvOi0oXXtD5QZiFloBgzcdCDxsMgMt4Fs8JHCqVEXpbi3qrxeY6wJYsizc9rgQyrWuQjrWcWNRcgyuH8A+Sn0rr0vWQQ3Q2NxJ5LfNqMiWF3J6O7Zh2etbQBI7Jy+jk7h4MIFi1EIcF+b2dQnGZ+Dvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989902; c=relaxed/simple;
	bh=l3HYQfLfyDGmAdRdmedMRdKbd3YII9iS9an4QWGWaFQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RJod93qwvohp5b0siWPkaJUBYz5Yv7Z/54ApHjR2fVgNSOvXsQFHXYTeiXb/StKxxTwYuoOHmG0/nmuMIR8LiQYv5gg+c+LOScedYbLmztHH3oufF71pTcL5ex6NJ0kYXE0AugPlpS0DgdEh5hIjdzSOdPmhRxRyqHpEbZkOy1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/jTYO9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLAvqz3z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSN35kJ253584
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WMiYL2e1fGj83Lu/5WYNPF
	G4N3K7VEAwd6MaaQi4AfQ=; b=O/jTYO9QjHgbil3XWiTze+MKXkErR3dGjdp1hy
	G+uIw/y2bVPybedb8RHs+htMGdLZMWfQKvFlWfDItvsO/AAKJ3tlRJC4Am03qfnu
	G0IcGVYP2hupg/CGOnDQDTOLPJdyeWY5wr0JMFq3C9V7XA1kpsgZdBnrAGdyEJm0
	dYLLlA0CoYN/Jp8ZX5tzUsb9H5eooT/Bea73efkLT9xLPRwoHyjwtM5CAHBznd7j
	etBqmZ76tjbxu2r7cpDwEoj7UHJ7bo8SQ/jugQbHJ7//ly6i2RfNVaRZ5K2RPGIl
	8i9VHesNJTVBQ1dntARonIyV/0yX8uSTfWuvJeftNeixySdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v0tgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so10247472b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989899; x=1767594699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMiYL2e1fGj83Lu/5WYNPFG4N3K7VEAwd6MaaQi4AfQ=;
        b=HLAvqz3zLZMffgexyaZdnXod3xXc68PObBmmuCXv5RbXatlNo7IId5QwYbw8u43Y/s
         B1bn70yLLocVF7WGO653kH6mObyziF5tMoimX9vJ73DOUNUhxS/rVn426wgBbz3BFbKX
         dy44z5BQpaxbRGvVZ1+GOlwgnD3hLr3HPZWV3R9oyFzSatpVEYn/FTodymCCeudlrCE9
         /7QdbEiAcIDywS7HaFS6BnWrtrPFq/6znjrJ/eO63RnPWm8XEJj/apwkpWrvPl43IrSb
         9uVKGcmDGYSByc02MF/WfpmBgfzvPKQIKHijNh2CNNjyOtOsAaP7/CZfmKsrZ1uMwGgb
         RJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989899; x=1767594699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMiYL2e1fGj83Lu/5WYNPFG4N3K7VEAwd6MaaQi4AfQ=;
        b=Hc+Ks3J8M19GO1UlcaD9W88EhhwAbanwvsPdf1vgunaldOtLNFTWReo5pzqB2XqQpM
         48vpz2J7MNBp8FaaB+lpUlflflEGY0DDTgwj1NBpCZ9HyN3jhn+PSIKaMitgcoEbaL7W
         RLP0P/1f4bPjkRXP76Kwawzp1VRl2taDi1sBEGYcqbNzZ6a/sjMRUJdyLbxSP/8R+4CB
         5r3RFRcXQaztDdY5FFOv0TKyexBvWaqYr0laUtznF+nVM/DNfdiqHCXcPVTELbXFY3FZ
         4sD/HhIaWauTA33jbs94Wxl1l0FywFl9VYIY7BwDIugnG8DWG16F5ST4XAaqqFvnIscq
         sn5A==
X-Forwarded-Encrypted: i=1; AJvYcCUSoJ+XfEg5RUZsf7xMiOQPGlRo9DzTZfjP0GURqYfRf/lmEi4V018jiFlmrigtEyg+saAFWxK1lHDgiSQd@vger.kernel.org
X-Gm-Message-State: AOJu0YyHRvSx7ulh+it3kKciEMKwJbv9i9etZscwi46ZI/aa4EP6pn0h
	+bqgI0+HRf108+UrA7oOuvD01UHXy2UGU6aY+4u80q9zUEe6u1HQ3m2s0K8A3djlTxeZ2sCsz26
	ggHlTgZC0vmWY+EOd4tqnj+l79JAnd7UNRaJNyb6mFqlkHpbxvKXob8ankM0K1flldio+
X-Gm-Gg: AY/fxX45kG3Ro9UMCnlo95AUUIy+/xh60vHfH85EcofcWzf7Si7zwULjxD+9Ul5q2/k
	XAYhQVH/EWxoTb/sxY6QR6kiKp1ue2MAFZjCJRtMpKKn89J0TzOw/wHGMvHtZ/ggNvlijZ3mATu
	C15CHQp9yezBNdjoUvATV9nzvabz2qlqdEHgiFRLQ0HB/nTljOeU31icU6JhZZe3fw5VWy6UqkG
	zoKLbtfTArJcDBPJzT3JCpVf4k6b3ZRCSYbANyxGZH0GBsdlBnuDw87ZSpCP1xkBLL9+vCeCV4W
	9ZJIPSwbjhfZsWAlewGWZfIIcwxHDt6u019oqgRnmZx2S7bKTnE6ZyMuELtE6oI8qNvs9VDgW0G
	HQ+QMnARdzi2ZkyU10CrGoucpFBo95AHHskNU9DUxqH9+kUY=
X-Received: by 2002:aa7:9312:0:b0:7e8:43f5:bd56 with SMTP id d2e1a72fcca58-7ff6784e709mr23526973b3a.66.1766989898583;
        Sun, 28 Dec 2025 22:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoCrIhzru6J9/SBY6w94BLXM3xiqCUW/yKnyKPD2FdthRnHntCF2oEREJHuj2YxYdf/T18Og==
X-Received: by 2002:aa7:9312:0:b0:7e8:43f5:bd56 with SMTP id d2e1a72fcca58-7ff6784e709mr23526950b3a.66.1766989898096;
        Sun, 28 Dec 2025 22:31:38 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:37 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: iris: misc fixes for fluster, seek and
 concurrency issues
Date: Mon, 29 Dec 2025 12:01:19 +0530
Message-Id: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcgUmkC/02MQQ6CMBBFr0JmbUmnAaquvIdhgWUqkwjFjhIN6
 d2txIWbSd78/98KQpFJ4FisEGlh4TBlMLsC3NBNV1LcZwajTY0GG8WRRXl+kajqQhp78uishzy
 YI21B7p/bzAPLI8T35l7w+/1pTPWvWVBpVXt72DdotSZ3CiLl/dndXBjHMh9oU0ofaAvHXKsAA
 AA=
X-Change-ID: 20251216-iris-fixes-4be01def1c7f
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1323;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=l3HYQfLfyDGmAdRdmedMRdKbd3YII9iS9an4QWGWaFQ=;
 b=VqAogHl/5mSdNnD94YerpXy9Xh7ZJQ3tsVbrf52ETgJaHqBDk1Jx8B6eR2LYYlWLDnyyx8LH3
 iJK+rSpf03aCA0hiMjB6PPCs+OWPA9slVk8hxf43f5whWQ4suZkOv+C
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: MzODmvhzhlkqtUUZY3uX9XZFlmQnY2Us
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=6952204b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qJ7AGJJM78aGNJrzRvkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX0C0zr5lCjw2C
 Unc24czi5VjFF4MF5sPCRCVJqRLnLwU0UO9WF34twK42ABnIIJmq/WG09IhVC5HsgmW+4+Qiqo7
 P+CcjjgCpYEC8K7htIWCkhgr8igy4HeSG8BQJDKK4bx3YmQA394GqIyPkOnZBoPerQLoAmojjmE
 xntliUjhRrNGdUVSWHkFUMmmaejaV/IS6HPhn11wksgV9Kb2nbvnBvgLbdvjPrsuN521AKUiRbV
 rqc77t6gQToUkyWyCuw13/2kW6PmI1QCyZPbwZHKMQFdn+oAePkx99+owReeW8bclBc1VLVgsxZ
 4/svVRWIEIjhEhanAG5hnrOPJNh1J9FDfP3DIW/D8jUiQn51dUeAFIIdXLeeX3zUxLCmFHepi2M
 3zcF+clUZoDffb+YRQj2EyxvhQM/baA3VG9SJoQJR8OnowRfJnmrzSvvNR42DrHtziKSedBdJiY
 dNBr86E6EpRd1jmnZiQ==
X-Proofpoint-ORIG-GUID: MzODmvhzhlkqtUUZY3uX9XZFlmQnY2Us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

This series contains a set of fixes addressing issues uncovered during
fluster test, resolution-change, seek and concurrency on Iris.

Changes in v2:
- Added missing fixes tags (Bryan)
- Link to v1: https://lore.kernel.org/r/20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (5):
      media: iris: Add buffer to list only after successful allocation
      media: iris: Skip resolution set on first IPSC
      media: iris: gen1: Destroy internal buffers after FW releases
      Revert "media: iris: Add sanity check for stop streaming"
      media: iris: gen2: Add sanity check for session stop

Vishnu Reddy (1):
      media: iris: Prevent output buffer queuing before stream-on completes

 drivers/media/platform/qcom/iris/iris_buffer.c         |  7 +++++--
 .../media/platform/qcom/iris/iris_hfi_gen1_command.c   |  4 +++-
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c   |  3 +++
 drivers/media/platform/qcom/iris/iris_vb2.c            | 18 ++++++++++--------
 4 files changed, 21 insertions(+), 11 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251216-iris-fixes-4be01def1c7f

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


