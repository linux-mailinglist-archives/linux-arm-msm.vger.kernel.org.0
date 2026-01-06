Return-Path: <linux-arm-msm+bounces-87755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5DCFAC2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D91E30205A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 19:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B2C2FF147;
	Tue,  6 Jan 2026 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgHlRvwi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmR+fs5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347DB2FE581
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728594; cv=none; b=fU0kvImKvhbv9mD1FYHR1WqC2I4Zvrsvv9fy4lo2cI+MIz2UoT56G6Y0Z6Pdjod7THE/iAdJpZ6a8x6krxavjm+iBDs59yDMmrjkorV33PtXN7ngD1EI4Q+EFDpg5pYl97BTosNWZz+og6WsaZTTjsTmlsfeelPYy4EKiSudaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728594; c=relaxed/simple;
	bh=XfX+b6dLCq2w3dZ+DVIExRn/Lhy7ELFfs4bDhfz5P58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uChNe9NC47+QZmt+sd8lmRDBRF7wqkJcrqHzrwIy+0utGGSCxbxReWR10lfHCo6tL4rixDrj4RbPduPm/h/WKomrak9kY8QABw4uYT7A3f+r6aORQSDhjDuU0w3nF17qzFYgs9guh3E6e4FphflP9CxIk1FiXbaojwi4qHPDsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgHlRvwi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmR+fs5X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606IZQNR805180
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 19:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZDTYeigK/sfx0x25w6qJIS+ZT6X8Spw4/Jf9zAiFq4=; b=UgHlRvwiBVU1UiER
	MjTonP4NnLN281cVbJMepEz6xjVuQZi/mvBTl1Snz1NHRbsL6R6pvi5SaQ2iPH4M
	OtxXVE5S/PtYxPn231jPz8E8HEd8mQaImdqJ+4E7NJwASXwTy1kQ5AfCXXVwyKU4
	YPsWlFOQXajzB0PVL1SRMm6WAGdQMLgxGKRFnTy7kHfmndl3QctN9UT6daMK5K4E
	lw0MTjC6rI/A7t3tJaH1PixgmIJsjtideRJ3ifvLWYTrjWyDF662JT0shsuTrZIm
	X/wCz0U22GRoU65BZdy764oVTggZSsiDaM9jy3JhCEU4aN3RorvyHl8LLC+Yh87y
	26zCew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh7t9g6c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 19:43:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so1426253a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767728589; x=1768333389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZDTYeigK/sfx0x25w6qJIS+ZT6X8Spw4/Jf9zAiFq4=;
        b=GmR+fs5XrokSfIOVQZud8YGXh6TweJblk9L+MYm3T6MevxBd2/dd9aegxmHVa55rnN
         fuzZBzn9E3r+Fw0sIaBpHAEWixxKSTR6WEp2w5bEUr47IJiAwejIL/nv4Cy628oiAibh
         zFaXTABhXrIBnbCYSmlISOOJFKduy+VVQemw/8ebpC/2bAsJ5GHzmwtV84/19fWQ9div
         65PFKJ2w70sY6GukDAKLYioy/8SnCF9GInTv0xwcdpXjtq1Q43wOSfCQ53ypoDWECgMP
         ojKGNAlh4RDFxFm6xsbX4Rrn3UlCS7+yvhUc4vLy9iYchz90pf/be/Kpo4Fmo1ssCvgF
         F7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728589; x=1768333389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZDTYeigK/sfx0x25w6qJIS+ZT6X8Spw4/Jf9zAiFq4=;
        b=fSNsdoiCqt5jBWIZYORedAHPnoi5gKs4WZ11BLZ5NUtSBYVcII31lARDGL8WuEGC4H
         M0eQSY5BVacMi1xXBAC5w5y8JltUuLW0OhwKP1vhji0pBHJbHoOfWnJcW53acpDho56z
         l78yga3aNuIyFcYYfbauH8qkdzzNhOz9ERQuaO3DGa0rDiKwt7Cr4y+xe8ZpCWdNs3Ei
         yxcSwz5ZhQA8aqvrD9aKNpMMTuIvqvgp3kq20o6CI2uYrxqIm6OZ2v9pt/uRDXosZBGR
         YdwI/qq1Sf1XFTgNI1VxY/cRUB6VP6ITHtjNP/mEOkBdw2qVA6dRBXyXGqi/70/yDti1
         DiuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrg92fi0Breei5fRFO4jHDlhE1tBrSCAbkDcQR65nZl4WuE7DzKlD1u63wj/Ah9stixQxMagB5b1+ohge3@vger.kernel.org
X-Gm-Message-State: AOJu0YzyoE2l8uRspuJsIA7HqxEBwn00T1XWA7euQ/BHn2sdBv3Cgfte
	HnpJ50gujNdGjEjyG3t2KX01/W2r6YltrXOi2/4J6BXJG68/CLRIgQ8UuHwNyfyAxpSYV6HCiL1
	snVCbfhZKSpLjOYdQu/s3nWliw0nrJFNNGgIv7QvF65eAE1/6pG4WgYF/rte3ILq1ilHh
