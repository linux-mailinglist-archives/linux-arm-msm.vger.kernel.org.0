Return-Path: <linux-arm-msm+bounces-71693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA9B4107F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 01:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA6F16CACE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 23:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CF320296C;
	Tue,  2 Sep 2025 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odwtLGZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945C5280004
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 23:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756854032; cv=none; b=sHIDZj/lJupIUwHkmalgxnBqL2XMzcAE/4U87fmDduErh7mGPjdG6DUdW4OnvxG+HFf5fjuvzTSWH+FofZ/CXWv4w+MgIeKPuFVenaHyWw/OHHeRu1v1y0mSUyGqlJO1QXJ/yWwvuhpnGiqDyRNmqROiCpTshM1xTMPVKO5/EVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756854032; c=relaxed/simple;
	bh=vf/2uFpdF5IuesZQFhU6iAy8LzPwpgbubCt8IG3lQMk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nLZSSg0RVgZTslq/OCLX0hRa42redkSgNayXnPc5p9b+XdgxLzwb29uCCcll8K795t3nCb8AnS+17c7W+4VbmL9NWCSBCrOtEqztVri1aMTqtCldxvCloenA0nu9iMrPWby8582gxwk2+NuQl46xXVodmdJh+W9VmEiSPsFAyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odwtLGZg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqA1K023421
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 23:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gKexBYifbpfLQem90C86sG
	1ovp8fVWK/QohH5oGUN6c=; b=odwtLGZgjnTyGEnTZNkogHXsPbZjqtiTeP0Qi3
	x+vzO1oIOGw5qU0RJPGfXE42PgVCuK4l01TBdhah57eJ2+xCTP2WaCVTzuczuI0x
	msnsBPg8aZHhdF9V2WsuioOGO16NBWS+UHfx/8expiRak71nhmDyikIRtg1R34pu
	hG24WnqT/46gH9u3BlDpAdNt7PPCmAPpov2jsiJYcyVV4+2W8E/K4IUmyWTvYyGj
	4rh7D3PRbCtXM22BYN+aLfJS/peF2XJUUvuUePB8vtzppWpR6stwMGJtpNCXHDne
	Fm4u4QPeomRVIqJCscYBx3EKU70NxwDy1kajdOURiy/dA7vw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp9nj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 23:00:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4c75141882so770579a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756854028; x=1757458828;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKexBYifbpfLQem90C86sG1ovp8fVWK/QohH5oGUN6c=;
        b=enVGxg+YeWKo7jAuK5u4iHmdFgPA1vUOK8P8Ie+74FCUJjYtSPOE1kwR7PPsve1z56
         ZTjcokc45nepgD9uteSf4Cm43MGgPf27xN6TxjRzF2My+1KVIqElfZ5OWNWge+LCHsxg
         XJ13djE08DczHODYjYT2e/hYYYckt19YQL99gdnn4IbMccPgMJ0wepKr4is+T8XvmyBi
         IAsYurGRIMBmVmQxrvs81ePFPco+N/A0Ym0LCecoVC6BlofCjbxAJhH4gewqyAuT8L68
         tYnpedkTTfTNrh/wpbe1LNCUZ1VFv9d8uSml0THDX9jP7m2Yn1kIyMdc5Du2oiLbn9Xr
         QOSA==
X-Forwarded-Encrypted: i=1; AJvYcCUxj7hm4sHlnwjaITim+ZPhA4IsVw3lp8UAWYzU42zAMPHKjFif9fJJZJLzjt8AV3wdpWWVvHlesGLTBa0C@vger.kernel.org
X-Gm-Message-State: AOJu0YyEH1HuDIs617bkReP40jCVskmwSF14mAp9mqtMrqZ8+1OnYavk
	fVq6Ce6JyodQNzJ2WQmSBcA9ScFSZFus+/ldzV4P6+bSfWLe7WS5NHVT2gJboUD6zEsVK7s5k+2
	LWVm76wMJp6dZPJNNkHcBFLFOq5JLn+vkpEn+z7kMwlmRXQQ9G7rEATvGPyKTNiShbe6v
