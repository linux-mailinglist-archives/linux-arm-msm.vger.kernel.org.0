Return-Path: <linux-arm-msm+bounces-61840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6274AE0EC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 22:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 825D54A1821
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 20:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A8725D53B;
	Thu, 19 Jun 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDz8+r9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958C5245025
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366493; cv=none; b=Gkp9SNj9rLUGc939M7ng2MfTjcDjlndyVWRNGEQYibGWEIFTmE+ykEoocUp4AGtLZvfVh846HfWDPeC+VzQho0KTeBNfUT7sZdl+Yl4zdkpYV/KHnpt3qi81ZpXK3UHARYWGZP232OoDmfPDsEjNKBw0A1x/UoT0qvRrIjReiQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366493; c=relaxed/simple;
	bh=V76wWtfNssZuJeL7jIN/TzprmpMDK9ODtvOoXZpS9a0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcBI6mc2NvR4yiE+B/pAUCYOYMjCCzcEwazMv1o5Iam8HcKNloSa1H7DrPfEEc2HfPjpyhLtUk3AsVppdsI7mx1nAsTwc3F//1ubP7bk1cnAss3+KSmPXHI7SgN+lw94kRhnDFCMJrAUQ04ahlRVI/Tm6vagIox7+ZSVl1RsBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDz8+r9I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEpF3F002542
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 20:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2jzLK9E63pyYq1kVv2ZUpQ6X
	CYSuynTHjbdFSuxz/xI=; b=aDz8+r9IhTgz4pHFJAzbfqs0AYT/p+vDaiel3i1A
	XHoZGdNokpPD5IzCx5+M5A39VRqlxvAQizXbBPqBWu+1IlEUh88FekbGFQozXCxr
	ouQikmEFPuc+lMhevA+HYUgcGpUuoBO9cn9UMu2FCzNq7BYsOljF3fAHr/R5jTyd
	18o8bhN+2Zka5Cr9wIhLFlVcXqZ1sC5iaPw+MMgaHhH86NgG8eaofrzCyMrb5T9s
	L8GKQDxtQ47Bo0eRcL9dAN04pr0sC0UnuWAJM95oUePDS914yW0+EQ77nEzs6CeI
	ej1Hq6Ivik+MAc7NwMNvqch+nc67b0mPSXj41IuifUbQDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7h4cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 20:54:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so177741985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 13:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366489; x=1750971289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jzLK9E63pyYq1kVv2ZUpQ6XCYSuynTHjbdFSuxz/xI=;
        b=DTOYb+qqL5w4HcMFl5S2j4c7TRGev0E+higwg0+eDkNaDEwNeuwiOBnoW+jciG6uLx
         kkkTsJJKe9L3DKKf3cjMP8Uuj3+LFe7wLeOuZvOupXT9zhLXw+eIbhBTt7qYv8ruXwWb
         lSbe4nU54K5QXfpm2+skGlhAwrlWksufYgka2LlVpKgTwGq2JfS1Bkp50fIRMLdIHE/j
         2J8NZiCGiObENU6StfQqOh55TECUlZ1V5Qx1Lc2cYCrZqCNpPTe61V/Gct6RbAKTpmic
         S4UBRExFxvcB6m0K1VbLDGojm9pAb26eoReVziURhTj2oj65Kfza1S3OpB5eAu3iuJF7
         6Eog==
X-Forwarded-Encrypted: i=1; AJvYcCXYuDcQVKUupgf4eBZAiB8rmjSIUBfWBQtP+8rIrp8gqh42DZlOx+xZd9gBJFe9oZYCJ3uJ3N70F4Dadkux@vger.kernel.org
X-Gm-Message-State: AOJu0YxW5qQD0C0C+Ce+Rta5ZJzXtJnGx9mTcmxu7O7Z+R0hZY76oubF
	vl9/ViWyxSVTL12+EoaA/kvIqaqYqp5JOUjDnuO8OMSHnv8pEzfmwhtScppfB1p2aOU5zWPrZmb
	0py48jDcC0CsqKfCUCehCnNn96Q/eDUfJwDb575Mp1JsOb9+2NRoaCT8KH/wBVIWz7hQv
