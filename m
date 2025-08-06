Return-Path: <linux-arm-msm+bounces-67870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08745B1C363
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 279201781AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C22428A705;
	Wed,  6 Aug 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa19P0tJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49B22173F
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472640; cv=none; b=VBpdKj+ULfUnH8owKNX6TFSorFzvXCuvh4IRErpHebeYut3O32PU8UCkQTHGbH3MEev83kaqSOOKD6lQa5P9SMk76YYPZY7nyBrQA6KWTxQePKPji7Qfhgxvkg/hMjbNKbhRjnJqwRZyOpvH5WDXwKiEc3l+QswZ8kLPTaE+CIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472640; c=relaxed/simple;
	bh=oM0lMX5NbA9LV+vdx7kVpo7EN9KJbvCiVdEvhHKvOIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSwhLo01xED0WT9Ppcr0iFeYoFt8hTd5K2bq1h+0nlyuuc7QR3ndjPW5YQUbCqI6L55l3bA3cbm2eYHiHXby+NZoLEWoP96gaqGjtKy5n3/+7Vb7v8Ond/vpQmZxwAXvOW3w/gIucens4AR/v98jRuBgFdl0juLu/oTW1Fg6by0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa19P0tJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766LPYi010366
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 09:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3F7jW292s5J/5EU/tt0B7PNoOU6z1hNas34m+AYe5s=; b=pa19P0tJNdOXEswJ
	Pw4gd7FffZPMraN/BaQ7eF8E8gVkZp2zUozm9zTZUhWDYpEzcq3CKQRKv0qMh9W9
	89+kvoyyND7HaI2jJeycRnJul++h87ihBEGNYgxYndq/iRE/VWEGYSrKIdl6/pnh
	lT1biFG7wQ2w0se8AvUGPLFixi1SPB6xfWma0Du3ERVQzo7M2/Ij5tR4siyYXSUL
	Bm/tmjTr7O7+WOtOS8y07P78Ie4ISV1aedhjsnVJK+SXhNXy25VnFElbYy05LH2f
	IaVxiko6R6avcytDxCOwu5xwuPUZOU1t/sHOSYLzNHal/7L86n8Yb5huxgnpdMFx
	fhGinQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7t6s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 09:30:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7092ee7f3cfso14243276d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 02:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472637; x=1755077437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3F7jW292s5J/5EU/tt0B7PNoOU6z1hNas34m+AYe5s=;
        b=VT9ILgQyQP3Hycb4RasJ8NPd+d/Gm82RzqlxC4qY4sy/fvDX0oiYRLeJsunB5+7aJa
         8Vk8yMZbNf/7Rb/PJ9Jk+Uiamei53K8gLDsSUELMn3YwX6x9xbAkmHIIcmjDW4V5sLQz
         2fqEkR+2UmRgQahpurvj/vDy7uAKjZemquCvQk2gmQd/mK7IdiPnDEIo/amp4LN5Y0Hz
         RPCeXwhVTZyLiksu8gpk49+PhEr4qEIrdutJk6uhx0bmRBlEoIv2qvfzLURFtZw0o81o
         SM4Ijd+tp1W9ybldBQbpkOE1lqgT3yyxrlZ4j8T7WpVRVvvGMY5Uqvrx7EAYj+EVJG8j
         jR+A==
X-Forwarded-Encrypted: i=1; AJvYcCUkSjYXB0meHSDhtsv07CKsU9H6ZFsxTlnedYyMQ30a5e7inCP79l5yfKz7Iy5L5Xpi2sekEo/vbdUJZmoH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3BxdgDbLQQ0QHcDVCgsem+mXDiPkWKZUdORi6YHfaUOyL1OWu
	+Bz0RvyhKeG6e3sepqoS2RguveIu2NkpQkzwxa69dv8VcLHY7xZi+Uy9mwayJGipPFKjuMYIEIP
	5LVDbbqAkUoekF5sUjcA3rH6LT6WOF4sBqQ8RprZx4zIYdlym3296z5ggFjPlAYrBzZap
X-Gm-Gg: ASbGncvvVHRdToTN5UdqLIpDyztV7fmcwvitVmu+eHiQOm9VZnAusfT6G+m5pt/0Con
	WDbapQu8iO/0vmxhqDex9JORWisuez2li3MIo7xYRN+4b2tpJChm1RnsOQ/m7wJhszXhEi/7ncq
	iC7DcpZ+eGkgCBoizL1FnFVFczw3RWe3thmzqztAgnf8MpgtT0wDIT/Vqw3t7wRfzcGURM9njq/
	l52t1zXR1BSpeqyfhZI1n9wSZOiJCMAR60jsSkLbfoE90fB6r+ZPfVI/R5mdq9bPQboMa//+V3A
	3QeNdORVOkIQB30W8/jnzsAgnz5LsryHfUzwDBVD3myYTzJYft+edcWe2Y/KiZlqKGSqMF7RWvs
	57bkeN9tJWBpXF4DfLg==
X-Received: by 2002:a05:620a:191c:b0:7e7:fbbe:a193 with SMTP id af79cd13be357-7e814d1869dmr186496485a.3.1754472636623;
        Wed, 06 Aug 2025 02:30:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKtkuAek7TR7Gpi3LxI21nwdlFWmLTMwrNP99WIXsIbBRgltr6cJsFAy/rkQ4ETKM7Y8xeQ==
X-Received: by 2002:a05:620a:191c:b0:7e7:fbbe:a193 with SMTP id af79cd13be357-7e814d1869dmr186493985a.3.1754472636112;
        Wed, 06 Aug 2025 02:30:36 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm9983730a12.25.2025.08.06.02.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:30:35 -0700 (PDT)
Message-ID: <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 11:30:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=689320be cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=UDxpVAc4W1oXZRtQ2dUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: usn3DxWDWOvXgaC0DLYn_DBf4n4h7432
X-Proofpoint-GUID: usn3DxWDWOvXgaC0DLYn_DBf4n4h7432
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXxAr98TWpNQ4E
 whbMGRh/3NsYYW7TGbZhRr7+JG8kXSdphzQhv2ieTSTY7ZO9Ti4DFaScBPK9e4JTBjYzQKi6bsk
 j2tqhbcKtWVVoZPLWrll/FRgEUhr27WQChtBhk//h3KvyqZi5NUEC+b9PkOqjdplp1MtL1M8NRJ
 QsfnZcD8OLNDmdmOwwUyeGfizy9+8gxk6LSXLG/tTbBbvOMrDezWhsywAPRvC1onFIjP/DkD9nL
 nYOnDEathAxUiX+ZSHrtYmQ3BRJCk6MAzbQ1Gu7nuWD8VP0eRj1ZQCk0QP0Zjg/xR51SyVsVuyP
 W+/Ycg2e+XZ1w8hMYAP4Z24T4q2wKziATOYJpT+ZcIeKzLhZve2ahMIAfoeLLBRVROwnSYZ4tKh
 WlCrwvDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 11:27 AM, Taniya Das wrote:
> 
> 
> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>> boot. This happens due to the floor_ops tries to update the rcg
>>> configuration even if the clock is not enabled.
>>
>> This has been working for other platforms (I see Milos, SAR2130P,
>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>> seem to use non-shared ops). What's the difference? Should we switch all
>> platforms? Is it related to the hypervisor?
>>
> 
> If a set rate is called on a clock before clock enable, the

Is this something we should just fix up the drivers not to do?

Konrad

