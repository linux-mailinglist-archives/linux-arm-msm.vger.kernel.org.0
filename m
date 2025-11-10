Return-Path: <linux-arm-msm+bounces-80956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C019C45E68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C4D188E2A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A45305979;
	Mon, 10 Nov 2025 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfRC7RbR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbVZThzb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A9530594D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770222; cv=none; b=OyanH/41FH7lzX01XxxCC/DIrOUxwmklKUGclTfXZ/5RSNYEqRlfmmooHPSpD4E0dO2WtDD3qZICn1yhS8YYQcleQD7X4Mp1rIwTvIt1jBl+LojRUbsZBTjgWTYhnBuPLuwWVS5Zjb81CmF3tuiaMfS8FnvPfnpnYc1seLc53Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770222; c=relaxed/simple;
	bh=zQbaSwQ07DnPLI+svW+Tr71zJf4jM9rxlcGOt95gUBU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D54n4nJ26s92pqcx0tF4qZMaCj4cIsNaI5HYATN7ER2CPQ34On5fbcvWYKa3BKxEoAjh0y9FEmynXX4BS16BCTNYBcr4fV+M29uiTKMEu2moTM0tdz3HzKNx/+BH9HmiZXgbSrAep8iTSjyy/UMJmQiqCEiLdC16bUc0wLohWak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfRC7RbR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbVZThzb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA7hJo52861344
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3RSXLIfKi+zDkE8kdV4GWY
	kr7jMI4A5nsfbi+rQhdtE=; b=GfRC7RbR4baNAHiH9FnBjzlRJzYoiPwVzE83+F
	JORaDcEXM2hoPG3cktq4X1f0pr6Bj6NUn5X5GwDk1ZOf9nUi/u5KiE2QKCQmjreJ
	1R6Z/v+qq+cwICdvvuYsYSstRXP/QltEKkTF/FeKw+a9wFYT/Cx88VFJdXz8k0TX
	1xAqis3P8erXeDuRztUFT7/c8EP3BbxKg/FgDJ/b6EO2h2J6q2UOGcK9qVqxCvbw
	1UhQVD16KiViAVaEHiBmH9O398DLufQ5GpdLDSBOVO86WlcUYII/nDgN1JMobbnt
	ZiuzV0A518V0iRdByVG5JGEo6p5LUv+qwTVaGJdA57hNXNxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abbwe0jng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:23:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7afd7789d4cso4036372b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762770217; x=1763375017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3RSXLIfKi+zDkE8kdV4GWYkr7jMI4A5nsfbi+rQhdtE=;
        b=EbVZThzbdkI9rO+ZybuMVmB1UjGBJ4zNvw9VtPHoMM3XjnCglVeNCauzpt/VRUPYB4
         dh52JwXU3d8y9ODJz9D1LGrwVsWGnYqO1dZh8vyaE7FMQ6STqA9oM2Z5Qf3OFBgL0e+h
         vFY/GHHSgfSLD3MHIQfAxySPFptbk7ALEdBBxuWGGzukkuyBBVgryxbYd8yLQFAxETX3
         nyx1D49bXDnA8IRbr4DP8Myaso38rfvYWu/rCUr6fUe+1ONQsaRg2cU4R7FPUfkrOqTg
         f7YUNCyNa7/f7DJjpNxmy9TS1jqIx0LAyVLU9194p9DQMeTRWYXNpR36j1tXfnX7CV3L
         7N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770217; x=1763375017;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RSXLIfKi+zDkE8kdV4GWYkr7jMI4A5nsfbi+rQhdtE=;
        b=KFOcaMDduD65Nho8n1RpFDiPebZRzuQeIAGAHomm28BWGX5yP0XU4PYd0ryO8KfBD8
         hhNgOxUa2IZK74+GrUxcFAjdg1dIBr7X6HrW3+qWDa0kme2+Z7IboXnDGULR2COexQgl
         GdrDRdFR2+M940MDLqCjajcVsx7yIjacJBXnty2gkzCGcnoS0GIFm2LxxdG0sfkaaSzM
         CQ1RiRr9HvQKM9gQ6EHeuGxlz/UCCTEqnDK85wil4u9ZvCXdHo7yLQjx3GilY0nWNucQ
         VCuiYJ1N0Lk9C801J7Jn0IQDqqpABRdepq2b59oqC1fmMHgg/CK7DitNhLrB3QpOIgI2
         iwNA==
