Return-Path: <linux-arm-msm+bounces-66366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA8B0FC5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0E0C1680AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E8F26C39B;
	Wed, 23 Jul 2025 21:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yufwob0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AEC2586CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753307846; cv=none; b=apZTxhux314rXhdyhxFyrVXPSZmm2rFEfyz3Z2H/3G1oUTz2TtexTdoZZVw1yAFu4Tem5JDqGzQROVuWY3IseFEigEoVyLUoah8eds81HtEVS124ZSDR+dkbiBXw+gx5z1tGEY/wAmCEFY57l1H8tWPvaPMoogUgYShDZs3tdKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753307846; c=relaxed/simple;
	bh=x8ZNaM3qWNjsTBLjr7nmR5rJvVV45h8js/ATC7FIzac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hr3RIWXmvqdpd5TF1Hj46P9tA79RjfTdIlxBuo1p3XkQLF73G3eMOaGKQ2bR4OdMynvSX3X1O03AsP5FYMHfcTaaWMRdwXd2u0VoXrdgInIM2iHV8eGn+XpY0nWtMZ6XDVuZ9BZWl+NQYJeBursFK91AX/I9kHTDSpM/IZttflc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yufwob0b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHJ1N1021749
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ+IYU0/ojEVW5G9zuKC8BY7swUqGdFQH23X2V5IKK8=; b=Yufwob0bDJ0w5GdB
	hm0F8+3TFob3MdtZgWS6cMYBLdvKv5Fts8AocKCXK4LgymsH5kvtHT2UWTEOq67E
	yXFdvBoS9yVC0zuLi62tjyaV7g3wDxrJ5e7zlQAwU7IFcgmSEzeOy2C/sqVa5MVO
	+Y1Mevz1D3P1UF+lBgOR5XcF/Gjdrys1rq0pYVRYw1F0l6012olMXSZVAb0tXE1+
	81FwbRcLFkN0HSVha2rqEerBXhWcZQVHdtvx6UjlPeYjZh7KOTjpDjUFPF+bbyR7
	TUX26bcaBskO/1xcRzdedmyaOQ6jQOc/C18YYQSaB93j0l8oXcnj754E6FRBDdg1
	2+DzaQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3esex6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:57:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-75ab147e0f7so319407b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753307843; x=1753912643;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ+IYU0/ojEVW5G9zuKC8BY7swUqGdFQH23X2V5IKK8=;
        b=mdAY+yrttXDJ63qeDPpoEUDVChTt5MhSo/nQGIbejf2KhCeEyoUlmbE3hZM2S6RcOy
         VBfMhNhSqJQ99DYxLHJKTN2/QbBcKl2TRdHAMNA4yvGcfdeuxpHw+8NFzJlM2Rfki8sH
         RmZ+9aV3bqztWYKwZali3/UvaZHM4fhy8HPffr5qdvkm9jEircfSdU5lYFSSVYeDE7W0
         QN/tGdZHcBvGnM6MpqPQxTy2FW/hi0Oztp20DjQXNsoU3+NqScOEXZHy19LVzI3vu8oy
         4PrfRANrIEqLPTlFClgUi0+jBfJplJaXYAeVZrGcDIbM84k7aKBybv9rxlHbbHxdHAFt
         TX1w==
X-Forwarded-Encrypted: i=1; AJvYcCWuDRjL7ivN/vAbzrjNhC8kjz5l7b2INI9/xLvvqW8iQGQbZOpgP31LTMs70Z3VckXo8Bo7vbb1r+7O89HP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nh+rr70dKbzS7z1Wb3Ny8wbc8Endjn+kP2ndNstDLXW9Ykju
	0qfSJ9T9H7u9z8hRyUS84Tyv7T+tmmmA8E47dEmuWc0XIGx0A7ROnkECDb8cKVUhMs3X8UcA5z8
	+jEXolhRJ7HTveGQSaZn5oef1Chmq8yPLtTcWE1LllyOMnV1J2z8+KrLlQMtte43/2pRM
