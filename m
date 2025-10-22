Return-Path: <linux-arm-msm+bounces-78317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C38BFB953
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ADA618C1103
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3C032E752;
	Wed, 22 Oct 2025 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHRMhbOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB142FDC2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131799; cv=none; b=mqDv7fUE2eRslLxCgFFuzm2SUgPN2dUF3VJUyXBJsPybMrf7kQJhytY297IulF2/fottovmInZ3goViAJMXTzMj5/W+9R3qCLMUBKXAqg5p6q3p5k6HjHKDFf8hbEB7HO5gRytP+FCFh/Dj0mSjpSeZVZZG0C1BMUvdUg0zGVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131799; c=relaxed/simple;
	bh=Jm3uLOZtRPxHI6IK3sy3F4UdLfXMgaAjhJr3zJ5I8kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIKsm7tfnWq20nTjbmHP30/5d8c/fl6tlic+D0aA4ks/ZdjlKyhieJpRYMEJogdyMpaG9LEY+9jYucZIrVG95T1L7VEbEfakPuWFsz75KphD4QwxYQxlCFyu4ZPd5LwPyVnOokfTpLD/VJfioQBDHM1njdtUXmAhWqNNMgvBAGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHRMhbOx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAQNj8005281
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 11:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/XKwr4n4TC+ITwBrL2OP0RDLGxOxAW/3WtJ2aFNP9o=; b=RHRMhbOxHPMQOxKJ
	0bC5I2cBeDk3Q/JzcE/rDJ2OcrA+AFH5rjuOiFPotYhxJzUX4UBKkPgxTKCsG5mE
	6EasLvQxRsV/HistJlTJw5CqLGVmAe0zsRcgHgeQgDWGj6fNrxEX4eZ/ekmfJXla
	L3zRHLZILCndOWCHF4nbhNObm4zyzt3kAf8yzaXWVpCZwBD2UkcyajdYKwC/UEgy
	xWhPc8drdVA5nEunzehj4S/YwjcOb4gh43QiDqq14MZd73k/HSPF/nSjd2MAMuCj
	TMmh8VVjWXfRRA04QWiGv+HQylTuuPue6lmorNQM7O1Fu2h8mkJvkJFX126aQwh7
	ZhDdpQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfmbvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 11:16:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87dfd456d01so1001216d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 04:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131796; x=1761736596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/XKwr4n4TC+ITwBrL2OP0RDLGxOxAW/3WtJ2aFNP9o=;
        b=KsPaXtPPqKDGenwmTtP8qMHQ5dHtHbfDEdreYS+p4F5WuTpkUM2yO8zM5M2FZrYBVp
         PlUmvM9yh/Z3BTlGDcTnDOhclw3qlpZwNQ+TiHVp4RAGBecLtS5b70DnGeZElXm+J/U8
         wIZ4Dx4ilj7Gs3Tf+BIBQL+c4upksODSmOXWVnLD3XgZZzblkypl7ThYTNgPddzKPmXL
         QHnT++YOHKOKC+CZAoJQF0L9S+tAL0Y7AolyuEAjsAfxhoy6XDq9Rw+DbvX4NmAN8atH
         0o3k5DbC61pq1A5gOk6WUrMw06g+wnHbL/ZmvzS7xH14OLsYob/0Txafv+9UJDN685Zc
         XbFw==
X-Forwarded-Encrypted: i=1; AJvYcCVulMDBXwUytchgKKW6i7DRT7yvbl/hSwswB7Cvv36FwuKLuPUyNa8sraMfA9+L8aLuzwaRhe/LwPtOwN5r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1LznKgiPOAUyFFEq2MpI+YKp05Q1Lr6XusE1jXWdHb5qqdmDv
	iWo4AcUS1KOy/7kH/7IV1TTAwZtklK8ofANxlVPNW2gyh6cKaz13yOrEa/wKfYkriwn3MEdxjB3
	p8//j5vM7mV81UrXKf2vrtogEaRn0vwyIPzmoDGYxVqU7CDUqouX6Vcb/q7ZpssndNkzR
