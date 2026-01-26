Return-Path: <linux-arm-msm+bounces-90550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QABNNoJdd2n8eQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:26:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F1A882B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A42D03014748
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCA43358CA;
	Mon, 26 Jan 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa6jQ4+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eogqC1i3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A53358A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430391; cv=none; b=mhPoxN94iy+EM5hja+hZ3SwawKGp2cPuhqn41hzSzR6N1VAdavY8Lq03Thfn9cNSX8dP1k4CbbrKp0k7+E2dCUq6xgdGOEk7MY51tFjAO4yFR5/8zgfG4LSvMMZ+2NyCgxubmGCk9UxMC3xftRhmX7lsjdhKXbqExXhODrFSMGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430391; c=relaxed/simple;
	bh=sXgpZAB7fBr74J4nr5ln8ouz3i95Ff2hs0Y+dXHx2qo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k0mJD2qKVy31G1J3M+nRH/yAly5AbLbesw5wywMmS5JNUOZMqr/q86+b194hFcKGiqrgI6wZ0Ia+atooSObz76kHwC9JKeZEl3MI0Mp7KuT+SYlznEdZOBa19q6GifjQ0gIStX6k5nLvFx+uFn0ORCHvo6QJapi//HL2I6dLraU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa6jQ4+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eogqC1i3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8fG6I795892
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UJ/cBH7DIpycsyrwwFYgg4
	UAaSrAaQym3P8qPeNnyE8=; b=fa6jQ4+5Hqdq6SC0WZsSGVySMKBR8/1tfT4H6L
	SZvDHnl0EMZFwbXxhulfAlwmGxt/LJC/kmpKwM4tQkMGB2aymiTegie5WpmvNuxD
	My22Gp2hdeew1RR3HehqYYqTyAnsLkTpdCjOAPt221+n5yg9znNE01b/dKjgfW9L
	cEC4q3mUCJviVif8sB0j0Ra5jl5kGxDlz2b2CEfkb4SlxSpg31eJuBEsvFr+FJwP
	JKJQ6QwWxV4mGg2sTIOd2B3NUfeffOQ+FfUjvJNT7dQjxyjNp0fJ/Ckx4C1ZcxYp
	aFhd2yuIUoTEwaZzYEnV116/PTHQ1nQt2149DCsVBSJ8lDew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f4f3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:26:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5539b9adbcso354290a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769430389; x=1770035189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJ/cBH7DIpycsyrwwFYgg4UAaSrAaQym3P8qPeNnyE8=;
        b=eogqC1i3tkg3S8LLpHRhz+4PoseMVV8RaeOfQI0wTe9MCDts3vhQ7j7Yzys0zdWvrw
         qObYFiAqBbQVxN2wLMUrBypUrNszkSpFWa+xq+U/wnoaC5/KyYHCIUoI/qkFMzYsLwiJ
         3FSM9Y0WCF6WPvh7lMaLn8anDDn/FWcXKz9m0I3wraXnJJKSYWmduMYMDhuM8yFEe3hy
         wGhkH14T3iuedInLuZ/5gelbRVicNv+HSLecCX947wlSilbfjhhw93QJNlnf7u6HvKYo
         IsD32TXdKWBgaKLIKmaR0LwqdFEqQIiEq2y7yLWuYh2ZAg7aumA4l7AZQtSCmHFpORdd
         MWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430389; x=1770035189;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ/cBH7DIpycsyrwwFYgg4UAaSrAaQym3P8qPeNnyE8=;
        b=MKpT3S/QoPOi/TdO79sCtUmsTL0jHE82YK9Yyl/vLIMGAEEDn7Wc8vrZvVBMN9Qtwl
         64Fo4SrR+1n4/BtN94/C33F99VcecZR1S02+EZxvWrfeznFzhOapmNUZlrZ2qOTPWEBl
         YgtMD+BR8MJKSRgkcS/4u0tvoA454tsz48d0O3pIysDJnx6rdPq3xFUAr7wcsYfk8bsE
         bidFMKt97GhIOdHo1k0pBa8M1v63L1jsyM6LsI7oOZB9ckPzxbQGZvF+uK1w+Y3jvLl0
         aMCxtfH45wUl89+h1ycvL3XwkuxW+7yRscTuV6lks1PxvWP1CJsb3HyuSdd7kRutZSQz
         jjrw==
X-Gm-Message-State: AOJu0YwJO4P7R2aUdlCCodDqN4IHchaTAVbA8UVxBJiNtbsBkWSynent
	6Mio4MWqx5iZx1i1ZsY/wcPC50Z5O57QzhN4w6MDbWn9YdCZ6JBEnP0gGQ3FJkKvDfMJ0agzvIA
	0S2uoRQU5Z7Uqg59hRtUXHCYWEYLv8cTmniD0PT4SrS46cnmeuSaWImO6kqmze9NlS6Is
X-Gm-Gg: AZuq6aIU47lTNAUGi9bKy+qA9dhrV2NIHZPTLPQuy1wS09qE7TGC+ByKOAzc+mYouN9
	+kMnbOhO+2dI74G6iIjJsbmkSUudLaHTUm7NwAYTwB/lUH8mabFkTKIvMsi8NW0fEp4JcHygqUa
	lpTi/54e4fUCgABcOid5cryiurPM13EfVjU2SPXi/8JawJiL7nLicHWOT3qJGc2uH3mo1iuLAQB
	BbG2gWdc4dTWr93Y4hN1x8TIMxQl0QVhXZwJzBPx1NJ4AaxyBCwwnKQ2snITvffkzA/z6hHzvWV
	E2QyKr/gsxWOJ8GFxMxicqnVm5vmF77dvm+AfEu5xC+lxXMYCUZLcWQ9H6PtnazN6nLMQxoJ0p6
	GHISm5bWx1nH96OowD/ec5xOpifpZFncBskZD1tBD1t/a
