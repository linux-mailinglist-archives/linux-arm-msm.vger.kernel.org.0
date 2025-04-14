Return-Path: <linux-arm-msm+bounces-54270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66068A88D35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 22:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99CAC18976BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 20:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464571DF970;
	Mon, 14 Apr 2025 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikVxrvTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C81E1DE9
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 20:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662965; cv=none; b=BMpcYBVwnfiFuo2xomCGiUvC+pxmuNslxydniIYGhfWuJ1bS162bNfqkjkEnfTv3cHaU596kI3yHViXS0h4KxD2R75ZBQIreqKn2DHD5k5WCkM617v2Gj2jw4N5AhnI3T55anujthHR2YBfO8bsEYfhPLeViAwqSSuGAwqxSels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662965; c=relaxed/simple;
	bh=treTBaIxZoc3jdxAPHMCYgFICz5n9kyVrC8UeP9/WSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMvtbmLtIJYHeniDWU8bN7meqbWiPANxXqzC9A0eI9Lt/+CPdzFL8UHUahipF/IheQj2SexleUmylT0eYx8/HeHFmk+HH6wixGD+XbuSdHEi7hziw3K21WGp+FO2RybAk/5mwc8u1jlswU+YmdzFEU6pP6e9RuS3yhpVP+VYYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikVxrvTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJqAc4030628
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 20:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=; b=ikVxrvTU13ys9n6N
	jaLLgH1FaPL+nIYUpFJPW7Q409nPG1nghVHIT6Cx2I1bRUnGTqQYaYpcknUVlAZW
	Qd515P9l5wS0CXUIXBha6uLcHrCyNbrn1gg+cn8BqUsMIPb2arDJOAuU/ED9u1Co
	ornb1tJSAxhEU4uRJZ3pHG2Ct4p/LS22YDGHOu1dsBCUam9Znu1hp3Fg6EJ+T4JT
	S4P5Ph/luMP/LjxzNt27frSZMeHtEOMRCC61liIXC+rmIW3wYIjF3n4+/6s5nYHz
	KE2ouncoT/DaqRlTIPQJu3RNpP9ykc51eXyvXr72x9Fr/aFf4Qf/bwrLUgihG2Wq
	jRfY0A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj5wwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 20:35:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece59c3108so10507306d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662940; x=1745267740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=;
        b=Wo0RlQlGRVyNkc1K/OoglGbQ9KvCOMcF7BKbubbv7F0XTSJ3cbLGCTRBlS2Y4soIML
         owrO8sqwkcBgtS5DaIzpOawn7k//jHyKeujFnB02wQoidakZ+Cnu9RVj2r/gmbkJb+zz
         CUSdlywyue400By9e9l/C62V6GgNP0M3cgW0/JxZT0qyRyptAL+/nT6MJxBNSN4707zy
         v1QBii3pwcV6TCAYjw9h2VtXA1yOcIzmMaRS8ZAy6ZnhftgHIcJ8S6p0h2TtmzNOlBvG
         S+KckarcgO2zj1XTco2tcx+tZVKOUrGN6Wy9u0quZOhHzUm+7SjKK4D5XMmi9Hl+pQlF
         ugHQ==
X-Gm-Message-State: AOJu0YyOA/5NpTpe8a0OqWiDj8W23DUlH7lwW+6ZMaZwhS+AL7+q1tuM
	XYxyLmnG1ZH1h1JHj9ac7+JqiWWNaOBEw3I9pqAA5DYLhWPnXQ+viTSqHDq8xeNEFdh+kahxle/
	GzErb7CWzKOHTSkOVL8Qm7ZJKPOuiHMOduCck7hgFmFDIoK7gb6zal+6qw3GTbC1G
X-Gm-Gg: ASbGncuY8ldxoLzokL42o9ZnX4geMFm6AfHpXZtdCHhiHoX9vHp74Jyhf+0lhsO6cR0
	NkQxucljpnnTxG96lEAJbYk7G7fi/CUE0+U/qNtLRQTi+wLAzs+2H4F2ifPdX+HnykooPqENO5j
	A4YsYnXm6ISHgegj4vdWzWOp1PaJcEDgkKiT2sr1E0GNZ3xYQ0P3vqaEWT1idvgCoGipi8RcWk3
	FEnnOIwhp4p0k09NRJjnafzUV2o9+N+BQoVt7Mdd6x47phcdbJ1vvy7ee6dzkK45lsVqcl6n5hz
	EodkRCizdY4IFiR7no7l+Yy9GqJftvxF5nUdnAoLK3jRA+ZFt6iNgbgE3wERabyayA==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c7af1d0611mr694925985a.14.1744662940205;
        Mon, 14 Apr 2025 13:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES94yre95taymhy/asOVTUHtSDJQP8JMi6CuPlrYL55wGW9j9JqYzSQvw7vL4wpMWwbjEpGw==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c7af1d0611mr694923685a.14.1744662939794;
        Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc195sm993479766b.143.2025.04.14.13.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Message-ID: <9c21f321-1aec-4b36-9e3b-026ea9a810fd@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:35:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Daniil Titov <daniilt971@gmail.com>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fd71b2 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=XF3jJdBvCvMoejL92xsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: wC8fspl0X1Dh_ZBu-4uIDpODMroEcgy0
X-Proofpoint-ORIG-GUID: wC8fspl0X1Dh_ZBu-4uIDpODMroEcgy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140150

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support MSM8937 SoC. Override frequencies
> which are different in this chip. Register all the clocks to the framework
> for the clients to be able to request for them. Add new variant of GDSC for
> new chip.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +static void msm8937_clock_override(void)
> +{
> +	/* GPLL3 750MHz configuration */

So this is a variable rate PLL, I'm not sure how it plays out
with your frequency table - it looks a little different to the
3.18 version

The patch looks good otherwise

Konrad

