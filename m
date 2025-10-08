Return-Path: <linux-arm-msm+bounces-76355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A71BC434C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74AF519E0D39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0AA2EC083;
	Wed,  8 Oct 2025 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lN4O+3jH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966BA2F260B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917166; cv=none; b=uxFPp2VZ8t/opxIgocedweF8nTL41qL5XiaOyvZY+Y2Y0k8mfVOoMrY8XKucR12LxDBxVNG60uztvEnZLZlmaCmA52dIj96D7cguMOpeQfp7/DG7SXjWhmyGJ0iAPIcu8kh86eMMm0iTrI3RXJHIygxeJr041cHw6Wv+WW5Rhrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917166; c=relaxed/simple;
	bh=dVxH7am5NpfR2SKXOMgeyYYUDDszpYOsvQGpJZvlHu0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZQVCS7wnBrNWFhXpCGSyXTfQnZ439T1yXyoVgxjJyV+/H8QKcYFcT8XlEutJkApuhgz/ukiR6B0oKluc2AUNI/19blwHxm2tOytOoiTu0lyHqgHSGpTxrMlzh5bRCFIv1glwssxVm4Fdy3w1lLkxZzfYRybvsS+jeBxOOBU8t0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lN4O+3jH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OXb001387
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q3OaqN90CD+hRsZWsAs1tR
	oSX142LTSoO103+LCQM0k=; b=lN4O+3jHGZaOMSvzRNAtSRTPZLkKHw4ijArMpU
	EKRZEAw64Uhz1Icl49LlJOtmcPfCudytB22cyfEVbC1uIqQ+6PTQrZVp74JoPE0z
	NY4aPYleRgfyU0s/sufbgalIC9aVJg/hIoMg26dvxzMUzj9YaVW2KmublTNVwK9A
	EqHFQ+zDTmpfi+Huo9bP4PitOD8c4p8pu9XzxzLY/0K1by2DY5S3f0vwUqDhhLlS
	Pa6clFv+h6PxvqM/Xrn7NaeeyzOaAT2vbdbEvgfFilT0FsHixVCWZET9mc6QdcFj
	6z5QuuX8UH7zyI/T2gp0uLnV9myF20AISYWdHZRye48mSTnA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy720p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:52:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so10381943a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917162; x=1760521962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3OaqN90CD+hRsZWsAs1tRoSX142LTSoO103+LCQM0k=;
        b=vAofTu0JK7JXPDcfv9w6fRRlQ5wCvWnkE7Z8y7M8nGT4mU10moZjbRaaECtWzidu6r
         0tJIs17XwFCM+Gsrph6GbeFG9t18sd1RtIGwnCm+ZXEHz3Phu9eOe1WeCf9tFJ3pDyAV
         CyGYI31JiwwTMZMP6BaZfDbjZbJFwBiYZ1nRYpwi5ORiTLsURH9XFprBoFRud5CXacne
         aONXA1WyPaTDiQt9Vy3tcse1QrIfhYhNrFWNzjVE8Lzx3m3jQ4ZbGQG+jhKH/MnUz+re
         zMDAIS7xD/NUpBEldYdL15zguZ0QygG4eMOjhA+q7lulZEcn6Mttrb31C8IbiynDcVeN
         A7Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWYUWaDhMm4F0MAvq4tdleNYae1J3hgz+XSPp9k2vzmAbQdc2VaOg3CioQERy903dZYyXj8451H/TwOkyst@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/PVjtHwMZV7m8tDAUuNfYRDBDK/k8U2YsEhcCGhVQ6sSHuua
	cCK7GUWJZyfrOU611nzNjpa7v6CZFfC5Ap+szWdKao8ifdUt6vmlCph8hjZGEcAOpsWPaGlaCAl
	fOOcaht7jPOx/fcAXY4LeBPeUyYM91xCvd6XINEzpz6z+QwDLRfBxXMdbnf/ahCkET3rz
X-Gm-Gg: ASbGncu8pxvRmW/8xfthoVWIZfpG8tNo6h8CN9tcLjgeg6YrwTLiap991TmzMLiHj7c
	2uZJrd6AqugTQjNpWyIW7xCgyTlL/Kk+wQ2QtXJS6UzfmnJiPdYpN7cGezdVUPkspmZmJCdMRQy
	L63gQIyTUllebSWUMQkFJc4KJbLLGAfk8Nee1Pr4gTT2xQGkCHLlk6vrxrs6KuaTMi92nJcBRjv
	HrchHX7hxhgZrF7R9qHzUAxp8oDdiu3SDO0hj7cv3OCfCIg8Dt9kfX0goni1A6riBfinTozFZnu
	IrixSaLn6lxHRWwpM1XMV25a+/AEbk+NBLdt5zX7i+XxFPIB6VnlHUutHNfzhTO0Q5PyZYRb8rT
	ZYezE/1A=
