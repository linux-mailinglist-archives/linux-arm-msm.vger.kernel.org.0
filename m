Return-Path: <linux-arm-msm+bounces-62590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40DAE98FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 10:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBFAF165476
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 08:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB53218AB0;
	Thu, 26 Jun 2025 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pI0/t2+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79FB295530
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927915; cv=none; b=uK9P3sKb7JhcijM9uWwesCEtORdD+MsgBUFzRICJ9+AUmBSJ1CcAGWND91iehAcgq381IicSLIdEqGyLrF8QgwpBXhyzmmf9ZOUo1nbSVvGvsZ4OXFZ1oYx7JSswIUMPC0Z/mSk8PGh2Yavs3kNjpPEbrU2D+piohHnGhVNpcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927915; c=relaxed/simple;
	bh=aznDneGB5ZSRcgyw+5JpEXuiR1KCupx+SXPzTLp24oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrkqsTmBKuh3ucUATVwjdb68WvVMRBx6393yLI0XjTpT7DfZ7XK89DEgNQcxYZ5pkrTRlrbb8ikSjnvnsXnrayhqGgE2xZ94+oAs91qY3xiSYuXVckrjPq2pUrARpQ0/xvMfikQi3z8DqOmszo+U9JQKTYuYP1Gk2XiumjDWRG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pI0/t2+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0Dnlv008309
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgfcLjhJkXI1R1iwfIXHzXxGB6xPeQaB1Fa4Lnbay6g=; b=pI0/t2+k37GowChq
	slrM9V81tfI3008e9t5Oh19Ci3phkWDQb3qhHYAxkas0x6YnSk+3s52MyTbkoCSu
	vzA37m/uHeJ6hIHdyNkntoACiZ44lXsG5vPQ1Cs1e4HBrm3UeubKlA462i4TJ8MA
	5TzOBE6bopGwwW+mLuYhdTKihB/g8p6X0AuSQuiaLwym55smUcsbHi12rCcwCa0/
	8T0RsZHIKFrTW+M022TZ5bMqLu6EehcHLq1D39hAP/35C5bFVwiygPTXOIfpmeOl
	JOB+7WTFaIEn8UMgweIhaTJHNdoW4zro6KSY9D+9hj+T/vKtSpgGwsiXdxRoRs2G
	i9ZzXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqs3s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:51:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5a9791fa9so2746811cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 01:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927912; x=1751532712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgfcLjhJkXI1R1iwfIXHzXxGB6xPeQaB1Fa4Lnbay6g=;
        b=cXT2oMkbjGxZOGv0oNeM5SZ5AAh1X06X3WuzLGNj1TvvmmewA9DzafIGTMl3uP4WvA
         xH5aRjVMSZ9sPUmmI6OM8bXxehULo/8AJ+ef+jJ9YzI9w4MoN0E1999Y8cAAxx87Oo2s
         p92B6BZmTJ+yVicuwuecHmo7X6pdBc/yfUnGgaO5u5BPcA8fobF6Mmoc7NCJrgFirdLw
         Ozt31i8yAap4L6+BFDzzcIc26D/3MaItkYpIr7bIZiW9dPB0wjR6F+8JEEGKqHTop5qN
         4GBPhEMCcR5+FGWeLOsnIusnsiF8DC4Dm9CN4sGgogzO7P3vr9mchknMOtJaYZtyxQ/K
         8E1w==
X-Gm-Message-State: AOJu0YzLq5jS48quk5A5QzX8myogUr56s7d7mcI/udbo7B1RPIqXUKyV
	11Q++GoiXAMJzvYTWWI+qBx8jGDSi7G5BF3yxJKreOFxSJusLvRRrLAog92VpGqihrQcIdmCQTI
	nRH/Jt10xpmDQ+GLUuI8ou35zHDkHFnnerAnxA7a9KIva/vrmZKVtpDOzK9cA26A5c0P1
