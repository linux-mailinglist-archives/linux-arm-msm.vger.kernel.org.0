Return-Path: <linux-arm-msm+bounces-43893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDC0A009CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 14:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F287A1641E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20311F9EDC;
	Fri,  3 Jan 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIFEOsUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0E1C4635
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735910236; cv=none; b=jn6GVRlN22IzQZnN5EALLqu2mu8KxkZNbu3GJKK0zlkHGVcmSjw+c2J3RAEtjFt6XsZt0yIU4Bb32rx+IBK7fXFJ0d3KO7a/1qClof4ovXFgrUgUeYhx1E87VjWSyJltLPi9MdGFTguXieV9I2bHvMRAtUR3n1ML+F3rGlsb9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735910236; c=relaxed/simple;
	bh=Vux66JIo9LpXiYb42IhGz34aUYTBeyvnx8BdvdU8CW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUm87GiXk3GgaSmaFtfdbf0QxOndvXzd+2tuuIwTIa9qolheJewwX3QpxuzE9tyHttITFL3WiJQapg9TGNKGdc4vVxCzACrffQVRDGlht0066NH752T1+g194cMdo8fNtpMosRqvyJqWPJYlh7fRRjr2bajWCgnq1IhAKKxqx+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIFEOsUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037NcMb022882
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 13:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1q1wh1ohBA1s2IZdpVNuXeRiHvl62TLjF4GHpyxYG8=; b=bIFEOsULh0v6LqRt
	KF/5VLnCKIKxNXtZr5vphdwchT4SKASN81rSCh6aB2UBfQB6oCnO6JdUB4yhYQMg
	dMgGpBeKjDa1hfWVd6q29ftn0pTw98s31q2M0a9nzhfeBQp+PsHsG0rFhVW06ePn
	P18CbkEvava7vz8w87FdHFbs5oZavFOgNfE3fjAeJNi3+FF0sWS/JWyMHyBX3AjI
	2dLJu0K7f4mxR2/X+3Glv9o8FdfaKeDny2luTNfiI6tyOET1QlGNAENx67GBPI2G
	880wMOIxLlP53xzCdanTZhQ/OmS2hfJTSsmvn4y2uNdUBppRkqPpP/n8zlONycrp
	cnP/Ew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xbfe8qem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 13:17:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f499dd80so31379985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 05:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735910232; x=1736515032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1q1wh1ohBA1s2IZdpVNuXeRiHvl62TLjF4GHpyxYG8=;
        b=ahGu5xbdvRTU1kCQzPhB1HIylmbomCs2kztTTwo3PeRvZTMFi18hx5U3kYP9OUp7sV
         sEXH1qR5e3OjgAm6kYnwoeTdV54Kj2luF+GPPPmOR9DXhF6aUqvD8rk7XO5K+7QDULZE
         X67WlMIP/ylcX93rlUZ/Lc/0GNIiZ01AKDg6n1Im2AimwD/OC61AJ44LN80taKyXOIOG
         qsAOJC3odtEOFr8+AGu5Q6BbeTIsJM5XJuKq4xzVXrBAFX1mqAp+2N3EeZKtz4ew54Yg
         yXkcLiW2LtuP+dcS9vpC8vbRFvMQB4ZO/Ks06ESKdkd6W2qN8jj/zC1NZBPtq+9YZx8A
         exoA==
X-Forwarded-Encrypted: i=1; AJvYcCU3EY2vDAAxIpyQ6Zw4MiE9Gqdk32iuqHiZPiY1kXhBdRsoeeuYf0BmNNq3DC9BmfxXuMCLZRuhXzbVfvBU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq+kuyXoE+VJOmHX3y/hdMA1x4i1Dn0sgeEG2ThXw5LIC8u9jP
	aeJGv28bkcJY/ddZjJoTuQA8nrbs+D9P86pOEGQiT57Ciuz9xmHHbem9m3ivfwxNW7Ju3qA7W8y
	FBh+WOxsyqiCfLpSALHgfVxXcx51xO6O0icz/JiHRWvtU/5sJT491+aOO1AbT5NEo
X-Gm-Gg: ASbGncsTNI3skEzMJcGRUwZtquSETPiO/H8qxs4jk+ujdMOXO8E2HlKNLjWs/mNd5Qn
	2dNrlcjcw6yot8Ydxd8RM0jUqz3Ph9+u5cMGGS50gXQr+d8ONWs2LFaR0JgFb1F1LcteAsDh6k3
	lYThsKZkK8uKAUSd0nl+/iYkSSJK68c/X5Wb9m0YitZ0AFPxcHeLzQ1FTJ8nJRwC0i17I1Pidkl
	s35HMF4A3aAWVfOTAsxgz2Guag4y3Rg0dxMmboY8KyKYEcTYhlfDPsIGH9CTMOci9M1A4adRAfB
	xc6BwHYPQp/8w7vA6W1CJIP2pr9GTYTgk90=
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr3200280285a.1.1735910232208;
        Fri, 03 Jan 2025 05:17:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSmMfwTPh72DgP1gLomJD8Ts7Fcs3OeoKbSCJuP78w7C/Q11yyS0ZYLAlg3Aq4WEY3nP/zqA==
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr3200277685a.1.1735910231761;
        Fri, 03 Jan 2025 05:17:11 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e5029f8sm1884602966b.0.2025.01.03.05.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 05:17:11 -0800 (PST)
