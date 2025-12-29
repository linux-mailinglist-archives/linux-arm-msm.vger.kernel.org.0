Return-Path: <linux-arm-msm+bounces-86810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7F0CE6286
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 08:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3BDD3000937
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D67C243954;
	Mon, 29 Dec 2025 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esAGvfo3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApwzxeOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFC9266B46
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766993907; cv=none; b=AYOrsK2OHqC8iDh6KGzowE1L/HPjJeDtVzq2jjW3pDRSqcu1W8zFXglUj3tWbWwudmbSDhDlSM2NsjBV26iA93mTMQWx9C8GPjNCunixb5UNA7G1MPKRjU+UO4KmtfdqH5n9I6jqLUZufBVOMCQ4fY3Rc7OlbinivSFhvlU6zn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766993907; c=relaxed/simple;
	bh=A6ejRK49SuhMuZCa+BwdQ3kNeu1BX78ilfSAhlAE7Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/pWHSMETwYrYzoLXpTdHU+0J8YcNXtPiQrd5M68oiyUadkAZCgmxdqDeljCmstgvr8jQ/127V493QZA8+vBJ2ew9eUg/09OnxC2Uf0iWLb3ac9/TE2ppSLzc7eRC1N29eXl5Vi93qvSci+pNE766ZAdhJ0w8yLeaaqQb0COask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esAGvfo3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApwzxeOV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMlWsF3215628
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 07:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeqJ85GXspwcXvnTLhkXFl4jua0st89l6HElMd/mcbA=; b=esAGvfo3iVVM4fO+
	+4huBTzjtMAMs/QUpETM0W16gs5zHM2cwYzCQ+Ia+6lJgr6r/7a+T7/S9oVYo0iE
	dC8DwVSb+u6k8aP2CTB+XEjzSrXhX0kYIjx5UQMQNhT4R0SDGateoogCIa0xh/2f
	ZccrTGkPfDbtOHrU1E7SsD1gve5ASC+DBNf/shuNdnsHEU1ig3k1j/bvnNUYxAOK
	mkNDdm0hjskG/c7eesnYrt4+hBjb3EIcuh1LufimP13HV4Wd1yNDVKNZW1f/wm65
	WNg39bCvtAgu2oyqhLYWtJUgrs8M0oAhE5M8NMIHkUcBQfqkeHdAmBjVXnlUVaBQ
	mMYlFg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6bmqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 07:38:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso186805885ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 23:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766993904; x=1767598704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeqJ85GXspwcXvnTLhkXFl4jua0st89l6HElMd/mcbA=;
        b=ApwzxeOVrUGgPsgTq6fwLKD3gL9UQUk9VY9JR8p2OLnP177Bq0cCcWRfA2DiBY0YWT
         lDYsCO9zeG4GYz7agWWh4m67mUfQxY72xF8956tdd/Jcb5HnB4m8sLL/VASduTKP4OFb
         xihEr2sA60S+cHgRLQKN1WxV7BfX5DJGFE8XAZa7Dw5P3pC14dIrOXViEWidrwCcStmS
         SdVm0WMJjnGundhscYREKFd/D8Ko5b3Q+ZCaH2gFdEtkPB99gJy2t2jZnt3Hqg8j6sJJ
         pg/zjwg0o5ZxRQrtf2tnCZCMQHaxTuHNPaJdNarmj7MdgsE5pvb/VNrMy1oo9ia/IZ62
         IV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766993904; x=1767598704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeqJ85GXspwcXvnTLhkXFl4jua0st89l6HElMd/mcbA=;
        b=hMzLjVDrP/y2OUBqTZ9tYAMDcObaTUnou9Uo6eoyBzZwx5ttN2azUNGw6ACBpVb1yX
         zpurL0qnZLn3MH3CL+WKUm+A3dWTgOXnlMR88RoKtGzJh9goU8AmeNjsAPtmT57/JVq/
         f5ZMdVsIGwXXMXIklGq2No7t1yzLIGhgD4alBEqJ6LGji8NnbsMPzh9sq0JgiJNwlGaN
         /1Ztah5C7mu1czhTXJXBlrw67DHw2T57IQLcm5llhuhBCtFb5uqPk34RAbPEm5zD7IP6
         a6kFQqdBvx8Us9biOf99pZCmkYVuziQxK3yBrACjp5n8WDAGffAeaaGSIUzc9bJgHMLL
         bP3g==
X-Forwarded-Encrypted: i=1; AJvYcCWVNariE6mPEH8nSxrq0kfViMlvvr+2GaflmPQ49sPrWmVvwFZzb0SKKfbLvH/VTMQPFA0/G8b2lWyvGSOk@vger.kernel.org
X-Gm-Message-State: AOJu0YzvwQXdMbjWyPMZNMvdBjoD1FCZ9G5cOPq7erfuoeBCq7cd1KeL
	8i8QVhl143rK88QMnOTy3LSwIsnEI57qMByfFHL5O49oPWrkOk/0xUKrv7pBKbbbEAdpOeZBCDn
	Jo95kCKyRvFzxNz3q+cWanDUHK9QvUk8HSjJqoQLOXy1ynLoLYKesoTRUe9Og93/2r5Xl