X-Received: by 2002:a17:90b:1b42:b0:330:a228:d32 with SMTP id 98e67ed59e1d1-33b5111891emr3514627a91.10.1759917162095;
        Wed, 08 Oct 2025 02:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKrHvQ5C6DuHSYon1yuEagBSjWu5msDds51jUihiW7AOho0r2ExmRh8FDxUoD9d0odO+4Yxg==
X-Received: by 2002:a17:90b:1b42:b0:330:a228:d32 with SMTP id 98e67ed59e1d1-33b5111891emr3514601a91.10.1759917161653;
        Wed, 08 Oct 2025 02:52:41 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e91d4sm2763833a91.1.2025.10.08.02.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:52:41 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add support for QC08C format in iris driver
Date: Wed, 08 Oct 2025 15:22:24 +0530
Message-Id: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFg05mgC/3WNwQ6CMBBEf4Xs2SVtgwqe/A/DobRb2QSotlI1h
 H+3knj0MsmbZN4sECkwRTgVCwRKHNlPGdSuANPr6UrINjMoofaikTUmtuSRA0ecu6dBmnQ3ENZ
 H0ubgKul0BXl8C+T4tYkvbeae48OH9/aT5Lf9KZt/yiRRoBDCSklWO1uffYzlfdaD8eNY5oB2X
 dcP8AFrNcMAAAA=
X-Change-ID: 20250918-video-iris-ubwc-enable-87eac6f41fa4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759917158; l=2450;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=dVxH7am5NpfR2SKXOMgeyYYUDDszpYOsvQGpJZvlHu0=;
 b=sISEYgomFBoqTELd5kLJQEAq4BxSDAxh+bkBabfEKbdPiB9PH/wv7h+DwBhmtWEgA3NvuFBYa
 qGtszB/Mcb7BQw5nW4/MpYiXGYpjhfbk4qbj7eAslloHyelxETUzAjF
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e6346b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tWxWURTORvhNpiqNSXYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YGOkVNgmAM5PLszKlQJ34D9SQhtOB3Zf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX2LKhxpeBrrK1
 Txl3p7Wf7jBzfqZQKU0n5sBHJFSaaUbumdvwg5CwMgwpwtGbXvkkbSTWifFn2NhZzy4U0t6dT+z
 Z2IJDdj2ulSFrqnif1QCKIldOq3JoqvKJnLZ4EhhO6Dc57F4JDcwolxXwza4Nqyou1im6zRkjYo
 kxQeSwYS49ri9zVWPQOfelDhfZd9XbbiW+3A2ozUa+ZMYmwi0Vuh3jRSn7YX/e+ekln8R1pFSLO
 xpV0LtVIiTqvM/uKpDSicGVn1SpeDylo1hsvOXDcZtumdiqeKIvRGoX3CknyYuFmXGL7W+FUlTf
 cjolPOwswmn0D0YeITw3MijSOUy/lZ/WJTDDrLuqvFQ0QWI4VBsIGDKDJwvANzuT865ls/7nuv/
 qbbPeOhDdpR3+99anRC+UI4IjDGlmA==
X-Proofpoint-ORIG-GUID: YGOkVNgmAM5PLszKlQJ34D9SQhtOB3Zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

Add support for the QC08C color format in both the encoder and decoder 
paths of the iris driver. The changes include:

- Adding QC08C format handling in the driver for both encoding and 
decoding.
- Updating format enumeration to properly return supported formats.
- Ensuring the correct HFI format is set for firmware communication.
-Making all related changes required for seamless integration of QC08C 
support.

The changes have been validated using v4l2-ctl, compliance, and GStreamer (GST) tests.
Both GST and v4l2-ctl tests were performed using the NV12 format, as 
these clients do not support the QCOM-specific QC08C format, and all 
tests passed successfully.

During v4l2-ctl testing, a regression was observed when using the NV12 
color format after adding QC08C support. A fix for this regression has 
also been posted [1].

[1]: https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u 

Changes in v2:
- Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
- Updated commit text to indicate QC08C is NV12 with UBWC compression (Bryan, Dmitry)
- Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (3):
      media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
      media: iris: Add support for QC08C format for decoder
      media: iris: Add support for QC08C format for encoder

 drivers/media/platform/qcom/iris/iris_buffer.c     | 17 ++++--
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 15 ++++--
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c       | 59 +++++++++++++++++----
 9 files changed, 152 insertions(+), 33 deletions(-)
---
base-commit: 40b7a19f321e65789612ebaca966472055dab48c
change-id: 20250918-video-iris-ubwc-enable-87eac6f41fa4

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


