Return-Path: <linux-arm-msm+bounces-76909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18934BD12B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32DA534680D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F21B2727F0;
	Mon, 13 Oct 2025 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lW2n8z+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBE22157B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321345; cv=none; b=ZwSdsP8GZ6vluWZzZKBV2ilevakt1ZlgOv+tJd4LDPaBbpWbzOlUz/H+cZh6oLjCGukr0+aOWlbVNSpg1yHYpfrD/jTzjdLA49ZoUYPqP54rv4rCsnIDgDGOsJNcBjYVilewRb/Vx6z0VB1Dq9hEasiGQQdVQxBexozzQdJvv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321345; c=relaxed/simple;
	bh=AgfRFPNIsH1WIr3xx/ogQOdd+Y9OCJ1gSXza5s5JWdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cc9MrKez1PoO3VkfHD3eXJX+ROB8+DeuYoHI8Gz9MbKumXxng0BmS/wQhoJavxpahS4mmZZ3W7BColzdULDLwN7D3eA9PgfR+tXXLsZTKBMrS2rmu1gZvTeTwDDqbqPSUvkIJalfdVqAeQ19PVIg2+9GFUbXifA35MTOxKo83Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lW2n8z+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNjWdx021935
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rVNME/kw5zI+jueIa3reIW
	uhrTrDZRF75uY8XRp2EKg=; b=lW2n8z+P4eLkQzdyjjdc1WLiFS1iuNt/XlZNSz
	Vrx/H8k+xFl7nCwrKGRV+EAbxPIu6NBqOSvj6/oQVldOdo0mGnXOlCbJ2qnvuH8D
	YqZwskqFUM875fkuRxVyZNwqQcgbh3x22c3say2RQGTFcb2CHyZWXAOTGUkB5qKp
	IdZzlkkyLzcA39WbP+IziiTiCRFbNTlcxcvJOPjmX1p8UicbVItBsrVrZuVGLtlo
	SMNZO3Y0kJWDhNOuD5YOC15dhTF5KwJ4FAy91ESfcbyAHxyFYqwmVpQ44J5nqZ6W
	pMx0NOWrprgpl5pLrMgY9HSNRAwge3/AHmlNIEYOyadmd52w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0btwbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-87561645c1cso2259937085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321341; x=1760926141;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVNME/kw5zI+jueIa3reIWuhrTrDZRF75uY8XRp2EKg=;
        b=BVOLHhtwAftVAfRcfcBow6RRgZsIUAYxnK6BroaSZXKO7RJcJoxreZOWx7Jzs+AZ+E
         elF8KUD01B1jgvF8lktv7VWFXqb3cqq/z8aOcZY4Iv46abyo+nzSnK9pjwLyLDC8MOxs
         0TwraDfEkRp9kSiaeJApaif9bkUGqijC+dXiXXBS19EuknU5flu9rgnfrdHcAqcqw7yb
         WBpSOwjMHtHEJ10WjuTxrQcPdO7FlU7iOaAz2pXie9upQeDQhSSUEHcs3Q1m3OOGVPaU
         tO35zquvDPEOmmMQ3UerXJCWdYWsiWG5cJgEgiohmATJTwOxjReHmXA3BX4TsHAlT8lx
         NEcA==
X-Forwarded-Encrypted: i=1; AJvYcCXQRyvebi+Sfiq6XVm9EuygWnzceYGgRYWTdAUu6WYNi5M5toj+tAFNUqA5ZVCG/ZCWRciOTTEV7nJe2uJW@vger.kernel.org
X-Gm-Message-State: AOJu0YySexBc1CGvFIYHsrltDuBsnUmHr7THoPW+cseuE+r9GCrm/Kw1
	Iv8ei1xCXo1cgRW1JLgHcTnbPPvZZ+0nVObNGNHpdGvINFlx9vM5fY3RumZzSsPsTq+kEufFWws
	7FTpVIZd2m0MrNXkX8NvLPpDJhwp22bO1flKbifdNcOWUvHss2tmfg9ZAzi3NzHbtHpvu
X-Gm-Gg: ASbGncusgTWMplXHQyxNq/OcqhjTZ4WuADSfG8dbJLBOk1Tn1KbUyeQfieLT/HHcrnd
	t6uisqWyXj6O6v6XlQHER71L2NRV+uAc8rAxwIX+RiPfYNH6gDyd6d2SdBXo9T6urqdLW/4/EUU
	DjO4RV/Cub+DikW7qcy7jvKRAv37BhaTOlzOX6z2V+NklNlIA0lN+U9+z+H0UZhbKqubXj1CdN1
	hobGf9zzpLZ6XCLkLKiVzvSdWvXR2mg0ljSEUKWdR5wHI4oYkDAhiejQ0C0AR2ld77qss38YKoo
	0/NDzYlIefO2G+9Vh7NV1ozq8RxIwVEs1Tk8sCZZGPSRzSMJT3o9sj9f4/4164sONwEgn5i3x71
	tubAQS0zsENSqPyRxoy05w8JL8LM34QYC5jz4jRyJY8eB9mnCa/Lq
