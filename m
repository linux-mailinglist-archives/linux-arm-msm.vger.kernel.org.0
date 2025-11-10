Return-Path: <linux-arm-msm+bounces-81090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FAC484D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 813474E9896
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B738F29BD95;
	Mon, 10 Nov 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkHNJs6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFJjvy4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E929B8E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795268; cv=none; b=h5+rpkIzXaCj9pFeWRW4+C71C8KQVpDqdc5NEUO6y6flyco8VfQ3v+n7eE4xfan/S6DO/ED+4b4JKRAXKjlQFP2jSeyKjiWD4wYuTMBmhjjjIpuXTgC7oAJEO/F83ng5hOYwhTWNDii5C5TqyCILcUOTeNCm1LcyKLPwoCZnBd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795268; c=relaxed/simple;
	bh=/sEJS6l/RrfdaJZAx0GN6qJwAmxm+53lJp0TSeChSgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pKySpV2ogX1rvJdyMdyQny71JQFxcW5MysW74g37TKnk8hyihqIh/FsZN109P01NahUZWZp1NZkW4eQPCcnmZkFy08sn2WyT1GH9JkIYM/0Xojt8GMqrabjIv92CRbO1Ftj6JnTzx7XyH8Y1GC8aIZbnZzwNf9uB7rLRoaB+0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkHNJs6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFJjvy4r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AABZTD03271018
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DxYRNO8CuRZBoI7cYql7Y0
	bFo8dl31Xp+r6/Z381+ws=; b=TkHNJs6u8otjkp+QJS2/973YD05NschU6qIB1w
	Pp05QfIY5ocHFf3pQPr+oiu9d98NGuemS1AXOIehLEJqHoQZadLXQmRHoQE9D4et
	ObSRs89xAjgDtg/AFU3TxcrbfTXzMYc3Clj3FSOUafzdxuFyPqWIoHMfixgQJBT1
	ZiQBvFf9+qWC2G++Hi/R27YfYh6xwJtKUh47Zvr+gXb6TpoY+ImCr5/FMIii5IMo
	yDWHqOg3nLHcOMXF4ImwyjnSOfcIvjiynCRTCd/blRxz2oPkW21Jv3aCfTLrgGYh
	d/UT1RXG4OA7eIgTabh5n8j9WFnuGQ8X9V5dHvoGvOiOU1Qw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abfafs19x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6cdfb42466so840889a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762795265; x=1763400065; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxYRNO8CuRZBoI7cYql7Y0bFo8dl31Xp+r6/Z381+ws=;
        b=dFJjvy4rAiIVvvC4YUWRgg+X21rqKaFOryywVPX6ujiKJDG2mGyItXn9pEn9hQ8YY3
         C4ZR95m8oa5plldZxCU86P6xJSlddsQ666dKUbxakQM+kKFgwGfcw1ZmzNtHfEiEhdH8
         1anHAroZvYZ8kUhrktK/BlvouvB0DR2wx8mHW68v5x+rt8Jib48wm6EuQ4UPRjB2majL
         5ciPxCxoZyE6q2FBJ8r+vYAXNp/q0Hrtwze5Y4rSx4DbOQekLZvwGhk59F/+Cko8Aj1C
         kgPnLV93hMB+cwYgHHPQ/1jqw/xvy2DIgklFC609/dQoLRrQej8ITzateZCk/dX85H6q
         ANkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795265; x=1763400065;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxYRNO8CuRZBoI7cYql7Y0bFo8dl31Xp+r6/Z381+ws=;
        b=irtrIZlijmGcWiXAS4H33uI5AUmX1i5jPwY8/SKpQCc4vxGGP3ocB/l+8i94dNq4wl
         zibxmqcNd7NS4k6ZCjpF77pFbOR+8wGHvqO7tBErIu/3fIagtpN7Pk338hoKOxzYHUcm
         wh7rEjr6qTM90YySbdFFof6Rlf7wXGpCU44/ZlUWvX5XC8BOAuFWDH1zSSZTthVydx8l
         7rx4M5WI+u//bpT6xmnkoprXGxBIaDTm9vZLV4v6dbTePxfg51zdR6MnbR6KtqUBfeeB
         pVmJwcDUOC8HV+hZf0UBgDMa2MJ+/MuPwNCPhqo3RVwpYPX7VjsDMyQFnnt7CcGPkuBI
         CB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxG6OLv9hL0FnjPOK8JlplIUm5XNGwVhGShaUEVjVoYRCGKn7FlY0QtAlN4354QOmxn9uJd1zTCj527amn@vger.kernel.org