X-Gm-Gg: ASbGncv8vvAuXMznHYygXX4kDUAcHPxqCDYyDS1hmcT2xqnyENcDwMubzIt7UtAFQNp
	M7SZF2z+z4MuuR/h9TSSa9IY/6/jygW+p5pSw/A6yCKdprO3PAoqGGgSmloc2sPK0SOxS94JFqp
	0f8c9G1xb2dlCroaFZBX+bPZmaA55KNDJ2aax5HetuERlzmPtEIE+afuAYrdWoPj9rudo6TDpVM
	6NE+5g6i8DCXsy4RVRLen39LE5Xngbz9pf4SXG8OmvJHi0XkyK4GYTx6OywGcc5970M7Xu9k9Ua
	qsQINrsi3lzSqPrJifQxkyLiW+8LdHyFn0SlrLGzkFCo/aG0983ZKCUSkmSC8UPduKBB1D3jXmF
	gxKdt/hMrdp3LJPubIrvAhI8bgQhbgzlWP7eiqjvRzQ6p9fa5OPX0cnKj
X-Received: by 2002:ac8:7c4e:0:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4ea117a5b7fmr52762781cf.9.1761131795789;
        Wed, 22 Oct 2025 04:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeA3+PEnZOUseZLDtXfAVmeVdOnmr0b8PKWtvHThf68jn90VUbNoN9ykrr/MODPrJ/wV25QA==
X-Received: by 2002:ac8:7c4e:0:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4ea117a5b7fmr52762431cf.9.1761131795294;
        Wed, 22 Oct 2025 04:16:35 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725f3fsm1315242266b.68.2025.10.22.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 04:16:34 -0700 (PDT)
Message-ID: <349b031b-7e2c-479d-92ed-52b7ae0d15bb@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 13:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
To: Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
 <d6ivp57mh77gxybjvvwpmqoc5fsy52yydtvs23bepwdxgkxhzj@ahryeick6yaw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d6ivp57mh77gxybjvvwpmqoc5fsy52yydtvs23bepwdxgkxhzj@ahryeick6yaw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cped-JmTpcjKr31pWhKXIOZWb6Olg05-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXxWq2mJza7esM
 BLyXOahnfvHAsEJ3jnE2iud12P2Wzqw0KjakiLN3Pan97xTq9VjWUQlk5M7rOv+bcG3EzfHwULe
 Bv+NcqU27exUn1Vvv35WOhKGCGGcaKMZ3cl1NYK0wL7Au+7wuNfm2hi07+Dbxi7FsN1OUXcdgfC
 HgE0zYPddFfL0HFAPoH9nevenO4QvH5lT8t81vUuwEAXo1Tpx28NQpu8/bQ6+AHX9w0Lva6PQqy
 8IIDlGQwu5won/opuWVEI/CijRGujT/q2REPjHhzeW8LM5ryIz194HCa0NFuXgP5SNTwOUTi8Ca
 OmVUgnQ8N5d8+iKTRmZTiGui9upPCSvq3JuZEr/l6WmdQK1r/fAyLgWjGShKPq/XankhOmUmrgR
 nbnGrPxFAedFfWsLKsH27ukk6+NUOQ==
X-Proofpoint-GUID: cped-JmTpcjKr31pWhKXIOZWb6Olg05-
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8bd15 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=3ACIv-cKCvEmzLgNCBYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/22/25 12:51 PM, Abel Vesa wrote:
> On 25-10-20 12:40:24, Krzysztof Kozlowski wrote:
>> On Tue, Oct 14, 2025 at 03:38:25PM +0300, Abel Vesa wrote:
>>> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
>>> version bump. Differences are mostly in the DPU IP blocks numbers.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>> Changes in v2:
>>>  - Picked-up Krzysztof's and Dmitry's R-b tags.
>>>  - Fixed the bindings check reported by Rob.
>>>  - Fixed indentation reported by Krzysztof.
>>>  - Re-worded the commits to better explain the incompatibility
>>>    with previous platforms.
>>>  - Add the UBWC config patch, as suggested by Dmitry.
>>
>> Where are lore links? b4 provides them automatically.
>>
> 
> This patchset was enrolled with b4 due to logistical reasons
> which lead to losing initial kernel tree.
> 
> I thought the b4 prep -e should be the one to use in this case,
> but now I realized that has a different purpose. My bad.

b4 prep -e base_commit has always worked for me

git config alias.last 'describe --abbrev=0'

-> b4 prep -e $(git last)

really handy

Konrad