X-Forwarded-Encrypted: i=1; AJvYcCXVM4TdjgbP91c6eXxq/e+3FcYwI15VxAZC8VfAys2+u2s7PjcbHNURTMylM14kuvXVPTSdaVBsTV6TCbmg@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2Y8h0oJn6cJ+0YW+KSGw2OLF4/GKjkUbzcGzVIzmbOI8Nt8K
	AjnKw6abSAFoxl1gwOqeLzgD02PfbNSXS7VyvdbqO/DFnAoZF4YLG5yOosJw+/IMgp8qTZiV8Ut
	NQBvJwK07g1Jk/aQjSaRePO+FjgmE56Q+RN+7N9ir0BnujjpkzmpBnNXp9NJt5r+UB3pSvF+Y6E
	x6TAg=
X-Gm-Gg: ASbGncs7E3k8sDGjZGD7eo2bK5hl7Dwj8ItCs6AnTuc8hz61H7iYslx/qvDQlxZfgpD
	37DrtQcjPZCDb9HFgwgzuisgvokTVbcFs99nn8ZONTKD+9eM8gdkoGZbkBeIwd9gDPRWfEFUm3G
	F/JcFVxveTjkOamxOS36eI5EJjdDSJiWisNTBJkU8gg9NTUP06nE0kpwFdUe7rPnycaIJLDeQiJ
	QeQ1JfCrlScGUraIR5epuUX0j/YH1vveQ24mG0o/SkyG8Qim3DGBn1ss2qBuekI76rbhiLBj6o3
	AXoudupkVxORxCkFhbJ25xWJJ1/lr/Q75xny9tGSnz0fLQeQlGHNi0sYDLYfOQR/s6sANVNxoyZ
	lYQe3SXFt+Po64cWLlJyODPWSr/CJt4HVfVzHf7/n14Q9XIY0aJuPIe3fJKKME8CDuhqvTAJ0Uw
	==
X-Received: by 2002:a05:6a00:18a1:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-7b225aea5c9mr11195538b3a.2.1762770217309;
        Mon, 10 Nov 2025 02:23:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+aXzsbONT0ddaiwf7vLOs1dvlNYOIwKhB5GQ90YFemOubT/ThSUNbfRjrHw33/QFz3prhSw==
X-Received: by 2002:a05:6a00:18a1:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-7b225aea5c9mr11195492b3a.2.1762770216655;
        Mon, 10 Nov 2025 02:23:36 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179f77sm11153832b3a.34.2025.11.10.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:23:36 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v5 0/6] media: qcom: iris: encoder feature enhancements
Date: Mon, 10 Nov 2025 18:23:11 +0800
Message-Id: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+9EWkC/33OS2rDMBAG4KsErSuj0bPKqvcooVivRlBbrZS4C
 cF3zzgQmkXjzQy/0HwzF9JizbGR7eZCapxyy2XEoF42xO/78TPSHDATzrgCBobmmttHHH0JsWL
 HPz4OcTw0mngAq43jNlmC8981pny62e87zPvcDqWeb6smWF7vqmKWG/baCcMEBfqLe/vSLe2tt
 Nb9HPsvX4ahw0IWaeIP0wJWbpo4ZVSA9cEo75xUT0DxBwKTa6BAUAvHvBTgZGBPQPkI6jVQIqi
 C9ilZLRK4f8B5nq+YXDtuqQEAAA==
