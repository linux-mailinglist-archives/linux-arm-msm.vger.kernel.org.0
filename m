Return-Path: <linux-arm-msm+bounces-35188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625669A6016
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94D9FB28BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B235C195980;
	Mon, 21 Oct 2024 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTlb5O/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B76823DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503121; cv=none; b=T7Q/lo1TVWWsVJEYhKIMc2KnX2xrl2m/PB82Ll5iCRxRF83iY2cWhAjeA/MU0VpR4aqsvE82U1H+9KhCWCokTKRvHO+OqQdvtzCmYFxPHV520yOg6aU+O2DguBKOrrOr4tjHo04yMwtNsBV2NOloKVQ/r1LiCxci7RlCYcqQ1IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503121; c=relaxed/simple;
	bh=wYgRHsuBQSWUfJfqlR5IM0BQzaOVzalKBFCEgNsKBCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiVhqtysAjcgTCytEUPKoyiHcwGgwpO5n4sSZiXsatEEXM3IESzUZlVPR49mZBzuEScUbJFLUvrBTDcaijKDEEmcJtNr+SBJnUvuspNHUNGx3zodXs7isFFaPX6NkufDqcFWoxt8N1h0ALllL07aIgYsfly5az710RbHcxUDO08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTlb5O/W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNhILu017250
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fPR/B/rHBV/Ak5XBTURloMnJHkGLWJU2nK6mB1/kVDY=; b=MTlb5O/WLCXNriOH
	4+xgldwiFuNOtemJZKERsdJsW1uBfmh/gJ2tDJ4+soYYyUAnl5ynBt0ZC9qe4wsx
	nVUpld6ricZY43xy2gcp/y/d8qSHsotBToHJ0L3OjJdKBIQUTtLtLfwrKptXg6cW
	P0LbEABCk6iwQhxZttDYmZ8waXKlkDPBt10W+gw+rlRCNbGAp/tsHYcJ/Ay/WEc3
	HNmwSUecRjs/dID2CgJBC+2XhSQ4wSHTId9Dfb477RxByCtB96UjlGDQ2SqKNlvy
	OaA+PG1FsiTTdTPAhwGvmBlimuVM9GJzCAr8Nn+gqjW1Hfju9XzIwqJM4pjBDhcr
	YakuDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc43ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:31:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4609c883bb6so4162401cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729503116; x=1730107916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPR/B/rHBV/Ak5XBTURloMnJHkGLWJU2nK6mB1/kVDY=;
        b=dBW4Kvj1BY3heqWDouEj/60xcI5hqf/NRSYMuuIEQ+iyZ1044Bg59j6DhAjWjy628R
         6aGbMq05K0KSmRyDovvirDLKY+2zBOiXGeC038coWasKJyh4atV35XfBi31aiNU+S2x9
         nNq5fzq9HH6+eWetdC6q/ILsxzT54g2bdsaetV+4DBq+FgqjK5XztymsqEllv8qp7UbF
         GYd7zXfTCrtgU56UPEml2A7ujdu+xn6TYBCZ+KWMcNseW1ognJkjyNRWs8RLKVm/9kLA
         1SqF992AsxGLAPnPzm9HvbLmKgoS9fy8KCPZLnueN/EKvL0oN1kR1VkZn+xAViRajd0F
         JYiA==
X-Forwarded-Encrypted: i=1; AJvYcCU11fkaPsNRaM+AF91KL5hTaIGb6WdoJucAOtFRzJdUETEEK95NZW8uXrjSGz68IBsBGxQ9pc8XPMtTt/bD@vger.kernel.org
X-Gm-Message-State: AOJu0YzzLQYu5eGnMsmfNGIVPof9p7nB2rWE/G0iREZM8X0lQZ5NXFgV
	hu2JHUbXuON8YYym11rJWrHgmJk2dqZTvpuJ7ZCohPFAjKtHu20DE63T79XCQB87kt2HtKlR+MQ
	YMcljrB1/g3ra08Lu/JQyYg8xr9rW90as638KYcvixBQAnVMWvlaGmWXKLkVujN/M
X-Received: by 2002:a05:6214:dcf:b0:6cb:664e:38f4 with SMTP id 6a1803df08f44-6cde14b89f4mr72419896d6.1.1729503116635;
        Mon, 21 Oct 2024 02:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2O0KwDA6JcVjDVTyVWfeD78j3D/8uD+htQv91rhYe8+NiUDqHk/GOqcdLXeUcZIFh+xpOhw==
X-Received: by 2002:a05:6214:dcf:b0:6cb:664e:38f4 with SMTP id 6a1803df08f44-6cde14b89f4mr72419786d6.1.1729503116321;
        Mon, 21 Oct 2024 02:31:56 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913077basm180611366b.97.2024.10.21.02.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:31:55 -0700 (PDT)
Message-ID: <c80309ad-52de-4998-ab0e-05db7cc5068b@oss.qualcomm.com>
Date: Mon, 21 Oct 2024 11:31:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
 <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
 <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 75tWc0ETWcCgN_e1i-xh_-MZFxXhTQ-Y
X-Proofpoint-ORIG-GUID: 75tWc0ETWcCgN_e1i-xh_-MZFxXhTQ-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210068

On 21.10.2024 11:25 AM, Akhil P Oommen wrote:
> On Sat, Oct 19, 2024 at 04:14:13PM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
>>> On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> Clang-19 and above sometimes end up with multiple copies of the large
>>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>>> fill the structure, but these create another copy of the structure on
>>>> the stack which gets copied to the first.
>>>>
>>>> If the functions get inlined, that busts the warning limit:
>>>>
>>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>>>
>>> Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?
>>
>> Kernel stacks are expected to be space limited, so 1024 is a logical
>> limit for a single function.
> 
> Thanks for the clarification. I think it is better to move this table to
> struct a6xx_gmu which is required anyway when we implement dynamic generation
> of bw table. Also, we can skip initializing it in subsequent gpu wake ups.
> 
> Arnd, do you think that would be sufficient? I can send that patch if you
> want help.

FWIW I implemented this at one point.. ended up only rebasing it for months
as I kept delaying GMU voting until we get an in-tree dram frequency LUT
retrieving driver..

https://github.com/SoMainline/linux/commits/konrad/longbois-next/drivers/gpu/drm/msm/adreno

worth noting that this used to be my R&D branch so this is very much err..
"provided as-is".. but it did work on 8250!

Konrad