X-Gm-Gg: ASbGncvQ2oJTBiH3yS/sryKUatm5kVRmfnS7kzwKls+QucWSqE/ynkTikUfc1F7jhL9
	RHctZx2eDJanXgJ4gmy9RpIm4qB8wUfq3hAw+uS/OxbTDKp98LW/nR2THKD6h76ydVYp6DkI+dc
	OTdBI+YHTeQ4kku9nWcv4TjLTO5EgHmCGRWMOUh0PngLSb7R7Yv+DZskAJT8uv8Ar42oN7sMyFQ
	GlSTug0NzvoBf9ROxEzuXatXFgPyMhi6g+QZFmiBRCEuYAjdHNbhEsfjHF6b0v+99x9yes0fUCu
	qqEV3xYeFlxuXDLchJPHOqdC8JegCZDv+bp+KJ5+oE5s5DJsmXvsCK3nNXLDQEDJHmr22zdDsY3
	yrEc=
X-Received: by 2002:a05:622a:54f:b0:4a6:fd66:3458 with SMTP id d75a77b69052e-4a7c0a039f4mr40604311cf.10.1750927911792;
        Thu, 26 Jun 2025 01:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOmDH0KAs+XZortwRNF91JwBtBfCGAk9k2TesPeECiTsTLjvyA5O5SpXyDnT2kgnA3WVQCcg==
X-Received: by 2002:a05:622a:54f:b0:4a6:fd66:3458 with SMTP id d75a77b69052e-4a7c0a039f4mr40604151cf.10.1750927911085;
        Thu, 26 Jun 2025 01:51:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0c7994f6asm228368766b.38.2025.06.26.01.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:51:50 -0700 (PDT)
Message-ID: <688d2d3f-6cb9-43bf-be39-7c7651def3a8@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 10:51:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for IQ-8275-evk board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Rob Herring (Arm)"
 <robh@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        kernel@oss.qualcomm.com, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <175069348269.3797007.5540625905808833666.robh@kernel.org>
 <bcfbfaed-e857-44be-86bd-d4e977fd4d27@oss.qualcomm.com>
 <0e632d8a-fdd3-4401-ae6e-a0ac6df61bfe@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0e632d8a-fdd3-4401-ae6e-a0ac6df61bfe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hecv9jIbilCgdpRnBWiBil15V9U4y5eH
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685d0a28 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=p9_aX5AVk4CqX6A2AiYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Hecv9jIbilCgdpRnBWiBil15V9U4y5eH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3MyBTYWx0ZWRfX9Ap4IBfKKgOw
 Hb0UQNUia4gjwj3kPEhFBb0FAte821kjGFbHdBiKqSuQeppbyVR2GsSrnn+ehp3HrJYduDZacRo
 xibCtkviaqnQyeIef2S7Lb/P+AgWA0wOkcMvfzDV14iHXsYpq9ZwLE5IJRd74HRuIefeDf4fSF9
 LGntxEOSD8fyycnynLfog4he81CYQzw5FcVy+nywU0oqHGSGH6Fu6Z4S2OP61Y+se6wgGaPBIQ0
 TlUWFNkxC1+Gq5UsUN2h5+zEjj1kfKM3gkeMX9pVCglpOaJoCIiofCekuKWCV+uZQRI/6KJ6Fwe
 Eka+9mc9s373P+dF7Z+LEPTtZeyJfKhomoeA1+NPqtnUofso96lGEG4GPoYja9HxAu8E+5O4V6k
 En83YMxEwfm89Gam36pIrHpGapzVbTUGYRXxVr0N9IYAiqVT5s1JRcF2JhF6g/5TSY91luHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260073

On 6/26/25 10:43 AM, Krzysztof Kozlowski wrote:
> On 23/06/2025 17:50, Konrad Dybcio wrote:
>> On 6/23/25 5:46 PM, 'Rob Herring (Arm)' via kernel wrote:
>>>
>>> On Mon, 23 Jun 2025 18:34:18 +0530, Umang Chheda wrote:
>>>> This series:
>>>>
>>>> Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.
>>
>> [...]
>>
>>>>
>>>>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>>>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
>>>>  3 files changed, 249 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
>>>>
>>
>> [...]
>>
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250623130420.3981916-1-umang.chheda@oss.qualcomm.com:
>>>
>>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>> 	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
>>
>> Seems like a fluke..
> No, it is a correct report. Schema does not allow port and needs to be
> fixed.
> 
> What's more, this would be pointed out if contributor checked their DTS,
> so obviously this never happened.
> 
> Internal guideline already asks for it, we asked for it, so why this
> keeps happening?

What I'm saying is, look at the diffstat that I purposefully kept above
- unless modifying qcom.yaml retriggered it (but not any other errors?)

Konrad