X-Received: by 2002:a05:6a21:3988:b0:38d:657f:7d87 with SMTP id adf61e73a8af0-38e9f0f4a4bmr3890945637.13.1769430388503;
        Mon, 26 Jan 2026 04:26:28 -0800 (PST)
X-Received: by 2002:a05:6a21:3988:b0:38d:657f:7d87 with SMTP id adf61e73a8af0-38e9f0f4a4bmr3890921637.13.1769430387992;
        Mon, 26 Jan 2026 04:26:27 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6366644379sm6076022a12.33.2026.01.26.04.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:26:27 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH 0/7] media: iris: add support for kaanapali platform
Date: Mon, 26 Jan 2026 17:55:43 +0530
Message-Id: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEddd2kC/y2NQY7CMAxFr1JlPakStylthUZzD8TCTZwZA20hL
 giEuDsBZmPpPcnv35VQYhLVF3eV6MLC85TBfhXK/+H0S5pDZgUGGmOh0XvECY94YM2JRUMXg21
 rgki1yk/HRJGv7+Bm++FEp3PuLh+pRhLBd7cv1v9Za5yrjSm7atW6Rlt94R3e8tAUyh0vC/7MI
 uXpjAc/j2OZz/drbEAh/TK89IXHCg3EgHXAlsBbPzQDErmwgsoBddlFJFTbx+MJLtyH8fcAAAA
 =
X-Change-ID: 20260126-kaanapali-iris-29fd184e2fe4
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430381; l=14125;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=sXgpZAB7fBr74J4nr5ln8ouz3i95Ff2hs0Y+dXHx2qo=;
 b=UdAc47Zn8Gbk7z/QwjTbyRbxGhOwdvde9DFwYraBREbaRZNWPdR8b/XMJkLLxtJzxMjSMCQ35
 C6VeU+fRJMTBUxvL4yOD/P1duxVI1hIoask7ZvdjA0TCN4SS//QeOmE
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69775d75 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=toAFPFK_xAPQ-ejxx0AA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 2hHOkYJaWpWLPmoFuDHZZgKLnE8rqobt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX7z2aJly3gUOc
 uqbBryS6MhU9ufS9yo74YFJsoREJSFjwxvPuD6uskPcV9A0M3L3liPET4dd7+s0u9FMEJ0iCUNy
 IdYMs/x/E6XV7FoZi8NgG0d43hTchr1nzV3ytQKa7Z5TktX46RpV5qZWCgK+6uCMMd+OHh3kLYm
 owFSi7mZRF5+G1Byfq+gjfbo4cHj8Nww7sa7jdy+8nVZpAtZimodTZiLH4iX07nn8cag+r+5dty
 813bmwsO001hvWgJIrCeCU+NZP3YlrSjoDDLZnkeAk52KXL/15TixriUoIIu51yXCqloIcEvcqY
 FVlr/7Qq5/RnGCosVp2ZSt93SmEuvGKH+1YO7Ombr9Z5iuP/BI2MtChonuRBFqQzrTkfgAQkZzX
 /0Sn7qgCk/YBZDiO8fan7ruzr3jKpDDO0zA6DFXZr7SjeC4rSTLD/KetFaAOH215rqbYn/bB41u
 3xf47NJS9llqR4PNuXA==
X-Proofpoint-ORIG-GUID: 2hHOkYJaWpWLPmoFuDHZZgKLnE8rqobt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90550-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40F1A882B8
X-Rspamd-Action: no action

Qualcomm kaanapali platform have a newer generation of video IP iris4. 
The hardware have evolved mostly with respect to higher number of power 
domains as well as multiple clock sources.

The series extends support for multiple iommu-map entries for the same 
input id. Considering iris as a client driver, it adds the handling for 
multiple stream ids from VPU via iommu-map.

This series is depend on the below series:
Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

Following are the compliance and functional validation reports.

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:2000000.video-codec
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
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:2000000.video-codec
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

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Charan Teja Kalla (2):
      of: factor out of_map_id() code
      of/iommu: add multi-map support

Vikash Garodia (5):
      media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding
      media: iris: Switch to hardware mode after firmware boot
      media: iris: add context bank devices using iommu-map
      media: iris: add helper to select context bank device
      media: iris: Add platform data for kaanapali

 .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
 drivers/iommu/of_iommu.c                           |  36 +++-
 drivers/media/platform/qcom/iris/iris_buffer.c     |   7 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_core.c       |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  16 +-
 .../platform/qcom/iris/iris_platform_common.h      |  30 +++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  90 ++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   |  80 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  59 +++++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  93 ++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  24 ++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  16 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 drivers/of/base.c                                  |  69 ++++--
 include/linux/of.h                                 |   6 +
 21 files changed, 726 insertions(+), 64 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-kaanapali-iris-29fd184e2fe4
prerequisite-message-id: <20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com>
prerequisite-patch-id: 1d896ff4a958ebd06066dbf705c4c45cf73b6041
prerequisite-patch-id: 44414df7d8342ca19c0518ac087f08f98546c3ff
prerequisite-patch-id: 0f45ca6f67948e03a89274c144660a55b3ff8fb1

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