X-Gm-Gg: ASbGncuXyWLSWkh35E5xxYucUmFphEyfoYKxsyPereGnebTRAgPZva+NHyghMnS/DkO
	mOSC0F3KIgiir0MbtWzoTgvwMPop4KWGv7SAiF+YjEI7muqZHYnjRSak0zVkMY2Ejuuouim7D+f
	NSLtDvkhdB23sMTU8CYj2hR4U19s3NL5RP9fxujCBbpfQRXGbTIJlLV2BW/mMXstOfzd93k6bd2
	9NCcPhuE0pcQ6x1Y58rSeGZoGmX6uvr3pxetSvTNBQltvxD9wgecXXRQUq1X8/7hvGJGqPMO+7l
	hpyGxh16vHwbglwFcI4/DaAnck7RbUL0/tuk/7fJc6BKGzy+inydu98G9ur6k0pZF7vkK+ED2DJ
	4T6Bvn2XFq6OB7hO89mr5QCzZ
X-Received: by 2002:a17:902:f545:b0:246:f090:6d91 with SMTP id d9443c01a7336-2491f27ac2fmr124455715ad.11.1756854025649;
        Tue, 02 Sep 2025 16:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqmeGOy/nTAasBtNLaH/gkKl13XStwEkfsIs5Rq2v3AudE7jsJSIWN3HOw5WYt4+MI1ffhXA==
X-Received: by 2002:a17:902:f545:b0:246:f090:6d91 with SMTP id d9443c01a7336-2491f27ac2fmr124454245ad.11.1756854023420;
        Tue, 02 Sep 2025 16:00:23 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32a698ad4c1sm1875866a91.5.2025.09.02.16.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:00:23 -0700 (PDT)
From: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH RFC 0/5] Enable support for AV1 stateful decoder
Date: Tue, 02 Sep 2025 16:00:02 -0700
Message-Id: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPR2t2gC/z2NywrCMBBFf6XM2kAetUm7FfwAtyKSSSc6oK0mt
 Qil/2594PLcezl3gkyJKUNTTJBo5Mx9t4BaFRDOvjuR4HZh0FKvpdNKpBiO+XbhQQQTozMlog4
 1LPtbosjPj2sPu+0GDt8w0f2xeIdf89c2xUdqZSk4cRYjt9QL6kLfUhKoamPWEktnfTOa9wH6T
 CL01ysPTeGcr7BUzpIPaKX0lXW6rnxEGSolCY11inSEwzy/AOFoBAjmAAAA
X-Change-ID: 20250821-rfc_split-c3ff834bb2c9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756854022; l=10922;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=vf/2uFpdF5IuesZQFhU6iAy8LzPwpgbubCt8IG3lQMk=;
 b=FfYJpq8YgVyyAmP2BGHePkJaOeG6Ow3/sJCt0b3+WaPiLwJc4fl5I4F6tNNsaY/95/euovw+l
 tHH+NebJ6hiCy08S0o2s4qEJpsblEXNhHVigqGJekMoxbgC8sBSMuG5
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: CJcPrhEVdT4iKGW4g_bzkrfK3DtaGkLr
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b7770d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=zkFspIKpL86qC94Y_cEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CJcPrhEVdT4iKGW4g_bzkrfK3DtaGkLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX++EpzWpjVgfk
 6PRmCeGwNgA95aW2IG+VGgZrIeD5LI8b9LeO05ccGY3KmKgxR7jbT3YnO16AL7K9s2PL2lk+wyG
 OzaRmQWFgoAB+VT1j7iRPY8q7YA/BlrYLWO/US81l7TcZKDNed8phmACXFMJBxN74/8lfHDsHO8
 D2DFdm9A+Z2kkDEZ70GtiMLZTwWCAtuxVk17tamnfLVWOc8m2VWWKoAuzAo2nCugcYuNFU+AKon
 pBtzcABBw3wEdISqs8ATUhhL5h7tpk0JlomaylEbLjOP2DaFD3yLI7NLOwDNbvb0JSeW+wLaah8
 EiJobMVJ5tdpLNbMDqRE7p/w9UEbGFbaIlg3ht6bXsmn8I6oCLQnBAgXiJwYwLTRhub9p+xQ4JS
 uGWHNhQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Hi all,

