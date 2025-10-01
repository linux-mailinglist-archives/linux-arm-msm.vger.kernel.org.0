Return-Path: <linux-arm-msm+bounces-75652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D819CBAFB4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C803C5427
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93417281531;
	Wed,  1 Oct 2025 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmemrJcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8A1E3DCF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308169; cv=none; b=KyCnJPJM3Yxh7AhDnwkMMC3WdKJnPE8mPl0M8RVUhBdjKoNSsxzHlA2QAfdapbqIXHF0DIUcM6fVf7SuswCprlFP0gY/TRsXWcQ07S7wtmBKurWY6vylhKrC3E0kl6w+srafLQbwznE9OiEbYmIj/svCAX9p+yxAE29NaM3XiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308169; c=relaxed/simple;
	bh=ywB4TRn64dL9GrZgeL+rxfSwyjMN1NqbuW1p5qkBoSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbqUwPWypAWvTxVu5R9Ah3cQLNq9sY5CStTFujlNzLLd2mB14PdFgVjOYtQPZC1L3XOPDfxN7qI7hcze3O4XFzXsStUP4FPGFsW1efAUgxV5k0aRiXf8gW4LUi2fhnoSnOeXqWm0Q9kOov57JMNmcq9T/Gih5vwgsHGo1enJRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmemrJcc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UM5KWV024443
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AXkv0SchroDbDxwaQLmJ1jgS5WU7BUYEQwWO7JzI/8=; b=CmemrJccsjcf9w2W
	ft3zshGdTa4c/8c5KvQhipDcKIj0a2W0olYc8q1clyW3OI9hAvVWxemvlsZpZlNZ
	3L/IMBt5/wLBdBvCgNNftmuVEXI6AIDpKESLqJyaIQTtB9uPUqevEjPqlJGkDyiD
	MtGDTyAZzzLRisAWp2csE/uDkua7ZIzphkaztaWd9CqaUDHP/f7iDyWstnZgNeZW
	5ig2wjtshRZ6O+DFLawLDDRhrY2jENZPRBdfZ4WFB3jU4Lv7PH3ao6RlHRKyNFPG
	qXGLSQCFuFz+JMV9mjG5R6Tl221ZdBlE7s62xJEE+XHuqOzVO4d3TQZ13zjVVLll
	7CG3tA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n4a8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:42:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso10346951cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308166; x=1759912966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AXkv0SchroDbDxwaQLmJ1jgS5WU7BUYEQwWO7JzI/8=;
        b=wmn5ZAB+xnaDZ7v071vdOP7v/MTkeSW0szS466REKEImZaZhhGhYd3aU/VNIMehAS3
         TIpCVg7cV2UGUdajWFWXSZExRi2wGs2ia2ESaEd17nxbmKU+FI1JDyM+vTVnO79oXRcf
         wHZazC6JXh2ykY7XscppsweA+arC80hjUMwfy5lk9z2rCzujnXBxKyZ9DHZcvv/in1wj
         gPYvRSVEvWOKNMY/GWawhBoyTCOGYXkRujRGXMD2Hb/1mKSYOXD+t8c+8LMj0VcJSpga
         8zDkkNQZ8yfryPRSIoK2EnUEpRoEzGWHavweCY76T5xz3XAd4w9lArU7mMwxbJ8rVZz7
         wnFw==
X-Forwarded-Encrypted: i=1; AJvYcCXBjSfRi5IFf6PRGfl80TOs+qpzEe1aerYVB0eH4LaoBuXN/zJWD+bKkB3RQitHnCegBl7LgKt6V1oAVKar@vger.kernel.org
X-Gm-Message-State: AOJu0YzBi9mm/MJGHSKBAdKbmem72XdpqazmAMmzNJ2AKsy520dAykAb
	wtKJpzFmoWFz3jbPmtmHjy5o0W2S1+pMHRWXlq9qvWA8rGQxV/LmKq1TbqqsfXf3P+dBK+wHaCk
	4Is8uEjTifkWKI+JujQYigwhnpmTgZPLq82YAcWUrivkOny+dR46GQS5V+iJpca94JHO/
X-Gm-Gg: ASbGncvpC8bel7bGaryGWzCtiYDRRWmh3rGTpHqEjoe+fF0B2fmSbAP2jTy6K3bwM9N
	e9059nOCM6ePkjeS5OvL2LBs6leGJfHOdMlDM/U8wtHm7a8+WnQvnaO20BhTlkwag9sGOeKvdEi
	I8WQR4wbhORuB/ofCP91wwnjVYprTZU4LbZzZS95FrS0GZeZSq7b4HT1teIRyjIWEObCPX4jFLX
	TEPem7R6hY93taBsLI9oZjGLLderr5ubAbtcXuZbosXNZXeUvbNRaeWrd9FVtW2+GNHAhjLT0tz
	+zblz5U/daMOjwniR4PUsfgB4c+KOHRJsjsgEq++zd9ljj39UgulRUgFwTD4GJhb6xg/Kq70uqg
	51r4LWsa1BPUUjeUyvf67A6Htp/U=
