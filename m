Return-Path: <linux-arm-msm+bounces-59686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57747AC6847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F8C57A4F47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3982820C3;
	Wed, 28 May 2025 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ji1J4vDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BC28153C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431368; cv=none; b=jvknY+5tmm/lQMRg3xR8My/5DyCwGTFZNY2CWlFaoEoLqWfkSTXgLvyYZ6RFy8N+dxdRpQACBf8l1Zacups3GT4GX5hQqp53T9rIaUAz4pdLOMUg1tKd09rT9LVu/bPgZJ4cSd9zyMhWDLI/0bsaETC4GV1//sZp0bFjvM2VSd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431368; c=relaxed/simple;
	bh=SQjZk2OifxeYB4JLy8Q5cjUg0zdPgl1qjVVFEnxXc0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXYi5XoOSyuiMsSqk448hqqqeqcobn8QGhXPUmZsF5ysMmpt2Z5jSo286VF6skdb5ZcuxKj3jUL8drBwNWQDaog7JwLwtwfvQXFPpbfWVvadNWzFMzky51QylmlixEKnnzObRp4eNWlfHEjjrmL/+q/pulByY2h10PKS2QsuksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ji1J4vDP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S79Nlp000710
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXrF3chhlKsYPqdRDHwS0A8uxmZl7PCZMAnk+l3O8cw=; b=ji1J4vDPrznP7Pqv
	1zdDmfOmUi/OK7mmMDtOliQ8DG1CDqh6JpJpI7y0dKCkKdBTh+6Dt5xRaB2LpzuE
	6W12J5C/vCuUxVRPh/oPeTZZjXcm+2zG7PpjH8gTObT5CIF5p5hEqLweVlbweGUC
	8o2W759pXLSm1/gpVO01S0fnlx29gM78ddfjxBgabICF7w1NLYtY+K3vC3m6uvLo
	vjaBqZxgRSWZqIcfTUhrKKX39+cLV5j8h3d/dGwLls4RvZZYPnOIdFJaNg+GyfAX
	NgeMTerok3qxMHyDdNPSX7cCYNPs2O2sf7Eez4TRQctN5EgC/g/7kpgE9bLBd2EZ
	R/zT7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9219f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:22:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso145659785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431364; x=1749036164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXrF3chhlKsYPqdRDHwS0A8uxmZl7PCZMAnk+l3O8cw=;
        b=XFaytIQtyM5yssXT0Of+wJLAUbQtdYEgyg8SuHtS0i9UopcZUPAe2nj5oZlWp02b2C
         v9B1QbAxWbs+dLtRG+yOJ4yfrUUZyN83VtIP+92ztVZ8rYU/y7w7Vz6TQvJsxjmDdIHi
         zmbhM3kx309Z6MJd4irPANxMb3E9YPvtsoaLOTT7q0Psv4eYF7RafpNSwR9CkVkY9rY1
         KigCzo0B1R+iZPZoYBLY6dqp9tCphd/w6uIM1SNTZGie3kniWbpOR/oa6FJJplDsvCRj
         P2GQHIMzkkKPgSeo7vI9frkTc0aYm8ia35K2G/ns5w0wRK+8VDPxMfJpQIQ/VASJvzNw
         7yiw==
X-Forwarded-Encrypted: i=1; AJvYcCWoEe7UmUE10MG7IKZwQWqynO8KpmP7LByCvBnQWomNanFllTT90MDLcnw+WvxwpOAt8gBcykiH0jjWDHvv@vger.kernel.org
X-Gm-Message-State: AOJu0YxybZJ8IHnrNhljrHBJ9wBQSW5n7elBFfbW5XE6BWXjrnNoF47m
	pnlnlnBxiqsshrBOwxIKp4c9SCMUP8SxFMyOABsPQ6T5O+pNtyajgT/rYDWyJrdF7nfKeVxV7zn
	WY1J6/SpNetP+azCr8xUVSwOMFD8s+JpNZTl9haj6F0JBv+ybAmBuApnTo8b3qVnOXNta
X-Gm-Gg: ASbGncsGCYK6LSSw62Q+fx5H1N1Ho8LfUtOfPBbW068xH7108qjZAefkoABr/7ojndd
	6d1zXchqm9iYM4MasCj3CmhgZ+AJvrMoWiZOe+89PG5FmbeWtKPseT5yEPxjlldv/gnqPmQ+nD8
	T2Cp8yAGlWWkHcuQ5cOUl/X9DB/vXOZfUentTaqoQv9vPmKIDdaEkH+3yrX/SBXqcpjE+Hoe7m9
	MKiIKrEuj5RN8tc1+r1S9dTDCoZhJXRNi33Ueu6kd+ENULUacWOlWvw6d/lTDEUBZ/XQagftOnC
	6l+Gp61nWAPCVmQBfwCL08nopE2P36GkBIt5+yrBAj+MaBlf7XJ/RHKxT/yafiHFMw==
