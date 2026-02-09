Return-Path: <linux-arm-msm+bounces-92246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5676BYCtiWk/AwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:48:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF29410DBF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CCCB300DDDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4F63659F1;
	Mon,  9 Feb 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLuFZu8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h88g389O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57E43659E6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630369; cv=none; b=MKHvyp8erEOuU8mHYHnErtvAeGLNG9QATNRtqy4Mih2TeQbhF1rqFtFXq2UivxVHb+tiA8g4FbtdJ1xvRT1VzTCNE4xLSujHpRu1WOmdKBuAX44mPYbRuVcZVdIzWEU5Ll/NHyRwgSUUPHfwLqh8DB6ivH+TKJycwJQo7oaiz50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630369; c=relaxed/simple;
	bh=Il7kmUtjsL4aYM/cg4sZ59irY/Wv/yw6FGo13iVRcrQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BObgLuAeYtdW7lKmnOuvv7p1PpxVZdz9W8Vg8y0aXePiOwaU2m5bfrRUASFKXjln4MC5y8l86dm266Wr7YSLLbyX9sWcFc5om+ioMJstRVOnIzvwTmS1Xx11USgShwX63rt/+ly82ESd6u9xz9S5MDKpPxo6/ww/BP9AzNtYFVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLuFZu8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h88g389O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195O4S73349352
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dxzfFbC+Ysx8nkW1lHp9Dd
	LOrI+wYslQp6CqzeqsaqM=; b=eLuFZu8qW9ieyi19SXSbM2Sf4olphxZNDdhu5U
	EnSBwaOPrExYAfVLF0nmk74QjxdnzpHR2Noy7ATpzBnYfUaYOvqu7wYiWT0KzdMq
	aefK4nJEFQr6IPepVQW6V7Hps7d9AzZwNO4ubilqfub+pxdrMXItV03NWup2cTMz
	70D85PGFmCXf32KoyU3fQqMEXc/OCRP2cwJkGkD9B9PAYjg7GpvMV0tXBH6Uy9wa
	pN7lge/gFECsJUMHa3u3OSADUcWt1xzhIAr6v2KTOqrRAIFTtrov5apkuztZo86Z
	84RqqcprYtQI1GwE0g9/dreNG1L+Tt5mw8Mcy51z6wiKnvhQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy0vsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:46:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c52d37d346dso2667788a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770630366; x=1771235166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxzfFbC+Ysx8nkW1lHp9DdLOrI+wYslQp6CqzeqsaqM=;
        b=h88g389OrADW0aKXhYmOsqE2tCWbbNQbarfd0ki6qJxyGvCkT7dd09CiT/EqHYUF5i
         J2JLJqark5vHPao0iv1gj1IpwtOKblN+0g4o4xOT5fwVd3TXZgXqzzeZhWgB/Dvhhkz1
         GpvrENvNU2kMCH17+zqwqNXdeQIs/a3LXu67e9qtM0YHPFXHCpFurwc2c8eIB99TIPbb
         FzWGG6r85OAvzRjxR32vUc7Gjze7jDZmr7UGrCEdkk1ZgffuxBOWJEa1tjCAkMSe4cNY
         lUegtJiqHLaI5dwZ0fAOyHCv205vy598AIKsvRA4WDeEOeFAWhPiPjFCnKGEl2Gjt06C
         DllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630366; x=1771235166;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxzfFbC+Ysx8nkW1lHp9DdLOrI+wYslQp6CqzeqsaqM=;
        b=XK627R+wUJfR2qFPhSSdIncU9LQCZw289o6e4v3AzDtuqQXf3CyKakgEQT7I6M3OJ5
         v9NzYXyfPLDxyqfCghisESl0CEJ1tBwTD3qOQUs9dDmFJTOu0q/ab+1MIUEyPAmdLqKT
         uYvc+rcxrtKhSfLmLhJIn/+p7j9PEMuERXZQwZ1BH5WqGTdiSWE8UHWFHYQaNgiH3v6E
         8Cx8mnbD6t7iPi6UUXW+ZiVcWD4vjAlNpCQxU5/sCK+8r2SECuofIe4cgXhyYN82QUQU
         yqe76G3yItUF5tR9P5VH8v4r91Dd040Eve3APScSQRracwS4dkaVaPjN+t71AKzEaPSl
         Pdag==
