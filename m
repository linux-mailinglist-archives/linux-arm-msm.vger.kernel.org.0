Return-Path: <linux-arm-msm+bounces-58110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B27AB8D67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 346424E5258
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9960041C63;
	Thu, 15 May 2025 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvgXaPuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C13AD51
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329343; cv=none; b=boNkGoCs6fd19t8uioTArYMZkeJxyH4wKmI/TZoQOfund0kv0Yo+PlN9Bq/cupLIhLmS3fStAHBsJj6IMjUkj8VozHvh7xt0rlIZelVQV90UVS/l6NEpmy5HUnBIgW78Kll3xlryK1Ebcz2QHXkxuhp3WqBNL5Hsp4fZKCniO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329343; c=relaxed/simple;
	bh=55SK5wfR4YKXAw/XE6DuxQuUo+6pm+9ZOj068bV6+Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm7cyflg4HF6iRr8pYEllCnb/9J1RIQv0DNZA7Ddw55Dm9HJd0piGVl87SuDTllUsXH0TjQOW4DZPDjVLdl97c3zmC4swuSjboU+g1875GH/7H9/YzEPHQWRFVKFPYWnw24RaZC7CKr+IGrjkC4awAcOGmLRqnjJHvXX2yN6oVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvgXaPuC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBFZ032609
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5fr5L04Jvh0L/+a57XtjIN1m
	EM6WQNUjAaFjioBMZNo=; b=SvgXaPuCTs3wDo9dlvBivEkH1Y+z1XI1YdbwV5CA
	vNKugsrGqNDqaFLpNYiwe0c6Xweww5MgON8Gw/LXV5XEkFDM/GM54ofNSrJw7zu3
	HufKmIYJNR+MOCVhF/R+CT+xMNvDuEamtcDkLc9TKneC6JvGtfbjR0stUPatw4sL
	SJ/dpJrOtJ54W9QshS1H3yobMaaxl9RBWrcMCfIp3sC+BoHNQ8lCSkytbYlE6hEu
	4U7SWezwFm9KfcozgU06KHkkjRFssaHL9o3fx7pNltiC8QvusFki3PHFExG82wk0
	PnrfGl71gQmrW+AbnMpTv3f1Ic1g5G+XHTwWp7z2AfAUBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxyse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:15:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22fba2426f5so10817535ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 10:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329339; x=1747934139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fr5L04Jvh0L/+a57XtjIN1mEM6WQNUjAaFjioBMZNo=;
        b=MpTBXUpqVEqdcMn5+36cgMCQ+i/5zk4YZFQiAkY1H54B/mlQ9FKF9pW8Sg8pplqzR4
         lQ8HyqjShUpPEZ1yADHWuekQT7rrbWGuAWokZLvSHZq3e1SQWXyEZ95/v6LTFV9GfhjV
         Bx7oHMishPRVW0cb9vEPrgxnBw3dXBBZqGJctwr3+skxfqnPQ7DE+01frt2ge2FxAuPF
         tdJBW+URQ7SPDruHyqPVOc5EOxwCkpn3/jyVTP6CWJ8JFCti5QjmuRCBJ83aq1Opx/U2
         dDPABYlODR9EvsSE6evLuWqZ3bdNb/G03HC0pFbd/p6tbnUAgrxouovUU+LnZ8YlNjka
         aa4w==
X-Forwarded-Encrypted: i=1; AJvYcCWW3mRaAlyGe7uYnrJa1oI1FYKa6+gRkyZQxPFNaAPtzR1arvkmwYOZ9h4pDosAamuPLlpAEnGLBscnhZHI@vger.kernel.org
X-Gm-Message-State: AOJu0YxSEHpsB7lSr6rojDsCqbKnYK7ZNxi2eK8fJRMIBVswi3BWHMMo
	j/4kh1LHCGQWmW/AuPo2iaTfvVAad03+UNOwysIZT7k1Er/fFDB1BL4V16jLUT+TMNS5RbZhYg2
	oipqYVYo4YJnUDI3WEQbTkg7OjdqEIDBvlOhQ5x4DldDIuN60m95SEKPPRoB1QSYJoAiC0cog57
	4a0pnFlCm27rMaUlAzxzmLWxxngl8Ew7yjvBsfKyebIvo=
X-Gm-Gg: ASbGnctiO2u4OBFUBw7/sLDX5sbEoXC+Isr78evTQG7uWLAxEWxWFLCxYcZP8158Evh
	T7HG1is7jRWO4PNil+DR0xXYV2gN4etd/OyH44KJfDAzse/Uuubd821XiUtDc8zeTDm412TUQrk
	cijiqlqb0=
