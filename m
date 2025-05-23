Return-Path: <linux-arm-msm+bounces-59223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218CAC2371
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 15:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22BB1BC7C67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 13:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB33B2260C;
	Fri, 23 May 2025 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pshbatds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBE17BBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005587; cv=none; b=tu6j+XpR4Z6kKe/uyZgazCG+ym3XiBLeYJPcZCoxvE3U7OBwtl0W82g4o3ZMhUgRqmVNyYtAdEYBcvdVWWu2zXBmPJ3sV6uGXNlY1WaQyN4KsAclA5259wU9VjGeahdMJgQ8eOKnSfnrVD47dAyMYRfyAlDj4on5Iw5934rCkbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005587; c=relaxed/simple;
	bh=NqsQKoyH5XwgFnrjy2QDwdy0aFDN0jlWu+yux8ynH4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pMKG2dmlLgeBW6GnzpNSVD//Od3vVPliMI6iGhuHWACbHySRFtuQTHIdaYE0qh+LzLhhRBD7eUnEEDybOdOo43Jpwn0qqaY83KtGzhmDCey62mDB4AVGA/Y4XygEkIrPSbgIj0mzOD+bKQnccq4LRXsmRMmKJTdW/+gZD3OmjPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pshbatds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBsckX016644
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D2ZwAv3+/k8jq5bB/r8jN+
	Yh3nUziGncMv3EzvPlvAA=; b=PshbatdsvJ3uQjQ8BnuYeX81N/+IFW0dRTLdX4
	w5g6Dxn4NWdF4XqWbnxdlc/VHyirTbr/S3oyOIz7ywde21qp/YyPkzAYVdJHqj4+
	+mjHQlYodHPgljgsECGsNEvV3+9qrl/rQsAv2gH+SNpE0a+HYzxsKHMqJkPPk7WB
	0HMewcrb0W34cLzNsqLgNW/tdCkexABUbSnZvJB71XlMy7WqTZ2JRiqBEWspd8bq
	cIwngnleKUIwVcKBvQnlQrPOcitClg9xSjoUS9tqaOYyrFKVR0i3EAizIhHToE3B
	jUrvmuF7e4NNatwboAXN6J4ZE4p+ITESac/WQ8S5xDbyS/GQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa251q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 13:06:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ed0017688so5337673a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 06:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005583; x=1748610383;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2ZwAv3+/k8jq5bB/r8jN+Yh3nUziGncMv3EzvPlvAA=;
        b=INokR/a19K2aXeR69mamdccdApeSmWLVPjrwERlyCJ2pSaAwGaQcbRPB6vhR1+Sk3D
         K+w+pGIWjSBTUlrRHQui/t8Ex5VtvbfD8NdVoj+E/Bheb45DfacaPZIYA7E9cyVwTs3l
         hx94YUXO7XVArEXcgbLP4aR4RCgcuyFd8umdQa1AgeGwtJwICL2KTeJZgitZmzEngbw+
         hJpOg/tVRz99P/vV24eJSzvz4JwQVjglVwvWsAG6MZZSyk5h9rPjVCTmgsd1mBW5TxRS
         P9g4TRJcKEqGtneKSWX+TnPy5aGDrNVHorC/xno5kxi6igOuYNyhRiIuCcNt4fhclMlg
         hHTA==
X-Forwarded-Encrypted: i=1; AJvYcCUknfL9SL2pJZOLrVtw9+gDMEIdHuYS2awkuQydg7raa0fKy3R9sdX/AEzXDUGIUdbj3J7Tn38IRqo0UnRY@vger.kernel.org
X-Gm-Message-State: AOJu0YzelpnfnJu5s9Z9kRHzFbQ0mL8Nm1nEs0KD1s4nNQtpLb9vtsxp
	or1wYuKtVTI106gOtc2KdZtbkpa0JugbAMrGwfQ51k/vykGY1qhepnI/A5a6K27vzJRXO/OQixy
	HeePw4iZnMGwmyDfvH/ujrxcKSkyoxO+0p0h6fc82NDjjPJjWIg+hKWZ6K1O4Gizbo98b
X-Gm-Gg: ASbGncuH0H1NDqP89fHCRPW9LLBlUpF+dRZ1uX32s+v460XyxzqpKVfe7owtyfTuyUx
	+vR+o4HRLxbRcRNRe2qR2GeEpGKCR2gagtjv9zRT2FstWE7CWruGGS/73EdwMI0ONT7pLQtstKg
	2jl+tCknGx91SlJ0y0TmxhLeHnESUb0oqjH/0UH6Y/XFTbCuSlamPkUYb3DbgKgR0tzec89xw/t
	w4NSbu1S+Lqem7IEXf/M0jFulk+3vVxU2P00wXJOdPwG4RzqaXrKXfW77L9g1C6eYUo2EiBCbUA
	1JwnXbwCwt7kIJiwEjuX1szr5FadnWYs6Ml+x2E04/+Xh/j2/v8=
