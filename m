Return-Path: <linux-arm-msm+bounces-61020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E8AD6052
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 22:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04FA1177D0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 20:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DCC22A7E1;
	Wed, 11 Jun 2025 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiM0Dzzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD91E0E0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674786; cv=none; b=WzVRmpluZJiD06mBIyWFUGsq8Qxt+ZEpb5weqUHGnKmfbhRza33KkANXGnMi4RSjPxiDztbXsGgygUmGfyCauj/KMcVitlAap9U4NIjnwsj2GBEUk2cw0BbDDfMdFi13xatrc0ujoR/Vx2bE5pxnpNva+p6niLToviliX90CsWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674786; c=relaxed/simple;
	bh=9A3+er+GXhBSMFhfbzGJIo+ZQBu0Z0kkcuzWaD0rZks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iv0AFR0bxvVdNEL3ltCUHY7O0Zn+LlIPTKo/X5s9BkJqneaS9E+CWegw57ZAKvH+zNzf+pJsDZqiypIFxr3XF//DE+U+40biKieEcoxf/lI4MmReMH13UtltDUmSE93w/ND2EWcP9oRve+z8KxXiHZ92AciuzzZadYxKAtS0cpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiM0Dzzd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BAncnB002608
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 20:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ruZUfDwyhiuSGUGocg3TdcOGOm06EvVKWSoIrX94OH8=; b=kiM0DzzdHWbeLeNF
	nYUy1s/nSgjws2kmqtIqqhlZW4vGbNXKRpipCW/+VNUAQWFGI0rETlf+NHyvBHf7
	coagwyVh+o/tdH9mtGQVcMxJHbq8QzrKcZ+FPeD9a0lXQWayVwsD2hoRI7FsWx4j
	/xruIzdm7PU2RJPdgF+JDDUQhq0aj4JJ9qTp4ljKU6apl01LtWlzuBd0v1DY7Ubd
	9tLPWGf5C5M+MXVDUPfuTTnzcafdYtxgG/uX1G2sTnvHlK++LUInv2A3AmzHITSI
	3yfe1uk5qmXkUM2ZPx423syex3RXTgqIg4N7JtF6LepntGY6+eEKPDjgnT/D0lhj
	8e5LAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4778cwhj9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 20:46:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafc0e703aso412116d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674782; x=1750279582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruZUfDwyhiuSGUGocg3TdcOGOm06EvVKWSoIrX94OH8=;
        b=KxNgDXSbIRZ9ecWafZyOBsX3z+KmfnyE+LaBfGItU6/ZYHC7JHoRXMBm1WqNEdQUfm
         FBoAjoC2s6z9HaNunXnBkjAIn5lm9hVyqa3Cm+MIQpcGeZOfzVLECbdNEAI4CafrB46e
         UUX7A2/FoferxsLLvZ7g4+7YsTJRQtd0e5T3AqPKch1hV9I0z6gNw4jJ84yOfc9kxI/8
         7gb6X6VZMcoM0JrcaccvpGM+9XJKUsrs/vOPRR3nvZeWXTyoHNWMNg9zPqZuctI3hn2R
         PT3hOwU86u3Sj7mxtRFlsudEd74F01r3v40QQgbkwEKgAEID3UO3pJk8WiaSIzi7yzww
         ZLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg5CVETjiMknwn50DN8dmJWVqvZtFaefisQ5B+jy6Im/zqJiYKBbFGuevX+qOf9Ckta6ORkeT/Ht9+QHcr@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1N/KtU7MuDjO7cQzzhaCqmz6ElkykMh2lWM1SpbKJnNnRAjj
	Utvq280euM3iBBajLUZQkD1cM44qNqUH6xLyAlzIQXVbEKNPkW+qEAWxaUW3M/X1wI4JGdimemv
	uXEGjh62elu+DImCLOJPO59DrMVRCNyAZRo41it8FWQkz4/QMWX/M9aBpD+2lrWOuBo6N
X-Gm-Gg: ASbGncsANPsczN+BH31xPNhDXhNhglzhm+IUiZBL83mdE9n1UKuko4eVML0enlf5Ja5
	rx4t0G+3GC0/84hk7bY5m0dxmZFLeCHezOFHk4bdDpuZxf68DsNDlAr+NsJEtVH16JdWzPzIATn
	tDv/9hQk27GqXBCePyqUaPGpv2pgZVpr80xHV30vxemvtRbKyA/gLhlBteXMCj7blLtHEXp2c3M
	EKEmfNKkxub2YbrdxnrP9sV7VMFZ4qoCcFiWSuIvQCh60xLWx7Z36Qwku5+LOuZXDPMJHgBh5mR
	d4Y4AVqkNKKz3wPzQeSN9wa9+jZgO44mvDd0P57JvkuWWn6z1dV71TBuE16piceuj6QLg912r9c
	6i+E=
