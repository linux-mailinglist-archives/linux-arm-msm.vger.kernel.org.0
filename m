Return-Path: <linux-arm-msm+bounces-77818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D1BEB3C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 20:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AEAA19A7084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 18:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0405330B3F;
	Fri, 17 Oct 2025 18:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OU3t3Lvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FC257831
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760726130; cv=none; b=FJxT18VYi1JnyjPBs6KmvnazXFNbXw7TR48m3ShBgKfQZV8NHrrDsIabJmQl3AXYHukeXQQ7x67vvV46uUvjZ56M1moU37e9Qu561FGQ5RthVUnF0haSfPdl9Aia8NKrI07A01PBcQ3LzRqQTpgyDy/kA8x/98KyhKKkRIbd4ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760726130; c=relaxed/simple;
	bh=xHSqPntYzpz7DVALB96qOQZ5QTbb7PGq/LOBAo/onV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ERv8mvVDMwaUsJ4XSyZ6lmCsrHB47PRMUHV2SWQvou70val+iEOfsvuijx7rdUbvTCQpX8bczG2Mvb3zwwBjjsr5t69F7iXBJavoH8u9VKNc1E9ifGdfMKkXhNyHVUpXy8FxrbXovu2tAxm0MSnHrHCWzfJWxmQ+oXuqa1nbOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OU3t3Lvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIRvpO008323
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4tTO+jLGMPL/fgP6O6lI/c
	XxyvmgCtx+wOxnvCaO2Mc=; b=OU3t3LvcLYRcMUBFGQJ3miUAEmGuXePJKGFefV
	kpN2sFTqIbKqxHghLTm+BsFssU90sGsv2a+EU5mp0Qk4HYP8yHkUQORK45E//pn5
	/V52murz8E+eJ4uenfwkPRDh+bWSHkDjgMDZJBqRz6csZFSHGyBUpCFxzcbMn1L5
	i/YVSLEdjKswwCU9fN7pJphh9JOGBaWqe0nk0m932km3v0hQWYWoxUl79FpjR/hd
	OGQWXYPuVB39+1GgpU8OIZFW5DKl0lHN9eYGwd3H5+BZM74dX/XBXdewtCIO5C2Y
	ba4kssR1EY9UAoLrGSboSR2vyvMktQ7usU+tGYIsirND4y7g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5wgyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:35:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78124162721so600125b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760726126; x=1761330926;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tTO+jLGMPL/fgP6O6lI/cXxyvmgCtx+wOxnvCaO2Mc=;
        b=fA/qxh3zIxCm1aLmvEcrbWYbXS+Kwed926eNm7AoOy13y7CIpsGYSXHE5eM1PMROmc
         Z+36EC2L3DPkThSMJ5ZwZx8C1o/kyH8FA/lIwk2HUzzINnXZ6bD+mt46SPfQ4kmbiUNt
         /dkhjNMYVsAcSOpPcVNfLJmYhB2KRvQlCeLUfhvulathEIBiIxL8UUZhzvlo/PL1KkIG
         iGHedVb8bquCOWzZi1evtWTFudIJ0E9BPv7W7+ed4Yxiup4lGoXq4NBvcEqVfW+6asch
         OFGryFb9r3vkUWB7lum9mFZdYLivd8q7THCHt0YvA74VBFGrLQvPiVv0aU324Ro77p/+
         KLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCViGXdFW/TdELbs1acWudtF7pZqlAMFH3agWSq1raNOdHHSc1k+pc53Du//ZqJlmEnyTiHUsSGH5BDWXLmO@vger.kernel.org
X-Gm-Message-State: AOJu0YzFcVu/3UCTOQO9ScPQX/Jpbn5K33DuxmeYT8tvQn78Cff2pNHn
	YKsetmrSx3U3BgDcVIFbc/R448bpMIIDsnbNM4WAgwxFXOiV/5tBDaY/DRya1vzkvNMVrHXrT4K
	PO8lIEZzW6Og494IOT5mCeDHJXgzActroig/BdPot9wQi9oVmT1GKS1+CiMgA3V9lQUXq
