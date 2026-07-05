Return-Path: <linux-arm-msm+bounces-116506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CF8xGtkPSmru9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02450709556
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:03:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FawQpZ4f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j2IJ83hm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116506-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116506-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C1DA302F38E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493BA35A384;
	Sun,  5 Jul 2026 08:01:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD3627E076
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:01:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238462; cv=none; b=ohu19ixta8UXrJszuXpIz+FFAL/JQoOVxPF21pkfm+SynDb0DaZ8gJiqWnFKhtxNZ83MIQbA/HhvpQUs9mI5z3LI2moO+uvkr865GIRZ/AivjjYOBwY8iFBd2c5+xa1Y/wAlbdrA2QRcdS+d+EhYQE/V3l3ySB/YPMykvy8FO8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238462; c=relaxed/simple;
	bh=3Byd2iwGy8nbSKXVCEt6BL7u6F87e2rKPSvibHz74Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MGw5mxTlvQCIn9QJTnoGLLd4WTfQwvIcBbmZwNkryGOlY3Hg5aRfH4A9AFgCsuize04W+FSl2q5skyk4cuMazcxveywipUmrqIjsIcKvKPbqLxc3EnmtfI90UD6g9qeeCd8SCUqkIYiUEWm0VmX5dsnWdgCbEGLqULDiHoL+5hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FawQpZ4f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2IJ83hm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NkP9I160603
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzQCh286Vg0S8d0fqoIRZWO4vh9rmDpADQm1Ym6AjIk=; b=FawQpZ4fFI+jiPuK
	vx9c5ybAs1WcfqZtTaPGNDX6Akk81RRfV13sdz6DILVqBgDHkBzM8jTBXDvfDWOw
	4A3yUw7iTUqXUtdYCPY2wXwGxp/8gdPGxAmyR1t0Wez7Bg3Z+0SR+/9NO/RIxPKt
	NEsJebZGJN3l4oOuAWSOklB7ZlFlNV9WEQU+m9/mZ9ZWGHCZVGr/60rGhupFLusB
	F0KGFgTZJGea+9UBdjgKoOlx60c6jkQdfqDXDq3qwf3yRUX7GEdUs0rzWNp3RjtR
	IvV6neX6pnWlD6BpRsLhOeviczNpkzxDf1zL7qOfsewArvRB6OIBzzgRI4Qv49Wt
	4OT3Aw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvjbms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:00:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so2304669a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238459; x=1783843259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzQCh286Vg0S8d0fqoIRZWO4vh9rmDpADQm1Ym6AjIk=;
        b=j2IJ83hmfpWXe6tvDkKBkU4etWz1bbkoKZ6KeHdIMO8x9M/x34NL8DXkShA48yuUly
         dW7s6osTDMPYL2tHxVqgqfRwpkDYKFicFNDnfN9PwPU+L9DLy3SH89TMTbWT1dpeXbZA
         Qzllu8NvP/idGdkFraHXk9Q5vUt0Qg1p4W7TYhmtYynpRifzySnfH0+ogTDx8ut7oyio
         bMZhQt4cwHEm7RoOEdldoL7nunlqjpm7IjcHE39LAG74XJxYDG81PWcjJrUOVAU9l0Bo
         Gf2lIsn4x9yfBXMqC61ficXe1B3yzGQ3Zlwvdr6euFdfnr9R3dJz3U81fxd2nJzPBxsy
         Ww4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238459; x=1783843259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VzQCh286Vg0S8d0fqoIRZWO4vh9rmDpADQm1Ym6AjIk=;
        b=qOB1zkBLLalv2etVoZl5Mon4gHe38PPtvOVzpLkB1jYCs4Nsf9DpLKzGgj2QSYVYah
         q1R18O9V0LX/Pwr+2cpGHYy0mlhmDQbcQQFP7u+fQ0/wI1HCVnc2NrwFkvkeRJ4bVKRx
         XyOaIQ2xCgoSyN2p2ZI+dAREAPBi1W0ArEJEhMv5cfO07xIWba5p4kFTSYcKVtgHSs9k
         wg9OFjh5R2iu4dUWyYOQcewsW7/KrdvcSr2G69cGOVgCv3RW/YqHW9XT8WAOgBCkSsPI
         Vjxd28R6zp9MOMakFT9lv+ehY5h0rcezLkdgKm56NO6NEAo9rKQ4Z0rqjgUIWBsXxAT1
         BHug==
X-Forwarded-Encrypted: i=1; AHgh+Rpv3JrpgOOEZGTasoNJOo56CITV2C4lHHYWft0Jk2eLP/JGWT4MOmCoNMZh0PzZGxt0BtkMkXitXQXdnEbN@vger.kernel.org
X-Gm-Message-State: AOJu0Yylr9zZpTnGMm7sVA2HmIZGC9oM5L+J7ho0b6gu3H5XFj5rOvg8
	gf+ZW4t3KRlZBayy1Q5gtk8gJgbmQjDQOwXMrZtcHhTu0Zm/USF7dlfmVT5MNg9IHsn4ueCus1f
	YcrrFcy3/NYyBQ/qyhC3nGatJajcvau+u54YFeXbZjumJc00BAf0A9NHwXAev6oun8Ui2
