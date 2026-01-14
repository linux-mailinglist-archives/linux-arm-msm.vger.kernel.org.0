Return-Path: <linux-arm-msm+bounces-88891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D5D1BE1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 02:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AA143004611
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 01:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98D41F1518;
	Wed, 14 Jan 2026 01:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD9yqTFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRNLbXvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7A13E41A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768352553; cv=none; b=RGETvL76feAHc6sgr9WUsrj1Fv/BwUyqM222RXzYTBAlxSX04SlPWhU/IytWkk1t7aRskdlJLVoPgxaHTJtWEuO/TY7PZc14E8bo19rdrGZJ6nbjE07aqPfGkZ16rL2fjTNPL55oc1nVQxoe4CAyLIrYPoqTxq20+iRhiGpor08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768352553; c=relaxed/simple;
	bh=eqdnrf0xiCNvd5DPFiMQi8C1gxRwJUjfMbU2g7qs8Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxslZC10vAaSMTQfk6zmKdoE9rC8wtdVkcGpOPXxp/z0nILeUwBrKFhgEOSQYWNeDiyu36yN0T9Oq92xd4+8wxm60yaRByYdnZjRpeesm1xN71QnjGlniHrCrBg6NWdeC9g6ulvMFKr7Jv60Lk1imF33B5ymtSfiyblFFquFaxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VD9yqTFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRNLbXvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHrGj1960724
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h18ZqtLLvGt/Pa+wG27Y9TqJ
	rGVZgx2iCCkSzGerT+0=; b=VD9yqTFR4gXnt3n/FZpIJQX4gpBL0ktXG9WZhk4I
	yY4RP+jB+88nfH8GbeMS3CYOmrUAGd6f5r6QDFSKo2QJYbxcAzDy2ncylVXPV5Ai
	Bi5HQfHbT4B2zCMSiD9oNI4P+c5fWJYNmHsgEAr7S2+a0c7vaom+JUfPR8YzKGm5
	HQiTvZaoRfw7JD0d/eXnVqh2iqtwxGqyXuxrhF4uyMZxtkxXiKFO43FHJ9eWLGiU
	AkNKR3aAdeux3ByK5/j4R1deWK9zdYewlq58tzEOHwMVkOSxFKtMZoYcORTJsws6
	ZVcSNJhWeNIr/jZJkmrAALiSwD0RyK5O7/6RQpgDtHNJAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89g92f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:02:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c2a3a614b5so95602685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768352550; x=1768957350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h18ZqtLLvGt/Pa+wG27Y9TqJrGVZgx2iCCkSzGerT+0=;
        b=bRNLbXvPsABuuOmBxD7K1aXabCRqMqXkRl/rrlbPAObF0WhqlZrjJZZuS8ZYJW75IJ
         SrYdBdHyfmgcF/CFcZm+gTP1+lhRe2b4ZGJEqhxiGZ472NmLcRMXP/NwRUZfXoUAXsgt
         6hV5cSu2EJpne1UFBkoaPYUECdyRgnGObexBnYUjf/KjWIu/eLoMRiVfHiRMfF1gVYic
         tK8YuOi6FhrVJD2U9ZJmdz3117DxA9GE+w4TWLGK6Y/Q8+kJ/w6YEr5sknNNsAnnRVka
         mitbPQQpxUvJNGgjzSfKSPRaHpEWwcTvbwBOq1hl1n6ON6lW5HZ54PV0nXqykStjSx8r
         sKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768352551; x=1768957351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h18ZqtLLvGt/Pa+wG27Y9TqJrGVZgx2iCCkSzGerT+0=;
        b=WiDLhqAOFpL3/GEI2dXeO/hnBKKnNUJORSmTDih3OsTbmE+88WHQ4V/fJRUmx0QnO+
         Dmz/rvEWErz32NjJzCDijvJ+3fmzYD1XjVXET8bsZoCoTdHGt8sYH1pYjy2O/E27QbaO
         qBkcrRjNKL7t7T0UigvgSqTJtMyPRztnjqpLRt1vIQyRy7rfpLuSWgGzSTYw1OzntjCL
         AhdaW4uKb+zAnoZhI/TwHFPPXtVsNN1VTDJJyR4HKw+6vYtkpiYgYKguTm3e+lE5hdht
         1jp4eGgWDAqbvFKEWBNFbiEOEbepWGfcJsq9hJ6GctZDitmT64NjgsB3DRwc+dL+ocde
         CFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpHODS1h2vbRi3YeJD+sLDzdytxhU9MliDfJlMba1mrUEJtJFskX5cR/mSvNXO6S8bJ2FGHnes9CsigMK/@vger.kernel.org
