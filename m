Return-Path: <linux-arm-msm+bounces-76704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCEFBC9AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 17:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDD31A61347
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 15:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436B62EBDC2;
	Thu,  9 Oct 2025 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISIQh3tL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9EA2417E6
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022024; cv=none; b=XCBUbHE9jbwI0HpEdEY1Dt9i9Q+BNmpHChWlCMRqzOmn+MoeHfhcYQrazkKTQLndBGiMivpvIJA4uiXdWhvlaUbNQop+yYpiykgIc2wzIVl4/rtkTsiY5Q6npXbP2+GCZaL4rz82zzG54PG7FVv43xYxpvS3XNadm8YTWQZOxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022024; c=relaxed/simple;
	bh=oQjcIWctgbJPLlW8Qg4pVgJmyLYFTvKpb037ktt4Fko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qc3tvaGOjc4l/KrM7yBTtxDrWL2hGM7CotbFxUMdvZkhwFsS7QneuxbP+UQWlqU1JPTSC299wuAuxlQjusgXMINYnOhD+o9ma1iUTkhe0VToN5WffjEkSkNiNUF23OUkC0N2vgBYTG2SsAVTx5PLc/fywf8GvZhsoOURHmPkyEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISIQh3tL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EisGk029129
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 15:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q17C80Ek5kynBMl4n0c/KacH
	qLIjQzsKeaXbG1eV2Mk=; b=ISIQh3tL4s9eemvobK7JjzEVY/QbQpAflx+FeLTJ
	6AUcZL9jY4sHR6XDh91v2gz8rgJDPTnzQRAYO8+t37GqyLFHQ2IgtajG36qQ+in+
	Dt7sHEV/mJlp9rGzXv7XenVhYeqVwP1Xj5m4YEGSkEMAAOBe6teoEz8QVxIPM0pB
	wjGeuUgDXcAueSDHxxm9V9Si+H04qOHyzbapT/z5jo0KX9jOEOU6Slux8RsOLQzl
	KZ/Pk9TlKDlAICW2YAEydpTUHE0WwuIUZpvnCdZJA1mBc2rctMaf0DhGcK4s3oKO
	+tEI0zSwzBk5uovQpZ1/tsRGljcyy+GAiIdFkdc+QrOu5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ku99a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 15:00:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfe8dafd18so59336781cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 08:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760022019; x=1760626819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q17C80Ek5kynBMl4n0c/KacHqLIjQzsKeaXbG1eV2Mk=;
        b=wksx3PoQJ6GSouEJ141KbafxKm4GaLx2ut2YZYGJmMdLJa9A1pQQJH73ZVZuK9q1+n
         0CROs7GP7WeX/q+PR+w/1uG/86G8sFAl4FARRjNF/zPu3wwpDuVrdHdmxXgOckZ9WAdS
         GjxJ+jggdYz5u6rnnW0Zhh09AsY/yD+lfLCGK88u9F9mnwpkh4C5NnX/aN8I9LoAaL/F
         Vfh27Nb8/cLXD38QcB1Cn7mL08mkUq7PFq1sr1h+84Vgap0FWjQ09xeWYfWP83hdO3R2
         3IJrbUJdHev6Qj6fhaAwnBcYAECogYlwfWjvul5cGuA6YpxuAjv+pSukP4FfSXp8K2aH
         gR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgNnOBWMveP2pT5Mg3H+2MaH5HcU3CBxOvlF8JpEO3RDmD9pPOfsHcvxPYl0ti8tbMbqJrU5ymMRSGXODB@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQxhCFPTD8Ktu9J3k7BJHEySA0mqycuF6tQjYEWyOWLrcodR6
	rpmMFKJcCRXTYN4RHoM1wBS6NRJcUkCAA/Q2rDBvZpS1WhbMs9aX59kTVxnP8UJhcL5mfpa85ce
	V5rrGg9S0vf99qAfvvPcoJ/mmxJUyY5DLo88Z7kHU4+1Glk+Im1z77GLMYoB6LS+RjWRl
X-Gm-Gg: ASbGncsHc83gDAtCQUKQDryrGuUiHPNQPp+pwMza79FOwWMfMJcs6V7pPLb3p/byvxA
	ZDYsHGZx3tp3xVM9uJ71iUO9tNlD24Z0A9wY614vbMwSOY4fxD92xqKUPHRKJRKU3MQYZicdqK4
	bCvH3c+9+O6qP9sXIZufWygb7OX39gL8sq3acS8A1fl4XEr//y+SimqeACCqFSED5009u0e2MK8
	stdAHn5U+THUe/W0tpWS2abo8la+Xv8iF+HXhEcQ+JV5fpJKzD54nJyihwnlvfEVNe5ZAzFzDv6
	3+fE8sbIkSWwu9YgkQANaL4WVbsJwodvk5JcmedRaWjdOmFLpnoUgWTIAeOfZw2XGZnIzqFY/NP
	wn7uJmgiJDDP/4pvDUmwpKn1iTK0sHdqZn8dxMUAb4vm5Npfvx13mAIUYaQ==
