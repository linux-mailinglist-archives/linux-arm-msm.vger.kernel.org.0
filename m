Return-Path: <linux-arm-msm+bounces-80724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5CC3F3FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5023A90D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41187405A;
	Fri,  7 Nov 2025 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkO8w+7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cADGz0FY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E92C11CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762509000; cv=none; b=bfN/LNcPuJnp7ESu7HZfcuf7YhfqumzpmM07BL0A2pn1lb6gLemCjkRewY+/tTOCYC1w6b9B1A8Bl1rrtZidKdUtS0ngQB6tAeJmGJjRAfnM7an8iSRUCMz7r1a7SVp3JEVIrd1cr9cwLiZn9PwyUrgs1kCGNKDkCJv369J5yms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762509000; c=relaxed/simple;
	bh=/ZxHNm19lQ8PeTQeuHqgdpQBpLwi+8y4QRpRtkDWgr8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uVX9t4IkyXby9X/a1lsyikbxIC5p1SW/tQmurBNKNjjXg1Qd73D1FCMjoLfV1qSv4xxAxKfnp802Ag0j4yrWQp8AVi2z/ri0UkqIeRAGtiwlP9RZGfAWQhOdDyzLc3DOWDYNMbIU4q1jGCQbo+mih2a9dhHXoKILvTQO5lk3nlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkO8w+7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cADGz0FY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77WLce4131317
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 09:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dTHRFYJ1WMv+O+OJg71Qlu
	i13WEvTb6Ij7B/xGqHvAU=; b=gkO8w+7AiEK/i4pYbK3AXq6OCHuNMjcD3JlyHr
	Fiw3qOBbCK5hi+28hVoiPBTIy7xDUr3C10cAO0/TIPqRi49J+FlF69fwWI/XeXTg
	MXIP5VfnLke77tSFF4j/dR3n4y6t0fe5l5tCPE0mYpvfArWritQ3ZO1Of813mif4
	IXAUoGpvQIhMX+/BrdEwFcXXzV9R9b3jJWijS5dCg1DT357tNZJePxKNygE+uH2B
	WBE8F+LnQzwR8wXhAJn38pvVci6BHjRkAa7QS38fQGVXJ4QpowxxaUeaUUxZI1+X
	v0Yj0u+ddiajqJjzGxfBkvKNopJKoEL13H6gUQWPBSTNJLzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3k4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 09:49:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so8788335ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 01:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762508997; x=1763113797; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTHRFYJ1WMv+O+OJg71Qlui13WEvTb6Ij7B/xGqHvAU=;
        b=cADGz0FYkw3r1jnOVFFjbfcVwdsbiVMd/4L5BdFtrU72eX3qXLuf1ozv2Pv71pPgcl
         7kYQxsrePQJWi2woN3HWhyNYz3Ue/j0iaQJ/1ZJNSG6dfXA66BtQCGHgF/aqXMSeizMd
         riu4IzDJprJ6/+ILLGJTwPD+b2LNo3aghwSKxk97jooP3qCI6qPV3Sub6qv3ZisFo9g4
         zjdYNlStDlRZYbYCSBRFLioGjF9jNXPODfSn8jwjcVh8Cf50DecJMMMcjTKyhTABh23j
         lDBfQMp1gpYQmXf2859Qnx3lK6KSxKKGghuPghgNnvsWWktJ7n3qHJhJ1R94BwutmRyQ
         x5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508997; x=1763113797;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTHRFYJ1WMv+O+OJg71Qlui13WEvTb6Ij7B/xGqHvAU=;
        b=G+9fZtjRow/CtUkcmzc5/HL2jBSWaA8fe8p2IZ4yM1pX5IhwYCg7EIGPBuDCuijyiA
         p/vHGQZiydQoulzgJCmefYRBP6CId9dGgb6Nv9omyVLajjuXoIrBofbOKtuDDo04joVS
         2542cRI536Mw4ai9m6XYs9fjXJiEgqhPEKMIGUcO9gnP3W7AhJcGMTU3K2NS/zdkovPB
         Rtms1bum6zpWTG+KVV996Y1e8dBSPYBMVU79JnOhDtpkKFfQeYT7/jUqIvqj6fcX+piM
         snGk96jCpXlHgps+ZEUfhZWIY8JurXdw6PyF+vKiD2tjyjkHUNOkbstW0kIPVWNrmyOy
         WJvg==
X-Gm-Message-State: AOJu0YxIXPfczD/FICgJo2Grpkva4rYVcQPSzadEoKcbSR8E1E2PnKmg
	lkKxyqwka7y62DlsL7jk/FX4JRPz2VT4dKOn0GREmnvwmU9vJ5TOCvc7mS+yz6r0H15qDBSJK+x
	m5jPH1oLhlulmu0QsjhsZjrxeoTxfYOEdB5XoeNPvLtOGrHkDIZdDE/8mKd2DRyZ89X7d