X-Forwarded-Encrypted: i=1; AJvYcCWqXFm4Xg73xOOYqClqeUVTNgeT/DKQUMvlaIp+NuRwjjMsmf0VcE2NDVPHajKAcumIVDcNJQEOUtpM8TWO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kixTkSKFXbNYRIunVHwjA35jR4QMMe9/jLeEAGklh6itlGEG
	J/SvmyfiCu5Azm/aLS2Dsw+1miTnaHf+cSzIC+6+f6kXU83KGPcVt8Q9aZ9u5vPVRo2DipNqVwG
	w/Rarpxzz1Jqo83fdUtg2r9TOVT/jQU1sG+UnWb3dqnGGeTkFjM0W8D4RIuFALQWAUKpA
X-Gm-Gg: AZuq6aJYxIkRZGoiHMgZl4UJ0DaNQT5/oOAqIGRe5eEyqyP3+uJoVZAFprziZ3pont3
	gBtqigBZs8vhDH73IYY7sxXcv3tUYqGKz9FQr8sAoIHhNGtQb7QihqnVe40rFnLVV/ovJrNd56m
	yxO/oyPoqMV6D+kWcdm12hgLloR5pWDTOfeRKWVV0qkndVOYWAZthPTLw01zJ2CQJbcAKn0yil9
	sW/FcSp6Fc3z9t0WnvVj5D0xtpDqiklS0G+FqSEKsR/AM7McEJ+uQAuWfTLaplEph+EfIpsVmh0
	hyCfEb0apzErb2lsHJtvpiD1W1U3d+fn1ap0HEqPFlbrcZgaVWiScvIrwtHY0bX61lCXkNYreao
	jVdvG0aK1n12hAm3n4IB9urY96fk7vCsLOwwFmTc5pAa61QE=
X-Received: by 2002:a05:6a21:62cc:b0:35e:11ff:45c1 with SMTP id adf61e73a8af0-393acfe82bemr10220483637.18.1770630366245;
        Mon, 09 Feb 2026 01:46:06 -0800 (PST)
X-Received: by 2002:a05:6a21:62cc:b0:35e:11ff:45c1 with SMTP id adf61e73a8af0-393acfe82bemr10220457637.18.1770630365665;
        Mon, 09 Feb 2026 01:46:05 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a95eedbceesm76884925ad.84.2026.02.09.01.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:46:05 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: iris: Add Gen2 HFI support for SC7280
Date: Mon, 09 Feb 2026 15:15:24 +0530
Message-Id: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALSsiWkC/x3MQQqEMAxA0atI1hZqrDp6FRmKU6OTTS2JDoJ4d
 8ss3+L/C5SESWEoLhD6sfIWM6qygPCd4kqG52xAi61F2xsWVq+hw5f1K0X0eqS0yW7Cp3aubWh
 21EHOk9DC5389vu/7AVul1HJqAAAA
X-Change-ID: 20260209-iris_sc7280_gen2_support-cb34465ed4e7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770630362; l=14365;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=Il7kmUtjsL4aYM/cg4sZ59irY/Wv/yw6FGo13iVRcrQ=;
 b=4oFHHPwzpndMBfZw/zh+wRLqBuBoxCygxCNrgoKXKGyRSxPS6nseuLAD1D1UGiyE/fPLr7RtH
 DWRw6ZIiepDBJTfO1TM+ijtevVwliRO8SrXPFojQ+5M/Aj2hgILQWFS
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: ecNMjuGXtB3q9gbiwYqZIwlnC8mnUZeC
X-Proofpoint-GUID: ecNMjuGXtB3q9gbiwYqZIwlnC8mnUZeC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MSBTYWx0ZWRfX5gleZ4vD7/QE
 RH813ez9Ncgs9/2yBoiG0ehEhXYOLK2lKIaGvNLgKDvimxEPMn91ipeq07RJ9ZN1LfNP2HEL6Ab
 FXF9KhG9l7Ulx7ujAtfpPG8+XbTCW1hFXy9jCxcDR9Ku36ik/XqmvvlH7W4CEuI/cX0PhcFD6Jo
 4odwAtKzsWSDLKX8jY0HFPI0Eu6mhN4DciEyF1R21zXxoECLRLqaDj5tmDmXPPPaLTQek5xV4eO
 +aOiB8UZRtThPyWXgys44PoJi/fImxtNUrrmCTW24vMnAdSRAb91tfpecsOiSqYKMD2Pv0N/juf
 F8v3QKkpb+3u0dRXhn7pDHgM4tbBZqddvXSUhbndGVEYia0f2sGmhWHB6Iw10/koADLWHBKu7uN
 tYKXt551+Zfb4/tjyMI3Q61x6tktIuX8ItjCzihvEjb7VLxAcxXwU7vKTPiP03/Z1e70bc/x+pd
 934dFUo1ciX+dBCjidg==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=6989acdf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=AIeG6PnHT1GlUH4tLZsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92246-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF29410DBF3
