Return-Path: <linux-arm-msm+bounces-100173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFpaGrjMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB8733D7A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9107307F50D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D9623C4F3;
	Fri, 27 Mar 2026 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqJiphnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHX56Vj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC7234964
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570539; cv=none; b=ew+jBfvzJRwXlucEcqjcFTIzfvsdkJPDOklQHCKMLxxXsxmJz5Q5lp4DMQUgMvWl5SKzIjEAoXGq7exOttyPxDzma7FJvS+ZKrLk6VHBKV5llhFuZ06QY83ZVr4zOChnjIziUFS8hr98Fx+VPjJ2lX+/hvAvS72humpCmAMXZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570539; c=relaxed/simple;
	bh=H5UIoWKcwOAS+auMl89W13gGP8KyR+VgG/pl7Eqs3ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPQD4q4QLcVs0qEE64+2kvvBq2YjNe0LXitMFt9xlv/zo9Wog2sBwa3tjMG3BgZrNoghkUfi1te5d14iYKFLvXNR8/9oQ98ZJOHWXoaKvy+x0ZVjV2FyaJ04KjnpIlEKkZekDnakmIEuP5nI+JVB9CaFa3fmikPRxVlYc6x0RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqJiphnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHX56Vj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R0BgkN790018
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6h1GbkcqRvODh/gp8Mx0/sRdMg7ZV4RUJ1froSrMVMQ=; b=MqJiphnGufhDbsoG
	QfoaEzBQWKI9MK74OIQ3ckZmrPNAuswI7Iy6CAzTfjs8vZbQ8qTT9yajw8U2RbE7
	e/KuxPrgMb+W6NTVrIsluasKYxXvXmj+l3uqO15KEres79bddGNXIteo//Q4Bobm
	41tRMi9EFHmV6pgHx7dhChMywN5fa63lcIqy7PD3iTGYTw0faulExiC1wws2d5zU
	aIrvhQ9eltOk2sN3RtCJep9Rk6RuftClu9rQNC3Rfwcds9I8/JxwDINnzjCB3ucq
	xwwOFFOKZDn2uzz6+x3dxgn0yMKL/ygUNV5vlYahhSy6solagOMvqJcSwYSNBF1M
	2Q5v5g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqjhps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso1513267a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570537; x=1775175337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6h1GbkcqRvODh/gp8Mx0/sRdMg7ZV4RUJ1froSrMVMQ=;
        b=CHX56Vj/eUFAkANOtne8tnZRXLj/OR4Rhyvic6Os9tplCm7iZX8Th9Hi+1J+apoFZH
         1TxH75P+NM0ogm8d58FkMv1gSI9ZEpUpW037uksBzHRj2jASZbQb1YCWkKnAwg7r7HIE
         E22cCBti33FEZPLxPtpXiQz28O6wpijb/z7fHJSfIhKTq7wc25D435zl5NUjleyjqfEC
         DZOvOF3ZMaPsllxwWMwNUrEC+jsD3Y/Cbh8t1lnhbRY4N2Tx9e4/WS4lbZQ4umEeTfnI
         8IXQY7yQ6YqDeDcbUyP2LBZkuYEd1evd0ytZ74Tdmqwun+P5VHVBQBbkgG7DB010pIwJ
         Uccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570537; x=1775175337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6h1GbkcqRvODh/gp8Mx0/sRdMg7ZV4RUJ1froSrMVMQ=;
        b=GOwjudgQcAoBFaAjIOCRrrS5tRarJ47ex3ga9WLs6UIO0U1MmGgrT38bVkX/xhXdSe
         xMUePi6yOwz0lEw23jA/ay8Iyk3N2niBfTmcfpkGjPBdwHVQbBIOe/dJcNb1jvwE/feV
         oz3U31f8CvjN66lPgINWPRT6yBgBSZVMslFyLiHVT9BDj1HR6rdOsnX1CKlPKYWpvmZY
         T1n2viB67VbCtjR7Biz2BOGgN4zkIyiPxDiD0QSFSj6Yn8OGiav4zYvL4+DAeeuZ54Dl
         axL/JsYAnUlDGjVc4CDs3VfnewND/a/o0eyozeaa6SJ2xqROcQ3knQ4nved3U2AQeAUI
         ebUQ==
