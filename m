Return-Path: <linux-arm-msm+bounces-55600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25FA9C478
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49DB19A61F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0F5238D5A;
	Fri, 25 Apr 2025 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo60nUk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AAF233707
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575083; cv=none; b=Z0a1cVqOfgD8way4OLWWKedsyoyrZ8RqbivKcu3Nm3zTLONT/rHhIcQMtSc70nvMXryCjxcRkx0ly0OJi1egxgKQLgP133xw2TjbbmFSIHSI6chUwSq0nop830MJvY+pVlJMzYC3iaqq1U6eAemOvc3CFBgaQr9G2VX0Nou7WtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575083; c=relaxed/simple;
	bh=Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fU7kBLAryl40Hfo5z92jU89rq+JsCTdWDkiDtlkJffB4lMTwhbnbzjHF8iHj49K9K7DPXbRuD8jzt3AyzL+v79J8lUeVqhqZXn1xVe8vX+zVokbdMPj+j20xAy29A62A5YmS8tagOZCRwDDkZJ1Sxb2pRYj01QbcTZTGbYZoxHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo60nUk9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TDDV012133
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=; b=bo60nUk9AriZpXIr
	8ljFtmcUnt1uRxZYBxGkQQlsIai1k8jsLguG+AwgraCpok0IcazIBJZjpNR0oJnG
	KvgS0pzEuAGog/4KSHfuQpdLZcO10pZC9b/uUF/Al2RV0NjruLsFzxsnbmG7Pxeu
	3PcJWrNtdoY+T5Oxq+sgEku3XYUqyme3hcVfzq+y469VFQI52PgGyM61PPtWmBkn
	WbIslN6eW1R5FoyNVOSuB1C5h3wS6fo1bXCfzeIlEE12BfWDz+t4D3cRvFV4mLTg
	1ijoB2emkUJJsQ+MaXJjDtnawqSHOjCg55JBOV420CiR2xDzhZitC5GczT/tgQcm
	5ga5zw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh18fdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:58:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9c5af3dso3380836d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575080; x=1746179880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=;
        b=c5g3m/kPWGvz9Q27GZaovM18UZpVCh2q73DtVYzOIxy7PP7WmG62LXGSLbh7ZfMLt1
         BXsg40gXp6x/UjAlIdyD657MQatmh+97CCW/JV7et3nKAWDtZ04cmEk95PSpr6E/dCHW
         BqAnIUfiqMUI4dG/MpmMYya48HMDjm7iU/kvDw9ZCXb6nA2gDCIeU/fejOPg5kQ2TfEJ
         PudiMnEhIKJ7sSIqnnJBdnen0P5uhMOdUAk9Umtyd2iPia4P5ijazumMk6gyaJKiQWIE
         rg4hi6sF8CQEdmbrPP0PUi8J682Px+mTfq0LUzVn6RTi3JrnCB+KVG4jV967EYN6kM7u
         hhmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtdeskb7F9oRwtc19WGk1twNBn6zrkcu7eXCi7WV4dWI5XTvtEz0+CHERgffBCn9OJTC0o+FzTNpHWrsgd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BlUui9GEK7PQ4F94fMFbr5BbscnLxQbDRb7CmqOcSL5jWVuB
	G+1zCSOENE9dneLIttKbJFuKhGfPKEDZAjzXZdfcQk3dHLxNCTErxtY+cmIE8H5HractPJ7XL9f
	yxk8Se+p9TFcyhsJl/VPpeFuOw9QI6jnIdVF/JWJNwfTxCHDZ89Eq9oi0gPltlZKJ
X-Gm-Gg: ASbGncvZVIXTvG6mjNmxhiRSpohouuZrXNc8wdOzgF/yi2FFcQOBwngK28UMlgWq7JV
	kkq+2pI+gUWD71bJJ4qjhs3pm/v0T97GUzAmv9fLfN7LhKusTJoO66X/IuiKeGNi0vrJyVxppIW
	9pAmO8JFtjmKS7oO1YW+R7ZC0wDXlL1PL0TKmNem3jPXCeEv2PL92du5sFTidEGJnXKpsUHm471
	kaoFqLEQcvKpmVglRGkdDqpoNbRN62cSZVYP5U2Hk3yyL8j0eoi4VuztFb8QakL2yP9+XgJyuCp
	/rgcFn1pzTfGQE3/A1aUznInLlcqmXEpMd5vH2Ga+Vd9SbjKrD/bSMP58+/rU05h
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f4cba5f634mr10002306d6.9.1745575079788;
        Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1aDrr9tIrGOVh+lPKRQPvx999AwcL22qiAWtArNF4QQ88HDa7YW9+wreCLFQKaTgC7b9wGQ==
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f4cba5f634mr10001956d6.9.1745575079389;
        Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5342sm1032645a12.35.2025.04.25.02.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:57:58 -0700 (PDT)
Message-ID: <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AQJnpqcdTmrgfoRdWmtdHYQRDTQqYRXI
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680b5ca8 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=x_pH4qmy28IV03WXGqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: AQJnpqcdTmrgfoRdWmtdHYQRDTQqYRXI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MiBTYWx0ZWRfX6zis/hRPB9GK YqMDsxfQtjkMhP+0LJ1tjjTpMMZ2fJ1tXk0NxZ2baQXf5RWWywnPqY/Rs4Pmhzc5OZGemd/EtiO URrrNHohi2rOVPbT85bBuUCdbdI0PkjEjkW1HvbvArg6u2n1g/yoH0N7eYilHAzU1YrinUuGpd8
 tEVT/HHIr8ZoMbWErx3bhRJDtnhGJI7ejx8ycBVnvJRZtp0A3/uF+yDDxfDdt4cHSPVZMO6FUsy zQBtYoOnupV1OAnlhy1Y5Sg0nOTJr/+g0VGF0Af5NpjDuTPmTU3SBV9Zlnb7e+ky8TMI1GTiza/ Eq/EcfEASebN9/T/gLql5i5lxzsTic0QiBtoVDZsCX3TTmzPUiAI/ufF3gfRmeItoTGWl6DUrQg
 tA9LMiogg8nj1Nm2Yv4nUXFnaad+bNbNUPQ/YQECMYFgbF0S39mO61cCmiZf8fgW/cxWEuYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=932 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250072

On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-23 16:03, Konrad Dybcio wrote:
>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>>> +            gpu_opp_table: opp-table {
>>> +                compatible = "operating-points-v2";
>>> +
>>> +                opp-19200000 {
>>> +                    opp-hz = /bits/ 64 <19200000>;
>>> +                    opp-supported-hw = <0xff>;
>>
>> The comment from the previous revision still stands
> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.

Right, I have a series pending to improve this situation a bit..

In the meantime, you should be able to define the nvmem cell and
fill in meaningful values for this platform

Konrad

