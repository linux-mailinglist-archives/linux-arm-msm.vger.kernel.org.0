Return-Path: <linux-arm-msm+bounces-94130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIunKYkHn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:30:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA8198C1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 863C5309FCB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746EA3D349A;
	Wed, 25 Feb 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InRQ2lpe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huIy1Jdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC923D3487
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029545; cv=none; b=mUkagK+5B7vAsHQ4TiAy4ljzQvMlDOF4TFnsYgRocUW7eKln4ggpEAVv8YjuArXWu/XovlPtOPSBoSSynOX2Um6mkIUmnHfejBHF5B572FjHMkbDvSJhDhL5NnpiqpMGMrctYP0MBhooTVI/9xEBu0k3JA0XWi+R1N86V7mbSes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029545; c=relaxed/simple;
	bh=SzQvn4vau6FpBe/PwNL0nk4M12ycm7A3Y9acxzimCnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPKakzklz5E5yMgQhRYl+gqDIGITc5A6eC5FpTxMJnugFV5CNRR+jrDMvLKO3HnVuPYS6wo1w+j/ir1k2bTNZEi3iUl30XyQg8K1/hWRNyVUbQ/SbkmI+n1eSmOCaYOsrQqB+17vkhEcMFA647NGsRzktxiV3KZk6m2DpqTpWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InRQ2lpe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huIy1Jdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SMVo1025100
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFC0QojEPG4lOdIZ8IPpP53jKc6Om2BjnjzFZDb3UgU=; b=InRQ2lpe2XMx0e4Z
	KFaTLQm0ldxroUfwsBAib1203EYmlpCXLKRfIO/Zcqo1sUvgYnCLDYPlIgGKzFpl
	OUTTGxnZ4OcA6GS4V7Y3Wq2jROHysLtboOXTuor9F6SPNByfzxEUfr4/wSnkwoXs
	QFIKNyQQ+hmcc357kz+mojxBW79qQNMnKvC8QPkNRkej3tIu3Npg4NFk8Y7jDWQE
	2YITozTkL84d9b4wLzp4XyrWkTKqoYnikJVJ6AALmwKun1BTwjpEXKFwyz9ruSNj
	Pq+QylC7fSHeHdATqmf5TbrgnUFhIBUEl96Wg0F13gcV4pymM4sVMNauXteCTE+u
	kwTBSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57t27n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:25:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb45a6b860so462911085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029542; x=1772634342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFC0QojEPG4lOdIZ8IPpP53jKc6Om2BjnjzFZDb3UgU=;
        b=huIy1JdtCTXFXyNIm44p0dDQwwomKXDSC+3Bke1Fuk2y3d2P5aT8e5ljwKCccOm5U5
         KRnoHrQqSxUEFXrB63Z6J2XOoRrUX5donRmJgRAeYgeizYKBtX9C0fmMrBVXt+SOPYbS
         Pdg3/jQB1vDPziS1ofhZY3kS1fmxP1Bp530uIbfigrzzfhx9NvPePCqzyV3bf7y4zpfV
         PQdeO6ET9ks85slujNcAjcNPy50nPfGqgwB2p/z9eIWdpxIHqsIFG6RjPls8j2hKw0bK
         +yCTh4Sf3xmXSGy5aOkjatJ0uLQU52n/MfZW6FRa+AeJpxU8fuEvA3oRAnb2xPM+oAuw
         HVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029542; x=1772634342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFC0QojEPG4lOdIZ8IPpP53jKc6Om2BjnjzFZDb3UgU=;
        b=PZo6gAaC9F4Q2EjAPgHCn/ilVQatjMwdG9U8D4dOiqPTUv5ODCcKhUT21uCEhbhu6s
         iH38lOV77e5/5T3wW96764sCucYawNaliAIVuiVzIWfPnBajEgAzwZ+4PwAVzrVaW+Kb
         XXhHCI33ctIR6Emu7AKNlC63BjFBmRYye34LLXNF/gwCk+ArcMGR2EIo6j53BblGg7i9
         CBESPkx3orH9t+5mqlqXTEO+0XExeJZgWyvXnlYaPDfNwLfXim+vsv0CHPB5p9/kgo7q
         g+IfF+XfXFzIskDWwP7iKq9WDInuWmPkAdk2fE34WAQQafPX3VYYQlQJ10KZeUG7nbxN
         mL9A==