X-Received: by 2002:a17:902:c40f:b0:22f:c568:e691 with SMTP id d9443c01a7336-231d43b5ed7mr3651685ad.21.1747329339288;
        Thu, 15 May 2025 10:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyQ1lJRTrt0ixFwqDSorfu+vOM+xntr4u295e30D5QXpP221Ji0k3vGu3cCZvb1L1HAwi1LOMYcxCv1yN+h2Q=
X-Received: by 2002:a17:902:c40f:b0:22f:c568:e691 with SMTP id
 d9443c01a7336-231d43b5ed7mr3651465ad.21.1747329338912; Thu, 15 May 2025
 10:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com> <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com> <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
 <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
In-Reply-To: <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 May 2025 20:15:27 +0300
X-Gm-Features: AX0GCFt-coIgQ4I7VsKEP66vB_wjYiKvOLkHEJKM4dcQPFJlqXqrj14tgrxzUJg
Message-ID: <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: o6VXYwTfWQaon_gzwuzPRLcfhJNH371z
X-Proofpoint-ORIG-GUID: o6VXYwTfWQaon_gzwuzPRLcfhJNH371z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3MCBTYWx0ZWRfX6el9/3CkxILz
 MBQSxH1IVjJY7Zzr39ONu/j8Z96Z9Qnt538kWk5I9RLcMAQXQ+YJ7rkpEIOYN6JisuxiRYDOZ82
 8ZtSoBPKikGpcRDp8OJyPDm8E3maAx4dWoKeeM7eOhE9H7Rjx6nacAoSBLcdcNuvj0fC6ZW+VY8
 T4/C3JbOlEXLppQtFUeZnr6FmZfOh+bY9HyrncWCrUVDBiYoJvqm716QzzHJO7PhcFFHjmtaWzY
 ASD2GrjzoKGb7NUq+q/jFBGGKUdDSJXQfXybiu+D73GTaG8xPD4y1hZ6A6l8CCQvEZMhwjT5+Kl
 MwiDEziFCYo3wVREGMoiv6FAluWXfYnwLc+aTo3Fw5caOxhP6g0wJMrEwOaAuvICZ9nxEhFMYLA
 xV4ZFK1pEsuZlNzjse6/sZvcCgSE9CiZCkNFp5Z5HsDVp9a2oHRWEziGZatqZjTOK8b1rgG4
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6826213c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=2fJ-P6yaMz0-y6Gko3wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150170

On Thu, 15 May 2025 at 19:36, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
> > On 15/05/2025 19:18, Konrad Dybcio wrote:
> >> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
> >>> On 14/05/2025 23:05, Konrad Dybcio wrote:
> >>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> >>>>>> swizzling) is what we want on this platform (and others with a UBWC
> >>>>>> 1.0 encoder).
> >>>>>>
> >>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> >>>>>> bits, as they weren't consumed on this platform).
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
> >>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> >>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
> >>>>>> --- a/drivers/soc/qcom/ubwc_config.c
> >>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
> >>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
> >>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
> >>>>>>        .ubwc_enc_version = UBWC_1_0,
> >>>>>>        .ubwc_dec_version = UBWC_3_0,
> >>>>>> -    .ubwc_swizzle = 1,
> >>>>>> +    .ubwc_swizzle = 7,
> >>>>>>        .highest_bank_bit = 14,
> >>>>>>    };
> >>>>>
> >>>>> Add a comment and squash into the patch 1.
> >>>>
> >>>> I don't think that's a good idea, plus this series should be merged
> >>>> together anyway
> >>>
> >>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
> >>>
> >>> - MDSS: offset HBB by 13 (patch 2)
> >>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
> >>> - get a handle (patch 4)
> >>> - resolve / simplify (patches 5-10, not squashed)
> >>> - fix sm6125 (patch 13)
> >>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
> >>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
> >>
> >> Does this bring any functional benefit? This series is unfun to remix
> >
> > I know the pain.
> >
> > The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.
>
> HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
> should be good enough (tm) - I scanned through the values in the driver
> and couldn't find anything wrong just by eye

Well. What is the ubwc_swizzle value used for SDM845? I think it
should be 6 according to a6xx_gpu.c and 0 according to msm_mdss.c.
Yes, higher bits are most likely ignored. Still, we'd better have one
correct value.

>
> I realize this sounds funny, but all in all I don't think it's worth the
> effort just for that one
>
> Konrad



-- 
With best wishes
Dmitry