X-Gm-Message-State: AOJu0YyBSkTHBwLtrPQaFvUPJVKNLd0so6TWNO6BUra4OJV2TbAgB1BI
	Wxbfx+P+9PLE1GzrWNMdHyRhubcgv8iRgzs54ONQGSf4kkuy5d4/825E6r5jFxD2dIDrGy9KQeU
	uLa3qs+4QtMQn+pims9CjdFvgkNOiPGB33U1O762s/B+F9zQBZ9OqLZ3Wb2/b08W+YWmB
X-Gm-Gg: AY/fxX4BgaBiYNoyjj30oT6ALaK1u+5ztEOKwOTQEATSwKUssh6V8fv9jcu931lznCp
	0Of/GZfYVJFo3a7xR0cmeEMS2bkPGUqYm8qKa5ulHU8mQRs+NAdzMYL4y3mTJXKFX34Amz4EIZ0
	IhJ6zgtOKM3Zhsax/7TtjVAoXYEj5DYsrHpJ3czYxE+nVNCB2edt5IqV4qvDxoIybuoS4i+3V91
	moxwx6wtNGWitDHfpUmLv6eoHhjs7BCPo+3wJ/baSj3/BfYsa4tZNELGR4TYHvWTUdQnG9er7tp
	hjXc8iV+e1p+ujEICTRsAGYVyqWUX0aQ7R2r5fRgrrSecoqNuu7l6/PgmfVxEOZ09EZN6QleCO1
	LQIvv88aZtVTcnpDmZDE5FEfG3quIUBGeALtk66W1tWoTqNipNTqtrSpxLChFHupZoZZs2YD1ho
	hlQQetq9KuPYqwDROSQi+5uRo=
X-Received: by 2002:a05:620a:31a6:b0:8a2:595f:657 with SMTP id af79cd13be357-8c5208a4cc6mr654200785a.21.1768352550520;
        Tue, 13 Jan 2026 17:02:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:8a2:595f:657 with SMTP id af79cd13be357-8c5208a4cc6mr654194785a.21.1768352549807;
        Tue, 13 Jan 2026 17:02:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b464fsm48970681fa.20.2026.01.13.17.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:02:27 -0800 (PST)
Date: Wed, 14 Jan 2026 03:02:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Message-ID: <5e64ih6c4abydpjto2asvd2dev2bu3wlqp7rbryr75vzcf4ubo@ky6t7rkbf6wr>
References: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwNCBTYWx0ZWRfX3CDuIZYkbdsh
 deoo05iBafcPJmkajQ1LWB8jX2QUlPbcPjSd1RBY9fDRYuTogp3S8qf1IuypNWVqU+0P4jyvGAa
 fWF9E7jWDCvzTROX57QJkTrrjhlrlEGtelRNjzH197ACuCslzuiFw+87RtYQ0hP4gbQzXgsvOkV
 M3P91AbRcPshez/tLdTwvzv8MWnnt9Qiu0tb/iFezzV32KGRXPSZJoDnyd003vt7trt/XmWPzXl
 QYoQdpKFFp20iU3Tw9WS4lPmO0FVnVQ3eRIcZ6ZHhiQA4cZmVZ5+FiVQY39cyeubdj6VE3xYbZN
 rMny909abK79r7NAmBCbyf3Ac6BHbxYRZ0Glha8DHDnDgJKjtoH4cama4wB2AXRWip8zQ78EdWR
 /0Yd2RZpoDTXSO4cw9IpvVZbEZsQf7OIWhAzs2gHPARCP1vF3/6x3CaLGL+bMV73qaRasTXHCN/
 eM1wT8LMRf1/N2oTxIg==
X-Proofpoint-ORIG-GUID: R9QgE6w9zNlzgqz9gG3NAkflPizvP-8Z
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=6966eb27 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=oHda18c8P31K-R3mfaIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: R9QgE6w9zNlzgqz9gG3NAkflPizvP-8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140004

On Tue, Jan 13, 2026 at 05:00:31PM -0700, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> The zero division happens if the else branch in the first if statement
> in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> zero and it is not possible for LLVM to eliminate the else branch since
> rate is still not known after inlining into msm_dp_ctrl_on_stream().
> 
> Transform the if statements into a switch statement with a default case
> with the existing error print and an early return to avoid the invalid
> division. Add a comment to note this helps the compiler, even though the
> case is known to be unreachable. With this, pixel_dev's default zero
> initialization can be dropped, as it is dead with this change.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Transform existing if statement structure into a switch case with a
>   default case that early returns, avoiding the invalid division
>   (Konrad, Dmitry). Add a commment about the reachability of the default
>   case.
> - Drop the default zero initialization of pixel_div, as it is no longer
>   used due to the new switch statement.
> - Link to v1: https://patch.msgid.link/20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