X-Gm-Message-State: AOJu0YxB3vsOS48w34jHMYVsgfUsIrjfWJvfJ9olLF/s9oi17MHpgUFt
	Lyk5GV+1af3MCx6CFQ9VE8um4hHBAanVnORW4mq4EQpubdIc0MD9gSVKLxRaeXUFJMN/onWi68u
	EEudYh81q41krIpv1TO7QyK12QewYasBIOvmjd2iY0/FTmGxcMlSveE00Rr/jpkwNS/cm
X-Gm-Gg: ATEYQzypQbYB4nR8Vg8L54xAOQw7aoKV/QmTW+w2SXjrLNVDWtWDkcvwT65oVquQ86j
	sognubG3sktt31x64Rw5EiRYTREZyGFTBhKFE4A11t01oUWCxxEfASxdQ9tRaWhoFLpETEjWLl+
	EdimrwTINjG3rVNoZfN4j/qLDgUW2juBZ1/039xZjLHzRaTp6p+/V0Jn5S8vz4NMwME69vB6Q2v
	UbPJKVjzAiMRyBEOayo6d6gt3vQJBc8ovH1ezAYLXu4rBu1/8pyQcNZy6BHFItwqof5HI/dn3wf
	83Wzo1ZjDM/zsiCTsgGCkKKx5clXvcW0FlqQtcxl45VPP+mwnIasNJnreTIyEbDCkJ/8rSxzNvZ
	ePTNhqpHBkYHt/DsK75SQLEhC51KNOmAFjApY0bXPB0K/5g==
X-Received: by 2002:a17:90b:3b4f:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35c30076fe2mr470126a91.22.1774570536911;
        Thu, 26 Mar 2026 17:15:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4f:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35c30076fe2mr470108a91.22.1774570536479;
        Thu, 26 Mar 2026 17:15:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:44:00 +0530
Subject: [PATCH v2 11/17] drm/msm/a8xx: Add SKU table for A840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-11-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=805;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=H5UIoWKcwOAS+auMl89W13gGP8KyR+VgG/pl7Eqs3ww=;
 b=F4HSw5meUoi3jhfUWmmoDNcf7NbKh/4OwftlVELIMzRkTdituHgBBglo01cbB+1fOXlzRFHsZ
 IOnX2+H3sqlAwz/C/8ZLBfAK4UQbCcURatEBNtjiQaj8+wNYGaLpREi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX0E/hDvJhrZ1X
 /7ZmyZxr0yDKw/bAhGITVbbd+86pv/t6uC1v2RQoG3pyZSQlDkfKFcr3B7SYvzkQg1fdkQ5V3r3
 R830iiguOINb+1YNAhpW0Mj2H8t1TEcO1BdUWKtu/Cvl6gUa+zikNdzV6MZg8XLg8JdRE2Ps2Ob
 p16vUnBM6VUHR9tuSFwFrVDzJiL5J0FzpANxZrzGkRw3eIMPqtiln9m0O9goZcLLX6f+QMLt0lT
 4JCXscCcVNUwYCybazOt5ETP9pX9DuA0OI9cA9YOXlUyBw+6B5jXvmHp93TIelCXX8JN6wTDc9O
 T0gToJdwsZ5fekqAgMR8sP/2khljw3CrE9nwXco0+/e+hZSwCQmqGF4wOrB4+PYCgR3pRRog42k
 ovUFjOjlYgyNvf/3kw5TLsi/qrvCpuGdK00OHsnbLStFLFuj9ort577NWIejt3XKZf05JM9zU17
 soYi1wF3hv5mf7ftIHw==
X-Proofpoint-GUID: UPOz4E1taiRTMsP7XBL5Fmdnng21HANh
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c5cc29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ml_BBXNIZAQcZvYyiGwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: UPOz4E1taiRTMsP7XBL5Fmdnng21HANh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100173-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: DDB8733D7A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the SKU table in the catalog for A840 GPU. This data helps to pick
the correct bin from the OPP table based on the speed_bin fuse value.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 38561f26837e..f6b9792531a6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1954,6 +1954,12 @@ static const struct adreno_info a8xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 19708 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 273, 1 },
+			{ 252, 2 },
+			{ 221, 3 },
+		),
 	}
 };
 

-- 
2.51.0


