Return-Path: <linux-arm-msm+bounces-75347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB3BA552D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 00:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD0B44E1C19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 22:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E58D2BDC14;
	Fri, 26 Sep 2025 22:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSEIvewc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C129B8D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758925555; cv=none; b=jVAdYiwwHVRqztQsMzvl1qImg6RHcnF/sHA7/1SfAOluqgxzH93r3sLDC4O5psEZF6V9a3ek3Y1nYO7iZYZn6bSfIoOVnetIBzQ/Af/R2PAQ0x3r299CL0GiAlHuhZ+eBtBD+74LLmXBiTE8Ga0vDPKCP7a3KSS6kC4mt6t7COU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758925555; c=relaxed/simple;
	bh=7MM/4Q8HvlxKD6Ly9fAUUqgP7sTmdfwyfWBD93UJUZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ1x42ZS2owLuL3aZfUIn60zvh4V1NlxhbiF+jiOsOFtOIXy2oYQgcDa0Tm8H7SbYIOR8+kSDbcEJHGOfolbwD/GKCTHuwtsgFJ8ahRy1Pk/YEWOmLwykZcWC1pcN0oxdC76uFgsOmPiVEiyO491bChTQHP2yDioAS2pwzswOEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSEIvewc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX5WV012723
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lSU3+DF/fdtA8+mTA+JC5Hi
	PEd6zdPlVsitlBTLwGQ=; b=NSEIvewcyL3zFXW/+Ca5Qzv1D84DcIgwrazLs7aM
	TBGuHKNPsECaGDepxywh1q7Rk1eJ0NjKW7o8AbCSpRacX0AEyz6saDV7Qqh+Ai7q
	18m/hqjdp1Dl6Ce8CiwKWsXV/E/m0EwD2Y4yiYxVgAVJ6VSlkMi0q4TLUOsss6fP
	wCebTbDOmD8iEuf6uIvZgmZ/dWRAnhgHOJ2LrC067nbaweygrDODO+bTlvrijntS
	ZateaaO+PmUuqqjxZzLYVvEn2ulWsH5PZBKkv1n1gxwpugjWO8FfEZjPQv6BlOta
	k0ScioXI334PD/xEKq8tjMKKSiQYmiel/zgcDnwco8QMcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u49me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:25:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ddc5a484c9so27338021cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 15:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758925551; x=1759530351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lSU3+DF/fdtA8+mTA+JC5HiPEd6zdPlVsitlBTLwGQ=;
        b=RrLfKjTR+PnBJTvgqru4CiGAuzvX6MxCY7+CXYD13504mpC5spp8ySLfbFa643cPVi
         st/pVS7b9sgX/jsEkDymaeZxfUkS+14/S2nIoveCxlQujvifTjNXEY6EizjBxYUt89pf
         Jc98LnYZnIcWbtVMw38wdLLkF1sWaFNeDgdt0fNelX54fytcOq8Kd5YeK98LiwQlNf3n
         aL2edX746sZ4dbKE0haeYDA0OyHNjF/G+f+8FwBsU7ot/lqW4EbKHZG96/AtCCJy2Yvo
         d1i4eoKU0d69pwzIurNtWnlGJ3Eldr1p685qBGRwZlagL/jBz2bprHJfjVrgFOtJJIYA
         nZHA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ixEZYszmPQm6+tR5UsADqfKVF9PzbRp8ldoEUL0yUp40Y7M+oWBeHs7cddWbgLKz3nKjJj0PuTHRNrYh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb7F09kZequpHsTupNcdTkBhxFmQ61mAFAnO5nCcbg8X4o/nUw
	oDq2zzlBPvkgp/FXtymLd1Q1y9O6Xv13JjycdhcbQmfcOhTtb990QXWWxNB7F6zlL/YwQF8E7Kn
	FQTRmdzkQCCkdeACCymFS/Qxdp03GBS4uKMM6kRkmVO2AL5SfnXDbEixVtOP0sM+Nta3iU4cw+L
	pV
X-Gm-Gg: ASbGnctgGypatPoMzgY9ynT0iwqcxy+nHth4y0EqqqmvwYe61kLK+3PKCf7/5mdzO2Q
	wfoaElYr0+sipjhwYvJZehe7ZxwKfZLl/FD0I8F6s2ZjIzUtZzY7+Si+F4nGVFP1ZhnpArzDuiu
	XP+8bTPxoqguxHn43r4e7b2d1352zOaiPAdMki7zOtBtt7fCXbv73X3VA66JEkSp0PQNhU2VGno
	oK3qQ7WoavCNIRbIkmQ8FbVODIawbPKUK94zsaobx7aKZgC3gyVfH1O2LseZ/65mf9sF/yMDEis
	r0f7vesoy9Q2AOm09hicGod4pYTZvaxOAQgq+IXlqdGVgIv4z/HlahJ9/yR3r5lRIIftckZYI+V
	oDCEnr0gkpDT6DSLR7sa9a/7V087uOL/tXg4v4wb1hYuvid8lmn1T
X-Received: by 2002:ac8:5945:0:b0:4d9:f384:769f with SMTP id d75a77b69052e-4da4744eaeamr125486851cf.12.1758925550962;
        Fri, 26 Sep 2025 15:25:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3Hq26X7V05u80hWdOHJ/Gh3+FDD0FTa4NVIS1a/lRO9spXDUP4q5N9EZ6UiSnowVWAOEQ0g==