X-Received: by 2002:a17:90b:1b03:b0:2ff:58e1:2bb4 with SMTP id 98e67ed59e1d1-310e972afd0mr4224635a91.22.1748005583123;
        Fri, 23 May 2025 06:06:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdJsIyMKqkXweP/UYp5yhqH8qznBRczsJ+cQdN4PhNXmYJdgeETzFaBLjNJrPAKxxcvN1ZUQ==
X-Received: by 2002:a17:90b:1b03:b0:2ff:58e1:2bb4 with SMTP id 98e67ed59e1d1-310e972afd0mr4224601a91.22.1748005582662;
        Fri, 23 May 2025 06:06:22 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310f1544d30sm816165a91.15.2025.05.23.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:06:22 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Fri, 23 May 2025 18:36:16 +0530
Subject: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMdyMGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3aTMvKLUAt00i2QLw7REgxRjwxQloOKCotS0zAqwQdGxtbUAkV5
 3W1gAAAA=
X-Change-ID: 20250523-binrep-f8c81fa0d31d
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=683072d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=k2a8_r_j4jiI5Xvw-VoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: lnzdpzJI9s_V5My5m2jMVH-NtK8JxznB
X-Proofpoint-GUID: lnzdpzJI9s_V5My5m2jMVH-NtK8JxznB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDExNiBTYWx0ZWRfX+A3nlAeloqkk
 uNX0kmoYx1gs3gYF59TYN2SCo5FED/qsSc2fkrZhi0Tb+k7blfMmPJ9ijBxsY2Pup3v78DFniuc
 jzRxo+esMq2C/XVeOHggyvvk1MCn2Q2slsdDfBgkSfc302CQw/EUozCc3rV3IUYhcF5HG61cwfg
 dWgkgKu+3CMDN0dQGUafrqGOtemv3lY4f56WQJ0kSmgOKMjQyDbDBRZufIRhLNoPGvB7Za5lnql
 ybAsakwcXLvv8N1VKFoyX2Ddi+HzrdCIYw2T0+e3vpdlplylUYUP1xD57lY0u8ZbBiV+zSCGyLy
 2N+LEPBnfCga7DyvI/sh5sgfBiw8/tbZb+4dT55C7tFrsEfjhe6o3riGnSnar4FZjWF6R3EhUrg
 bvnLXuB66O9U8k/lj5c+vTMCoFy/zOgcBNfWPIlGcw7okbgfpHmyVCotxkuQ2JaEwpytbdy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=689 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230116

The files generated by gen_header.py capture the source path to the
input files and the date.  While that can be informative, it varies
based on where and when the kernel was built as the full path is
captured.

Since all of the files that this tool is run on is under the drivers
directory, this modifies the application to strip all of the path before
drivers.  Additionally it prints <stripped> instead of the date.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
The files generated by gen_header.py include the source path to the
input files and the build date. While this information can be useful,
it inadvertently exposes build system configuration details in the
binaries. This hinders binary reproducibility, as the output will
vary if the build environment changes.
---
 drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 3926485bb197b0992232447cb71bf1c1ebd0968c..a409404627c7180d5b0626f0ce6255d7d0df5113 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -11,6 +11,7 @@ import collections
 import argparse
 import time
 import datetime
+import re
 
 class Error(Exception):
 	def __init__(self, message):
@@ -877,13 +878,14 @@ The rules-ng-ng source files this header was generated from are:
 """)
 	maxlen = 0
 	for filepath in p.xml_files:
-		maxlen = max(maxlen, len(filepath))
+		new_filepath = re.sub("^.+drivers","drivers",filepath)
+		maxlen = max(maxlen, len(new_filepath))
 	for filepath in p.xml_files:
-		pad = " " * (maxlen - len(filepath))
+		pad = " " * (maxlen - len(new_filepath))
 		filesize = str(os.path.getsize(filepath))
 		filesize = " " * (7 - len(filesize)) + filesize
 		filetime = time.ctime(os.path.getmtime(filepath))
-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
+		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
 	if p.copyright_year:
 		current_year = str(datetime.date.today().year)
 		print()

---
base-commit: fc5c669c902c3039aa41731b6c58c0960d0b1bbf
change-id: 20250523-binrep-f8c81fa0d31d

Best regards,
-- 
Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>