X-Rspamd-Action: no action

This series adds support for running the Iris driver on SC7280 with Gen2 
HFI-based firmware. SC7280 can operate with either Gen1 or Gen2 HFI, but 
the driver has so far only enabled Gen1 by default.

Some platforms may choose to deploy the newer Gen2 firmware. To enable 
this, boards can now advertise a Gen2 firmware image through Device 
Tree using the 'firmware-name' property. When such a firmware is 
declared and available at runtime, the driver updates its platform 
data to use the Gen2 HFI configuration. Boards that do not specify a 
Gen2 firmware, or where the firmware is not present, will continue to 
use Gen1 with no change in behavior.

The series has been validated with both Gen1 and Gen2 firmware paths.
Gen2 firmware is yet to be posted to linux-firmware.

v4l2-compliance results on SC7280 with Gen2 firmware:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

compliance test for iris_driver device /dev/video1:
Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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

Test input 0:
Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster results on SC7280 with Gen2 Firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
	- BA3_SVA_C
- Interlaced content is not supported yet.
	- CABREF3_Sand_D
	- CAFI1_SVA_C
	- CAMA1_Sony_C
	- CAMA1_TOSHIBA_B
	- CAMA3_Sand_E
	- CAMACI3_Sony_C
	- CAMANL1_TOSHIBA_B
	- CAMANL2_TOSHIBA_B
	- CAMANL3_Sand_E
	- CAMASL3_Sony_B
	- CAMP_MOT_MBAFF_L30
	- CAMP_MOT_MBAFF_L31
	- CANLMA2_Sony_C
	- CANLMA3_Sony_C
	- CAPA1_TOSHIBA_B
	- CAPAMA3_Sand_F
	- CVCANLMA2_Sony_C
	- CVFI1_SVA_C 
	- CVFI1_Sony_D
	- CVFI2_SVA_C
	- CVFI2_Sony_H 
	- CVMA1_Sony_D
	- CVMA1_TOSHIBA_B
	- CVMANL1_TOSHIBA_B
	- CVMANL2_TOSHIBA_B
	- CVMAPAQP3_Sony_E
	- CVMAQP2_Sony_G
	- CVMAQP3_Sony_D
	- CVMP_MOT_FLD_L30_B
	- CVMP_MOT_FRM_L31
	- CVNLFI1_Sony_C
	- CVNLFI2_Sony_H
	- CVPA1_TOSHIBA_B
	- FI1_Sony_E
	- MR6_BT_B 
	- MR7_BT_B
	- MR8_BT_B 
	- MR9_BT_B
	- Sharp_MP_Field_1_B
	- Sharp_MP_Field_2_B
	- Sharp_MP_Field_3_B
	- Sharp_MP_PAFF_1r2
	- Sharp_MP_PAFF_2r
	- cabac_mot_fld0_full
	- cabac_mot_mbaff0_full
	- cabac_mot_picaff0_full
	- cama1_vtc_c
	- cama2_vtc_b
	- cama3_vtc_b
	- cavlc_mot_fld0_full_B
	- cavlc_mot_mbaff0_full_B
	- cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
	- FM1_BT_B
	- FM1_FT_E
	- FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
	- SP1_BT_A
	- sp2_bt_b
	
./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
The failing test case:
- 10bit content not supported yet
	- DBLK_A_MAIN10_VIXS_4
	- INITQP_B_Main10_Sony_1
	- TSUNEQBD_A_MAIN10_Technicolor_2
	-  WPP_A_ericsson_MAIN10_2
	-  WPP_B_ericsson_MAIN10_2
	- WPP_C_ericsson_MAIN10_2
	- WPP_D_ericsson_MAIN10_2
	- WPP_E_ericsson_MAIN10_2
	- WPP_F_ericsson_MAIN10_2 
	- WP_A_MAIN10_Toshiba_3
	- WP_MAIN10_B_Toshiba_3
