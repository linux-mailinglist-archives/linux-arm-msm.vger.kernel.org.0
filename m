Return-Path: <linux-arm-msm+bounces-93635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pz0EEkgnGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:39:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5E71740C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 631C4300462D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0E834EF02;
	Mon, 23 Feb 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gz58tQmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSmwvoz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3D137750
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839377; cv=none; b=o35VXpjZXbqa423o9euegmdvce7a1njKJfY5i93x8ChC5aiUz9YFuklco3khYhgCj7v+50COc9/EdpkEggqbGIBbXbZ4we276KG7et2o2MptuZDntGHd7HlQjuVZ9jG0jKwU19fXms/jqLkFxqtswPaO4O3RtHtp/qRIml6HokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839377; c=relaxed/simple;
	bh=atAGju0p/Xxb5dMVewM+6bW3D/1du1ZkwKdyzISI90Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAVdGUPh6oUseChPjR+5MYDZ2g2vlMFJyIIq/x8zUpAXFdqVE2z3RPuM8uVbNRKYG9lQDH/IrOXOYdKLe308XkHoEx7WlHCjqrvIV5JzRM68rCWlttS8aRr4iXE4fdjcw+YZayTZK2Tz4zbInAhScALswiD3esnkuRqLg2aq/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gz58tQmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSmwvoz6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMlALH1184063
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=; b=Gz58tQmRE/iJoV8k
	J0/JttB64qlBpYibGzTX6Zn5lv/n92CMIVAqWDSrmeNiPudLmBZN75cDy8J63hLK
	4DbriMib5EMSLZJLTX4O/1w+RUaUZJ68L/+gA1xYOyAv4Tg9C+7cuaqOWXONE1dj
	d1FSCL+joohBZKHLtbC+GMbCo2XZv3MPl7NBDnItZB9GBGFB4FpG0zKgBW4jGvHN
	bZkSaUNboM+Jyw15QjRwbdIi5R0kzPy7D7BQwYyoboYcEWonC+ptc7Vvwg0jJwsm
	NS0SuxWkESi6z/2lIHAoPx8GtxgNmpSkRpCOH1woyhA+WvZro+4bxDWHETD3B8DS
	HFtj7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m71n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:36:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a943e214daso300840705ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771839375; x=1772444175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=;
        b=ZSmwvoz6mSV1PnfBL7Sc89Uib1tZQ5FOir35bPD4H4gWNvuGjZcjVcUolST+F8zxGb
         wOnwO3wviW107x9Rw2bi9iLUoM2B+JilXP7AQZ5yfJuTlxQiwNZ8+fgEJizoqr0qlqJ1
         PCZrhkZ3SjeeixI470EUREcGAPtfRq5AUk4gSkX6tGOWxruP8QbUju6FfRRvdrs/fgNF
         za4LvzSz8OQHrBs/NNUNI0UF65nTxQ8CPMpJuHOMKacgqGDfm3bTVGiGVsoXQLJPKmKw
         rm2v3wRFbKwEVUDlHqQ+SoYfSLGLOUXJaD7yrLIsJJC9wBf6/ppIW+553asY/R5iNFu5
         qsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839375; x=1772444175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=;
        b=AELxdOpgueBE2zp5cLgy86OOpvQ1K7uuejCwWYCuLvIsSbz9EPNYtwqm642Hb0RRS4
         pqmhv4nYap1SpLlgy4MsgSDYZ+FBW+gu2X8xmzA2rFBJZuhOrvyaBsX2CdJX3/I0z9SG
         8jWi5V1s32KjAKOZExhKjrc/CZjkGjwP291SvM8rrmMIfLPSQd97+BPNsK2zx3ue089h
         UD+4BxxMLSeqWxNSaoIiRnma46aPQOs6/5NKrjaW4wqh1pdndWndjSZJUiExfeKWdpDm
         51vbv5PPvFKT53DJ26mKHbW8meY+lwuWn6s87GZT0wC7xHEWICHHai8Jp3cOK0B5Bzpu
         qWIg==
X-Forwarded-Encrypted: i=1; AJvYcCWkSA4+wS634D5JcKKlFkokfhzebv/x26S2BsJ+qHc5p7bIcM1RoI/K0lqzkcM2h1aP6/Xp8JG05T00GdJP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi76PUGc629GLO7J8IGQP1F5SAWDZvMlPhJpxtVHIIjzn7aWR4
	GThLD7LyPYwTIZs8lJtQZv3sc35GUn4aeFkaUPmWyaOl8OddaX4wgZsUTPd796LTuhbURqSPlcx
	OHDFsv12I9ThKGd6cg/VbiaTKgstriWJ54W1bwN5VBBsopr0EVr75N+j1NVFcvAMdBUt3
