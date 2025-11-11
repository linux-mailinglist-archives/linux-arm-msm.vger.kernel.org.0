Return-Path: <linux-arm-msm+bounces-81284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D65EC4E497
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86CB33B3DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051413009F1;
	Tue, 11 Nov 2025 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjvjtcYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbU0M9r2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EAA2F5320
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762869669; cv=none; b=d/26OTgSw8yJJlcnWmdNWnfRjsSRElszOlQXipE9AwkOBtoYkJX22NORWVEYcGKVd0LdiPBtnpWLSQX3QFX+pbzTvv/8+Oac2kjZBhRiVexlvSUFDG95NMjSR73iDtIqW3uXxAWHW6E4AMOC5oo13OttYt55PBwx6Uym5DNgwsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762869669; c=relaxed/simple;
	bh=eWet9mQ0n5k4gwfWFBNceG6K2ZYb1Vr/oAdQm2HemF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfDfc3zGp1DQl03KtlVWwkARdasnzyJv6SXvCyQIcO6bQlvcYs6Y5jxOXziFDAAN1vxr5HNDqZ4ROkjD42eAqwa+rnT8thDj4np6gzLOkdLMi0m7S4gIc1VQDRj3IT0Cghv5hqhIg6gI9R4shmL9cMjQ1rVLhuXYvc3i077sTHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjvjtcYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbU0M9r2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGYb71937368
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4IJ5aXLhdUl4dhcBWBh4Ouc2sU9RC8O8eyHfCnQ/uQ=; b=FjvjtcYA6FAobnNn
	H9v9VOYv3uuTMJ1oXWSZLadQWVvp32MdyGDGRKpKK17ipXQ+6X5SLRlCD7+J9aNq
	4xnMdpTwAO+xqPIFPgXAiUK2HeXhFSU7lYofYSJWyhq7WKW3lo2ubUSGNQoZKTm9
	IMMMyhcyf0VkoLnkUQCaUIKahaOeXC2Cc7r3NQPtbKlbDN3jVCMcLiM67ZfHWYiy
	ZgDaSgw6x7yVfKxeBJBP4351KUeAEMDKqxVjRfwSgPX5POkXSDDXYGM5E3uosPqL
	48HFLDZGgpRPgEzmz3SDWNkgxfgzAIawqNWbxRSWabsMO8xvGo+rR98p0gI3wm2J
	rcoGEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abwtj9kvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:01:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so9824297a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762869666; x=1763474466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4IJ5aXLhdUl4dhcBWBh4Ouc2sU9RC8O8eyHfCnQ/uQ=;
        b=YbU0M9r2Ff91igwO9gMk8tmMDtGYcV+IU7AEZi5kSg0olq+L+ndIxk1hgf5eJN6tbn
         DqkMeLG/nUV+PFh6zYd3gyvZQAKfoK1qotpjJo/YR8wGyyF+xdFL5r7aC1TF8FEt8VkH
         5HlpIZWaR4aUzqwiF4UHaikPkueGrYge+ye9t2UOURvK/jyM/HrFZ8W11CQENlk6xn7R
         +A6sDmI6kHpIjowgmWC0Om+eEAXxEEZfqfVCjitNpqkT36C5TFmDBt86dXNc7p9aCqZc
         qQ7oB7cS8pYBioMDGyBte12WPOQt7jBce7+kmmeaflP1hQSpAYCYeN/KKFJC9XTLONAu
         1yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762869666; x=1763474466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4IJ5aXLhdUl4dhcBWBh4Ouc2sU9RC8O8eyHfCnQ/uQ=;
        b=nXx6yRfNpkHzJFGv6HzllSBrKGxUEZzetnvP8fif8iJPVYp/d/eImtuLZfcF53ryDe
         dYVoEirF+ag4MtSl/nDvCYuXuUQiQtfsqdA6pET7eS6zNC2QUPGUIyMXWJBsQtmu6vdE
         W0X18vlE+vlWzHQWMyAv5u34KJckyMAJDonIEz2sWSHWoGhMUAUcO8Ll4v8DlV1t+TRw
         Q51bTD1Smke1s0IOL20OdAW1d4/KTPKqgGeaYOb3Ls8xkiT01Rmq97vzPFp1AISsTp+H
         IB88Z42+/a6ceBuoHtR1Kc9W0t3wv6hhOeHB1JWMKVXq922YfBdzXCBcfufW5HHjQXhe
         E/7g==
