Return-Path: <linux-arm-msm+bounces-105805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLvKHwbv+Gl93QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:09:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 122CE4C2FE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D1573038957
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EAF3EFD03;
	Mon,  4 May 2026 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiF48jSk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2uPFjEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC433EFD27
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921730; cv=none; b=E3aEpm0H3CUrmO0JcamB5ey4X/pzHL4xTtRr2JLkE5pluOrpf6ajMifcZ9PiPfD1W5INRdPgklPEnh6E0flkoXaQ3GYiPPfHpPb8ws9ELuIVdQnrVxx3eHEY0+mL8VpV1UK2nkutC1eIZT7FwDTcw0Am4QRq3SH1VpXG51Jp0dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921730; c=relaxed/simple;
	bh=/luFySN9TuTwP132kmsdb3FQnU3x5xvt3hdARMrrktA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVUHqC8rA9ZR5OXTDGiYbzb6uxM/YOAvgSM57wcmHFOUIp8cndR2xUfwJZ10S/+obyw/pQgAv1SoIcIJZbvsMXNQtfFNeK5Ru97zCE5IlhYT9umtIIvEhdzJtNOxOY6m1Gw2qcBFDBMkhjpnCtRfCWSPyUBxTKEm5U2p4W1H8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiF48jSk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2uPFjEi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FIf5X3409777
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V4uUYe1yUyG
	7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=; b=aiF48jSk2z03g5J0k6wGhitJjRW
	zZ5SzT322LLAPFpGhEccDuh5t9SlEZ7wUAHQWxejw+VO07LehrJpSvlKcYIMSYW6
	nGGNPG7UddirNLOIYHauEpJO7lk0hx3ZLOSd1fRHoD1nJip3gXLKHXncrYeH1zV6
	atpjM/MVSmkyLBoVoN4iTgK1j+EryclN5yjnDLPZ+hjj2ofveu3Kwk7gZ8SPcn97
	cr5OqA3LGzI1K+GMYvveRiGmF9/Y/ypUjpl/zs+gdOHRpdyPfu+mdBy9wzP1N9HI
	FbNI2rf/hd2LKqQujhEtHOq1KwGGvgkxbjsN5jhyCEb3PeEO0wY8DHAYEiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00rwua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso40985105ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921727; x=1778526527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4uUYe1yUyG7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=;
        b=O2uPFjEiyr448AkxQBNHGpVQ+IREsuDWN9Gna67/8xDeBfUCRIUr6vJsL3u6T85V0D
         l4BbE6/cJddxPOhSAOo2tljy/TN4Jijls0/FqzJvhgTCvA5NZvGPBSiLBn37LswKC7ZI
         hXITERC8Gwqav1Prw4hj+uBU+JvTWSiOvlWg4KPPnJu1DGE49liNGyxsbLQxy1bErrFw
         6s+IW9CwM7Los9q+3Pc92i6tTCkY4UVt806XeA7v3tltzgePUQbMaluuSEeV3hLqRGDD
         ofKCk5klRw0MZc7F1mkNdCcvcNnOn91YuPzzBa58B4fjlVP9yNlV1/3o5hXh2t1AGFy9
         dHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921727; x=1778526527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4uUYe1yUyG7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=;
        b=sPTwJd6Pui2SO2p279P+MN6I1VZphTJLS/Bb6hlEi7w76Qtv0Ih0ppwFBuxZE7xFJ5
         I0r6jtHOvSbjCzqj750ea3v6h6gz8BGPhZJU3w487Z2LnX8MvDv0hwkgNVbt0WgWoObp
         K7HCSLjDvTn0OR0C60Hw2/e44tDKv47N7BoT9hYiS36BaarwE4AC6tf9/5VuRkupd012
         CXWm+AisS3uZc/apki5/yNUhaiXaD95vRFFt/9snLM4CVeXzu2ifzcWzU/ihvDxsMTKi
         0ztybtq0/zOqmUQy/iEkFYWDiJN7Qqyt1R6gjMMJV4xThs4YZOfo3AoQ2h6K71wmDyQO
         THsg==
