Return-Path: <linux-arm-msm+bounces-85991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6643CD24E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 02:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 729A530213DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 01:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A24F212D7C;
	Sat, 20 Dec 2025 01:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOEAPg9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLedfgJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC99154BE2
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 01:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193435; cv=none; b=SoEVY4tPC8WS8jpSLgyeYTAYLZ05F52YKsN8bBre07jqg0fPt8ESzA6AbZMiG9uHv5wU7iSbpRTZsLVNelMgMlz4L+RQBO1nR9uRSArdSgohKSdXsI9WekMErayyvvwoZABJ3PjDPPvaegLwEvsnHNWPuIC0iwXIZCeAxtgbIYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193435; c=relaxed/simple;
	bh=9/g3xrQYqQvMPlJ3kljgRwjOKDCzoA+fL+6rYoa+mko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfnkzJbZouD40C1mrB6fV1IcA3pOiw1yWfPMMsNM8rAy8SFWN7WIvopPkNZ2oxJWYvAm4GItvo5SxkNWMiYHWwFxO3VhtCgEiOOY1fh+WDXwkm1B5dvCvoJcdNRyaGbDooe1SUFm3qIDvUfFy5+b90h7RVCpos7yoqdJ9FLCfk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOEAPg9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLedfgJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK0Jb3H2088422
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 01:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQVWVrHY06xpDTJeqnmla272fk+k3T3T7nR1IYSIQ+A=; b=ZOEAPg9uvWoAc6zD
	vwVU5YPIyLm1EYCApJLdXWtkZ5X8fx4t7nlgibTJk+ec+ZQLfC7dW6lPXewbYHWC
	MnzJFXvEN7C7bwMiGlQNieI7+r19eVqy6WiFXGTXSDIuNY9ZOT4AuNYfLyf0V6lj
	lQZkB4IvruG3W7jX8vCmXL1xzWz3JD2TTwW/716yO5GvIxqy9aw8nwfP80Vu0ru/
	quRdnKuBe5j5vrkJhLuptrgx3axvVlBN4NpZERqvaJ4ikToHOLgIQnLZoEXE2qHi
	1n03gGpUAzSc6RN6aFcEgSrMH3WTTIJ4dB5lHiuoj7WKbGys9AXyWgKyHa7WMS2s
	X0y4vA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5h5kr3j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 01:17:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1b7293e7so74842921cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766193431; x=1766798231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IQVWVrHY06xpDTJeqnmla272fk+k3T3T7nR1IYSIQ+A=;
        b=eLedfgJDrCtf85m4QP5EL8P7Q88DrvggWROpLIaAGQt/HUo/v/53FN2+0NKjgK07jG
         zE/FdUdAMfD+IMJWpyCL8JdEWmau0yjOjenYcx7vUnx0omPJUn5Vryy53Ey5eTI4RbGG
         K4R844j0nEv+MMNg9bxkpXZ5dsHgNHA3wzD258IuUNBtjd/c0oNIR5J9+QoAs6BhwJ8s
         E3id+l0bpmcW3ldvJipOXKZ8cID4sDDtG0CTIubgDdUfPCKbnPBIbv7ZHWAAlZjXYkFJ
         ksoo9JAMuIKXPOFNm4RGShZKq1cGZnSKWXjOYDvKqNpFDGrqWlJ6jYsmy/Dpw2gyfjcm
         mGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766193431; x=1766798231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQVWVrHY06xpDTJeqnmla272fk+k3T3T7nR1IYSIQ+A=;
        b=ioyRcFD/vzuKnVa+cksvbcBkLMtbPTP8VymAI8ntASqxD28ShCDpCrgTuUAjJGy/bj
         T/lLF/1Xl43QSy425ptJTi7ixyCZFq7W5bya6z/zINYTfVbUKkmxYMmsPr43LleKUiTT
         rAyWHt398nmBHWGiR2Jy8SztwhTM6V3LxhgPvX8uDN2q6WbiTs9eQ4dAdq5Nknnos3Gw
         yku2gAg+VEQ6OUzx0mGcInuA+m9fHPPeNimqkFfyMRIZRGl8Kl+H4KOC+eptDiV9tGg2
         kWpSYqa2XLGhncD9MGVOirqP7giY1tRhCV/6tza7IcbWdU1VTvlVSWSf/Ain4M2jEPfV
         oRBA==