X-Received: by 2002:ac8:59c3:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a713bb9720mr29567881cf.4.1749674781645;
        Wed, 11 Jun 2025 13:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpE4l19NcotusXs/JGD/9lWjuCflw6wXer4thghs0100gWvTxtRJ8z3FjtMA0ym6aUubTWjw==
X-Received: by 2002:ac8:59c3:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a713bb9720mr29567661cf.4.1749674781258;
        Wed, 11 Jun 2025 13:46:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086b1e5694sm109164a12.50.2025.06.11.13.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:46:19 -0700 (PDT)
Message-ID: <4b3cd0a9-ef63-4adc-b2c2-52fde30fed83@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 22:46:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <aD1cUF56-IX_tSpp@linaro.org>
 <a47842eb-6d65-4928-8226-461ee36b480b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a47842eb-6d65-4928-8226-461ee36b480b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaixH2XG c=1 sm=1 tr=0 ts=6849eb1e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XJfM86Q9xTMduWHL3o8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: a6wtkoWB2gaaeL1QXBXROQ-PAIdpZ9Ma
X-Proofpoint-GUID: a6wtkoWB2gaaeL1QXBXROQ-PAIdpZ9Ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDE3NSBTYWx0ZWRfX/e3gF8Oqscoi
 qmhjrpmbtva0/bbQtIB6FQcA//jYjN/KoSXmCawZMrEB5c3SSICYrZwihq8Nb1BPM2lhtbSfzm3
 zeuVEi2actAZ4LH3Yk9WhEMdNHllXPF3hThDfOBv+XpOIsN/iFTMvdh6387B7wPeQbsXawUJrSL
 rTXiVrNSVSi0cpIMYjSb5NYXB/hxBZoOG71/trjPVgAOE1DaQE+/7gGN6zpQyWE/95xuLrs5q2C
 boL2Qks0dcVvU90rxHTcdwwNGNyFOss4aBfhjc+7Z3NrPAVuYfFfk//stB8v0qlvzNyM4DzLEYw
 UrcszNyltbj8MXef6fGui9CiTtrCwZTly9ziVb1h635oGNNyG0IUX3bMKbFOEIZanx8t1XULTUk
 8MhFBzaGwQ3vx7g9H0h5Dnhh0Y238c9LzUDNSo81g1Cg4XHdGbn4FvyDY43mMzPLsqFl0vUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=963 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110175

On 6/11/25 10:43 PM, Konrad Dybcio wrote:
> On 6/2/25 10:09 AM, Stephan Gerhold wrote:
>> On Sat, May 31, 2025 at 02:27:18PM +0200, Konrad Dybcio wrote:
>>> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
>>>
>>> No external dependencies
>>>
>>
>> Are you sure?
>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>> Konrad Dybcio (5):
>>>       arm64: dts: qcom: msm8916: Add Venus OPP table
>>>       arm64: dts: qcom: msm8996: Add Venus OPP table
>>>       arm64: dts: qcom: msm8998: Add Venus OPP table
>>>       arm64: dts: qcom: sdm630: Add Venus OPP table
>>
>> None of these platforms has a power domain that supports performance
>> states specified in the venus node of the DT, and the venus GDSC does
>> not have any parent either. I think you will need to update the venus
>> bindings and add
>>
>> 	.opp_pmdomain = (const char *[]) { "cx" /*???*/ },
>>
>> for all these in the venus driver (plus backwards compat if not already
>> there). And then add that power domain additionally in the DT.
> 
> Making use of these tables would certainly be welcome.. This patchset
> was aimed at pushing them to fdt, so that we can debate dropping the
> hardcoded values in the driver in the future.

I don't think we can just plug them in to the driver right now, as
it would also happen to break backwards compat (since
devm_pm_domain_attach_list() seems to not be particularly happy about
missing resources) - though arguments can be made both ways: "it
could have never *really* worked" vs "don't poke at the old driver for
old hardware too much, as it's gonna break"

Konrad

