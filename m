Return-Path: <linux-arm-msm+bounces-88308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653ED0B009
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A163043A6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AAD363C6D;
	Fri,  9 Jan 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVFIK6Rx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wz57Kar8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3B330D27
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973061; cv=none; b=JNPcwNIvAMRx20iT0Rc65aHRfhk6Ra3y2xpOq23Vl+IsYJuDzLj0RCYIRldpst7O8TM7Jp4IpBFvQubfnRpvYNjV/tQHHLgT5M65NpU8QXhUZ63OWml9nn9ouE5Z01uggacos2kOhgCV4HbSyfEVgiqN5o2poBW9x+ElJ8z6mp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973061; c=relaxed/simple;
	bh=RPTAvK62U9/1tIbJmcIpwkLCVM2YGQ9f1veMPkaiL6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYayBbmmGuorrEzCkPHuezbAwJ4yN8GmfJ18mLK/hFZYwESaLuwZqQ7K/KnG/RqN5DUmvogCYe1PAJ0BzicmUQm25VpqaVhlgcLODgVCgp8uM0RNGMD2c4YE6nLolycyVAo9fHKOpqknfgaMBQO9pB/tkGcVms1upWLgupKebrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVFIK6Rx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wz57Kar8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609DaiVl1701990
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SAEpD8XcNSH
	gJQ50kIyVGYLQv6H2L3ra4OIlJaXAEGU=; b=MVFIK6RxLT81AVxh41DRBELaJ1t
	kh/I8CxUKF+aR5RQ80dLfWAY+g03aGidxxGBFAawYODmuEvICM9/mFMGdQlGKfvx
	j1p45cAakoZi6oCaf7NOj2KerqN837FXa72oe3Cb0IXLYs9XNsDrTXP+ClLTeFJb
	LPykG4gBADOOGuFUwh6VE4AyYuygt5LtK68JXFANBj+BR6EN51Bz0XaUuJWcy/Dw
	NsaejlzNIQsgiOr+N/UWpx70onn6uNwn+Usyl7qwJ3Ix1fvpY8N12/j2JPm7abcV
	wBuPMfuqoDpLLUoJ8HNv8RkIROMc0LLEdLLMrag1jgUYroj3ONEI81TBZ5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdabsyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:37:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5454bf50e0so2496214a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767973056; x=1768577856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAEpD8XcNSHgJQ50kIyVGYLQv6H2L3ra4OIlJaXAEGU=;
        b=Wz57Kar8ANcCfV90bY5wp5drJ8IP9jULQ0VOzbn7jEFcRlKlbkuIvwTnNvKyHv1Bc5
         p1LWuphld+1rxF24ecZMLxUeRvt339hPdwWuNtiLqG6x1Ls8TZrj40IWhho/T7GmRzg7
         TNaUDsUO4Tts/gwz/M3dy89gEFp3eCPrNXAxAfISMEUwc/aN9oNf2E3JYXeakhsoA7CD
         OFt94OD3tvJzVOXW0Rmypi9g8rMby1l+KrIcuCgvC8uZ31jOyUNzS1s/6PP+EMPHK2Wp
         Frj9BSxOYw0ZJof6mpMW0hdPfELsrtgOddYgQJpBRfGQzeYwdpqEkAJ8q6yeqmnGj/m0
         jCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973056; x=1768577856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SAEpD8XcNSHgJQ50kIyVGYLQv6H2L3ra4OIlJaXAEGU=;
        b=uhgnpC0EC98AIU/tiITJ4PVPAeDAHfOFkqSM8W2ny37UJ3yyDaQYDFGL23QGifW/QR
         RkLwhDT2bF1PRqa/t7HW+bX2rd9+X35jDLy/HImRViTTjyUV4aTr/TyYYZrzKWnLcQu8
         h47e0i4jVattqpe6ojTE/8PnO8McR05tlpj9UeUJYRKEafdUefwIX6K/xxaESoqt2YAp
         RBelo9Cd/75DhhBlWlaciNy6Q2Ef94CFo7Xn0JxVzKmp/52NdDfZVFAn0HAmLTGlJCEb
         M+M2UGYVna4rAP3VpsP4UMJTmsZPH+d+RDYiXRtsqJa04z5OuP9ThwCj6OnFDwHcekkB
         7pcw==
