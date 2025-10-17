Return-Path: <linux-arm-msm+bounces-77763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162FBE8526
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 13:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49FD56E1DF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 11:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BC4343D89;
	Fri, 17 Oct 2025 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAGY2tnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A94343D6D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700482; cv=none; b=NbbYR9cF8tO74tZGe7Oy+aYUUxeaDZBTAdZ5pzl2hHUrEus9AQaHRc7vTdRM3W8kQJWrYwrDEIbW4Zq12DuIgey+3lp3yHPE6D7F4EYzJtCEsa6Ow1XtOkK79QJSc9wtYaecJdhuZ6j2QBl1pGxp6pUk8+EyqZQM9ynUD1ZtquA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700482; c=relaxed/simple;
	bh=kgBl8a0kCckWI8aKDofLzcUZxyOfjZE0zQsu0tHmUBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+NuQcEjhEGr58eaKy+venn1yC5r5hmXb6AbAR2v3vBGlAi+3TwNo0+8eiARlyubYI3KWkuev9J95tmNOdNdzFXWaPiYeGVzImRyHT63eBr47dfiPEhaAZU26KBXOrZKT7EnWB1tGjRg501ZN15nlgz6C3wjq5wVFEoVlNct1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAGY2tnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7quQS006824
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MO5yMJK0yFYcV1Jdm5K+ratgjKv8CSI3SXjH6E3HP98=; b=JAGY2tnwgKBfOduF
	HG6xOc9AC1c51yQJissWfLx5Rc9B0foY9NJKx5JLuP0pB+0/uK+nnsqI50ndwu1L
	0Y1i/exNRdhcEtNPkbIdrel0i/dHgbukJd4IyQOF88MK1xCy3bufF4IUsC7i46Nv
	BJBzah5MXT0NcaKdLR9NEjzGyRD14yAMEnFEdTLSXcVVmkj2VKPGLFrJzl8nU8Dk
	AvYTWKiYQgxjuSV3KgQebgFTLYm6MZ8c7oKocQTj4VmG19sD/xx5RLdmQ/H8yuu9
	Sa2NA3p4/9w8T2DCNuV++DFmpSAoGfOjTr2KA1CzcfORyz1jqynX3PLeeI4rp9du
	sM1ezA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwxby7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:28:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-81a8065daf4so30243166d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 04:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700479; x=1761305279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MO5yMJK0yFYcV1Jdm5K+ratgjKv8CSI3SXjH6E3HP98=;
        b=bNy57gZqowzLPOEnMQMr/t8xwj/4c50lEkerKg4dH3kkZBIXU2FfYuRX16vL8h1naV
         zgQVet6fr4pjLyBGg33tG2b1gIbiWCAiHrUzDZw7pEyyqPGPzyfcKl+Kv4t1eV2+gr+s
         oa4Bj3Q7SSe+LTUAJzeAwdHUmKl7SOgfe7OPmPneeiUfpOnbNKKxTvCMw/JPcCGbwUFu
         34gx7226Sp3vhHCIjNU1q0lCMv1MWX+fapiG++GP0pPjh58mtkA40wrPsc+uxAzNtEvS
         v2BrlcrY59OHuH2LE3n2fRWZ0JtEdhIkCTkDhx63gfGKCppKGF9+Jy2aLoyn9HCt+XaC
         X4IA==
X-Forwarded-Encrypted: i=1; AJvYcCX6E+baHp+FbtORMLz0Rg3a8r8iBRjSEhPzgm/7bbRrJbSHqG8qjLwOK7o75QVlpUQmiP+gurQ6+Z8pROMF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vz75UKxtzlRVDWiiCdNAwPtQ1/t46Y0Pt2RGvuda7mn0bvaU
	0R/JDaOZm1kGprSGyWIPDxCkSsqcr3aANBGy9tXFuCrtVLTVZgurYzfmaAFQywYx/ziaNWyFk4Z
	dAIRaN4HioJtNWGrlPaD4Hon6pfBjxgneeRFn7JPh7GK6yjs4qoxR3YJtEbb09zWVNFnh
X-Gm-Gg: ASbGncuLuZ5WWiTWTlYtTi50Q9/zuOpCOfC3nrbNPXLo/pNATr2btF+6DwrlRaNXrk3
	ROkWD2SMeAbHA/IQcanbd26CMX/DfcNRLj9o88HRj2VhRdowgLlTZEhwBqNvtQvTrIYDLar2dzW
	aPOAGw/d7iisCtGcjvol8qdhyY3MZAFkEutXw8UT1AOdfssZLcszsVrgsxudnq5uoCnQXUnAlkn
	X5VrahvP5RAbIZWS7yWtP9vmHkYb2NCrmy6Z8PUQ8bBEcvpJOW3hjUrmFbDrIAxWItwOSXTwqeE
	zt3ZpvkjBpmTLXATYMlKoOlDASa0PzM3X2ffBaL2jAFk5DFY3fU/VWt94/MPiRmZI9AKCCr+T0s
	bYqwlygQ9EeaSthJiu1626+4TAQ==