- Unsupported resolution
	- PICSIZE_A_Bossen_1 - resolution is higher than max supported
	- PICSIZE_B_Bossen_1 - resolution is higher than max supported
	- WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
	- RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
	- VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 235/305
The failing test case:
- Unsupported resolution
	- vp90-2-02-size-08x08.webm
	- vp90-2-02-size-08x10.webm
	- vp90-2-02-size-08x16.webm
	- vp90-2-02-size-08x18.webm
	- vp90-2-02-size-08x32.webm
	- vp90-2-02-size-08x34.webm
	- vp90-2-02-size-08x64.webm
	- vp90-2-02-size-08x66.webm
	- vp90-2-02-size-10x08.webm
	- vp90-2-02-size-10x10.webm
	- vp90-2-02-size-10x16.webm
	- vp90-2-02-size-10x18.webm
	- vp90-2-02-size-10x32.webm
	- vp90-2-02-size-10x34.webm
	- vp90-2-02-size-10x64.webm
	- vp90-2-02-size-10x66.webm
	- vp90-2-02-size-16x08.webm
	- vp90-2-02-size-16x10.webm
	- vp90-2-02-size-16x16.webm
	- vp90-2-02-size-16x18.webm
	- vp90-2-02-size-16x32.webm
	- vp90-2-02-size-16x34.webm
	- vp90-2-02-size-16x64.webm
	- vp90-2-02-size-16x66.webm
	- vp90-2-02-size-18x08.webm
	- vp90-2-02-size-18x10.webm
	- vp90-2-02-size-18x16.webm
	- vp90-2-02-size-18x18.webm
	- vp90-2-02-size-18x32.webm
	- vp90-2-02-size-18x34.webm
	- vp90-2-02-size-18x64.webm
	- vp90-2-02-size-18x66.webm
	- vp90-2-02-size-32x08.webm
	- vp90-2-02-size-32x10.webm
	- vp90-2-02-size-32x16.webm
	- vp90-2-02-size-32x18.webm
	- vp90-2-02-size-32x32.webm
	- vp90-2-02-size-32x34.webm
	- vp90-2-02-size-32x64.webm
	- vp90-2-02-size-32x66.webm
	- vp90-2-02-size-34x08.webm
	- vp90-2-02-size-34x10.webm
	- vp90-2-02-size-34x16.webm
	- vp90-2-02-size-34x18.webm
	- vp90-2-02-size-34x32.webm
	- vp90-2-02-size-34x34.webm
	- vp90-2-02-size-34x64.webm
	- vp90-2-02-size-34x66.webm
	- vp90-2-02-size-64x08.webm	
	- vp90-2-02-size-64x10.webm
	- vp90-2-02-size-64x16.webm
	- vp90-2-02-size-64x18.webm
	- vp90-2-02-size-64x32.webm
	- vp90-2-02-size-64x34.webm	
	- vp90-2-02-size-64x64.webm
	- vp90-2-02-size-64x66.webm
	- vp90-2-02-size-66x08.webm
	- vp90-2-02-size-66x10.webm
	- vp90-2-02-size-66x16.webm
	- vp90-2-02-size-66x18.webm
	- vp90-2-02-size-66x32.webm
	- vp90-2-02-size-66x34.webm
	- vp90-2-02-size-66x64.webm
	- vp90-2-02-size-66x66.webm
- Unsupported format
	- vp91-2-04-yuv422.webm
	- vp91-2-04-yuv444.webm
- CRC mismatch
	- vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
	- vp90-2-21-resize_inter_320x180_5_1-2.webm
	- vp90-2-21-resize_inter_320x180_7_1-2.webm
- Unsupported stream
	- vp90-2-16-intra-only.webm

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (2):
      media: iris: Initialize HFI ops after firmware load in core init
      media: iris: Enable Gen2 HFI on SC7280

 drivers/media/platform/qcom/iris/iris_core.c       | 32 +++++++++
 drivers/media/platform/qcom/iris/iris_core.h       |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  6 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 --
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
 10 files changed, 144 insertions(+), 7 deletions(-)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260209-iris_sc7280_gen2_support-cb34465ed4e7

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


