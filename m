Return-Path: <linux-arm-msm+bounces-71894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA521B424A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153381BA2C50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B9731A56D;
	Wed,  3 Sep 2025 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0kk9Cy1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B15931A06F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912371; cv=none; b=RocBSCsAqgxlW9PbzvXJp6yS4NF6uJEuHCuZPi7S5OSeUQ7KiyV06YlO5blARo/ch2dsx1H1yIMBXTm0iS4LrEtXf+Vi8Xxq5GoI136LC5kV/qt2ICwalyIRkZgoZg7RAGTnlni/sYovPhXHfFuA0pX6zfhaAXYdzFCdj2devvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912371; c=relaxed/simple;
	bh=n1msrM78RrmCwzR/wFOD65VIQbeh+xShWMhrW5eoPaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJbmVDPBsq2fmN/clqH6BadX4j6kxeEH4jiYo0ajljZ/mk9YXk6zveylA0NKot5+9X4lAP1X/WN7jW4Af2WJ8iOBmEPm2uNtd7xlAzoF95VFuSHlN9zNNoYnhLcJWJkE+bHcb+7B2xYa0CSAkYDjNfUD3NHVfe6hHpUqYAMGFvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0kk9Cy1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx9xW001019
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDHXiLglUa/QyYoJPmDdpI/sOMRLT10GemiBFT4WmI8=; b=e0kk9Cy1Kgjy87OR
	CmQP4T7SJMlgWQEXa2WvhqBk8t4XDVEvFt/UNCU0eRR16gew04CdHOXQhJw4A23r
	qG+hiz5ab/fX1cLYGxDvzoKZ4rBSsdeDE0EKje45lko1JRtliLxU/RhwghByuff2
	p5CtJyvSQUt3Op5crij7TDrc8kZ55orTwLj2g3EszvL+z+SuFOsDGvO+9K4OVTWP
	0pdh5ySZ2uTmF5r4ZaJMn6RDJYLgNORl6C7a/6xz7Kp2Nlkvn8o6cxxSpPfXyxJ+
	djBtlQ0R/+rrlRKc6HvG1ape5SS26DKK+9iWdw6IIjdiG9QW/onof92OGSiQRmhX
	fZCisg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush341yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:12:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8707254e0so727585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912368; x=1757517168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDHXiLglUa/QyYoJPmDdpI/sOMRLT10GemiBFT4WmI8=;
        b=vRqUrhwJWPbCOCigo1Jw/V0khaLQ+22+b/mJxsB7lehuoyz/gV104TTz6j1jBBRA5V
         40ktxewpsbNIIjsoyGSKz0umwIA8jO5efta5XcdnupftJRrnSlG6cWruegDz32O+GtfB
         IBDoE7wti1qmmSSxhi+gb3DTUeObgykWG14vsrgrrllOBjUzz+ZBkWLgrhXCi2mQo64T
         X+VpspR7hGlvloSdmrORSp2XCw1vx1sFAgajZJ1mmTUaqTfbc0zsjI5hqnn16qyoRKWJ
         9wL/d+l+G5ILTF8gsWJLPeaYlzIEMMgySN1sitgPC94VXT+dRmegKMDgFtTpjdRsYDpI
         GMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKRuOmRtra+fXJdC+GM++blwe+OIKoVLvQwJMRcufitFn2ZoZ/RNlzBRAI5PSv7Q+YrIGYZnF5S0eKcpdu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5p0iegEYutgfhbwI0oUA6hN8m0sauqYcA7ByMDnm186e556e
	XNql8Uli592LPN3UgBSzAtV5JOCLxvH6mmM+jkv6pnvyyXgYIMRfDAnq5vs4ghIADSxEzqnJtIo
	su8R/xdEQmCVaKlt+UFdN3+96N6KF4fAnNHZdX+UqqBcDMlgDj0D0zkHrzsYRnakLa4d/
