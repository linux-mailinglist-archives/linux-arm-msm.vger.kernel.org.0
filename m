Return-Path: <linux-arm-msm+bounces-107212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDMfL0yTA2pz7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:53:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A89C529A19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78C7F3054B92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9413C5552;
	Tue, 12 May 2026 20:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chpvL1Wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjlH544V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66D3C4563
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619208; cv=none; b=PYY5sriFFmgnEJ3r6p46smjrhf2FShdr/8uKWd4eYR+9oSSDwDKCv9SCy4stqL+31o0TLY5AqiimUw0g6oXLWAeoFIdSXNyaOXhInuiueHkrqK8XaouNheHW/hSJQKmFi8HyO0Tk3tT3BOhARb8xvJroifnenpH0oDrLLBHDfKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619208; c=relaxed/simple;
	bh=8x5dChKVCVCMOobD3xTgj2pX4wLUI672qR53c65MycA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2jd6G+14XZHjW0vDRbtGdIY1eJ3b7fVwB84O+tGDKMCHWksGgwnkSiRByrADTm4ojsLFjsqF7DQt3C3Jhn1t4nc/xuiq5kG1Oox5QqNBcIiXM3AJKxaSaFUwmFz2MYx7WkLQK+B8IFRstdK4QiZwP6feeazoWKh009g/FlyuBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chpvL1Wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjlH544V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CK1wg51410237
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TfT9/ZENEWRRgEaK0B1NiaestVhC04N/iYksXpa6E4=; b=chpvL1WvjXIB/32u
	6sM/GzBgEY+Mlmm+XfJ5HWF1eCNW//npW75RwsDUisXcJ3kzCYvCanc/peFhFL7E
	IVD1FUAqLc9mRX4ke4ofuTZmvOCzU5Wugnf07xbA21VMOFr4puJRv3gfa2X3a4aq
	0lZDVH+4hVU85LhbeRd9vFpBiSCyGIVRwIzT3ymzVUN373y6FM4tZ/zxzLiODkP5
	CmyIC9vrYqEVZjoYfRjLeBJJYeaOoLR+y1IP1YzdG5Za3cdTeSNLJFEUIIWhqioR
	IWI2CHbQYHC7mKCU0nfgy2Aj+q2qQkCF4ty4RuRRfpU7Re6CXcGVSLUD7+XPF94E
	A+8qdw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f31tss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so5112391b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778619203; x=1779224003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TfT9/ZENEWRRgEaK0B1NiaestVhC04N/iYksXpa6E4=;
        b=EjlH544VL2OX5QodXPiCwB2XxvsHKkvzt7vJ096LRqxsini9nytmqG3dm23UUDn7na
         Co70vf1+q1nkvQTKllF5xYMUIYsYH/y1ZhmQYfN+YpHqwfGtDHpniEn5i3f0A9Jbf6ck
         72ZsDQYRryAkbf+O0oB57NdHRF5n5tzcP5+0Y/WMbLVZgtM0TdF4W0lNAoJkypWqjo1+
         tOx++NiKFdc9837gbhf5Z0xmNIs1j92cQhTQ/kA0xiqFuEiOhtUwQrXPOnQJqfKqRfqo
         v1qPYY6yTjqTOSr4TllAg4OfWvm+m1wbtyn7dTLjhWEPs3XL4iQ+iyaBiLyBScPOYrLk
         Q9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619203; x=1779224003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0TfT9/ZENEWRRgEaK0B1NiaestVhC04N/iYksXpa6E4=;
        b=OWdETAhmPzapMQgSfijqqkpofq8h5DFnlR7t2skcaI99c0daDFKlkZiTAG24qrdQWY
         upYIfBse18dVWT5a6uOkJ3YZB8j+vi5bE4uiOaoZzHQLmrWQvlcxELEjGjPAk0SYDZ1v
         4im2OxlNFb/0T8uC3uT14UOX6VlR9OQ27KK0rfYoAoBlsOr4ts/KCnAOCCT7l21lNlfV
         w4v7v+6GQLHqqcTh2qCo2fjbq0ThVfToxMO/7HNxrh00fn+MMc8LhgEVyutwosXSS6Vy
         xKl1EcIhs3qX4G6YSqLq8YJ/VhekqITakvFquVTpNyrt1DzMW0oOXVSNXIx/ftA47+RV
         BRew==