X-Gm-Gg: AfdE7cl4pOkgQsQYvqzd7XxvPuCnV7qcgevRtCZmEa9l2UMSuqvD85ofEpSwjkdOGAI
	huoN2HUUuG2h3l9Ba99EcZOqlNiACQJ6y6wKBhx4nYPRTyhYgDgh/KTuB7f6CZXb7b1W8jKUnJc
	pIthdmPG3z6dEEL0CX35f8CeMG0b5Wl9GqZGv/MeRUpu/naQuStcGdslGs1pFxMvNUd3pwBZ3j/
	3XFUWCK13VNjH9egz1RNj4eUzF1HXd21Cuzmz71EvAL/4CFWPNJqzetDCRRZVxXLPOCfHkjB5Re
	szik7EETFx3ma7JQjvXM4QUXNE7tOW4LezGj4lUU2wydcAlES9sXm7T3oW6i3jnKo7LrXgMhuE4
	byOEnJ9ZOMBLHoOGkHlUf2ljNWfPFUt1VPTM=
X-Received: by 2002:a17:90b:4ecd:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3811238f60fmr10862426a91.18.1783238458409;
        Sun, 05 Jul 2026 01:00:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4ecd:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3811238f60fmr10862324a91.18.1783238456864;
        Sun, 05 Jul 2026 01:00:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:00:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:05 +0530
Subject: [PATCH v2 1/8] drm/msm/a6xx: Increase HFI GX perf level limit to
 24
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1999;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3Byd2iwGy8nbSKXVCEt6BL7u6F87e2rKPSvibHz74Wg=;
 b=tw/H1MbksYZS+PlUsCOdhIVPmvoITEFmuWZhx/fspqQLWZq2Uz+hdMwK37lq55MF8qglQRsta
 7jMqHdoWGJLBZrYt67Ukusw7TuMk9Jvgcz0QFBu7VPGvZi2gEF1f0ry
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4a0f3b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bjN1K8ZYlNTK_pBii84A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: HpH5lc4rGky6iV5LpQ5joVEqvjF64S7x
X-Proofpoint-GUID: HpH5lc4rGky6iV5LpQ5joVEqvjF64S7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX3vHhXxZXzGA7
 XzjlZ6N0e/h1dgZ+3H4GyV14LR/3aH4b8XixNFQ9GLCC1nnfBFgv/itMFa+A3PrmxfxVGcnHTDU
 IIxV6RX1inB6SJ07m0AgAgJnhnRHcqE08G53fseeXTd+wHFvdSFnn5QMKfApgThCEkSFMAcCpNT
 +4fguoH+OQqkEqy+o07EDOhhQeUFSCv3RO+STVZqoNU2U1+G+ltSa59h4qEpnsooAFC0adxqYUU
 b9OVdzklI+pXuC/4LYaWZ3ja6ZbQ5x60+3Uns/kVseu7eAUWDMitmcDEu7F2h4kP0XBlA7tpvF4
 q+9eSFlqOJirD5WIrmMHPfqZtikqQfWdYvSNFkE5HtaUPLXKJllI1bQNyc6I2oBITjQ54h3sydu
 FYCq5onUdgXyGXVaDFF5moX9H1Uz0gGpJ44Z0kpuJ/4nIvIQs/YPO60/6Z0UrR4vlgz0J2qf701
 Vha1jPnRuEdTYHbAJZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX/WISMJuw+jdj
 gnzZ9nIACxW0TnDht7x+gwrZTZ2PO0SDc//oXKfeOjl7j/gPUjYdCys0gqWiwjGPsXYbXGvB80H
 v176AqSdJQoOmyc4AFYqoS10LpFhXWQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116506-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02450709556

Newer Adreno GPUs expose more than 16 GX frequency levels. Introduce
HFI_MAX_GX_LEVELS and use it to size the perf-table and bandwidth-table
GX vote arrays, and to derive GMU_MAX_GX_FREQS, so these levels are not
truncated.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 3f96b10b5f61..62e3fb230cd3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -20,7 +20,7 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
-#define GMU_MAX_GX_FREQS	32
+#define GMU_MAX_GX_FREQS	HFI_MAX_GX_LEVELS
 #define GMU_MAX_CX_FREQS	6
 #define GMU_MAX_BCMS		3
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index e10d32ce93e0..f4da73a555c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -5,6 +5,7 @@
 #define _A6XX_HFI_H_
 
 #define HFI_MAX_QUEUES 3
+#define HFI_MAX_GX_LEVELS 24
 
 struct a6xx_hfi_queue_table_header {
 	u32 version;
@@ -119,7 +120,7 @@ struct a6xx_hfi_msg_perf_table_v1 {
 	u32 num_gpu_levels;
 	u32 num_gmu_levels;
 
-	struct perf_level gx_votes[16];
+	struct perf_level gx_votes[HFI_MAX_GX_LEVELS];
 	struct perf_level cx_votes[4];
 } __packed;
 
@@ -128,7 +129,7 @@ struct a6xx_hfi_msg_perf_table {
 	u32 num_gpu_levels;
 	u32 num_gmu_levels;
 
-	struct perf_gx_level gx_votes[16];
+	struct perf_gx_level gx_votes[HFI_MAX_GX_LEVELS];
 	struct perf_level cx_votes[4];
 } __packed;
 
@@ -144,7 +145,7 @@ struct a6xx_hfi_msg_bw_table {
 	u32 cnoc_cmds_addrs[6];
 	u32 cnoc_cmds_data[2][6];
 	u32 ddr_cmds_addrs[8];
-	u32 ddr_cmds_data[16][8];
+	u32 ddr_cmds_data[HFI_MAX_GX_LEVELS][8];
 } __packed;
 
 #define HFI_H2F_MSG_TEST 5

-- 
2.54.0


