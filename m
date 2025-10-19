Return-Path: <linux-arm-msm+bounces-77903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25514BEE3BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 13:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40FA1896A5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 11:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10CE2E62A4;
	Sun, 19 Oct 2025 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX2jYTUD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EADE27145F
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760873760; cv=none; b=WuR3uNG9pxaI1eynW04wQJgiTrHKoZRCsZFH2Cu1JrX2QgQJrnK0Chfh0lWeUfqA0d/gtVFokhiXrAr9qy+PbB6Sc5pzn1aLNj2GSFPbMdpz4fKYvlUZIq3+6z/V0en/3h3DKAn2b8I/3xq0VUEoA2/9FHVVlcjBgCdoPhWhtWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760873760; c=relaxed/simple;
	bh=LBE7P8iEvXZvQChiXh66aQde+RFGIFlEtmroTpJ6buM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aye3wTjq1ZXckeaZrM53HvNjbxgK7sUrV1mIcRWFlavQDVtXw/hOd2deyxqBhQroWlqgxH4YZgNOICpqPHLp6tBUnfweY2mditmrNyu8fOtcwASwtdV3THNlO57AMxuurboCFAInT+KOsTUDEWmAM1rwbzcVrel0lGRbjqQmGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX2jYTUD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J9f6kb022014
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPDtWvwCFPk9Bp0BBoOSzdwmx2o6Q1df26GMvEnG/L0=; b=RX2jYTUDJ8g1QPUi
	AV9J8bYhcdZl5SY5lXDdC2YRhCsPkbneYbHoOZ2EhOHd1ZIH5QtlkMrvYr7JkKjq
	6lSp8uS2AzP0e7zmyH2JnnQGAOVwTxasEFIpusVi0tWqvp4QgIfLBc2XRz0OwKfd
	qzLEucDnmdA3ZlxikJIe7ujJRu7k7sxPjWAK/SkJp8Gnf1XFPsag+blf0MFSemiI
	O6oSJH8fO1o3jJPr1p1EaHOHXiYIAA3LYgwmzH3Xm58RY0z202HN8iSKFZYqN6w0
	lAJqQXytWJ4tyNvTG7dZWr55iZccG3wwwXJOzOeVRzCTv/9QqdYGlGsx6c+EboMC
	XbtWwA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1usaesu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:35:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso1829256a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760873757; x=1761478557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPDtWvwCFPk9Bp0BBoOSzdwmx2o6Q1df26GMvEnG/L0=;
        b=EQqvCONbnkgY0uDewWfjwqTC37PrlmBBAgrzCrQ8QL7ucX9HT+qBp8xLKjrteMu2I7
         E4HZJW06Xw36+D3KPV6ZEg1/BJKDEVLdRwjXmh3up63YQrbkN9J8JT8F7n0RZMoOTI90
         Ja1WMDrkawPPqoUved/8E1qYuB8H36RJCxeGn4mQ6GcqPEDf9O3PQcjfN+Ans8tH7Rbq
         214cKUe7Ia85EXOFvIdFfdpViw5agABy665pyWy0ZwxfSG3Zn0AswzxqHPaUvXVihKdI
         RJ3Z4ti3l4LTNiIhcEcw3nKB+tGaOcT991w8KJbeXC0ZKafHP0wLP5r7FlhG17iQUpcp
         6grA==
X-Gm-Message-State: AOJu0Yw0Q0FBz2Mmy4JeiBGTbWkrN+I6eKtomQQlDkr3Wmgwel1oZQst
	Zyb5iOyMJmI/ZlsfIbu+mKpzn+SglxFggL/zn4WZks0o+Eb3ZE/oo4e64m0rQCcSMfAphMcMz4H
	DoVozXwKDm1GegzXVo8Be71KP1Lp8eGaQZlyaOL2xWRdZItL9dUzwHFaNiyzDkVPsbM9e
X-Gm-Gg: ASbGnctMlWK71qqIVlskO2V5madX6g8HDcarspuAQM1C2PU7gT+f6Vtil0T7G0gxxcp
	PKKnZY5kXanqa/CODtwluGgx1/kqoel4SaaGU/r7GY/+pMnINMjE0J5G9tuSbxR/zgGh0q8HYZC
	0tbDdQvmXxt67btJMm3GlVd6Ryg8hZa3XmNNJyE4bH8C2VWRftGPGKdfEWtgRqveP2DJifD1Jqf
	sNL3IJHSB6PtQrqUPA+pNpa5SsieG9WPHPoTIqfW5OUg35J60ArLbJkd2oH2ftLaykBzbyHKMAN
	pNvzeHf0Q2vcA/sWY+aRuwVV6HaBThaE3uBABdzxb2lPfXqANNtFyEzPddhoSuUrV5PCpOpA1Ai
	nBKhpAHbfmwaPqh4HIVQzcNwTYk9kiGWUIpY=
