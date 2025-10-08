Return-Path: <linux-arm-msm+bounces-76366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2898BC44A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 12:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D670401135
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78E02F5A18;
	Wed,  8 Oct 2025 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awYUZIYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5C2F5311
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918851; cv=none; b=T86ME1XosnXOPJjQNfVCkekrkq73TNNwrH1RzNam98vDaszu43uPgKf8+qm5Encsjl84itYwwtP5kagM9EU0ZFgG1D5abHFYK6HbewZ2Q/O5ze7s0CNmeNVliWrpw5UvB/1SU9YdT/HvvofUZM6oAGDqMQyZwN8b9dAth2A+TUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918851; c=relaxed/simple;
	bh=Lr09AlCI9tmALrlNWWYo2diNjyAqc2PL1Wfv06g5EdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpFnIlDCgOmARlCj9+sAcfsu4i6fLRUvxiC91IWbMQHE5bA5dkUm7+kQFVJklCYRCYTpvXjiKt1FeowUwK8p08sCkaZlBUmWCNglKwdJ9VEY/qGVDPwC6wqZQhXvvFqTMRP3mnMeA02gnXFeDj+6SIko72BrerLz8/tucDwKb+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awYUZIYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Scw014237
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 10:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skZej2QK7qLiwq43MFOuoC8Kz7XZV3jwiPvyq5Yz+/c=; b=awYUZIYVTtP/+Wao
	LuedFDi4C6eKkeNOcwsTNqwwe4ePXsEsMNXUTLSkBSvO5m99Gk7XxZun3Oi9k5Fs
	E0JJim/UKCHV5IDbKK7q1CWJnG3a5xMb4BhSigDOR6R65VHaWjanRiXbbcgkRjDR
	ZwhgVmY10fU3JKbV+QQPnKzIK2mmETCrSqu8eHRBpJxF3DJAgzi2ccsl2LrDgo0j
	5kHSXEl1ojq3XiSal91JA2Q0cPHxf4SGOGFgi1qm4ly1ImxaPOFJqKAG2HPANnp6
	7ze41TZqwJ4aHZvRWh2y20wWMkirfAx51DiyftoeMpFfmdgYEfCVhIVAXfdqBkE3
	5YT94A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0ntjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:20:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-883618130f5so33277985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759918847; x=1760523647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skZej2QK7qLiwq43MFOuoC8Kz7XZV3jwiPvyq5Yz+/c=;
        b=skeO2x1wG6JDaewy+ZhF8JUMKvSWFPMY1kOOEdnOi9vJM7LA1RuYXRW4rRiByhTsI/
         C6IcslnUvSBXwiCgGHBPIy6L7OxEasdv1vQi2zexBEA6C2HTuQmPZ545y/KEhBgyjLf7
         7mOPKlnvyVTvhM+43cWJ4U/IrzLGjskJpVekxPlY+5SMPtLty4fUUcgAlkjt24dGTeiK
         +JVs2QFCSM2x9yyIz8X6AF3mtqH0fbfE90puQC7XyOW1pOwn5xKJvKClrw/WK1xCH1Mb
         nfRhtF8PkLE1aNit/v9B8/K9Eg0UrCpnZnAMemnHrAn0CfwDZZhk9pbmHC6xlHUEdHRM
         579A==
X-Forwarded-Encrypted: i=1; AJvYcCVkqGBb3CUVL+WviMdS3TC0VCjCfPmX/RqlFKuA/bMH3t3LmsBUXvmsvStg4XRSxNGuxDFA0gfHC2xWCK2X@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjy9PpJIoiy9hCYABKdUysR6DaKAnCvYB0pqpvc3Z2ReGT5eGT
	8aamAlyapYeLqW91Zr7R5Eu5XOpihLfMjPzqRcElPznnXeO0bkTfTjlwGhqv4/tcSrI3oyPCqUG
	z17rXZuCTFGjN4VeqQhOpPqz7lXEEz6heFooG2hTZnIzP2NxKJHsg5GwBxmEcIBI+alh7UMOOde
	3V