X-Gm-Message-State: AOJu0YypuTVlxzuHQw1fMJx2rx3WS6KMpxJWrl9xfA6rKndED9aynjlE
	KruEpADnFLHbsdNb5hsmlcT3w5a5a1biHMphrQiMVq2hsyTeZZX0nAeUUIjzMEJc93qOFhW1Exe
	J5I3Kqa/anY3+O0kGKh9cVVd10qnZX5K/Z0BNaUNTzY9lKwnpTLqOIox6sikT6VjrH/5X
X-Gm-Gg: ASbGncsiLYiJ4M84jksJg7Hg+AxZNGW5fD+nv18yljfMrKje8k8OIXS/2hXluuvRbMb
	XIPPYBAJRJMjnrhCQD/aCCuaDAosE3dK1nI+e5IiTTjmjI61avCMn03aapxaIjTUnMCKkD44imp
	KqIZm6bdHCoT03KB8pabpg/qrU/JLJAKJhgNPvjw/vkSB86ZByKVkSjIw4AdpMe1k7jew47+t4Q
	LN+4TAH/d5hr+sQbH0b54IACQeoYmnOZ4ZgnL0ZFruGkGbiwloECFZvfNLcHZMDLX4irFHIR4P/
	ThVtreZSu1il3ASG+6MjKdkw8XO02fRFh6atClv20LMQgai8MKl1knrS2p286Kq2qWuJ/LyRgpU
	kxs/iVXZYdakVZZmDYEH9BoXEBVybNy5s6/03DdwEwRIF6miiURpNuR1JizY=
X-Received: by 2002:a17:90b:390f:b0:340:73a2:bac9 with SMTP id 98e67ed59e1d1-3436cd09f39mr6407157a91.5.1762795265000;
        Mon, 10 Nov 2025 09:21:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRE4n82NWHX8BEWG4Qqds6rAm7615f2OaLxI9DBmolyrARZee8RKoXfij+lSdrDTQNE+dGUQ==
X-Received: by 2002:a17:90b:390f:b0:340:73a2:bac9 with SMTP id 98e67ed59e1d1-3436cd09f39mr6407138a91.5.1762795264456;
        Mon, 10 Nov 2025 09:21:04 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm12643064b3a.47.2025.11.10.09.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:21:03 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Enable support for AV1 stateful decoder
Date: Mon, 10 Nov 2025 09:20:56 -0800
Message-Id: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgeEmkC/3XR3WrDIBQH8FcpXs/it0mu9h5jlKMeV6Ft2pi4j
 dJ3n0kvWlgKIpyD/jx/vJKMQ8JMus2VDFhSTv2pFvZtQ/weTl9IU6g1EUxozkRLofCwyyOMGKf
 DrkjqXWwjBs4heFKvnQeM6WchPz7v9YCXqcrjvfmAu1llLW9oSQF7moaU6eS+PcUTuAPSxiJ4E
 xWPoLoiZt5BRur74zGNHTey5baRrWeIIF2IKI1gUdhouAWtY7BGMkHmOfYpj/3wuyQtchnkHkq
 y/6Hqql3OGxVQi+jVe5/z9jLBYX56W7fFLOrhVGjFUdWR0nuOAI2M4oWjnx274ujZ0dxo4UC1P
 rxwzLOz8lnFVEdB6wI2pp6CFed2u/0B5vSNWhcCAAA=