X-Gm-Gg: ASbGncsUJbvoBQkrIX8iRKf0KiN94ZsgCG8l5AyposCwIhKcDVRVsVIgmXRTlsN2VxS
	8BanVxovwNrYH8mikaMLhQQdQ9S/mB9Cz23D4oTwzGy8/YoEW1YOFo4L25yW4J12GVLRDCAR6it
	IDbp4sR4DdVhXrFXId0hFdxJHeaCbiPFdedtirjGP44sM23BvdUbV98+uKDQhRHL3I4aBDTqZUi
	qC9aD9WBkqiwCFZWDxRobOhiyjGnXph6FN1AEOYL0UgdUqqVMTpo0wPOkrWpqzh60EUe6R8iv/C
	I4c9PkdgwEjmWVvYyqR186TKpoKO7DJ163hx6bDLTZZvh9UOxwdULpiDsw1lCnJKH2V0oenG/t+
	EAEMBfApzIyr8qqsCTKEpQj2kC32LC19Onw==
X-Received: by 2002:a17:903:384f:b0:270:e595:a440 with SMTP id d9443c01a7336-297c040a72bmr32762575ad.25.1762508996948;
        Fri, 07 Nov 2025 01:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhtY2SGWxq9iLgeSlohLfIqxjeiYdldOOqQcQaZGnCNL1D1PFMqODFJt6ggJmNFtJ8YpOjhA==
X-Received: by 2002:a17:903:384f:b0:270:e595:a440 with SMTP id d9443c01a7336-297c040a72bmr32761925ad.25.1762508995922;
        Fri, 07 Nov 2025 01:49:55 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f011sm54975895ad.25.2025.11.07.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 01:49:55 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v3 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
Date: Fri, 07 Nov 2025 15:19:35 +0530
Message-Id: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/ADWkC/23MzQrCMAzA8VeRnu3o15x68j1EpOsyF3TrbLUoY
 +9uNlB28JDAP4TfwCIEhMj2q4EFSBjRdxR6vWKusd0FOFbUTAmVi50y/Nr154QVeG5tbZwRJRS
 mYPTfB6jxNVvHE3WD8eHDe6aTnK5fJV8oSXLBQSvtREnjqoOPMbs/7c35ts1osQlL6gdIIYslo
 Aio883WgbSmBP0HGMfxAxzKB83qAAAA
X-Change-ID: 20250924-knp_video-aaf4c40be747
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762508991; l=15943;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=/ZxHNm19lQ8PeTQeuHqgdpQBpLwi+8y4QRpRtkDWgr8=;
 b=Xb/4LpcrKabaKUldN0vUqvDKozmM8AYursAXKLJmCLn1Mk8BEbYKQ2BQ6fix8kPkjUx3+bIQu
 bb1YW9eM+51BU9DtcIIHTbQr43IMprXrAnKk5uvGWZxgscswSR7ym52
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3OCBTYWx0ZWRfX2Ascoy73eSi+
 Rvla+wU9rggtRhShqKLjG57m91JLnWNIvZ9uslk0QrpR7N4TZ40vReGFiE+0p5Pv3QedYO7vIaU
 3sFvmZLBqugOSpzQYQJ4wJCZklap+9e+oiuYT5uAt5/sYa8kWw2Gc7RiMyWiPyOczPz6UX4RsJh
 avhSVgqqXSl3cWFWq1oeMsY+0t0HtbsfG+B8CegUNiT8Z7RuXMBJNsPGi4uaFTddEen/HJMiKiu
 w6/i4/bUWBy+m5x9+GjKGhNgmKoH0wliW+4linGkELdORF+gfyq87Mo764FQWGxh8tbFFveCBZS
 XKxfFwwzJFu69WDR1BVh+yGZC/+NnELMhJ5b960ibc4mHGg/INbwoA4/twjy52fvLyT133BIHEJ
 S2e+xj6N/AhQepFazSLrKQcFsTeL5g==
X-Proofpoint-ORIG-GUID: 16aKLK9-gvc-rGJAaMaVRKB25hIyj9e7
X-Proofpoint-GUID: 16aKLK9-gvc-rGJAaMaVRKB25hIyj9e7
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690dc0c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j8pLvHWEjehsjOGDu-oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070078

Upcoming Qualcomm kaanapali platform have a newer generation of video 
IP, iris4 or vpu4. The hardware have evolved mostly w.r.t higher number 
of power domains as well as multiple clock sources. It has support for 
new codec(apv), when compared to prior generation.

