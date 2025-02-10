Return-Path: <linux-arm-msm+bounces-47433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1D6A2F171
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C43A1885BA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 15:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5062B236447;
	Mon, 10 Feb 2025 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVU6vey2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA722258C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201046; cv=none; b=hSTDQ5m0c3jqvqDxllZIQtCpZs/rM5tOEF2VZMDlHqaS9M7tlLp8PmPR0ZLiyFpBgg7gpenMKmKFhBzSPkSuBMY0Mb8UaLGMUsYYampCdjihMDixxVJujG2OtwDDO565/3zD/3JZDvP73ItS+AHtoGWhcVOpkhUlWDMdRpgcRgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201046; c=relaxed/simple;
	bh=i6Ee1ySBnMQnQ1leoAF4yPYS9Gao1pD480H6Qy5oYho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlzfAl3Vn9gkiLnzF3QOTdw1qyXwxqpcFKeGUmrgoGROvYmKUGZ58ZNSH8kcejmSzWghAOU7t36PiboJKtJ7llXm6Y2jAtIYYOed6t7T2Y1D4+hAKrogkSgENfVurRoB4SjKadnhFZn6gwpKpJlvKwH65f/OYG9j3H8f3Wa4kUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVU6vey2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9Vtb3008337
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 15:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWXJOIJtM8FQ3Dbeoev9P44UaLn9dvzZC/R+g/hayx4=; b=kVU6vey2DMWWUSMW
	7M7go10t3SbN73f+qWrn7bV39d423Rq/KU3GNdRbCwen/bn6N8MIbVo6SP5pTZ/r
	gCX/KU7dE3sFsfBuZsue3A2ATP9RF3zDgjDC7Kgt8kuLeXPjiBr/Je3C6S2LDRCu
	+6iS8RU1EkhCjA6ZlSIDMJrD0fK/bM/f8TlmR8wCbwuCSsEPN7lc/uU9gG0ij4eJ
	0qHy0Jvz56rnylGmMzCoIAboo35Tks4OyIM5nwGyZh6QmuvmK7b+fUDM6y/BpaQZ
	FbkoedZhjFEuQW1E5ZQzqNO5s4o6kDPkdw1Uvnrn9HvFkIZjCmlZRLzPIUzf+LWH
	AUCgKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh0vas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 15:24:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4717d747eb8so2798771cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201041; x=1739805841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWXJOIJtM8FQ3Dbeoev9P44UaLn9dvzZC/R+g/hayx4=;
        b=Jxdb+2SxxpWw+KLJZaFHNY9B17xMpubnyV+w4nBE84oGJz2UzWBh89Iobhmdm4MkNJ
         c2pVhO90Pa1GxsyslVN3HTw9nCEJ/6nj4JH31FeuBt0GGz5/kpK3z2yV1BN8W0SMWADo
         QFkhUGesKG+9B84I4JhiS5zBGNB9CpaCH5pndDyXeNA7gZtSQL9iqYE0GJzSlR8jEkIg
         r6Yx3woDu9zvdkKwUpXoC7j11xpOggm4JDgIGstBRojjroiJvCdu0jNTxm8kiSvj4poD
         37mjQIdv/A91my4fqqZHoTSeool/HXg7LAIqmPPqykBRM/gI1wFyNsbQjTu252CAqynz
         fGyQ==
X-Gm-Message-State: AOJu0Yzhm8EGcU3k+5/mHojSyshkaPjrnyFQZqhFAdjibfjOYxl3+oHg
	hVmIGn5GW4XAguHubJrL4QfiWzYfWfPMqeDGSjCB+XarZk0W7YO0TEDzaYcdWkpTthvQ0Vbolvo
	3yJw8hJQNQIO2K9X2lJMXCWYGMtcfzEH0YANm4g+BMcuIZ+u6Q5kvIRWISOdCkeVg
X-Gm-Gg: ASbGnctVNrZnWv6HsWDyumKwbb24GkkRRtCyPKqV8cqT8nJNBf0gNtLcBzNBu3r/e+T
	E84lXOHDg8fjuHcIAfmJru6stjWCdoRJOE1Iu/bO73/b8FY/ftE03BDxPvgL5PsDWQLBtYzoL9T
	3NPT/cD99vZ0H2aXk//tEB3vZki3s8pUamJOefrPjvfacfhdcZOarNE4g0ZeNi1NPcqPv8SUyTz
	dLggrqJ/wsxADSIQ7gcr4/OAKuNC02u2pk8u7QLD/Ssty/1pdzyPNXyUvkpBRDqDYl6WA17rFdU
	yII+a88IFJRlGkd0EdgwLajVUEumIIMFJXKgYk5f3Zazny/pLQ9j11EoQFQ=
X-Received: by 2002:a05:622a:2610:b0:471:8f79:c64 with SMTP id d75a77b69052e-4718f790f80mr30565821cf.7.1739201041177;
        Mon, 10 Feb 2025 07:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7XhFVAkkuwaP/spxQbPJQxfsD13ry6mQley7HwTujBCXn6LBOHMTzGaIM1ip5eFRuptxJow==
X-Received: by 2002:a05:622a:2610:b0:471:8f79:c64 with SMTP id d75a77b69052e-4718f790f80mr30565661cf.7.1739201040745;
        Mon, 10 Feb 2025 07:24:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d45572efsm52481166b.5.2025.02.10.07.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:24:00 -0800 (PST)
Message-ID: <bbbd36a1-d67c-404c-b749-eefcf493ed7f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 16:23:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
 <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
 <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cxNmjhTQN3hhL-fBn9rGbXSOK1mj4cdH
X-Proofpoint-GUID: cxNmjhTQN3hhL-fBn9rGbXSOK1mj4cdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=759 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100127

On 9.02.2025 3:44 PM, Neil Armstrong wrote:
> On 07/02/2025 21:30, Konrad Dybcio wrote:
>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
>>> interrupt partition maps and use the 4th interrupt cell to pass the
>>> partition phandle for each ARM PMU node.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>>> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>>>               #size-cells = <2>;
>>>               ranges;
>>>   +            ppi-partitions {
>>> +                ppi_cluster0: interrupt-partition-0 {
>>> +                    affinity = <&cpu0 &cpu1>;
>>> +                };
>>> +
>>> +                ppi_cluster1: interrupt-partition-1 {
>>> +                    affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
>>> +                };
>>> +
>>> +                ppi_cluster2: interrupt-partition-2 {
>>> +                    affinity = <&cpu7>;
>>> +                };
>>
>> I'm not sure this is accurate.
>>
>> I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer
> 
> Core 7 is a Cortex-X4, and has a dedicated PMU node, look at the cpu compatibles.

Look at what these compatibles do in code. Nothing special for the X.

Konrad

