Return-Path: <linux-arm-msm+bounces-58427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C995BABBB9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 950883B3EEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE899274657;
	Mon, 19 May 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ig9y+3xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AEB26C39C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652332; cv=none; b=kB2Mq6s1kfENHgiaLF0iPDnbuWHzAk1s0i17zVIP6EplNqdcxNz4aiYIPxEkufjsmmzVkc6/7LmxbETsfCjN13SZF2sTuDUivQMe8IA5V2VMj39iVA4VyF6L1RIt//aJDQqBIxb9+fCsweuFAa/IoCElNdGNT5sls9F6sfdM37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652332; c=relaxed/simple;
	bh=h78fdNgru3raJgZ3WE0MgKX1Ryfd2RCOsMN6h6hFIo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZX+hH0M0ILIFpBG9mzJ9n6ECiDacoLy8YPEHLTsT37Z59uHllxL1sBfuVo6r6ldQ8wc7BvQ0UP2ovU656G00JNgZP/Mn8wmIeAlnUxhBsVtZQbUiCpVyhMym/QOIfgMD041kwhjI7BROJNaOyzfbBLW8lgTGeeD0AsSIDuA21ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ig9y+3xi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dQmh002040
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=ig9y+3xisTAGYAk6
	vzrFHWsJKR4tpkHn2DzOLoE6ImBbdkCTD+gi/Wu33ekx2QgrCFy8tD8krC0PeWjO
	JQiTJhrGJVDXBKd4ovWXhOu4IG8nwfMNdxUQPu4c3/Y+uuIO202cOBXzNYMv60eM
	sswb+dRXLsXkItnc6fy/pT9S3y/K7VactxYjLizylaZ8Zm/jfzJRh04PPUXucW8f
	cLeg6T7mjYHnEmnV5rfXXjOpFCt5zYrI5esrTFX/qP8AzOH0CoLepCJbujmFYvsB
	VbynHpFVuryKGJ88YN4KC1NDzaRlds0rnJgq1sSrtJCMj+hhALrrYb25HbC/5iFZ
	qjPiFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgdq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8b2d2fef5so52129996d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652326; x=1748257126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
        b=jTuI5avv4TTJiyaDlu792qCuLYF3W+TAl6mzPDtlQhctsdQFCVyuGOzTwBb+hXsSqt
         eBCdy2ANudGROIuFyZekT5SBHx15mQJQKTq8empHEtCXP5di7Ceo1Vf1UbtVRsRaM5U6
         NN2aWomeoWRu5bhPsl4Fu3vWKgs+VsmHNMvhp9PhQBd3W5zmoYzr875TYcBuE0XcLt5B
         2mdVR7+5UqRuXBNgvzV3U8n5/XG7HZUlhzqezF0hiNIbcCUxkM88AFbsHVC+Hbrmm5Mf
         ET+hU9mLI1O4ohG4agJ8kDsIKTd1RTnxv/ysbrxQQBFSkGCy3WQ5jhJ3Vam12Cwv8eCH
         BpYg==
X-Gm-Message-State: AOJu0YxonBmniBwvxAhfiRYsB6JTnSwjUDGQd3HlP+1V3WALKkQp0rUE
	tkSgbFV0HA6EFbt1JVaT2CvwDfDy0JR5ve4Q0WbjreM4FlNoHl/PfAn0pZQjb4nObuY/zKvx+zo
	nrORYHstDM7IxJkF2b8pEnCvjgUbJHIsFGxBz8RpxsiilLM+gxypENgXkX0n9npnjyZ9a
X-Gm-Gg: ASbGncsqH+Jmx9twsS84tVvoJulkNjdPtCqH8nCiaZFp4t3nDcLiu+ALcOBf1T0BB8w
	6Rplx1m47bAeSfYcsCIlo+mgCflQ5U9kGltJ6HfyRFHQGKfR6AxgwRCW8SfpdYqq3PJHXvwtnvv
	wfjyir6xJfF6BzJBMj91u1vLeAo+WMd3rnFjkeCZre1zN703/UQ2qC/dLpQPdikQf5ROOwJa0+N
	SemPzl0XrYatKmyf9qbIQ8SyBTcK8tGB+dJjg412p/2bo19H9/YEWYUpS3zvOUiIE8X9AC3u1s6
	BS/jKkjCADTPkuaLr6IHupHSe+05venShylQ/tkXJb5S6+tdo5nbYnKX5wKoT2mDZgGVDUgd2ot
	C7lojURrsZLcJ6Jp0gw6TyPZA
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id 6a1803df08f44-6f8b08f3e94mr177056376d6.41.1747652326285;
        Mon, 19 May 2025 03:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJcAEu48QCPI3xLKvGvX0WyaLZgXZDfjvKNGszvjWv3n2dnBqxwTrw/HMaVSNLmCnqB1f7XA==
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id 6a1803df08f44-6f8b08f3e94mr177056066d6.41.1747652325929;
        Mon, 19 May 2025 03:58:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Mon, 19 May 2025 13:58:32 +0300
Message-Id: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b0ee9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: eEKGBcJnLbHQM_yOKh-Xb02NhEhzw0iI
X-Proofpoint-GUID: eEKGBcJnLbHQM_yOKh-Xb02NhEhzw0iI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX9z833uPV7L/2
 Qe4emllkFQmZUET32tU9EzFPK9x5w+n+1gyFuByWzT2tExbNPW2bTLxfUUjnihKiIbpLSL7ZcCQ
 vWMHyZkEEs19XYU5fORglsPID291y00LjGSVvqwInRPAviMw/fqYDXC8N5PKkw5WxUH0xvTV637
 OWdSFxc8Zx516LbrTdvY53TFF1fMxYQLqOOGE5FjxlmOC0TqwZvu6/yh32XEa5oJj6CPS3I1jVm
 3P0WqavXqbFzVyHPo9ZTopk+HmVh/5e657AuNunTdHGmfPD9QXBrLJTU1/dRpA6N1Y0IcAuOV70
 riktFLvuBXNwM9Z+GUR79Po6EBK63qLKm+jA9sBy2f2up/YxlJL/kmXfNV5oA1norchFoefS3MC
 EF8CxsUR7gdu1VwPVzVWWmyIVFZcjjW5f5ov8n/9ob62mvkLQEYOV8N/M83ml/WMnc5oRbYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=636
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Fri, 25 Apr 2025 22:49:07 +0300, Dmitry Baryshkov wrote:
> It is easy to skip or ignore the fact that the default SSPP feature
> masks for SDM845+ don't include the SmartDMA bit (both during
> development and during the review stage).
> 
> Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
> SSPP feature masks to make it more explicit that using non-SmartDMA
> masks should not be an exception rather than the rule.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: enable SmartDMA on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a2343de0b6f
[2/5] drm/msm/dpu: enable SmartDMA on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8dcccd7a156f
[3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63958b80c2c5
[4/5] drm/msm/dpu: enable SmartDMA on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3f5e910b33a3
[5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/79af56964ee5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

