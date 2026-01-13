Return-Path: <linux-arm-msm+bounces-88831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEBD1A42A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFAC03018367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ADF1B3925;
	Tue, 13 Jan 2026 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6MtjU47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnwxYO17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839B22FB977
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321751; cv=none; b=U8gpoyb2+FR1/250GoPy3FO8jWivLqAea2xSM5mPurGR+kBtgTP3Jk5GEvdATrkNB/5wQ2Ib091bIKbWavF3Z0/tIGbCp0szgLdp9nEWcrEt0CqmMbG/PmorvJ/k5nOpnkd4FOGUX9q+PWc5nV2VzcjivV/MOCxSsk9bm/tIfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321751; c=relaxed/simple;
	bh=oUPYwQN15xpKqjNWtjDqdTFQd7zC6BoxdsN91zpf55A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR+Z/fFk4HYMtL7C9AjM3VK+lLKqa1m+MSr/oFNHTBT/vlY741O9HXcSSRbc48DagdgsnXEOsd5pv/6IRB+T0EGpiRMsCOsoiWEnxRWSUNF1UVHbYAMFCQtkFKYu4eXu0faFEZuVEC/R1R8GmGyQagqaydiW+GhgsrgGdWvcvR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6MtjU47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnwxYO17; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DA5qpa3799036
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIn5H/EXHlleEAeuN1rT2GBX
	pPo6fP2DFr4Mp6yQNT0=; b=h6MtjU47w1PHnUFq0KDb/GRAfBi1JEHu2lTMIpyc
	cqAD+bc1LGy8/TG/gfUjoEiqzQmuk+kyMYsqOX6aqMyevJPuhwCkJUFBj3Rt8aVG
	+ufCmNSUcu+UF5tCQSOyhiPWfUC4Kn0Wa5H23HJdxo72W0y6hF5B8xdfnvsYdi2W
	ipinFNeNUHPEZnaabab9G93Qcw9UdAI8Zaa+c6cbmoGJRFLcfkx3Y0pp5I+Ujoe8
	GNlxjYt69KuxsvIiz2/W3J6fNXVd/LXNyHBlosiUcMffL4FX2PoPw2okX7CUh2Mq
	it8SOOvW2CCXVHDJFUqdg+DIgO4SiK2RZDGAlLEcFDFeSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0ds83r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:29:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so2031395385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768321748; x=1768926548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIn5H/EXHlleEAeuN1rT2GBXpPo6fP2DFr4Mp6yQNT0=;
        b=SnwxYO170M9LFflaroEXzk1rTMzypq+UXVKvow77N9DVUg6tTSIZ50XRPgBQwAoEoT
         Ued+nDHEL6wFiIGGwwEG4Xaq12tPtEb9+oEtpRITZgVyzeFdlxd5R3EY8D5nQf1uTR3b
         Slr6f/YfHDI41Bu5UheoDjczlGQEBhBGzvM6xQCmnFsfah9eQ8TLg9yxASW5595q3/C6
         Jlb28AY1sI+SMJMiZxgclSlJmyhdt6cIhh+8Dl2dcaH8NodMeXtKFMxr64ghCHq2kCBF
         UQ/vHjvVSryPq56oDAlh/EXmGkFpD2/ULpu3Nni1JATq+UKZ3GycKuC1AmK1nEXfbgRo
         ToAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321748; x=1768926548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIn5H/EXHlleEAeuN1rT2GBXpPo6fP2DFr4Mp6yQNT0=;
        b=gD7UrthYlVcHbPqdENEJY68az/YYjsdDg6p6eCgECzeKXkxPietfR6eTK67HDCCU4w
         A5bdnKalkb4IdRyhKliXJIKGDzvWiDo+UbaFx5FPnZ7FDeK1ICNIdvOBt6xODXtdINQP
         TQtscSdYNdG+5RjNasCgGOFCHD1HppdaJ8M+70Vmhty1vXegFzjmJdNRaqfrxk2yGmIc
         fV29fvcH6RPZ7acVaMvcmJTIo1V94llGFidAxUh07N+tZas8T24bMr/n03k2gjjoIWJ3
         I9E0KwSaZOqNiCJEvl4QBSRwWlcwh0bTTsuSX1pL7P5YmGlyPq3krKiN6qC/j1Gf8Uiq
         LWeA==
