Return-Path: <linux-arm-msm+bounces-106242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPa6K8gr/GnVMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:06:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A14E347C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48D593008D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087EE330B32;
	Thu,  7 May 2026 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjl5NjLg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuCKTLa0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40646330B29
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133956; cv=none; b=k0W3UbT35edIjVEeayRiCVnAbawDCob8OuHuMDANhF+xQ/BvqodO3fqIX55wiOg85DYjpjzqvsHq2KRO5v6h1b1/JXOyh9WLZw1Q1VwgbHXoiXeuMgWUpeKmEqQa+ibbzwBxUBOp61sYaKt3mbjG0yBaWDnJ2Qd56M88bjp5xuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133956; c=relaxed/simple;
	bh=z07aZWP5v7pw4cL1qfyjmbTiK/Ngd54k1CLW57MUXxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CGGg37wKohyJcWEo7O7WoaCsc6TcKlroAAZypcyIGnptSeOnaCopdGV1vKqmZrhVuESWmtv7OHY5L4EgJQXyEunjlC41IZhdUU8zhq0xZCibZ1kLfxdDqGI8hUEjCZ9VVlUpbNTz63/wQMV6yzk7xZZBZic+oHoz14Lo8q7BDOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjl5NjLg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuCKTLa0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473ebmH026592
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bBSTSWwns6eNaKGzAUzAV5
	rGTcr8rrYTs+FDffFlqjE=; b=jjl5NjLgSPCH8SO2L8jILST7rbfQ9aJS2z9WVG
	sl3r2r4lxjOfIG2jG6GQTQls8UTUSTpMbCaQPOhAwzReBqIZo6edUQ15C8Xz/Sw0
	Eldo3ibdVUpnMANJF0czQsV5Uo0zVqlZWhQKRckRMTOYTtcfWvNmmJRTCKC+cWvX
	R5n4MutU50fl20abHNHdxhYK05Xb/VyOhncrRGgW7zEC8iiI2dN/JTxkzYRg9Cpt
	raS+OmwMQT0Ut0PtpxeDE3/GLIt4hXwYSFPQTvXh+s9FT6J1epJbyr+uC9wl878g
	KqMYi19kp6BeeTam3X4y5vp54F2pBO7I2NMZu7ZMiIqKEyEg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0dm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:05:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8353b042152so448246b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778133953; x=1778738753; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBSTSWwns6eNaKGzAUzAV5rGTcr8rrYTs+FDffFlqjE=;
        b=fuCKTLa0piRyr9iXHJMDsLhVIMPYslkwSca8vXg35YTciuudHOvTzZ6eZutFvZwdCL
         nqFKV9P0UZRB2ELsZ0zKDtTQTnMQWpnAlfBznUEMAa82yJ+zI11h+2AJIz8LAWCF6tJ1
         pE0Iuswr71fuiOtDjVEATzS4c0zz0guTg8SKKL8rKZdd5Sy9Oes2OCG1nAc5im3XTdt+
         XOMS3zoi8nx3KWo0ljgDHIojmY94Txd9z3oBQIC3PHCtfiQBnyUQUHXwQIW/EL7Jz3/G
         DdnEPiPaGYf1ZRp3E9VvG1HgCcR4lMpuTtAVIZozzvUaQIxadf5cS+UC5sUpec4RmxjO
         ZRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133953; x=1778738753;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBSTSWwns6eNaKGzAUzAV5rGTcr8rrYTs+FDffFlqjE=;
        b=ZnujkDIGsEe/ODEGQd8AxPYAxVnRgA7P9FuTEykJwkxqQApUZES1xg95bRiS5SpuRm
         czMakVkXgkCEhW4B+oLmZ4uLTo8ARF9ynfMHE3RoRNfBLYlUN75+aSpTN62ANB1uwhqK
         YmyreNYTzn0uxO47B8DpWwoGmcIBaTw+C9U48iV04zSvMJfcNprVs4/TwoP16LQ+eZu8
         eECMRLvE68MTETeBEBvFXFOIALGxIV2JIaheBEI6D9OoeGG0Vc428ij04MJJxh1fVq0x
         l79oEPu/KN+Zh3SMXjPVFEeZ3QKCXxR3XZr1EgP2QGXkcbKi1pnHGKL7fVsT+LSBawqh
         ZdTA==
