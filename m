Return-Path: <linux-arm-msm+bounces-99349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDl+Mj5xwWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:58:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4403C2F9373
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E94132BCA8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3841B3BE65F;
	Mon, 23 Mar 2026 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlDN/qJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrmXPM+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667B3BA240
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282573; cv=none; b=AzFc6LeKVXdjlg6yul238Hks5S5nMPpoSJLR/TuJozh2q51k6eljIy669a6PAa4U7bwA2RWGJJxQOLdnr+ryGGaZ6cO2Y6H8Qe1xSOb/wh8+nmTvUB6Yeb7FBhMZkcY1uvTKR9qonQ2+SU1RkUc7FHYTEPaIx7eQOFvRLLLWQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282573; c=relaxed/simple;
	bh=egNxY7Sjt2+QwB9I4IKCOmrV0JTx6ZSJXUu7VgW1GL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3GWn49MH/DM4f9uL+T7vhcy6rCrCxuIw6F2ozCSqWdjIryprwamDRkjDF0hCwUM4XS73LDbTWW5Cxx9IEZqqaEnaEmfOAbvCZCOfCH1R5V6vRCnQF8zkZ/F+ILLoZ6Xtbj81RUbCUqbDk2STfgNf/PanbneJmR+Mormzqbncho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlDN/qJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrmXPM+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGZCA1474397
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YJGPCUwwxRql3Fl302RF8N8GbMb2NM0tHY0
	3zzpwF3c=; b=nlDN/qJIaJeqKuE6kr+Wfovowu93jLWVaHYWALCAApojiJV8vlq
	OqYNM6G0Yq4bRd8EC09XLcpEIzz/n4KMyBX5RNh8QFjIEYjcvf4p7GCM7MyPQ0oI
	3IMyhf0BtQPLX5OeSFhoiazVoy9f8OgU3riHVeN9XBVy0Xy12V9JpOBq3hPaHjlW
	kH5GP6UUodlJsThChriPXdGz5sTabn6D0OOkBcstPiHNydd086+QLsJ1SmHZ/9K4
	hhKWXhZHyzLFeUTpScYofVrMPzncQk/Q+XM7pd1TxcQkvI1RRPaPmt//GaKKz0dB
	WgMglCKAnuvB9BK73uhpA15vevI4S9qyoYw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8m3xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:16:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b94e2caf9so15977658a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774282570; x=1774887370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJGPCUwwxRql3Fl302RF8N8GbMb2NM0tHY03zzpwF3c=;
        b=MrmXPM+4QLqZNHBUaxz/Gc7Pj+E6ClSyBA62uVjTOdcj4HjFuGkVpcBeH0DAai5JHa
         Vl5cDOxRxiBF7a8SRE1J9JqWtRLYHhEm2zVBmlF6DX4+MSHemE3R7k+iLWt6KJvlRXY3
         aNp1wgxG35SR3C7jHRbm0i1EQfKcB4VDdyipDJo/Vy0J+vY1MEX48zOemtA+UesoTbmA
         pt/+LS+Kq/uv0me80T9ZRLHV3bzyCswGmjFQ7kqNEH+ZLH77mGvWezdlSrggXdvtPVO5
         NjWi/khzSCErrYo1jA241XQ0iKgk5ZL1qJxIGQQkAVkPz0r0+Q9n0an8YQyZxH4xcv94
         qVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282570; x=1774887370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJGPCUwwxRql3Fl302RF8N8GbMb2NM0tHY03zzpwF3c=;
        b=YKa/1hXmQyPG8hsXTcSd+cu4Fb0Mn+7wzOeskk15dx08HQP7BUUKDgugfakOMAwXf1
         yc+fdL0siyGbbw/dq8xlhsaZUfHNBm5rrDZTmLdPthd1tohKdzddocYyDRO9n6f/5knr
         oNpn4v6uBOiOFTsT7ulHgMesBYZO8sfufavavkxfRmPMNycK6IntG9yugBMLWjt5700p
         siuZr/is5p4TNpd6EWDah2p1b5bCWIPsC/ZsRuMcwRD53ywihlb2VJ6taU4/7RvPfLVk
         htNXaC93wj6IDEae9aBvbaAk9EbvYmDMMQiGcLUKGpPoCE7SCWap8o1yGuF4xGgirjGr
         KgQw==
