Return-Path: <linux-arm-msm+bounces-100445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BeNBiLhxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:57:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79534A8A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74FA930B4601
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66154395D80;
	Fri, 27 Mar 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7nzaB4A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIEA7Mt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3202C38F930
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640904; cv=none; b=Q+5ymno9v4QWEu2FAgIwzINxKLLxaS5ZfFUaSyaE1UDixonCA1wsvcIwlYinVhdFhAF5RVzIX91WD/OsXxlZJihnmlq2wJCE1hnwpL9tv2Iu4UPeR5PxTWrk0SdTad92QCUEbmHB43KRBaoxaaw+TDHXGTNx9z7SuLmxhWaGk/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640904; c=relaxed/simple;
	bh=X4HnFpXI6GoOQLiUbjBqVrmNj1Qsc7DkkhAPLLYxW8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XN0ZovktkXGSAW5H7QE8atS5bVjQbLnkafi9UWhRJN8x0sCdI2744lbW4wWYUvkisCXyoFT5krSQ+qOtA1+RKp9v4zRtdK8EA4kNG8OztOoQJsmFCWWZBfDDyYggetb39ob41BAwx7cnAWuaHgCPDV6b8YQRa3Zw+QH4F6rosAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7nzaB4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIEA7Mt6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2agR1458388
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1QLyXRj27MaMY6pBuRQygN0tKb2Zs4NcBhaEDM99mg=; b=d7nzaB4AbDk0Rzpa
	JRoDoBNm30Oj/luOHWNJZNL2r+wCc2h8OBNx30pUOScmTR59RxS/ZzcEbUJZzSEe
	aaWRt+PWdd4hWAMSa+Ioo1towrlWsj/jgd+sn60Qxqr79Sr/DX4u1NcMJ3JGG+5V
	O3/d7m2cbOwx2ix5ZYbGjiPtW6draey/gAbPy2WADocNzMP49gH2wjtHmUSwNLbT
	agm9/uRBBkgreGZ1ssyUZGf1VirDWlbBhOUbOE/4UHStbLBO+dnKzhVZgqSUsAkk
	6MC8OnAxso7Dny3P8w9ZXNMOkbv4bW52KzcsGsrbgiTdj+xOQp5jCW3hMPg+Z9Ta
	FSpDZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m5y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c40acso17352671cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640901; x=1775245701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1QLyXRj27MaMY6pBuRQygN0tKb2Zs4NcBhaEDM99mg=;
        b=iIEA7Mt62p9cKV6LUBHVQlYS8WbzGGi/6Fodifqu2J8q3IGdT+ar54zCFEId1Ts8ZG
         PUvmqBv/IR9xK6tuRHtmcK6bdjjX1D751hCzVtu5OiwGFSmZuZdEchWgONEHKN3TrYU7
         cH/h9rv72KdleF6MRJQBbgYdlRurzX8QIar1/obGNxDxf0FagDYrvzgaTWC25z7rAqd/
         Qb3kXQY/0+GqdEE260fFIJwyDNzBMx3L2ElSL6E4kLEMlvpBYyDy3yKIqtQc4q1AhJtu
         1jhI7f3aih5B5pel/yN71tlzElgHN56r4IblQA6ambjwwk9kowHwGJ9n3U41FfHU7BjT
         NUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640901; x=1775245701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1QLyXRj27MaMY6pBuRQygN0tKb2Zs4NcBhaEDM99mg=;
        b=ZaTl5hy1hJld0UGYBp1/n0fnyLUNe8/XHAtap3OjMuE+qz6fxPIFo4bA6NyG150WDO
         7nwjnx9wqglm97J8neLRk0ErzgzcA7N4Nbats0bJJfkWJr2ye8hJqrLWMyxVjqVBAv4y
         4c3WrGuqfW0N/Q3CqjAt3yLI5/6PZXsm/7UufD3rA1n6YJ0dBYAjNl8gJ04zfJTM/Gj4
         FZ73Slw/zu+wnOdciAeXoYYIt2RqxKaqNwcY7Xo6NqPg3q80scbWqvMWzjZFdt7yvyiJ
         NsEtbFBj6trgmnVRGkd5EcWO+QjuHae5gwM2G+u8KvdzL7RyDuh90/2AQuCz2noFPFpf
         B0kQ==