X-Forwarded-Encrypted: i=1; AJvYcCUWO+7FdXDGw90tb1ekJUXicOx2JGBGKKViPdUBalW+3KUIuGIXFEp/q/L8OWDdJtdBx4oNhp71oArdJ986@vger.kernel.org
X-Gm-Message-State: AOJu0YztpyhTatRF4Zs5gRQ8ee49yix0NOEYQBHLTqSjgn7wPpk2prYF
	y07qNwoai3kwpy18mLAGmf3pMzciYkPmfGBGBIgTPoapOB4Ibma9JmgsXFirx8f4bsEsTltqSxy
	HobKv2CcLqR0Pr2Mey0Pmn8Idjfu4cnL2DqP+G/TbzQdDooxt4Ea5LEaJ7qnLFg4RdESekSuXe1
	WH
X-Gm-Gg: ATEYQzynAh5U1p6f+IUHxQhHw3hAhcIFeIsDnY7PJPXagYna5fSC9uKf5H+6frNbLmC
	mD/uVQqCi1SpzHbYdPX3QtMyAI0ygUfYMM4WCFgWNrddk46hw8jTDtYc5ZknDhYQb/YxVs0seNY
	vaP9q+7Wsi9o0vhikZLiCSbaGxrpSvGPvPQw5ykDP5rbWn0ZW9iUQQUqE1SmZhJzHc6Hn13pI8C
	oZW13/qHFNhQQ8Q7o6RoIK+1SH8WW9V8E2SAXDuQnfJ5BhvZpiYor60iz0dAXGrRR2lQ/qKLVXa
	SJDXYj3syVJ6sdT68gJRr3MjHbPloSdBrXj8/LHdhC8qEmfG75Zb7dC5BbFCGXdDQ5bdsMqL01S
	xU/rT9qm7xNWRcs+5huzzIlLnAmJR7oP8mC/o1NJINHGw1iqJm9JLO03mfNV5426Une2wShMBZY
	i8Yms=
X-Received: by 2002:a05:620a:298a:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb8ca1bec8mr1586508185a.4.1772029542215;
        Wed, 25 Feb 2026 06:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:298a:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb8ca1bec8mr1586503885a.4.1772029541573;
        Wed, 25 Feb 2026 06:25:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4c27bsm512688666b.39.2026.02.25.06.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:25:40 -0800 (PST)
Message-ID: <143660f3-7379-46e5-95a3-7236bae99b3c@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:25:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] soc: qcom: geni-se: Introduce helper APIs for
 performance control
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
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-7-praveen.talari@oss.qualcomm.com>
 <af0eba46-329f-4979-8b8a-fb5dbe2ad992@oss.qualcomm.com>
 <b918cfa9-1f40-4aee-ad91-d6425798bd07@oss.qualcomm.com>
 <24f967b5-0f15-4aed-a81f-ad54f8e541fa@oss.qualcomm.com>
 <92dc98b7-8047-420b-9743-4bcbc7e30fed@oss.qualcomm.com>
 <ac490ba8-18d0-47fc-a662-5a202c5ba95d@oss.qualcomm.com>
 <85bb3a9f-d54a-4b4c-8dbb-6d5461ebb037@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <85bb3a9f-d54a-4b4c-8dbb-6d5461ebb037@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699f0667 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NxmpmgPpEGV0oUjcLtEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9vTear6mG5_7kUxLKLJeXduFww4js-bx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzOCBTYWx0ZWRfXz6rgKaSjzvmT
 G5YqYMnXsZ9x96m3jJA2h7gpAlUrNo1VEMLqdTGTqtZGTnX9HJhlpFSXBHP8SgK3Had7dScIMTA
 cBH4eRfKLn2ib2+JkaPgNif1ZGkTeat5jTFoV8xRigat5eI24FkP8127/eNX8wzoZCbdc/VsDZs
 ltB4dXh6962oxzGBaiJ0R3Iu9VoCiQJj+1G+CHxm/FeHcg+eHEL8A47WhTO55eTUIZIB7kZvp59
 +OrnlGnAhRlGPnumNfSx5Lb4J4vqQ4UVQFrZFgLb7NPjokkzy6tReGxxHHcvKgjeNsKio/FOQFb
 HWlfCIOiSsWbTaK7xaVPVpLlg2jsC5HzKtFN0SpkFH3eGLAJaz9pN7bbLV8g9eW1fdHwzaQg5GG
 nMcZJLiPn4Yy4zppN96BUC4879xG/GM5Ah5h6sAz9ESKCIwMoYCbO2Zl0yejIvUxzORt2j59gsR
 eoWQijE8j0CdU1nnL4Q==