X-Gm-Gg: ASbGncvtn3XQBomIXdLitGuAgwVKig2CkXX4PGzIHJPKOXxuumL7DKpu7hOL698fSJU
	IN9JdyfX0EKdlZ0ZKfVtxQTPW2JRQMiRZmEzQ7l1PVNInX5ov/hVdDnNpno3N61rT+fx0QfWzLd
	bqbQfLS1U6uTZY43ofn7aEs50GKQzeOlQRYs7t4DhrHnuWwXNx9OYAR00wwo/uJbCDvMIUGMGpc
	XWuKtvDmW/VgYOhawaNSSygYzYUXGnpXsnQGOeUYNmZRJ6jzdHKOonnMipvboWFDYERV5tM69pr
	n4wLzcTCW7imqUFTOnwfosX3VenaPMUeYu9y5uhowbyCQnlxXO3QcCu66Ksx+lwkyUM1aq+GVT0
	9ZMr2B5bmPCXV1YW4NuzknYBdRRc=
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id af79cd13be357-883527ca0b4mr298298185a.3.1759918846835;
        Wed, 08 Oct 2025 03:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLHDjHHvjj8j9dLTGHWXGfTR4aJjre+aHMWNbl/tFlpXmEHkL+rMhFOApHFHL+DL/d9ZVLIg==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id af79cd13be357-883527ca0b4mr298295885a.3.1759918846201;
        Wed, 08 Oct 2025 03:20:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f94asm1619475866b.79.2025.10.08.03.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:20:45 -0700 (PDT)
Message-ID: <392d2e9a-dc31-4916-ab8a-680b2ec4dca5@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] arm64: dts: qcom: kaanapali-mtp: Add audio support
 (WSA8845, WCD9395, DMIC)
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
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
 <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPfY-CpE_aKd910PQ2+u9ux2EvuVEt9ArzhdVCJcTQJUQQ@mail.gmail.com>
 <51637d37-aa5e-492a-851c-e5d6bfbe421e@oss.qualcomm.com>
 <43ba93bd-0dba-415b-8a7e-cdc4d954f79d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <43ba93bd-0dba-415b-8a7e-cdc4d954f79d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BMqGzGjMs6NDP7m_DB37PhQc3jJ7udAx
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e63aff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=CoZnzqn1Vmb4SI8PR-kA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BMqGzGjMs6NDP7m_DB37PhQc3jJ7udAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX/o5q+c5M7Eq3
 ch3wu9i8g5gy16JzW9JcPc+x1Km2GXQCtPqMgpe/U8oQK52Njawjk5Hm3CO8sKrQDgwh7UE78n1
 4WkW0K+tgND62aa+VyoocHcvQzuGs0sF6gSaPomwGaQdXok0F0mURR7dGiFsYcuufH9texgD6Zg
 OeDWpD3PbWwFo7hArYC3l/11cYsTgo+mVI7ZfxSANsSp1sLSnxGfbHD2Y7TOaSEFlKZ2QzIuGok
 dof0iiU6tANXY5tOVIzsTuEaqG8bAK0Y55PtPRarAbRzadZN4VJ5y/P8CWOnmhUGHYxKjLQCrMM
 OR7YioRQxp0yvYFl2UfWhAc9jsu1GZpe5juH47PWhgGky2tz5u2Ze88ly7ejQTxuHstxJTbcd9R
 7FtGqM24dsixJdfOn46CicRlw2uqvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 10/6/25 10:48 AM, Krzysztof Kozlowski wrote:
> On 30/09/2025 21:06, Prasad Kumpatla wrote:
>>
>> On 9/25/2025 6:56 PM, Krzysztof Kozlowski wrote:
>>> On Thu, 25 Sept 2025 at 09:18, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>>>
>>>> Add support for audio on the Kaanapali MTP platform by introducing device
>>>> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
>>>> microphone for capture, and sound card routing. The WCD9395 codec is add
>>>> to supply MIC-BIAS, for enabling onboard microphone capture.
>>>>
>>>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
>>>>   1 file changed, 226 insertions(+)
>>>>
>>> Audio is not a separate feature from USB.
>>
>> I didn't understand this, Could you please help me to provide more 
>> context on it?
>> Is this regarding Audio over Type-c?
> 
> USB depends on ADSP, so your split of patches into separate audio commit
> is just incorrect.

No, this is no longer the case on Kaanapali.

PMIC_GLINK is now served by the SoCCP rproc

Konrad

