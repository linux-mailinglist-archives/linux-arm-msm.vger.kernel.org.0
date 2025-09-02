Return-Path: <linux-arm-msm+bounces-71655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87904B409E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 17:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E141BA0108
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69633314B82;
	Tue,  2 Sep 2025 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luJbMLL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60262D5C8B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828654; cv=none; b=lWe+hAugT3CxiMUOlSlo3h9+u1PiOwca3RbQob6tHW7uZL66R9PKMTpoalv1Bw4RbgolFGTmBxTjMrBdZQv+nv6e/mfAi9xcFsXY99yiI2t7TG8QWBtBEhUy2lFona3ogxiPTVw+GkW2MdYDTlK5Az7uMngK35u4bpeuh6ZpkTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828654; c=relaxed/simple;
	bh=f8dB89FFFlQppC9iKhRxh/NQhmzMIkdFH6xcmmT4U3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H849hYT/ReSm+oZ0nH2I6OdlhKV4EHrkPW3ZQAPyEXo55wOqDfYJnwlDcdVF1BuUxujAMG1z1iJPJNkT2/t2N0evAWjW2ENirTJmGngANCsnps9y+3+8KUZdxewtJEfFnYHLWK7V9P3r6O64m9J0a/r+25P9u0ExTsyGQan0J2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luJbMLL4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqGah010185
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 15:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=TREnSWpfAdWrhmOtMgkCSdJYlV1MbSdoxyYVKxg6HYw=; b=lu
	JbMLL47Ftx9g9Db4lqWD1qbEVabosqCPd+0Qr/JAi6TePDUU/GKbTLq894xe1JKX
	WOHsWP+nlfxuW3JHRyx6lbHkNeRejs7DbeZmIo4te8gF/spHIzDCCoH2biGydJnT
	CMjIbhLCbdCCu+j9H5VDPslhQ0AXdVx3AVVlRVwSv+DGX/UhTo4/+Rd9FnlNVAe2
	5XUo2komMoOHF3B6orvdFkAW0kDOc3pkTQnO32l0EvBc0WWjmEsC7wYYHmGRmnKq
	5OrDadHtvq05ukhB++lLHUr9wQuEsC5fHr3EwzAr5PFA4kqs84gy76CI8sQD9ghw
	5LLP0Lwf52ooGiIRulDA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eghg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 15:57:31 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-435de5ccae6so5405331b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 08:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828651; x=1757433451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TREnSWpfAdWrhmOtMgkCSdJYlV1MbSdoxyYVKxg6HYw=;
        b=nCnOeU9Rzd+02rjp3HQsaPPm/Emnna5dhZxaxAPTOIroADgYxTlSGGgaRvbNrqM4Nc
         PIK7jAIgKB7jjn/5FlHzXqCB55pd1+qC3srxQxHXHi92ZDZHtkrc+zutpYtNyJhfCYjV
         ObFWxpYEIXi5Xs/Oov4hL7J+m5g2HbGQ5lKkm921qRXK/+4s7kuIQ3MFlQNfaq69TGv1
         l2CQ4g6EZTGIyIldMPd4ey4vDdrM2KtgdqOLULghzPGM07Tk2D2htEFHCI/mMsn1+VRF
         0BDh+PN2OFAIlWEwIIwWXQWSY3J3DDgfvRPKHgKPCxR42dHb0ncORt+iX0KunTPCsuTP
         Ed1w==
X-Forwarded-Encrypted: i=1; AJvYcCVD/6uJINmVbRPRLed9Mr5NGfPUQwjjDK9nGShNw3vDuE7EsdAyCz0xJ1MT9DijNBoH9KVfIi1xGVoWrsnB@vger.kernel.org
X-Gm-Message-State: AOJu0YzJZ6ks/dhLfM+5PlZmEqqGd8LoSLtRJtEL1ZUf3KQIigR0p+0H
	1rUxVVKEz0H8rU6d7L/HJCYQxfmgwt9RvBaDAOLw4fkWnCzh0BTKmKIoWtRBS9adIsrHZjlXc9T
	ibzZDAuzotOqXl/kaA17iIwpo1n3wvPjwqxgvQMqg53NyrhWZhKXd+1HofbbNIVC48YA6fXrw+L
	T7GMEWrtiTggjRugtJjpTszndvPqz8PQ7/zlRRIwVpxCo=
X-Gm-Gg: ASbGnctK96WVlPR1b4Ueixj7FaTN8LA+Siby62JrkzHXOYZSgZF2DvXIv7hmbNZN47I
	iTeQw56FW337oN4dR9T4mg+eOku+G+1RfRbuPvBque7ByevZTUlLiZlWYTiDTwNdTQvuvDtcDe/
	pfctCarwHh4VMEypip5bv6Xn7bMZTrFVA31MYKamg8u2RP8xppAfTf
X-Received: by 2002:a05:6808:152b:b0:437:b10d:3b46 with SMTP id 5614622812f47-437f7de1519mr5637665b6e.30.1756828650778;
        Tue, 02 Sep 2025 08:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYnnQDfuHV9n/jWre+x5H5L+i6EA8p0glanc4jK3wzaEOdW1w8zr1QPsTQkge73XmH1NyXNbBSBZwJ1vwOsTc=
X-Received: by 2002:a05:6808:152b:b0:437:b10d:3b46 with SMTP id
 5614622812f47-437f7de1519mr5637653b6e.30.1756828650361; Tue, 02 Sep 2025
 08:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com> <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
In-Reply-To: <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 08:57:19 -0700
X-Gm-Features: Ac12FXzQPwDIUy_DiVh-kEO71EFonDrLLU22HZlou8nVFBUUUe2guiMPv6umOuA
Message-ID: <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 3r6ogXwQtmmFboKC-FvSwfpyUi9edeg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX3De3fJH+L9wj
 ciHVgEuOrp8247/q91nnYJx64QIvbZ1u/G0m1nAHxmALAjpFEV1MMM9j7xQ9BClZx8FyHmzHhbJ
 uocNps5CKOoSQLgNUhLXG561MdBi/G2rEOLoN9CxzZyefUdHRgj8zubpEwtkl3kkBZf1tT6DaCo
 r+APjbd6BwdBRPdjL4KLodhKzQFVPAUl8eA4SSEFgD0tJirYy8+QgEQIgNE6b+nOPK717bu4zI/
 du9eNQlWX81pXGaeiYJwsJg5pAsIqfkIHWwSP6nXx6/u2vPtH3/ElckM2HgcvLB84Ckb/x9wyQ5
 eJdzNpxqfKlsACOHtlSgYgE17Ca3Ajo0JW3SnSI2xgRbZbOpw6Z4wO9x7GmNbg6Rfdy/AkJtqGK
 aLhMK2x7
X-Proofpoint-ORIG-GUID: 3r6ogXwQtmmFboKC-FvSwfpyUi9edeg0
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b713eb cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=ycJl_s5THFxdJBPSnQsA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Tue, Sep 2, 2025 at 5:33=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> > It is not obvious why we can skip error checking of
> > dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c
> > index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc06=
5b5c4c49e2bfd5dc7 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gm=
u)
> >               u32 val;
> >
> >               freq =3D gmu->gpu_freqs[i];
> > +             /* This is unlikely to fail because we are passing back a=
 known freq */
>
> This could probably mention that known =3D=3D we just retrieved it a coup=
le
> function calls above, but I suppose the reader can come up with such
> conclusions

Also, I think s/unlikely/not expected/ ?  "Unlikely" implies that it
could still happen..

BR,
-R

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

