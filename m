Return-Path: <linux-arm-msm+bounces-38354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CF9D2AFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44846B28316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129941CF5F4;
	Tue, 19 Nov 2024 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZhY6RQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5D14A615
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033907; cv=none; b=lBd9cmPaNtdzLzTOKDGlodZ19TqPLng8P2QmoBYAe+io4JUSHrM6NnrU7C0og/rCN0f4rwUV/kepEotUWykl5bSKJXTsjM/r6OHTuYy0Gk0zSWgaw4YM2pwZRJ5L5BflLPYMU8VmRcLcEexxzS1DmQyzuu5sge7LMKFevvcGgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033907; c=relaxed/simple;
	bh=YUJmTJ4yWmPx7p65bou+VsPVCqbzrAvAHc1ZMWVVpPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQSX83M941QKwlY+DEfGvV+XGlEqdcIUaDVupBlRAWJwIf62hvy+euulEgAGrAfGhyJl1nnErPLAAbH21WgSF+WgYbsnXdBa+bZyWB4khc0PgYKdtlTJ/f9HW2c03kKlx+7vYLujxr7/wBWOCBq+lXr+ov9kf38D/z0DQeRvdRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZhY6RQp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7j3GK031105
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 16:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCX2FC0uA5UURirp6iZwWYlTD76/xPsOUSdYUmbgDx0=; b=XZhY6RQpaiv3NVWh
	yB8RWuzddyKFJqW94f9ahd+BZCEJp3Q0/hf+w2SIelyVEEau+h0+CrqPhqYa8zGI
	oKKZSUVAHUXiNK01A1ZOO1vz45DxiL0TOGvrHFTxJzjZuRmvDX7GbqgE+Paq8D50
	+NrjJW486G9H2zGxOFTsew8rePN85FFp1e009thMZplMwqjnCNR52Z1eWPV8+d+i
	WUai8GVao1XCrakEz/KzgWRhYyNh7/q4X2ZkAZ6yhw51kbAr/bVxC8qiET+iZ5/B
	0iL+6JtB+6ZCv26oeJCDpLlgRCbHrvl5/2wxw6GCnMuqE5LTl3/yFM29CbGDJbdI
	qABXyw==
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y9343w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 16:31:43 +0000 (GMT)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e3890bc5ec6so4714747276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 08:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732033903; x=1732638703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCX2FC0uA5UURirp6iZwWYlTD76/xPsOUSdYUmbgDx0=;
        b=BhrCxVUsIwITJeQsZrNSPAubmH/SXdofSiDbv+hmc3/k2of4ufsyEOkKisqn6wWtvq
         vwP0XJyBLkN63eCWdL6N0F8q9GtNGwHffgTrvOUIPM8QX6z8VkiQHCyDnsU2UfIFehrY
         kK6ZoBOB7ybndFtKpCTGoZxtgjlkfA+LobYIFXxd/5z/zsJE1hjZbUoFja70EMyvax+m
         h+UXoivfAiK/Q39SYg05w5jelauBqnqPav7DWTGBq9bDYgYa90KXMO46DVsCZjFgMfrU
         0FRdTapitwUshuBuOXTB0O87TJI2JOr7lXYKQdBNAPF9XX40V7TgPzMmqqhL9dFypnVX
         NRvA==
X-Forwarded-Encrypted: i=1; AJvYcCW+wOkZSA6aVOlHOM6s7fKbg0jaFyFjCI+HY2U+gQ1vUFj3Sqjv2NnKUzalTCGVHXq4AVsEhAdsWyxzZKkz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5sue0eD8jPglHT5SzcQfkwOrgcwDrw2RJudws4aUNPIZpZB2B
	1HKuyK1j4BDtr+IRhCuuM7XwEDrFCH4cki4HnjSTAcbPcLagT8qD/25nosh1aEIVM871Q0EypD4
	ae7IGC7qVvove26RcBOSj2zViuuyDnUsulBsIZ1PnrAHTsqtlZRyRVsZQSLKq4Z3BeqTKQ6BmM5
	n+eyX0qZy9YcIp87mpe+XlZD1tYpNHwsomzh3hhUw=
X-Received: by 2002:a05:6902:c09:b0:e28:ee2b:34fa with SMTP id 3f1490d57ef6-e3825be2196mr16598616276.0.1732033901821;
        Tue, 19 Nov 2024 08:31:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtFkQK4RfZ8dCB1KjME9j8wZMJgTpHRHPYqkJstt8GrFJQHblJESaJIY3zrk0a0tM3r0A6Obo2akW3hgMJ4Ls=
X-Received: by 2002:a05:6902:c09:b0:e28:ee2b:34fa with SMTP id
 3f1490d57ef6-e3825be2196mr16598586276.0.1732033901526; Tue, 19 Nov 2024
 08:31:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
 <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
 <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com> <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
In-Reply-To: <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 19 Nov 2024 10:31:30 -0600
Message-ID: <CADLxj5SvwUxgkXOrayyuJo-Jw7LQnV4vOoFW93unPwxfoMpMNQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: TzdVc8JIx67ETxClHD46un2UD7dMuaMO
X-Proofpoint-ORIG-GUID: TzdVc8JIx67ETxClHD46un2UD7dMuaMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190123

On Tue, Nov 12, 2024 at 3:15=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 11/11/2024 8:38 PM, Rob Clark wrote:
> > On Sun, Nov 10, 2024 at 9:31=E2=80=AFAM Bjorn Andersson
> > <bjorn.andersson@oss.qualcomm.com> wrote:
> >>
> >> Support for per-process page tables requires the SMMU aparture to be
> >> setup such that the GPU can make updates with the SMMU. On some target=
s
> >> this is done statically in firmware, on others it's expected to be
> >> requested in runtime by the driver, through a SCM call.
> >>
> >> One place where configuration is expected to be done dynamically is th=
e
> >> QCS6490 rb3gen2.
> >>
> >> The downstream driver does this unconditioanlly on any A6xx and newer,
> >
> > nit, s/unconditioanlly/unconditionally/
> >
> >> so follow suite and make the call.
> >>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> >
> >
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.c
> >> index 076be0473eb5..75f5367e73ca 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct=
 msm_gpu *gpu,
> >>
> >>  int adreno_hw_init(struct msm_gpu *gpu)
> >>  {
>
> SCM calls into TZ can block for a very long time (seconds). It depends
> on concurrent activities from other drivers like crypto for eg:. So we
> should not do this in the gpu wake up path.
>
> Practically, gpu probe is the better place to do this.
>

Thanks for your feedback, Akhil!

I've yet to see SCM calls take that long, but we don't want that in
the wakeup path, so I have no concerns about moving this call to probe
time if that works.
Based on conversation with Rob I merged the two patches through the
qcom-soc tree, so they are expected to show up in v6.13-rc1.

Let's follow up with a patch that moves the call, once -rc1 is out.
That said, I don't have any means currently to test the retention part...

Thanks,
Bjorn