X-Received: by 2002:a05:620a:7087:b0:85e:8106:f7bc with SMTP id af79cd13be357-883544f549emr2740838985a.52.1760321341242;
        Sun, 12 Oct 2025 19:09:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlows1iclj8Y9TcAMERw/mrJ+xQbQKgM6LEH+BjuoTzLW15YGd+8v2B60LQtYzKOhiwXLNJQ==
X-Received: by 2002:a05:620a:7087:b0:85e:8106:f7bc with SMTP id af79cd13be357-883544f549emr2740836085a.52.1760321340677;
        Sun, 12 Oct 2025 19:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:08:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] media: iris: port support for Qualcomm SC7280
Date: Mon, 13 Oct 2025 05:08:54 +0300
Message-Id: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZf7GgC/23MywrCMBCF4VcpWZuSi2mjK99DXKS52AFrNKNBK
 X1304Jgwc3AP3C+kaBP4JHsq5EknwEhXkvITUVsb65nT8GVJoIJxRlrKCRAirYVmtHgunbXBiG
 106QsbskHeC3a8VS6B3zE9F7wzOfv19ErJ3PKqPOBKdYZ5Xk4RMT6/jQXG4ehLofMXBY/BBdrQ
 syEkoabLVONlX+IaZo+I1FfgPAAAAA=
X-Change-ID: 20251006-iris-sc7280-fdb797f238d8
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AgfRFPNIsH1WIr3xx/ogQOdd+Y9OCJ1gSXza5s5JWdc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F84dnLTsRxim+bubpnpqjubTYehO6QPH+VTS
 7TOTSOJxD+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOAAKCRCLPIo+Aiko
 1Xz6B/442vaTiqIBvJ9Y29gxrG0skCJKEuiolYq1R/l+jMVbbNmCZQlzFOciC7+OWU/Nv5BDhyd
 7vPAs6x9nSx/e/ouZc/b17j2Ga7xVYRGY387pgWoLEJu4UibPOakDziJGRJlNG4JyxJlSNB6dqO
 GNB4tBE+K6I0cmC9dkSG34Eb3rjkr233JSYBG2dKKx5cZ8exbV8E2Cro7H+eeuOMMeSwgILgJDd
 6bSpzXm2uzrxA+awSg55b84SAJYixij+xkV3dkulfRunhabVHJDwK7Kh5YCRvwlcsI7keaDaO9M
 0i7UAlTZ4rZKuFxKfROLhCyRCDeApU/rbRagyOXfyV+qr1Fh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EiaJtetQ00GTcf3KcR-988vw_en2_1WX
X-Proofpoint-ORIG-GUID: EiaJtetQ00GTcf3KcR-988vw_en2_1WX
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec5f3e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gkQpJwJ0h16Q5Df4fnkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXxzT0ieS8r5jA
 GvUQVdgISb1adDu4XVH1ZyrKlgupB8SIMlgsY7jruXQYrv9BTX9bElKNOw95Rsl590cxrXytez3
 gRvK7pUR1uKhYIxvMT5DxJl6WKWaIL6M4dhyru1N0qHw5ntJ4mPlsYQlcOmOwTipM1QA3teswrl
 sS3o4kZDXBN6eb1o9X3kSoNF1BRO0WjWQO5pNJ0QGXf3vWVpikZ+13NWCklvyioiKbAekHfUbF8
 x3Imcu0MQ0iCJivhicqyL2vjzOUpvxyL1EsK39TnsD6YA7UfmTvgQpl5LOVjQoAoIZZwyLc2kSg
 nhrVkSWjcrCdAK+vwJWevF3gRIGJ1q326QFuw01ary0sSzuO3W/dyaAj1wYrHIHJHkjdBm6H44n
 gHEt8MqAtrzILO8Gn295mVDxAifl6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

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
Changes in v3:
- Included the header file for the SC7280 platform (LKP)
- Link to v2: https://lore.kernel.org/r/20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com

Changes in v2:
- Expanded commit messages to explain some of the changes (Konrad).
- Moved platform_inst_cap_qcs8300 back to the header (Dikshita) and
  added guarding ifdefs to the haders.
- Merged SC7280-specific ops into the common implementations (Konrad).
- Split SC7280-specific config bits to a separate header (following the
  Gen2 split).
- Link to v1: https://lore.kernel.org/r/20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com

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
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 246 +++++-----
 drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
 .../platform/qcom/iris/iris_platform_common.h      |  26 +-
 ...iris_platform_sm8250.c => iris_platform_gen1.c} |  62 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  25 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 534 +--------------------
 .../platform/qcom/iris/iris_platform_sc7280.h      |  27 ++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_resources.c  |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   6 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  35 --
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  77 +--
 .../platform/qcom/iris/iris_vpu_register_defines.h |  56 +++
 17 files changed, 345 insertions(+), 774 deletions(-)
---
base-commit: 0b2f041c47acb45db82b4e847af6e17eb66cd32d
change-id: 20251006-iris-sc7280-fdb797f238d8

Best regards,
-- 
With best wishes
Dmitry