X-Gm-Gg: ASbGncvbf1s0AVSE7eR0A5JKPIfSrl5vitYZFZf92dGpQpzyY74IXaxeN3gt44Yi8Gv
	cH3tDJpPqwgAvs3E5cEN84Tb1EBkWcnRBsnSiAcuAncPw++Zb61/8veIh39vyKxnx2KIbSZrnkb
	HHj+4k1vwAMpJV7eRLhyXJrVRQQ4xGvHJFoniRS43u6KWi8EDDbyXeNWHE9XTO/OnQsnb7EuMbz
	fPX0heivLuEoGu6AvtKIrl1upjmfu09AOwtKAF0R7kms/IlcAy8p/liL5n/wfqpCRQIS6pyfXPN
	X9N1n1mh1BJZi2wuBh7Nyua3DUhb8nimlJFyeuelOk5El3cMP0fMVcoDIKpgSw==
X-Received: by 2002:a05:6a00:1914:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76035ff3a9dmr6809756b3a.23.1753307843097;
        Wed, 23 Jul 2025 14:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWT5EGhznLq4VFRgdd229b0EV7FZUBLIcTF0ozLJKJ43/pxYlu8O0H+tTREYzCfpQFAEhI7A==
X-Received: by 2002:a05:6a00:1914:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76035ff3a9dmr6809712b3a.23.1753307842602;
        Wed, 23 Jul 2025 14:57:22 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b04b3517sm124546b3a.84.2025.07.23.14.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 14:57:22 -0700 (PDT)
Message-ID: <bd0d5470-04e3-4545-be5d-a71b9d3fb5a0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:27:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
 <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
 <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lLtpzD6_mKW8ANsY7mqHOa2T3w4-LhXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfX7U7jNoJeexzX
 KJejoMrD3KAx/CYA+Nd1SBCl07zgpNaGdWPaDXxCgW/OPErILUuSbLsSH+hfjd1IRFK1LfsoYIo
 Ur3ySVYt11StQX0REfpBaP6G0DrTsxIKtt50IUGacWR4C5Us/2jrPaz2csh550pMcjWtLjJMn/a
 uFB4NimSzkVqqKWEmrq+4XPDODHjYtqw222lqpWq44AcXZpjS5cSZMMh3vEyjmjzotxN3c3gFLZ
 UhwonFVXRUCVXNlkscYGkjgDrcGTKeP/n0UDs+t4Jk/poNzcz4PQI5hhknXbnj8nIFp2W+IpTQf
 4+oMxkx1Ek730NPOLB4HG4/25UaEAKDoHtns//9SqP7FpWyGuIP4IRFcF87mSBcyZ21uwju1ge9
 bgOZ3/D2qWprsoU97oIk5SgSnd/cRJceW92fD2NVteXKrNsFy8a8TAJWuMkupDeM5L+NJ9Nu
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68815ac4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=LD9g5RzjIN7if3dsUIgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: lLtpzD6_mKW8ANsY7mqHOa2T3w4-LhXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=749 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230187

On 7/23/2025 4:03 PM, Konrad Dybcio wrote:
> On 7/22/25 11:37 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>>> X1-85 gpu.
>>>
>>> Nit: GPU
>>>
>>> I can't stop but notice that KGSL enables IFPC for a bigger set of
>>> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
>>> supported on those platforms?
>>
>> Sorry, no access to those hardwares. But I can certainly help if someone
>> wants to do that. :)
> 
> Let's get the groundwork merged first ;) 
> 
> Nowadays you can reasonably assume we have access to at least one board,
> no matter which SoC

We just need to add a proper ifpc restore register list for most
chipsets. But the legacy gmu firmware (a630 derivatives) might have some
quirks.

-Akhil.


> 
> Konrad


