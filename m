Return-Path: <linux-arm-msm+bounces-55732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02023A9D122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2BAD9A30DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D947D215F72;
	Fri, 25 Apr 2025 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6TV0Lox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D589217647
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608041; cv=none; b=a2nYlOv0mhO9wCAXKR0ih2Qh8uiQn/8xMZypUohLFZR4Ri7KPPksiQhPgaEk4X0v+YlvD0T/GOvDJv0O2+42rm7YPjLnAz+wLAZVy+UNh3arnZqgW+y1Sc0dGHv02CszFhdcfATB0sSJLIIgbrqQc8Uc+HuCm/IzIN+fdey1Cqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608041; c=relaxed/simple;
	bh=PptaosrMKIkszF9oY5swFi4VZ1gvZMuR9i7Ep8CGyvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a96yC0ZQ34RISjQVGvmxN5ojDXZJ7iUrFgwRU1svxzPCIbffTfLgjChxiup/FVnn5iW0Jg78hm1zeZUULAuKjut9XU39VoD6kmCmToCq1skEQUpqfailH5dbKrlyt0T0FVSi3Ej7GiP7NOsgVEq86JF7X/tkO7BTY8Wpqx86qLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6TV0Lox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwB2000447
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YJbYuN2gJ/vLBVO+7ggEakIk
	yWo8fYN/fU1HKulgY6I=; b=S6TV0LoxN9Hg9UrUvaO+4Ci803NRAtkxU5Vfo6rY
	80rUfOdGhN1a9MfOxX87Am9700jbKmaBiTQTkA1uXadpqDCPb5QEgrdrERyRE9NB
	SMy3ULr6tezjisWlIiL+16hKKbxqPD2abNFbLi2n0s0qarzJsOVtpMgVB+TsjBmP
	4Lqc0a3p1Dv3ErRpy7pLTi/qBB/3XEOo8nL08zhNKHi1+sYkCMvjvrsQrmCbjH+5
	Uv5t3NKkQuino53SK5SE95mkEhprXs2L6YY+bsOxQu4TmkFNHeXYezhbVFYIfcxe
	lW7ZjJZR1vPgn0+QNr1XW8EFcyOOOYZiLYqXy3nUMGBABw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j1dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:07:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so797828185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608037; x=1746212837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJbYuN2gJ/vLBVO+7ggEakIkyWo8fYN/fU1HKulgY6I=;
        b=rmdSGLn/Qjgt9k4hvriwfi+eWMBd2h5yhJbgaBVT9onmgsm2qEZrWo6002gJ7R/jIl
         /6XaGsHZyI8NFrjLSGmppMb+NQcjiezSDXU04tyrlVbXaAso+RQdXP7Mm0+d70KzyT41
         HxAzbre+r2mcEXLnb/U7/1sGcf9dtv8Uj9sEwsT2k1pW/23Y3XM2eIKFXpdxN5YZ1Zew
         azFocDlIRtzVxz7vmp2i5nHgspDt87Wrs9lJsLsK8OC7raRyMXQkjKheJZKLVnchshY/
         uIY3AemHO2vYEssMs7T9gqS5bzo/4ovaLGc4bX26Y9TF+ISxLvAJ2Gqid6eORKUnvYyd
         rL0g==
X-Forwarded-Encrypted: i=1; AJvYcCUPZdCoTKJRZaK5svzD7lcAflRCVyjT4pY8wQEgNdwJERo6Ent3CMxeOg0r62ea+ncHpRnvlTUicC5g9Cks@vger.kernel.org
X-Gm-Message-State: AOJu0YwaU1aFaEmM0sAjfHeDIp3PjUHITyd+Z62eEv+8YtJ1RxoV/skB
	oIarDVwSKTemSTcRwapeN/jLJBNt90hz+RiUP3rfkJs040ywcptCrFpUVwfZrQ5xHtlOZ8V+2Ce
	bQ9fkgsJIjTXWLvbGgLg0UdHnO0xiWzzzMrdrx+mnhbgBTIDPjeFul0m6EZ0+0rQ3jy6Mb4Ka
X-Gm-Gg: ASbGncvn1zOBxmogEs/jTrQtFrmQ074blSEMZcjSLd0g8Xhhb7cxRzgimDPt+AJt0zv
	P0dgEr7lSOV5CKiskxR3eLBq94Ygtyey5pNH4z6jgjj82C5+i5E/rAJjFudQh/u4YzbRcsQpkyB
	whNQThnbXdcw/ZfU4OtgxjbAu0+YF+PpjiUys2ctlChdVcwy1RFr+vm0XL9zoA0spXyoNUa4Xdd
	bpazvpUtACD20T3QKPKWME98LZk2sAvIML2ZZOyD3doB5BY7ZicNCJnc0A08N3isgH0okugC3XZ
	q5qns1U3Zic5Px5fVLs7k2OmkVDuaxkH2aXK3M8sinbAcTnaTlGwqNe832LaRr9A0z0HPiagAlg
	=
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr115701385a.58.1745608036734;
        Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfsamSTL36MZXKs1A+xdmyxqbS+5Cgy4qJPLYj7dmxRhp/lz8rumoOXUYE90g5yOpO1ztFkQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr115698685a.58.1745608036439;
        Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83b5sm712379e87.245.2025.04.25.12.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:07:15 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:07:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Message-ID: <zb5fqcnersry6blohozlzc3f2it2q6ypi4xei3z2fvzp5ogszj@mj23wsa64nqi>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-5-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-5-alex.vinarskis@gmail.com>
X-Proofpoint-ORIG-GUID: VS33-Jq136Gcu0swNktmpW9P78BTqXwD
X-Proofpoint-GUID: VS33-Jq136Gcu0swNktmpW9P78BTqXwD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX0h5IZGz3nmCA /6F1PosIFQzZCW30MvnaglTF8gPtHlnyd7tenMLTiOmlW+sT/JMGhk+6G0Jue10UUPtZbMsspr6 13JFlp7WOCmYuGymv7L86D0/N255mTTiwoeOzd5O648T97yKJJvTVvIDHASU+43kOopku6LgxfK
 k7SebPg6VGzD4Gcz0OdMROnZ8Zngtw+mnQpyF6is5EhJqwU1SyR+ev/sAKQv7Wwrhxx3J2WFaTp Pk7XKc5bzUIeF6+FuuzVRtis+V8RokNUPat/6vLEx5r1uc6h74dduPS+DHJhGOsdT0euOGln1IX VaopmTH4MT8cBuloEJjwx34SnmUFvqwvA0qN5nsqxx6wKY/5493618jJfxedEVcCv+EM83T6J/R
 yCv1PAm2AHMAuGYSRzOvIyXJoxHUiQLtxaBT1/c8TzVLBDS5IEinBbxMtS2WXtld8rBhky/Q
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bdd66 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GOLd5LZXdg2kOnOye_0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Thu, Apr 17, 2025 at 04:10:35AM +0200, Aleksandrs Vinarskis wrote:
> DisplayPort requires per-segment link training when LTTPR are switched
> to non-transparent mode, starting with LTTPR closest to the source.
> Only when each segment is trained individually, source can link train
> to sink.
> 
> Implement per-segment link traning when LTTPR(s) are detected, to
> support external docking stations. On higher level, changes are:
> 
> * Pass phy being trained down to all required helpers
> * Run CR, EQ link training per phy
> * Set voltage swing, pre-emphasis levels per phy
> 
> This ensures successful link training both when connected directly to
> the monitor (single LTTPR onboard most X1E laptops) and via the docking
> station (at least two LTTPRs).
> 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>  1 file changed, 89 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

