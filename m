Return-Path: <linux-arm-msm+bounces-76296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86949BC34E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 06:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB3214EF7B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 04:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379B42BEC26;
	Wed,  8 Oct 2025 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ij/OZpbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9B2BE653
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 04:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897995; cv=none; b=nEUlkNMZdSTqqDDKR08fi3Dfnfy5TIEb5FkKqcOo1KnyJv6I+HknnOWZzyAUaAOk0y49lljjTg0gHq910j3l2/53fcvyIZ8N440dSJF100DbrtMVKE8RXjUEEPT0yEcH9av6NT5bGXEfF/eGotYDRYntk57pddNc2QJR0RNNOFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897995; c=relaxed/simple;
	bh=fvPWdThtzVXnEcTCBEUKwE9cNmEthjmnIpUjf2Z9U30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TroxA+s6ZqD2xVlMv8EMblBwA/gzruhs37ET9CWALvGNaeypK7FrGzix1v0izlGBRZ0WmQv9xxai1A53zVCcE8uD94lmccO6UhxqOF7UfwMwSaBrQxiM78GCSXIqYlDbcC4CNA6jReYk8/P9lN2UpL623kjIvjxJIclyJM18rEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ij/OZpbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803alt017953
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 04:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tV+fAcMEfIF7YDUmtKrzRM
	DSxQ2QEUdhZrGwlyS3Css=; b=Ij/OZpbLMH3dTQ71tWfOELiW4Adrg0UHXbL4Yj
	CCCL8Pq9+r7LXx1xa5VAEKOkkwbSPaonjNkuOgRwZkqSfKjnLom1rrlb1LDZPBML
	OsW9CWlj/Gr75Zqb/OKoCIc5To8mnHkNumDB8Q9X7qPQdyvtUgwNkwSrEQDOXhMv
	H0BtjdFXnNmRLXH/SyOH3hSqxanwiEw6mgxBtpO6lDnQca1BrayHvdiT1W7/cDB8
	T1TFSUS4WGl0YViUjhQnAqnh38ZjSgMlhVWmjZVESHrl3KHoPa6NN+PhJ6+wFCC7
	ys2pxKsdvzGJBYpmb3s5IH1SsRqF5tUIM8dumQTJuZ5Uwy6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpv5ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:33:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de35879e7dso124021931cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 21:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897990; x=1760502790;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV+fAcMEfIF7YDUmtKrzRMDSxQ2QEUdhZrGwlyS3Css=;
        b=LIqOSRayQiHmj3YV8LWqD1btJuwSa7WJX8W9GOrpgdCLRrPrnIpV9yqfBvqpamFY96
         7oP23Oegt27NuqQ5m/fEy7SmAW+Te+d+H1nzlbewSi4CF55EYkk313LsKKeAtAELjyhO
         K3G5OXdcqqyoewSnJHKh1UrYdXCXpdmFnXtypcXPXkiEeVcE/6DmasV3HdV+gd6pi81A
         ijF/cd2xIxJS4v44qdwes0sn2q6tNSyc91s5tD3vCrBmX5sairKepapx44thWtCmzU/q
         ptfwiYQMvcBUcgzurEIwmzsoc67nVO9Ry5Iw6rQlJCuQ1lraQysFACA9uwXySJRIlogM
         P+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAAFB1Wj4DJlmJxWvlIclbLsS4ABijmApwrK7n5+Ykyv5YypZ1fW7FfyZsWS7+CdkxdKnNSAx3PigWpE5N@vger.kernel.org
X-Gm-Message-State: AOJu0YxCRzCliZ5xMHHEpnL3nqZ+ic8BA9TNFgIE3aB3RRU02nIeQzDh
	MfGbLL3wB1ZtvvUQPZm1X6zgxq/+WP5I8y/8hTjGA+IkrQbBdGEm9d1dZ4jfJKHd5gc3QEkWCi3
	Gnkvi6L7XUtS2IlGtU1kAKzqyxpXXHDnVmqUSaFqMG2HrxbjB7PnIZ25ujBi9ZbwF/P/AUY3GGK
	AI
X-Gm-Gg: ASbGnctKbCCBpB/G20GreXg4hrusOGlUUY0Iyhl3pp8WJLSWRUSgrIedAJ6qDe4sita
	oY0cPqjXRoiwzKm8fJz20dlyiNlKfiDTYVpZ3RJIoKYzpG29EUHvKGVzPZnWxYI4HtBuoAoFRpG
	YJf/KQLWM+MneqssQg5gF6sOqcI+5hrXV4FD0SNKoO8BJDwcsqCSc7qx3LOSrsj3Fvhh1KGBWjL
	rQLjdJbEoyPgFmt2KzwQVdyfHmyXOMyGk6pB3PBNYV1eW5Na+yLLKe+6rZ5Pw3u8mSTChrHE5Jv
	1PiyLyMKi9KOni2LDZzxpAdesU5g9M6n3v95sqEC9pAbag8SEDJw8t75XcNQd26IonJzFvJI07E
	zEjF7UJ3PATjB5WgIeoNgfkQ3vIJNCi07nAcTolX5safopgX1UBo+8hY9dw==
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id d75a77b69052e-4e6eacf551amr32722291cf.31.1759897990518;
        Tue, 07 Oct 2025 21:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5cqPTMIUFXW/ckUwg2o1NmQTEyVte2AvoF3DXTDqNpQo2egjDieyitjMzxfNnimbEIu2bng==
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id d75a77b69052e-4e6eacf551amr32722141cf.31.1759897990051;
        Tue, 07 Oct 2025 21:33:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] media: iris: port support for Qualcomm SC7280