X-Received: by 2002:a05:620a:2710:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cf5374ae78mr110203985a.10.1748431364558;
        Wed, 28 May 2025 04:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoL3mKSALNU9U5rUvH7D3DgExdg+X+00mZ1LS8ZpHat+MX4uUZuY9EFAKe+em8TE91JP4dIQ==
X-Received: by 2002:a05:620a:2710:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cf5374ae78mr110201785a.10.1748431363985;
        Wed, 28 May 2025 04:22:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b47a16sm91600666b.144.2025.05.28.04.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 04:22:43 -0700 (PDT)
Message-ID: <07aa740a-72f1-4d7a-aefc-437d52b8dac8@oss.qualcomm.com>
Date: Wed, 28 May 2025 13:22:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
 <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
 <7f464eb7-469c-4350-a43a-3b99394ad689@oss.qualcomm.com>
 <7icpna4l7z63gs52oa5lqf35puib66wxxmqqul6ezdkhuziaqi@mvkf73zz2iyj>
 <8692f79f-142c-43e6-9e09-7ed4ce590b87@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8692f79f-142c-43e6-9e09-7ed4ce590b87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6836f205 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WE4J2M1y9a7QUu_BFKwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DL_MNiHaP4UnjrvCV_vnHrgV0VY20L_Z
X-Proofpoint-GUID: DL_MNiHaP4UnjrvCV_vnHrgV0VY20L_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5OSBTYWx0ZWRfXx1rcQa6n3fyv
 IBji38DWEx7Ks7ijeok6CgB0V5J6MiS6oEBHYxaymChgrtGumW04p/gHWoI+nlBB2g1jwJPAkM/
 Pn1rxxHZn0uGQgmzrtUD5LKA1XAUQtHMJiiWCRotc7zGovaQYMd5wmcsgieGNs/EWTKFQQmD9Io
 mvg5mgfZIwH2KU0HGNgubG78b9o+zvCYyJHJYBxr/ClKker77lQS016LTHkIBto9oVitfnxdDAo
 ZKIYSbRoFkhNOURCImtVtoTd6QVgHrF3bpnGyBx+HhKSkOX/ebnbu/raA7xGZf5Jo0lWUnJRoGB
 z03Bw8NU2ngwAaNiWXdn87BER8QyFXX8eGGsxklkbCbjnSkSCOlNIcsf6yQACrd3P1I2lP97xX3
 SbzdyWBltWtsh5lbjQ1V6gYoqaRMUtZrTnd6XNCbOS+wP2x/sjYCDCneO1NZp967/38znJ/f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=879
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280099

On 5/28/25 1:21 PM, Konrad Dybcio wrote:
> On 5/28/25 10:58 AM, Dmitry Baryshkov wrote:
>> On Wed, May 28, 2025 at 12:22:01AM +0200, Konrad Dybcio wrote:
>>> On 5/27/25 11:55 PM, Dmitry Baryshkov wrote:
>>>> On Tue, May 27, 2025 at 10:40:07PM +0200, Konrad Dybcio wrote:
>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>
>>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>>
>>>>> The DisplayPort phy should be left enabled if is still powered on
>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>>> PHY is not powered off.
>>>>>
>>>>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>>>>> will be set in between of USB-Only, Combo and DisplayPort Only so
>>>>> this will leave enough time to the DRM DisplayPort controller to
>>>>> turn of the DisplayPort PHY.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> [konrad: renaming, rewording, bug fixes]
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>
>>> [...]
>>>
>>>>> +	} else {
>>>>> +		/* Fall back to USB3+DP mode if we're not sure it's strictly USB3-only */
>>>>
>>>> Why? if the SID is not DP, then there can't be a DP stream.
>>>>
>>>>> +		if (state->mode == TYPEC_MODE_USB3 || state->mode == TYPEC_STATE_USB)
>>>>> +			new_mode = QMPPHY_MODE_USB3_ONLY;
>>>>> +		else
>>>>> +			new_mode = QMPPHY_MODE_USB3DP;
>>>
>>> To be honest I don't really know.. Neil chose to do that, but I don't
>>> think there's a strict requirement.. Should we default to 4ln-USB3?
>>
>> Yes, QMPPHY_MODE_USB3_ONLY. Nit: there is no 4ln-USB3 (it is a special
>> mode). We handle 2ln-USB3 only.
> 
> Right, I double checked and we support SS

I clicked ctrl-z one too many times - I meant SS+ 10Gbps

Konrad

