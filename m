Return-Path: <linux-arm-msm+bounces-87647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A48CF7431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 09:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFE4630F4D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 08:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B9F30BF74;
	Tue,  6 Jan 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edG2qjEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkTDVgXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E0230ACF6
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767687260; cv=none; b=sVkmLDbwCFcVNKpQ3YiWCoUsuVnK/RQqeCDeQGAfRH+v3GLxTeNkgV1PjY+3ZCPDlSoCHCI4/bc6D9bOzT/58L9exCX+BBNhXp5SCoAsqvtkxsU95xrNgfMHyegDxLotKdYF4YWBAFyCCEtaQWkM7DwIh1J8FOSuSugaFsSl6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767687260; c=relaxed/simple;
	bh=c21V0ooeMzB9/JTSMKUc1ydUEYh1ZH4WHVCWvHyFvk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azuD01T8Vm+LHvByRvtdsnBpmCGsKqEgL25Fc64mc69wwoetu+XUyigijZgNUhgqkfBP+koX20hQjzfe9ipANjXVHU89t45FUFinzQF9qkeXKp+kA4GL5SZqmBxyWcchyvRxZvkmuSOWOVFfZR+Nt2ypZMhO+Snf4tr4Py4WEKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edG2qjEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkTDVgXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063PxEu2429680
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 08:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c21V0ooeMzB9/JTSMKUc1ydUEYh1ZH4WHVCWvHyFvk8=; b=edG2qjEB4GAtYrS1
	dvlfWLKdaXKUliYMxBWyScbhqlqEQo/ZjROG2O7boGVKduo4j93L2oDqsaqkdEdx
	jPwiHYxuybt5yXCDAd03qdgBvZKo2y9xpI/c4XAfYcpQfjnoiR05QRBB/69N7NVx
	Z8HbWlXK+XinhY4sLrZ2C9X8LyRnDJPQLNTe9x6BdOsmTesCPxl3QdWcwZsVHuDu
	zlUKTlc8FTQCFU0BgF+eOW/ThPXi5BASOjzKwOmibhdz1XrEFydV/lXlGMo2rIGR
	HqPCEgH8S8Pitb6QFllFxhFGJt9gadsAnxhikXFAa7rlJBk1XJFRWPkV40tN1gHF
	d/ocKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7393ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 08:14:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so1571650a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 00:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767687257; x=1768292057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c21V0ooeMzB9/JTSMKUc1ydUEYh1ZH4WHVCWvHyFvk8=;
        b=LkTDVgXtWHZ4TfijyEiqieXq/CHnDupjC6r2Gt+TZy5ZtPmO68Y460Ta+mOpEQl+9e
         EJyT0/eVE8VepsTSQmqeVh7Lg19Z/bdQu+4fVLvxPVylC8eLMdoOJkjwsUBMzsLETnrp
         HGANkxIrv4V18lCrQPYuPNNkyPQq8DWksRwaOS+pvoov+VauJykDDAoOjoGOhcIBecIC
         dYbPt7rXb0CWyCdCI4G18nRB+SfL9iMupnj/+xuPa+eiHX6n+enyUUE18048amznNzin
         Mj5zS30vfSE2X9aLBQzqaNu+98W7HK90ty/jxdgKLh1sqovmIH29Swvm7OBMnpxmR8Ks
         V8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767687257; x=1768292057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c21V0ooeMzB9/JTSMKUc1ydUEYh1ZH4WHVCWvHyFvk8=;
        b=LpBDYdNDfvpvIdnhsSrBrwkgRPoMH8H+AeJ+2rFbacSvebnYd+XhED9qJ34EWf8o+B
         J2AmIc/fUm1O+jxeuP/zfwatKQm/rE76VdGkmu8olEbwx4rCeY4pplWutjGzG2RfDTyv
         Q46vg2EVMUHiF32fnnDqLLW96GQ509JM0iyu5ZDME+nv9oHs3N30Y3fKOO5vAgmxHX9Q
         CJpLh2OJwhJJfP08dUUaWEyfVYaxTV7qU52quMRV1aaBmY81pawlKI4kemNBIsBYTVzU
         73/n3CvIuz/MxjzAbWueg3XSUHq8vhHq3ynLrBhTR0FIcLcYWVG3EuKPPjZm5IDiqUYI
         LPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL7xjJw9slI1hjIQZAh61GALFZ7GZXZJyJXwN3zirKBGftibViivFeYRBLhZ0bHTLNu4IaopGmlHMgWCR3@vger.kernel.org