X-Forwarded-Encrypted: i=1; AJvYcCWYYkDQO4pYD8IcWlJHgcO1l4+NyZyyQxy3TGUFv+JtRUBV+za0YWuvlzJCP/Rkcn8AJQ4sjYPG93d+ABH4@vger.kernel.org
X-Gm-Message-State: AOJu0YylzE8SCRyR0Dp2O4uLBOnV6aUNFxxAO5qkUDvg1TWwGMQdtiG7
	kp4Bfqsry865JFP16lk/SE7HNN+MJoyJBCc6YM2O9bVJvqcVsmbefgnSjmYd9KtJOTpu6wHLXul
	AuE8cct5+LiNyKPvyhBBy4t0zJzoML2R2q7vHlVoxLxSrTj1VCFd8Rsfr4yRzNUMNPBXB
X-Gm-Gg: AY/fxX7ZgKGOICFZ84CRnGh0rXCBz6w/I74D/n3f/wnX58WFi50KkL/b4EYDNiaqFte
	p6sHuqfG/EwVrTAF0IEjkULVd5+qdqENWlAcsAqrE3F11z1Pz8X8WXNny6VKjiZ3SIqm7ZYG1nF
	9C5X0+bRIhe3BNUueVMPnofjkIAWOJtv2I5BKVSOfO8QeujTAJPZVovrvL9wk0V71tens+KlSxu
	GFW8ikg+KDkfWDN/pOh1mRA0NHaAd85SkMxJk2fIDysYc/y1fwWpMqUKX4eIRjExNLVlTNOqi0Y
	VI/YPqYNBgmW1U7BbRckOb228PaxygxkpO+w/muNXqzxgwv1R/J47hV/nJewYv5aiY48/wrKTVv
	SLcYAcfo2zmN+lZizum/U0wgbRz2Rbr0v2kiTD1iMrQxt2V3eyj3fo+LD
X-Received: by 2002:a05:6a20:7348:b0:366:14ac:e1e7 with SMTP id adf61e73a8af0-3898fa060b3mr9686728637.77.1767973055870;
        Fri, 09 Jan 2026 07:37:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyhFtNygsyffFcGSojAzXokOetFNGmXvND3h8FNk0KTgssj8XkMam1JS4ObRAuNfNTetg07w==
X-Received: by 2002:a05:6a20:7348:b0:366:14ac:e1e7 with SMTP id adf61e73a8af0-3898fa060b3mr9686697637.77.1767973055418;
        Fri, 09 Jan 2026 07:37:35 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d2932bsm11379570a12.21.2026.01.09.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:37:35 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
Date: Fri,  9 Jan 2026 07:37:28 -0800
Message-ID: <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=696120c0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WPuUNEN9mCnJaCDdw2kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: K8gG9BqCT1dBANNa2sQdsnYhxEuE5NlB
X-Proofpoint-GUID: K8gG9BqCT1dBANNa2sQdsnYhxEuE5NlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX09bks7KWNe/N
 zwUz0Zeg8HYBdnPnzkUNRtlc4ppfHmL7uTkhXECu90uPggG5vUsvD7GFXbPOzitMuEAUBRWBUns
 Yl25GadD30jruTs/Ac8FkZxc7KkQbB1Q2kkYCfXCrQ0+9cXUMxCSvPi5zf24jxZ8JLiBgf1/qtP
 of6Fru6aNtfq/MOPV5k1rkXgyqHhSA7Cr5It2f5sIHwTooPZU4YLu5mp38bGktNBryGScXqp1Np
 v+rZDPwtGYbJEEQNNBfL6HZJHOcnLbQGlvgP8bDMcHsAdhkLyP1eo2HwwWqYio9hRJaDY6+gJP0
 neaV6zTwSEaowNYr5UADAVJBnibiJzIDIu3BFQPLnkEwpAwLWIpKuPFzhA876SD4V0MJAmeCU64
 FtqSSN7lMmRTrNzbytPswObgB/j5zUPLnhUJ0WRewJZPVCMh2yQetVpc0WFd7tVU6h9b6WxI3Cn
 LNhCyAcVAVTGAgRYTRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090117

We actually need to set b26, just claiming to do so is not enough :-)

Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index ac9a95aab2fb..e15d654733ea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1691,7 +1691,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
-- 
2.52.0


