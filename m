Return-Path: <linux-arm-msm+bounces-81747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADFFC5B11F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7FAB04E13DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BDD24113D;
	Fri, 14 Nov 2025 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZx2m55V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bu5mV7vy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCF224A06A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089865; cv=none; b=avayio49cdNEU9Aok5xS4pT2pK27xdJZPnMxQooBm2jJZwUemjcpfeL8BUxhkKgRsAsBP+tvhHaYnHkOcg1i0NEFbq8tO8zOOzm6s212O/a+YSiiU63D00jVk9IqhaE5X7zdtiYlzmM9dkl2rEoaVKXgYhf5zf3NgDekBwgcveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089865; c=relaxed/simple;
	bh=NOAKe9H87v6o0ZDOTIQWFJS7H3k/6Y6Utoj63gWOneI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QqWfI/4k+86VscBATy9WHBaI7Sc3T+6Wc8YZmqYbt7Zg82djCpBzn667A0VHbpkfNELk7IK6hvVUppFIYP7MsZN1n2O0NOLSAT1g0pl1oA+txZRbkjc22OHX1zlwcVIgbYbU4oAHYWc4sE3QFNUO1Gm9/A9PVXpx4nPwFSVaD8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZx2m55V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bu5mV7vy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMapLa1699595
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U317h5HoLWt7juAHdJnCKI
	DwmUGXYFH0EJIwfSTUTgI=; b=kZx2m55VAShMsCuNpSlua/0lplE0N/23aLlLd9
	D/A4u1TF4phdRcI+59heuhNIXb35yNmffpRv1u7NUgVvwJjxIyTouNMYS+UsZ1Bf
	n+3gPz4Rw2xxeIGYsjEKt5+tP7uNnaLD2317K9G1mDxv8BRjep7jcg58uF/03fQM
	KDxeIFU2M2dfwX62MywHy/Yaw1lJiNNM7id153J868FRCsvBpRyx+wHct4pSzV7k
	2mP7oldBbNGZhOFxpyGUMO+8j7xBI5qLefxPFyv7hU1b+lRkTR4gAV+c0oGvv6lZ
	bD/bUHSmRsG0DntSg1e8FEpgus9N38mLUg4hG3Qbu2u0asBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e0mu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso1837477b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089862; x=1763694662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U317h5HoLWt7juAHdJnCKIDwmUGXYFH0EJIwfSTUTgI=;
        b=bu5mV7vyynK9v+dmK/cC0WIsny3zykoxkp/LeLc8Mu7aRxj0JMekccErYrXOxyNwsL
         cjbSbtdlEtR0gTFTp4A1XhwLqqjdT1mKRlYDo1FuKuYnUrBNRPO+NdmpVnGeBvA7ba4e
         jbyxvObTcZeqgkQisgiG90NJfGuYjnsuJqHiBdkT0dP6kEjFzVwQEGqNtrWd+WGdzv+k
         fNONbhJicefdpvmcXAdRgwADekqqSwGIju4Twy8EeyLznqfZ/JShsOVYBQSLAWaEpMq4
         5tvFQVg1yF7ISZ31ntbrwVO0KzVqSDkeZZ6wYxIKnDEmJY4UHi8xrtak9oYOcf083Hii
         1YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089862; x=1763694662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U317h5HoLWt7juAHdJnCKIDwmUGXYFH0EJIwfSTUTgI=;
        b=EN0jJ+/e6QyXPoEywXqugzNE13Sb5HG8MU0isUYkSQS0PwLrpseXKAUj2hmIw45vTF
         tCSoqUXmxgPY/CxwzDFm+OPscZRnOU2mc/i9NHGk4GUQwRHJ7SpIeo1X5iJ6XtX7zE3F
         sBkAiO7YBBwOz/OfkFhBPnf4j9ZgslVYHHbsLcPJMusdyaQPaCGZvngUttVzrrdMJfkN
         ZU+1eOC7vh3rK7ki7tmEOFBkzj6yRDT8L/UTMtOmlc2P0l91S4bMLdN2nx/giZ5DrEFw
         BO/B4d+XeE9Y/s2t/MDQyLY1sGmuvfXcf2ZXBWRSAcc1S5+HuHjImQw5VUk+JZHK5rZA
         UD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxkdQDrO0J44pvSGE6Rg84yIk8gWEdO8t7VoWKRjzOc921KewU5Ckf79nGF6vXWPgrg6GzGU5fAHM2YZfA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyle25PTDZ6cEsQ/c+9XKiAuA1/3evh2tQMEyuU8y/jixt7WtbW
	kIQl+jHlVGc26gvMfB1W4Q7S0B5VYZ1MapzbpwhLTsuqVADzPhYiaZj7KZgPTQisvRFJKQoy20/
	64IPN+REEI3kgwD+XkVvJvgxxRK/RZYsjmt3T5UMDYF0nTuRzhXeT9aUxbjA65YUUybvU