X-Gm-Message-State: AOJu0YxQiIeHchOzEXfCstvdorF2Rb9kq2iqZwYnXHBZWfQRC7bxdYWH
	aLph36nwg2K5CtGaKy+mkswjv1iJON91ZS1ke74WdoexgIfJ07CFiy6VE3nLMfGSPzQNqM+dBYg
	ldcWKJV2OCvS+r1Dl7f2Cr32ZCa4egnNZ4lySEYgFQgJdOH4VJpDC3diIHTkMx0+ocxBIDray3l
	Rx
X-Gm-Gg: AY/fxX4Aq6bAliJxg2KbD2kST7puSqZLWSZRxj7SQPs+yoXANrJHm1eHRy/mguA+kCc
	+A0RRS8r7kaMsZ6+uYto/V8a5JmCVNQQ/gIrVCZ4S/zi+ekNEK7KQWCBxaCtAU0Wv28V23Bxo5Y
	Lgenf1CbPhg0JMFgGwxWgbN7s+kJP4d8yS7QM1Enw7A4YN63K9MzFTH+SO+M/WpOH/RXcUKeiK4
	Zx4cMy9yWdDf4OgNV8HuAeTTp4tsZr93sgEUqd/X7NomnCWMBE1v++CEFE0MUe1WLHFgcyKKOuT
	DtOHB5Rn9h0zvZP91goPuMu5d7ofHhKk9MHATLi06lUc+PXlfodxLKwQpzbMDTPoxYftc8PVTyD
	r7OMW+/kEVfdoqoGU0wBs6U1LoyhiF5X/+eKGoj/BTrAVH4Oq/s6LdB01QeQVv1/Ch2fL91YdiK
	MUCFiTLA==
X-Received: by 2002:a17:903:950:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-2a3e2d5b815mr25411695ad.14.1767687257319;
        Tue, 06 Jan 2026 00:14:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjbPnrecbBsjAB5zSiCxKYR0UhUQg8isW4VF7Xr/YDPTCD/GkuzDLvuhKj3vU6HCXhwqHGaw==
X-Received: by 2002:a17:903:950:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-2a3e2d5b815mr25411555ad.14.1767687256877;
        Tue, 06 Jan 2026 00:14:16 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e1bsm14347065ad.60.2026.01.06.00.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 00:14:16 -0800 (PST)
