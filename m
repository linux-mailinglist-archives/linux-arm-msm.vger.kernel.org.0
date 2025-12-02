Return-Path: <linux-arm-msm+bounces-84079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 040F2C9B973
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 14:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B21653A4973
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 13:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C57314B8B;
	Tue,  2 Dec 2025 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh2B1dnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="edaX3CSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56F3148D5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682087; cv=none; b=owXRmv/dMs4VrWx9lUTkawE9tfRwN90MQhpr9Q+sVXRmZWUEu9+Hc8aHeS3BAwizz+AHNUWpEUrEsDS5Z810/OCma/Ly5puu0tMEijTjYcbaJNgTBZEW6FrI68NYtJVIOLUSrhmqJMbhJ/AwyOE5DoPRWRp8LDVbnoDZw1L/MZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682087; c=relaxed/simple;
	bh=omEADPEFpCtodFUgCY7F/Xae9OmSA4gE2tWXlmUU05E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuXXbCS8JdjLZXTn8BpK0B/AtDSUhU9rwfhFbr0rIA9wbVNM+4fiQRYg0BhtE8QUjNInAhyWkcMk2LobSNM0HYC9K2iRpN5bfqn9WaBkrxCaY1BlB0WHv4mPv6d6CenILtoexHqcIp+Ea//FTaXW1acnOE6nxTsDklxhGM7YQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh2B1dnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edaX3CSg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B29ZCqQ1358399
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 13:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGSZe87CZjxr7Wk/kqndn3Caz/wNBKP+z4zDP6I+8Jg=; b=Uh2B1dnlxaBY9yux
	5+X68KQrLjS/X35pJJMt19asVdm4bvm1I7xG91QmYyTzuqe9KaFZpcMcA9r8fLfm
	hSKZWHLwVjx+7bVsUYuIm4by0PXSClfqXM9wr1rsMP8c8jmV87AfEWTOsiFlPWg8
	tqF5EcotpU4Kkyr5CCDfbt00krB2542m+ccxd65r0jstIlp4kNLIPj9dgIJ08NSo
	30+Bfa2THF5jsS92wLUmYe+v38GeVd6L7fsHTFr+m64vEHYA+j2BNM/Uj8pV5K+Y
	ql/F8/1rOMlrvfY2nbN3OXZzQlT2N6roPxeM/VK16xm32k8tmYSNq2CreeUSkWbs
	FuRYsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asp63j230-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 13:28:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so183463885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 05:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764682084; x=1765286884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGSZe87CZjxr7Wk/kqndn3Caz/wNBKP+z4zDP6I+8Jg=;
        b=edaX3CSgRvvL7x1QiUnh7I58GH0Zi91PqOdiuvQSCZuQopkxjbpwphKOfvqxfBwUP7
         J6/+NpANZDbAyDf4qMwDbt1teg+AlVZ9yW0FihC7wpwHIz7Ejnkev87SAJjRZDSLwtGp
         PGW63GWQgNLw1wxZt6GQass31VwmaOVZETS7tkMWtxFpzC1Deae9wDlUWYW13W1FmIk4
         Rwk7l1GeMReKGVgV5Mu1hDaCY/qtDPla95DUwUD86U7RccmoHkjtSh2O86ay/C0AxnxD
         OpHaMoMuNo1i3ICAYsjhGSYBseo9TEuU3/YsEanb1QijciG4/26YDVn3Wj1Y0AivMWsE
         NFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764682084; x=1765286884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGSZe87CZjxr7Wk/kqndn3Caz/wNBKP+z4zDP6I+8Jg=;
        b=J2ukBrQyO4AN2CUjrP9DZL0x4lJ5XMRnq1PeytwaCQsja7ssNtYk8OvoNIBqe1vQjg
         TOiFUX4Pide70t4AAS/xJlpBy8BdkU/kOZykuVMvGdyKdJlZ2sH/LdOgVDJNAv7hVlxl
         AEtpBvtHSjj0bMQeIbqeAR6jy1xN5m8ZxAnlCB5NsZgo7I/tGg3MhO1TOH3A6LnUqxS3
         3ZGCXnXDvRiYVhm4aatU5mHkiWWM47DfIUukeSBfppuZiFad4Ge3e0kU30ZHbkZYzhtI
         QiZ5r0NDwiM4MkCF+ww1G0LUH5E29VbrtFfO4cbN83d4ZasEPnPS4wu4TnC+gTg1+kci
         no7g==
X-Forwarded-Encrypted: i=1; AJvYcCUUbudOaYwkSyAGKC7e0ZeGp+qvut0R8gYU37ve2mErVNQmhyOOBMLb+lqGBZPt7mxcmZe/aWyJj7LpVtGF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Zehk3ruNQbY4mUKmCrC2qyZJQOfS4lxgp3Y4t+5LTNXcYD1j
	MuUMmYhNo4fZqzRuLi7Butdwl8pKjZJyQTcLVBJkMSFwVNYqhvWS3/As++g9Sm1O7cuwVLB+Xnj
	b1SnLonWjxd2+2Mt4Jwqew2VDvFUT3K3Dh8GRbocNZ1KpDedNv65+NilcVGSCADLtxrri
