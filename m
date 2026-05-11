Return-Path: <linux-arm-msm+bounces-106914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCGMMGnJAWoRjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:19:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BF950D86D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACB803040011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED993806D3;
	Mon, 11 May 2026 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcAaV6ju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3pNYyIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB437BE7F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501634; cv=none; b=k895TCKwRKO5DKOCX9dpj9Q9eN981HN4aNGqOMXafJ3QLH5qwWabyuwPZSuZo6GpYOCvoWLu5IKXZzyQU92CGBp0FNLNp9ZKvGtYPHEFNLZI/LgMqCtihVNHJZlHAYW9LW/zNTIKAs3mKaeMo0nQzcvHOdsVpia5LPuDZ0Nj7bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501634; c=relaxed/simple;
	bh=8fqo9qHfK/dEgTotXTuK3of6kfoYb5MbOk81UGuKZuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiH07sH+vCPsJl107bLuwDDLeziNS/y3tX7Y35PgPR1+w8ChnYofv8FPBInTe40/k8yRhS5M3TblbLFaB5xee1BbXCBse1Ln5Ivo+lR1y2Gs39fQgF/APvadwXTkeKIloQMGtMOX5SsIOpZzHJe93SdIxMPeV/EGviyRmAUqnSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcAaV6ju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3pNYyIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4HHq108023
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbyuFd3QVsgjYT9UiU61WRQarqplB3d8903mQnfn4s8=; b=OcAaV6juC49sWjng
	91BprsOUVo1QyE85snh+gAfNAWQwepWgLNEmVSYloxL22Orjt2rJX+z+qxVVfuf0
	YG38S3CP6qvxUkaSMHuIAV0XibE+kSEp5hdMy3/viWkK7W9Rdss/fUAtXFDKebJc
	+e5fF/y1EBAyDJh7Jtb3iRVOlCMN3/V92OBb8aH1v0bHpmqkqZbudkZBG5PojduX
	SBJ6CIHdbySHTqiwyayy1km2NR1MlhtRPXV1KcMgznhoU65ZINdP8aqquULxcgdc
	01/o6RORfLYMbUyvqLCgDqbK/hWa8yMIvGUlitdSsO0f7gI1bc5oJy5w7ewoUO4W
	Hdj48g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esyr12b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:13:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-631cad875f3so43735137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778501632; x=1779106432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbyuFd3QVsgjYT9UiU61WRQarqplB3d8903mQnfn4s8=;
        b=b3pNYyIzF3BjlDSiD8Bbj3Qjguk2una0hPh6uCYjH3jMnYzYB2c4V2H8vIZiMRrfG3
         +0pubbNTMhgXY6jUy9l3VV7stZ8mD8KEpRahWQAlumgNw79uzUIbm3C1l8qyE5sFbzw3
         ok48gx2R1u0PY1B2YwBZqkLY0+WgSDH9gga8lWQrkY5yADc9azwLn0QMbciGcjds5osB
         rxlTkMT+imcvFN8sG56hd8z7DB0n6/LI69xDScxfAz9p0Dcma+kLLf/lAcJHfEuWRU3X
         DYqxCOUEIwJJeymNC9Eq8hr6SwHSS8+SR/lUlfzExu8CHmMgV8L8Qr31pksAvCnegKD2
         VM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778501632; x=1779106432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbyuFd3QVsgjYT9UiU61WRQarqplB3d8903mQnfn4s8=;
        b=GVQuBpgUZb3RyjLyCUyg81gzdADgBF1FbgZdTc0MqENmSZSH7zztzLZfY6kht7UOeE
         U1HJDKaR6nDgXx9Dsoe5TTSQ6Fdpa4Sx07CpUtc+JcAW2n8uiW0a6MF5T7e7HqhcUV7F
         PHRnpwilO2pmIGJcg3fRUNf8izC6XQd1XRt/aDj07UvFuOY9IRMct3Bep3JHPJwHncj9
         nX4anK4MhIFgBKf7A5VqmMpEpayRUgNoPYDGhB7VLGoMpobar0Y+w8oZDEWQj+9l6QxC
         lnIO9a8zXJoqb7CPVgX3LS1ZK3C1UBpaVNcymmyVHpzGN0H86yxSFEU+0WSBV6rEhdBD
         +new==
X-Forwarded-Encrypted: i=1; AFNElJ//AZ24S5g3gDCaViJTNM9gXqJRt00rAU82bfhmqOHYod+S1RAI0job4JjPOjpR2kBrw5ML2A+FNbkkAJTS@vger.kernel.org
X-Gm-Message-State: AOJu0Yybcq47mZK1rqSbUtDIBIiJ58SPMqVqzcGZtY1Wi5t85cDk67Co
	SrRzkkdzsDypzsQjv3cHKQN7QyjJsCbQPchKz17Beg8CgsqfRon6EUSvNUKl7RDhhUEBn2Sw6B3
	7UtYWdehir9a4vQqUPPYPHzuwldx7oWROUwvIDugKeMpkvMu2fX970XaSeYTrbTcMclWX
