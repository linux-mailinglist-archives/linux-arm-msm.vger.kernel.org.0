Return-Path: <linux-arm-msm+bounces-91664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNMyKpXYgWlYKgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:14:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AFDD820C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE50030683BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 11:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609A633122D;
	Tue,  3 Feb 2026 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE/IbWj4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GU5SXhUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A1330B04
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117262; cv=none; b=sL+2I9p2/nK89qYQjpCsO+W0aSQVcK9LUFaPjLJQ+GexB2u46iAWJDuYSfj6K9GVz2+4sb5GPrqHrUHiu5eSzYl53WJvfHx3M0hEe59zSnpBQbvi5kFpEj4D4XzJJi1RGEDmIupsI1oCYYTWBbTock+xESJtwLGDD+EkgbJDgjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117262; c=relaxed/simple;
	bh=hE5YmGG7iH5u2PUUIDZLVoAsmcZUgfitPft6rYLloVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xj3/rzKI72Q7c7BgqjAa+CFcPsY177pc9hObIB+sWdkKRW0IaLMrPd+KQTE5HARHR4bWNxMYltIVKPFRlQRW6KCRg4+pBgPC7EAVQmJJiiHGy+UGQ2+cwwOYlwCpjpst2FUdiJM8vuMZzwzLFo6jZYLC0BUui6f68oSNgepHfiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE/IbWj4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GU5SXhUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138npDO848643
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 11:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fqIWeb7+wQWH9tXZxxrOSv9gW7UU4Zw0dIiw7RLktA0=; b=aE/IbWj48X8SyCA8
	WCwZ2VvncBD6CbBGSeaveEEj3h1pNjT5j6eEemFBDbtSMqyCbkkRW9AC92O8Wmp+
	O6Wk+S3v4gTSctcTfRIHNjMFEcJYBRlFhx++dMFL57LJT4+WwvvnQglwT0Bfh3nc
	qIx3K31w7mO3fm3aZD/Qjxy6OubSDz71wslVYJNStERCOL5eWIm2jg5HqqvVGkA6
	eS0DQpvjCGN8hqJQQHeDva8p3THLyBW6Js19Y2mTeJoKnKo5KFyOjER8Vcu7YjcP
	P6kHfoXRSdt/iJz2iJWt5PtnCLsaJe5T7rBtEgR7Bt8JOnemSWk3LtPgbvwjc6Ts
	M2SnwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutgepj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 11:14:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so160852285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 03:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770117257; x=1770722057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqIWeb7+wQWH9tXZxxrOSv9gW7UU4Zw0dIiw7RLktA0=;
        b=GU5SXhUiK65Dx1lZis/3lFYl20euEwqLmqBOAadcthmmWt0JNLy42MkOIzNTmsVy8O
         BTKye/mdf+KQQzwqq0pBJvWU9riTYGiq6+8Tx/SPpe4kYnyYtVyUW5PbvTVMRSLUtbiZ
         Pae3UVJ8Q8yVjtyk7keAcLeXLAfMhWuXgkA/d0sIT5nRKUco00KFIuCizJaVBU8YeGzE
         Ote61qnKnGOlk/HLrZVa+UXV0Uw7Bn4wzxuzeJOuj4oB1AH8TJAAZf1Gd+CABICVvtzk
         jrsUL/DdkrWuxqe7kqeB0/FnWFOMdXb416LQamDJwFNIsjVTVpOviH9iMEyzbBMF6xl+
         39GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117257; x=1770722057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqIWeb7+wQWH9tXZxxrOSv9gW7UU4Zw0dIiw7RLktA0=;
        b=VSCJ88LyGIvK7F3QTPUBESmdD/zwEi+45Ft7wJ84gfQJ2dL+k4qgo42kRLPwDsHxGn
         TcMHlAgFvtJD5QB7lFw1F7MFZf3K5Lg4BlhmMoqvC5Do7bJFdCk+1uFXI9X/6RkGCwI3
         oRJxGXpp97+nSvxDsOKnHFTG/XsGRE+nk4hiEIZzkq8qQFOVCo69U1S9k4hRK7PIL6Ib
         u/GLS5KeGQ9FS8N/exQtaVe+7zXhmQjRtvK0UJq1LwNiwzZ0NPX4NImAfp2cPW/f+X/+
         tpTD/EpCAUvz0Yo3xqCmmLUsGSIZ5IpCZ05vsZH8s+Hm6xcoCmBM+FLbRzRGWOZtCjIL
         T6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVt/E2k41z4wbH+x85HCKxBGlD9KvaAqY0zLecckdtmUz/fD1FQJoq5AhExNiHjW+x+EDHzJ9y0rqxC10MW@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiU/RwBsp4b+q5+3o+72m8y0r4EAaBUKJ8s1REuVH0zxD1Vco
	Pe+aY/Qlyznz9mMy8Mi4Sv7FfYLTkO7Wllhp6zal0zx7nJmBtjhUn5/7lG+6KkQcVvVTQrgG7tn
	nZCH0e+NkV7shocDO0yELeaa4vAYia9TTay2lUyLUkuHeERPL2l1day/ukoNMeYF3NKQm
