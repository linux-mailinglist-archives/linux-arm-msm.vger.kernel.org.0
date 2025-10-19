Return-Path: <linux-arm-msm+bounces-77888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1295ABEDFE8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 09:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AED404E1343
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 07:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837E6199E89;
	Sun, 19 Oct 2025 07:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2QLu1qI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A428B10A1E
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860619; cv=none; b=jMU8WZ0nfBn716+vegKf7k4tGIIlosh22szm6b4cQFX7L1gi0voX+RNIZUU2mv76zIcVoum3aui1IuGktPBM6ja/a21g9E6oW8uLr2uqJoOEWfJ+kStaFog1jpIR157i2KMov/33x4aU9mk9pAIs3We5q/JU21ekmEe/HBUPQFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860619; c=relaxed/simple;
	bh=+QyltBHXoves0L2nFMUTkB7Fl95k/5ITyHxy2eTykO8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bPy3q+84PFO7yVm6QoTqp1k861obzuaucpqke8dG+kizTL/kpz2y3jZu+VSWIXInZ1N1UDLgcgOCAbfjR4pqrLi6djl+ZV07DGHRaYHatJOPN3ofPnjhrsGc8W20W6K8l2e1Y2KqKZ1VLrAZTNSxXAk7zi9g+PVDn/3ehNjgl/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2QLu1qI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J4F2VY013618
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ikWoNJby3/7/OXWrkO/htM
	O+pmQOEVtqR/SLFPbthJY=; b=W2QLu1qIeyBsqeWSlXoC5enLhMcpnIpsNfXwv4
	w8t01+dX7yjfR3tzgUKqbV+lPuhde7YcetHI2hRP8Zn7WZvGFMf1QrQdWmDmOC2y
	zANNOh+2OvoEW6nePz2hyPht5LMWmYkdWRT7aVMZ//9sPLWHlzNwnp8h9lB+9YD5
	K87PRhAyCy1ECN7+GNiJ7zIEhoxne9B5CU54gMP7nvupm0AkkP2rudVaJhu3tk6M
	TizAOQu73E6Kc5jueP+qy5pyUqrdKZK9IZ+b63TuRdSdySHdQFVZ0A3LOjIlvi6l
	YiycFU4G67naG/NXToX1+NrudkyBrJ4I3aaBG4Co0cLC53vQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7t4nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:56:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85dd8633b1bso1765789785a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 00:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860616; x=1761465416;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikWoNJby3/7/OXWrkO/htMO+pmQOEVtqR/SLFPbthJY=;
        b=HrCgVpr/FdHwRpPx4VqNaKARpdLvrTD4Sobrwesrgbk22qNqlbpP6LFnVSFygJ6q8M
         7LM0BcFNUHhTab7w85/vUyOD6OiurB+HT3/5DTDv5hrVJgi/7dCPCKQb5KNbo1HfUpG6
         J6zBYpAAoOBaZfaEAvncvg7VQr10bAMDlzc27rKbe5JyI82scdQuLWvSJszoqmnb8NP8
         2yeGL9p4LkszklCbfSHvQgQZJmpO/nyR0DlQKmJ/M8wfUn6oVGkKtfzEKajGsjZTebKM
         eZetgAIzjdETYA9TeASiomhiUo2z5yanHwErmwRnlTiwX78bHic/m8REplv9y4mOMX+b
         D/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZFqn3rV9SygOG4QuKCtYk6SnHTLLOGkJr0t3FlDtnO4pUojYNInEF18eDRvHcBnjmZDikjJBrrs48WXHo@vger.kernel.org
X-Gm-Message-State: AOJu0YykmU3HT2H2/BCJYRovrehaM2FM2pqpCdyI/6ZS4j4lfkPaODuM
	YAEPtdllmoXbi/BwNA3iuJQ9s/ekTBf6R58AkVQkgKFvoe27Rr2LwhpjpwyXvRGP4tL1OuT5Lzw
	UuXJ8ForNuzhAfEx323nyS3rdYrAK66LpaV8E1e1DLGe0LKxnpSlHsQnZ0C2Re2dsmnN3
