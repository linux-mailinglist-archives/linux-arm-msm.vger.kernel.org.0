Return-Path: <linux-arm-msm+bounces-45320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E80A143EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 22:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ED4F16913D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 21:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534681D54E9;
	Thu, 16 Jan 2025 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfFbxePr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4740198A0D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 21:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062445; cv=none; b=jQVyZgxK9UqTm7kyJa2H9TLwAyuN3a3LCbUWXx9ta2Hkqp7ZkiLHXv6wYvyFN4fmaOJiKcjL7dDxYG0Yn44VgOEsAi4Q7sWDBeAXdGDolWJZuCLAB9FPnoGYyzjVGHtnwyl8Pf+pl6RuozPcVBlreW4L1HyGE5GHfpYw+826qBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062445; c=relaxed/simple;
	bh=qK+wncxm31mD/maGitMUBvjxrpy3bHgWE5lfS4yYLPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSqLbmRTRWVP/ef9ZtiZTR0x0UM2zkaNHRCbD6Jv4q5iREjHe2CvOYknN37307e4NyRFSFQuG3dcreuqV0mFsLpEPgh1x4O9y9x8kHOrd0X1InSTjbS9190vucugQat6qeAtaAlDTRPIAdzQjgpQFbSuRKXA4DAa5Ik08m6sJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfFbxePr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEKQj8022271
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 21:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4+iURHMJ/3P1OKcHzNKlW7F2BB92q0ebLi8TSRBwYg=; b=QfFbxePrw4Ly0M4+
	kkor1BtKMiIpRR7fUfT7RsKXa4W8UKG+OAMf5IVO/oCkzvtSSMSnaXO3T6JYGU0a
	8p+MWvDDxW201y/S2nscmUZi5o11sp47ZQi7dqdFepkq+/WL86A8CrTa5HMyOv69
	HydHcuSHgHPMyeayCjhEfTmSoCs8wqZDDraK6qXyWL8E6uiDGUvVnLrLGEqViaKT
	SgB/G5GJ5Ix+8FNBlGJJem/2q5E/GZ0AOsAscUtXD3yyzGsTR0t6u+y7p/WPTByl
	7jQ8E50LnOrRHLfdrPllqb+1sz/zKgpzgsyf3Rk5Zs2vj7gz6nnpUgk8KM80Ickt
	ynBC7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473se10be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 21:20:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a0d7fb9fso3317121cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 13:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737062442; x=1737667242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4+iURHMJ/3P1OKcHzNKlW7F2BB92q0ebLi8TSRBwYg=;
        b=uoCZNlRu9K7W7aZlZCwy+f7iaXlmagOXS2keui6Hj7XJk8knIGYFE/vF/W2a5/tXdN
         6vcV73NgYCcugNzjUq4XZcPP+FcT6gNZu6zDU7BeVqdTZwQCHknn1I7YWqiRTFTTs2gd
         Ha/Ap2bnrCC17RGJdhP4Ohlbzr+TkIQdcbjt28qdzgilkr/ody+JyygUx+FVzItAOUXr
         7STXpURP9ayPzk5Zfa6HxUbMKfrM1wUayo/7k5F6JHCVT66+g7ENh0uYBKJ1oDT/4Bsz
         rYYex+ABJEaWKaINeh1N62xxPRhbzxUvwau6wSkqtuoWA5fzceXNm4GwybFEPQeV7Zl2
         sPfA==
X-Gm-Message-State: AOJu0Yw5aT0Ol7Huut+1S8KRSwfWSlyzEoG3S+fS8/L2/5dH5uvpaWLd
	X+CwF3RnW1PowZgo3Sq6qg2s6Vmm4BtDcjyjakcYiNLjeDr88e+gI/fsWrnBn6ZqLogaBjRLorl
	/9dC1ysK0SAhoOtt1uKZZ5eub45KT42jg9kh4zzb+gjsk1b3Q1uVolAtWIKj9l3QP
X-Gm-Gg: ASbGncuiwawq/a0AqLUhga+St/n/lce6vnkkTE8eYu8VQF037hIp0UzXOhojVD2JSzy
	EImbP9f9o+ymuWuDb8NhYVp8A46g2TG7ZnCG4iYevyTnchH0YicT2oRTAN35eEn1JFy+RRv3Y1a
	XqG5wluuPQONv8nEbHN/bxOisHVR67tq9H9ukJBPgzC6tLE1juhuD72ucASDC3P0v6mzk71pMVu
	TXi+jd1N/oiW7xwqmbFNGebtnrlpT9gaYu8Vm0xAsDf1q/XPuD/ETdXIb1w1dOdM6d7XdO54jU8
	hHdM+059LqRPx264peQzjs0x+M8303fEQzM=
X-Received: by 2002:ac8:5f48:0:b0:458:2619:457e with SMTP id d75a77b69052e-46e12b68001mr1052811cf.10.1737062441557;
        Thu, 16 Jan 2025 13:20:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbidw2dOxBfe5x4dYMaMTXs5soDblBvwSuwcOzlFRsReaxuKsdNKV7dMYo6uwrDlzwvTdB7g==
X-Received: by 2002:ac8:5f48:0:b0:458:2619:457e with SMTP id d75a77b69052e-46e12b68001mr1052671cf.10.1737062441252;
        Thu, 16 Jan 2025 13:20:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c636b4sm53182266b.15.2025.01.16.13.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 13:20:40 -0800 (PST)
Message-ID: <56023e4f-d60b-41c3-a3c9-ba768613e9b2@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 22:20:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
 <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
 <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7Mz0YC5Rs6258HQh5a6Pd1T07ndcXGls
X-Proofpoint-ORIG-GUID: 7Mz0YC5Rs6258HQh5a6Pd1T07ndcXGls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160157

On 13.01.2025 11:28 AM, Akhil P Oommen wrote:
> On 1/10/2025 4:06 PM, Neil Armstrong wrote:
>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>> is done in an hardware controlled loop by the GPU Management Unit (GMU).
>>
>> Since the GMU does a better job at maintaining the GPUs temperature in an
>> acceptable range by taking in account more parameters like the die
>> characteristics or other internal sensors, it makes no sense to try
>> and reproduce a similar set of constraints with the Linux devfreq thermal
>> core.
> 
> Just FYI, this description is incorrect. SM8650's GMU doesn't do any
> sort of thermal management.

What's this for then? Just reacting to thermal pressure?

https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/graphics-kernel/-/commit/e4387d101d14965c8f2c67e10a6a9499c1a88af4

Konrad

