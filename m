Return-Path: <linux-arm-msm+bounces-72118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CEB4445F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 19:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36D957BF004
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 17:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3201C3115B1;
	Thu,  4 Sep 2025 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5RlK2Nt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB6C30CDBE
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757006954; cv=none; b=G34xwqJloOy7BwMBeJXI9KY8//IY2SqHtQSSusTi3IL0r6DxpaDQRaExuTsjtZ5GT9bfWp8ardYeNpfSgxT6Ba1S4Wqbik543BRMuAXtO2PbrLfc6WlpZlWobYZoMuY6CzC4zL5/x3F9Db2GsWhnPmk1tbDSx1qur1Lh1NPWP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757006954; c=relaxed/simple;
	bh=sKw+JRVO+jLTA1DhEs+zSD72Vo3LuWS+u/Z7Q8acX9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdHAYOhuF8aQnunOXuRSKaP6fJ9wymQ4CVXIsKdYZO0ER89Duz+NuE82P8q2hgXEbJFWzWWlqvmj84tcYW50pcthdv++DVWoLXez7gskjI7OBLk8rm9wHXk+JIg5VPgkd+PxZZM2fZYJqkYjpEjISCX+to/4RqO7HLfft9dXILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5RlK2Nt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8Tj031806
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 17:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4HSqJJKUJgHemW3ItHKzJuo91NgrXy7FmK7UmSqX0Y=; b=o5RlK2NtZhXh/To8
	HGTDqprDWTCdb3Uv0MLTr9XBz7AGVAOGsMBa924oyD28uRFBUguVz47Vw36w3aQ9
	GEjEmkSjFoNUz8vWNaaN2GFLT+kVidJB5ovdUoJQTMLGEbELElXfhtzCnjKzW8t5
	eCHjmdOIi5TyquYgcWdoVOGtCLXq6VghiCmoVz/grGWRXb8GolZV4V7AxMWSjOpB
	mIEzF43zpojRWkMG8fSqPZio0EAYteIbnGbx+aj04Rvnc3M7j9CfKA9gxMkyiUBg
	VqPICSnwK8LUk6M0aU4qGt0+CUj8wo8vC9cr6cZDFsZdCiWUa1ajlxo8EXoah1qo
	mGi45Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw08dw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:29:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3118ab93aso22207181cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757006950; x=1757611750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4HSqJJKUJgHemW3ItHKzJuo91NgrXy7FmK7UmSqX0Y=;
        b=s3Ptz+ALvuGO/b7LE37fFV14Gq+ISsKe2hfdNE2h9DnspN7zNfENA/J3DaRSM9sSYq
         hYsavvPuY/eP/3Cq4dtiLaYGQrazKnwrF/ZunRwPEXacdM6Qb6ONBkUZHwX5dcAdVG7T
         yx1wj6BFMFK5oykVB3mbtgeFLYebDvta97Z4kNDh7zPgqNFKx0Sv9sFic1SWraeCmJOO
         iqJAKLhLzJ7KF9A7YIGGHQVRBtzJqNOqMj2WX2xghWXuaSCdQ725z39n1wKhTyLP8LRP
         hflQuTrjp36Y0QrhGGRevY6AUcMf5ODO1Br+E0pSKlTU6e1U//G/RuefMJycIv41C8eP
         O6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV5eRgEYzWBIgYJ2Y4tNiHBXKQ11APM93R0n/nIET8G0q8Y5g0bPThyDHH3rFQP69BA+1lgaYyjc0UO4PDv@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnNbWP/aERZCN5OkSaYEnfddOssjp4ZhMApqqs4tLdzEuFWi6
	CGS/H0+aCjQtqzzhhcvco0IcK7SVARUf6Ppi0zMuRucm5w9LJnaiwRt7uERrUulKUvWDz28orFe
	4WY8IdoZeK59IxAbb/4QtsoxwzGymnQNL4o4pb6SYudy57gdFkmQQojgCtAA4+X4sJelnuNeSEE
	2e
