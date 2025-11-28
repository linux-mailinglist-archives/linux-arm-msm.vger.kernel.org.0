Return-Path: <linux-arm-msm+bounces-83731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B5C91A8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9333A2D5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109823093BC;
	Fri, 28 Nov 2025 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Or54hgXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCpOSUPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872322FE071
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326077; cv=none; b=jeCTgZm19STQvXo14mhzj9TPrsoMNergZSlFF0Trncwp+5e7vZBvHtvRwDUxuMvBXPfRzwx2XWBDDjab9Yh01FLqz3mNgY9gn9qoLkoOnkR8J+dWq89RfrklN98cAlA60EGjlxfIqspoXsXhCjsgVKviYMiKyapy7Y8DM+MHMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326077; c=relaxed/simple;
	bh=rsQXaBo9WJUMEF/Qi3gIhLSMxCbUtk4CKDQOT94FO0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cw1DI2cFme0R1uQrOo6SCSP+eWzdQNMhOt6CQAyFGzIztHJL4fTRiZtdPbezEOYb1OrioKtjkijKnsKwUDMR9jbx/oDRLTWkK2CQafwws/EDGDfzYxwe5BCWG//636NRGST8MTVcL7xnSzPTwnpjN7yjk92q6gvzOrYFUqGe0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Or54hgXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCpOSUPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PVZV3797264
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iQkb+hB6br9wMh4Wb2OdpOJc1CoG1Ifteks
	1A5xKA6A=; b=Or54hgXcwNALe5b9f99mOl+7H/yS49XyfogFyOojkT13tfQayE2
	1BaBy5XYvplt9r6ZBP51/rMO2Jb5s1Z2XopWKpRUs2nmBGQ3S21613f1Apg+w93w
	fz2vEC2R6DLsd0lQxij/pAyIOq0QuF9pFp7R3gJKkNEilxe9NfUzLOoR+74ls3u3
	MkVddsf8xl8+M+Se89cCw+JZUh27ZgEg3kRKrBsJdMsnxoqjTpEtVg+QfET8Xhnf
	lb1M3cECziZ6+Wi5t1UEb7dqMVemlfvUjlx7E71iS8bIP3NJBOB3EP8OhsVx2tE6
	vmgoX/zix5Z/34+ZT4QMwgKIxkHdbsviRbg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudau5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297fbfb4e53so27679525ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 02:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764326073; x=1764930873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQkb+hB6br9wMh4Wb2OdpOJc1CoG1Ifteks1A5xKA6A=;
        b=kCpOSUPjia5bYG43HvW5uaa3bBUNM8Mj6ijP/XhRKDhxVLfIzgfZAfW+TZLTB5lu8a
         KzRNvaB5hlVOtO/CZ79D3dEMGjxNShPmOkygmUk6yps4MsWoSygESVbm1QSyTIS9KfRL
         +DGiDlRY2a9fW/4kXP+F1Ol6ZtoiLSbuhJA7YkzVs1FJx6dGaJnZ6Qh5blyRmvc/HjB8
         5dFONGGeojA2YdeKiGqV/sY4bzq3iYsu1RmPn8SGkfwLt9Vb/LH0bI8CkrfdlLLANV2A
         zekI/lIr6bj19c1d7bwOQizKoUD/MGY0WuO1IsiTUX7dNBt3KibWeuHGpgVapcqoALW1
         eM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326073; x=1764930873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQkb+hB6br9wMh4Wb2OdpOJc1CoG1Ifteks1A5xKA6A=;
        b=cGsJ6DNelx1oyMr8uu3wh5pIamU+wXdYTUaOK0Mk1H4WmFYr1cVQLM0Pzmnx7NN8JW
         xtZAju5/q3u9F76B6NwEd5P9dd1AMEALZQWQ3vfUSZPCKZZ43W1/5VcjDeolgjKB5U7/
         SAnDe2i2csGyqtnlYI5NhOXjPSXWahAnJf0ZQNNPw5MXrO7qjOj2RIH8GQgH+saser1k
         HN0Mf/RP4blSS6cHv+xzzEDo2Ymn6EjPtTZgsI9azQmXr+m7/MZI9v62Jf/4yWpHejIs
         MDiO0gUbjW1yzcgN3rgNBl78FJ9sseWo7o2WJy23atFm9kiyx+jbZW6APuRntEJL3KG7
         y7HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB/OYOEkvl78MyMJUwCfkfiUwjx97znl2x+7RETKdTN3k7mZ0FILayi8P7OWNvurgxzCBB4ufgDjv075l0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3RTda/rcfB/XuWHPc0DjA723DYiV/R5uOMQDcegijLLAk4oz
	ASOr1MWGoPP8r9+lTqT6VaswblQ7n2g3y1vECmKRAb7lFdCYuHL/3qkgBUAeDwuRy5Yuhr1u8HL
	xiy+Uekew12eCxhMMFXTlSu0XVcimJE/sv0782ec2YV59kY014RFo+aQNnaLqpyL8cIyV