X-Gm-Gg: ASbGncuPVHX8SX43tK/TifFVMU5S2kmJRdMNFrEUARTifNu+c5JNq6QtAJ2Tx3Dv+Ba
	aX9XsAfRRJ/65SVPVWwLGkWF8CLtuJvllBWreJoECYUhI6MCwNla1kXkBkCpGovhMLm6yiKw3F7
	/O+LsUc+NFgJIpXw+u++F+g2Tz11Y9IGzxWQCW/ERFwP/ulVqTWSTcXMMOjJNZhY1gO/0WTc7LD
	tmL2ADX8ervBBR+Gv6kVHvblMzN4WqW/6UP4pkRgK2DGdbXw5viM3sPnMRHh+vXEM8Gs2cfOM1b
	JEzNjj/JKrybl6lz+U3gWWcEaL3AG0rAGytFD3qekoCbMAeMyVFlG4HAYYlH95lzqNbfdFnPAoP
	wWL4g1ZC51VL/oIDTYft4HQ==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr148011961cf.1.1756912367584;
        Wed, 03 Sep 2025 08:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzte+bUX+mh/3ESDHWcOoXsvbBjuH86iwHqbD4v2SrOyFveDmmMuPlRhiIPoNeSHvIGkac6w==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr148011451cf.1.1756912366819;
        Wed, 03 Sep 2025 08:12:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046af12536sm165557966b.100.2025.09.03.08.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:12:46 -0700 (PDT)
Message-ID: <c7b87a26-2529-4306-86b3-0b62805f0a2a@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] arm64: dts: qcom: lemans-evk: Add nvmem-layout
 for EEPROM
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-4-bfa381bf8ba2@oss.qualcomm.com>
 <39c258b4-cd1f-4fc7-a871-7d2298389bf8@oss.qualcomm.com>
 <aLhMkp+QRIKlgYMx@hu-wasimn-hyd.qualcomm.com>
 <aLhZ8VpI4/fzo9h8@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aLhZ8VpI4/fzo9h8@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX4dTzuDhVqTNt
 fB41dy+HZpt4Hb6tp4XTPV6VbJkvAp1vsRIBYh+0Tj9ArUPukwWfpCJMqRMDB9TDnE0QDoN3U7G
 F8VjBE08sTSAhm74CHQ6p6KW34jbj8Ikz98/h05wBkAl4qaBC0y8zIrNn4NtoK2N19ubgUfa1p2
 p90d8eOwXB0KpOjDzyTZPet8tK3M6+3P8nIB/wOkavX175y05NMO7gMQfSoSFiMjk+rYyaO5myW
 6yuXr2giUaDnnOEsUYRIZX72S6GUwUtESEGMfSq68dFabBYqReUpBjEjo+wiN9sFNfT2496MHBD
 6VCJvZ11NfjXbnuIGxrfjhwk9gXfzNNv9A3fz6O3qdtKjXaId2Xsfg6JfiDlEEwMQKByFpYsusr
 Qq1W2jWs
X-Proofpoint-ORIG-GUID: Ov8Q5JxJYpMEWqgAFO80VKua3l0w7cT3
X-Proofpoint-GUID: Ov8Q5JxJYpMEWqgAFO80VKua3l0w7cT3
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b85af1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=ur_XN-hxGOuNM8kuFtUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/3/25 5:08 PM, Wasim Nazir wrote:
> On Wed, Sep 03, 2025 at 07:41:30PM +0530, Wasim Nazir wrote:
>> On Wed, Sep 03, 2025 at 02:29:11PM +0200, Konrad Dybcio wrote:
>>> On 9/3/25 1:47 PM, Wasim Nazir wrote:
>>>> From: Monish Chunara <quic_mchunara@quicinc.com>
>>>>
>>>> Define the nvmem layout on the EEPROM connected via I2C to enable
>>>> structured storage and access to board-specific configuration data,
>>>> such as MAC addresses for Ethernet.
>>>
>>> The commit subject should emphasize the introduction of the EEPROM
>>> itself, with the layout being a minor detail, yet the description of
>>> its use which you provided is important and welcome
>>>
>>
>> Thanks, Konrad, for pointing this out. I’ll update it in the next
>> series.
> 
> Moreover, I notice that compatible definition is missing for this
> EEPROM. I will add it in next series.

I think the pattern match in at24.yaml should catch it

Konrad

