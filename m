Return-Path: <linux-arm-msm+bounces-91812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAnMJi5Pg2lrlAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:52:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4699CE6AF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7067302BA64
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 13:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBE03EDAA5;
	Wed,  4 Feb 2026 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKU1cwhJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbuAxVSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422030FC29
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212869; cv=none; b=Tfcht6bDaq4vjIlchklz0jDZb0Kw/GFv/ePivXcz/u2osmLMdWqxMb1wFbpcvDebYu5Ax6OiCtGAkXQZaCuQYH6ocgpmPxKVNgqQqQbxGoV7UY2Vd0fvMY54vIlcrSCgIVoThKeNzR9RdDVw6dnHH2JZwwRiYuKSGoBlTVqvU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212869; c=relaxed/simple;
	bh=yu9L+d/NKnOZPCAeoijRwUSB9NsZEdGlJw0gmHRRJmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clWBqzyhhqsnLzoNLbc80Yt2EJylgu28oNpqowCCegxhWEAD1GKMGuigLxsw6jYmLGW1TlSs3Jd3B3W6XPTWwxpnAiUWo1ERPOh1nbeOaZsx9L7ACeZCj7EVLdGoEDYtxrQfWXhIjwqgbfV21XrIM5oew5ePGeFnSC/w0aZvGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKU1cwhJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbuAxVSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CJ15r716776
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 13:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmQjygrGvlInql0/zrmdguNNjU0MyhM6vQvuIR3ecsE=; b=ZKU1cwhJizuA4SgR
	VtNfQ1Vmcz1PIeepUNPH7Y6/mljCSC3IcvOIx7wWdzDqxl6p3a7+jmKaUD4x5ZsQ
	8qQiWUkQxrkenuRs4ifxZrVOJSoXvejSoyDKHJoUVJfCI4uTFxwyRPuxCqYBGZr2
	4nbdu/su4XZEZIyTquipK8Zt8Qc6FVmx7EniU+P2btc92jKNQ3qb3/gykZ8QQycC
	sJRnj/4MsrAva4MlJhPVSoM/+6VdkgssxqdyEgX5nc/0PFaT3gziTTfVxsXfQnkm
	mzZGkl05b3Xgz3zuapnBhKM+8BVlSUuUFCWRLHiWqQPF3T7jAZe03ePo/1y1CrYA
	rPe4JA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3nf63dw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 13:47:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so140327085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770212868; x=1770817668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmQjygrGvlInql0/zrmdguNNjU0MyhM6vQvuIR3ecsE=;
        b=DbuAxVSM2ABQMEI8n9x+g5cFkyigksf1P+6X97zQdWBVOGpUFAJX2btDs0k5lysBhK
         71pgvx9Ig0338fYVikyHLbZuiA02HHltmdyV/ozcEB61rliUxU3wTDt11FZt22XM0+g6
         /Tj2bKOUICxNPmAo5XeJTMcmNR5YA6qF3mvagJ0cadNLy/73kZsvG3aP0WbS3sUOm/GR
         C5ArQIOHY/g23H517dOqKvOzvFDEjQL3jeXOoTote9piw3nUyLUWgzJMC3GjoOJ8oUqL
         HLs4YFa/Ft0WenQVMo75nnZiRdYBXkEJK5zJWHQu9bfq6FD5L7GEk/g5bDdGg67Ff9YW
         WgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212868; x=1770817668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmQjygrGvlInql0/zrmdguNNjU0MyhM6vQvuIR3ecsE=;
        b=SULocV86quQxCOVsPQSjy146YzD4iibFdyX/sJyv4MRGDllwkxtTHyf1z7z9MVpyTC
         o1HnmUlbKE0wLyatWjx2yZyzfoX7tezyb52X2460xpf5bzL6JcJ9pRnqMeFiWV3FtHOJ
         okPSTDd8n9JiLthufoM45ko3nRgnSYJngEC/In9QSnZC4KAuml0QA/3YJkoukOdNzCgJ
         mPNhrJwc7pP1D+dMPXylk7uaQaH8JwJ2jUdevMi+VgR5QD+5BRN52tsJ1oIhNceUta57
         yb3GJDT9fQI9aP+2wN0O7K9whfF1KbUpJDJzHBP6p/Mp/MNGtlhOIur7LUQN1n2ddnvw
         vIdA==
X-Forwarded-Encrypted: i=1; AJvYcCXRkbfS9+DNUngxOGT/+YpHHdMZKmwbBEvRyb2Y89St64xjhe8S1P13IU/JwfjIK3aNYIWJsiF7KrFT7ubE@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqFAI2wmvjS/+BMic2QVhz50f9SiVVpe6n6glqyMHoQbVrHRF
	DUofZiBMIxsFNmMoK00CgQhTth9ufEg+qqP4/tiWBE/v9E9OD7iNWaY+myxUBpEYQvtCHOzhIRu
	sVqI6G4eSaOjekLP0XiOfV/lBpYUdDF1U7WTuyF/k+FrBBUt35yEz5eOISn7ga9Tt3IFx