X-Gm-Gg: AY/fxX4sYP29iZSp8ZsmQwxY1d0EsZ/eDRwTCTSUESGEe9edyeLYsWZFrOsM7YGIMfU
	NDtCKqYNK7sxAT4FJK7/R73pgCIWzES1VbxF3NIs0W7ORjIS/PUpOoDhivEZ33oTRFJJC7CxLKZ
	sCx+VE9GXIMs31k2q9sU/T+bH7z/UuKla8Ze/dcyMvOlFN5nfaGNjueTpnRVe5se57Tci/+tCWc
	oE9kk53IKovbzDehJ/ts6kaAJqyHHxu5vPyBH9dbWSf2dm7OL6rWexENn43djg1rvCcyJmDBsuh
	UysMwmCwYsJxzHoTwj+ybcejfjJIQsi2L+dXId+eF9oeXtPHP0RDvYovWv3AD0WZMfIXVWWOTRB
	QGvHEl59kVHfMpx56rubypLXMQSVkFoNkKgjrc+ho5N+p3JKXQLyI1tkWiDmlWvAStQ==
X-Received: by 2002:a17:903:ac4:b0:2a0:d5bf:b27c with SMTP id d9443c01a7336-2a2f2a4f768mr260346705ad.45.1766993903671;
        Sun, 28 Dec 2025 23:38:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIkbp/IyCi5N96ovsXaSD8oVoJm3V6p//w+/eGQXqn4O+KWJZzHzirEXCYZKkXI01vBhSIGw==
X-Received: by 2002:a17:903:ac4:b0:2a0:d5bf:b27c with SMTP id d9443c01a7336-2a2f2a4f768mr260346585ad.45.1766993903176;
        Sun, 28 Dec 2025 23:38:23 -0800 (PST)
Received: from [10.133.33.85] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec6bsm260648065ad.87.2025.12.28.23.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 23:38:22 -0800 (PST)
Message-ID: <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 15:38:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
 <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
 <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
 <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
 <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=69522ff0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0VSGOVfmacAHMTgZEJEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: nFEPzXCnnNBLu3vNBkwAQzdyYD0kr3Yc
X-Proofpoint-GUID: nFEPzXCnnNBLu3vNBkwAQzdyYD0kr3Yc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA2OCBTYWx0ZWRfX4M5zluOwwZ1w
 u8AP4q3x608QB7CELldmAkesTuRcKRBaUTRaJdTlZQi6OjH1VADDd4HuCJZTQfXdO4vyVA9Axfu
 mOKqwjbgzRckdo9NVUinKLXe58HeXASfg0OJzkpNfOWEW8S95UcsKskJJSqETOI8GDUxbX5K0gj
 Tj1ruVtCqpPYs+LSkc3VfQFg8FxX1maQKXF1nkDUJ7J47zInUmff4ZnivTpZ0jKZX8MDUswUwQa
 7OehRh5nA0UTa2khwgpi6JCpC5vOohO01AYov1FqL3T0RcM5BEu2WZd0XrpApG8ceQ64/vvnbRM
 0dYwwbj7vsbPsH4Z6FxHd5BaIkwvz74mQTPvlOIOpZzfhsUzYGtOFCVX2UE4UnMNnb0huCb7KtE
 pwWymSR7eVoXSiM6sprXf+EwXVpS+qbBo3VI1lkc2d1zp6dOqcoyV0OYOHTPTnl/Ho1OZ4CIqhb
 fMcs+IPapi0gpsD5vIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290068



On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>
>>
>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>
>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>
>>>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>>>> the common components into separate files for better maintainability.
>>>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>>>> similar to you, but actually common parts.
>>>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>>>> has Hamoa on it.
>>>> I do not speak about boards. Read carefully feedback and respond to the
>>>> actual feedback, not some other arguments.
>>>>
>>>> NAK
>>> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
>> Krzysztof,
>> Please let me know your opinion on this. This could be a common case for
>> Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
> 
> It's not the same PCB.  You did not really respond to my first message,
> so I responded to you - I do not speak about boards. Then again you did
> not respond to it and brought some irrelevant arguments.
> 
>> would reduce maintenance effort.
> 
> Does not matter, I do not question this. Why are you responding to some
> questions which were never asked?
> 
> DTSI represents actual shared physical aspect and you cannot share SoM
> physically. It's not the same PCB, because you do not have a socket on
> the SoM.

x1e80100-crd and x1p42100-crd are different boards, yet they share the 
same x1-crd.dtsi. Why can’t we apply the same approach here?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