X-Gm-Gg: ASbGncvf8tgBEqR7pk+QojOOdsRoX48Uepe9Sj7Uoep7TrJnglYoTVPav+PAhwIwc+2
	/rRqwJgB6+ZZH1TwOHbMYJ5Cu+PZCj+6YBsxsg0haTO64Z/gDQ3gsiRhYcs98N8eaKvF5CXQv5l
	xlCL34EC9WNx/CI08j/ZL57BbBFVsfb/+iet5kjN11dpEnZRaVpXnfLDLXVj0JcQLNjEMyV/mKM
	0kee7E7T61eMG7t9H4PJanSkEWfaB6to869eGfKtm679CWwBfn8WvPF/ixjsvpCAalIW7JOcGli
	kxFhgw7QMQJH4CgDEO7F13ywYspsnM0Br/yQHq6BONJoByheeKBh2y6ffJtbvYx48lyhLPgxMLp
	O3DoHdL/9NHoIIcnSGNfBHM+cs5XGL8utLD0j71+qncM4IqSccutO
X-Received: by 2002:a05:622a:4e:b0:4b2:fbbb:cd47 with SMTP id d75a77b69052e-4b31dd1ffe2mr257449511cf.79.1757006949720;
        Thu, 04 Sep 2025 10:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNSvNTXAJpiFlDTiLw2UNIBHVhJ1puSDzs/X0PalMSkD4/kVf+SzhWlkUHsBE8oJ71Jpu99g==
X-Received: by 2002:a05:622a:4e:b0:4b2:fbbb:cd47 with SMTP id d75a77b69052e-4b31dd1ffe2mr257449121cf.79.1757006949162;
        Thu, 04 Sep 2025 10:29:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90454sm16554751fa.18.2025.09.04.10.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 10:29:07 -0700 (PDT)
Date: Thu, 4 Sep 2025 20:29:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 12/13] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <hzkvl7zyuq2fsavp2butdvbfykpzw5lz4f2eg2rzu4hgbxxq4j@tmoxnq2t5koq>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
 <xcq25wmw7roelcmoljypn3ozt7kqvylgibz2cloxghaeurcwvs@jjay7hton6md>
 <CABymUCNXVfZyhCbkiqzJ-K2zGe=bofD82OD20d-CG+a-KkgN5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNXVfZyhCbkiqzJ-K2zGe=bofD82OD20d-CG+a-KkgN5Q@mail.gmail.com>
X-Proofpoint-GUID: IUTFZdTxHBi5CjEZk4kE--yUpM3YcfqU
X-Proofpoint-ORIG-GUID: IUTFZdTxHBi5CjEZk4kE--yUpM3YcfqU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX85ZPTZiSOJdB
 MhBuPvjmCqWAvAW/CqcNIe0v+3eF75VLKxRjtf+OnLW7trsPgHoTDVEvfZLu1x3RgVh+myfgeot
 9YksNiuRNBUrTm4aSJwOgy0Vd26I8fdiEcrVQASnO11Fee8PggRm+3Ha9IiwJfyR9j34RTM/ecQ
 /3ChoginnIKfJM8Qh7yvdGCJpfaST0u4VcYFuFQ5sR8dXr74Pla64y862fVCX4F4/mvZpO1sxjI
 GRB/43qDvpJ788PKlpgt30qwwDL80IcOGEUnRyak151Ff8xjnZ513YFayy7xaPhaJuH2Fq2sv/y
 /IwnNgTeMeb2Z7YijUPBwHPiD4LG+SmSHiX5vXHgJZA2ftlBrkpQlAX6j86KpTolu5xBAcddK9q
 95OpGQXT
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b9cc67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oA6wIzCi5S8-5R6LlW4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Fri, Sep 05, 2025 at 12:09:52AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月3日周三 17:39写道：
> >
> > On Tue, Aug 19, 2025 at 09:31:06AM +0800, Jun Nie wrote:
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen is futher handled by two
> > > pipes if its width exceeds a limit for a single pipe.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > I've run several CI workloads. This is the first commit which breaks IGT
> > tests. See https://gitlab.freedesktop.org/drm/msm/-/pipelines/1503075
> 
> Thanks for the work! I did test locally with all my patch set on sm8650 and
> did not reproduce the issue. The baseline is not aligned with msm-next-lumag
> yet because I need to port my platform patches to it. I will do it tomorrow.
>  Do you think this issue is related to difference of sm8650 and sm8350?
> Regarding all failure cases are write back related.

First of all, It's not only about SM8350. Tests also fail on SC7180.

Second, it's not about write back. I see various test failures. Please
rerun the test suite with virtual planes being disabled on SM8650 HDK.

-- 
With best wishes
Dmitry

