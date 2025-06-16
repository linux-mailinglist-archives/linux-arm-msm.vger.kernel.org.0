Return-Path: <linux-arm-msm+bounces-61426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A2ADAED0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01AF8172411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71462DA763;
	Mon, 16 Jun 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh4Jkheh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA1261570
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073985; cv=none; b=kUpX08Q9wL5q92zo/Kuihem8UTia1VhB6UI1+f2+mRZ7Tbbew74VZFF6SuET0oP4Q3Na8JwNdkl+0OHhXS9HHyR66QnmHRng06PvkUH4ysHmr8jtY6Vji5e+5S1h4vwkLFs6/WQgU8TVu2IAYP1JJ4ohNqjQ+h3J6YSJsFn9kqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073985; c=relaxed/simple;
	bh=U7BxszO3EPOqL7zg/DCf4O6uN0UjeU2VnchoMRaE4Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIq3KVNXubAL+i07+1t3gx03h+jyxhiJrnQsKc40BdUxXAXTPxrM1kY4F0qYJ+NLbbmpFLornSE/PU9KzWGtyIla/hux9io8SuAgdjVbv2DmF7soUiAXnt+cU2ejZ/BaSZM80c8gSBvc9SUBTJ0hmizktbFYv1JIQUg7X4SvXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh4Jkheh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8pT2g005273
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXn7knnpLLQ2eyyP0Co/H9fTL900gdg/nn8eP+fOVs8=; b=Jh4Jkheha/F0O8a+
	uqkUfrGYkjms5uq6242DBVhdPyEKmeMo5AcdWarfNgRdzEmAabHx9ikw9svXxq3c
	ylQ6mxfYJrHUN7aTw2rOcCcgLYYRbtQA0Ko8/FPVUNf8unsyApl5mRk8oCcopwc3
	NIaGqZwtc9q1ai9hc/USF5+8AFuXBV50rqR4gKUKCQI7z6d8N7fD7RUSnn6VyfjH
	O1fDImlE76alXWnVXIHejRky0zaaRntkxGHCchDg7xdpQ6IH+hCKRxQVtoME6F5A
	usSjVqmcmSOduSt1xLCzZNKEb64mwc9tK22ktHd+ROl6hykiyxg6aWXNIMwx/aTx
	XpkR5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsva09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:39:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5a9791fa9so9734941cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073980; x=1750678780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXn7knnpLLQ2eyyP0Co/H9fTL900gdg/nn8eP+fOVs8=;
        b=n/SQeVAj8q9nKAFybmR03Xu8RnSbmDKdvQgNcHAsac2e/DDDax930TssEnFuF21fpt
         2+lEaIivlLBgYs2wcITPhVOsa+wPEp8TMWo3It7bJrNf938O7vkgum8SxuSRB/CZ0eWK
         LL4XUpMF+EtqTdtTP3g4qVCwHkByNg7diFopD1iGkmFjDz3oRyMvh/AWjSWJlnV/jloi
         +o8OTia9wioV5qvjdpHSalpSOp2gmC7n12AK504WM7Du5QyTNlyMskxJU5NoVYhNQhtW
         JJTpuCbiUfUSR+EJhlMvx0nSLC6+1JVxrOACDKUnHAFp252uiOYzohqWf6K35zCE2qUE
         ZFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXmU0arzorN0B3XEKG30Ckq4SMNGmiKBiPDExuXTWa49uorz6IuMijuKnXBH+6Tnq8Q86e6Z1R6EsHsxV6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz03q/933Cw8khWoFIZZ84rU1Dl0IVonnDJGmuGvO8mQho3rmAC
	g8prhXQf5mJiU4m3oHZf4Z4m/c6eROuNywLXm1cjF9i2q3m5iyli8HQtZUf0CkwRk5XLpTun9xE
	UNJ2XvQYUt8VZvBOaaKRq/AhqWAhGDobuJXul2RmaDa+YkHQb2ndZNYtK6Ea2PXlwfFKg