X-Forwarded-Encrypted: i=1; AJvYcCXjLN6czdcboIonYhAKCHLvfYpgxIpbrPOqFr3Iy0jyF+oAoJA0pz/kOCzNqS2sDUGTmW9LjeI48HT64Zr2@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0PJXFKFLUZkAnihHqjSupoNzTIen82Fg15TsKlmxxCzcRoaJ
	KWFZtUq4Pmje0ubpVIPaTPsWZXsBbb2WKznzuUZCk7yZ3hm4pkb2oDWVkh05pIJ2pQey+/iJ4X/
	5nAzExtvEz6M0oH+GLYTvIxWVqOtdSlj+tN+qCChglnMIns/KqRxrSypt1r9A5IdzQ164
X-Gm-Gg: ASbGnct8LEavasSuLV29AKskynf611Ve1+c1ZLgrpty6S6T6ubrn438rU5huXGt1NE2
	g7i/dGR8CFk/jyx/rsxvNv0LcMQAwqVuAjsRzPgfXy78IsgLQVU1x8tHSOxskb8+KQcHC7UHxUc
	ztcCgZD9Ha8vCbJOh52R5LngFj80OJDqZhhib7QZrbj0fcm+XK0feBTfqwRNgsAEReuJTPL5yn0
	mgcMe8VPxVkp0bkbpAhzq1SKNpChs/4pwaqG5klxMg3iJ6rcTJIEngdP/O7iRYyYZ8jvgiChYnK
	Vc0H8roW+0z1YSTPzxH7pjhlj0MmURKjJp4hrn6YQX0SHNRnE9eBn+IBo8yAcv5uDSD1/9cL/wF
	2aWGPS4juVWYt7pkmOxp1BgLK/Fq6wFSR26OJSMhE9yeja4Le+Xzv5oYFqfPYw/V67itvg3T6JM
	mZqjM0FDHM65UsS1YpZjgpmw==
X-Received: by 2002:a05:6a20:7353:b0:34e:409e:eea0 with SMTP id adf61e73a8af0-353a0f94ba2mr17486244637.12.1762869665889;
        Tue, 11 Nov 2025 06:01:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxAEro9UYd2K1CoHJYHuggQpNaYpIT0G7fQSsq2+/Z1TJ/KH9I+2Tj6oHE9H5859gHv7QS+Q==
X-Received: by 2002:a05:6a20:7353:b0:34e:409e:eea0 with SMTP id adf61e73a8af0-353a0f94ba2mr17486153637.12.1762869665105;
        Tue, 11 Nov 2025 06:01:05 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8e750c1sm15919726a12.1.2025.11.11.06.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:01:04 -0800 (PST)