X-Gm-Gg: ASbGncui8p6hoB62IoKC+AqnJXI9If/385lA2no0a1Rj/xcL4VTEw3G8q9jxy++ule2
	Y6B74rAa8M5e863Xyqw78MEedknaL1wBp4AOlfW0g2Zw47cJ6YNvsV2xTuUM3ZddPrYb6sCvwsx
	C7LAk0QmCy+b6Bmh2yNQBn0At9GmVUxCo7XJAoR+wHv9MwBDGHnGhGwOdlcoI8YEk7mS+eyNAGy
	8aRkETypg7aM4IoHeRBG3lFAJRzXQ467DSwQ5sATA3vjF5HDfRUCqMJBUFAJ/YMBOdevfc/H0D3
	03/HUsabmuYejwvbgNBxeLiBr5DuhpjXb+vre4PnqR9D4d0wfL/2xdUENWrClBLYlFURgH3gKbZ
	8tXynx2vfhB/LsXqKGYbox5wsH/Sa/mmFxrsWY+F49yvFlH/Vzv/vgAEooWf0osm7au7v59TVKx
	OkxhRLB9tL
X-Received: by 2002:a05:6a00:c91:b0:7ba:13f4:a985 with SMTP id d2e1a72fcca58-7ba3b0aea0bmr1596279b3a.23.1763089862310;
        Thu, 13 Nov 2025 19:11:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6Sk3gRuddix6BnhQy/SIP6MtxsL7v/cY5YklRK3nPTMC3W908EvS7AWE82rVOPAN7FjQ7bw==
X-Received: by 2002:a05:6a00:c91:b0:7ba:13f4:a985 with SMTP id d2e1a72fcca58-7ba3b0aea0bmr1596246b3a.23.1763089861721;
        Thu, 13 Nov 2025 19:11:01 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:01 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v6 0/6] media: qcom: iris: encoder feature enhancements
Date: Fri, 14 Nov 2025 11:08:57 +0800
Message-Id: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmdFmkC/33PS07DMBAG4KtUXuPI42fNintUCMUvaonEYLcBV
 OXuTCohsiDZePRbnm/GN9JizbGRx8ON1DjllsuIQT8ciD/342ukOWAmnHEFDAzNNbeXOPoSYsW
 Kb3wc4nhpNPEAVhvHbbIE+99rTPnrbp+eMZ9zu5T6fR81wXL7qypmuWHHThgmKNBPnNuXbilPp
 bXu49q/+TIMHR5kkSa+6haws9PEKaMCrA9Geeek2gDFHwhM7oECQS0c81KAk4FtgHIN6j1QIqi
 C9ilZLRK4DVCtQGB7oEIQgnNgrT668N+X53n+ATMA9D76AQAA
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
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=9625;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=NOAKe9H87v6o0ZDOTIQWFJS7H3k/6Y6Utoj63gWOneI=;
 b=jhafJgvuy0pKWH20MGa7r2Ov/5+ED5RhzMRFl/4rCyOPOA7Wr5pyQXOMXAY4GaV1R8jWTrR9n
 tnqpBaCcO0pCD1zw9T3+SU+wsSsW2YKFpq+Sc8ldsUPfa3A2uQSBHiK
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: eCj27qdbbS-czA1kTTpch7wf3V5mT5L4
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=69169dc7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uW5hs7etCHDVNyUx15YA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: eCj27qdbbS-czA1kTTpch7wf3V5mT5L4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMiBTYWx0ZWRfX2JCHlZWgVrRD
 tmASFbxjeffv5pJyX2aul4WO4fwPWVBuhpUnr4kgItGncaxRJFsL+tgK0Ngwb6sdhxjqKSd91gV
 LIjwJq6glu7r4OwuJW9vtFKnpKmFus6VByFXNlksXYjrm4MeHuu99VoJAtemGpfNkEzMeKvTozh
 6cCNfIxPgJgatPT3Hg2Uu1j7HzdMJj8L8BKXqSiXcx1dGp8j1xUjEjEG8Alrz6Tr3ZBrY457hZy
 KIsOQ0W85wVN7YjXxlhJDBzU6JZQb8Dx+VqdbdKFLcICdvHwMMp83Oe903C62ZrQo3AufTENhTJ
 VavYQDOH/ZVXvgtZghe/yV1J/UujFmXO3guzIi5BGc6jiGhH+ZqLgvOWhfJWLJFNPMbB7PeQv0Q
 +B4KXOAdN//AVJa+TocnKB9YofMePg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140022

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance and v4l2-ctl on
QCS8300, QCS8550 and QCS9100 for encoder.

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
Changes in v6:
- Define ROI in 2nd patch's commit log.(bod)
- Rebase.(bod)
- Link to v5: https://lore.kernel.org/r/20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com

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
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251017-iris_encoder_enhancements-f2d1967b29f9

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


