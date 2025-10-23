Return-Path: <linux-arm-msm+bounces-78508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 862CDC00207
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B1D13A21FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D88D27E;
	Thu, 23 Oct 2025 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CObmossL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604AF226CFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210553; cv=none; b=HucG52ublkSqimNSoJwWxAhHHUV3mCGsNDWDXBRskCFkIblYkdAntfNTfWAUrRxo9w550N8P3qKfeg2wJYcHHmBFqTIuM3tPeXfMyo07trvkoKrXBehV4hzCd51i0j+7n2GkFsus4GRr6PaXqDpWD64D73X72R/7BbBKyF8FQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210553; c=relaxed/simple;
	bh=X4HUs0gSmGTGjJAhjczq+fOWi7ZDdDt7wx2L3+WVzg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZVItync4iVpYbsJlNhXUFByiOa84ByKHL+PAqucY/Hi8RG1ERZrW4HDcqbPo/xLe2t9CNNEm2M12no3bAVpCpnbELKaZg9Zno0u+0R6hQnZi26UGtROscPCJN2dwoh7Jr2kVJeg9gEuNU86nzBXu6rE4GhvzXt638gshc+x3Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CObmossL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6M1Q9025796
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL1FDaV1hb+GknaszdE1bYLZJtOeHi5W6tjFQW86BtE=; b=CObmossLcRRzB2dD
	UTqJEbFn4Bffdyi6PMhujhgnKWGf129SUY4FG011MswWPEEEx0oFuR40Wf15hh9S
	BmY3OM0n5AKbV2NQcObo+7U8eKlwO68tupwdSKI6B9nhCtJWnlxoo5dg+dDYa7S5
	RL9UnVgxjJW/mcgYpzYJcpg8wh4JXFY/Wst1ne3nxOTHGqVmdrLWlmBKCwOTbyfC
	A9L78qsvWkspqfADTkOZIFC8W06B9SHHsM+5Ff8akyTIYNTYQzRr9iSOpfbiCXyq
	SjSDIPtIerrDVZKTYE99bqFmIHFxFpI0QHNUzDPTxyFG7MjWXbCbdnd7EhREUg6f
	fEXH7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfk06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:09:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88fcdbdb598so29779085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210550; x=1761815350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eL1FDaV1hb+GknaszdE1bYLZJtOeHi5W6tjFQW86BtE=;
        b=OBgSiqs6xFbEuRgY5svrK5UN8Q4dibE8vY0YYZZekzUmezv4wbLDTqRC8eGhqxbiSL
         BIDfqOzBuLgcSs4BQBs1jZAc4xZL0Q3utPJPCJ7A2tuDakB8kYI+H5Diedv1A2Kcosr1
         RstyZh7EvbhDEZ+fQ+lfOXAEBPwz13PeXuWGjq+FDhWRf5Nbh149QCxsUhq7ufH/eq3N
         sPpx+MvHzHVNkAIz18qnzLlTYjuq6SysHq5UXrobow9VrhN/7ROFy3utayIbfhlkGrup
         zP9OUHjdQrwHMGn0FgEp61G34Fw/iankvdaLo26ryn+CGQ7KYgvmflFx3wXm7e6O0aDX
         6yAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzkeKlk575Lm/CAd/xApHiCWk4gYyxBR2Aj9gTYkwjDpKqguU6kqqHSPx0Da/2ZdDfSQPaZSIahBCNR7OR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tsK8YfRJj3EsWOI/nOH1yUN+VMu9m37fsdhNI58Q1jX0IQ3F
	GD/JU+Gf0Z1E1Gku53wAxoQhZ0bBu43erIaqn9pJ33sglpCBaatOEt53YtUbmL/nRhcRi7qxKrJ
	nWY/4zwa1ejX6jL6SV1cwPR1OcjPnTA0OjflPW3GrOs1zeNZwGjhX3R35HHp8HcteIbjK