X-Gm-Message-State: AOJu0YwZ+2PRtm15fTn3RR/YqdGDvgY7VV+OJxcDD9kBOCrKk6mDAo3z
	IL4/VUPxgH/6XC6y5/D8bq30KgRgMPO3d+bXJFUGoepYqJaNfW9Na2dhjVXpitkmATRwjedT0vH
	iga2geCILprgQXEUFAfqsjKyy/Ss/n0ZAY6pLi+SnP6VLaLsM+2zS8E0cur+Hphw49B1r
X-Gm-Gg: Acq92OEoRRp8v32gCP3Mnok89nUDTiQYmR4+l1TmMFzx6M634AH9zdgFuDwln67OeuR
	BSNBlZQC9M7pa8BR0NEAjtkPL44T7Q/iir4WECCQgcfMf8pF5oq4aEvUkXQW3nzVpLG0m7fbGD6
	AeLFlaUXZ54qbEoX1DCSSSyZWV1GfYPT8j88hhgxL7ighK2spKzQXVSmRvKPZNPOcl0b75JL+5e
	PUXk4fpPCv/GckhuluiPwFOJgQtmuKp0V3NIRuGpsHuI7cwua5mXm3Oop0uTa7oXPj4dt3TFr/Q
	Cv47FwkmsqZDi/PeCr10s1htpIzKs8riOz5ADXe8FJ6ogBEoVvINAiLTawZBDyNFrVURuay7ggJ
	wINz8s1r4G6bJ9Nda9ub5rxD+Ng4mEB95L04g0euJGKrgYg==
X-Received: by 2002:a05:6a00:4516:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-83ee83ac2c1mr4769635b3a.18.1778619203213;
        Tue, 12 May 2026 13:53:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:4516:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-83ee83ac2c1mr4769612b3a.18.1778619202731;
        Tue, 12 May 2026 13:53:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm25453004b3a.15.2026.05.12.13.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:53:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 02:22:56 +0530
Subject: [PATCH RFT 1/5] drm/msm/adreno/a6xx: Mark cxpd device_link as
 stateless
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-gmu-sync-state-fix-v1-1-6e33e6aa9b4f@oss.qualcomm.com>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
In-Reply-To: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778619193; l=4014;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8x5dChKVCVCMOobD3xTgj2pX4wLUI672qR53c65MycA=;
 b=GgzRnj+PeTNAinxeGf3LKVTfwIeGmZL2ZE4i65X8LKrK/TFSMNBIxaVUeuo+GOUJMtbPnkv8w
 XzoulC4YQ2mDmMmQjJiuu6gHMjBHzGdeROiTiLnRmSYC/szVweFdcoO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: rlDwUfAa7d21TJozR0CZS0y7N9ck1yLn
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a039343 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I6AzIoMvu9cqgKTuVesA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIxNCBTYWx0ZWRfX+ivE5A/qZhId
 Ztfeo5q9pRHHrBiknpgByrQ7rGS6o9nEi2aeo7KRNN2HRtN9tH7dEWPxNzD94eMXbOLF74EpYAj
 L+X2evnaPrbZeg4okQMpkmoRYUKO/WYLO4RUZea9t9Qr144uoXudhu2+jGgoS1W8U1VH0L5TpMR
 OKEEXsMXYP8Z+27arS55nk1oor4BpGWAc7sXt2mRUKWfChGNPfp77538MFUEPV0FLQ66EkhQNDR
 dQ6BRyJboGb5r7jxuccPiX3yNicl1J64wtlu1DTKKX1IxRFDq4XLoP4HDljR2COvQSVqXTV+zno
 IG4cePNUnqRX+ucIrzFysw3f+fXD6bDgJv6hGFhLpfPZu55Gd5W5/qgracZZG9sU6H8lXm+Lc3r
 6YlUWS0hLYw5Q3tVX/mPPqLkGvuSRTZDEkodZNwNwv1qgFWJkTbBFuaXs2J7tRiq6Kw08mg50Dw
 D9gmpc11BN5hgqsb5lQ==
X-Proofpoint-GUID: rlDwUfAa7d21TJozR0CZS0y7N9ck1yLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120214
X-Rspamd-Queue-Id: 3A89C529A19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107212-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Since the cxpd virtual device is a driverless device, it has no real
struct device_driver bound it the way a normal platform device does. So,
the managed lifecycle doesn't map cleanly onto it. Since the lifecycle of
this device_link is managed by the msm driver, pass DL_FLAG_STATELESS
together with the existing DL_FLAG_PM_RUNTIME flag.

