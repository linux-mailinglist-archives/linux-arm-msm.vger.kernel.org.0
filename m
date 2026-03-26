Return-Path: <linux-arm-msm+bounces-100106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMlUMHIcxWnr6QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:45:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F87334ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0482030A02BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D60A3EBF23;
	Thu, 26 Mar 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY5PlCsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJ8NsJfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CC3909AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774525204; cv=none; b=sYGa0/iSR6XJBKwWKIVLG3Qt78FNNSTsVZh+KqhxKc312r3ftJmV6/MIT5E/ob4ihIhnzdFMWf2ZswUsvlHqA8XIVletAJ//8OscJx5E6DAw0YXHBitEPNr3XBTVuPFb+mnYgvV3sa+HKxL+ov2sXa6jL8mFEmoA2mQjG8Wh+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774525204; c=relaxed/simple;
	bh=65eoDA5aXZKiN86gCHpFmmdUEmkkKaAXVNwubjRij5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcsqluigNbTKk6u+weEgT3yoUkulMUyWItpJL/0UUckalJOx8NgFXBeRwU+9AVrvnLQcQV5t4i11SOSr0PmUlgDZZyK2HhkheUyLwOuwIPoj1/ugddd7R4OiD0lf/2BqNJyaFhctL0lkAPcqMTgxN4RGbnQ+dlxxRpxlqihCDZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nY5PlCsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJ8NsJfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7chno2887102
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=; b=nY5PlCsU7Q4oc7Gr
	o6E4xjYB6CqSMJRRVArxY34+zAlEXSBJFsXMXE7DweGbtEoRMFuLsznxS1Kfj1m3
	tUlRmhF3jj3tr8xw48rHKRxnnAA6mhtRviSHEy0yM170OR4v5M//S8+Y6LA2L3yA
	vouAnDsWAc/LZCYJFr5dGDFZiyY8ZOHgu1bscUcszZbFvRqFrfOlygePLKPX3z9Z
	q4MMNdtlnnEaNS8O609DPVVRokQH3fnnM0P60gYt+ynPXiJbDo1YaynGeO/9HrZ7
	GUGpvXVyC4TbY9aIRugD6p7RQpBZhcp2u+sIbXfNlU6jd+A3jYu0dHMJbiG2JS8B
	cqDaZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kg8ty3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:39:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b86b756c4so2948171cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774525196; x=1775129996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=;
        b=GJ8NsJfuumma3A3h75iA+VX5BBaHl6SN3yO7zAQmnOpU1Fh7cRPUe74qBN5i0UPGSP
         zWjBChpPZ4BCsreQSOddDmzlrLoggkSMxQ9p0KcRMaovLMryJLdOXtcvg+CLEYXah4cP
         iuuZbKTJkG2Ha8LEH9EHEipO+KbvMMaRgGWfYsC5GETjlfMppecTWVxFUkdT9P/rBBHG
         cv/4/GoWhgbbgnvduHzpQNgSUd8mDlj54mH8NdbeqA3MLJq3ares9unIjPuanWzUmTTy
         a74FirzG/UJxcE+F8q4yuwnzR43Y6/1cLrO6YhdcPqo/3onVOmeXcFNENi25kvebB6l1
         FWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525196; x=1775129996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=;
        b=IirikkxJZWIr+hEWMkoDKSdpykQd6U+05o8lmSvs5mgO4BWDT91pTP94h2801TGg5H
         L4cXE5XqxiI5XYcSd1YWAUt1Rw1Gyt4h4V8dwQv3CG7E11NGMueV9zgP+Z2RtZQWS29z
         tyv25RBK0v6QUIBR7q81isaWLfNC05H52lOkUoeXsNNKXrS2PD+Cl+URaxedLsJv6Q/X
         8lUKap0ueL7L6mOk5dyO3g0H9ZhU/oGJH1sIjvXbpyChrNbltiY5GHfJ+qcM7hQOYjTo
         iHuhl0PmTrj8au6xbAtjm6sMyc2OHmnrKuNcmCPv2FUTQwJbWG3zNtyRupH8GmMevc4i
         zB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVM4UtK1ZBRIrjgowaxRetXTyaXeZrD4eifIV2MCOv2rmvO0d9Jqwu4kXsL6wU5yuKsh0EELWT7fZeetvNj@vger.kernel.org
X-Gm-Message-State: AOJu0YwifQii9f+B2LMqdMB7OmO9bLslppf9G5hTZtrZdOSftUV2Y5cJ
	UaiQrfYsVE4IfDJSJMc4rq3qStS5T3yBowCntWhFetcw5HM7ZjioRlP6aaEjpNPcpaIAb/o/LE+
	GYaNw2tdjm1pTcjkZzcWZ9CgxosuOuntlKrJ20GstHXmx+FXcycRJ1swjJz9IcSi9n4G4