X-Forwarded-Encrypted: i=1; AJvYcCV/nIBVnsrxFJeBfPIwIt3iFfeprrHlgQ5C8m3sCGVJFlCe2a6D8JILG6uam+mo7UaGKnC3bxmCaCLkm3mj@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSoSzOXb8oYu6ghUa+IqAd98zxzsB3LmWP99clHviGWk5HY0F
	FGQBUtFUI/lHtq4YeSObfjJKI28z6fojd5osyV2syrHUhT3VeyxWuS/HTyBZP0gt9ttwJQn9bSx
	IDrmib6Ibn1fHMA0/bdT1h/J5jLgXy6AGKgTpkF9eJm1r0nHgX7l1D9hwee4+YPsae+qy
X-Gm-Gg: AY/fxX49JZlksTTLfnfLiHmO6Dsku/14rbemu0x/3q1CmvMnS3/uQrLBt6W2Vx4sYwH
	ilhiyt0y1pEU2czls1NbjS4F0asetE0tc36X/ietl6uV3Ts/tA7oExQQQi3YdLJ6M/Obi7ww11T
	F6j4A/qwD1zV+nMhLocYHn/ZrJuV3M6CvLqzL5pPiKQEPR87q+F/A+A22xL9yYY0+TYpQVMDA3L
	QHGUqD9FfZY9Zz8zVZgrb6qcmacTdQzSQbGlV8a/cq2jZaspRuMpYiD5Yz844ZAJQTZP8WDUTop
	4yh/xG+kdlVwVq/6QujCQdnL20iRis5c5El2DHr/92U6/i+Jt1Xr1YaFvylppzbpNmMc4yLKh1v
	tJ5wkGw08fp4UJ5xk9EkWv6YRQpPioJTgP2pRZt7sgZ3tqMleERmQ3iPNPywEokNlmpp1CJOuT/
	Bhw8KWhDOzAf1FEkhDRg9bJj4=
X-Received: by 2002:a05:620a:1a97:b0:8a3:8a0:a4fe with SMTP id af79cd13be357-8c3893840f2mr2997451285a.32.1768321747685;
        Tue, 13 Jan 2026 08:29:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVkPsQcxQkr+cU1eJ0h1aQeUhC2BF2dJvRQ4lN+2W+Xk0GRhFMTy0HCKzKnUPMS0T43c+GdQ==
X-Received: by 2002:a05:620a:1a97:b0:8a3:8a0:a4fe with SMTP id af79cd13be357-8c3893840f2mr2997446685a.32.1768321747192;
        Tue, 13 Jan 2026 08:29:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b9fc41011sm71902e87.69.2026.01.13.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:29:06 -0800 (PST)
Date: Tue, 13 Jan 2026 18:29:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=696672d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yH33JR1JA9jB6mUk05kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: r84WAaBvyvDdwJ5boLDYEYqGOfqlK4Ou
X-Proofpoint-GUID: r84WAaBvyvDdwJ5boLDYEYqGOfqlK4Ou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzNyBTYWx0ZWRfX8Y0tkwcD/+5J
 jhEiizR4/+nSgSDLMQO93TC4515isLn+N+E//tEw5am5hjEoXHejVAUp+xOIqKje9AaXeNgSw87
 R2ezuAtbb/J2qJALhSR7vxuQbA3LZdAlJ/2TCOYBnZyIIaS0Lh8Q31wCGifWUNShiW0cv4AlBiS
 /0OzrxPgUaO8xZh7zG970dGJxcG1iPq0D2KZUJGIbo5uZDJSPcDBac3tUXSBVjJF1vDu+AxVxYI
 i9GLwuUSVC0de6Cu9UnZRqgDmPpFnSEnTuWdhi+yo2LW6EupwEFhFuOr+FQmLIvGOHqluln5jXG
 vDOc0mREOfnhTMhmQiZ4IPQ6FPb9cbMKZx7g+dSczS+8iziJk8V+o6DYe3kXAoutfM6U/Qcz8BN
 uO8kNIQp+9Jq/2rxraAW5c7BAkClH1FTuVXThv7luUlBLk59JfK6sn2LbA1zbXzIiRIorq6Mv0Y
 SQ8N6gJGNOx5QhhCF7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130137