Message-ID: <1f856ebc-acbf-44f3-ac16-d21baac99033@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 16:14:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
 <a2b62af6-fe17-4c4b-9dea-4ba9cf312765@kernel.org>
 <j7i2oryel7d5u6gsbb54iaer7amqre2vzwkb6fieybascvonwi@bmt7zmcvg7yi>
 <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
 <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
 <f54dc011-1796-4088-8bfe-be19e8bd9157@kernel.org>
 <bab3794d-d7f8-492a-82a2-6a8a6f80a708@oss.qualcomm.com>
 <6qvzhyjrxctrrdvhktxkusyhdcohr43muung5paan2i35suxwg@kfl5kkmpv4fw>
 <3f3dfd39-2cd1-4b03-8632-2c9d15b0bc2e@oss.qualcomm.com>
 <gizxtjc2hia76qs37vl7atg5ixyk4fpr6qnwqlsajkddhxwb46@nyngnrdo5r57>
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <gizxtjc2hia76qs37vl7atg5ixyk4fpr6qnwqlsajkddhxwb46@nyngnrdo5r57>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cc45a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ysaQQQ1bBglnGum-p6wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NQ3Qxqu_2ThO2_-ihsxULKfsEUV5bFEw
X-Proofpoint-GUID: NQ3Qxqu_2ThO2_-ihsxULKfsEUV5bFEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2OCBTYWx0ZWRfX7PxTEPGuhMgT
 fbGYMRsBUrPen25lK45KhjIYh48mJcHfhod71u+qjQ7kaxBe1HNw/IuqfbveYeEM7IZc5SmQlPk
 4hlnDFefjdRPvI6kZu64EIhx6j0OUyTTyzeqCyeq7seDTIku4cm1Pq4IiQ8PbgMO6ImENiXekdP
 7/v31FpcZkD/cvpUjup1tmyam0DKfizRoJSlp5pQvhtFF01kMAXXko17q1rswYPhSONRvi88v2S
 u6/pTR6WQgE/q057KDbLIaJh5CITmwVg3xmzQKaxbz5jMkWkamCYI0gOFo6lp9Z6R2NHkvtE9mS
 D1uM7V76ed8ZBjnP6DX6UaSsayQpKvHx20kKHc3aApVzF4IJnPoywKyw+i+ZtH/dCdtjnfqWOzq
 B876UA+uQRBOSgndbnOmtMjO9anv+L/xSOH6HIkXqkRHPJjLebLayG+7dZTKxCLXKVeyslfeucK
 /rU5CemxAY99abu8GAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060068



On 1/6/2026 11:26 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 06, 2026 at 11:05:30AM +0800, Tingwei Zhang wrote:
>>
>> On 1/6/2026 9:47 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 06, 2026 at 09:24:38AM +0800, Tingwei Zhang wrote:
>>>> On 1/5/2026 11:09 PM, Krzysztof Kozlowski wrote:
>>>>> On 05/01/2026 06:36, Tingwei Zhang wrote:
>>>>>> On 12/30/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 29/12/2025 21:08, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, Dec 29, 2025 at 09:47:05AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>> On 29/12/2025 08:38, Yijie Yang wrote:
>>>>>>>>>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>>>>>>>>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>>>>>>>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>>>>>>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>> If this was the same SoM, just with different SoC soldered, it would
>>>>> have the same PMICs. Different PMICs means different SoM...
>>>> I agree. It's not same SoM, but they are very similar with same circuit board.
>>>>> Anyway, I shared my opinion and I am not going to spend more time on
>>>>> this. It should not be my task to go through schematics and prove that
>>>>> PMICs differ. Authors should.
>>>> We will make it more clear in the description about PMIC difference.
>>>> Since we have the agreement that Hamoa/Purwa modules are very similar,
>>>> we will use common dtsi in next version. Please let me know if you think
>>>> that's not correct thing to do.
>>> I think, you have been clearly told _not_ _to_. You have agreed that
>>> they are not the same module. So, please stop.
>>>
>> From hardware side, I think we are on same page. Hamoa and Purwa modules
>> are not same SoM, but they are very similar. The only difference is different
>> SoC, PCI, APC supply and one PMIC. The circuit boards are same.
>> We have exactly same case on Hamoa/Purwa CRD which uses a common
>> dtsi.
>> Can we use common dtsi for the hardware boards which are very similar?
>> Is that very strict that the hardware boards have to be exactly same?
> I don't have a very strict opinion about the shared DTSIs. However, I
> really want to point out: you got an review comment that it is
> unacceptable, you never got a comment that it's fine, nevertheless you
> want to ignore that review comment, coming from DT bindings maintainer.
> In 99% of the cases _ignoring_ the comment is a very wrong idea.
>
> From my PoV, asking to "Please let me know if you think that's not
> correct thing to do." after you got all the previous emails is rude.
>
I had understood that boards with very similar designs could utilize common devices
such as the Hamoa/Purwa CRD, and that we had aligned on the similarity between
the Hamoa and Purwa SoM boards. If this assumption is incorrect, please accept
my apologies.