This fix is required to avoid the below splat when a driver is attached to
the GMU:

[    9.624509] WARNING: drivers/base/core.c:1383 at dvice_links_driver_bound+0x178/0x330, CPU#6: (udev-worker)/354e
[    9.781167] pc : device_links_driver_bound+0x178/0x330
[    9.786456] lr : device_links_driver_bound+0x158/0x330
[    9.798622] sp : ffff8000827bb820
[    9.802042] x29: ffff8000827bb820 x28: ffff000808915800 x27: 0000000000000044
[    9.809573] x26: ffffb7caf3f983d0 x25: 0000000000000003 x24: ffffb7caf41645a0
[    9.816920] x23: ffffb7caf3f982d8 x22: ffff000801239cb8 x21: ffff000801239c10
[    9.816921] x20: ffff00080b3a8c00 x19: ffff000801239c98 x18: 00000000ffffffff
[    9.816922] x17: 736d5b2073706f5f x16: ffffb7caf1eb5940 x15: ffff8001027bb3b7
[    9.816922] x14: 0000000000000026 x13: ffff00080084c110 x12: 0000000000000000
[    9.816923] x11: ffff0008004a5828 x10: ffff0008004a56d0 x9 : ffffb7caf2227870
[    9.816924] x8 : ffff0008004a56f8 x7 : 0000000000000001 x6 : 0000000000001000ocket.
[    9.816925] x5 : 00000000001a7fbf x4 : ffff0008004a56e8 x3 : ffff000801238cc8
[    9.816926] x2 : ffffb7caf4164000 x1 : ffff000801239c10 x0 : 0000000000000000
[    9.816927] Call trace:
[    9.816927]  device_links_driver_bound+0x178/0x330 (P)
[    9.893492]  driver_bound+0x7c/0xd0
[    9.893493]  really_probe+0x208/0x2a8
[    9.893495]  __driver_probe_device+0x88/0x170
[    9.893496]  driver_probe_device+0x44/0x178
[    9.909639]  __driver_attach+0x9c/0x1b8
[    9.913592]  bus_for_each_dev+0x7c/0xe8System Message Bus Socket.
[    9.925839]  driver_attach+0x2c/0x40
[    9.929733]  bus_add_driver+0xec/0x218
[    9.933609]  driver_register+0x68/0x138
[    9.937555]  __platform_driver_register+0x2c/0x40
[    9.937556]  adreno_gmu_register+0x2c/0x40 [msm]
[    9.947141]  adreno_register+0x3c/0x50 [msm]
[    9.951544]  msm_drm_register+0x50/0x78 [msm]for the API...
[    9.962813]  do_one_initcall+0x4c/0x3e0
[    9.966975]  do_init_module+0x60/0x280
[    9.970849]  load_module+0x1c70/0x1fa0
[    9.974708]  init_module_from_file+0xdc/0x100
[    9.979188]  __arm64_sys_finit_module+0x1c0/0x2e0
[    9.984026]  invoke_syscall+0x5c/0x120
[    9.987882]  el0_svc_common.constprop.0+0xd0/0xf8
[    9.992715]  do_el0_svc+0x28/0x40
[    9.995243] qcom_q6v5_pas 6800000.remoteproc: Handover signaled, but it already happened
[    9.996128]  el0_svc+0x38/0x148
[   10.007672]  el0t_64_sync_handler+0xa0/0xe8
[   10.011975]  el0t_64_sync+0x198/0x1a0

Fixes: ead5d3e5eb37 ("drm/msm/a6xx: Vote for cx gdsc from gpu driver")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..ec13b27feee7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2196,7 +2196,8 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_mmio;
 	}
 
-	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
+	if (!device_link_add(gmu->dev, gmu->cxpd,
+			     DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS)) {
 		ret = -ENODEV;
 		goto detach_cxpd;
 	}
@@ -2377,7 +2378,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_mmio;
 	}
 
-	link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
+	link = device_link_add(gmu->dev, gmu->cxpd,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
 	if (!link) {
 		ret = -ENODEV;
 		goto detach_cxpd;

-- 
2.51.0