X-Gm-Gg: ASbGncuO9kAjQLi2T6PSjSdij9ux8v9kBXmVe91eU6QHz1UOjBkGt10uKZ8YDfQ6Un7
	rZF43MxQhGKS+6tjc80P4MNQ/Cq80wdm58p1NqOo6slae/RgR0nVbok0dBg3bHwg8dnrPT6+BvQ
	nLG5XXoZY9Bdgvcuo45J3vaHRrqV8Qs1Kg0DKri9uCKQNWZNV4vBPCYqbdcy0Q4VSBtCppy8LYe
	51PFzXRQ+GlqQO7gTR7GeoVvRL5KP21djoWnWwISCt817bSIWK6WFZ3ac/yh9MIRZuOo2dhsT4r
	gPUtwdfDp7QMfBxPMT/18S/GgysoSwUCG9kAB4ffZtP5TZTqIhnaUvGlpm4tBirpma/AM/BRMxY
	JLZTGl394MDNWgILxwvlYiJG+ORnZ264qKmtTLfKmLAGKOl80D4cMPsua6NA=
X-Received: by 2002:a05:6a00:21c9:b0:77f:52c2:14a2 with SMTP id d2e1a72fcca58-7a220a64b38mr3077860b3a.1.1760726125862;
        Fri, 17 Oct 2025 11:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2A0QXrzFhp2eKwJkrOdn976fVV9qiX50jV/Q8/C7bEQ8Hb6AkE/Pbxz2DLx+UhVNyLY6mbw==
X-Received: by 2002:a05:6a00:21c9:b0:77f:52c2:14a2 with SMTP id d2e1a72fcca58-7a220a64b38mr3077825b3a.1.1760726125107;
        Fri, 17 Oct 2025 11:35:25 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24fasm245487b3a.42.2025.10.17.11.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:35:24 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Enable support for AV1 stateful decoder
Date: Fri, 17 Oct 2025 11:35:14 -0700
Message-Id: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOM8mgC/3WNwQ6CMBBEf4Xs2ZIuCIIn/8MQU8pWNhGqXW00h
 H+3cvcyyZtk3iwgFJgEjtkCgSIL+zlBscvAjma+kuIhMRS6qFBrVCbihQPLQNYPFFSzr22J7qB
 NhZBW90CO35vx3CUeWZ4+fLaDiL/2vyui0qp1vW5c2be10Scvkj9e5mb9NOUpoFvX9QtYK0vzt
 QAAAA==
X-Change-ID: 20251001-av1_irisdecoder-846c31f70a51
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760726124; l=8655;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=xHSqPntYzpz7DVALB96qOQZ5QTbb7PGq/LOBAo/onV4=;
 b=x6R1NyhN1AWySr9w3qUFli/zoA4biEhpHOkEYq5D3RTwJ30tsZFqfbn1Wcpo7aq19VQWLtH5p
 UwW2UB+lE0iBq8L/2LmGRc8J19trvXw/UIW1GDZlMu0xPXplIwO5eYC
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: 04H7LQ8Y6MQGXimPTSMv-Uj0lRHuDYEu
X-Proofpoint-ORIG-GUID: 04H7LQ8Y6MQGXimPTSMv-Uj0lRHuDYEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX5MpQ9hcv1UcG
 iNtYAcl88p+W3+5az/DGqfdMELRzlqCN11NrZpNtZcCQ5RWRN8epM1jrmYS15REZKjxzLDbO1ik
 RHsWxBfv37vNt8JYIAdysX2JYPh4JemCQXt2G2XipMLBX4ld3dKKSNAjzQcwdPiVb/hiEM4zqED
 Kz7xyeebbNOGRz4ZuidyMVtap20de4BOwQ/W9cHkqrnp7LBlNLgeF0K+KHW0dN5rEOooxBaqrl1
 H+E4TQ9mgaw0Z3IjYsIMWs5t13xHVk1TbcWvbHoQcy784V78gWYldV4oRLkM690wDKwaC3ZRFum
 gugqCeIhoZHKRANU2NcBba8iJfAZAwWJ6ISjb4VQb4Q8nML3YKAgzVxz3BnvDuBQ1Q1WqlYi6tD
 8SPI4Ph0lOC5fX+8T+jpq6ANdEQwgg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f28c6f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=uUGzU70KmCT2MW7EYTsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the 
