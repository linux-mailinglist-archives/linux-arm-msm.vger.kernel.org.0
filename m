Return-Path: <linux-arm-msm+bounces-56712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA2AA87D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3AA27A26D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542701F2BAB;
	Sun,  4 May 2025 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTA9X857"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3F1DEFC8
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375229; cv=none; b=tnDanSiI1Ip0FXLSqhrN87bwPgzQq8xmaTtEFYhDj+n5Xz8xjBI05jCHVbeJTsBcNGalkxwtGOlDqLtuVppPPnk2+mhSW85eGRjXQhMu0g4U/peevVarT2o20jcAq2xRhqHY1+4AqC9un0tw2t50lxbmKuR6+JkA0QaqBUIxhic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375229; c=relaxed/simple;
	bh=ZCNOXoTXOG1O0zfWSUHeh8dN/NL3V1HIw6cRpzkclyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fmRqgoHvCgm1JETiE+GGdIFqcZ48eS+s7CY2WcZuJ2/7r3U9NG4wyQaX7IeKw5tyq5ww1lkbQDNmBCXKtAK86Fe9gXF545ljkDe3v1WwlFulCL0sp7L9MtXaqmEwZDU1OUTm4nDMh9J5VPIKUt8kcUM9NMrfPsvzY56MkCyCmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTA9X857; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FtjtX031973
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=kTA9X857O4qZsmJA
	6y2rNIy9JrJ8GrF81eNoH58AnwJNaWPIBB1Q3dMByyCJNeOL5Sma4DJ9GG+g1Gnr
	cBIl1ZyZVs1j1guQmlWPODmhrfUmF+vYHk4rUkSWGFPa4FtPciVsHmRztZrAs1iq
	nMdNbqpxt0qbZLJ4SCwHx0YOOPeuIw7pgrcGgRhZy8GZAb2jRJGiomKmUNxmZWsi
	jLH0R20DZ/Zt+t/mAooQzIZ1I99RlVqfdYmhhT0Dy3IPcC8kaSBg8vkQSBs8VbvX
	4Ap1lb/kMycBkqrAZrI8WDIVxHFqaSltHWRdennRthYKtBrNwHW19tYiXPT8SGYh
	OhLqLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5a6e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-48cc1907229so45837521cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375225; x=1746980025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
        b=l3XhRrfhI/UrsoaD5RbVydu+IUM/v633oPVom1ggUM3B6zsmJb992ZWK7lbdqwb+bz
         Dwr5GvStWsynA8hSmmuIUGx3VDAFR6243bmNRFkCUumQ/hk3c2cLB4yrvA/JaQ6fKv99
         t1YWFL2NnoiYttoXFwi/GX2n+tqX+kh0vn24oZbRW8ojNiy4F/WywQgM4dWJPm6+mtZf
         O/JOkzWbvvn5qLIO3dLV4IC70sYJtG0NKPMCtN8Kea2AO7PneqNnZ6gZj0r2AWvAMucP
         UcS0HYRV99sLu4wgAnz1BhMd/zRNSDVT3cAwaXovFLewLoXX7xyizRm4lp/WTWR5E2bs
         DLaQ==
X-Gm-Message-State: AOJu0YyhHxzDi01k6ZjnNwzOJhnHI8gU1+Osv8QkQIpcS/UzNwOfB4DC
	uhi9HIf5Mv1i7HiJwsA9CrmZD07e3EgjZfzTxgAneAz5ngGKLZHt8C2887hrgtGJcupXEdLLG8b
	E5TSh40/LIeXPCDgqw866H/NfBxmTTNGGMy0mwuObgnSLhVvCEKc3u/l5RcPz9AIR
X-Gm-Gg: ASbGncvbJGynbGyWed6IfW9MsyiIU0J+zIii7JMm+CmO8HtLkQBR/OVsSGdFr0mcigX
	9GHFwACdkyHRru5SFuzjYn/Q1yTbMJiviehbd9aWzz2ygwIXhzTee0nbhVG2xrMcJyLTCTAUUBG
	KRgTBHfYpsofZTHQHa1xlTRStkcD/hxHnIzhnU674RoHcYsXrpQymnBsDRn/pEbLdqQNrNSmx6Q
	f0+vhSqI8YkxxtpmHptZFyz8wmxnpBevsRiaNjts3hB5zmrmwBWIPjxftqNpuJkfw22O+i55vNt
	JazpT8Yaw/VxZkaNjDmMP2C7LrPIvASvARad9R06AJwzAvo4KyuIqMHZ9wpB/XNQXcv1oHXP48e
	BaQNozRJuHSCn4lRHABUKt1Mv
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id d75a77b69052e-48e0115d91amr64683981cf.33.1746375225658;
        Sun, 04 May 2025 09:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEodRLHLfsZWcNzptQvg9NDQY4Nk8aia4aLV5WiHHWopfrsacCXqFhOTDBmUdTbnXE8qdnXrw==
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id d75a77b69052e-48e0115d91amr64683641cf.33.1746375225283;
        Sun, 04 May 2025 09:13:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Sun,  4 May 2025 19:13:26 +0300
Message-Id: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: flSCBOjoUtWJHb5XbjZDBf8YySmGLxnJ
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6817923a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: flSCBOjoUtWJHb5XbjZDBf8YySmGLxnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX4Hw4t0RMAKn4
 QLgTarE3iD9+/HDxdgAy8WNo8ZoeBqeFSOpL5rkHa4m8lGb9HI6FiLAeS313TmI8kMW+3wLngO1
 dnYyFgUZBKIHimz5ZU1u3mx+JnXea+/XVxlpckjJhaNn6DzYB4LAMv28JmbnfclIZ5c18K0lkQR
 IaxOF72BQwPR6wYBjpTaM9vdhfVHiSCvbCdXzkYUasSZypXSxjx/lIeasZIXmBODcSR57aJ+0O8
 hDPAs4rscGMOM2phMeSgPIF62L2Yunty9ZZaKDZ40uhBKi3HqbDdrVYYZNtdO9LEDTA4kmcwzs2
 EkMBZYJjsOszgj4vw8pyUXpvuFH6Sf1Emct7pMUr+OXIR3dApR61vPANWtRApJeyJnTiTeSCDZn
 uoNqsi9oKOrKbHMqtkhCHxmOO3F9HxPFpyLFQW8DAZ47O9z6KRYiUhml3XHlFT8AsrlwuguH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=583 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

