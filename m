Return-Path: <linux-arm-msm+bounces-56615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C25AA7EA8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D583F1896172
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E83153800;
	Sat,  3 May 2025 05:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzhZkqfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66CE35957
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 05:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251198; cv=none; b=SmCocjhcD4mZ73M1KXa0b7Ok55DSIquhZozG+VcuR5wIwnvLSNKSKGrYZQ/GwjF98SefWWsQXapg1pohJrqJ2xZ3ERUyRnylT1AJfuz0xjr3xumUSfUjHpxDKmj7PKA1vew3s8Y5m6n+o2HNeeuaGrUV9JDD9+3GpeR3gZzClqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251198; c=relaxed/simple;
	bh=FZkziwf+DNshxofsJT6BEaExHEp9WU3/A33fWGZvXpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQvYlF5yu9mn+S53fA5Ku8XibZdBARStGH/Yelp868wwzZnah4yupvPymWTsAWhGO7dy7taEbTUNJ8qX1YEZiys5npTSlBr62roZ/cZ3CdoDxTE8YULMJQ8gnGcs0gx9kAKxZxUXyn9j1hwEaI40LnXjPoFaEHoLecuh1+szydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzhZkqfs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433Rj3Z015179
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 05:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MF/so5t7HZgWT3eWuH3tumGi
	2Fh4xLxU/AxIoXWE++Y=; b=BzhZkqfsgSeMovLa1hzrnq/tT0WtuOTPshrJJ7No
	MkFhJQSbbVtVLBVeC0qBdKlFiAtj1A9sNaQ5sn7QLqHcek8G2EY32NpfPSrjYD1a
	/Anw+zDNVnBTlr1zYO/tG18SRW7uOFRoY+jV7NYmOFGdHKxCAZk/nNcZd2CfoFzP
	GHseGOdB1aJ6kE8LJLqPnFReeMzRonobKimQL7xVlO8uRYUMaSZVfJoj07l+Kgyn
	ITF6f5JhQAuKjDaJXS1YoI12XHfskVO59q/gx3NFz7svleoeJvmo4JXItdFTk+BB
	H98UiSmvWxwpJ+6tgTq7GkjdMzrS1e5g80gu+InXhz+AqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep09bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 05:46:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c793d573b2so386717485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746251195; x=1746855995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF/so5t7HZgWT3eWuH3tumGi2Fh4xLxU/AxIoXWE++Y=;
        b=nHSOYc+kgm8bJ/qWWjolnxUoxWwj5oSJAACOANfo1J+28E/6jnEkF2TxwDP2esXjzO
         Evzpk63BN/VMR/gWHJBeo1MYnHnGGHIBB4eqA9gO8QpSbg+KL/5ZJg5riTh0B6xBVh0W
         ELl6OEZCQSOC77aXsJq2Syaq6m8cL4ESMxrrDLxHo8tTCy2dWmJ5juITwA3wQ+IZ91JO
         40nU2Cbbyu2nYAjPJF/+Nk9D86xsPF+oEU7fyz3gvo5KujyNGGCZ56+DRatm2xwhtjfe
         ic8iO9MOyVFvFHDnLvnnCwZF6xMJ9dLAzu/JzdrVjajCKbuVo+OeCchC4yvcWUTEdvF6
         UgKA==
X-Forwarded-Encrypted: i=1; AJvYcCWHxvoLmBrJOEmZgObqMG1kpDkqxOBuB8ZcHJJhzoWrEJK+1M20wSp93OiEl4vlzd66xW0gNzOO7m6fmyHH@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBIQUusixoYDnvix03f/EwwMo0BGwl992pjntovZA9lz0MHp0
	hpUUqu1uKlBIptDYOCx5sfzNp5T6SEbGqnETDdDpCV921JdqoYWbNQFaf2dMhAmEU5YWxzmKWMw
	8tE6gDU1Ev+gSCSpMwjIwUab3QR0NCMx49KQ3y0ifRdVs78VkoGzvRiuWAim8aQX4
X-Gm-Gg: ASbGncsF55qRSc/4im1PJ9x5jvOpaZjRoVn+4aM1SZHhVZUhvo0//veRDSFOAcgNdIp
	hk8oYAKPS005GMH+Y2MjU9iIW8YLzuzH18iQrIm8pJPRip7JfR+JQ7m/DW73yae7CA3xio+JBFz
	2JMFtSX7Ar8ivn3G4YiNXN/4x5j9WZXOtzsX4XMtTjQG9uxR9amjdyk5O3q2LMSA1L9sP5GEoZJ
	feTM/jaMKToCgSid/C+Sk2K7V12jXyNIpp2wHsjqBtjIT8Fth2IjUsnUBhOpvZYpBs9cVpWgY1U
	QRoscDqBz5VTPkeV7RxkGGXPq79TKM7cm7JlXHoOfhclrMwgwPSV+bafqCsgffUJTBfn1xM3Lg8
	=