X-Gm-Gg: ASbGncs1jex8ai3pifXL+zC83S1EvZ+IWZFLAzj4t2kzbFxp7t6Q5AYut3KFfcQH3WV
	SnxiTuA/cV8ITJPH4zWp/8wD1J219e0r0+ekcmX+63SMkEgbZo3IHNsG5pXwEJBhj9/Ccv8zLiZ
	1m4eoY8wuqBUfnXnZ9NgdD8EYDttWdA91sEEJXDW8cR2E61lRM5+cxJqp4iAz9Sv1hArUKZMyTf
	PNjohTd85yRfxZ8mzBrnVw2lITFemb1Fhxad7FIVQMzjuCnCkkiMiu8lkMNjH4nckvrddmkZGiV
	4q4x2xw0IXg9TbiRBVyFZNQeWlPsBUHLvwAUk1nbYVDGTwHNZh7xKRqsbI35gGzRodQYedODFxp
	2tSaYaByQBBeMFUG6SEf3LSvQtQa5jFLA+oxnuV++TIfwqgwaYHVaPFRDOL2PpJpHNQ==
X-Received: by 2002:a05:620a:4490:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b341bafcb7mr4289437885a.2.1764682083987;
        Tue, 02 Dec 2025 05:28:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDne9RM5gYuYyIL53Is5J79nlq/wsUZ8mDjrDMvIP+gfH9ZVz1YXpUMUnVdDE7teba51LEBw==
X-Received: by 2002:a05:620a:4490:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b341bafcb7mr4289433685a.2.1764682083415;
        Tue, 02 Dec 2025 05:28:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a7afb4sm1500312866b.70.2025.12.02.05.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:28:02 -0800 (PST)
Message-ID: <bb6f83cc-4f6a-44f8-9997-fb91e7c2b4cb@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:27:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/5] Define VDD_MXC for SC8280XP
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <176418784438.1591314.8587929353938909456.b4-ty@kernel.org>
 <20251201201440.GA4041208-robh@kernel.org>
 <CAPDyKFoGQJA5UY-96HvfoA7WMb5wYFXFFfFREpMmK29GE7-Nag@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPDyKFoGQJA5UY-96HvfoA7WMb5wYFXFFfFREpMmK29GE7-Nag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9lnIg68lcbcKhaCh3yjyU_BDfekNIYgw
X-Proofpoint-ORIG-GUID: 9lnIg68lcbcKhaCh3yjyU_BDfekNIYgw
X-Authority-Analysis: v=2.4 cv=XM49iAhE c=1 sm=1 tr=0 ts=692ee965 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Dp_8vvBim0L4lL-PpiYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEwOCBTYWx0ZWRfX5MryaNMaO6il
 lmyjKUHiLzFK830Tuh8K8aoQT816/L3wQnTHJuXBvjjFrqRDprQiR9kNJJ3M9GRRb/ub78UpTAU
 lUbcpjrFJkVUd3u9uSzrWYaU8ABnmdzYe0mng6jyhMyZjvmj7Tr48U0lvVY+ugKE+ddEB3Y7dQp
 FutD4uArxQ4nefFRRS0xh5AVIDp0C+hOwwwyNOqIqp/lLInAnRgnp5W5IoQqjvbG146ARFWzcR6
 8lv9YFw6L5uJ6t7GzGT6H10i5GjEaTS5P1RHMdq5uadqCtbm4v5wiPmG6NLUrh9+AdwqkdHBr4M
 riyJ1bI807sLI/32eT8SaYWl/eJF4He2EEI5U2yhw9bRR+JWDnZO76QHbU48RT4P9DZHRVoFRvZ
 7wXu2eAIVfCWH2RmxzmAM37hLiJ+6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020108

On 12/2/25 10:19 AM, Ulf Hansson wrote:
> On Mon, 1 Dec 2025 at 21:14, Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Nov 26, 2025 at 02:10:41PM -0600, Bjorn Andersson wrote:
>>>
>>> On Tue, 04 Nov 2025 20:31:05 +0100, Konrad Dybcio wrote:
>>>> This has somehow been omitted, leading to potentially stale votes.
>>>> On the flip side, the domain will now be powered off, which will
>>>> uncover any omissions we've made in the DTs so far.
>>>>
>>>> Reasonably tested on an x13s without pd_ignore_unused (camera still
>>>> works).
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [2/5] dt-bindings: remoteproc: qcom,sc8280xp-pas: Fix CDSP power desc
>>>       commit: ca079ec3ebed19a12c1bf080496dacbc6fdfbb39
>>
>> This has was picked up, but the .dts change was not, so there's a bunch
>> of new warnings. What's the plan? I know it's separate trees. Can you
>> please take binding and .dts changes like these together if there aren't
>> driver changes?
> 
> I was planning to pick up the driver (pmdomain) and dt doc changes, as
> usual. Although, I was waiting for the discussion to reach consensus
> around dts patch (patch5), maybe it did?
> 
> Björn, perhaps easier if you pick the series via your qc-soc tree and
> send them as fixes? If so, feel free to add my ack on patch4 (the
> pmdomain patch).

FWIW the part where the CDSP power-domain list changes still applies,
even though I was wrong about the CAMCC requiring that too..

I can resend if needed

Konrad