X-Received: by 2002:a05:622a:1e9b:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e6ead67a78mr117796391cf.69.1760022017635;
        Thu, 09 Oct 2025 08:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOLeCo/4yfzg4V3OpdNjM0GOglus/bZmIC2kvT6XMMcZnOmkG759gy5ztQPjqbV2UhQiLkHQ==
X-Received: by 2002:a05:622a:1e9b:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e6ead67a78mr117795121cf.69.1760022017013;
        Thu, 09 Oct 2025 08:00:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39d2cd8sm28630461fa.7.2025.10.09.08.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:00:15 -0700 (PDT)
Date: Thu, 9 Oct 2025 18:00:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
Message-ID: <um6d7e2su4erqet5fxyaxpyulfrzqvadq4izxgmxu3tol3i7jk@godpxwsqeqzs>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
 <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
 <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9h9Yffct+N4W
 d+STmk0RguYyGWH/7mUVnZkAKmV9x52nTIMgIubYA4cBIHy2QvLPcWeO1JRtCCTZlsiPx1O1O1Z
 5ws/HPxriiTEHMg215prXLtBNPhL6xkH7OXljtSGypCjYVG0VfBH8s8AEyXpLL0Urkm5/WPWsf6
 ytbqpYkuc3vxOmGfDCfJjl+82mKOuK8VVt5y+YCCuJxix3HAmU36K1aw0oMirRBPQ/D9EkIa1vF
 aOeeBbSdr3k4CWcinF3Cis15+GlcZnxZTDr+MuyTUFSFnRBxV2SLbsI6XOmI6AjFGC1ggkv6pSU
 KNZit2ZUmSe3CZoesDu5hpdvGhjwiQlZCGOrBcVotuq7Cjb1G8v0gPLtad4bSiKvgM9YjfqHwdI
 +7u8B9bQpKt7eGyVPi0VMkaxvsOvAw==
X-Proofpoint-GUID: x_5mxnj-6v9iz1S4BzrFehCq7E6mkYzA
X-Proofpoint-ORIG-GUID: x_5mxnj-6v9iz1S4BzrFehCq7E6mkYzA
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e7ce04 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=LpQP-O61AAAA:8 a=_mRl7PyFU19oPcLm8DQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:19:31AM +0200, Konrad Dybcio wrote:
> On 10/8/25 9:25 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
> >> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> >>> As a part of migrating code from the old Venus driver to the new Iris
> >>> one, add support for the SC7280 platform. It is very similar to SM8250,
> >>> but it (currently) uses no reset controls (there is an optional
> >>> GCC-generated reset, it will be added later) and no AON registers
> >>> region. The Venus driver names this platform "IRIS2_1", so the ops in
> >>
> >> Which we've learnt in the past is "IRIS2, 1-pipe"
> > 
> > Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?
> 
> [...]
> 
> >>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
> >>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>> +
> >>> +disable_power:
> >>> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> >>
> >> ..for this line
> > 
> > Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
> > AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
> > iris_platform_data.
> > 
> >>
> >> but this could be added to that one instead, since both clk APIs and the
> >> Iris wrappers around it are happy to consume a null pointer (funnily
> >> enough this one returns !void and is never checked)
> >>
> >> similar story for other func additions
> > 
> > In fact, initially I had them merged, but then I couldn't find an
> > elegant way to handle AON regs. I can squash them back, if that's the
> > consensus. Any idea regarding AON regs?
> 
> Digging in techpack/video, I found:
> 
> commit c543f70aca8d40c593b8ad342d42e913a422c552
> Author: Priyanka Gujjula <pgujjula@codeaurora.org>
> Date:   Fri Feb 14 13:38:31 2020 +0530
> 
>     msm: vidc: Skip AON register programming for lagoon
>     
>     AON register programming is used to set NOC to low
>     power mode during IRIS2 power off sequence. However
>     AON register memory map is not applicable and hence
>     skipping AON register programming for lagoon.
>     
>     Change-Id: Ib63248d118ed9fecfa5fa87925e8f69625dc1ba8
>     Signed-off-by: Priyanka Gujjula <pgujjula@codeaurora.org>
> 
> 
> lagoon being a downstream codename of the aforementioned sm6350
> 
> Meaning yeah it's bus topology.. so I think an if-statement within
> a common flow would be what we want here..
> 
> perhaps
> 
> if (core->iris_platform_data->num_vpp_pipe == 1)
> 
> just like venus and downstream do for the most part, and kick the
> can down the road.. In an unlikely event someone decides to implement
> IRIS2_1 on a brand new SoC, we can delay our worries..

But this function is being used for VPU3 devices too, if I'm not
mistaken. So it becomes a bit ugly... Also I'm not sure if this is
really related to a num of VPP pipes or the CVP.

> 
> Konrad

-- 
With best wishes
Dmitry

