Return-Path: <linux-arm-msm+bounces-106338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJyCBsZt/GkQQAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:47:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9234E6FC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8A5300D94F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27863E867F;
	Thu,  7 May 2026 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCalwYxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUFDKVVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2F562809
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150851; cv=none; b=Mwk6pFwx7lt8GWRvCS4nIlnLOd2flfwVC6v2TsSNDQjE54Hkj3GMjd0eCNmM0E2/h+Hh6ZEeKfGIlRo0Z+zfYuoofGBe3JZuHevtidDsukfpRXpOmOEbF3/DizAtEU/NUYY6lYFKrqIeHJM7gk9y16+ThPJeTiEZmd38FFoc55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150851; c=relaxed/simple;
	bh=UEwxbaJ0zSifgO5b7IyAjoQTTJ2yzB7dL0KnR+F5muE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBitH4R6/zVxZKKHK/xv4jPGNzzUMezGG/Weh5dBlEx3e9gpKyGMjN2PPWpuXhgkCZoROCsy4uOum5xcNx34Bdj8J/fe1NQ867E+j2qrV8jtcVBx2dqSTyWp+Psy6ZWXHc7Fj0viMULfmlqC6IH27kBsOS1vgpJp5E+BWTfVxxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCalwYxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUFDKVVX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AcNfF879618
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 10:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeymGbIOXptDj2kQO0H5D+kU5N1M07bvil6DNVwrBzQ=; b=oCalwYxG6Bo1tnqk
	Bs7GSL+a0H9tZ9jBiEZUc/3N/jqXOhm3uqdDnUdujHYg1UGxaAEkLAOqs2lUUKk9
	4ePpCg5T1El8KUoTE53NRqq3ecsWHFR7h4M44ZKQUkV4AzNZMLzwGVkS3tmV/Xi6
	rH/5MmguzaO4jufNunsqM4UboAtSjd7yr1tC9r9+6RxJ2elQbjTkdBjF0v0eX4iv
	ihyzVAEiznoxT+6gA1mOLSvPuZWo6EOfKuLLT7l7UbpgnIehlaCzt40hJFO4nGYN
	UOvA/qo+mySEy5+it74x9YGPbakas0hBxnf//g9H5Jl7HOubolppcCc9PpgpZ5UF
	Judzug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq1eac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 10:47:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so1156031cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778150849; x=1778755649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QeymGbIOXptDj2kQO0H5D+kU5N1M07bvil6DNVwrBzQ=;
        b=HUFDKVVX3ra6VWE/iYFlKy+OnxWTyEFv2GGxrwSDRqi4unHraBuDBkmojOSqPXsaJN
         j5EEKIO3vpMqrOibOkh7EuZeBcAb+B9oOm0mLNXOLIIxunvQ42KwX8Tdcolm90I+nfUE
         K95Mq3JBKksQJlaqyrutQCyjyhJsRLWzzqMd8cAYGw2UA2L6/WTB0SAebbfim3pDDDUN
         Bb/UVyZFRdePzN8tpyfEP1nFOyO6VuLABt30HHAxjzM+GVjbVsstua9CJJMKgJpg4i4E
         ARxg3Y/Dqrlu4Lql96YsfPVOlEFjFOuuGX+SHDW1wbEbDmUcyfoaVi70jIO5sv1mKjQD
         +QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150849; x=1778755649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeymGbIOXptDj2kQO0H5D+kU5N1M07bvil6DNVwrBzQ=;
        b=k9XOKKqkGDMI0uN+60GKbjFIdm9UOjAKHMejuoJGUqpx1VlXQQPjBQElY4sH0R70sf
         Zb0Pl0EqriWwHwf90keIIHr80AB2Pp6ucwuCGVq8ufNM5QVe8IEbXrjNhLcLip+G/Frr
         ZS+cd37YzbFTONX8V+wsVC/BQEOt+PhXGPSXwrfmm3s0d6URFIyPUmmXBs7gYo0Mw9z7
         fBIkRhK2bVWDfEBHi9pmJIrqxJJH6Dv/5V8AWdIFxxRypUrLqBCrU02hTZ3zF9bYzeoc
         vu9x8j+fE/2uBWs3hdzVZqHVuGTCZ5Hj0ULJIVBiGqJcJKtpUjgXSuWGUGBDWZy75x37
         qq1g==
X-Forwarded-Encrypted: i=1; AFNElJ+B6HwbUWAABKr5fueKGTPwebNogYEjtmQJ1KIE9caDx/8X5iI9V27fLS29VYPncIculp28SfWrNt2QM/6L@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLYFMe1WbOqC4JeuzZU38QuWAQfuTQ9Ekg0WJB0QJors3jiLn
	yccMzUI0Ac2XUxgo/E+g3iwYFjSA9qMay4ftBGRGmR3xhv9A5mJZuy7UT2+ProalqfiTxef73Wr
	6UnrbYUjwC8JPAf+Dc6hBd7NNgQZLaMBwCouMrYx1q0JXPuNxEltr40jVvvdzWBTCg8aM
