Return-Path: <linux-arm-msm+bounces-67050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BADB1595E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91B3E16CA8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 07:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8457622422A;
	Wed, 30 Jul 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWa6q10i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABB11E231F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859620; cv=none; b=T38BHwHSMIoiVqzJzrqfJQXWGxwWkQpm25wotmW0CfrxKgMTViE7OMVDePc667O88DlV/fNt6QeLxlGUw4YqY6AXRIW2Rd8iZK55g21ciH7j6DMORpqyV88a0qbe4q6NPJyhlsUWGKMJenq8HKs81Ka6oe1PO4+ZLTTDKrL9T6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859620; c=relaxed/simple;
	bh=vmUflXSGCAnmNZdKwZ7wh505u43Wn5ozCPkxfiUYfmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ur+8BLL76wXJWOcHZUQVdOYKj5klu5MIXV5xA9+Qb8gGIbm+QCHLbE2RjS0UuB8WiI6iBuOZAI+zwpP9yiLcp/eKHFjXsx6XPUAhOQzkimbRM8Kqf3U6bsy9tBBd1ed4W2PwMeyl2YM3xkfVstcXDnee1fVOHBzUDUWY2TSOhIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWa6q10i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5efar031251
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zi4hLFTfLsENP9BcQU47FniUdDHHPw1lNFtITuRJfNw=; b=DWa6q10izEGWmSDl
	S/M17ssL91ttl56WYwWQ/5ja7Qj/BZUG+TM0s1vEent+V4DHzFI6GesQzJh4cV6D
	zldbf/efcuTSMsho4oe/KUFwDcN5CZjyi+bHKcvyu9ZreP3cFL943zzuPgMbTioz
	+RHbZHIm9VWJNulnSqSRXqDXwKUZ6Em44yPjcwud/7eyY7zv5GOtzd3OEkWTVLJM
	WXP1XCMAfBscMlqtgr+TDXEQLnR5ZlQsphpoUallj4osrPyangdkf0nI86SawqqT
	+UK9BVHCMAUhuuajBC/8RXHbt3GcKmgcVh4Leoh/pk589rRY0HjaHZHMp471ismq
	UY6P2g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xg774-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:13:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76b857c5be7so100903b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 00:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859617; x=1754464417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zi4hLFTfLsENP9BcQU47FniUdDHHPw1lNFtITuRJfNw=;
        b=lb5sbN+pNFfEZrdDc+QQ118fz80y0EpNHQ4CVBx9o9zBssgbKbKYLc8n/INLfi+GrT
         2euMF7Xw0stIV+62XVKGMLyag8fG/DCPTkQJKNkP6V3JIJWapYmd480JTVkPX3mAC7Aj
         h6znKmS76qP6IcRpgzTmb2AvPLbCdhRb/JyZwc4BeBW7Jlbohrs8dYX/mk7aWoQiVMvv
         uGCjNnOcIbKkG1QipQoZcvm9YpNW95f5/txudFzvOUlJ6CCPMdeHamNCEATvVbFA5QBb
         +khk6SrsGMb6JATp7VOhF3GrbcTwPweEjZfe/3XT0P03xLA4kg1736HckGxg5WLY7BQ0
         jghQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm8+VbgYZlYhWtuVGsb+DCIDu1EMF8TQXxDWRZoe6PkZdk5i7SX8lpEww2DOwlosKa3YkJEvUuBVmeHfh/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GwGhyCOhLVb9Tm3WGWPTynBegi7pOF42J0udt9v2y6u/wOoE
	89ZQnFPj1+nDEANG6QF8gf8A2ssR3WFfLJ204DYFF6KYkgs9pMRnbc9Ym3/S11NI91rGwux0N0M
	omW8ZVEeLD+TCUt4QtErH7OkdSKDazYGcCTujGmQF2GH5kPGBv+bV98kQJ7ApdaMfkzDX
