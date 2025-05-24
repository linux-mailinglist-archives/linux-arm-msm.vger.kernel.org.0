Return-Path: <linux-arm-msm+bounces-59296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF03AC305C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 17:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412CD1BA0D3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76361F03C0;
	Sat, 24 May 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhcYwmwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D71EFF8B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102151; cv=none; b=d21Fimf7yGsgTfoh52JrlCh4hI9JPW867N2DA573TQnxF6v2ltSMghE2z8DaLwlp549zP959/fJxbtxYW9qJRuiWUg3etIbjl5n3z3G9KZ6HA6aHVfPjxQKa+pOtPuw+RHBmcYgGE3Y3s0KKdFgQJ9BTr0Za32ePkWTgcPoYvbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102151; c=relaxed/simple;
	bh=ljssUhbJ/Dlo/98coDHxsN/uR+m1VrO4HU0Yd+OJvuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XIgvSQQSZpnYZ2Iq2ozcR4DjwJFOlqP1BFnvuNvNI3E0lJITcO2M6dW+p1xUifuIkRClGxHIenXCYftUujwPAVb7fJFXItr86MkD0n9X0l0pVqutC02SVBkjsz0Ibt+uasVSXF4qdxpCO/h5U8pRPMd9T1nbV4gnkGYiDCfYy/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhcYwmwU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OCIvOW021083
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 15:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ENaXaAptX7hV0LnSeomxQb
	fTAaRBDEz7YM383T9ESwA=; b=LhcYwmwULS5KfUeqGBzXGcoruxONco/eBptlY/
	nM1vtfzRk5rUckwf11bl6c8rdzYN8frmxC8Az0cbDkZRSZK3FcSEJIrFqIrIyiEB
	MKTJw3/ehE7aHXwNeS/cIzqi0PW3nTF50HalXOvQC83Pf75UWiKOYzfigigLv38I
	weXKpwY8VkZgKz7K1OkE3kCAEWLBZN9O+mwSn19m14dhC92kGZN87opWCDpK2kWU
	lwtVj/mQITdmtbukbCtD87LgnriAef/AaZC44X5p5oW/+k+jmyLuXXTOzz52FGA3
	oPWHvbEtDf1YFGd5WTyFsjfjfzfhioH7+2ljeC37eOuffw5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66w8tnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 15:55:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231e059b34dso5126795ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102147; x=1748706947;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENaXaAptX7hV0LnSeomxQbfTAaRBDEz7YM383T9ESwA=;
        b=Cmn5Neya/BjCx/b1Oo6mbOhuz67ip6uMPzE976GTQMifVc8tTlaGXF49nGtiJv2klX
         xnGpZ52rocX0Ng4WKeqUdRagONm6ACNExUrPZvLxB7bxmVcLRofkV3fXlcrmNQpPp9Rv
         ndsl395cWt1W2BFIGYZoPe7MOEJAwhBxlF229HMwGw8nTuFrdQXJpn8+ncE3yZ52vRsN
         zSXlpayvDyGp5pVKaxS6ptEiJbPyLJ1JY12TlV8s05OcZqfRp6sy1LfJXxdo5whx4R37
         iR3z2vh2+BrPQZV2HNWeF5eCL9l+PMtuCKynt0gGDcpeog2emA1gERhBm5ltQoPu3VEE
         FDmw==
X-Forwarded-Encrypted: i=1; AJvYcCWl4NiT0PTO/0yjxmwi/8X/KUbtkGhj9zC4aPcjJbg8Sa2ITvAqFeiPoLNXRgB30U8yaGBbRhvJF6AUuRVT@vger.kernel.org
X-Gm-Message-State: AOJu0YwQq4qO32Wamzx6TOA/eJGPvez2Au4J9tG3MHfxKd20aVgyVhZl
	q1BAbh3q/6sNj3LkV//ZCtspmmp8z14WkfkS9rJbqrn6ettCgqvpdTNJEONq1la+UE5Xdgh9zxa
	HIxMmKN+X3UMyXI12gpYceNABZD45zK8i+H/KEVVXlyVAachh6pu371tgqsBpZBoGxiB0