X-Gm-Gg: AZuq6aJI1AxuOE2jyeBE0jznpz/nIdWNYkA49gj6+HU4hBMrCJZrgnW6f/a+/4fGQBE
	2ULQwpuBaNpC7HbVtVwPQluAL67XaAc5IkqxFUaNz0qZMOFAmbCnL43WZeexxNs+M69Qm10FFRS
	ezGVgBPtVrOUfBODNmONXBe8WokFtEdqy1Jd9+bhC8fxWMfr6v/tCWuNfxhx5JMlj42/+o62GzT
	0yr2sMdrXD2PtMES+5WnBA1WFLbi8J26IFz57pRw/zmlNuC98PyVgYedgy4kGZnbre60V+dat66
	TARrzTAM0uor3gnxZj1TH9yhmepBPqqNe4HjcMPoSz7YAEHLlZKfU0moDrYHoDoWDkJ9iXMdcnm
	QX6yVawhASy8mmZosuNSb/iKgFlVdlNc1/ESevtJwQad3w6Bi+yME6lEo50ZMg8e5/7Y=
X-Received: by 2002:a05:620a:19a7:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c9eb139c25mr1519171285a.0.1770117257537;
        Tue, 03 Feb 2026 03:14:17 -0800 (PST)
X-Received: by 2002:a05:620a:19a7:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c9eb139c25mr1519168185a.0.1770117257008;
        Tue, 03 Feb 2026 03:14:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefca54fsm1023572666b.23.2026.02.03.03.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:14:16 -0800 (PST)
Message-ID: <24f967b5-0f15-4aed-a81f-ad54f8e541fa@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 12:14:12 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b918cfa9-1f40-4aee-ad91-d6425798bd07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4OSBTYWx0ZWRfX5iXTUEhpEBjt
 UOJzsXvTuSXdsRNdUp1OEev9TIdRTDcc4IRPzbAX0VQuuPmahahEdOO3t9RjW7yqyBbcKBsyeFf
 g/mCrzzXYYVNGgFLplCzjloiQbhwehbsRRTfU/5ZEWEvRGpub0EplBglkyfZkdAnyQolF0H7+tj
 5P/aCAmPeTsqXf+ia1PTbooxtF4WvGUhfDDFHIIkrqjZ/ZP9+SssWZEVN2j1eD0nL2A+6pKjm/G
 WobuYH+Y4CmW2B43pXyJ+6Az/AO6bQ1/x+Kp5Ao1WLpwP4+NA6seg3lYe9RN4U4ZJQvj3zVE+tH
 uNsM9nm+sBmZ2AxsynmE/0ApoHGkvzcvLUM5sIl7NKq336RwVcvahqKM4iMYxeSabWxcrfizb2w
 3c9Orqe2WWGWdjE+/nBE/KTGdhDbfiyMawQsdKuYRpwZ6SyNcgxe3tCUtVh3g57y8a9X55mMOQe
 8Rs7Tr26djrMysdv+CA==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981d88a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OO4x0hjL3wxKXcLKrYEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IVix0Uj_W2KbPVCAN2kk8ME_zoH03Kq9
X-Proofpoint-GUID: IVix0Uj_W2KbPVCAN2kk8ME_zoH03Kq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91664-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20AFDD820C
X-Rspamd-Action: no action

On 1/30/26 5:54 PM, Praveen Talari wrote:
> Hi Konrad
> 
> On 1/30/2026 5:53 PM, Konrad Dybcio wrote:
>> On 1/12/26 11:47 AM, Praveen Talari wrote:
>>> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
>>> manage performance levels and operating points directly. This resulting
>>> in code duplication across drivers. such as configuring a specific level
>>> or find and apply an OPP based on a clock frequency.
>>>
>>> Introduce two new helper APIs, geni_se_set_perf_level() and
>>> geni_se_set_perf_opp(), addresses this issue by providing a streamlined
>>> method for the GENI Serial Engine (SE) drivers to find and set the OPP
>>> based on the desired performance level, thereby eliminating redundancy.
>>>
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +/**
>>> + * geni_se_set_perf_level() - Set performance level for GENI SE.
>>> + * @se: Pointer to the struct geni_se instance.
>>> + * @level: The desired performance level.
>>> + *
>>> + * Sets the performance level by directly calling dev_pm_opp_set_level
>>> + * on the performance device associated with the SE.
>>> + *
>>> + * Return: 0 on success, or a negative error code on failure.
>>> + */
>>> +int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
>>> +{
>>> +    return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
>>> +}
>>> +EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
>>
>> This function is never used
> 
> it will be used by UART driver, not for I2C/SPI.

Adding unused exported symbols is "eeeh"..

>>
>>> +
>>> +/**
>>> + * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
>>> + * @se: Pointer to the struct geni_se instance.
>>> + * @clk_freq: The requested clock frequency.
>>> + *
>>> + * Finds the nearest operating performance point (OPP) for the given
>>> + * clock frequency and applies it to the SE's performance device.
>>> + *
>>> + * Return: 0 on success, or a negative error code on failure.
>>> + */
>>> +int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
>>
>> I think with the SPI driver in mind (which seems to do a simple rateset
> 
> APIs were added as generic interfaces shared across I²C/SPI which is specific to firmware control, not Linux control.
> 
>> for both backends) we could do:
>>
>>> +{
>>> +    struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>>
>> Then, we can do struct device * perf_dev = se->dev;
> I don't think, it is needed since this is specific to firmware control, not Linux control.

My point is that it doesn't have to be specific to the auto usecase,
further commonizing the code..

Konrad