X-Change-ID: 20251017-iris_encoder_enhancements-f2d1967b29f9
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762770213; l=9415;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=zQbaSwQ07DnPLI+svW+Tr71zJf4jM9rxlcGOt95gUBU=;
 b=eN/SLJgJbk5mrU5R3HKQ62DwcvOmgnkje+/jQYsE+OHta5I8qXninrNw1Lp8QNygTrefqIrwx
 y1CB0iL7YzxBkq8FY2gfJjJopWhdHPdRDOvI/42BHz9hTcACHcSw3zX
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: uzfZbDV94UusB4hapG8-mWjanzdr99O4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MCBTYWx0ZWRfX3YukHfSAMQ9W
 rqsyMQRTM4GV3w7JaPQ7FJlIb4I8uIWMd+PAAfsHhFqLHO2++9V6JDtH7iuwERCASLCt4viVR5f
 YUfZ9mMhN8EA0x5RShut4Mtz2EtpqrsyzzunYoK8J+/E59F7zwClfj0e471o/49UCVj3RQWXuRj
 6sPp9GOKoOjbi1B7rrCOpbfnpajATFiUjzOdQspB4g7RbblJk8nWLToeghm/0eTnxcC+vqRq8lZ
 GuckebFaK1XqShXqXXGW0WOCYiz8i+SDH1kwWk9MPIIeNoI7YK+DF8/bBeIkmeSZmlZS5wF9Qo4
 XFNJKY41iilTH77hf80djE1BdIR4OFU0UurcSReCu7mdXJWlsr0tJr5QYVLMatY91kB5nkb/xMN
 wOCfA1MXjJBzZXfEfPwL/+hKy03awA==
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=6911bd2a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uW5hs7etCHDVNyUx15YA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: uzfZbDV94UusB4hapG8-mWjanzdr99O4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100090

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance, v4l2-ctl and 
on QCS8300 for encoder.

Commands used for V4l2-ctl validation:

Scale:
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=width=1280,height=720,pixelformat=H264 \
--stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/scale_720p_output.h264

Flip:
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/vertical_flip.h264 \
--set-ctrl vertical_flip=1

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/horizontal_flip.h264 \
--set-ctrl horizontal_flip=1

Rotate: 
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate90.h264 \
--set-ctrl rotate=90

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate180.h264 \
--set-ctrl rotate=180

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate270.h264 \
--set-ctrl rotate=270

Intra Refresh:
Testing of this feature requires the use of this application.
https://github.com/quic/v4l-video-test-app

The result of v4l2-compliance on QCS8300:
v4l2-compliance 1.31.0-5378, 64 bits, 64-bit time_t
v4l2-compliance SHA: 2ed8da243dd1 2025-06-30 08:18:40

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.17.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 43 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v5:
- Move crop_offset modification to 2nd patch.(Dikshita)
- Fix missing braces.(Dikshita)
- Link to v4: https://lore.kernel.org/r/20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com

Changes in v4:
- Split 'improve alignment' and 'crop offset' into two patches.(bod)
- Modify the comments for the enc_raw_* variables.(Vikash)
- Link to v3: https://lore.kernel.org/r/20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com

Changes in v3:
- Restore crop offset support for the input port.(Dikshita)
- Set the output port's left and top offset directly to 0.(Dikshita)
- fix the issue in iris_vpu_enc_line_size.(Neil Armstrong)
- Link to v2: https://lore.kernel.org/r/20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com

Changes in v2:
- Split 'improve alignment' and 'enable scale' into two patches.(bod)
- HFI_PROP_RAW_RESOLUTION uses the actual YUV
  resolution.(Vikash,Dikshita)
- Rename enc_bitstream_* to enc_scale_*.(Dikshita)
- Add comment for scale case.(Dikshita)
- Make the resolution assignment into an inline function.(bod)
- Shorten the long chain that checks whether scaling is enabled.(bod)
- Correct the handling of rotation in crop offsets.(Dikshita)
- Move VPSS buffer things into scale patch.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20251015092708.3703-1-wangao.wang@oss.qualcomm.com

---
Wangao Wang (6):
      media: qcom: iris: Improve format alignment for encoder
      media: qcom: iris: Improve crop_offset handling for encoder
      media: qcom: iris: Add scale support for encoder
      media: qcom: iris: Add rotation support for encoder
      media: qcom: iris: Add flip support for encoder
      media: qcom: iris: Add intra refresh support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 95 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 56 ++++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 19 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  8 ++
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 63 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_venc.c       | 33 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 60 ++++++++------
 12 files changed, 310 insertions(+), 41 deletions(-)
---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251017-iris_encoder_enhancements-f2d1967b29f9

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