X-Gm-Gg: AY/fxX73BpZI3kLSH8xVNjmx7k6kyoXAVRgGD07aQoC/8fQLAw93BbJcVJPMUNsM/QX
	zwkVjIH00FUPZfXRH15+gx/JVOiKrFIJvJeuqoIIkURnAImzIwI4spEIZOoZ2Ck28MSg/R1kZKp
	C1c5GiB1BH6nJKUouSbbVoAhj7SS1AwYA42H9l9xZp24X0+++lO/YKQSuxTIrg5AvbZmBW7EzdE
	3FzwFGF5jHt/JQyQvf178ewQgM7FJQTaA6SCkTz2/7tIuNelSM9c0eycI45+zXTgZFNRrni81xe
	pp9CVm4Ee4wC+3Bqw3saCpX6kkSamMNQzDUZIhU5KvJ28mrnfCCfqRSPjsnvEzo1tizZc1GljNK
	7maVIkbrdwe53OgKoiQgd6NN7BLRGq6fkSZjefjWWB1S1Wet2jkQnsq1J7TgHnrUVmw==
X-Received: by 2002:a17:90b:4acb:b0:349:7f0a:381b with SMTP id 98e67ed59e1d1-34f68b4c603mr228425a91.8.1767728589191;
        Tue, 06 Jan 2026 11:43:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR7diURQX5/IXX/QMdmcVn16iPBI2ko8itYSY30OsuI6Gy/ChZZ4MFegFlC2SaEMUsbJ5HFg==
X-Received: by 2002:a17:90b:4acb:b0:349:7f0a:381b with SMTP id 98e67ed59e1d1-34f68b4c603mr228406a91.8.1767728588676;
        Tue, 06 Jan 2026 11:43:08 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f601351bcsm1113023a91.5.2026.01.06.11.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 11:43:08 -0800 (PST)
Message-ID: <a76bb340-cf78-4e5f-afd2-b6d43f3119d1@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:43:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
 <20251127-steadfast-red-koel-8c9bc8@kuoka>
 <6aa8ffc4-2fe5-44ad-8ac8-581e0697360f@oss.qualcomm.com>
 <a228d38d-9fb9-4e61-9a02-e70593c69dac@kernel.org>
 <355c3ae0-9603-4750-b83d-64447b6581ce@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <355c3ae0-9603-4750-b83d-64447b6581ce@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bahQib0EWZCvkIhxsXGd10BQ_iiuBK-F
X-Authority-Analysis: v=2.4 cv=QfRrf8bv c=1 sm=1 tr=0 ts=695d65ce cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=vtVd1KKryTdkyhPdPdsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE3MCBTYWx0ZWRfX5u/WyoZsains
 APWQ2nQJT2raE0u+NGCoqpQtf+wkJUD/6syyK7B8pBi67S4ldR623LFQ+3Ge8g36ex0i25eJlMz
 bHYq61aug7lVvk4WGmEDlFxp5R5mZ3qhv09ueNVVQbFZ/dcAEtktFDAL1swfupd0cxzhElskmcW
 zMV4HmfvlfqyuccbH86j8xPefXx7zVtDJjRY04IR1RfrBFQZj1MF68Hj2UW4It7bnVgzIMxttft
 n1pkpmhqTqmJVUrDqtoyhd2txP5rlCpBfHGBXncHRiF/SpYAVmSu6V6E425plRnvCUayIWQUjdW
 5a5/HmHB50A0Q6GiOgWuTqqom4N3Hzn5KaDERpqF7ja5plcRxifjUbAwA8h5y/WLSdJXru8iCac
 By6dgqhlvMJDPoovNxEie8L6UydVvpwBPYk56KTL0lECu/vWrUr+lgqCWnEjzfntra82HWqfEdJ
 dG7AxhAysztS0al284w==
X-Proofpoint-ORIG-GUID: bahQib0EWZCvkIhxsXGd10BQ_iiuBK-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060170


On 1/6/2026 11:20 AM, Krzysztof Kozlowski wrote:
> On 06/01/2026 20:18, Krzysztof Kozlowski wrote:
>> On 06/01/2026 19:40, Vijay Kumar Tumati wrote:
>>> On 11/27/2025 12:12 AM, Krzysztof Kozlowski wrote:
>>>> On Wed, Nov 26, 2025 at 01:38:40AM -0800, Hangxiang Ma wrote:
> Look here^
>
>>>>> +		};
>>>>> +
>>>>> +		cci0: cci@ac7b000 {
>>>> Looks completely mis-ordered/sorted. What are the nodes above and below?
>>> Hi Krzysztof, sorry, not sure how you mean exactly. The ones above are
>>> the pinctrl nodes. Each CCI has two masters using two GPIOs each, one
>> Why would pinctrl nodes matter anyhow? Please read how DTS syntax works.
>>
>>> for clk and one for data. The ones below are the actual CCI HW nodes
>>> that make use of the pinctrls. I believe this is inline with previous
>>> generations. Have I missed something? Thanks.
>> I wrote what is wrong. Is this maintaining proper sorting? Did you read
>> DTS coding style?
>>
>
> Heh, you received my review 1 day after your posting.
>
> You replied to my review 5-6 weeks after, yet you still expect me to
> understand the context and provide clarifications.
>
> There is simpler way: NAK.
>
> You will not get your patches merged with such latency and such replies
> not even trying to address the problem or learn about it.
Agreed. Apologies for the delay. It was partly caused by the dependency 
that these patches have on Kaanapali patches and partly by vacations 
during Christmas. We will explore and address your concerns reg CCI 
nodes and push the next revision ASAP. Thanks for your understanding, 
Krzysztof.
>
> Best regards,
> Krzysztof

