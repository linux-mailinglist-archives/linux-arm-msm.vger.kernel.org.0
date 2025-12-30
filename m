Return-Path: <linux-arm-msm+bounces-86949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 106A4CE97EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96C9A3032FD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF0D2E8B64;
	Tue, 30 Dec 2025 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY+iyGdF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwWbeP0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD622DCBF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767092555; cv=none; b=r1KMU8PvaPqDXI6bXg3FuvyXOV8AXiP5DmQREICwKd7/e065j69lHQQnuI18kDKVqITBAeG8sJ/eUdZGjjD450YLpEGa8CHEgsK0JVt8BFEvL7UKGz5lPvbFyWML2LFLUME8R8ySgBtwbFu3WpA5zvEHVqQSXrovyylvpDMGI2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767092555; c=relaxed/simple;
	bh=FMzcSzcqlV+qw/sCz4sSJt1fmRejycE8k07KII5PK2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eWrqJOEMPyb9no1v0nzdAiLcQ6xDKWMDyCFseKRWnn5W4/ZBmDAt9llCL3ZANqQh5o6qsnT3bcPyoFtQudPrN3rR2MQ3x0vCcdnxHatVvXvCq6kcZsLquHbs6K78bgnGzPLx3WcFLxPasIU1nXrv3RbmSe/uSlu2XOq7tRKNRdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY+iyGdF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwWbeP0r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8n4PL2284829
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d/zHG+LMV2QI0NHjUU6ZVKAy87KQ4v4yG7X
	AbpP40kc=; b=IY+iyGdFEcaSYkCID87NKhFm1kRFQBAVgs8DiMfQ9jKB8Qjqh/x
	BnmAW+hNSo2P8iifFdH+LPYiL436ClwsH8JdWX2C9u5X4h4o6EYzttehZnLVyl+6
	vrDgnipGXKK8A3AAcDYIJIOUjiAMhl0Jx6y5Zw4lOygLhC+ady213T89g5gG7NBq
	7puB69tpyANlLtC1LY7ur8KNaSZ2bMSGSIGuisdh/SWW/n4oTzkRGRwN+Qs2ETQG
	qs89P/6Ag96IEGqslHGiK6plJqm0Y1rC2zRy9CV+8/im5am72dmek/KXHZby3OQI
	W+xnFpWz2aINNUFiDrtHZ9LevsPKxF4f3oQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gsqb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c6e05af6fso10379947a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767092551; x=1767697351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/zHG+LMV2QI0NHjUU6ZVKAy87KQ4v4yG7XAbpP40kc=;
        b=RwWbeP0rtoDOtcRDmtSfTN3CP2ZhH/QHQtrdRnjKjIh8EZ+PA0ALqmYKmsHgVS2Z6q
         XthAw4PLYVcRxWSQpdp0/+NCfRN3m4VpD3LMzxkRjQyMWA4rv0W8cxnZxKa6vb94DntE
         z36gwuQImjyeI+kxIifVY4wBxXy7NrzRjAUJF2mbTH8DMptMnxUeA6J8OzjT/UfNKpL1
         2TkDKwvicJRWRBmb61Qo6FMklgHSFIx7SU/lrPHVNnS8esvVlR5pHHb1SfM/i8DdqsXp
         snmHBW4jbshI+dUQbV75lKSv2mdc6SsowR6P+4b2TZaxck2trJfnsh6gJFYXHEcTr2WD
         118g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767092551; x=1767697351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/zHG+LMV2QI0NHjUU6ZVKAy87KQ4v4yG7XAbpP40kc=;
        b=h3LnprzRZdOXOxuhJKmIvgmaEV0ymWB16yGs/CeWkZpk6HNyZX9DgUzgriDjmPn+qD
         yVM7r3tEd/Lg5IOt/yMlFaiWkFV7AW0AFdCnmM76cwAP9HsFjRdVBqEilHqHst0jfA2n
         FJ5zMr8kYrD4yBBv2z3/jhCpRdE+5AyneD2KJOqrFFvxE4b8B3K9CXKbJPB+HUXHG9hH
         QrgcIT/TWKp5FjjioTB9nsI5aMULcZXpKXSzUfij3CktzGdHW3WewLEH1XhX94ZoBz/r
         zeQ0suAA7+dnP5JzJHl1h7u8/1oeyygr6+VOCEm6tyKpLYQ5KvEDCbhydp12vxpGdCpu
         tt1w==