X-Received: by 2002:ac8:5945:0:b0:4d9:f384:769f with SMTP id d75a77b69052e-4da4744eaeamr125486521cf.12.1758925550469;
        Fri, 26 Sep 2025 15:25:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a31e19sm2140360e87.107.2025.09.26.15.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:25:48 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:25:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <2ppixuzddqmpa2d7nkvwwbfn4dnt7j7voyqfqcqeokbkzjg2lm@mokv4cihiuw2>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
 <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
 <7c6ab647-0c54-4480-9eb2-5c2bbf5f857d@oss.qualcomm.com>
 <b5d465e9-e84c-fabf-f275-3d0a5abf764f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5d465e9-e84c-fabf-f275-3d0a5abf764f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CCQUrR5dtH8T9463UeTR6dw0PnBpcDTS
X-Proofpoint-GUID: CCQUrR5dtH8T9463UeTR6dw0PnBpcDTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX187V/sT4GWgT
 8eAEhC52I+nb0DAIkjUYKz/eZVAaH2EJ77PyGX69tQ+1bk0Y3H23ao3ZQ1eGhNumAhKUyYPgwFN
 dkIBCX98+J1U2EkDqBjIXLBpEXD4l1myAjz5Vc7HkIveleKlNM8etkbD96gPqkZPP7ZDVHwECJo
 f7UFV0f8gGrmkSd74hBxyZGWJiaTTqY3rNnvoO45czFYhptBylVf6elUcejO70cAaLrQsh3ByMP
 h08mJQNsYmHe4cIKS2rROCRUYjYNMMyn6rP6ZRiCWx4MSO5LeMtsSuQ4RqagcwBGe77quUP/K/M
 qkYQeyR0LnKa5je+O4D4TDwYH7UjmXptx2PodVe/oUcygenW+DcRpIZWgEttGij6U9qJyqdaQlM
 e7eMt1LAKy/ao1MOrzIx8oncVkJ2Ag==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d712f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sxVh0rNj7eTcMgoLKOEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 07:25:30PM +0530, Vikash Garodia wrote:
> 
> On 9/26/2025 5:17 PM, Konrad Dybcio wrote:
> > On 9/25/25 9:38 PM, Dmitry Baryshkov wrote:
> >> On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
> >>>
> >>> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
> >>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> > 
> > 
> > [...]
> > 
> >>>>> +  power-domains:
> >>>>> +    minItems: 5
> >>>>> +    maxItems: 7
> >>>>
> >>>> You are sending bindings for a single device on a single platform. How
> >>>> comes that it has min != max?
> >>>
> >>> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
> >>> we do not have min interface, then for those variants, we have to either have
> >>> separate bindings or add if/else conditions(?). Introducing min now can make it
> >>> easily usable for upcoming vpu4 variants.
> >>
> >> No, it makes it harder to follow the changes. This platform has
> >> this-and-that requirements. Then you add another platform and it's clear
> >> that the changes are for that platform. Now you have mixed two different
> >> patches into a single one.
> > 
> > Vikash, preparing for future submissions is a very good thing,
> > however "a binding" can be thought of as a tuple of
> > 
> > (compatible, allowed_properties, required_properties)
> > 
> > which needs(asterisk) to remain immutable
> > 
> > You can make changes to this file later, when introducing said
> > platforms and it will be fine, so long as you preserve the same allowed
> > and required properties that you're trying to associate with Kanaapali
> > here
> 
> Let say, we have a kaanapali hardware (calling it as kaanapali_next) with 6
> power domains, instead of 7, given that one of the pipe is malfunctional or
> fused out in that hardware distrubution, should the binding be extended for such
> variant like below ?

This comes together with the description of kaanapali_next and a proper
commit message, describing the usage of fuses in the nvram for this
hardware, etc. My point is that you are adding support for a fixed class
of hardware: normal Kaanapali device, no extras, no disabled blocks,
etc. This class of hardware has a fixed connections between IP blocks,
fixed number of cores, power domains, etc.

Only when we actually add kaanapali_next, kaanapali_lite, kaanapali+1 or
kaanapali-minor it would be logical to extend the base declarations, add
add if-conditions for both kaanapali and the new device (notice
if-conditions for kaanapali too).

I can say it other way around: the bindings that you've submitted are
not complete as you have not bound kaanapali desription according to its
actual hardware.

> 
> power-domains:
>   maxItems: 7
> 
>   - if:
>       properties:
>         compatible:
>           enum:
>             - qcom,kaanapali_next-iris
>     then:
>       properties:
>         power-domains:
>           maxItems: 6
> 
>     else:
>       properties:
>         power-domains:
>           maxItems: 7
> 
> Also, what is the downside in existing approach where we say that the hardware
> can be functional with 5 pds, and 2 are optional based on hardware having them
> or not ? So all combinations of [5, 6, 7] pds are valid. IIUC, the optional
> entries are made for such cases where some hardware parts are variable, please
> correct my understanding.

Kaanapali hardware is not variable, is it?

> 
> Regards,
> Vikash
> 
> > (i.e. YAML refactors are OK but the result must come out identical)
> > 
> > Konrad

-- 
With best wishes
Dmitry