X-Proofpoint-GUID: 9vTear6mG5_7kUxLKLJeXduFww4js-bx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250138
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94130-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1DA8198C1E
X-Rspamd-Action: no action

On 2/20/26 6:23 AM, Praveen Talari wrote:
> Hi Konrad,
> 
> On 2/17/2026 5:55 PM, Konrad Dybcio wrote:
>> On 2/4/26 6:42 AM, Praveen Talari wrote:
>>> Hi Konrad,
>>>
>>> On 2/3/2026 4:44 PM, Konrad Dybcio wrote:
>>>> On 1/30/26 5:54 PM, Praveen Talari wrote:
>>>>> Hi Konrad
>>>>>
>>>>> On 1/30/2026 5:53 PM, Konrad Dybcio wrote:
>>>>>> On 1/12/26 11:47 AM, Praveen Talari wrote:
>>>>>>> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
>>>>>>> manage performance levels and operating points directly. This resulting
>>>>>>> in code duplication across drivers. such as configuring a specific level
>>>>>>> or find and apply an OPP based on a clock frequency.
>>>>>>>
>>>>>>> Introduce two new helper APIs, geni_se_set_perf_level() and
>>>>>>> geni_se_set_perf_opp(), addresses this issue by providing a streamlined
>>>>>>> method for the GENI Serial Engine (SE) drivers to find and set the OPP
>>>>>>> based on the desired performance level, thereby eliminating redundancy.
>>>>>>>
>>>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +/**
>>>>>>> + * geni_se_set_perf_level() - Set performance level for GENI SE.
>>>>>>> + * @se: Pointer to the struct geni_se instance.
>>>>>>> + * @level: The desired performance level.
>>>>>>> + *
>>>>>>> + * Sets the performance level by directly calling dev_pm_opp_set_level
>>>>>>> + * on the performance device associated with the SE.
>>>>>>> + *
>>>>>>> + * Return: 0 on success, or a negative error code on failure.
>>>>>>> + */
>>>>>>> +int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
>>>>>>> +{
>>>>>>> +    return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
>>>>>>
>>>>>> This function is never used
>>>>>
>>>>> it will be used by UART driver, not for I2C/SPI.
>>>>
>>>> Adding unused exported symbols is "eeeh"..
>>>
>>> I keep in mind for UART, i have added this API.
>>>>
>>>>>>
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
>>>>>>> + * @se: Pointer to the struct geni_se instance.
>>>>>>> + * @clk_freq: The requested clock frequency.
>>>>>>> + *
>>>>>>> + * Finds the nearest operating performance point (OPP) for the given
>>>>>>> + * clock frequency and applies it to the SE's performance device.
>>>>>>> + *
>>>>>>> + * Return: 0 on success, or a negative error code on failure.
>>>>>>> + */
>>>>>>> +int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
>>>>>>
>>>>>> I think with the SPI driver in mind (which seems to do a simple rateset
>>>>>
>>>>> APIs were added as generic interfaces shared across I²C/SPI which is specific to firmware control, not Linux control.
>>>>>
>>>>>> for both backends) we could do:
>>>>>>
>>>>>>> +{
>>>>>>> +    struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>>>>>>
>>>>>> Then, we can do struct device * perf_dev = se->dev;
>>>>> I don't think, it is needed since this is specific to firmware control, not Linux control.
>>>>
>>>> My point is that it doesn't have to be specific to the auto usecase,
>>>> further commonizing the code.
>>>
>>> This API will not useful for non-auto cases as well.
>>
>> This is only because you make it so, with the above suggestion we could
>> do without the .set_rate abstraction in the SPI driver which only does
>> an opp_set_rate in the generic case
> 
> For the generic .set_rate path (which is managed by Linux), we do more than just call dev_pm_opp_set_rate().

I see, you're right. I glanced over this.

Konrad