X-Gm-Gg: ASbGncvipN7Jg4t4yAtngpbGRSQjoa1sRZFD8QFX1Itg1u2qX2Nu03RTuJj4+Kyn9LH
	5MsFTualZ6KT473E94mzCkRB5QA4309w//qU9r5DzXPHcrQ76kxAdPnGl6hNUO7M5kZ9cM4SWSS
	16a/FJpQ5b6EY6bk3H0zSeBRPT4rSZj2odPR1EgzQ/Rv2yEYNn0PaSWGJEKTH+vxDbPVY6P0pcq
	thunjKj8icuUNA14kl3qjxLfsXZVPTmzyJLbsuqgYHA76AmFS6td3ToQcLDB1YrvQddXq8tXbn3
	N5RUszr88HMlFcig2h4GyrkwVUifde1pl3g6DXX8FR/QJCJRyasRLVIbGI8ap3gs2uh5ukmblLq
	76IQ0CLyjA2Gv46mu4nN1nElb9Q/q
X-Received: by 2002:a05:6a00:92a1:b0:748:f41d:69d2 with SMTP id d2e1a72fcca58-76ab0524cf4mr3703856b3a.4.1753859617197;
        Wed, 30 Jul 2025 00:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbXQYxhS9eJG8PBKNZPRJWC9eSH9QH/OsK0s8qRXktswYT2gefhDurx3LdITYkb5XL0Tqqkw==
X-Received: by 2002:a05:6a00:92a1:b0:748:f41d:69d2 with SMTP id d2e1a72fcca58-76ab0524cf4mr3703820b3a.4.1753859616834;
        Wed, 30 Jul 2025 00:13:36 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640adfbf7asm9833105b3a.75.2025.07.30.00.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:13:36 -0700 (PDT)
Message-ID: <7d1bb8b1-da77-4594-abd5-7da9bb713910@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 15:13:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-3-806e092789dc@oss.qualcomm.com>
 <5hgynbka274jerw5x6ekfuoj45k6bqt2hdbsx2puniqornil4s@pdgavjb2jeci>
 <ef9c302a-28f9-4bc9-912c-92bf5ca7bbf3@oss.qualcomm.com>
 <157fee28-e6b9-4c81-9698-57302117c885@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <157fee28-e6b9-4c81-9698-57302117c885@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA0OSBTYWx0ZWRfXxZBxJfLbHp6O
 h5CA/yhdgMzCJHzshHgFr8V0xMdQLZbFFDNrqyj65Ov267PitTV99D+VdFatlnABUZSBGn57eNI
 SuDbmnzEOzHfrMp7uPbTzVzwOZnedShIYqM7temQqPg9OkXYf6dmIPu6FODAjWHyIpvs48Fc8G5
 kKEiGtz3uOTmCYb8j6rhHqew59YNJ1Nlw6ZJDAzMxkvrj3CrL+FzY2QpeyCPKsqRyxK9TPzkuBc
 plI7UXmo/F8JYxNZemwa3tCy6stAE14o731P+p8FYqRzmQPaR8QUVmrzyXCSQ29eFuxEQs0q7kn
 A5Q0Mn4Qvo0GEQDZJ8sT+mq2sh+z+aFIhaY8j7uaiggMDl8D11DRhjGtr4NYZmwiSX4DbVokOO5
 tqVZtYDxXHxHHwJrbbmd9bBu8wP2nGtjta/DqrLbrtzayDxNHQAlXWi9536KkSplUPZcfOjM
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6889c622 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6jahUQGBau2IMRXzWEoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ej1szIEta8xJGaMW9Hm-j4rd3623n-UB
X-Proofpoint-GUID: ej1szIEta8xJGaMW9Hm-j4rd3623n-UB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_02,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300049



On 2025-07-30 14:44, Krzysztof Kozlowski wrote:
> On 30/07/2025 03:11, Yijie Yang wrote:
>>
>>
>> On 2025-07-29 18:44, Dmitry Baryshkov wrote:
>>> On Tue, Jul 29, 2025 at 09:31:59AM +0800, Yijie Yang wrote:
>>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>>> components optimized for IoT applications. It is designed to be mounted on
>>>> carrier boards, enabling the development of complete embedded systems.
>>>>
>>>> This change enables and overlays the following components:
>>>
>>> What does this mean, how can it overlay something?
>>
>> What I want to convey here is that I referenced some nodes defined in
>> x1e80100.dtsi within this file to add additional properties. I’ll revise
>> the wording to make this clearer.
> 
> That is not an overlay. Use proper, not misleading terms.

Thanks for pointing that out. I take care of it.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