X-Received: by 2002:ac8:7f41:0:b0:4d9:5ce:374a with SMTP id d75a77b69052e-4e89d35c6b2mr42058291cf.53.1760700478995;
        Fri, 17 Oct 2025 04:27:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDIffwZXUxQwetzttdf8IHIykBBw7PC3C1BL7U7ffezRNN/D8uA16UnjK/MXp5jsm3ACZpXg==
X-Received: by 2002:ac8:7f41:0:b0:4d9:5ce:374a with SMTP id d75a77b69052e-4e89d35c6b2mr42057911cf.53.1760700478410;
        Fri, 17 Oct 2025 04:27:58 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-426ff65596csm8996956f8f.24.2025.10.17.04.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:27:57 -0700 (PDT)
Message-ID: <695ff482-ad53-45fc-9ab0-ad69d8bc89d5@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 12:27:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1
 soundcards
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
 <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
 <b0d9cec5-1162-476b-8438-8239e1458927@oss.qualcomm.com>
 <CAO9ioeVcqT_Yhvz-RMCucLtcpa4xCLrA+srM8Vy_ZZ-650ZQnw@mail.gmail.com>
 <DDKF9YV37ETZ.3DXIDZA4ZU6I3@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDKF9YV37ETZ.3DXIDZA4ZU6I3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXyA3BN67JC2FM
 2Qa9C9gjGSC7z3W7ILHrfSjLQF492gwWkyy0BQWrNdsoZfqdXkbZM6M9ePG9WFYuCURSwjE+hdZ
 rvotfJmKF+GRi4cslLqYQfFRsVpS9eXIBPgHFkiLLncCqrHH0VaUczgwK6vpcnlY5DqERnVwiaD
 Vbv3QB3YFleH0sjAcGAkrY79D3LfT3RNe64mcgCiFZZ5WXVUQzWmQzV8dCgUfjj2CQRrs+HU8Y9
 hYozrsIwe/QLvgTUvu5RBUSgR+iaj/ytvJeIPCuXIl46eMpi8HeQKpAEakTL8lYmsAHIjHz/ton
 wFp7LeQksY0L07gCLYr00zaS4BYp3rf1iJAuHmDiHSjDYNTKN4Y2mCgAiFpHe3I9o/otdjM7ACU
 voY0YirmHa/9EPK3EhLeIg7e0fuVVg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f22840 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=lrA9asLDxIyQxDedMN0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iIV3haEzOgfYUWHbEL99B49jfwekQrKZ
X-Proofpoint-ORIG-GUID: iIV3haEzOgfYUWHbEL99B49jfwekQrKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On 10/17/25 8:35 AM, Alexey Klimov wrote:
> On Thu Oct 16, 2025 at 8:46 PM BST, Dmitry Baryshkov wrote:
>> On Thu, 16 Oct 2025 at 18:08, Srinivas Kandagatla
>> <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 10/7/25 2:26 AM, Alexey Klimov wrote:
>>>> Add soundcard compatible for QRB2210 (QCM2290) platforms.
>>>> While at this, also add QRB2210 RB1 entry which is set to be
>>>> compatible with QRB2210 soundcard.
>>>>
>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..c29e59d0e8043fe2617b969be216525b493458c4 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> @@ -21,6 +21,10 @@ properties:
>>>>                - lenovo,yoga-c630-sndcard
>>>>                - qcom,db845c-sndcard
>>>>            - const: qcom,sdm845-sndcard
>>>> +      - items:
>>>> +          - enum:
>>>> +              - qcom,qrb2210-rb1-sndcard
>>> I don't think you need rb1 specific compatible here, unless there this
>>> is totally different to what the base compatible can provide.
>>
>> Why do we need to deviate from other platforms which declare
>> board-specific compat too?
> 
> There seems to be now a few incompatible suggestions for rb1 sndcard:
> - make it compatible/fallback to qcom,sm8250-sndcard (1);
> - make it compatible/fallback to qcom,qrb4210-rb2-sndcard (2);
> - add separate compatible/enum for rb1 sndcard as qcom,qrb2210-rb1-sndcard (3);
> - add base compatible as qcom,qrb2210-sndcard and fallback
> rb1 sndcard compatible to it.
> 
> The latter one is ruled out because base compatible should be used and
> it is not going to.
> 
> As far as I can see the last addition went simply with (3).
> Which one finally you all want?

Am fine with either "qcom,sm8250-sndcard" or "qcom,qrb4210-rb1-sndcard"
as long as we reflect that correct driver name in machine driver.

traditionally we have SoC level compatible which works fine for 99% of
the boards for that SoC, expectation was that if there is any deviation
or board specific changes required, this can be accommodate using model
information. am fine with board specific compatible too, however am not
okay with both "qcom,sm8250-sndcard" and "qcom,qrb4210-rb1-sndcard"  or
falling back to another board compatible for various reason one being ucm.

So 1 and 2 re *NOK*

I hope this provides some clarity here.

thanks,
Srini>
> Best regards,
> Alexey
> 