X-Received: by 2002:a05:622a:4a09:b0:476:8225:dac9 with SMTP id d75a77b69052e-48d5da48b21mr26804851cf.45.1746251194787;
        Fri, 02 May 2025 22:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMgvUFBcAgYiEH2v/8tiGWbtw2LOg1LR2AfqMw15DOu+nL+S40ZYWy5mZq0KGU7+YBjPKWMA==
X-Received: by 2002:a05:622a:4a09:b0:476:8225:dac9 with SMTP id d75a77b69052e-48d5da48b21mr26804721cf.45.1746251194472;
        Fri, 02 May 2025 22:46:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f450sm6249821fa.80.2025.05.02.22.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:46:33 -0700 (PDT)
Date: Sat, 3 May 2025 08:46:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <qgojusp6c5mglve35sgncwpuft2flnvfysstbyieysktdlxwp3@lp73etm4zzai>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
 <aBHvwUAISo2JhYSz@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHvwUAISo2JhYSz@linaro.org>
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6815adbb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=ZJu6mct0EmN0ZqeJLYoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: p1bL0Jze1ZvNb9U914pCXl3wnGR6qT-P
X-Proofpoint-GUID: p1bL0Jze1ZvNb9U914pCXl3wnGR6qT-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NiBTYWx0ZWRfX9itixhhb0w3m
 OJLBen9bEnWLxL708jGTO9r0jjCMkvDkNSSX5rHjkwbB32o0f7zlRXA2LQnuhnZz0XB6mnfAPTk
 mTlfClz8JEgTowDjuUdb/UJg8YT+5KAGn/Sv/ZDuXstb105hA4RyMA/BaPACHoUvHR2+VL2ljuh
 wd5rlPIBGFMnE/im3IscQCXQ7dBylH/HbwufUaPnPII99u2STXz1Nf2LOJtPoyP7Ga9g1gF6ah9
 0/TmsVZVYkk/vDOcNsTgkBi4hUj0rvDt8PL3QIkqIuR6z+8IkOG7Hv/AbH0eeIqOrv04tymdGqR
 MUG0gC9eWLQ4i5O9Wf++UBHhw50/dFn039YyTP9KFh0bBlcWrajhgR0n/4N7yOrPL6zxOtiliyl
 OyoyQTIxSP6xFZvE1tZvyAD+HwxQ1tTFeFJuGhXEdaRusRtWgafNUYuCNdCdOeMeTAReZYOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030046

On Wed, Apr 30, 2025 at 12:39:13PM +0300, Abel Vesa wrote:
> On 25-04-30 01:26:13, Sebastian Reichel wrote:
> > Hi,
> > 
> > On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> > > It all started with the support for CRD back when we had different
> > > compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> > > is now figured out at runtime while using only the DP compatible.
> > > 
> > > It's almost funny how this got copied over from CRD and spread to all
> > > X Elite platforms.
> > > 
> > > TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> > > beyond X Elite to newer platforms.
> > > 
> > > Functionally nothing changes.
> > 
> > Looking at the diff I wonder if this part should also be simplified:
> > 
> > /delete-property/ #sound-dai-cells;
> > 
> > This is done by all upstream X1E boards, so maybe just drop the
> > #sound-dai-cells directly in x1e80100.dtsi?
> 
> Yeah, I'm not sure about that.
> 
> Though the DP3 PHY is currently used as eDP, I think it could be used
> as DP. So I think it makes more sense to keep the DP3 controller as is
> in the SoC dtsi and delete the #sound-dai-cells property in each board
> specific dts. Don't know if it will ever be the case with this SoC, but
> maybe someone will use DP3 with the PHY configured as DP rather than
> eDP.
> 
> Not sure if I'm 100% right about this though.
> 
> Dmitry, Bjorn, do you think that is accurate enough?

Yes, this sounds logical. DP3 is repurposed for eDP on a board level, so
the SoC configuration should not contain any specific config for that
port.

> 
> > 
> > Greetings,
> > 
> > -- Sebastian
> 
> 

-- 
With best wishes
Dmitry

