Return-Path: <linux-arm-msm+bounces-61286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E98AD9E04
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 17:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41A703B90E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126E03FB31;
	Sat, 14 Jun 2025 15:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1ul7Tvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8301FDA
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914160; cv=none; b=gPzuZGjoO1qlXQnW1LQJX/OaNOn9MYMJwGae3hrd0qAy5tanORcBg+Y51G5Za0ALEPVdLavUYzTQo1wIsnsJzIunSGLkWxGY9rJ6HZz01F20Axvhuro6VNPm91oK0s80zQcNC3KNv1h+I34SzwOyauCa0qYaqKPoZqhJ/qHGb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914160; c=relaxed/simple;
	bh=4bHOjfvL35CBAyAAuwF4+Lt9w8pvbI5ki9X27hppBWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrJlQeiqvdu+nIOCUaWfCnrEF0y7A8xXfbo15tNgnve2MOTEKgQeHtKO0E4gPNgIuZJgGa6BUMiYjN533ha1oOsT5Kzsb6qnzL0L0kl043cZ3PWm+zbh2se7FXa5KNrPDYdd+8/o9yCcfQfkUA0Ohx193ihoDMUNWwaOtqEv7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1ul7Tvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EEs1vK001340
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 15:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=; b=Q1
	ul7Tvvci9pwDP6eqpn0ZWDcQi81QcBBQjKEnCFPg42/fjAQC01+JsgFmESWvMVTH
	OQyzUQFc72gTAmdMvF18jlqocvbFA7YpHHajMeDOqcRjsw+Un0wJlIU4WyVfYFak
	pjM5wqnMzrWp1hPdO7ruHtz+bCnJ/ic/2fd0um7+Yn3ZBmQY8VLmaRwKBsFUx9Uk
	cyIOq3gYuXCreiqThbw86zsqmehfEq0uPuSVfYqlDa9dnH/urjoJRnXydKAoNW7F
	1eHfEgcd1Mkw59nDfB9c3hkggDSFb427VZbi+NMRXKzq/f9K8G8s19vsZBNkBPrT
	l4HykaVbpkw+Nl94d2MQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8ppr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 15:15:51 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4066ff1aab8so2956129b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 08:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749914150; x=1750518950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=;
        b=p0lFzfwsTBibyeuzw6QSoSYwvsYu+icfLcqDZ7wl0iDD0fAvZTMHqSuBMair1vIrWX
         XOUfIvmKTVCVfisxd/yorYLzhWboswwCrHAVQUjtRdKcHz5utp2r7RBBZsJ9bD89UtQC
         txN4Ei01AKZ/l//ZJpnkifRvLTKykz3rIjYxORyEwEeFwp3mXlV60935W61DbHuCS4iU
         tFJdT7p/mHBtUWEjx2NENvgGYx2KsJa4FOa2ZhDTM8Zjl7d4sDu7l218otop1EFMvkT3
         U5zx8UI2G9912Nly6IAe9/NsuyJppWKwPoIQ2cNdNW2IIegdKrbn0nOMw5z9449yNYrR
         sweQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWdeAAYpyD8btERWIEaSYd2fvYPwQmeAl20eOU23ApEXqy72PsjK0N1ER5rWDoTuAxNv6lruhFhLbeBXF0@vger.kernel.org
X-Gm-Message-State: AOJu0YxxeZrs7w4SpVIw2YAdZ4TDBWjx2Gk0gNbzJJEaQ7CBB1lXp1Jd
	2GBbzA3mLOEp/T3rcvfVz54l2RCfOqv2zXMlGuHfrQaMdGEkcTGZdbcD+u9E8ve1+HQkyZGzqjj
	uzJS4yIbfoSoZQdhLY1dT1UWorYgz/ddp1LveqEz46Q1sId/03KhpiSLjcmHLqd/rYrTLr+yW8j
	qGTCbu2vKScjh9ss3Wn9umPjiZe1JvJ7I7HBJJbh2p/4A=
X-Gm-Gg: ASbGncuQbDR/xmh2bv5Zl03jCqCJ9PaRRQSX2KL0DneLoJ5EMCLaGpEnh3Zo3shKjBZ
	+qOIxIrjjNXGDGlEUcpfN8ARRcv/2knhjf6Xs+H80+3vwMvojDyy98FShjuDkuiaxEvAoo9pvJM
	lPPY2haCQE7jtYPek+cCjrfR3SvTOd7nMuzRg=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id 5614622812f47-40a7c13a8b6mr2349818b6e.8.1749914150372;
        Sat, 14 Jun 2025 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMbwblJsD/pMG2FwsGL3eZLj5yHznrNfIA7Pmr/sCExEn3egU7d2pTqU9/DLMoErYH02zZS3uNIJzPax6X90w=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id
 5614622812f47-40a7c13a8b6mr2349807b6e.8.1749914150052; Sat, 14 Jun 2025
 08:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org> <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
In-Reply-To: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 08:15:39 -0700
X-Gm-Features: AX0GCFtPk9tPdVg_KDSrMIfi7f7qfSkV0Cof0fPtpyMc67NsnsiF1f7jX-9Eurs
Message-ID: <CACSVV03_GEuFWHPDB3gGm+Mq9uR8QJ1HabKcKVxnQjagf65v=w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEyOCBTYWx0ZWRfX6b/Cjl6jZMYu
 V275zQwDoNqhtUNFR1VZCZRwdCqtxr5lPO2NrwQglxMzNdQ+sNtDjpbLnRrS0p3mLQbxdbRl4U3
 6fopXa0fozsQE3nREUIv1z5+937RvyxyL0dimzMOEVIUOy8j8np08zmKyGljuw/3FjOU845ovmV
 cRd4z6B2InCJ1vJN6GgLySpEuNLCnljrLJDARA9njlSJb87b3WA/aNN67qTeNRUjVH8HnEVqWgm
 BUD1erkgjjyMyjWgqlzw8kZz9keKTq4N82+RFEp0JyOCKLA7sHlXCKT1KIVkL5utEUM0OOV1Qp9
 iYNQRbb8/t1hhpZ79iPF7YC805DeAneTWCldU8qO3Pgw99wmIqroDOKFVCIKuiNmF2UcWtgQwR6
 uzy/kCNGksKRECu7fhbVXuvnNa7ANp/wWIur7udkPRmhL0VJYaT5Vh8d2Te5b/iSEW9XXO4L
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684d9227 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=uiBUSSwroAowxIVJ74EA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: k-QHV6yo0jT5lPb5oXpbWcB5nQl-wjVj
X-Proofpoint-GUID: k-QHV6yo0jT5lPb5oXpbWcB5nQl-wjVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=703 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140128

On Fri, Jun 13, 2025 at 12:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/13/25 4:57 PM, Alexey Klimov wrote:
> > On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> >> We want to WARN_ON() if info is NULL.
> >>
> >> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before =
bind")
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> >
> > Apart from tag problem it is usually a good idea to add relevant people=
 in
> > c/c. Especially when you fix the reported bug.
>
> with Alexey's concerns addressed:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Oops, forgot the reported-by.. but replying with the tag on list is
enough, it will be picked up when I apply the patch

BR,
-R

