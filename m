Return-Path: <linux-arm-msm+bounces-67871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586EB1C37D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19A9E720914
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B4428B7EA;
	Wed,  6 Aug 2025 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2HPfkB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1092928A707
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473176; cv=none; b=TC+qqqJ3b8DRRwFZJ1rgH7ifKWY/+acTzBFohJ1oXMNko17II/Mg6tiNQ2pN72JowjMF5aeYvC/Ty1lLVMSKfjKZM3V8xXvgqgYf/0k+QMAZFhtzMoOPR/x6N4c7p2H0vvUfQoUaKmivHib4xNjFpCFptvuugAFJwcCu2I1loHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473176; c=relaxed/simple;
	bh=KPUAY9yBuctZ0Z8DerzHJeY3UR0wctdNL1pgFMf9FGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSmgK1YEdOoGhiqmmhOC6lxbgqMqJ7M9jGJK29alBJF0Yq92PH89owNdVk9UrOp3gCeEyPa3lZ0jhmHGlriIJU3oz/amJnmW3k84j1yTSsVh34MABIDhHYA71VayddPCl9JPDSeSJrjPRfn117SuNEByod7kfzKCdMC5OJ7iRmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2HPfkB8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766PXfM022161
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 09:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCps6Q8o0qeIN9x4RG9gyH4kGs0jBz7IAdjztQ9kO94=; b=X2HPfkB8gVhHoZ6X
	UGaSFjr40YUhmfkdL4cLflWksihvaSuZuA+M+fOXSzmGxb5Dnktg6f4GCr9OHlM8
	7ebYcTFyPrD0xCcDI5jXIILKeeU4DxTzoYtBCARZpbtJUXFcdvKGb71dHTjmlAyJ
	QOmK3B5uZl2eJ0YxPQoMGBPS8ddsERKtfTuM3reV95xJIJcTOYhG7cg6x7nSrLxo
	hAULLyaMzsjTT7tnqKGNn9VvlIqu2P08tozXe6oJip1ixW5arBYeLzhF7ERYDEkE
	6FGPvZZuaPuPiQd1oXBZJ/XymdLcLFUtz59/kSgzfMyUEOFHbkCRM2GGG3xsAFBi
	tsBCnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8a530-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 09:39:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31f729bf733so9438694a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 02:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754473173; x=1755077973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCps6Q8o0qeIN9x4RG9gyH4kGs0jBz7IAdjztQ9kO94=;
        b=q7GJ+TXLv/NWpDWVgdnmzNO5DJyAGsuMMdVEjUbmpcMVlKiT65/WdOTdOuV6ZvZ+Cd
         2NkN7r3ZcMrRTXvXXtBFlsqAu66FtfZXzFyE2bNNhCTY66jBnSK+YGK9UMLk3D6H3XLQ
         tOpafJjbU2cSMElUByBsevAY3debiq8TOZbSxkWTdW6NcYalEt63fgHB8MR/qiOpCWxD
         24ItNBASONNb9EMBAoZHKhnzgR/Btm3xZkgxtOmbCG44z8kw2QLmawa7VB3eMGFqmX3w
         /zslg4duZInxcYYvy6H1s3X+5Ei0k25PGIFW4p3AW/fWdp+2GwbrTPQcsMoSqA94nfFX
         EABw==
X-Forwarded-Encrypted: i=1; AJvYcCV4DX01zj/ffu8y2/3swoE/yRHGEqHnZxv2cU6KEQzwaeCBMgD8QTQMlB2YtB3HsuNiOW38LgefNLemp8Jg@vger.kernel.org
X-Gm-Message-State: AOJu0YzbUvSxzUnzMQw87MTQf0wSX9OCHQbs4EafKkGXKCQp5O3wl7dQ
	ftfTXMYl8UzWXN9dF60tZNlVqqZy96gtD6bYJpNITSulw2sm2NXaE9UMzadUov59VXI/CcYxfCc
	OrzP+IOXkcZntBXzSUlqzIwmwWiJJMJVuGFqLLpw0ktBfI9JWLPn25S/kARAPgC8M39xu