X-Gm-Gg: ATEYQzzhx5gF2VAn4Y57miOHjmfqc2a/Rkzhv62rN87yZ/nb/KpKhgbpFpuQUWWSCNC
	Ns8jqxLQ/IKSxyxxAaA5cp2KJ0FSdw/7+um/bF3CuI0msQSCdomzwQLtpjpT7O5HTdSjxkmgP0M
	scQoy2JfbSyVddQDhfrJqted5JmDO7udFlQQ83VT/xdvcrEue0NcnujY9T8O3VXKmSNQKj1o5ov
	85TmRj9EzQePIlgeRoELRp64ScXhLySz61SNjSPdEJ/l4LmClqM81KQiN7Qj7ttcL3/5X9rLPuw
	gi4r1osMmxf2VhNuXbhVHpPbb/KReqgQvIt028WwaxQP5dI0pYbf75rYhJP4bIpNsQDrZyvZsso
	r1F/IbujUnh7dl41RZGCghdcDEMqj75riMlu0NGe3qC2azwBYQuDRhaKIElkXpBAEbDa0cqPEuK
	TmEh9HSjyF0v355G/h+jIc7ymK03vtx+z1XvV7RkM=
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id d9443c01a7336-2ad743e22cfmr80923465ad.2.1771839375152;
        Mon, 23 Feb 2026 01:36:15 -0800 (PST)
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id d9443c01a7336-2ad743e22cfmr80923205ad.2.1771839374726;
        Mon, 23 Feb 2026 01:36:14 -0800 (PST)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503d406sm65521675ad.75.2026.02.23.01.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:36:14 -0800 (PST)
Message-ID: <ffecf0ae-f826-4690-8ec5-c19011f2c50b@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:06:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
 <20260205-succinct-honest-badger-52e1b7@quoll>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260205-succinct-honest-badger-52e1b7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c1f8f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=njHKLakQ8Vn3IMBtrbEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX76syH7OUcpP8
 OxiZ+2OXf8Z5mKsK/O+T20MoVkTkz7401/BoFoEWsqpo5eCj3WUAzaMlyWEr1ZOf2l/OakJYtH1
 Kv08Puh/o/A0wT0qsvQ2iVD8C64/c2UZpinknJkyhM+YZfkVz15JdIr1BO+RPTwL9xa9nCJH3v5
 oCtHYYi+EwetZrLbPO/USFLQOcWMABsMn+S5Suv20dpdYEfIBDpMwRWiVIYXWfCRqFcQYeZCXVa
 Toy4YH/K97VY+TYDtTSzjC77X68NOndtukNDEZgx8KDVRREXExusBCdbvf+3dPWYqAZU5/FOfwr
 ijTbkxkERHIv/+SDLc7kyF8H9W8lCTKo58An8i3TxMv9SiuIqAKJb2TTfn1xBEj/zZsJMDGl/IB
 swjJc4w86hQqyKbDYGlARKR0GCbB2jh/XRfaVkOeHIgd33Mk46hwTPJ6iSahoRB5XmQkjk1v2vV
 hpzCzYz/yk8O5PZMKLw==
X-Proofpoint-ORIG-GUID: 8HkC_oGVW9ktoHKvN6vhEK5xT1dWnLls
X-Proofpoint-GUID: 8HkC_oGVW9ktoHKvN6vhEK5xT1dWnLls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93635-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D5E71740C2
X-Rspamd-Action: no action


On 2/5/2026 4:04 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 05:43:54AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur ADSP PAS which is fully
>> compatible with Qualcomm Kaanapali ADSP PAS.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>
>> Changes in v3:
>> - A few variants of the SoC are expected to run Linux at EL1 hence the
>>    iommus properties are left optional.
>> - Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/
>>
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index b117c82b057b..fb6e0b4f54e8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -29,6 +29,7 @@ properties:
>>             - qcom,x1e80100-cdsp-pas
>>         - items:
>>             - enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,kaanapali-adsp-pas
> There is no such hunk... I think this continues my comments from Sep/Oct
> 2025 that creating such patches, with multiple dependencies makes more
> difficult to review.
Hey Krzysztof, Thanks for taking time to review the series :) I'll give 
some more context here to ensure that your comments were followed and 
this is just a one-off. This patch was held off from the dependent 
Kaanapali patches since it wasn't clear at that time if this SoC would 
be running at EL1. Only with that confirmation and given that dependent 
patch was on the list for a couple of weeks with Rbs, this series got 
posted out. -Sibi
> I mark it as not applicable, please send when your dependencies hit the
> tree so I can review it in proper context.
>
> Best regards,
> Krzysztof
>