X-Gm-Gg: ASbGncvde6XGN5sfGbMb51ylRn6hDMq8IdhlHfvcfPLKZ1Hvb2YlqkaCDOpBrchbXBJ
	n3PRMJvDNvbX6ONLWYO+Q+1pgGB/5W5PAYc/UcJ+UvyG8IkQzqI/0FQbPrV5/cXW8H1A04iQv6Q
	/TAwQwM8Wp24X9H+crk0iUgvkwW4Le8LfjkjRuBfrSPbuAy7w80WvAjw2PrHDsp7jRby3sBJc6d
	TX23Ijhg/jTAroD7u/8VaI9jtg+IM3zLmI2UecRmecLcfLT4cjzZdntdO/MQiaA6lT9e+qFj0hb
	Maj3z+t8rveP5z048x84VYAkhlm8EWM6IDNR2zTSv95zSXjwCqw=
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-23414f62af9mr58433815ad.21.1748102147399;
        Sat, 24 May 2025 08:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6qiynLRSJOmSDekV7ueADk6ZcUv9RFrAPGuFI8AxKbhuiTjsCzxUbRLDcJyHbQbuDV90JCQ==
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-23414f62af9mr58433375ad.21.1748102146905;
        Sat, 24 May 2025 08:55:46 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2341ccad6fcsm12090755ad.170.2025.05.24.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:46 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:25:37 +0530
Subject: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPjrMWgC/2WMywrCMBQFf6XctSl5anDlf0gXMQ97wTZtokEp+
 Xdjt24OzGGYDbJP6DOcuw2SL5gxzg34oQM7mvnuCbrGwClXVHFBbjgnv5CgrWbBUCeYgyYvyQd
 876Hr0HjE/Izps3cL+71/icIII1YYKY+KaS1Pl5hzv77Mw8Zp6tvAUGv9ApwpD82jAAAA
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
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6831ec04 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=k2a8_r_j4jiI5Xvw-VoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: OgnSE2Vv6Blx67GZJNaT7mGMvSKn7uyR
X-Proofpoint-GUID: OgnSE2Vv6Blx67GZJNaT7mGMvSKn7uyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NSBTYWx0ZWRfXxkeD6FzyTgz3
 uDGXdwgtL01TPJAo8PcKsXTZrbEBkJVBbdSvwZ8ktHhW+isF5DrfYScRby5O2dU4HIApttWakD5
 CNpSOwapg5oNAKWTFw5JwBZW+n1rR4QmZl0umght7LahI6exa1WR04aiJF238wcFdkZRzKRau1x
 pRqBBPGtVlyby1ca9qNh+Wg5EcE9FGFR0FhIVEMlM/7xO4QFuMPSbmz0HQrwyRnLuWf30tlDGpF
 /a1g1KrJYi9354dOV4JlkYuSjsabadp+3glcjKG2f7qWRVzhkHfatpaam6k6u1J4u7slHlRiSEU
 6XPRC/Zs9IKjn4uaNsy5TZapC5EJdRdHmGqS755rPIP2qa13le2QBquLSDL8Gfi5/VDQmJG2Uhv
 l/CKKOpp7Pr886MNQ+iW32dkEDjL9Fc1JmGWhTP8S8z5iuvuFAz+fbnH7kRXR/JeeSiyV4W5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=854 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240145

From: Ryan Eatmon <reatmon@ti.com>

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

This change was originally submitted to the linux-yocto-dev kernel [1]
to address binary reproducibility QA errors. However, the fix is generic 
enough to be applicable to the mainline kernel and would benefit other 
distributions as well. So proposing it here for broader inclusion.

[1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
---
Changes in v2:
- Corrected author id
- Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
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