X-Forwarded-Encrypted: i=1; AJvYcCVY9+ePo/vIyg6Wf1Y0Xghr0NlRYzNC3poSrNrIg9LO+4VvntsLS4csmSvqFaWXivGf5zgzkaKVzHL4mJr0@vger.kernel.org
X-Gm-Message-State: AOJu0YxzrbhP+25634mgpPc+LEei9DDcqJkl6Nc1FOiupMeEnEmuVlHs
	Vqh/aKhtiZzrTTNvKKg3B+BArcutmIGJmu8epu0KW24eSbn8tZSiWVloJUyDUJ1b+BeaP8vQeGA
	6A2DaG79Df/egVnXgiCHOQghtQp3NBnGS8a/Jld6dtuHWgWnGmzVUblsHsFe0po6nkTi/
X-Gm-Gg: AY/fxX4sRA+xJ2qYGnMLJXSfAKLHv1DlMa1RK/LH115NkOnorYFLNU0WqcgiPjVPPzT
	e15+P+TvfNaG58C2/+KrF7ljVDnCsJu+bEMRN8ahzz1eWOlt2W4AN3c3PIaol2w828BuhML4e5v
	K/qJU26my6O95v1yXA0aIl/XZ2DFYN95fC6TzOEfS3znXyowmCZKGiT7x9Tw9M2MytEmQrO6xWA
	b0iBP6Ak2J2oFmZA8K4QGHcjk3wux6YkQJE9CSJo+fRBM3G+rT40za39i0dQdsk0weUmcJ0qQNk
	r9NAxTp9oJ5gABgGKzqVfSqwfRxtiT21iDKZfHKlJP81GnqmkYOqLIiYfuwgXFRGZfZyoQRoing
	emoh4bRYykVirDJJsHMDrMDBWNUHCI742VZ+XoQ6xQQ==
X-Received: by 2002:a05:6a20:3ca5:b0:35d:b963:f877 with SMTP id adf61e73a8af0-376a7cf5060mr32989103637.25.1767092550884;
        Tue, 30 Dec 2025 03:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFHd0dhFfGTm4/5cfDiP09pgR60Y6aT7n158xtH7J0xViIFk01koV9TQ6iyx4GS7/bXIeRQg==
X-Received: by 2002:a05:6a20:3ca5:b0:35d:b963:f877 with SMTP id adf61e73a8af0-376a7cf5060mr32989065637.25.1767092550297;
        Tue, 30 Dec 2025 03:02:30 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:02:29 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 0/3] misc: fastrpc: Refactor and add userspace buffer support
Date: Tue, 30 Dec 2025 16:32:22 +0530
Message-Id: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fjVCZAeibzaAXM4YrM_R-ysN_NvImIe2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfX17PSXvk9s+2g
 FE1aiKIWfV+l9o2xIno1v0RlnKxMWLvYH04vc257cuf9+nZdkdLIeVnxRNfh6eMssdfQ9nUO9k+
 Eo5/xfcmaj7CpOhoZIuqKjhnzPhgqMjvpnWv97RRGek/IXqIFkEalRARzLJ8n9NF3cQfyBVVxX2
 bkvov4KY9ANbkHgliJ7kZgk22Y5l4akLk3HREybe3qYx8+d5Hz0jVBHf2zWzs25YGZ4HXq+KsC/
 ewXNvvl4AxFcj0dAtDOlzO4BmfNuKnRR3wDrUzhkThA0Lk3T+7LI1wHGV8U7kOGIsvsVd280CmR
 wW4ruP4nAZualXhPERHuZCzIBIekydb8hJ2RjzgbOg6/fArNusikatjcLtVjak0MHDlujmWDk05
 7moOSod0LyKRJ7Uu+cgi0hhi3YfVFuzWNXAdEnbHk8vAz9LxIrGPnL9ds/lhn/Ub/AW78u99gMW
 BmT2nLd/S08NGbe/V5Q==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6953b147 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=na3UML1GMWht-DHXVPAA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fjVCZAeibzaAXM4YrM_R-ysN_NvImIe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300099

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

Patch [v2]: https://lore.kernel.org/all/20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com/

Changes in v3:
  - Added a fix to sanitize address logging.
  - Fixed type-casting.

Changes in v2:
  - Split change into meaningful patches.
  - Replaced uintptr_t with u64.
  - Fixed commit message.

Ekansh Gupta (3):
  misc: fastrpc: Sanitize address logging and remove tabs
  misc: fastrpc: Refactor mmap and munmap logic into helper functions
  misc: fastrpc: Support mapping userspace-allocated buffers

 drivers/misc/fastrpc.c | 208 +++++++++++++++++++++++++++++++----------
 1 file changed, 161 insertions(+), 47 deletions(-)

-- 
2.34.1