X-Gm-Gg: AZuq6aLUz8i9kRX+6so8jewN06mAdbIK2LetgkeSOyBQiBiU3WzXn/eYhv4Vytn7fEb
	WYpOR5d1Fuh+HBd3+zbK5rWTTZ2s2SMRTuXOMLA1Qf4QQm0//8124IosXHvk9rD62S5hJmLTsh7
	mwjIUaYyrbypIRvuhcfm5fGRjpEZMmgpC+lMcAXoL7dNdB/BS1dIZep/ZbbrPe4Yn9pt29yU+Vb
	0K0i8ENIUWJF0UyDt+ARtu9GFCgkbRdFP3/GpLfRyHGYxhhiCSYNawM1pukqbEMUXwxwKZadgHQ
	NybF2lajElBKAw2CahUh5z5zzRWmackDx2cp0csNV6iiVHh012vXUpaKwJ9saj/DAP9+gzZ/Aed
	+z9eAkw9jvi1nFizFPyyDG7Syjsu3t0xf+loYj5nB1tOdog1rbjz3zRT5DELGmLkxKK4=
X-Received: by 2002:a05:620a:288d:b0:8c0:c999:df5a with SMTP id af79cd13be357-8ca3311995dmr181098285a.6.1770212867832;
        Wed, 04 Feb 2026 05:47:47 -0800 (PST)
X-Received: by 2002:a05:620a:288d:b0:8c0:c999:df5a with SMTP id af79cd13be357-8ca3311995dmr181094885a.6.1770212867196;
        Wed, 04 Feb 2026 05:47:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea00250f5sm119002366b.52.2026.02.04.05.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:47:46 -0800 (PST)
Message-ID: <37905097-ec5a-4922-a34a-7cf0ddce33f4@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 14:47:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-13-praveen.talari@oss.qualcomm.com>
 <df7cbe46-153e-4959-911a-14600b3bea21@oss.qualcomm.com>
 <cf2b7624-eaf9-4ba3-9b2e-81be3adbb53f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cf2b7624-eaf9-4ba3-9b2e-81be3adbb53f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yBQ6DJmozJEiDJcTuwdcYQxla-APEb6H
X-Proofpoint-ORIG-GUID: yBQ6DJmozJEiDJcTuwdcYQxla-APEb6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwNSBTYWx0ZWRfX/sbecPQG8ucb
 8W2wPo5I/CQsb34g2Ps2J3SaAOx8Wvrngsl1lHUXT1KJs8giEd53Dk1OOLJcomzQX8hZ2aISnRB
 0Mq7M0C7txKNw35VT8E0oNxAVHd8fIuIr14cKK10XNMr4frlSBgVOg8gJv0xhklwWR6Jkd7rcP2
 nNdk1/D3AbDcfnNJhxU/qgma713+yPxciVYp4kXh5PdOXFNH7r9qQadWVJGYswQzNyxo7ssDN3T
 mUkMFTG29tW5SX7KyPjdmOj3ymIwCw1xByGYNnSgQnQ7b9HjxwEQ+ii0vBF2RpBX404OOmxy7gR
 WxLuLsFXd8sl7A7BQl7pobr7RXiNFTvfHHyneFmUhDaxm1vyOZGxA+A6pzbnE6OuvYIVqu5myg/
 eGbxekY/o8mYlDAroZhMoHuda+B7dXIxHxH/OTV9CUt4xUy8Of9B1/9AZxN3tYdEpFL1PY/D5J0
 ZCTl0k1dXOKplxEKw5w==
X-Authority-Analysis: v=2.4 cv=doTWylg4 c=1 sm=1 tr=0 ts=69834e04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DvpAP8q0oNssZ-h8920A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91812-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4699CE6AF1
X-Rspamd-Action: no action

On 2/4/26 6:04 AM, Praveen Talari wrote:
> Hi Konrad,
> 
> On 2/3/2026 5:55 PM, Konrad Dybcio wrote:
>> On 2/2/26 7:09 PM, Praveen Talari wrote:
>>> To avoid repeatedly fetching and checking platform data across various
>>> functions, store the struct of_device_id data directly in the i2c
>>> private structure. This change enhances code maintainability and reduces
>>> redundancy.
>>>
>>> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>   -    desc = device_get_match_data(&pdev->dev);
>>> +    gi2c->dev_data = device_get_match_data(&pdev->dev);
>>
>> Because you dereference it unconditionally later, this should be
>> null-checked
> 
> Initially this was added, but based on Bjorn’s comment like there is no possibility of getting a null value here since we are already adding the platform data to compatibles

The ACPI match entries don't have it, which I think gives a good
example of how easy this may be overlooked

Konrad