X-Received: by 2002:a17:90a:e70f:b0:32f:98da:c397 with SMTP id 98e67ed59e1d1-33bcf8f735emr12159177a91.24.1760873757173;
        Sun, 19 Oct 2025 04:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6CW/q1FylEFNvM8ThCHmkSbr40lr1qt5/loh++GddqpGz+vFWHhoot6iHJZgB6N2Hj63VWg==
X-Received: by 2002:a17:90a:e70f:b0:32f:98da:c397 with SMTP id 98e67ed59e1d1-33bcf8f735emr12159146a91.24.1760873756692;
        Sun, 19 Oct 2025 04:35:56 -0700 (PDT)
Received: from [192.168.1.3] ([122.181.214.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de0c06dsm5025976a91.8.2025.10.19.04.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 04:35:56 -0700 (PDT)
Message-ID: <81367b57-f60c-48a6-8a59-7e160c312686@oss.qualcomm.com>
Date: Sun, 19 Oct 2025 17:05:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Modify USB controller nodes for USB on X1E80100
To: Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
 <d0c18094-7234-450d-bd9c-e9f545de31e2@packett.cool>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <d0c18094-7234-450d-bd9c-e9f545de31e2@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MNCEe7laCcG_D9WQrW2UH4I4zu_80oRU
X-Proofpoint-GUID: MNCEe7laCcG_D9WQrW2UH4I4zu_80oRU
X-Authority-Analysis: v=2.4 cv=XuT3+FF9 c=1 sm=1 tr=0 ts=68f4cd1e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=COzVrc3/y9xyZPF/JXNSAQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=uXidzf91Loiht4yY4DUA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNCBTYWx0ZWRfXx6JVFs+0ZM3P
 AvVmahjHSkE/ItSm0DDgYa76JMtEgCtgp0eRp60yfIlch/xRkDtpKSqXrCD1C04ButtsI3LDli7
 yFH1FFmYhmEEi0dhtubsEmNPPJF2/fAg2XrGbP965UbC36QkvenCGnmo/Ob0VHLpVt1gGG1YW+C
 tUXUkEo9yjn57WDFnlH+N9z36VlFXZn611Zx+Wp9Huf0EOIbLdaM+uKVfnl+fU8JBmtos27s05+
 y7vXC57eR9dhDeJq2ejLOnSM5k5Q1o1YvSgjWNcWxHGkUd9p7NOsGCgUosNlwypzzLHBZvCDELI
 IIx7mWZHge1XbTt52X1UzIlyvqtV8g7xZE28AAcqjBe31b16FN/exISA8JEwwwBYegdcUHtXnvG
 CSAPdfQznIBxgo4Whj0bZSP6+JvQAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180014



On 10/14/2025 2:30 PM, Val Packett wrote:
> Hi,
> 
> On 10/13/25 11:21 PM, Krishna Kurapati wrote:
>> This series aims to flatten usb dt nodes and use latest bindings.
>> While at it, fix a compile time warning on the HS only controller node.
>>
>> Tests done:
>> 1. On CRD, verified host mode operation of the 3 exposed Type-C ports
>> and enumeration of the Goodix fingerprint sensor on the multiport
>> usb controller.
>>
>> 2. Modified the dr_mode to otg for the first 3 controllers and
>> verified role switching and device mode operation on the 3 exposed
>> Type-C ports.
>>
>> HS only controller was not tested on any platform.
> 
> have you tested suspend-resume?
> 
> The flattened dwc driver seems to break it for me on Latitude 7455, upon 
> trying to resume the screen never comes back up and the system just 
> reboots from zero in a couple seconds instead.
> 
> I've looked at the code and I couldn't find the cause so far, but it is 
> fine with the legacy driver and not fine with this one :(
> 

Hi Val,

  Thanks for reporting this. I did test runtime suspend resume on all 3 
typec ports as mentioned. But I didn't check system suspend case.

  I will try to reproduce the issue, fix it and then resend the patches.

Regards,
Krishna,

