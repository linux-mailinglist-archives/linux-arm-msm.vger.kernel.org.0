Return-Path: <linux-arm-msm+bounces-85694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A71EFCCC00E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3576302CF7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDA433F8A8;
	Thu, 18 Dec 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNebZFqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsGxBJk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521633F382
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064462; cv=none; b=Ni8jTqGXzjbJvVKWfTrWcdgaCGFba0dKIHQVctCYH/dX8hl5BETaICsHXNry5bIEE13Ej9/M6dKF4ffrm7yPsR58GuEVU6OcevaFdLpj7kYW2lraTjP7wWUv9Wux1uAO+q3x6e2A18vwknPd76wXDgOPAyTiZQ4yZT5/BPoom+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064462; c=relaxed/simple;
	bh=/lRnz8+u+j+rBYfHNu1KVlPrB2Z2ceq3jn5n4Rgnv3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBzZSYwB63Yb11qNztF0g7G9z9+f6jSTgnv4YJ3XkTapPx+4KziLA927Hq5MA/ONbyOzX63syDHTrYlldscCfBG0P/Y3aIg8mgxvudXJ4o/FcjUMXPtHaCxCcp3cmcNID2VwNYiND1VFs5YCO3HVadhcHToQHeIimqheWlruHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNebZFqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsGxBJk2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI967RD4147974
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2VgE7DkNfWinDjeUMXmmkRgDppNoAsJS/kjybLUmDk=; b=fNebZFqb3qBu7dtE
	CEwLSJNqZznSPXn0vfqRA7Gs+JWiVTznVCpD3Jieob7vTR7wtoS2yQZmQZZQ5JWn
	h/pwLtLW2MnO9Ym2XWGk0KtXqnHm8LspLWeZGb7t+zCcN6M7Rg8Z1Yqh8M2cgAec
	yiJKKCufb4sIiALajN8nzvFztN9lpOH4yJhYMIBEnZ29tTwtlMcc09fWRESuS2x0
	F8lasQUBpfx5A5la2Nat4g79k1tepvvYsh0dDQdgLQRtlePCGHVCzDucu+aevrgZ
	FHZagSoS7Ev9xN7JNTW9ajCdr5GApSBPeZRCMw91MEiXRTIatqI3ZR+sC0bB5XAg
	utwVRw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7b9rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:27:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so3209451cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766064459; x=1766669259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2VgE7DkNfWinDjeUMXmmkRgDppNoAsJS/kjybLUmDk=;
        b=ZsGxBJk28tyX47ORoghNxSawkhL6ExSG92oTL76pPeauMCK0er1RwAM+wXl6BnRoca
         kRfQBJHQPRugI7gYAOzDm4dorwGmr3m3G9VsvbRlYDuAVWAvcA/N4s3KKobsPr8OZmjB
         gdy/Xyp1CFdcoJ4qdKCfk5UkVpJvs2mbCEmcyjF/T86ycPzd68dH8h9ZSxO1n4U+cwRt
         o/UiKKMqmYvwTLlBo00WrptFoI/FuEM0L8ANpWCI5hJX9q+Mowph4TqwSHQ77OrFoP07
         UunVEUCI26WIwu7Xu/oB4Zd8tV+yln73J3UeMlaHtEZgiC1D9GP3hagiD6JsD/CG4BAm
         lquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064459; x=1766669259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2VgE7DkNfWinDjeUMXmmkRgDppNoAsJS/kjybLUmDk=;
        b=iXdvJKWL8uEdH9yelhpLuVd9qRz9geB1J1pQPbnPow4exihM1n6cMnvOCKTMk3QSHw
         ScbS+8Z23tsShmhOo9ZbSagGJTiHnopCf9Uf6t68YSjgSVcsYqrAXzySIlZ+lcSXCjjR
         8TISBX9yOQ8nvgYhIYdm6DseVsNCIedJ5LIWq5+CctK/8+8NIYg7jQOm723TnFRKUizy
         5xROnhl0zkXmlg6jEsqoj6g0PWDuCI8quTxYI8GLmv/bAtfTBH2n0oMO3euiCRohiXsW
         dsGiF7bZfGboJd4++EC9WYEpiHA8c1DwG2hM7HVcFkH50wKIVlAAJaKxDU7THg7DlWUo
         Xffw==
X-Gm-Message-State: AOJu0YxBy50Tm+i8tyb/1HckomXaj4Sh/30PZWD/YbQ56NFsyMOOR5Vu
	S4/HQ6VAO7p4et7Ue+EVwHvuN1aNs2qSvhtdKk9bh2u8p1vGO1hw1n39NPDkjGgitFrG5BPjz8v
	FK2roKuOn67m6qlbFLqDFAXMYtGje4YsGdlV+z8sN0ca8+oC8AOhwby4KyfnTSH5Lmcbh
X-Gm-Gg: AY/fxX5ZKS1XUtrTIGO6jj1vJcHa3UXGoGr9vRLqON2uJSTWaZoyGqh1dMpFdrnALV5
	1fvBgW7quNIUgM49kAw5wcONtJXsoNRegbuJ/QjMbNH0PTcmpJBx4wUwMB5+IBV6+pAFFUSe5p1
	NKMHnfAvU9JyJw89c4no0FceSmsu86raDPxhDkGCVBvTsP6g4dKxawhX1BA4Xk8MRru/OeGG3aZ
	/sXZ47AbUXTYqCiGX7JQyqr8szIlgioi3FLAURMDDS9dCtXR7dmWaDdCM5Z5ZB9eDDBgkML7wMH
	En+3H7EratPc34ucZuGBSxobhu5t5zsIurgnXzI9m0gr9E2NNOvbGzqkDNyDq+qhCksWGNfL6zU
	TaxcSZT/BH8DZ9SWgnmT87lN4fjQ9HwBLMdT99Tt+B+mQxrfivBbC+sImMgLb76mLhw==
