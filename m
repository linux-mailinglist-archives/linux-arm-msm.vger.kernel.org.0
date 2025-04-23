Return-Path: <linux-arm-msm+bounces-55146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F9A98BF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124C43BFA2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721DF1A9B24;
	Wed, 23 Apr 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeLymmwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6EA1A5B88
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416458; cv=none; b=RZtlPuMISYju5gEFDmdkM1MXp0cQl9SN2WgJ6IEVhxacEV7pwfh72pP6MJsxRR2BJJQgpdLTzy7YDiF7ubSWMozmna983PLkemb8a2GyXy4a1I9GUhiYaP6Yg09fT/1OUseuQnZEFlFyCe6tqXpXO1jtio/Dwt+q7b4TwPLFnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416458; c=relaxed/simple;
	bh=Ph0l8bR+Uh/iYP/SWlhiMjeLVi3TEspfupl8tbIi5Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvyFsogY6I2QknGe4U17AhJjejAzEySXR4PQEKYTPXN87Jy9qtATgSlqn7sLbHiy3j4/aAgH6ppuWceq9xkCp8OvfI8yKHsyPZR/+3RNIO5CyBHuNNw/yJg28s3rYFyaPxb4hWiVIO6d/5PZKaMk0DvOf2suv4IzL6YbfIMBU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DeLymmwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAqCdk016513
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=; b=DeLymmwSMCbIy49E
	r5QVfafjNeO5exfLzXBvDczdCEQWbWvZ11WkESac/Rq0arZQLUSoJaELhn20+YIZ
	sC+UQfw+/VMJJgLlZanr2oEEhZqyDuTtnboBdB5iMjHldgpGT8ppytlhB/+pckxS
	5BGXW+ki9ikYF7VAuGSy94VON6HvUbcVQaS6BYicOMI+nz+/dPaqOIMt1DD66Uco
	/tJxpKHQvUikXqBi/4DOWR1wK5XlafuCwOIGZ0hRKMymFHxOmTLTnTlK3OsUYoxS
	0ckxiVqN9S7gSTClq+tP/+yjl/eoLxsYVYANw5DfUqrXoT7lVDMSr+/+5VG4KM1d
	7zRTeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ab6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:54:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso123536685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416453; x=1746021253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=;
        b=Q7mG5gKSY9wrilL96Jn0Xt4DO5BXk9jhq87hHZIoBkDBvaNmDAQvbijLeCqIihYqrZ
         mbWoIUSyoX0JHuXDzxocD3ef520nzeI4ZjT9WtHnyn8/hGWFEETNvfPb/CrFRfniHenl
         scWEGRO+8x4+qCgUHK+Zi7eObjt+7FFstK7jCt4mOpkGzDS+6pvcj+1ArMygb4keJNia
         p4TJpC2qhJF+ISeEhyq+4Qu9FiH+l+/AMvlCMvB6J47dX0SiOjk8YYLoAcw0Nz4ykN6v
         H6Td0ki5DR+8QyR0d5v6h3uXYfjJsBQibEWWJCkX2Eh0H/lQmDA61S0DLTMD2ixLz+2E
         VQdQ==
X-Gm-Message-State: AOJu0YzhUf9V/HkEDhrcKt5B7me4b92A8OpYHSyPCrw4dUhZBDiY4jS6
	ZWIM8GKK7iPa7xu9I3veVt7fp/U58T9recCFRPJVHei3iCGcXrDoC5Q+5D30ipoc6Sfe3phTnSu
	J8/duRlyGFIO8g2ONd5FBrZoJZgnqEuXawCDJbp+3U1FFaoXUiYx5R3AeeaM7aZ4L
X-Gm-Gg: ASbGncuOKQO6EthUDBjHd4ZFFHxrHkxuaS4c3vyfbldMFGJiIcDQ0ALYgZ/fVk4cvca
	WvO/Ldv2b6/lP2LlZPCvKdwC1qK+A/1H3z2oB1xnqPBZLQnUt95bBu/GQzVfkqGc8wVLumbIqlz
	zLoL35ETnOcZb52aPzLTuQiZZZKAvIHEcp+gKimddJtcZnPsvY9ChLdTeIvyY3+1Ukr8/SaAmEr
	wMxYRy5qpY7qECK7gySn8z16tQL6wb5h97MrcwR4VDk8vOJSU9XjwMYw2b/h88B3nSCSTWdMDzt
	Ve/ko4k0U1BESLfHJ0ehm0j721Bri++VskmpEmnpCJP2KTxQxF1LNgpjkKOJaKFKJxA=
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c94d2cdeb6mr185089985a.12.1745416453370;
        Wed, 23 Apr 2025 06:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5GSKl5nOJGI1IDLlBzmI6OWMLujvoHpe4eYG3KxeTMc/rjtv7PPTjZDEBvTI5D7TyWEbafg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c94d2cdeb6mr185087885a.12.1745416452864;
        Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acbbab86f15sm299799566b.76.2025.04.23.06.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Message-ID: <da5f63ad-3206-436f-9b0f-4e966b817fc3@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: Add Xiaomi Redmi 3S
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
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HRM6wT418JBNAokPzSuM3rqu9Pnok-J5
X-Proofpoint-ORIG-GUID: HRM6wT418JBNAokPzSuM3rqu9Pnok-J5
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808f106 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=VJhJOi4SVWMle1XIrLYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YF3nxe-81eYA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NyBTYWx0ZWRfXyZuwal8NVp9z J8ri/9OeBBmBfI0vhrZONAszYwXJ0tqB56H191Q//WU3R28j8rXu7wBK09hClMsWwvqxgNZ9nMN 3YKiRafbSSD3lJkm8d/MGhLS4EcTUtX528QwlbHbTUkJop7AeFBI32Tawuq+98xLc2ni3Xdjc7s
 S7FIpsHWDDqhFT1bneNyOKEQxf9hpOfTT+y2ml3eycPlJhBl06Ughmet8/lSvcwDXPz+lZRubfa 30l/DJCgooxJaaRDTW6e+EjDKbpSOCLXGIOA1iEb4UjARLFxyGbIigI6jrmN2xq36h6d3+HZ65s p3p8GCQ8FP0+uuM8TgMihlyueM8HdZ7nLk7DHBxRWDRDVCWKoEAlLOOz85vN6SvGiTbNUh8syGj
 85A9W1edMySH0UMMEpu3dJdHFyyCoDz6JLNYeVx1NDPpSOTk9OboqDzhBFUzYTjqYj8PFbnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=682 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230097

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