From previous version of this series, the kaanapali binding patch(#1/8) 
and the compatible patch(#8/8) have been dropped. The discussion for 
this is captured here [1].
The series introducs buffer calculation and power sequence for vpu4. It 
prepares for vpu4 when kaanapali is enabled after the binding discussion 
is concluded.

[1] 
https://lore.kernel.org/linux-media/fdf4c469-d276-4f64-b13d-5266cca7235c@oss.qualcomm.com/

Please review and share your comments.

Following are the compliance and functional validation reports executed 
on kaanapali(vpu4). For the series to be functional on vpu4, patch #8 
from version of the series need to be explicitly included.

v4l2-compliance report, for decoder followed by encoder, including 
streaming tests:

v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:2000000.video-codec
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
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
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
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
[  328.905995] qcom-iris 2000000.video-codec: invalid plane
[  332.917543] qcom-iris 2000000.video-codec: invalid plane
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 21481 buffers
[  350.438406] qcom-iris 2000000.video-codec: invalid plane
[  350.447079] qcom-iris 2000000.video-codec: invalid plane
[  350.458821] qcom-iris 2000000.video-codec: invalid plane
[  350.465860] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  363.878157] qcom-iris 2000000.video-codec: invalid plane
[  363.886546] qcom-iris 2000000.video-codec: invalid plane
[  363.898475] qcom-iris 2000000.video-codec: invalid plane
[  363.905527] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  377.209312] qcom-iris 2000000.video-codec: invalid plane
[  377.218027] qcom-iris 2000000.video-codec: invalid plane
[  377.233635] qcom-iris 2000000.video-codec: invalid plane
[  377.241360] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  390.624700] qcom-iris 2000000.video-codec: invalid plane
[  390.633590] qcom-iris 2000000.video-codec: invalid plane
[  390.645629] qcom-iris 2000000.video-codec: invalid plane
[  390.652618] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:2000000.video-codec
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
        Standard Controls: 38 Private Controls: 0

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

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

gstreamer test:
Decoders validated with below commands, codec specific:
gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 ! 
parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 ! 
parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 ! 
parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

Encoders validated with below commands:
gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.h264>

gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.hevc>

ffmpeg test:
Decoders validated with below commands:
ffmpeg -vcodec h264_v4l2m2m -i <input_file.h264> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec hevc_v4l2m2m -i <input_file.hevc> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec vp9_v4l2m2m -i <input_file.webm> -pix_fmt nv12 -vsync 0 
output_file.yuv -y

v4l2-ctl test
Decoders validated with below commands:
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.h264> --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=input_file.bit --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=VP90 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from-hdr=input_file.hdr  --stream-mmap 
--stream-to=<output_file.yuv>

Encoders validated with below commands:
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.h264> -d 
/dev/video1
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.hevc> -d 
/dev/video1

Note: there is a crash observed while performing below sequence
rmmod qcom-iris
modprobe qcom-iris
The crash is not seen if ".skip_retention_level = true" is added to 
mmcx and mmcx_ao power domains in rpmhpd.c. This is under debug with 
rpmh module owner to conclude if it to be fixed differently.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v3:
- Drop the binding and compat patch.
- Address comments related to variable handlings (Bryan)
- Pick the updates from Dmitry related to sort register #defines and 
  connecting register and their corresponding bits operation (Dmitry)
- Link to v2: https://lore.kernel.org/r/20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com

Changes in v2:
- Dropped dependencies from binding (Dmitry).
- Dropped optional items from binding (Dmitry, Krzysztof, Konrad).
- Updated binding in sorted order and proper alignment (Krzysztof).
- Fixed order of newly introduced kaanapali struct (Dmitry, Bryan)
- Improved readability of buffer size calculation (Bryan)
- Optimized fuse register read (Konrad).
- Fixed order of vpu register defines (Dmitry).
- Addressed few other log and commit related comments (Bryan)
- Link to v1: https://lore.kernel.org/r/20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com

---
Vikash Garodia (6):
      media: iris: Add support for multiple clock sources
      media: iris: Add support for multiple TZ content protection(CP) configs
      media: iris: Introduce buffer size calculations for vpu4
      media: iris: Move vpu register defines to common header file
      media: iris: Move vpu35 specific api to common to use for vpu4
      media: iris: Introduce vpu ops for vpu4 with necessary hooks

 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  23 +-
 .../platform/qcom/iris/iris_platform_common.h      |  11 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  33 +-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  21 +-
 drivers/media/platform/qcom/iris/iris_power.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  20 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |  16 +-
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 199 +-----------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 358 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 342 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 188 ++++++++---
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  61 ++++
 16 files changed, 1026 insertions(+), 279 deletions(-)
---
base-commit: f215d17ddbe8502804ae65d8f855100daf347061
change-id: 20250924-knp_video-aaf4c40be747

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