Message-ID: <6bebcf6c-9328-4cd6-b77c-a147338d607a@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:30:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <56aqammkwte3tcdzni2unufjp4t4yaqazzdkigrwqsxp3ghcqe@ppe2pjwg3hrl>
 <60583236-692f-4605-9f56-f7dadb46558d@kernel.org>
 <zbwcg5pkdspkcnvaitac6y5iko346qyuzuipqhkoedcaqm2dpa@zmszuwhm5q7z>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <zbwcg5pkdspkcnvaitac6y5iko346qyuzuipqhkoedcaqm2dpa@zmszuwhm5q7z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExMyBTYWx0ZWRfX548KVA91XoeC
 3YkbIOZK5pFq9qhF99wp874UmEtV+4jNzlf8m2elXBs7oIgELxNajyjh4cDIxA0Ba3iRx8lvCW/
 0oIiJPChpnwAhdL5KaEP/NOAMX9y2PIuAFOZPuvdaIaPJgommAoJpWv3ithP/ARsjH1usQR+1b3
 y9jRdraxdctN/2vmMemj8tFMrF0BOqHZHtjHJIYUJFBXz8VOEQ7nQ9Nfmu5wF5PGKH14SLG4ibX
 Y/2uVZuOdeM9KPu4IG5eL4K4LD7NzFu2hkHK0Pccd5QDf+u7AB82MbeqbIbJZWQCZco+VKaROaf
 mMD9lhLTblRG7tdzpUInCrO0qMUEmTCHrqF7LyvhsObqnq0fzw9vhEKL6ITlF+ZouXWFOkszWm8
 0afRgQ1wceJjhdtiUJEbamiHK2KTSw==
X-Proofpoint-GUID: yofJZLfKwSuEiH7kNAf_qwKg-3I-eUmE
X-Proofpoint-ORIG-GUID: yofJZLfKwSuEiH7kNAf_qwKg-3I-eUmE
X-Authority-Analysis: v=2.4 cv=UI3Q3Sfy c=1 sm=1 tr=0 ts=691341a3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=AchhnLIBfk4zbvzGQ6cA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110113


On 11/11/2025 5:52 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 11, 2025 at 11:41:51AM +0100, Krzysztof Kozlowski wrote:
>> On 11/11/2025 11:34, Dmitry Baryshkov wrote:
>>> On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
>>>> On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
>>>>> On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
>>>>>>> +static void qcom_scm_gunyah_wdt_free(void *data)
>>>>>>> +{
>>>>>>> +	struct platform_device *gunyah_wdt_dev = data;
>>>>>>> +
>>>>>>> +	platform_device_unregister(gunyah_wdt_dev);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
>>>>>>> +{
>>>>>>> +	struct platform_device *gunyah_wdt_dev;
>>>>>>> +	struct device_node *np;
>>>>>>> +	bool of_wdt_available;
>>>>>>> +	int i;
>>>>>>> +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
>>>>>> static const?
>>>>>>
>>>>>>> +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
>>>>>>> +	static const char * const of_wdt_compatible[] = {
>>>>>>> +		"qcom,kpss-wdt",
>>>>>>> +		"arm,sbsa-gwdt",
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	/* Bail out if we are not running under Gunyah */
>>>>>>> +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
>>>>>>> +		return;
>>>>>> This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
>>>>>>
>>>>> Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
>>>>>
>>>> Dmitry / Bjorn,
>>>>
>>>> We are debating on this internally on how to resolve this dependency
>>>>
>>>> - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
>>>>    QCOM_SCM compilation than what it is today.
>>>>
>>>> - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver
>>>>
>>>> - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
>>>>    for any of the functions defined in drivers/firmware/smccc/smccc.c
>>>>
>>>> We are trending towards the first option above. Please let us know if
>>>> you think otherwise.
>>> The same as before: 'select HAVE_ARM_SMCCC_DISCOVERY'.
>> HAVE_ARM_SMCCC_DISCOVERY has a dependency which is not always selected
>> (e.g. ARM32), thus selecting it might lead to warnings of unmet
>> dependencies.
> Then `if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY))` might be a good
> option here (and depend on GICv3 selecting it).


Thanks a lot Dmitry, wemade the change below and compile tested on 
various architectures (ARM64, ARM32, x86, PowerPC, RISC-V and MIPS) and 
it was success.

We will include it in our next patch version, if there are no further 
concerns.

}; /* Bail out if we are not running under Gunyah */ - if 
(!arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) + if 
(!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) || + 
!arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) return; /*

Thanks,

Hrishabh