RFC patches previously sent. I have made the necessary improvements 
based on the community's suggestions.

Changes in v2:
- Updated documentation to target AV1 codec, not just AV1 decoder
  (Nicolas)
- Updated description for V4L2_PIX_FMT_AV1 (Nicolas)
- Simplified buffer calculations and replaced numbers with relevant
  enums (Bryan, Nicolas)
- Improved commit text for patch 5/5
- Fix for kernel test robot failure
  Reported-by: kernel test robot <lkp@intel.com>
  Closes:
  https://lore.kernel.org/oe-kbuild-all/202510021620.4BVCZwgf-lkp@intel.com/
- Link to v1:
  https://lore.kernel.org/r/20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com

Changes since RFC:
- Addressed CRC issues seen during fluster testing which
  are fixed with firmware fix [1] 
- Added Documentation for AV1 stateful uapi [Nicholas]
- Resolved issues reported by static tool analyzers
- RFC:
  https://lore.kernel.org/linux-media/20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com/

[1]:
https://lore.kernel.org/linux-firmware/ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com/

These patches are tested on SM8550 for AV1 decoder while
ensuring other codecs are not affected.

Gstreamer testing: 
Gstreamer MR for enabling AV1 stateful decoder:
https://gitlab.freedesktop.org/dmadival/gstreamer/-/merge_requests/1

Fluster testing:
Test suite: AV1-TEST-VECTORS 
The result of fluster test on SM8550:
135/242 testcases passed while testing AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

failing tests:
unsupported content with bitdepth 10 (66 tests)
Iris decoder supports only 8bit NV12
av1-1-b10-00-quantizer-*          

Unsupported resolution (36 tests).
Iris hardware decoder supports min resolution of 96x96
av1-1-b8-01-size-*

Unsupported colorformat (1 test)
av1-1-b8-24-monochrome

Unsupported SVC tests (2tests)
av1-1-b8-22-svc-L2T1                     
av1-1-b8-22-svc-L2T2  

Bitstream corruption issue: (2tests)
av1-1-b8-03-sizeup                       
av1-1-b8-03-sizedown

Testsuite: CHROMIUM-8bit-AV1-TEST-VECTORS
13/13 testcases passed while testing CHROMIUM-8bit-AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

Following the RFC feedback, focused on only IVF/MKV content
as AV1 parser lacks support for below content
AV1-ARGON-PROFILE0-CORE-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B

Unsupported test suites:
Iris Decoder supports only PROFILE0/V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN
and 8 bit, 420 only
AV1-ARGON-PROFILE1-CORE-ANNEX-B
AV1-ARGON-PROFILE1-NON-ANNEX-B
AV1-ARGON-PROFILE1-STRESS-ANNEX-B
AV1-ARGON-PROFILE2-CORE-ANNEX-B
AV1-ARGON-PROFILE2-NON-ANNEX-B
AV1-ARGON-PROFILE2-STRESS-ANNEX-B
CHROMIUM-10bit-AV1-TEST-VECTORS

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
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
        Standard Controls: 12 Private Controls: 0

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
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
Warnings: 0

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Deepa Guthyappa Madivalara (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Define AV1-specific platform capabilities and properties
      media: iris: Add internal buffer calculation for AV1 decoder

 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   8 +
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 110 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  15 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 156 ++++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  18 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  25 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 298 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 767 insertions(+), 28 deletions(-)
---
base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
change-id: 20251001-av1_irisdecoder-846c31f70a51

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