X-Forwarded-Encrypted: i=1; AJvYcCUVkxfZftdh7hWFaJpBV1xgKfm+GH7YoLbzXBpXNgvs9LGMWD+wYM9zT3jLfypGVBbSMFGN7u9xHXYBLgIp@vger.kernel.org
X-Gm-Message-State: AOJu0YxucQc9taLjcpWSj4u3/qV4iCRatV5X4eDpAbSLWzZJve4TqTcv
	15DC5onYMWVm4ShtcERGdan+V28GKEPVvV9/XbwVVvaFm2QCet3lFk2mM8tDZeuKeIrwkobcZv6
	Vi6g0crj1UMgqM/M15x4gtM+hcJyFZYwoykaJZi2nkEmSe3749NNi2I36EmfBfODWnPos003T2H
	2r
X-Gm-Gg: AY/fxX7mYDoSLMEg2wEM9+3Y6saisGcSUllU/73wDMW5xaUo0D2HZdjnnuRdCrqCgcd
	P5J90W8Lj+mJtTvM9EMypXsTfZYpFbKzTrBHvr+6A6PgKFUrAso8GZtLS2HGrAA6aF+13LYbFfi
	IJ9Rm06KfCTPvI2HxOknWnhONCRFwcLacHLfxXS4vnKzq5ylFopa+ZaarXrhcvL/Mh5twlT/mbF
	9SZ23eD9Af/cLgJvAsH4aN4FjMw4TsV4cQvId1mfZoqJQKg8Vczo0O0BOPCU3/9CuEhQvGY8Fmn
	GgquIkAAjwznwthX8gNrJpS/JThlr5kvlpLRnWms+iNr6s7L0yqwNITUXxleMGFf9BkvVSPwaHs
	gjgIfofN2gu+MKhf7u9Jj0qfvqpxL0RFwLASGVJtbRLhw+AgoDTOFGLLHufqtq2yxdaQjL/6Hly
	NHj2BN5VqnHwugjvepv1fD+Fg=
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr68412481cf.84.1766193431293;
        Fri, 19 Dec 2025 17:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNyb2GSLwsAw/pta9mYsYp5q9qFNHtpu2mBuIG6LjDM9jgAmqavK8BCblWkeR+YYk0Gz8yig==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr68412201cf.84.1766193430807;
        Fri, 19 Dec 2025 17:17:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861ffffsm1102998e87.81.2025.12.19.17.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 17:17:08 -0800 (PST)
Date: Sat, 20 Dec 2025 03:17:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb"
Message-ID: <jhdl6aqh7cbb4t6uqhafxcgn4efxn3tzqo7haivle6olkpmvxf@yafk363lady4>
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com>
 <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
 <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
 <f902ebd4-4b4a-47c3-afd7-2018facdaad6@oss.qualcomm.com>
 <e2eg3zk2sc7pzzlybf6wlauw7fsks3oe6jy3wvbxkgicbo3s2g@tks2pgigtbza>
 <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com>
 <CAO9ioeVBk0CLGcdUdbixVGwGfheOaVwX=i39JovHa740mO4kRg@mail.gmail.com>
 <CACr-zFA0vkn_a=a1LNn_rqrSsKPUsuf+jt8_a3MsHg8Ao30qOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACr-zFA0vkn_a=a1LNn_rqrSsKPUsuf+jt8_a3MsHg8Ao30qOg@mail.gmail.com>
X-Proofpoint-GUID: 6Hd--hB8hEj5-8W54d8Y1xhrgO4bD1A0
X-Proofpoint-ORIG-GUID: 6Hd--hB8hEj5-8W54d8Y1xhrgO4bD1A0
X-Authority-Analysis: v=2.4 cv=CNYnnBrD c=1 sm=1 tr=0 ts=6945f918 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cfdu8vdO5y-rE6AAjPwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDAwOCBTYWx0ZWRfXxs5ef78C8Wrg
 YAwRcyY/fSJ3xhRBtF9ziafq1YRnCWwLh7gjbzE3kGLEAwj963M0OuM9ar/i0JdmIXzoJrlUu+D
 SKAKdv5hr6CtbWaMjhuUStY9SOPLmwm8zZE55N9edOt0EYDPetfmI0xkpue+DF5muqojNEEfqXn
 9z5QQw5oUrOfAIlWcgRyjxPeFKAwFvJ1Amq6C75mP8vqFzBjS2uv2my0+K55QaDSiNyJpyYileF
 8tXcEOz7NM4q7+95U6TKFmQaU8JGG0aJvNRuj2RqcirZdFtQX9uVCAfOjjV8k1FkkSdazowTSRq
 +20ntYzIQceQDjivp7kUvP47xIBuuZ6M8CVTQHsKP80HEBJizTgdNIKuV2xyOR3rP1F0kTDgtoL
 dT2zE+Hbkh8QlL1vHbTOIVEz6j4QklAibGcaWGphCQB7bBS9ms7E822cfx/qj9kT9SF5vUoktz0
 9BGvb2dUaTHRb1qFr8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200008