X-Gm-Gg: ASbGncsI7Eegr8aXYHNRtigGCfeaXknh8F5YCOj25HhYsD3iLIjxc+t+l9M1xidt/a8
	Ardmgr3m+ahKl54EzYRGAuyQnkAKeHr+94DS1yZ/2aU7FZkpvU13jfpu3u7LDhcMhwne8SYWYeg
	FYn3r4YMq/T1GiBCEoaJunvEFFI0E+Dm9qB9Fm2miT2LTG7TPV4FLuWAbaA+0So74t2+wbaKrlr
	qPx0wYJSAgciRsgkJnZEznYjGFso+DlxpwXlzFT78/+be/mJJOQnaY1Cwdd+7YpGeob2ZiabB+m
	65fzkUHzFflZKWRdSCIYa4t49FGRA8gtti9hdpC3zzesvZXLFOsNDVzmjPiraf0d6Qd9u2H4cWu
	Wnxc=
X-Received: by 2002:a05:620a:f13:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7d3c6ce53edmr537570185a.14.1750073980164;
        Mon, 16 Jun 2025 04:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7z8V4cxvyapophmo+ExPGesKWutzJcTGH43O761sVb42bSz5pPrcmLO1T/ed6jYO8q8CPqA==
X-Received: by 2002:a05:620a:f13:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7d3c6ce53edmr537568085a.14.1750073979676;
        Mon, 16 Jun 2025 04:39:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adff6cab54esm13705466b.30.2025.06.16.04.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:39:39 -0700 (PDT)
Message-ID: <97a8ac19-ac49-412f-b15f-e129e9c331e3@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:39:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: add initial support for Samsung
 Galaxy S22
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc: konradybcio@kernel.org
References: <20250616090250.36605-1-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250616090250.36605-1-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MiBTYWx0ZWRfXzCn5WsqLrSif
 sV9IvKMKbHex820UVNl0rwgAxYXGaHxdktHOPfdT44uHNl09kINpqV96M/745CYWg/J7Z/LBB++
 de8eA1mqPBrDAHTxjr/sHuIQxJaau2KTneHI7HabQJQHDPfG5A1jt1YfVPy5nDiWNj+y0kigDtP
 pvYSB/VKEeLt5RCII2LPYRZB561HwjKWLDxg5Oqvg2eyrw7416vJ91eLlZqGtNm2jQmviw3IxgV
 6UKIKDe49WoBCe/15NIZeRHpMY5+26q3pG7LmkkZlGp81fV20BYwy+Rfji1CSbbFw9nQLXKb3pm
 2MrK0EeDmDNWhTtyj1f1ClnUXwEcueAbTxalDMq0RHtKkN1ChsyCVGrY5qKuRuPRzsrN589+kJp
 +YXWw8ne23laApzB5dPWEZEvaKdc38fxtSoKY7A7azR4YhvmPuQ8qtt4rdy4QI2uw566OxVS
X-Proofpoint-ORIG-GUID: ahK_vlS0BISNsLORDaLrHtbLg7HnEOoH
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=6850027d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=wD3g3Vp6Ha1uzVT4FewA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ahK_vlS0BISNsLORDaLrHtbLg7HnEOoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=897 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160072

On 6/16/25 11:02 AM, Eric Gonçalves wrote:
> Changes in v5:
> - Properly format the thread
> 
> Changes in v4:
> - Try to properly format the thread
> 
> Changes in v3:
> - Removed unnecessary initrd start and end addresses
> - Make sure r0q is in right order on Makefile
> - Properly format memory addresses
> - Set r0q to the correct, alphabetical order in documents
> 
> I'm sorry for my mistakes, this is my first patch and I got
> a bit confused on how the whole patch system works. 
> I hope that is cleared up.

No worries, you may take interest in the b4 tool that abstracts
out such formalities:

https://b4.docs.kernel.org/en/latest/

Konrad



