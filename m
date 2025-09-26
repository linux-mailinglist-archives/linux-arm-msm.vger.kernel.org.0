Return-Path: <linux-arm-msm+bounces-75302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02524BA3843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8547D4A7CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973742773F4;
	Fri, 26 Sep 2025 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI+/tKbG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D13158DAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758887057; cv=none; b=KqenrMuKfvHs++YQYgd/6I1Xuko+5Ld2sVo6T85Uvhv4jgfLM05/fmO1TF2OH8VVGJiTflEyoT5maDV4+E+m1xIndc76R+piTgA3g+QJhJIgjFTUuRmCjJSzt84VmVnPE56LARA1bM4CTQLJV+l4wSzMLHxjwNhptv71q4xeJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758887057; c=relaxed/simple;
	bh=GzNoxw3QHFN9Jy6yA0tYzF4CAq5XgTljFmNprpaPjYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkfJuE4BdhDQxJQRt6G0DQXMrSCeodb87OSSL9i3F4n1PAywR3f19rHNSf12Dr6TIP9Ibr4Xr8LcQKYoNnzwBACHd0C/xjd2E+VTTCQdkmPatJ7088u6r8bI68NZpVA9VVG6Wu2UJxWeHiHCfu9VPJqS26+4++dmrhdkU3qF0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI+/tKbG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vep4018257
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GO5/qjL9gup48kS4ZY8HeZ4gTiSMhzKkkdJq/GGpOkE=; b=XI+/tKbGDd5Un8t1
	Bp31FyP+Dm4Hg9Uut20jaKpDxdPgUvqmWnrFH6aQh0WIHgcLwqwn+rz06u+F4dxK
	72RUgdpKjoUAJix8KtWIstENZtlgIxcGTq8TvaiBY0143Mq/IgSbaHtfyrBhorBZ
	ou5P2+S3v5rhSrwHJOPQ5+vGCr+H0nHfLxpKMAcgpyj246g4TKtZw4ijt+soFKO7
	ofquTePXuyc7R9hgQZ/ZTyvHu4ESHhTn25S8ib590sKeeYGIvMmpkt+Sae2lfxHI
	Xu8jj58Wl8B7Eh8MAgWMwOuydiOBheA14CAT4W2G2XFCpUF+Ms6xweZkpCUz2Zgd
	QAh1fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0taqkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:44:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d8c35f814eso3939461cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758887054; x=1759491854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GO5/qjL9gup48kS4ZY8HeZ4gTiSMhzKkkdJq/GGpOkE=;
        b=Uz5ZHIsJBhDg2iLyhOHrLj6ApFYQKWuZmHNO1p96SwAoe7vp8WkrvVhUAOEbbbD2Lw
         vSH84SKkP7kRgL1kWUspJZ7+fToMTqWeDXVoxU60XWuwC6Rna0ZGYQzHNty2tZAUjLVF
         dIe4e3b6HukZsKWADi9tiKdf74Pspxh9R/LO9BTmiURdQxUmOASNoINBbq1+iYg1RjoP
         j9E9iM0pDyinkyyRD4Yw1GifFSwSNM/+iYhMELtKzZe2ppto2WdHYsseFRGKNxVl4UOF
         nWvL0bamljIEf+K1RkkIkRNCMF3AUgwjipsSUIoaxVNeny11pE4j/540R+YqdZtPQZ3c
         xf0A==
X-Forwarded-Encrypted: i=1; AJvYcCWgddogPhzDXQHrXjcG+6XPIsVydbURwvI4a88hZ+yCy3j5nRSe8d8pBYLP/LwQ7xXWa3VkIzbCmvkDN/Wd@vger.kernel.org
X-Gm-Message-State: AOJu0YxytbvKB7l9XHFm1Kne5C7uJZUnSeVgPcaNDveGDAjBQ+GkoNWQ
	5cL4ZA1gDY9eQxTKll87o9RdhrBHawMCxb0/i2jcPRX3cMeBzYJmZMyznTIQXX/be+RYRmaKfRv
	wPPb1iQ0vnD4NPInLUpoaUJlwQ4HWB594E4ipRlr+utaoumS3ZD6IHlaRJTua1RdylHvV