X-Gm-Gg: ASbGncsbWCK7SfWS2KgySIK3A4J62izI4hUMr+7tYq6YJfFhUr3g/rGy1XOL11klLZE
	X+5ZoiuRfv5Npo3/1GoL4hQ3bWvks24aGqOJ8Q7B6CbQoxIRnPob68XAH4myiwXSOc4czs+4cvd
	cE4sXIoBQY5a9jlz8BQICRywqANLurCtQ2QDbKreyDqNQju9BeYCKeQMubPtkS3AKV4j7bGhhjS
	BBwha9tor7HYxXJclF1wJNIBMPUIxBdcAZpboSj8646l/04GOu64mizoyWA15TwRN/IXqNCIlRr
	rileD9yeq8/8S0KpjgwLNRj1Gg43RSUqutnOYikGm3U0IcSlFP6YsDcP9RSAsUvBBe4Ht/XZHS6
	ddvgdANmCc+x0XYmvORN0qoW2Jx+N8eA++Eus6DWQTMPwiyW86PAGWCAW
X-Received: by 2002:a05:6214:c47:b0:87d:cb51:4015 with SMTP id 6a1803df08f44-87de70be665mr82433336d6.1.1761210549962;
        Thu, 23 Oct 2025 02:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXMVFPiut7DKZKJFSlHN3s7xnOIyeF4GLAo3/pwNAvecNJgx4w2pkSuvhqwoLZa5ksRW7vcg==
X-Received: by 2002:a05:6214:c47:b0:87d:cb51:4015 with SMTP id 6a1803df08f44-87de70be665mr82433106d6.1.1761210549402;
        Thu, 23 Oct 2025 02:09:09 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb3738sm1163047a12.3.2025.10.23.02.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:09:08 -0700 (PDT)
Message-ID: <ef247fe6-6d9c-4a74-b3f8-a56857332758@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 11:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
 <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
 <5c0b4712-4a54-4a1a-ad73-dc3bdb21a0ff@oss.qualcomm.com>
 <cb361d77-6845-45c9-b418-67649880495e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cb361d77-6845-45c9-b418-67649880495e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zRHC7dPT0JkUkxq-LDl8vWtCT5Uq00hr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX2eaiGSw7oO7l
 I3PxGP9W6LJXK5b/2ydQaQKcEg1mJkoeoKy0X7u4Sg8OooVebzRXUlwld9otvatH+Tqg5bGUVuX
 Vt2xlvIWyPjmd0Co2dn/09WG4FLNp77KrIvoG62l4eBBZt+wMYLHjSpHeLzLGpSzHSf3i+MNQYW
 DT1bHJnD/7vbMm66fduYidYyPIImQySdiQUzJknT36pbhypMoRsKyiKIDUlx2sHlWSUsffXBut4
 OR4162cb4JIAS3AyR4YuOoBZYVJI6BpRW7KwuLAYc0JKJ1eIlFcqPlngwm/RqDD96eSRPbE8ddz
 rFrlBLsA7qldVVMEUFKxNYhIRSbM/G1fNq3BXPAzH3o9L2My/cfQhdWhQPaPb5EPQ3YOhuMgVEK
 No7i+o6mdRX1zIVufjxYa24t/S9ehg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9f0b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YAA2XIu200uozTIaui8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zRHC7dPT0JkUkxq-LDl8vWtCT5Uq00hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/23/25 10:57 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 10/23/2025 1:47 PM, Konrad Dybcio wrote:
>> On 10/23/25 6:46 AM, Maulik Shah (mkshah) wrote:
>>>
>>>
>>> On 10/23/2025 2:51 AM, Bjorn Andersson wrote:
>>>> On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
>>>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>>
>>>>> All rpmh_*() APIs so far have supported placing votes for various
>>>>> resource settings but the H/W also have option to read resource
>>>>> settings.
>>>>>
>>>>> This change adds a new rpmh_read() API to allow clients
>>>>> to read back resource setting from H/W. This will be useful for
>>>>> clients like regulators, which currently don't have a way to know
>>>>> the settings applied during bootloader stage.
>>>>>
>>>>
>>>> Allow me to express my disappointment over the fact that you sat on this
>>>> for 7 years!
>>>
>>> This was a dead API (even in downstream) with no user since SDM845/ 7 years.
>>> Read support was eventually removed from downstream driver too for the same reason.
>>> There were early discussions to remove read support from RSC H/W, due to lack of users.
>>> Its not realized yet and all SoCs still supports read.
>>
>> Can we read BCM states from HLOS this way too?
> 
> Yes, Any of ARC/BCM/VRM can be read to get HLOS/DRV2 votes.

Wow this is amazing..

Do you have code for this already, or should I hack on it?

Konrad

