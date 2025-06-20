Return-Path: <linux-arm-msm+bounces-61893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56DAE1F6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 17:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C70626A004A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 15:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABE52EBB8D;
	Fri, 20 Jun 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmfpQmFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED3A2EB5CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434349; cv=none; b=gaPd7eNyNNLXcH6DtEJCRYsMDpr91bpqL/l2taoIgAo0FuwOr7kneUOcfsQojBsNKf3EGIbby08PW/MqQgdAPsxwOjBtcmU7c9wCqHVcycS2Jfa/83l/MCYmlnJVIq9ZC9lhLPBt/2+GvlFWVdxK94IXh+R33mKUAw51oVE0PT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434349; c=relaxed/simple;
	bh=8/BqXcGMB6lxiGMTkLSisgBAsGIIfiDhF0iUH8XsfxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mtjum3rUuVlp8HMNFGobs6qyswQG3ZDEHZeJNIw1ZlKBViw0abHhO0xnluYae1jIEWYsunfV8xqR2ie4IDnXre0g/26Md4Pf40URGBUdlJMy7qZtSPmwAS3E4dxt9t+p6l1CHwXAWcvvTpnA/8RpQF5VgmilnVLHTrBIGCLoSAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmfpQmFN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDwNVR024672
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 15:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/
	LNWEz4XQ=; b=WmfpQmFN4q12wIJUuT6mbPBjwKMW172yqiR+uusC1TBzshUsQiP
	tOhQfyXT/o9IzYfGIsSDy9MHRllJ32bTrlmCZ6Q5CL+JXvUZA41alidmDVnUdnLN
	gEFSr+gKF96gtRc0Ji07UaQZ//B1rdyctPSrbOcoXrwDBZp/6jUc8fqOtK+ZtnCs
	pTFcQgyB/zkyfu8QeQ0zxe6JfKmM9UPwHtRzrjWj8I8kwH9wZqdei7LvtfZj0Ktp
	bQfFjVcpvKmzelfpE2yKzv9TPYD/oKgRkjWVFahX1hE3V+F64kVZbEPUBZv5AM+S
	kCxm79gpn/S/gtmurCu2wItr1j1Vzu8fAag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792cabxr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 15:45:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747cebffd4eso1631849b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434346; x=1751039146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/LNWEz4XQ=;
        b=QEbeJwZIHJ5+iD7/7bWRowSlQqlqSjt5QFj8oRuvnboP62O7sIy2OZGf03nb3ZGkru
         48vkdhotBS+ofXNP40bL8xoehkx8K0G7T87+tMGxYhYVwPuCaGltsZdeFxOY8Ux7Yyzz
         NhMTnOJuG8xPhpouXVrfXWUfE/sXXx+83oUsT0E/TVdbF6JX4LNfoy/+SM2SW3BpHBNj
         RhB5YH+PjXD8fXL7Pt1KbGzePiB8homXes/CyvN03w1b6TYUnAljvQj1zHAPwAS5Ajxa
         bibB10dqWMeIetRsH0R6mJ06PkVHgKSjjdBuobu2o0ZRPiwWmOLHUcChSbyHrJApySiQ
         pEAA==
X-Gm-Message-State: AOJu0YzgEf+EHCoWVb5QW4eDIEuSuFTb5fTScn5X6+/xh7IMA4G7D6Br
	cCsfXpu0i6WkSMiJNpNNgssmEaCCWDfFNXfVZe0IpgLswtrWCnRRcbunNZqTxlLcD37Ok24SrWE
	XxwYS+cEMFeXJeY8yFwIVBPZdLSw8jrDaYShwk1b5Wjr+M4J1lrIBSOW5JfnYAbHIuFzC
X-Gm-Gg: ASbGncu47U+oXsO2JrIrsl4zbrwvNl+KXZAyBQ4wW88zm8Z6vpFujt/UiIhJ8EvV9bB
	ujkquu6I94TUcOmhM8TZO147bi9qBw7MuH5GeeHcLCOetKHkhz2JsRBAbyID5uzSvWecaiiX906
	LHCA/UuHQLMfnJOhqaEzE3Eb6QgifdymaKtXOn4DweGgES4nY/QlKTthDpMGiXel94VdAVQRmaz
	uOHrCyROCFT+ZELDonvYgM4vMZDZtGOp5U66aktzflRBBfApXdx2tV5T+y30cITtUemS0Q/HTaY
	sTLZJvO5sNv5o/XrJDUI4wFBK37XQ2ev
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7490d64699fmr5349383b3a.8.1750434346094;
        Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVF8N8GgFu4/lrQ5XPorlr3lnveUTsCwOD2UXh/OMW5et3HBHydbLvMS9YAB8c/mkJVUmR3g==
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7490d64699fmr5349336b3a.8.1750434345576;
        Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a498853sm2387442b3a.53.2025.06.20.08.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/2] drm/gpuvm: Locking helpers
Date: Fri, 20 Jun 2025 08:45:34 -0700
Message-ID: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5zDTVL2ezTRB5Nxop52hktmrBoQY-rai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfX/mJfRWP9lpI+
 NA1PsPjPyDJ0kES8TQvQdHLWhq9bV6GuJZI+RANLsip6ECF19OnKUbpWqv9Z8BpSoNGucAULkc5
 fuD2SLKSLxhe72OKWUmnhu62GFpRmtg9xWT/6Q9gq+91CTAZVXLB/3VW3x9uq/rRtJpWJJMBKu0
 1PeIeUQUl/+LC1r2fPG9mBqNW/bKnfSIjiAwsR+XaP7a3chdxoppl5p69eMIsk3hM9hWPMVu6Ux
 VXHEGn5wZnY25KGts81r29uVfxNFefwfwRWSeaXnAptH0Ri/e4LwAe3TtOeMzBqLY0hv3Ui6sRY
 v7O6WxjY06ENnujwBmxGl353ujLUgePwEgkBFPcQ68vJzNLLldbSAwxACVF+G4k3dA9N1ywg2I7
 9PAmbqJ0VLANHDJhsf5mEEYw8GwDDUUdPixb0ilSXc+22NtHLpkG0TXy8ta6cyeM/WztQoV+
X-Proofpoint-ORIG-GUID: 5zDTVL2ezTRB5Nxop52hktmrBoQY-rai
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6855822b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=888
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200112

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 132 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 137 insertions(+), 3 deletions(-)

-- 
2.49.0