Message-ID: <1db8780a-d7ff-4eb7-b6dd-835327e55d21@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 14:17:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8550: Don't park the USB RCG at
 registration time
To: Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, linux-clk@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Amit Pundir <amit.pundir@linaro.org>
References: <20240819233628.2074654-1-swboyd@chromium.org>
 <20240819233628.2074654-3-swboyd@chromium.org>
 <CAE-0n52rYVs81jtnFHyfc+K4wECvyCKmnHu2w9JhPNqvMYEeOA@mail.gmail.com>
 <1edc1fdb-ccf9-4dec-9669-d8c33511c7b0@kernel.org>
 <CAE-0n53p3=-dJLRXkkReUXWEy=yNUtLvgs2R6tMHtZmtYZSxXw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAE-0n53p3=-dJLRXkkReUXWEy=yNUtLvgs2R6tMHtZmtYZSxXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4-rkQia8LbCti8l-cm_LGEu0om-aHxmx
X-Proofpoint-ORIG-GUID: 4-rkQia8LbCti8l-cm_LGEu0om-aHxmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030117

On 30.08.2024 7:59 PM, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2024-08-30 05:24:20)
>> On 27.08.2024 8:12 PM, Stephen Boyd wrote:
>>> Quoting Stephen Boyd (2024-08-19 16:36:27)
>>>> Amit Pundir reports that audio and USB-C host mode stops working if the
>>>> gcc_usb30_prim_master_clk_src clk is registered and
>>>> clk_rcg2_shared_init() parks it on XO. Skip parking this clk at
>>>> registration time to fix those issues.
>>>>
>>>> Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
>>>> registration") by skipping the parking bit for this clk, but keep the
>>>> part where we cache the config register. That's still necessary to
>>>> figure out the true parent of the clk at registration time.
>>>>
>>>> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
>>>> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
>>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>> Cc: Taniya Das <quic_tdas@quicinc.com>
>>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>>> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
>>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>>> ---
>>>>  drivers/clk/qcom/clk-rcg.h    |  1 +
>>>>  drivers/clk/qcom/clk-rcg2.c   | 30 ++++++++++++++++++++++++++++++
>>>>  drivers/clk/qcom/gcc-sm8550.c |  2 +-
>>>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
>>>> index d7414361e432..8e0f3372dc7a 100644
>>>> --- a/drivers/clk/qcom/clk-rcg.h
>>>> +++ b/drivers/clk/qcom/clk-rcg.h
>>>> @@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
>>>>  extern const struct clk_ops clk_pixel_ops;
>>>>  extern const struct clk_ops clk_gfx3d_ops;
>>>>  extern const struct clk_ops clk_rcg2_shared_ops;
>>>> +extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
>>>
>>> I'm considering inverting these two rcg2_shared clk_ops so that only a
>>> few clks are parked at clk registration time, to minimize the impact of
>>> commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration").
>>> We're up to three or four band-aids, that we can probably wait on
>>> applying if we make all the shared RCGs determine the correct parent at
>>> registration time but skip the parking, except for the display clks on
>>> sc7180 where that exposes another problem with shared parents getting
>>> turned off during probe. It's possible that other SoCs will want to park
>>> their display clks as well to avoid that secondary problem, but it can
>>> be an opt-in case instead of a change to all shared RCGs.
>>
>> Are all cases that need the parking obvious like it was the case on 7180,
>> i.e. some downstream branch is stuck and there's complaining in dmesg?
>>
> 
> I'm under the impression that we need to park the clk when it is shared
> by a remoteproc/firmware or is associated with a GDSC. It seems that on
> older generations of hardware the GDSC would get unstuck eventually, but
> newer generations stay broken and cause all sorts of havoc.

I heard newer GDSCs are funky..

> Note that in my statement earlier in this thread I'm talking about
> parking the clk at registration time. That's done to avoid a problem
> where a shared RCG turns off their parent PLL and another shared RCG is
> also using that PLL but hasn't parked yet. The solution was to park at
> registration time to fix that. It's mostly a workaround for the fact
> that the clk framework doesn't have a good way to track dependencies for
> all the child clks that are enable at registration time which want to
> keep the parent PLL enabled. The problem is that it breaks things like
> USB that has strict frequency requirements for the link.

Should we just do something like .sync_state, where top-level parents
aren't turned off until all clocks have been registered?

Konrad

