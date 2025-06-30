Return-Path: <linux-arm-msm+bounces-63104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8188AEE681
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2E883A2F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62C92571C7;
	Mon, 30 Jun 2025 18:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebIZo26g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E003228FFCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306977; cv=none; b=feuLHkDpMoJ07PsOSA+BpLD70J1vsbOIWC9e+n73wPJsLZHAEN/0hTK203gHJMIG0CSGG5TE5ViLn3gr74n5NquGLa/JT7PkSk8IZlNdKu9SX12p/kh9eHG4JKrWXMUs/lQNtpYzaseJSf5eWanZ/iRToIu/wDmuooHdgiACGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306977; c=relaxed/simple;
	bh=qhbKH1UyFekOsnA9zk5XZBl56vwXBLqPiK7kGll4/TU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAxMz6IxNa0YiCMosZ+DfWqiuIpoZke8xo795YGNgIpjTm4f3KK72ZE/sPTyRIWgZ63ToEmxN5C1dwZcyr0FDjFD8+TpmS96DFlaQJl9dXcwE/4AxEfu/0dXKoqFgFW6b9Uzet7P9A7tWSiWvb5ihujXQ5erhgQL36J7mNJLvtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebIZo26g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UGG3Pc001184
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x9KnxqwEJc+HWHtXoNL1S2omVHVW8nAO8o+
	NVbhYku4=; b=ebIZo26gSvRaK8J9/tALzeGEpRnx8JxvJsj/LBZEOwxDfUln/P/
	8c1OQz78XaW86Z8ENTJxOvVgegSJFXBDELuWKLTIcAc43PwlM/2vPhejwWxbRO/m
	zAUNXZZwbyIvELXf+sqboNA1Jasi7ZGaZf+DJImn7957I5+C7KwIp5xsM3koj5Qs
	7LfzFj7AuGZoUTaBpnxxRZslQt4pKfRAmswxOOTWfuyMXbkDIGCcwBU8Dd17pHAR
	UzHopxKHYneQkkpLm/AAtQPYC/LxY7VJ9pkr+Zz2d+X3iFB6WmwTPAondh2DlpxL
	hJHZFiCu6H2jN4bBmNy5UzVY0Sj45qZIm0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm5rab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235196dfc50so42140785ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306973; x=1751911773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9KnxqwEJc+HWHtXoNL1S2omVHVW8nAO8o+NVbhYku4=;
        b=aD7/pXQMgrfeOu2VmrrabJBh84dK4MzrBHS/dS/U1bVZjLQBrx1W85qG+1zoTsYWCZ
         sDwqPpTl2QC78FeaLlAyrsJ9x53sZWBqbYHg3MAmJMMM0NF3hFBrKvM50ZJWfNkGThzr
         S/bumIttK5oOkH9cTLuUHFyyTmRfwGnL+b1ZK9t0TZcHa3KW5thyKoRlBdwFtTjUqDiU
         1ePcnrbuhcQdYAFkTIIYI0vZDJY8GmxDOzHyryx1xsNKcD/fmGYQeev8xeQuBsEsHyXb
         dkxr1lmogMQFaeCVNuMd+oaW9XxoGRZM7UACFD8q2cIpaB7a5COysojJ9riv255P+gkx
         J+MA==
X-Gm-Message-State: AOJu0YzQm2ZLxsLq6CAVqiyEMnmpVtBKXtPC+2l0x+btM/c4cUKUEEe3
	9EAv5QxHNcb/1oE1Gd5QAibIHX/W07z3HtOhGEjAKIE5tlmlHzz03wh9UNmpWIAT+5fwdkjv2kz
	249S5cisE1dXeHJqb06wZYBp0tx2ht0MA+Xwt2O02afnrkJdLILUYZj0VO6plq6EpebsK
X-Gm-Gg: ASbGnctQjlTQa8wqG5ZXH5IIZxtVEnqyfdhLlONqntqXzvyZIrPEfWoCJduziKNC1HH
	I1Jxreyz1lClJ3cQh/wArDJ5cSyqGEJpOgvPYitLwJqAsIp+788yhnkEORYtEYCKn9MVxjd4uKg
	WthEj8L2mQ00gp09QPFtuz3Yx73rAhC7wQh+zvLPe9K8LFwU5lD9NUFMeA8+ZfUVeJbvrYd29EC
	+XkVPcUU6RPte91vkqbD4GJ3eB9vA6g83vcZe2mdqKs+0Tg5qCohc0oM+SRpeCwuEtWWTtZ8zJQ
	FgduU9izZ2pz8DA42ANRvbr/hJtF9w2RqQ==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id d9443c01a7336-23b35545a17mr7443585ad.26.1751306973154;
        Mon, 30 Jun 2025 11:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwlNKVtSGRIyEibiPUrhr02qDBf+iQiBkAjGKzlXHyQ+Lcf8TGWgZRZg1jBJP9hH/yjBSXew==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id d9443c01a7336-23b35545a17mr7443195ad.26.1751306972629;
        Mon, 30 Jun 2025 11:09:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c951asm90847765ad.249.2025.06.30.11.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 0/9] msm: recovery and mapping updates
Date: Mon, 30 Jun 2025 11:08:54 -0700
Message-ID: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6862d2de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vCXyEyYqIO_xeLtmHscA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DWReYKsNwonJXpXme4NCYIBPP2rMeVWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NiBTYWx0ZWRfX7lbqZsgoawJH
 a7M60G7lDxXUYjg3EhBvcCHAYMVnyZ2RkTlrRsnIKX0R3SXlw+DPvOzFHF9wN7sviIQZ+7sqm8W
 /eoyM9TRYi8q3oyB+eAT6Tx9arPI571Kzfi+Q4ep8jcReUIGpzzR5swN5xm+Cm8dveWfONI/CG/
 fUDFMMm53DtHcDvNMS8YicF/T/TLej/mUvwFIrLEhbY0Ye3xMDHeorJgQgVvCpw2mu7+AmFoBcf
 S4NPajAcm7m/apPk+lwN5GiBHoJKJ6QNiq9ALUkr4/bsUB2IVgvPcOVoe2UZa6AM3wKUw6TMttB
 Azt9FR4mg//lbHwDDwVVJtDb2bpyv+IEMYPIC4qLyj+WhmPI+ovw1ehoIgdMgDyhlzU0lXnXRA5
 Zh52p5ZgR4A9UUeeupJnOkNmb9v2JVmnVVKqqq1vWqSxo5dP+zL10C/gcoW1Vs/VFTDhXzZm
X-Proofpoint-GUID: DWReYKsNwonJXpXme4NCYIBPP2rMeVWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=885
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300146

From: Rob Clark <rob.clark@oss.qualcomm.com>

Mostly updates to address flakes, and updates related to newer kernels.
Plus a few additional sub-tests.

Rob Clark (9):
  drm/recovery: Wait for devcore to become available
  drm/recovery: add iova-fault-stress test
  msm/mapping: update for sparse
  msm/mapping: Handle BO names with spaces
  msm/mapping: Add additional subtests
  msm/mapping: Wait for devcore to become available
  msm/mapping: Handle larger gmem file size
  msm/mapping: Add wait for stall-on-fault to re-arm
  msm/mapping: Free devcore

 tests/msm/msm_mapping.c  | 90 +++++++++++++++++++++++++++++++++++-----
 tests/msm/msm_recovery.c | 39 ++++++++++++-----
 2 files changed, 109 insertions(+), 20 deletions(-)

-- 
2.50.0