X-Forwarded-Encrypted: i=1; AFNElJ/WFyNA8U39Si2DKd0uEHkYM//djDpc8+OH1qQuMPjmv4yG4MgGvw3cUbydRETPfUwG4m+7XVPFeGEyuUWl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywen0gn9gV34ew23offa4ZJqwjqq2ZeGLGFIXV+6xDNAzq1L+dK
	JlyFaV06Ae4kNxNfrdtYpHHAYJVvCXIBbc6/57mV8UmM4LHaNeYvKsqgR3gg25xSjQ/fuMxpDWw
	VqQbvsKM/5eRRaZDCdDMSi5XOCCHNuw+7JNz+n1Qgx1ZsasUMMJUG9IZCe3okP3xlCuJn
X-Gm-Gg: AeBDieuLyTQMrAHxpcuNejLZWfqpQVdXKzLSKg5WRQsxZ2GsV2LH20N4t6iA0XCTKHd
	pEwYRJ8hk0bftfirJHNPTxVhJXvh7NZ6h7SxH28+NSQOn2cXntlTabHjohDte155Dq61mogHRqL
	EbuLbhE0zeB+LYBN2yOa2ZA5dfNSq3+MgQc02BEqbO7wlSn4ZNA3Ez/UatqnkopydYYFWxTHq7v
	Oja1MVDIzfWv9WShSsBiOyC9QvjI2U7B4eM5StAqJEA9A2dN5/YukBvrmzqHi4wlFbIjSEtq6ky
	YZUyRTCM/b8WlboQg5j22J2px4+cDXSBFjeMqvTKmlqiIwYvYog6IzEFZNwtNlylW36LVtwHhjd
	bY7KSswJ16BCdgzHVhLfv6ahmiryGHlQqvsCgIJeGy6WFwn+kbD9eM2KvjjIUmrCYO37cVjr1iE
	pA68NPbmsKOpyByVT2Ob0MF+M0BKAm8XI=
X-Received: by 2002:a05:6a00:2181:b0:82f:6e9:d1ba with SMTP id d2e1a72fcca58-83a5df49678mr6373804b3a.37.1778133952944;
        Wed, 06 May 2026 23:05:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:2181:b0:82f:6e9:d1ba with SMTP id d2e1a72fcca58-83a5df49678mr6373773b3a.37.1778133952348;
        Wed, 06 May 2026 23:05:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm7566187b3a.60.2026.05.06.23.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:05:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v6 0/5] media: iris: add support for purwa platform
Date: Thu, 07 May 2026 14:05:43 +0800
Message-Id: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALcr/GkC/33QS27CMBCA4asgr2s0fo6dVe9RVWjwo1gqCcSQt
 kLcvSYsYNF0M9JY8qffvrCaxpIq61YXNqap1DL0bbEvKxZ21H8kXmLbmQRpQYLnqaftZ9qUsdT
 N0G8O5/GLOAGAkUjgXWTt6mFMuXzP7Nv7fR/T8dz00/2QbakmHob9vpy6FSoTZdYuUCTy5DBhQ
 AvCWnToYkIIiCIY9lzVreYmpQS/R0wlpiEEHmjfZvQIECGjx9hNmt0ydqWehvFnfuwk5o7/3zU
 JDtwoDFpAtqDz61Dr+nimz1v6uo3ZneTDUmAXLNksNJkcEJBPasFST5ZY6lLN2maXVWrfFXxYs
 PTD0iAWLN2sQOi0MZIauGCZJ0sudZlmaeUyeRtJaveHdb1efwH3LTYhdgIAAA==