X-Received: by 2002:a05:622a:590:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f36108cf01mr20140261cf.2.1766064459209;
        Thu, 18 Dec 2025 05:27:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4gtdmb9Sxx7cRjVZudUJ33+JiUORZDis5z0fWPdz1thnpNoxOCKTymn8JNQmvw4u/c2ogrw==
X-Received: by 2002:a05:622a:590:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f36108cf01mr20139981cf.2.1766064458633;
        Thu, 18 Dec 2025 05:27:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b802346446asm229074466b.44.2025.12.18.05.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 05:27:38 -0800 (PST)
Message-ID: <eaa41986-eaec-4953-8103-e8f83d90b1ed@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:27:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom_smd: change MP5496 supply names
To: Gabor Juhos <j4g8y7@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216-qcom_smd-mp5496-supply-fix-v1-1-f9b5e70536de@gmail.com>
 <680d3b17-7983-4522-89b9-13ad67f4bfe4@oss.qualcomm.com>
 <fef5ab5e-8b41-4a50-87d7-cb5e4169ff4e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fef5ab5e-8b41-4a50-87d7-cb5e4169ff4e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eMJpH9OBWCc1j4RKaSsXjOGPjlgXCnzy
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=6944014c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=g8XaxAed5rD453rOH4kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: eMJpH9OBWCc1j4RKaSsXjOGPjlgXCnzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMCBTYWx0ZWRfX1JfMxpvVYsfv
 DXmW9ijAl2JKRvJZfXT2T7qmEkf/eR9iHun6+elqQv/TbSs5nCFBuV84j7g5bsEb9X4jRdbB/IK
 FJpL0hGdJNa8hOdAMstuGR50oCzhAFU2McsQBd8wN3cWkIMalyYoWGaj5ZkDGJyZMoitXderxyA
 X1mNd3FLJ1Ea9f8oaXMDubl1tFA4Fwg38HzQNZg6owX08h7zrj43ikGlNMYjVL2P+kO/nYjwYjJ
 g5Z57YYSRCeKK9s93Gl8YBiCMDHu7/e/uVRzJyOHok1iVmEKQ1LbX4ndyeKNCyVBTPcQVUSDZ4J
 8mW3AxPePzuwOEtYdI5Drvt6bzGixKUZRy1xfa6sr0cGA/COxUCppOq0d1ZWiD65oljBIa2RRGQ
 VunrdzdvmL0bWMQuiggJU/NT/96ALw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180110

On 12/17/25 9:32 PM, Gabor Juhos wrote:
> Hi Konrad,
> 
> 2025. 12. 17. 11:30 keltezéssel, Konrad Dybcio írta:
>> On 12/16/25 7:38 PM, Gabor Juhos wrote:
>>> In case of the MP5496 regulators, the driver uses the same name both for
>>> the regulator and for its supply. Due to this, in some cases the supply
>>> gets resolved to the regulator itself, and the regulator core code throwns
>>> an error message.
>>>
>>> For example, booting the kernel with the 'ipq9574-rdp433' device tree,
>>> results in the following message in the log:
>>>
>>>   [    1.710392] qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators: Supply for s1 (s1) resolved to itself
>>>
>>> Additionally, the driver uses different supply names for the 's2' and for
>>> the 'l2' regulators which is incorrect. Here is the supply map based on the
>>> datasheet of the MP5496:
>>>
>>>   VIN1 -> Buck1
>>>   VIN2 -> Buck2, LDO2, LDO3
>>>   VIN3 -> Buck3
>>>   VIN4 -> Buck4
>>>   VIN5 -> LDO4, LDO5
>>
>> One thing this reveals is that there's an LDO3 and an LDO4 which
>> we don't describe today.. 
> 
> The same is true for Buck3 and Buck4 too.
> 
>> are they managed as power-domains, or are there other other reasons?
> 
> Unfortunately, I don't know the exact reason.

OK, so the bucks are all managed by RPM as power domains indeed

L[2345] are all defined

*but*

I don't quite know how this is all mapped - it may be that LDO2 is mapped
as "l1", but I'm really not sure

Konrad

> 
> I have no detailed hardware information about the reference boards, but it seems
> that it depends on what is supported by the actual RPM firmware on the board.
> 
> For example, currently I have this RPM version on my IPQ9574 based board:
> 
>   # cat /sys/kernel/debug/qcom_socinfo/rpm/name
>   03:RPM.BF.2.4.1-00116
>   # cat /sys/kernel/debug/qcom_socinfo/rpm/oem
>   CRM
>   # cat /sys/kernel/debug/qcom_socinfo/rpm/variant
>   CAAAANAAR
> 
> This version does not even support LDO5. At least, trying to use that results in
> the following error:
> 
>   [    2.120281] l5: Bringing 0uV into 1800000-1800000uV
>   [    2.127721] l5: failed to enable: -ENXIO
> 
> In this special case, the -ENXIO error code comes from qcom_smd_rpm_callback()
> and it means that the resource does not exists.
> 
> So my guess is that the undescribed regulators are simply not used on the boards
> supported currently.
> 
> Regards,
> Gabor