X-Received: by 2002:a05:622a:1790:b0:4b6:2efe:2f73 with SMTP id d75a77b69052e-4e41bf6f1c8mr24267621cf.1.1759308165749;
        Wed, 01 Oct 2025 01:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7/tCqSURz5SUFulF00TbJ80vijd1LGyEq3ySw1CXLtSkpP/xK1BzE6sjcisbfNg6/ZFRKVA==
X-Received: by 2002:a05:622a:1790:b0:4b6:2efe:2f73 with SMTP id d75a77b69052e-4e41bf6f1c8mr24267411cf.1.1759308165166;
        Wed, 01 Oct 2025 01:42:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634c065a67csm9320710a12.36.2025.10.01.01.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:42:44 -0700 (PDT)
Message-ID: <26eafedd-a3e2-4234-9237-4cf7282c0d19@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: glymur: Add USB support
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>
 <dzjj344c6zlkg4rvi455xoedhd4d2kjvodi6yftv7svhvvmxbz@kwq7rkq45tms>
 <66a5084e-3f7a-452d-ad5b-5867528f57a5@oss.qualcomm.com>
 <2c576766-bff2-27ab-2805-298a9d743b09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2c576766-bff2-27ab-2805-298a9d743b09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ctUWbKaMFPM2nKptynNtexNNs7ZK5Rof
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dce986 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=l2iTe4CMrS6P3tszQeoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ctUWbKaMFPM2nKptynNtexNNs7ZK5Rof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX+6rkIcUzWZDf
 /DwH1ORF8Qw1QyvfvWl7pmB0aXAN8iKBDQO70XUrdJFZx/HXIggzrYlI7dNnbhPH9xedbhE1WlH
 tqq2DFD3JaYfzDmzV4z6wSGK+gMnGhlrco8c9TJkLCHt/wOz08dG/Ya+Dsf57KsUgrAfdifwYLA
 bdcF1mWemZfI0dPt6ZJihqCTGbEOHZ0PxAWY48aTH/3otuic4uw/v2t3VsU4SmmyKnG5K+g/RR2
 YUL0itMka6wsefjVbntySyiU+A3Cjzj5CtJ4mGqnyvH8tNEMNnFLujzzsW5BDhKHGcYaXSLVa5D
 ODsWiEkOuEsKVtsXhRPIvaJyh5SnZyvEWhZWXhx9LArqoq3WqyyFtVs2rK9nVhz7GzFmCxTNDfk
 iPBMZHa1ouDIcrU74tggRv/MwuAOow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On 9/26/25 3:09 AM, Wesley Cheng wrote:
> 
> 
> On 9/25/2025 3:59 AM, Konrad Dybcio wrote:
>> On 9/25/25 12:54 PM, Abel Vesa wrote:
>>> On 25-09-25 11:58:29, Pankaj Patil wrote:
>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>
>>>> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
>>>> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
>>>> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
>>>> flattened DWC3 QCOM design.
>>>>
>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +
>>>> +        usb_1_ss0: usb@a600000 {
>>>
>>> This is usb_1_ss0, but then you have usb1_ss1 ?
>>
>> I'm in favor of just calling it USB0/1/2/MP/HS because that's what it is..
>>
> 
> I never really understood why we have:
> usb_1_ss0_hsphy
> usb_1_ss0_qmpphy
> 
> usb_1_ss1_hsphy
> usb_1_ss1_qmpphy
> ...
> 
> Not sure why we have the usb_1* tag for the primary and secondary PHYs. I think it'd be simpler to just do what Konrad mentioned:
> 
> usb0_hsphy0
> usb0_qmpphy0
> usb1_hsphy0
> usb1_qmpphy0
> usb2_hsphy0
> usb2_qmpphy0
> usb_mp_hsphy0
> usb_mp_hsphy1
> usb_mp_qmpphy0
> usb_mp_qmphy1
> 
> then controllers can be
> 
> usb_0_ss
> usb_1_ss
> usb_2_ss

I'd get rid of the _ss suffix too, we don't need to be super specific
(plus they support ss+ /or whatever the official naming is/ on some
platforms and not others and uniformity is good)

Konrad