On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> >> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> >>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> To make sure the correct settings for a given DRAM configuration get
> >>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
> >>>>>> what the BSP kernel does, albeit with through convoluted means of the
> >>>>>> bootloader altering the DT with this data).
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> ---
> >>>>>> I'm not sure about this approach - perhaps a global variable storing
> >>>>>> the selected config, which would then be non-const would be better?
> >>>>>
> >>>>> I'd prefer if const data was const, split HBB to a separate API.
> >>>>>
> >>>>
> >>>> I agree, but I'd prefer to avoid a separate API for it.
> >>>>
> >>>> Instead I'd like to either return the struct by value (after updating
> >>>> the hbb), but we then loose the ability to return errors, or by changing
> >>>> the signature to:
> >>>>
> >>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> >>>>
> >>>> This costs us an additional 16 bytes in each client (as the pointer is
> >>>> replaced with the data), but I think it's a cleaner API.
> >>>
> >>> What about:
> >>>
> >>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> >>>
> >>> I really want to keep the data as const and, as important, use it as a
> >>> const pointer.
> >>>
> >>
> >> I guess the question is what are you actually trying to achive; my goal
> >> was to keep the base data constant, but I'm guessing that you also want
> >> to retain the "const" classifier in the client's context struct (e.g.
> >> the "mdss" member in struct dpu_kms)
> >>
> >> If we're returning the data by value, there's no way for you to mark
> >> it as "const" in the calling code's context object (as by definition you
> >> shouldn't be able to change the value after initializing the object).
> > 
> > And I, of course, misssed one star:
> > 
> > const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
> > 
> > This leaks the knowledge that HBB is slightly different kind of property
> > than the rest of UBWC data.
> > 
> >>
> >> You also can't return the data by value and then track it by reference -
> >> as that value lives on the stack. This has the benefit of making the
> >> lifecycle of that object clear (it lives in each client) - but perhaps
> >> not a goal of ours... 
> >>
> >> How come the ubwc config is const but the hbb isn't?
> >>
> >>
> >> If we want both the per-target data to remain const and data in the
> >> client's context to be carrying the const qualifier, the one solution I
> >> can see is:
> >>
> >> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >> {
> >>         const struct qcom_ubwc_cfg_data *data;
> >>         static struct qcom_ubwc_cfg_data cfg;
> >>         int hbb;
> >>
> >>         ...
> >>
> >>         data = of_machine_get_match_data(qcom_ubwc_configs);
> >>         ...
> >>
> >>         hbb = qcom_smem_dram_get_hbb();
> >> 	...
> >>
> >>         cfg = *data;
> >>         cfg.highest_bank_bit = hbb;
> >>
> >>         return &cfg;
> >> }
> >>
> >> But we'd need to deal with the race in cfg assignment...
> > 
> > static struct qcom_ubwc_cfg_data *cfg;
> > static DEFINE_MUTEX(cfg_mutex);
> > const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> > {
> >         const struct qcom_ubwc_cfg_data *data;
> >         int hbb;
> > 
> > 	guard(mutex)(&cfg_mutex);
> > 
> > 	if (cfg)
> > 		return cfg;
> > 
> >         data = of_machine_get_match_data(qcom_ubwc_configs);
> > 	if (!data)
> > 		return ERR_PTR(-ENOMEM);
> > 
> >         hbb = qcom_smem_dram_get_hbb();
> > 	if (hbb = -ENODATA)
> > 		hbb = 15; /* I think it was default */
> > 	else if (hbb < 0)
> > 		return ERR_PTR(hbb);
> > 
> >         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
> > 	if (!cfg)
> > 		return ERR_PTR(-ENOMEM);
> > 
> >         cfg->highest_bank_bit = hbb;
> > 
> > 	return cfg;
> > }
> > 
> > This potentially leaks sizeof(*data) memory if the module gets removed.
> > Granted that all users also use qcom_ubwc_config_get_data() symbol, it
> > should be safe to kfree(cfg) on module removal.
> 
> I really don't understand why you'd want a separate API for hbb, if
> hbb is already available from the larger struct *and* if a driver needs
> to know about the value of hbb, it really needs to know about all the
> other values as well

Please take another look, qcom_ubwc_config_get_data() is the only public
API, qcom_smem_dram_get_hbb() is an internal API.

My goal is to keep having UBWC db which keeps const data and which which
also returns a const pointer.

-- 
With best wishes
Dmitry