On Fri, Dec 19, 2025 at 08:50:58PM +0000, Christopher Obbard wrote:
> Hi Dmitry, Konrad,
> 
> On Thu, 18 Dec 2025 at 13:33, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, 18 Dec 2025 at 15:09, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 12/17/25 5:39 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Dec 17, 2025 at 01:22:59PM +0100, Konrad Dybcio wrote:
> > > >> On 12/14/25 8:26 PM, Christopher Obbard wrote:
> > > >>> Hi Konrad,
> > > >>>
> > > >>> On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
> > > >>> <christopher.obbard@linaro.org> wrote:
> > > >>>> Apologies for the late response, I was in the process of setting some
> > > >>>> more msm8096 boards up again in my new workspace to test this
> > > >>>> properly.
> > > >>>>
> > > >>>>
> > > >>>>> It may be that your board really has a MSM/APQ8x96*SG* which is another
> > > >>>>> name for the PRO SKU, which happens to have a 2 times wider divider, try
> > > >>>>>
> > > >>>>> `cat /sys/bus/soc/devices/soc0/soc_id`
> > > >>>>
> > > >>>> I read the soc_id from both of the msm8096 boards I have:
> > > >>>>
> > > >>>> Open-Q™ 820 µSOM Development Kit (APQ8096)
> > > >>>> ```
> > > >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> > > >>>> 291
> > > >>>> ```
> > > >>>> (FWIW this board is not in mainline yet; but boots with a DT similar
> > > >>>> enough to the db820c. I have a patch in my upstream backlog enabling
> > > >>>> that board; watch this space)
> > > >>>>
> > > >>>> DragonBoard™ 820c (APQ8096)
> > > >>>> ```
> > > >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> > > >>>> 291
> > > >>>> ```
> > > >>>
> > > >>> Sorry to nag, but are you able to look into this soc_id and see if
> > > >>> it's the PRO SKU ?
> > > >>
> > > >> No, it's the "normal" one
> > > >>
> > > >> Maybe Dmitry would know a little more what's going on
> > > >
> > > > Unfortunately, no.
> > > >
> > > > Maybe, the best option would be to really land the revert.
> > > >
> > > >
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > Is there a chance that this removal:
> > >
> > > -       case POST_RATE_CHANGE:
> > > -               if (cnd->new_rate < DIV_2_THRESHOLD)
> > > -                       ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> > > -                                                          SMUX_INDEX);
> > > -               else
> > > -                       ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> > > -                                                          ACD_INDEX);
> > >
> > > could have been the cause?
> > >
> > > On one hand, we're removing this explicit "set ACD as parent" path, but
> > > OTOH determine_rate should have taken care of this..
> >
> > My idea was that we switch to SMUX temporarily, then CLK framework
> > fixes that for us while performing the actual reparenting.
> >
> > Christopher, as a quick check, could possibly revert just this chunk?
> 
> Do you mean something like this diff? I thought I'd ask and confirm
> first, to be really sure.
> This leaves the handlers present for the other two events
> (PRE_RATE_CHANGE and ABORT_RATE_CHANGE).
> I didn't bother checking the calls to clk_cpu_8996_pmux_set_parent for
> errors as it's just a quick hack.
> If you think this diff is good for a test, I will check it in the next few days.

Yes, something like this.

> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 21d13c0841ed0..5d7f42a86a923 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -565,6 +565,14 @@ static int cpu_clk_notifier_cb(struct
> notifier_block *nb, unsigned long event,
>                         clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> SMUX_INDEX);
> 
>                 break;
> +       case POST_RATE_CHANGE:
> +               if (cnd->new_rate < DIV_2_THRESHOLD)
> +                        clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> +                                                          SMUX_INDEX);
> +               else
> +                       clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> +                                                          ACD_INDEX);
> +               break;
>         case ABORT_RATE_CHANGE:
>                 /* Revert manual change */
>                 if (cnd->new_rate < DIV_2_THRESHOLD &&
> 
> 
> Cheers!
> 
> Christopher Obbard

-- 
With best wishes
Dmitry