X-Change-ID: 20260209-enable_iris_on_purwa-a000527a098d
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778133946; l=12055;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=z07aZWP5v7pw4cL1qfyjmbTiK/Ngd54k1CLW57MUXxk=;
 b=9QmAiaQecwTPISdjsDr1CCzKfskC3n3pNL6CxbA4Pl1r0FkYaZb0CXk+oS/tYmizTgBnwsewq
 rf/+T8tTl+qDChbkGfldh6DnrSu//gyAu+HhYk5T1d+RQzc8QVNOa0D
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc2bc2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L1beyZqFCqeP6CzygzoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: LfEXizoQ_4eLQ25N9amOiiWU2WuPxZ7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1NyBTYWx0ZWRfX8m8mAU7cWYXy
 pEijomZKw68n0uvLQw5VenB/J7XWWsNC4aThVxfQ4rdDCDhPYgtD672xdrm+bzQ4HROgg8ocO0v
 AWTv2+MsHkn6V2nX5oZl/O3a9uVfYbzWHXTKKLZkZrJlQli8twjcO0xEchsR57DzO6Pejz+jftT
 W734PCTb7qTdeyEil7/Y0lwfPT6jZ9t/f6FIV3+luw/gG+bvgSS36gu2v7/JOl0lupXTV2Or8Pf
 3uUOdJ4IoGTg6ZbG2daXownCcIB/7xV8+mhDXvwfMZpdFkDUIgdWmDBLSsos0bChVUEtGE22o1V
 LouLN8/8r/VOJPMsJM+KW+IHDJliEvoOsEX99OgqaGNxFXqKXyrfci5EpyNSpMdlqbER/+MjusL
 4v/PKw4HuGZDXpKZRf1P91K30+emZqq0kL6KK5glMRzLqwfs6fD+a9n/oaMSvMhS0xT9ro+xwBu
 B2I/V7Cje/+5gynCVQw==
X-Proofpoint-GUID: LfEXizoQ_4eLQ25N9amOiiWU2WuPxZ7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070057
X-Rspamd-Queue-Id: 4F7A14E347C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106242-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,localhost:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series enables the Iris video codec on purwa, allowing purwa to
use hardware‑accelerated video encoding and decoding.

The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
except that it requires one additional clock and uses a different OPP
table.

Therefore, purwa can reuse the Iris node from hamoa, but the clocks
and OPP table need to be redefined.

All patches have been tested with v4l2-compliance and v4l2-ctl on
purwa. And it does not affect existing targets.

Dependencies:
https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/

The result of v4l2-compliance on purwa:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

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
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
root@localhost:/lib/video_test# ./v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

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

fluster result:
H.264:
Ran 77/135 tests successfully

H.265:
Ran 131/147 tests successfully

VP9:
Ran 235/305 tests successfully

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v6:
- Correct the firmware being used.(Dikshita)
- Add comments to platform data.(Dikshita)
- Link to v5: https://lore.kernel.org/r/20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com

Changes in v5:
- Modify the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com

Changes in v4:
- Correct the dt-binding description.(Krzysztof)
- Fix incorrect required-opps.(Dmitry)
- Reuse the vpu3 power off hardware api.
- Link to v3: https://lore.kernel.org/r/20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com

Changes in v3:
- Correct the dt-binding description.(Krzysztof)
- Fix warnings reported in the patch.(Krzysztof)
- Add separate power on/off hooks for Purwa.(Dmitry)
- Link to v2: https://lore.kernel.org/r/20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com

Changes in v2:
- Improve the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Dmitry)
- Add the required members to the platform data for Purwa.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
      media: iris: Add hardware power on/off ops for X1P42100
      media: iris: Add platform data for X1P42100
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      arm64: dts: qcom: purwa-iot-som: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           |  23 ++++-
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |   4 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  50 ++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 103 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    |  22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   7 ++
 8 files changed, 213 insertions(+), 1 deletion(-)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v4
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: 66096b909debe4d942eee972948d5a138a5be427
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