This patch series adds initial support for the AV1 stateful
decoder codecs in iris decoder. Also it adds support for AV1
stateful decoder in V4l2. The objective of this work is to
extend the Iris decoder's capabilities to handle AV1 format
codec streams, including necessary format handling and buffer
management. I'm sharing this series as an RFC because conformance
testing and gstreamer testing are still in progress. While initial
functional tests show positive results, I would appreciate early
feedback on the design, implementation, and fixes before moving to
a formal submission. I plan to submit a formal patch series after
completing all the compliance checks. Meanwhile, any feedback or
suggestion to improve this work are very welcome and will be of
great help.

Gstreamer testing:
Gstreamer MR for enabling AV1 stateful decoder:
https://gitlab.freedesktop.org/dmadival/gstreamer/-/merge_requests/1

Thanks to Nicolas Dufresne for proving the MR 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9469

However, Gst testing with parsebin is not resolving to av1parser as
below:
Ex:  With the following command parsebin is unable to resolve to
av1parser.
GST_DEBUG=*:2,parsebin:6 gst-launch-1.0 --no-fault 
filesrc
location=/media/sd/fluster/fluster/resources/AV1-ARGON-PROFILE0-CORE-ANNEX-B/
argon_coveragetool_av1_base_and_extended_profiles_v2.1/profile0_core/streams/test10220.obu
! parsebin ! v4l2av1dec ! video/x-raw ! videoconvert dither=none !
video/x-raw,format=I420
! filesink location=gst_decoder_output.yuv

0:00:00.051674896   400 0xffff8c000b90 DEBUG
parsebin gstparsebin.c:2439:type_found:<parsebin0> typefind found caps
video/x-h263, variant=(string)itu

The same test with the av1parse command parses correctly:
GST_DEBUG=*:2,av1parse:6 gst-launch-1.0 --no-fault
filesrc
location=/media/sd/fluster/fluster/resources/AV1-ARGON-PROFILE0-CORE-ANNEX-B/
argon_coveragetool_av1_base_and_extended_profiles_v2.1/profile0_core/streams/test10220.obu
! av1parse ! v4l2av1dec ! video/x-raw ! videoconvert dither=none !
video/x-raw,format=I420
! filesink location=/tmp/gst_decoder_output.yuv

Got EOS from element "pipeline0".
Execution ended after 0:00:01.599088176
Setting pipeline to NULL ...
0:00:03.580831249  1075     0x3354f960 DEBUG
av1parse gstav1parse.c:435:gst_av1_parse_stop:<av1parse0> stop

Fluster testing:
As fluster.py is using parsebin for gstreamer, seeing the same issue as
described above for the following testsuites.
AV1-ARGON-PROFILE0-CORE-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B

Test suite: AV1-TEST-VECTORS 
The result of fluster test on SM8550:
134/242 testcases passed while testing AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0
unsupported content, bit depth: a000a (66 tests)
Iris hardware decoder supports only 8bit NV12
av1-1-b10-00-quantizer-*          

Unsupported resolution (36 tests).
Iris hardware decoder supports min resolution of 96x96
av1-1-b8-01-size-*

Unsupported colorformat (1 test)
av1-1-b8-24-monochrome