X-Gm-Gg: ASbGncs04sM5zwT1ebrAPkX/ZNtXnB/vS+r7sQW3EpX88p4ZTbGf+6QzpUeC0UM7AJU
	YT6A7TU5Xjka/DbDiM8LLPn1EzNwV9Sx2NvqJeYEIFt0syt63/97Dz6JANREbEN3Vr82oQoPgtt
	PnTS5slmQutCyBJtHaXqa7bkxkYKeL+ovlc0ZHf0jUCK3NCpCRZmZrjGI3U5ckBuG36vY3waetU
	QttBzwibKpSpnhnU00L1VnkLqq91yEIZ6j5QnLAHKREJIpNg9h8JgGmpfL2K2Oxg1NeG0RYbZ6A
	QxpCzYfZOXpIfRH3LG0pHBmEDShZ4MpH35e12JzRgYFhIwvgfsQc7todkG2VerSBTFi3leeflWD
	zAvli3Y4K6IovpETBALAIgw==
X-Received: by 2002:a05:622a:11c7:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4da47c0d937mr52987121cf.2.1758887053837;
        Fri, 26 Sep 2025 04:44:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz2XpJ8zkYTrM3z+ihZ+zL55IFpqfrK3wxvNiZMDU7ItXJekbmq6vrYvuyQSWMMfHjzIgsig==
X-Received: by 2002:a05:622a:11c7:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4da47c0d937mr52986921cf.2.1758887053288;
        Fri, 26 Sep 2025 04:44:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f6904sm345662566b.66.2025.09.26.04.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:44:12 -0700 (PDT)
Message-ID: <95ca9b61-ffbc-4996-b68b-e550e9ee5fe8@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:44:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
 <ejcchgc3isc5f6tmiqbxqihmk5efmbcyhv3ehuoerb5ulkd5an@g7a2wc422l6n>
 <60c65d7c-1564-40a1-830b-1c9931776fb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <60c65d7c-1564-40a1-830b-1c9931776fb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C1pZR5r0sYYgAwYeTmfDoP5VRNEOS_EY
X-Proofpoint-GUID: C1pZR5r0sYYgAwYeTmfDoP5VRNEOS_EY
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d67c8e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=oYxpnEykKrceSWoAYDAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7eYIrzFpJFAJ
 JUPvr6apGM0EqoghLNFFuiHjOwkpr3sZLuGfzdC4vm8w8J47XTB9/ipuXWcWEE3LSMgZ2IrJoXq
 tWMG+8xfpeBjYHQAK53fyjiLr/8yGskq6Jl31ZQzXYDSwUgE3AAL+Zp36raVgm256vclBieP7Fv
 AbaEN+4JaCvLkik9lOc4nh2JXjZatpQFqGB/idwZ2kR2epIXaM8qAkhBcPnvEQS/mjs34hCV1vu
 VRFfmpdQf5jQfFntOZT/8St2ROmiFRQ8S4bQ1BogXK7U4y1pQSzvyFkGAGAnke41icVhq5m1FEw
 UQpI5HRn8VMUzeIb82P8pvDIHuKF+QeAA2p1sGqPA11BNdnlZaWZsSVIdz3C6dr84c6CnPVqftw
 uUPIs8rxmdWNepbaM32krl/kAYI4YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 11:11 AM, Ronak Raheja wrote:
> 
> On 9/24/2025 7:09 PM, Dmitry Baryshkov wrote:
>> On Wed, Sep 24, 2025 at 05:17:31PM -0700, Jingyi Wang wrote:
>>> Enable more features on Kaanapali MTP boards including PMIC peripherals,
>>> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
>>>
>>> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
>>> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
>>> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
>>>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +&usb_1 {
>>> +	dr_mode = "peripheral";
>>
>> Is it really peripheral-only?
>>
> 
> For this initial submission, we haven't yet defined the USB role detection
> infrastructure, so it didn't make sense to include dual-role now. The
> controller supports it, but without the connector bindings and role switch
> implementation, it would be non-functional.

I see an internal patch adding pmic-glink.. and I see no reason this
wasn't brought together with this version

Konrad