X-Gm-Gg: ATEYQzy/Fisz19JRayJsnO2e1+2a8SkYsXvc7JHHCUURzw6u47j5cZahd65zwXzZHZn
	l2bb+51kFJCs7OnqgwSF/3K5iaAiDi3qREZkmjLY0MHR4oH9VbKNZqgL3ReyHD9WeXS3IgDKGpQ
	m7115mUCJxiXDIBjiPfC9CeA5W7o9EvZrwfjE+EuyU8dJ01O8DddT2MZrTFgh+WlpNlxC4DCFDP
	lUAQGA8b0fz+urejV/Qy8cg79rZDS+xTvmiHCe1YnuKtG6bhlXb/8cv54/88Ns9ZHDPEygKTTu0
	QhbBJHkHIueUbZPif2jva8Sh7VZj0bbjAemD29BziEeWM6DLzWX8lJX84KhOm7/mvSuRwLOuEIB
	R1q1HmK+d2Hnqp3q8ajgt15KR8JwVJdifepRLpsaEVGg49KdMTFmDbRw3aopEd0nn1sdaLintYM
	h/ScM=
X-Received: by 2002:a05:622a:4486:b0:509:882:9e7b with SMTP id d75a77b69052e-50b80f10b80mr46079961cf.8.1774525195981;
        Thu, 26 Mar 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4486:b0:509:882:9e7b with SMTP id d75a77b69052e-50b80f10b80mr46079731cf.8.1774525195353;
        Thu, 26 Mar 2026 04:39:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2231sm108580566b.38.2026.03.26.04.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:39:54 -0700 (PDT)
Message-ID: <e79139f5-b737-49e5-91d4-c9269be41a47@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:39:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: David Heidelberg <david@ixit.cz>, Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        oe-linux-nfc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
 <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
 <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
 <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
 <6638c874-8472-4383-bf83-21c5b632e73e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6638c874-8472-4383-bf83-21c5b632e73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c51b0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-PauhVP_RH9yc3VFBwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MCBTYWx0ZWRfX0NbxFmfRzE5A
 IhlTh7hL59dyQaRTFTgliFeo+WezLzqP+lKoyDch9KoLG+ZsLdCFV4AQpA5QS6fNNBvzfZ3/3I5
 a5y5E7ttYHBAR3S1bCq2gTqn/t0xvwCDt7531OwURS/sfKcNfPsa82dbUvf6P4nHBj7aLcVll2/
 360ZjcLeLsvm+OJWk0iFcbO9hXQvELX/WafBM4NbPJ5NukPGoWi3yLkJXAlJQPNjoKxDkN9lf0+
 6sA4FLdXl7LsZgWq5Qd3hT5JQ02Xj7UbmiLPmzbQ3JaM7/44852nnbcappxPu+1I7VE9NKTIOeq
 SFcKQnhh3fYRUpb8wWMJIzTaJ49KweJ3W9F+I2Pbi48g2MTWJ1VpbGJrO6vX8jwqSmW3Od9cVB6
 yr9uR3me3Tf/vd8/5rL1HEZDCVOTU9YrDEEXyFTgPLp6a/p3TwQymzQhW6ykC7QBycTV/d14+H3
 EcUnPbvHkkJf+2ZiN5g==
X-Proofpoint-GUID: BXdGrWdfg0u8BMnDdRhfmohSt29UpFG1
X-Proofpoint-ORIG-GUID: BXdGrWdfg0u8BMnDdRhfmohSt29UpFG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-100106-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 30F87334ADA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 9:17 PM, David Heidelberg wrote:
> On 25/03/2026 12:20, Konrad Dybcio wrote:
>> On 3/24/26 7:08 PM, David Heidelberg wrote:
>>>
>>>
>>> On 24/03/2026 14:12, Konrad Dybcio wrote:
>>>> On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>
>>>>> Definition of the NFC.
>>>>
>>>> "meh" commit message
>>>>
>>>> [...]
>>>>
>>>>> +    nfc_enable_default: nfc-enable-default-state {
>>>>> +        pins = "gpio12", "gpio62";
>>>>> +        function = "gpio";
>>>>> +        drive-strength = <2>;
>>>>> +        bias-pull-up;
> 
>               bias-disable;
>>>>
>>>> Are you sure about pulling up an active-high pin?
>>>
>>> I'm not sure, but downstream does it (and "works for me"). Maybe Alexander would know more details here.
>>
>> Would changing it to bias-disable also "work for you"?
> 
> Yeah, works for me. Should OnePlus 6 do the same?
> 
> Looking at OP6 datasheet, there is no pull-up/down on 12,62,nor IRQ 63.

Generally the internal bias would be used to counteract random noise posing
as signal, to ensure the line is kept in the "inactive" state when not
actively driven

I can see that the driver initially requests both to LOW and then sets it to
high based on the desired mode in nxp_nci_i2c_set_mode(), so pulling up is
perhaps never really desired.

Konrad