Crc mismatch: debug in progress (5tests)
av1-1-b8-03-sizeup                       
av1-1-b8-03-sizedown                     
av1-1-b8-16-intra_only-intrabc-extreme-dv
av1-1-b8-22-svc-L2T1                     
av1-1-b8-22-svc-L2T2  

Testsuite: CHROMIUM-8bit-AV1-TEST-VECTORS
12/13 testcases passed while testing CHROMIUM-8bit-AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0
Crc mismatch: debug in progress
av1-1-b8-03-sizeup.ivf  

Unsupported test suites:
Iris Hardware Decoder supports only
PROFILE0/V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN
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
        Driver version   : 6.16.0
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
[65391.311675] qcom-iris aa00000.video-codec: invalid plane
[65395.340586] qcom-iris aa00000.video-codec: invalid plane
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
Warnings: 0

V4l2-ctl Test verified for 2 streams as well.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
DEEPA GUTHYAPPA MADIVALARA (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Add internal buffer calculation for AV1 decoder
      media: iris: Define AV1-specific platform capabilities and properties

 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 109 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  15 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 156 ++++++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  17 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  25 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 255 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 105 +++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 16 files changed, 703 insertions(+), 28 deletions(-)
---
base-commit: 88a6b4187eacb700a678296afb0c610eb3781e2f
change-id: 20250821-rfc_split-c3ff834bb2c9
prerequisite-change-id: 20250704-iris-video-encoder-b193350b487a:v3
prerequisite-patch-id: 8a566690da276da34430c10dbc2fe64c1d623a9c
prerequisite-patch-id: 1430a33603b425d0b142aab98befcda771fb885e
prerequisite-patch-id: 32024cd49d2445ff396e31f40739b32597be59a4
prerequisite-patch-id: 65b569952650647174e8221dc7adde9b000a7ae3
prerequisite-patch-id: da128980fab8538bf668f19016c5121fb03759c2
prerequisite-patch-id: 079823dffbe8b89990797bf7f7640b754382d8ce
prerequisite-patch-id: 6ce10e03d7b3b96b2391e26cda703b650bde7cd0
prerequisite-patch-id: b5950670ac5068a0c5b26651ebd433f7d3bbe6ca
prerequisite-patch-id: 4de7a934f6bdfe28c84e461f70495925aa98365e
prerequisite-patch-id: 07682a6d2530b5796122bf8763f94b5bc92949ec
prerequisite-patch-id: 72b7eba20f1a222908d41323f28be3ba84106759
prerequisite-patch-id: fd9e2e1b157112c39c69486799493ee99e6033a7
prerequisite-patch-id: ae0ad8a04a04dd3434a092d4c2bb3f493417c6e1
prerequisite-patch-id: 52631eec348735d1dc5f5804b573e3cf942550a0
prerequisite-patch-id: 4109c59edb1b757162db46297914c8f7c14408dc
prerequisite-patch-id: fc0b713eb4822047e8172d11fd4cd5a097ef23a5
prerequisite-patch-id: 20ac8e7307f1f852b2a43268b2474178fbc0b94c
prerequisite-patch-id: e8419d716573beb64ad89968f0074d6bddfa86d3
prerequisite-patch-id: bdc72f5876ceb2e981d594c86a45cb21a6264af3
prerequisite-patch-id: fc5d26d01cab94d229a00eab819ae80196f3f5d5
prerequisite-patch-id: 32a9fe1371fffc9abd9a862b2814050a144d1968
prerequisite-patch-id: 25184583b5de886f78ee0444a4a59d5f3c271ce5
prerequisite-patch-id: df3376b9de27b23ae81a4c7b7a8fe4b429c32423
prerequisite-patch-id: e68fbf7c82567d2e9f3fdd0fdf2e2911329d5ccd
prerequisite-patch-id: 580fa40de01a81a8685e56420f562d299bfc60fa
prerequisite-patch-id: 89548da6690681854ee1de992a491bed73202b83

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