X-Gm-Gg: ASbGnctY+jP0SfQUwOmdrZsbSu/UvA4NyciDv90fEOACWCvO7g7YnrmYxNYA4CkzItb
	T7ylu9CcoU4QLnAR3dHKWhbGkLj6ma8CZbpvCWLRNbcZ3+ymQBJ89fc5MfLpzG2SBAjwYRw/lvy
	4ijT0PzgGWcqeLdvi9UmSB1UQPq+jq45dQVM39iWzOVp5ySbBdcweB+C5X2qxckm37ErsgtonKl
	CwgqHXaeSQ0cy5S6VhTS1G0LytS0FM59eGfhlG9Wca9QNkl29XvK1lhxzbzyKHx1+oZ3msRS4QQ
	Bbk7hj32LhmApRYcW032U2M1GwIH1vqoAiaq0D1//vJaHbwi30wFOj1lug==
X-Received: by 2002:a05:620a:44d4:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d3f98c9736mr78862485a.17.1750366489473;
        Thu, 19 Jun 2025 13:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkpeI51MxI0xEdFKrJEvaOGoAVyfUsMbYCSR52G26n+A57buXYC0rJ8WA024sdRvFNlTca8g==
X-Received: by 2002:a05:620a:44d4:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d3f98c9736mr78860185a.17.1750366489005;
        Thu, 19 Jun 2025 13:54:49 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb5a8sm5065545e9.7.2025.06.19.13.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:54:48 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 19 Jun 2025 22:54:47 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, stanimir.k.varbanov@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/7] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aFR5F7zEmMzYDxWR@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <672b5db1-e045-4625-bad6-83224c27c07f@linaro.org>
 <aFQg6x+FxXDY4P5m@trex>
 <66edbe65-a137-4661-b0c8-8a6813635c44@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66edbe65-a137-4661-b0c8-8a6813635c44@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE3MSBTYWx0ZWRfX35ZHgUqjnZ+m
 kwBVaqcPvpPqY4lJQylPtsf5TV8YrzaQ2nvIwSy4/QU7qXYOdxp0Vs9NDG7xDBDE8HJAe4v2cjs
 I+hQxCAEvfGzG/e2d5UhHSXjInJ3BnixqIfIJ4c4RtkMz7XTB9uml2Y1aLtbCbHz6gYxE5IewEz
 tJV4hlI+9eUdTig1MaytyRpIbH2xEKaC2oO1vLWQgQ2Z32O27UE8r9YEshyFLDQEGEEwWrfgGNg
 059Yhg8u2GyEnaQg9VFMfePQ7dFHUP6H17Hy6Tw9KBoN+XbjUU2Cq8k2Qzpx7lKIP4zplFd2dPb
 h03QI7imH38E8pm0t83nJPwk+xTFstuD3mDqGiF6SrjdemTiiVWpLbx0AsQmB0CL/kxs5xyzV20
 rmdAylXbIbrsuJKRoacZcdKqEJ+T97uDpFsfYO8x7Jw0RebUxsSZBQ3wA/Esv+2FEm4RiR92
X-Proofpoint-GUID: 4EPbEVaA2MEY_hHbFKzxJq2Cou5mmvgq
X-Proofpoint-ORIG-GUID: 4EPbEVaA2MEY_hHbFKzxJq2Cou5mmvgq
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6854791a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=nbKgHqp8-yig3D_XBBYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190171

On 19/06/25 20:43:46, Bryan O'Donoghue wrote:
> On 19/06/2025 15:38, Jorge Ramirez wrote:
> > > WARNING: Argument '_1' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > > 
> > > WARNING: Argument '_2' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > > 
> > > WARNING: Argument '_3' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > > 
> > > WARNING: Argument '_4' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > 
> > about the warnings there is nothing that can be done - those parameters
> > as per the comments are necessarily ignored - that is the way the macro
> > is supposed to work.
> > 
> > can we not live with them? otherwise I cant do it in a nice way.
> 
> For preference I'd like to avoid adding warnings.
> 
> Let's just stick with your first version instead.

ok - but I think this made the code more readable

> 
> ---
> bod