X-Gm-Gg: Acq92OFJZfsbtuXpgMlKlQMFmajx7p3oPZ75Ex5kERB9JQbFRDo9aRfvQ+N70z10mNO
	bULRPokFq/h/nwvtac9B5iWFjukZ3/baWt/xJ8UsGw0Hy66tHqg9oacuqH+u/raOMhqg/CnJ5B9
	X2ARUZexew7wzTuJvOFSnB6CcuB3Phj7+fV7uFPIDFwxQmM3WgcAqLyI844AGQCwQVnr2E4NPDD
	Pk9TynEaMOw2ZWwUhYWJacMG+ad3xNfp5l73tq5VcmwcSTXkeWH6Ast7TQJ2hr1zyN6fM65lzWc
	nfGICNR4J2rcaRGD8QPD9iLTabkMFeaKUp+poVGEvMF2ad2AuV6wJXI0qXTf4ks3DCpdJR3E71C
	zNf/q8AxgqbChjkM8rJvAoiaUHdUJFETNMdAEO0voQ0aoPRllbYcDwMDq6LYayQ4TCxPo6BbbRt
	C8448=
X-Received: by 2002:a67:e24b:0:b0:612:13af:f5de with SMTP id ada2fe7eead31-630fad442d5mr3535128137.3.1778501631852;
        Mon, 11 May 2026 05:13:51 -0700 (PDT)
X-Received: by 2002:a67:e24b:0:b0:612:13af:f5de with SMTP id ada2fe7eead31-630fad442d5mr3535117137.3.1778501631385;
        Mon, 11 May 2026 05:13:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac02c832asm498322166b.11.2026.05.11.05.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 05:13:50 -0700 (PDT)
Message-ID: <b98deaf5-b6af-4774-a5e5-4f0d6cfbc077@oss.qualcomm.com>
Date: Mon, 11 May 2026 14:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
 <91523c61-bd03-2d96-823e-78ecd9e3798f@linux.intel.com>
 <17397c91-53e2-4786-b7c8-88c302821e22@oss.qualcomm.com>
 <88ce2f85-5d8f-9845-cdb8-77051989e57f@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88ce2f85-5d8f-9845-cdb8-77051989e57f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzNSBTYWx0ZWRfX0mNcXcpLq+bB
 FoaqvW4JyWdEUkZb/+KZxFWeP/Or0Mddc05fjz/hg/RWITJmSmZv1UyS3w3Q5Frkk7Yde644CRg
 CxvaP8e/2ZunWstCizYgwBhZBYefPMVDEOPTKYVuHcXAGJ9uwItg0Jt04yRbbZvwzinLfVsEddz
 qRoX1JoKgiqR/dz9rZ38hQTMkhOJxE84AUeWuwSgTsKIP9s1H0kzJ02jXeBoLx2rBhyAguJI70i
 hk+AnncbUp54aDczAtdeaoRtYcvd0RtKUrE1R1BMKhPJ6Tfwn+vHdl3D8hr/OH3e6JE7LTVWctX
 fZROmatUMFD7kaDG8ACujSsY1cBVLLsU4Q8TgShnDsqS2k4nyKMXR4v1+a2XuTYEogAKnX5EbGs
 D+dk1fkwkFojDO1nbFqW0vVWCr4Nnbe8v4rX4jYdgzMyT1ji1T+Z3qWYQmviEW519v1aa9zsPDD
 YGF5hxGZNxDYvzv5xsw==
X-Authority-Analysis: v=2.4 cv=AI/DAN7A c=1 sm=1 tr=0 ts=6a01c800 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZGoIsIOgen_iXHErvcUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: SkQu4_Vz7GCGJDGCfD1_Ak92C4Xcaql2
X-Proofpoint-ORIG-GUID: SkQu4_Vz7GCGJDGCfD1_Ak92C4Xcaql2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110135
X-Rspamd-Queue-Id: 86BF950D86D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-106914-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/11/26 2:07 PM, Ilpo Järvinen wrote:
> On Mon, 11 May 2026, Anvesh Jain P wrote:

[...]

>>>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +
>>>> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
>>>
>>> This converts bool -> u8 using C's implicit conversion rules (plus on top 
>>> of that does unnecessary !!). Please write the conversion explicitly, you 
>>> can use ?: syntax for brevity.
>>>
>>
>> The original v4 code used `enable ? 1 : 0` explicitly, but Konrad Dybcio
>> suggested switching to `!!enable` during his review [1]. Happy to revert
>> to the explicit form if that's the preferred style — just want to flag
>> the conflict so everyone is aligned.
>>
>> [1]
>> https://lore.kernel.org/all/6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com/
> 
> I prefer to have the boolean to binary conversion done explicitly 
> (with the platform drivers maintainer hat on).

And I won't object if you prefer that

Konrad

