Return-Path: <linux-arm-msm+bounces-57433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A30AB1395
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB0C07A9887
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E157290BA2;
	Fri,  9 May 2025 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhRNtL3o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0927700C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794275; cv=none; b=cCxHd5jSGNjAvdkl1uaBra1l6oxXZuqdCuLXwQeiGvBYDMjSbmoZdFfb0P83g4K5eZwovZsM3Qnt4t2DsSOHy79WG2kMMGmKjC7utbUz5GFD0uy2RhfhztDZS37iJcydPN9Ml4rJ+eZ11YKIGIJX7EsC2k9KGC6nEt9MAhunf4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794275; c=relaxed/simple;
	bh=q8WYlRRYDmoGB/cSFOz/QAzeVTddtH/svGSUExvDNsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfI3i93E8YgGb0Tg2ll0kzEcXR6fO4RQqbuiJKpDr/0rdXqmfSIqRboPMSUUW/zwubT6d3AkWSiYxq4CHa88qoR03dJPlpSAfWrXSdZ9U6IXaruLQR+1XS6tCnVnq8fL36KlnqewiJpXd0ZWcdGxDAsAHpyufWtr9xDYtfE3Nf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhRNtL3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BGIfe008621
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=; b=YhRNtL3oZAzp5W3F
	V3D+oiMMj8Pde3XmMUhdSm/s7MFF6zNsmrAc53Zik9Z0M+8bUI1X/6vu6juDC42r
	9sQI6Nfv/zrFzaT+iNcTWkHBEJSO1S5wTtqE/5IViUs4f2uCFGFO+tDje756za/g
	p9XWTPwwvAhsgIDVvMIa2rhJyv+qjUzHUgaHjjiEwAi4UBscS2TEZ7LTGOEn9Rvq
	MPX4pJBFQ24Jm1pL5VAqc3HScS6xUEYwUeIJ1bzTa/gYJ/YkrANbx3EIFu6AWQA0
	33QAMN12pTWmXhk+dLiEoEMfC8O5YJ0/yHjCK/+eEuoVHOBLwXgTDuYB3GjdXWBG
	NAIuig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cnad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:37:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4768b27fef3so4839721cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794271; x=1747399071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=;
        b=fe8E7pXKGbkQtDnKgenZsCTrmutCoijJum957LsGgabq3AC78gONwWbadAZMpt20pz
         0tg2V2kAAI5SOYU4ym69uvyyjwGghqSqEV6bSnB2ArC84zWmwN9pkuXI/mt7XjGQj8iF
         Mk+lfW4175oT3AO/g61JM4KPHfAUPBPT9GonrwDpJB/DSejyX3/FHJ9Z3tc9tiC2woAC
         bs50uxfLRsem9zCI57OdzloB9MaGnpGgYiSxwHyHEieh5IDsjXM235DT9jHJgMDxHv4q
         nUFdH2HFEhkkukWPQ0LZahS1K4sz2kuN37XEa+Ifv+2fV269cfVRvrFmahXD9RI0Go6/
         t4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0K1nfkZ3EXMYOOCKbZkCm6clZOhHNs4DCIhpu6aBjKd6fVoLb2v72dydRktUuNezJFPEKqSKZJa2i3Okh@vger.kernel.org
X-Gm-Message-State: AOJu0YyQmr3Xe9NPzmNno5zjWCBOAwzxzwt5NKL80K7N3YZ4jERdCi3g
	OdU7+g1IX8JSrha+09Ya4hLhmH45jYZGsBo9OzjTys/3QMUTN2PGr6MjwTwC3yUIXOawHTkm5KO
	iPT98LD9lcG35qeQjUJG0o0rXQLT/UVjvOLoydQ5OHHL1HZg9cFs4hDit8qhwaHIV
X-Gm-Gg: ASbGncvWpWbNU0GGZGJSKiBiJxHHW2Eag4m9YZi5LkSi+ZHHuDh1DUW/25kS8ggGZ4c
	59e5vAc+uEKguNfHXh40lXh5kX+jOicF6rTCh2xdZyOfCfGdjtsUmJwG8QgAl0m1uZMRRoq58zK
	k1H+vpCXV+3M6UwmQ3kXQYm9QHvRvHmhnMwYwCFFTP2qiUTGP7jRgA3HRoqNgdoGEUwj0AsSv0s
	BD/O6w34VwdKdF/m4m0H9Mlv7s/s7yKdcJB547EY1pg3K4Zc5CMRy88SEyWt7r7G0icIY1GQZJD
	iAS9/1sVdvSdMR6QKED1vBmnWMMVuiFmzWWLgX5lLkzesUKG/QZnLyKOaZRLQ5TdWjk=
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id d75a77b69052e-4945280295cmr14540231cf.15.1746794270871;
        Fri, 09 May 2025 05:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERHUVO6nQzP3GMy6DlR9CXLC5BNc67GbK1LwQUmC7YI0zwpgmz8DNyH5I+IjBhgY5B1ZLVmg==
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id d75a77b69052e-4945280295cmr14540001cf.15.1746794270552;
        Fri, 09 May 2025 05:37:50 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198532d7sm143701966b.170.2025.05.09.05.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:37:49 -0700 (PDT)
Message-ID: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681df71f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hjmfpjirZ_eXqKrHEEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: boCiLuJKK3XXZWHABAOFAm6IUgDokTLj
X-Proofpoint-ORIG-GUID: boCiLuJKK3XXZWHABAOFAm6IUgDokTLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX4wZGiv+DtS9t
 bNDdfltJqJwv6A90GhynSglYWUOLLQaBi4wI02nzugtiAMFLFER2oZwk3zXYq/HOP1Jn4LkS1aL
 0tMFrY/xj5ZeOqIhkeSpiBNnIHdNKtif3EuhBnEM4pl2Oh0P2WWfEVjxSY4uGmZ/EiNtzB1Y+JR
 dH0wkpwJ+sdrsBFlvr3P8znx6Jw09tDj0yBCVBGBHo8jahdo++y6WNNEFGkYDyJJVwbPuaKlrTq
 h0fA2h6EntL3enwQZe5mP9gIeNimx2NjrnIqqX97UweLKDRZhjsqSS8ltd7vNGV97lS9h9lkTFv
 ahcp1hppOaktJ1LOa8ihn9DAEmiPiliosB+cytqdCwGHDgtLmcLuG3frOXA5S0hFwihKKEHLH56
 Yt3UyHiTS1+3wvmD2vzG6M28DRKAZYheKzzxSJAoDTjHQZIiR6SsHIQe1ePg6c2d7C3JLVQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=899
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090123

On 5/8/25 8:25 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This bit is set iff the UBWC version is 1.0. That notably does not
>> include QCM2290's "no UBWC".
> 
> While this is technically true, AFAIK the only difference between UBWC
> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
> is why I originally wrote it this way. There's a bit of redundancy
> between the UBWC version and ubwc_swizzle bit 0.

It turns out to be a hardware matter

Konrad