X-Gm-Message-State: AOJu0YxLMTjTxjwwQCwicLqJM6ClMuSCahY+CspTKdiRRZF2I9fYkKoi
	nSZch1W9QdI4hxTkG33W5L66W1wGrGDGrIx1lGXtjva3gr/xe3qXh0BtXQ+yoJxiZF3vwpNYkRO
	f1PuEza9piNdXFnBs3vl7lXtGnqn0DrQtlgPkhWFOmzKf7pzXeXGMpqG+6l3WI8cVzDgF
X-Gm-Gg: ATEYQzyHVlRDHbs0tvi+mtdkunWKpOn59bviw5Fj5yw2aln89nnclDZTLwqvPU213FL
	Yvtms1PTGN8QvjQdznqgUVVuydiwVl02DExXOOKFELDtNm1FZDAsSmyoktgagwqGm/W/waJmzIk
	D0V22eyXMPta6KAwjzSJJsqeqKeBpMA3NgQhZadw8elRJpxj7E7XgzPNyP0ELkCmIVJXjrkx/yi
	qzLBmUq28Bzo1WRmRbyXqKDCfCbOm2hRkFvFSk1CT0GkIx14aYOVEVIy9QzCZOuqAStFrSjJXUp
	Ds1bmk/sZ6icV5kEZgo8WH6UOpMlrLHd615RWnZSMNcskZ6EViQX4tow2uddUDVc0GIshDZ9h2j
	sSHj7J8WWptMlFKNwMvYWcpyrLcb50rHonJVXhhC/EKyMvY36rwnMoSaN+/tq5bXhM7DtJfQJy+
	2S97y6NNst70z5yheHynUL9bjWFECTJzvJ
X-Received: by 2002:a05:622a:1919:b0:50b:5258:28da with SMTP id d75a77b69052e-50ba37d16c0mr50594841cf.5.1774640901543;
        Fri, 27 Mar 2026 12:48:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1919:b0:50b:5258:28da with SMTP id d75a77b69052e-50ba37d16c0mr50594291cf.5.1774640900974;
        Fri, 27 Mar 2026 12:48:20 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/dsi/phy: fix hardware revision
Date: Fri, 27 Mar 2026 21:47:51 +0200
Message-ID: <177463970858.3488980.8156966621888309065.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226122958.22555-1-mitltlatltl@gmail.com>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6df06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=aYwKvdfGOulTxFBWdnYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Q4zHQGU2ivHd44cBbafeZnskQ7pwcpNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX+SoglvDkZ3bP
 M6eeoy7+6XDqfFfFqGGC1E3WrGYHjQhctWfL6Sr7LMIHntfLiDTu0srQZKW30d5yOLIfVX+QMfP
 irZhMlur7HK6ISgOZFNQvwDD7UZ0zyxaj4GlXczAB9R/ttQt+6NnYdSoMC1XXdYn/6v7Xuo5kyJ
 xipDQpGnOHkdXkOcVkhZDbelRYOxG980YFCliyPVS1wOKN42trtErkT9Gj7fZ9DWTMaUwPeeyHI
 G5WFP7+RZVn80l26kgqeddqR2V3mTeFegkSuO1g1GDFn0YN5CyGNj9mEaJBhoGlJpr4YDQHfqG1
 qFdtjy+ZNqrWGExMDd29grs2+NbkHx7/R3MSYzf3FOLMC/RrJ8qtFZlvOrhUIx7a8SExTvW1Fex
 9LDGc6ewni1+fTFmCDFoSGygZ9vzhWCOqaw7JxzfEy6ih1wQDpkZ7zqPRs+/jyE4dEK76TNGrVl
 2HgVQDuCAXTkmTsZNbg==
X-Proofpoint-ORIG-GUID: Q4zHQGU2ivHd44cBbafeZnskQ7pwcpNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100445-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC79534A8A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Feb 2026 20:29:56 +0800, Pengyu Luo wrote:
> This series fixes hardware revision for DSI PHY. No functional change.
> 
> Pengyu Luo (2):
>   drm/msm/dsi/phy: fix hardware version
>   drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to
>     DSI_PHY_7NM_QUIRK_V4_0
> 
> [...]

Applied to msm-next, thanks!

[2/2] drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to DSI_PHY_7NM_QUIRK_V4_0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/18417122d6a4

Best regards,
-- 
With best wishes
Dmitry