X-Gm-Gg: ASbGnctpfRwHLM95O88MmqUzhTy8ynMuNA7YM2gchABV1AxunevtICCOCgn78Fqboxu
	8545dEPf765oJ/g+hTVfTShZ1bAftvU3ht/j8F2Fxy/JTkA6AH1jtcKKitzjQ4fRl3MeiTrc9ns
	eTGHjhrljgoKDF82++b0cZN/usCZFvPj2liYr1+1/wx4qAfI/22WCDJW2U5At1vEZsH1QNoOi59
	+pv7eNZBdcDIWjUqUiaQqCtiPaHhez980RaQpZfWpYHZ9/FbLP9CRMdNy70K9SxGIFPjcfw462J
	9QbQssToz7fykraNyXTYjfR9IFbzd4vHiCzyUWHee+yWkaN0aLKtOzXiZusEN6cds1c=
X-Received: by 2002:a17:90b:1c85:b0:31f:6f8c:6c92 with SMTP id 98e67ed59e1d1-32166c2b18emr2718179a91.11.1754473173345;
        Wed, 06 Aug 2025 02:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUleDTUw5OyRyFEFXLE2Lpb3eq7PVabmsgBfWwCw59gHI5xkfv+3BdVifFFhie4I/XngwJ9w==
X-Received: by 2002:a17:90b:1c85:b0:31f:6f8c:6c92 with SMTP id 98e67ed59e1d1-32166c2b18emr2718142a91.11.1754473172908;
        Wed, 06 Aug 2025 02:39:32 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f61asm15015166b3a.3.2025.08.06.02.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:39:32 -0700 (PDT)
Message-ID: <db8241b0-1ef3-439e-8d74-a3cb86b610ba@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 15:09:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
 <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
 <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
 <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CnHuvVs1_0W8p4lBpMeXgrwKoL7R__Jp
X-Proofpoint-ORIG-GUID: CnHuvVs1_0W8p4lBpMeXgrwKoL7R__Jp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9LJIJH1JdWHh
 2IxHq3FBqdEWILpAemepp0nQwk9G/KN40HCjUUrrXpz2HbwN0Q5kf23lGfNFVP3SODWddwur+oM
 esAYsCPqqqki5vSui9dhBid8qhXX2wPmGHD38OGR0bs0+HOYC4seLQaYMzN5bh+ZnmALSRwFIp3
 pF+HJScgdAeJ0/1svASlB5HlxxEOENwKpj2qEm+QFL/JRalXnYs9RK0dBwFX+xrnC4dy4vjZ2AV
 BLTjWAlj9RKyq5LLE7AxoweJNx+CcNtbDj+GuULwzH2M1pubw10dj9i5UQTtJzUP5jQEwla+p1G
 KvTR6cWxWBSE8btebp1DyDheIZXH2WdRHmoS8bIZFDVcX1wLwQUpsOnFcOG1jWnKKK8PFjXktim
 2mcUGIMk
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689322d6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=_mglsAVLPU-HLNVybtwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/6/2025 3:00 PM, Konrad Dybcio wrote:
> On 8/6/25 11:27 AM, Taniya Das wrote:
>>
>>
>> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>>> boot. This happens due to the floor_ops tries to update the rcg
>>>> configuration even if the clock is not enabled.
>>>
>>> This has been working for other platforms (I see Milos, SAR2130P,
>>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>>> seem to use non-shared ops). What's the difference? Should we switch all
>>> platforms? Is it related to the hypervisor?
>>>
>>
>> If a set rate is called on a clock before clock enable, the
> 
> Is this something we should just fix up the drivers not to do?
> 

I do not think CCF has any such limitation where the clock should be
enabled and then a clock rate should be invoked. We should handle it
gracefully and that is what we have now when the caching capabilities
were added in the code. This has been already in our downstream drivers.

We can add the fix to do a check 'clk_hw_is_enabled(hw)' in the normal
rcg2_ops/rcg2_floor/ceil_ops as well, then we can use them.

AFAIK the eMMC framework has this code and this is not limited to drivers.

-- 
Thanks,
Taniya Das