X-Gm-Gg: ASbGncv0NPa/Vk/K1LU20EwOqRVhuIS9eUf/HPfuRoQgDn6LnAs5JVz3B3Y1dpEqtPm
	fVxLy5G36st0ucjzHqwKJP6zMrhewdGWnSfbRNPdGDPRFKG8Mm1OyY24IY//xSiVcnXfxhuwHcn
	WWsw2N6SEtvw9IVIMDieWqT+wxMw/MC/tHu06hIraAbK8NabX2thwDo3SWIZjfDRLk8t9bGlSgK
	iAhe2TAmKpZrxERc+ZTHXKtWXzSGX9qgeEh13ACJ/uBGf4IEXXUrONhXO99TJPC/aGdCJh3QK3m
	erKhVqgMkhNOCSYx8plalwbYrXwwHRCKZjjKGK0nIsoTClGoWNdN9cSpx994EFxam1sKfyCarc0
	rIQJSsM6AhUNsdoAaLQCwGrCU4I4hXE4LPcUqNw54xw==
X-Received: by 2002:a17:903:1510:b0:297:c048:fb60 with SMTP id d9443c01a7336-29baafb7bdamr175809455ad.25.1764326073192;
        Fri, 28 Nov 2025 02:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL2Urteh4mBeitadW4tKMwngg0RqL0mlSONaWNQQ8b4oSmJQhHKhaNzkjKfFpFVZdOWcgHIQ==
X-Received: by 2002:a17:903:1510:b0:297:c048:fb60 with SMTP id d9443c01a7336-29baafb7bdamr175809065ad.25.1764326072707;
        Fri, 28 Nov 2025 02:34:32 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40b993sm43098195ad.14.2025.11.28.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:34:32 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 0/2] misc: fastrpc: Refactor and add userspace buffer support
Date: Fri, 28 Nov 2025 16:04:26 +0530
Message-Id: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mh6J_-E58mfqu9civ7m0ojP200bg1co5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX/4/Gna8nW3+9
 /vmEyQoBI/RbYasF5TALxz1IuU+RerDYS+iK8sCb9YXN+ab97TtNrWwPGT1D0Q9YUY6a3+Hro9F
 GAzIHPQJ5NHP47/pJ8NWrKm9aPpQdRYb0AUJDLfYV1uQ4yw6/CatbFdWufQq39mCvCTTi22XBBe
 UgtkZq8e77uB4ZdDuvu6dO4heorVfTcHc0C0ByImhMOjPKfItfY2v5OOB3NaTW40sudtceOIPXd
 L3GqGOyIAetXh/m9HJ5j1IJsWp/nQOxejwSKncH7TWITmBiHwRi9jBlAYjTHRRqwfuPuwNEzHpI
 n/zsgBxHBiEZS+DR7omYDLSKm0sMhyFPAeSY7ItR8byREry/qDfc4m2H9+Knp0RpMlz4rZdUM8P
 +lWWnV7o7hCjbST/lM0E6W/rEPF3Qg==
X-Proofpoint-ORIG-GUID: mh6J_-E58mfqu9civ7m0ojP200bg1co5
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69297aba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=na3UML1GMWht-DHXVPAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280076

This series improves the FastRPC driver by first refactoring mmap and
munmap logic into helper functions, and then adding support for mapping
userspace-allocated buffers to the DSP.

Patch 1 introduces helper functions for DSP-side operations, improving
code readability and preparing for future enhancements. Patch 2 builds
on this by enabling applications to share memory allocated in userspace
(via rpcmem or DMABUF) with the DSP through SMMU, improving flexibility
and performance.

No functional changes are introduced in the first patch; the second
patch adds the new feature.

Patch [v1]: https://lore.kernel.org/all/20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com/

Changes in v2:
  - Split change into meaningful patches.
  - Replaced uintptr_t with u64.
  - Fixed commit message.

Ekansh Gupta (2):
  misc: fastrpc: Refactor mmap and munmap logic into helper functions
  misc: fastrpc: Support mapping userspace-allocated buffers

 drivers/misc/fastrpc.c | 190 ++++++++++++++++++++++++++++++++---------
 1 file changed, 151 insertions(+), 39 deletions(-)

-- 
2.34.1


