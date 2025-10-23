Return-Path: <linux-arm-msm+bounces-78527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F0C00738
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E0DD5355AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9011C3054F8;
	Thu, 23 Oct 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9pPd7dj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43D42D5935
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215158; cv=none; b=fHqd9pB5VGlG5VswE5+eM6GlgQ+GCD/0N4Uk3iA5GPQxJCIBr9Z8wENdyxD2ypGYTPJRR2iTPKCfeQffrrhLfN0VGsB+YXMa13BzNAJsnbAaBmOM56cMLuAxVPCnJHTMjb87BD37Hm7Yq5m8Uxfq9CLt37N6fT+yBgqE8ElYEM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215158; c=relaxed/simple;
	bh=MuNDVGw863t1MIYdxFnFeXldKN/aMHxbss5HGe8ElnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0zX3KceVh+Pjj5C7cey+U/XwZMyCc8OKKaufWLD6mm5MXBTI6WLTq6ZcsQXzw3AdFIwVSPJcLGXnwiBpl40e+FQK/cwDcXSzqi8Szd2QGw2aejMG/nS5pfyQBX1hG3OBVesFu0HLTCdsMc7bGSCFxn3Dc3PTR3mC27ZRApTdIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9pPd7dj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6ta3H019818
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e6NuyEZl5rpUsxOevTTxhTo/WEHtJ7ZXG7h
	onHAVIWs=; b=n9pPd7dj/zaPBPQEhf1k+FZ+bs3OybuJ8u5pi8eFhXU3AC/AFcT
	m3lx3uwM2F7uUyZDMr/Fm0pJtGLCPxmZVNGBjDWPHGC2E4jY7K/5sOVY5KLgl9B6
	9oCkonKq5KVc0wZla5GrDNkoaPyTJk2GOJsmiw75WRV/X7zIisZav3lni9QPtEpP
	kZMKydpGwKXd4y2dywN03oXCs24AVBvrqqPf4m54o3lHZ4PYKrYVv38Sh0hJzRP0
	WQFKDgsRQ/gjHxukNFdugADbj+ULKS7NPnMJWYY22u4zNAq1lpjMaqhYFtSFLgPr
	kZ22M4EMKerOrwruHd5JyYR7vqVxB7YLMww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsdmu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:25:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a73256easo71101301cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215155; x=1761819955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6NuyEZl5rpUsxOevTTxhTo/WEHtJ7ZXG7honHAVIWs=;
        b=bxKV9D65n6AQiFIwGvnZz3kr94KOUTY805ZT0k4f+vLg1SVAO/cAaOSyGVNRVsJOau
         fp6h0VI/bZV+I+XI1MFPyro6YWb1BbvhtsyoUIvN3Hmx9yOc62hgDQboVSjs2uCqBspF
         2XTvMo1XXydYvAw0RBuifZ0ykQyrkU78WpdoFHxSdyoFtyLkWdkQz/ishwzpo02gk+0/
         gUyOCqxy3913Bmn1m+W/5NaERRX6vBkNUBPF99oUHTLR2kun8RiS7bdcvqwMPlNfDNbm
         otlQQgwwkO7qdba1UoAr+9Y+JykqGF3tNjd9YJbHXu14wTINcTBMxAb/32e52WIkt+kV
         /kVA==
X-Forwarded-Encrypted: i=1; AJvYcCWsfKJEKHYdZNQ58seIFMtOXVVjapiCJtN6a1yluhfnLXVKMQQHt1KacjkAAXvMdCu55tRgjXaefCsE1hVy@vger.kernel.org
X-Gm-Message-State: AOJu0YwrDlsEdzDC3/ib1MHpEWeu12us7Vq7l/kebJyMOYaebnLgU1AW
	VrBYXkExZcaLuZutM+k5ke1iJ6AK6LUH9g0FIOXmuGALnNm2Dg0MJb4BaOeYqWlzgWEaXn4CYKq
	sKP+l/enxasprtmKgLBsdvhzYe8zRtatu6auOYZj7YKPevbqFETQEShQ/aKUBYth8a+0l
X-Gm-Gg: ASbGncvgZv5sbPwAO87IaHH7dr+ioOJ2VBl3lMu6VMAPA557b980prtaqCI/vqSyFq1
	rZ4xAwwIkZc/r4WDe7IJ8SKyvzuNKjTk2aOwnqB71+JXfz+r0zoGhR0IWjkt7rE/nGsCyhPchCh
	hhL8ydItaTe6OsHFl/ySEh8mExVe8z8eeOieQThI1Gu3+tNs5PdIp2oV4aHr0TaYbsagePVM9wE
	qRvKgG4KabHJYn8UCV++KCePUZm/jizUA+FkBXPFNLIlVbyFVorLzuLyzrXXETboce4WnGxr1Xd
	E2mO+HV0dPv+KVCWeH+No+iM/ACU9pwSQeVuhH6jrk5tz5TZMZc1zW5DYmUiLU4/V3ktUrEYnzU
	YUR6Zzp/9wr1h