X-Gm-Gg: ASbGncuJGJDk5VFgJzHqN/Sv8XVYfEQpSk4bFtqsxxY2ZQOlzL8UvicfktcIYMIq/WG
	HbaKLAVpkHgpZwuz8WYP3Cdn5td5dsUJEBf2p6R3m23Vp5AdjurFE347aaRLnc7YCokziQrtIOQ
	xbVOE+psVcFk4uS22el0XwHDAmplslual6hKE0Ezlsy+vKgrbS9qMx1oesvOL1+kh51iLVaJn8J
	dk7DLEBvf3Px7qhDUj8wWXFPjz/02BW3r+X48M8Xs7bbJwl2YJXi5eVyraDpDiBXwD5IbBlWgbU
	hOwTQy4//miYld4nNj8N7RhyyKGX/2py6yb/+ESXc5NCkaDRrFiYVJtxVK/vXHOR1Ogr8dc6G+a
	C2tf/tFF0h2Iw3oVfLCJ27uXe82psawn70/lqNeU3Tb6H6VPGduz5ziGL98r3akpNY2J2RIIIwt
	NsacU43e0UwEM=
X-Received: by 2002:a05:622a:347:b0:4b7:aa31:3c4c with SMTP id d75a77b69052e-4e89cff7d2fmr147636831cf.38.1760860615567;
        Sun, 19 Oct 2025 00:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/yTbXkz11x8OLb76toxeUg95wo1KoXONiHoMaDOBX2ykmKdf+kwZijHvuLdonNVKRApouCQ==
X-Received: by 2002:a05:622a:347:b0:4b7:aa31:3c4c with SMTP id d75a77b69052e-4e89cff7d2fmr147636671cf.38.1760860615039;
        Sun, 19 Oct 2025 00:56:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4cesm1357027e87.30.2025.10.19.00.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 00:56:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/6] media: iris: port support for Qualcomm SC7280
Date: Sun, 19 Oct 2025 10:56:47 +0300
Message-Id: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL+Z9GgC/3XM0QrCIBTG8VcZXuc46pzWVe8RXajTJrRZWqMYe
 /fcINigbg78D3y/ESUbvU3oUIwo2sEnH/oc1a5AplX9xWLf5EYUKCcANfbRJ5yMoBKwa7TYC0e
 ZbCTKi1u0zr8W7XTO3fr0CPG94AOZv19HbpyBYMCNdcBBK26JO4aUyvtTXU3oujIfNHMDXRGEb
 gk6E5wpoirgtWF/CLYm2JZgmXBMG6uFUJTDD2Kapg92UPg/MwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4262;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+QyltBHXoves0L2nFMUTkB7Fl95k/5ITyHxy2eTykO8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo9JnDpUZv5VkRdT2Q/kndsQF0stmd8gHDk5xm/
 qmmUBsk+C+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaPSZwwAKCRCLPIo+Aiko
 1cyyB/9SXaeuVn64a3yiEVpglosGVA9PqqyWeQE6KN4SVLfGQlgVW2ot3TPcR466WBxCJ2IbBCg
 gqZ3U3bGkrt2VIIXEN1BjJ4HD8P9N9dA6KeLhlXY8YMVT7Y9Ht86tELjTKgzAJooGCEKXUiLapc
 mzO/dS1OaaynfhX1eN4eQvzNE7iwPXvvqq7pMpkI92NhwhuyhbIfa/HuEMUnVAGEZShsGacNs9s
 XmxBWKvpR2+lPE/hxunXpqftXtzbIXFyCyeNLi+JkUZ9KykV0Ebt6bhVflX+Zrfn+ZMnXntJE+v
 YwzLUfHtHdDvcl+WSp0Gyk1xom5Qm0HbH5jwQ+r/XpszqqH/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX3xQysZ7w6eVJ
 RMy+cn9FJOdrcjmiOg8QJN2SPmSD7C5QOmafHJkewkIALMtcej1AQPmo0R3GGcQSk3jeM4tVC68
 koD7F/LYOegdLG8k7iVzg+UVM31XaWUz8AYahrl+rzNIyJFpd6tCfE2baGCT8XE2J76dQRwUi6l
 QeDv4XJRMAvhEH9D4Tku6xaPqyQxGwCGC6QjkrLjsq1d9pMwpom2WhQfLweYwV/uWrx22qYY2QH
 sDZkXDMf9CvsYvmiy6rlleqYFndGpMsn1mQWTUuDPEyz0XMpNdWZxTStx+Yu89/ukofw1zS3zFI
 Lh5+88WdgGMAW2hT9S6TC57mLtbNLWu5KWE5SaaCtENCGKPPQz/7OCTboKB7oi2nvhAGAY2jprM
 2GZc3vMhvFJUHSgLtK7hlmZ3FgMiZg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f499c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pcU2kZSltczg-j7lHUUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wYeMLuxWkl39JNOKaavCoS-zc40NAJkA