Date: Wed, 08 Oct 2025 07:32:58 +0300
Message-Id: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrp5WgC/x3MQQqAIBBA0avIrBPUKK2rRIvSsWZj4UAE4t2Tl
 m/xfwHGTMgwiwIZH2K6UoPuBPhzSwdKCs1glBm0UqOkTCzZW+OUjGG3k42md8FBK+6Mkd7/tqy
 1fmIDNK1dAAAA
X-Change-ID: 20251006-iris-sc7280-fdb797f238d8
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3433;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fvPWdThtzVXnEcTCBEUKwE9cNmEthjmnIpUjf2Z9U30=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emCaMIPwoiG8mOozyw2v5/0eCFjb0PfXeUuA
 60Wt1Nv5ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpggAKCRCLPIo+Aiko
 1QGFB/48mauTY+lGnxyqQqV5UMiXhh7qTJUDdJANarZRtbV7cDX10TnZ/iYydFNIaacTe+jls2w
 bU7KeUhn7ReOeyjqAvf3nGY3KBCcy0QiOI9W5gYWYKh9kh0qYGZQkFlg+JWzb+jYY2HvDhHdYJl
 KRlEoZVCybMnHNIPp3cMNWPQZCCq35/VHxA+TiY3jRF+GUOa5mKvHVj/3sdQXZUjcmK/OCIPQs2
 IDL0uIh7p6UsJUp0hvDwD8v/G2hY2nXKu2kcgUU/cGXl3iEogGNXLcWXAt6P5/IsBjnousQGov2
 jeLdRYbivufCLN4tBEhl6TDLt5NH74yy4Wn8r+ZVU/UvorM/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: In1tTWJWu9y2uWTrvW6I3Tr7t2x6ovdi
X-Proofpoint-ORIG-GUID: In1tTWJWu9y2uWTrvW6I3Tr7t2x6ovdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX3V9RfksREt8q
 i7iYFHWqz3FFqYjXo+3w0pWAm0Ijgufx2Xi1vPtnW2o7Ie8eKyKH7ZHi1uQGvsqh61BbYNWbr5V
 p7DVQt7ishnkiJMd/zvry+rAWAMhicy1tfkRBqaZVf0puagVKFJhKkNjlmVDrRFdil6MWc7eCfK
 3nJYtaU0cVOKWT2N7XvgVep0qSTXPEQs/Ma5SoOR06qkwcCy3396Hes/s18HlDTAZum3+BfVax6
 YWslzWwFGUBG5shEkafX+Zywm57ITJitM09KNeYYgpLOla8BCjHsIhM0F6ve/zKDJ4UJnvzgt+I
 /KpSSroPjwSecUbC5U/cGvEGjeOTTWm5yAWXyF8HmQ3L4AMJcgMQvQwHg5Tj0vjX46uQxz1pbvH
 qT9d7aJ9InvlUaoJsxWZkzjWRsWVrw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e5e988 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=-0qgCpxBxD2pDo7pzZoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

Port Support for the Qualcomm SC7280 aka QCM6490 aka QCS6490 platform
from the existing venus driver to the newer Iris driver. The firmware on
this platform uses the older, gen1 HFI, which puts it close to SM8250
from both the hardware and interface point of view.

Test results:

$ ./fluster.py r -d GStreamer-H.264-V4L2-Gst1.0 -ts JVT-AVC_V1
...
Ran 77/135 tests successfully               in 17.010 secs

$ ./fluster.py r -d GStreamer-H.265-V4L2-Gst1.0 -ts JCT-VC-HEVC_V1 -j 1

Only WPP_E_ericsson_MAIN_2 succeeds, this needs to be investigated later

After removing several test vectors and running single-threaded:
$ ./fluster.py r -d GStreamer-VP9-V4L2-Gst1.0 -ts VP9-TEST-VECTORS -j 1
Ran 219/292 tests successfully               in 134.749 secs

Disabled tests:

            "name": "vp90-2-18-resize.ivf",
            "name": "vp90-2-21-resize_inter_1920x1080_5_1-2.webm",
            "name": "vp90-2-21-resize_inter_1920x1080_5_3-4.webm",
            "name": "vp90-2-21-resize_inter_1920x1080_7_1-2.webm",
            "name": "vp90-2-21-resize_inter_1920x1080_7_3-4.webm",
            "name": "vp90-2-21-resize_inter_320x180_5_1-2.webm",
            "name": "vp90-2-21-resize_inter_320x180_5_3-4.webm",
            "name": "vp90-2-21-resize_inter_320x180_7_1-2.webm",
            "name": "vp90-2-21-resize_inter_320x180_7_3-4.webm",
            "name": "vp90-2-21-resize_inter_640x360_5_1-2.webm",
            "name": "vp90-2-21-resize_inter_640x360_5_3-4.webm",
            "name": "vp90-2-21-resize_inter_640x360_7_1-2.webm",
            "name": "vp90-2-21-resize_inter_640x360_7_3-4.webm",

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      media: iris: turn platform caps into constants
      media: iris: turn platform data into constants
      media: iris: stop copying r/o data
      media: iris: stop encoding PIPE value into fw_caps
      media: iris: remove duplicateion between generic gen2 data and qcs8300
      media: iris: rename sm8250 platform file to gen1
      media: iris: move common register definitions to the header
      media: iris: enable support for SC7280 platform

 drivers/media/platform/qcom/iris/Makefile          |   2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 246 ++++-----
 drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
 .../platform/qcom/iris/iris_platform_common.h      |  25 +-
 ...iris_platform_sm8250.c => iris_platform_gen1.c} |  76 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  44 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 550 ---------------------
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 130 +++++
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  35 --
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  43 --
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  56 +++
 16 files changed, 440 insertions(+), 789 deletions(-)
---
base-commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
change-id: 20251006-iris-sc7280-fdb797f238d8

Best regards,
-- 
With best wishes
Dmitry