X-Gm-Message-State: AOJu0Yy5IB1UO16oFCmwE8eJjnS+ZwDBOy1bQdj74T8s6EQUkswEUT2h
	MYNxz0VYzRmtt6aIT9zf83fWdO2JBi1PoQFqG5HARYMJfU4+vGX+3x07pnRk/BJOofF7WaWK7yb
	cvpF9lc9UnoOaqvvUNavVSD0TyGRUQnTsxfgKYs65wFkKc/oh8fwpsMHDjU5BctVGBnsO
X-Gm-Gg: AeBDietJSxuM/G6URgOe5WGyO2zjtox2fmvlK9h5l5Ax0xYjK/YW4XUkzJAlQ3spG1D
	DXaztNVbrkZARVw3bpmVpgi9tED+fmXeVlmESR/74YtLQ6zDlSIT9nUmKyjvYuPfG2y4DyZeFCo
	l1BQBqUVXF4+bDLggRecp8DNLNZuSOfSCX+MGUTudp0Y3Vo4bnGx/DUQvGTXUS9Le7MgMMQPWso
	9j01rp/AbBXUT9lyezCqR/tXth+PR9qGb8ySIJKEZ/CSvzpShQI8dIA7kMcpHsLtWaeVADHDtWK
	xD2eJFdevvd2FsSvWfJsWV80+mIyPhg8qPMji6TNHrPcr7lRm3hAkvXvqyzIdpskOzXueRUNS1J
	0j3fFqryocDm6N9yUXGc9bEwD75zvLH0AfTsTDBRsGGk=
X-Received: by 2002:a17:902:9889:b0:2b4:5309:2c14 with SMTP id d9443c01a7336-2b9f260b785mr76828175ad.31.1777921726792;
        Mon, 04 May 2026 12:08:46 -0700 (PDT)
X-Received: by 2002:a17:902:9889:b0:2b4:5309:2c14 with SMTP id d9443c01a7336-2b9f260b785mr76827835ad.31.1777921726207;
        Mon, 04 May 2026 12:08:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0f67esm117642825ad.51.2026.05.04.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Mon,  4 May 2026 12:06:57 -0700
Message-ID: <20260504190751.61052-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
References: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f8eebf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=8lTVeMJbxB4f0FvlbnAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfX9W8BNQmmShTZ
 SvKjUrmZawMgJPa0WA1XYdpElsN0kAvQPdlgEH/l3Cn3T8BBmsjcl/3wDIHZ5CFbqiz/PYjkIY1
 U0/iMo+oinEjXqBX8fRLuLZok0XEYwSR0Y+BFraRNedW1+3qq7gXpvqHdfDT7qRK5JRmBr1fmXR
 MvsqOR+xSuQNVIkF2xbUH/VHcX21VKj7VH6/+3HdDgftgJUzh5snfK84zzHQ3MqxU2nKi1AIJ1m
 yJuZPaWpa1ttBFMqlreGVBjaZYLurXIsizlwXU3RkvMCppjN89AKP/ERhTH/Tq36myTHEDRIiaU
 /3EBrY/URkAbaQW1rT0MvMAC+O+V7LNmbYJiuoiGz6uEoftjbk0fqnD1sD6Gx/RpzQLW43Vtt9V
 5A36cU6EP9g8AVdZN8hK+Z9X11WLqBzDinGvxewOjOcX/nBBCnWA/foxQdo4i4lWr9+hJCjrQv9
 W6FibaXAwf1Lc5zu/1w==
X-Proofpoint-GUID: fZNb-N9LQV29MGU6rYCnnuhNkCwrwod-
X-Proofpoint-ORIG-GUID: fZNb-N9LQV29MGU6rYCnnuhNkCwrwod-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040175
X-Rspamd-Queue-Id: 122CE4C2FE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105805-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a329d20033d7..61c6b0e781ce 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1183,7 +1183,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 	}
 
-	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
+	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, 2 * PAGE_SIZE,
 							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
 							 gpu->vm, &a6xx_gpu->pwrup_reglist_bo,
 							 &a6xx_gpu->pwrup_reglist_iova);
-- 
2.54.0