X-Proofpoint-ORIG-GUID: wYeMLuxWkl39JNOKaavCoS-zc40NAJkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

Port Support for the Qualcomm SC7280 aka QCM6490 aka QCS6490 platform
from the existing venus driver to the newer Iris driver. The firmware on
this platform uses the older, gen1 HFI, which puts it close to SM8250
from both the hardware and interface point of view.

Test results:

$ ./fluster.py r -d GStreamer-H.264-V4L2-Gst1.0 -ts JVT-AVC_V1
...
Ran 76/135 tests successfully               in 16.903 secs

$ ./fluster.py r -d GStreamer-H.265-V4L2-Gst1.0 -ts JCT-VC-HEVC_V1 -j 1

Only WPP_E_ericsson_MAIN_2 succeeds, this needs to be investigated
later. For other tests I'm getting:

qcom-iris aa00000.video-codec: session error for command: db800000, event id:1009, session id:4bd48000

After removing several test vectors and running single-threaded:
$ ./fluster.py r -d GStreamer-VP9-V4L2-Gst1.0 -ts VP9-TEST-VECTORS -j 1
Ran 217/292 tests successfully               in 136.210 secs

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
Changes in v4:
- Dropped the inst_fw_caps rework, it will be sent later after rework.
- Dropped .min value for PIPE capability, set it in the same code path
  (Vikash)
- Adjusted clock index names, clock names and num_vpp_pipes for SC7280
  (Dikshita)
- Squashed the SC7280-specific codepaths into the iris_vpu2_ops
  (Konrad)
- Dropped the register moving patch, it is now unused.
- Link to v3: https://lore.kernel.org/r/20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com

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
Dmitry Baryshkov (6):
      media: iris: turn platform caps into constants
      media: iris: turn platform data into constants
      media: iris: stop encoding PIPE value into fw_caps
      media: iris: remove duplicateion between generic gen2 data and qcs8300
      media: iris: rename sm8250 platform file to gen1
      media: iris: enable support for SC7280 platform

 drivers/media/platform/qcom/iris/Makefile          |   2 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  18 +-
 .../platform/qcom/iris/iris_platform_common.h      |  18 +-
 ...iris_platform_sm8250.c => iris_platform_gen1.c} |  61 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  24 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 534 +--------------------
 .../platform/qcom/iris/iris_platform_sc7280.h      |  27 ++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_resources.c  |   2 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   6 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  34 +-
 11 files changed, 160 insertions(+), 570 deletions(-)
---
base-commit: 0b2f041c47acb45db82b4e847af6e17eb66cd32d
change-id: 20251006-iris-sc7280-fdb797f238d8

Best regards,
-- 
With best wishes
Dmitry