X-Gm-Gg: AeBDievS2Xt9K/oafqVNrQnOyGbDZU1vBFChjEzdXe4E6dHwkDcC4OGkFvx4JcidMEA
	SFx6dQaQualUxIEbYOmVdn6aMzqdf20Q8a5OQzZhDdw0okWDrGvOtUomzEdIoM5Fa8Lup5z2J8I
	StPxtGpwgm1I3kZvuchrPPThiY/om9WNb0qOyrzJPwsiZF6PQhMTRYPQsrBp65f9wMmWThOGCpL
	ey0f48DA6T6yl5XNPHu6iCM8njOu6LdPxK4SGJVZnr6tN41BfbUAIWIinFFP9kQ0y0b3ZKU+apT
	iLF02BjCQfyrSup45gULRfPBsuKjZjCYuAKVBaeTS/CGXm2bIuBMKpewa3ngyBQSuzTo2eYcjxT
	mo/KWhImOVmZ5a/wXRmuleVOeu5+zSz9HIgWxnNkUEna9Eu2MZ8+q0mE4ZZbQ2NkN3Jsh4iqvXQ
	uK42cwS9um9SBdeA==
X-Received: by 2002:ac8:5d53:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51462619094mr74850941cf.2.1778150848702;
        Thu, 07 May 2026 03:47:28 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51462619094mr74850601cf.2.1778150848104;
        Thu, 07 May 2026 03:47:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67d0a616294sm1920493a12.25.2026.05.07.03.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:47:27 -0700 (PDT)
Message-ID: <0e0b9933-f753-4a79-b4ed-dc992733a387@oss.qualcomm.com>
Date: Thu, 7 May 2026 12:47:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
 <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
 <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
 <486d6b30-8762-4f14-aa19-7c5497cba00f@oss.qualcomm.com>
 <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc6dc1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JAKgS-5HGXHXDUih-usA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: GgcbDM70hG76sIjnWUlJlsaKFO8RKtGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwNyBTYWx0ZWRfX76i+HC3mn0Lv
 Y4sqoLbaon2K/lj0LdVZErHMjaFFkjRV2nHpVaArcYt7e9ad8EgtLnIwFZU1xuBBpb4P7UfyoA4
 G7iXMgu7JZhiCArrEfbo2Sv7m5Nm3njhO4ZFvxmBDeXbpS9oc9NznJR5+97hFWPzuEV8OIbh8eo
 Bax/XuWoQSlUfLIfhF/uuxzaO1h0g5ICKV7tYMTPYWUcECUyJiGAcWNSCp9C2Ai2WUAUL7jzK8t
 MSjhujsovkzjbvc+A6FlXqYtb9q185yGBGGRrhXMEq1z/qnslavD7MJCJ7guzktsz9DunsspK3b
 lelVlTbQAqpoepKxpByf3Nnl7pjf7KPmSG/Nj1Z7vlQmC+rH+dIEHo6vp9Z8zBXfn60e4Ln8pKX
 7prA5zzGhRLeON2wBPEB6LexGGVPeEXE653gitRJvAh/GVHOqe/WFFTJw3shQSK1sP7ZtUvHASl
 rurduCWrKYIqOJNXwJg==
X-Proofpoint-GUID: GgcbDM70hG76sIjnWUlJlsaKFO8RKtGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070107
X-Rspamd-Queue-Id: 6F9234E6FC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106338-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 2:15 PM, Krzysztof Kozlowski wrote:
> On 06/05/2026 12:47, Konrad Dybcio wrote:
>> On 5/6/26 11:56 AM, Krzysztof Kozlowski wrote:
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        reg:
>>>>>> +          items:
>>>>>> +            - description: LLCC0 base register region
>>>>>> +            - description: LLCC2 base register region
>>>>>
>>>>> LLCC1?
>>>>
>>>> Unfortunately not
>>>
>>> Then let's just skip the names, because it will cause unnecessary
>>> confusion when name is llcc1 (since it is the NEXT entry) but it points
>>> to block called LLCC2 in the manual.
>>
>> I don't think skipping the names is a good idea, especially since if
>> we keep them, we could teach the driver what channel the region actually
>> corresponds to
> 
> You still can do it, because indices are fixed. Names are only helper
> and makes that easier.
> 
> The problem looks to me purely doc-related, because this is logically
> second channel, so LLCC1, just like qcom,sc7280-llcc or
> qcom,sdm670-llcc. Does naming it as third channel (LLCC2) is relevant
> for programming interface? Imagine driver taking LLCCx and using the 'x'
> as offset?
> 
> I tried to find something in HPG but no luck.

On recent platforms, channels 0/2 and 1/3 are paired, perhaps that's
where it comes from

Konrad