X-Received: by 2002:a05:622a:3d1:b0:4b7:aa1a:eb1b with SMTP id d75a77b69052e-4eb784a0e0emr61011011cf.2.1761215154729;
        Thu, 23 Oct 2025 03:25:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ+fBPIYF+HXBjwQ3mpEIhl8FmKoONb/emdfB+NWGfyifEI1oSIA/Fyjaxd3+5zqRuhDPVpw==
X-Received: by 2002:a05:622a:3d1:b0:4b7:aa1a:eb1b with SMTP id d75a77b69052e-4eb784a0e0emr61010711cf.2.1761215154168;
        Thu, 23 Oct 2025 03:25:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 00/20] ASoC: qcom: q6dsp: fixes and updates
Date: Thu, 23 Oct 2025 11:24:24 +0100
Message-ID: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX3WOuI6fmUZfA
 NT1KH0aT8Pz7DaZo0O4Tzmol3FZYX7e9tL2698tUPB26Ui+7dhLqjo2EZB8Tctl71DsOn9THGAc
 nClWNB3tbstyKAUhN9JZviOBZiuPmp2gd3vBS4Ccc/hqbGfRuF/uhiepZmJr4EzDvibSuisqf7T
 TOo2ovvZmA1OTq5Tto0p0T+dVx9RYE4obMZ9Jku+R4ixokJicwo9Ppd91qYL2HBewSPUlVUN1u1
 eH3aH56Z9EvVzSL6cvgab1nZ/+gPddABZAAUsN7dwxUjUPFLq7EboDuKcpmta1NvtYb/Bw+bQDR
 BmY+2zOCDa9dxd82OBijPRREFp1I3z7Am6VVVpv55Y1SDnahIaajgb1sFULj533Wwe+hdozQVIB
 IuT3hDU5ySy/AXhm3g5IMeijN9NJQQ==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fa02b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OLL_FvSJAAAA:8
 a=ywnRGdmwFc_i4B4SztQA:9 a=jdvOL2tdKL0A:10 a=UsU4ZBEK-5wA:10
 a=dawVfQjAaf238kedN5IG:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-GUID: 5ZRyQOpra09MUGpIQqTY8TO2B7t6PxIT
X-Proofpoint-ORIG-GUID: 5ZRyQOpra09MUGpIQqTY8TO2B7t6PxIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

This patchset has 4 fixes and some enhancements to the Elite DSP driver
support.
Fixes includes 
	- setting correct flags for expected behaviour of appl_ptr
	- fix closing of copp instances
	- fix buffer alignment.
	- fix state checks before closing asm stream
Enhancements include:
	- adding q6asm_get_hw_pointer and ack callback support
	- simplify code via __free(kfree) mechanism.
	- use spinlock guards
	- few cleanups discovered during doing above 2.

There is another set of updates comming soon, which will add support
for early memory mapping and few more modules support in audioreach.

Changes since v1:
	- updated commit logs as suggested 
	- merged "[PATCH 00/12] ASoC: qcom: q6dsp: few cleanups"
	 https://www.spinics.net/lists/kernel/msg5884053.html series
into this series as its going to be merge conflict, and to ease
applying patches.
	- dropped patches that are applied, added tested-by on patches
	  tested.
	- rebased on next-20251023

Tested on RB3, RB5, X13s, T14s.

Srinivas Kandagatla (20):
  ASoC: qcom: q6apm-dai: set flags to reflect correct operation of
    appl_ptr
  ASoC: qcom: q6adm: the the copp device only during last instance
  ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
  ASoC: qcom: q6asm-dai: perform correct state check before closing
  ASoC: qcom: q6asm: handle the responses after closing
  ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp
    under-runs
  ASoC: qcom: q6asm: add q6asm_get_hw_pointer
  ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
  ASoC: qcom: q6asm: set runtime correctly for each stream
  ASoc: qcom: audioreach: remove unused variables
  ASoc: qcom: audioreach: Use automatic cleanup of kfree()
  ASoc: qcom: q6adm: Use automatic cleanup of kfree()
  ASoc: qcom: q6afe: Use automatic cleanup of kfree()
  ASoc: qcom: q6apm: Use automatic cleanup of kfree()
  ASoc: qcom: q6prm: Use automatic cleanup of kfree()
  ASoc: qcom: q6asm: Use automatic cleanup of kfree()
  ASoC: qcom: q6afe: Use guard() for spin locks
  ASoC: qcom: q6apm-dai: Use guard() for spin locks
  ASoC: qcom: q6asm-dai: Use guard() for spin locks
  ASoC: qcom: q6asm: Use guard() for spin locks

 sound/soc/qcom/qdsp6/audioreach.c | 234 +++++++++---------------------
 sound/soc/qcom/qdsp6/q6adm.c      | 179 ++++++++++-------------
 sound/soc/qcom/qdsp6/q6afe.c      |  49 ++-----
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  25 +---
 sound/soc/qcom/qdsp6/q6apm.c      |  57 +++-----
 sound/soc/qcom/qdsp6/q6asm-dai.c  |  87 ++++++-----
 sound/soc/qcom/qdsp6/q6asm.c      | 203 ++++++++------------------
 sound/soc/qcom/qdsp6/q6asm.h      |   1 +
 sound/soc/qcom/qdsp6/q6prm.c      |  27 +---
 9 files changed, 302 insertions(+), 560 deletions(-)

-- 
2.51.0