X-Gm-Message-State: AOJu0Ywyuch/UAYoQxKpN+kOd+D3CQ8dRDxLqqu8GPkUmIFF4IeF6amX
	0wDOu28f5eRvK4E2+ctQzyXeDRXNeotGA2BCcJwW6LHD6NWhh9LQVOhdh8vRm5gAoyXYYrL6kje
	qBsaKZl4Bw9Es0aGWuHBSZMHwhSK4BJbu/FxLgi/0q26p+x7a+f0vpUArEO/Ah8Tx9PYYfGxh10
	U0
X-Gm-Gg: ATEYQzxdxI5h+mTBuenOAbFlza9MPH1uXswg/m84uu3il7xpoaMtzmOnyRxLuX/F1eB
	phxgvHpXf5onDN9SI+XRsLGQrhWCY8e5Ec9eZwKrIO2QIf6wbvIEfwVVZxO4NWswj8twCuyCQRf
	hMuohAb3TSlEixAzNSn5dlcU1uUg/nriQDcQgA0yAdUF2MD86TniS06JURbNluggXgMes78VdqK
	m3b8LXcs6BRiBLdGv1GurSSznsI/7z/fb4sLZU3tK6MKa4O9Q/56goS1v4pC+7gWjrQy20toKsE
	aoky2pmCexJofPkjk4phx4jAJMAnl0c94JABUVp8G1OeCg3QOR9NpRhdpR9lxkmj4VfHzKFOAI3
	jh0DxgOQsDZEa9xvqHUCQ17QG8+r1FVa9
X-Received: by 2002:a17:90b:390e:b0:35b:9682:51e6 with SMTP id 98e67ed59e1d1-35bd2d21ce8mr11383174a91.16.1774282569945;
        Mon, 23 Mar 2026 09:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:35b:9682:51e6 with SMTP id 98e67ed59e1d1-35bd2d21ce8mr11383148a91.16.1774282569479;
        Mon, 23 Mar 2026 09:16:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc610c232sm12295993a91.13.2026.03.23.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Add missing aperture_lock init
Date: Mon, 23 Mar 2026 09:16:02 -0700
Message-ID: <20260323161603.1165108-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMyBTYWx0ZWRfX922fIrMjBTMV
 iTt+t0qhwm4M93Upo8iPRHilO8i+MYk9cwnWxQ1PzBMAJdgE2fz81Yskg3wKjtvo3iHp0jC0T1D
 H+Cd0bzzDvcitCSeicClL6HMLvuHckiIVvRmPLJ7Nzff+80E/ijiBBY5dMJYMmuxvCANkexFSEK
 ng1uH9EGJg/y+ioNBHerf/npyAYmnjLhMRUkGda0OZ3K63R+CD+giU2tJQT32pQ7U+e6Y3jN7h+
 0SBuPVxSLDHqOpdDWpblZSpgZig1PnI/RNFoFOHwLf3S4tzcnBnqhF9WQMj//f6Zo8EoD5jeA3y
 nlRHNCz1NAmmsekaJnpDp0UqFq5C7oYOWnQG0LiYppsVC/SDyz/5O8xQ1a5t1aVKkeYpojzCOQy
 lP3c3PN8sdyo62VnRk2GS29fDIM2lTFlEysLx/XnEKExqOaBHQ2rPoHRDrFUjf4rWxBQKBc/LsB
 0niVw9hypPj42kcIgZg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c1674a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=SI4bJWXHUBEfUJKjJlYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uHynxs1-kdSdOPGrsOL7u2JlpdsfEQjd
X-Proofpoint-GUID: uHynxs1-kdSdOPGrsOL7u2JlpdsfEQjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230123
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99349-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4403C2F9373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Looks like this was somehow missed when introducing gen8 support.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..a00215b7bd1e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2656,6 +2656,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	gpu = &adreno_gpu->base;
 
 	mutex_init(&a6xx_gpu->gmu.lock);
+	spin_lock_init(&a6xx_gpu->aperture_lock);
 
 	adreno_gpu->registers = NULL;
 
-- 
2.53.0