X-Change-ID: 20251029-av1d_stateful_v3-cbf9fed11adc
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762795261; l=9095;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=/sEJS6l/RrfdaJZAx0GN6qJwAmxm+53lJp0TSeChSgA=;
 b=8ZHOd9yFKpNm8XT+msSiJbo59OzAkCCzFJtl5axbZFSg5WHuCZeHhnyuU9B6EZXYiRcnPW8wa
 xm5i1MRv+KpBhOaOyJVZLzB+CYTla42dgNtVox9u2du0NKyR4VfKWZ9
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: vNeKGCoAVZEGJfKj8xAehVPJ0ZjPWpPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0NiBTYWx0ZWRfXwWmIGzaDUWpy
 yaIuo7Tj9PFrA9q8yhjRS0Fyixba0J4jpeU1MFeVkNZ7qWF0TVbn0eDloN246Zr/17VesaTER7I
 wZl7Sfhe5v5bjVDZcu37Vfp9So7yhHHcZDLwFy5fG6sGcwASaa+vi0VNjFlN7xTXRjqMtxdOlR0
 PJs54UGUQK8mCcu4tGrdqWO2yt18eY856amTkhRuBCrCM07NR37v+lIPN7N+m5Plu+aFMuaZyL6
 SgV52jP67NEb28EE1qMXGT/4r8otEXzBw/97AigIaAKbEbFsg6TElBkXsj8c3BVHHI6eEsdrnUm
 MEScF++TelOITmhIBkG4uZsvjlY+gw7QDgiYcnHNl/8+M1f1N/eNV9zreCPA6/S7oOXGVJQKsXv
 t4T8a3ETgAOuX+FrxNHeWYoWsrkYjQ==
X-Authority-Analysis: v=2.4 cv=UZJciaSN c=1 sm=1 tr=0 ts=69121f01 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=rSFLfVtXdW1OZ3NksNsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vNeKGCoAVZEGJfKj8xAehVPJ0ZjPWpPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100146

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the
patches previously sent. I have made the necessary improvements
based on the community's suggestions.

Changes in v7:
- Updated Documentation (Nicolas)
- Link to v6:
  https://lore.kernel.org/r/20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com

Changes in v6:
- Fix for kernel test robot failure
- Link to v5:
  https://lore.kernel.org/r/20251107-av1d_stateful_v3-v5-0-351652ba49cd@oss.qualcomm.com

Changes in v5:
- Updated Documentation (Hans, Nicolas)
- Link to v4:
  https://lore.kernel.org/r/20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com

Changes in v4:
- Reuse sm8550_vdec_output_config_params (Dikshita)
- Add definition for 256 (Bryan)
- Fix identation (Bryan)
- Link to v3:
  https://lore.kernel.org/r/20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com

Changes in v3:
- Updated fourcc could be to match the ISO specification (Nicolas)
- Addressed comments and rebased changes to resolve potential merge
  conflicts (Dikshita)
- Updated GST MR
- Link to v2:
  https://lore.kernel.org/r/20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com

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
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9892

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
		test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
Supported)
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
		test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
Supported)
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
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  85 +++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  11 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  13 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 142 +++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  18 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 727 insertions(+), 27 deletions(-)
---
base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
change-id: 20251029-av1d_stateful_v3-cbf9fed11adc
prerequisite-change-id:20250918-video-iris-ubwc-enable-87eac6f41fa4:v2
prerequisite-patch-id: 11fd97eabf65d22120ff89985be5510599eb4159
prerequisite-patch-id: aea5a497f31db23a05424fe2cddedec613571f2a
prerequisite-patch-id: e3b10c34426c33432208e120a3e1239630893d88

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


