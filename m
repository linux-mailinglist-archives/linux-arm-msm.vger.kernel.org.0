Return-Path: <linux-arm-msm+bounces-103138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGGtFFIw3mnxogkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:17:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE193F9E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 123C530E9005
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70D53E0C41;
	Tue, 14 Apr 2026 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6i6c6mS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP2qKast"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF03E5ECE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168643; cv=none; b=Ze3xiKA3wEAUFGbKUuXArgg3lT5lBvT8fIMViOm7Uqf7CO6fPWan8QYcBW45CvxbgIonucgDLfa+wBHutRhGSivtG0i/3tI5roVQXc7S7a425aASf5kfFsdXCmfMWTmVoZsVyeVYyIJ3JqNZiEQe+lojt46qhiKDJIrnZOKVAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168643; c=relaxed/simple;
	bh=+7mq9YmQ5a4DCYRPR6WuvCY4oCusTEBSVXb0rpXdjC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G16sKxgtQk+iA0MkUaGuda3jIL/ixBruWW7uDAo7TT2Verl8r6tG6ys16gF/2ZxbRhpH+PEmSYimw9IF6B4/XJNNCnP5ANt8/tdc+M8RTwim2e9autQ39Ge6so0tGjLlWEXriqvoPjtQjQQIf9Nhti61DD7QcfrcnZFaXV/eI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6i6c6mS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP2qKast; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBvNvQ281661
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 12:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLqH/GebeX8XetZGWa3YKFR4lqTlaN8viFswgEzGi7M=; b=a6i6c6mS4OSg2Lmw
	QXIrkqLzjhvmCWZNWjzEtM6T87CgvdwuIcsHbVazY461bM/r+fY7zT+nINbqTdQ/
	1EPRqi6BJ4pdEXnbxXHrJGWNvR7JaqP5PV1ZRUcveNo7R1+AD5t6Syw6NKLJqz0r
	nCMK86SFEdrI7fh9NVI2+pwrlWsgA0qoQ6+7FJboaIqbU9HN3U1qbZofDhNlyPXf
	7lIDUvAWbknK2Ks3EbNPVHefaR7X6X7LLIrpIe67dnzo755xcwuSbSb5zlXfygk6
	jDwehGKuy4GXmYAvoikzTbkoWT5IivKnegMjDU1DQJTeTLWvUeIOd7/xU653pOzS
	pEphqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vjkkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 12:10:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cff2297253so151297185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776168641; x=1776773441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLqH/GebeX8XetZGWa3YKFR4lqTlaN8viFswgEzGi7M=;
        b=KP2qKastHexwoTUoekZgPu3FYVuNv2OSyr8woJNJ3bnI/z4/iyEy/MLX3C7ueJofuY
         1e8padDsklIHGd//Svc51ix36lDHFRenO/B53M0hzMmIgYwddG2qD9OC5ifUowMf+ziH
         +xxJSTvk/iKsAuem9Xnv5azd9jVZRfTZq+QKJ0SwvGXtdI395H6LMQCiGmD5aF/U5dp1
         /+kEbEfFtYhzAkDBizMcnzsI6XkjX4KN5wPLZ/A0Acf4M0uN+kK9wVEdqr6UeVXd9Mx3
         TPgsdRvsy2M+SQ69ZnMeKkC0Dau3dsXSEgnhvl703ZHHke1J7LFeNu/m9KAP39hiXHsc
         drPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776168641; x=1776773441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLqH/GebeX8XetZGWa3YKFR4lqTlaN8viFswgEzGi7M=;
        b=l4LRtZd6gzlFHb04A8U6i/Jpe4jG6iWmFFk8gkhRd5hWVJtvRvbJRvj4iG1wq1dksO
         IkuXzhM8LKDkD4hXsMBZIFLH3fkCiDEyk9CrDVchIq3fHzFPvzDLkOigINnwdmDVbuUY
         3WdQkKDi5WVoRQqc4XllhY+2Oz9XBKfa/fZO+t8WGolgQbt1+8BOjUHGMJFfk81ya6Ya
         rbiRUrOuXkDImbaDVnVamyjmK8HHOLe5iqrIXiGWg8Wrdlxx+pXKHk0O9DH/rZ0zpNoJ
         5RVfQ2PpO7x2mmZLY/5LvE1sWphVHt6zByeosU/vQnWjRB6CrGiGjgubsUHv7wVuM7Ef
         JoiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OhzsvRo8l9uG+XEwnSCjz+Ds21gDmjKA5jS0LGdO5Exfvu0sXhk+zc4WL0QB20OVJHXSf8QKkWLMnUsRf@vger.kernel.org
X-Gm-Message-State: AOJu0YyBiccLYawCfDzCrgYODIIM1dUfDIMfnKZScghVcJEABHNN4O+9
	tFrOplYk7roXiRlgLX9577VwYIMVsUFQPpkiwUf6nQjzvDzD2MDNOIAI/OzHky9DxKvk+1W0lWb
	nNK7WG1A7/miZP/PtErES9ryCngynJS7njM9ZkXHRxPZWQ6JxRkSD9JhyFPaOmokVdJXm
X-Gm-Gg: AeBDieu8JmEWg9lzWRzYZEtCmkaPJ+FnIuQnL+PrfRVkEnNhMpeI4DYj3yy6LZRUzvt
	CAQ1Q3SjOm2/WVDcQ8BeTEJd37P303iwiF2qL7sTwafi9rL0LazUWDWWM5ULm2L1wwbz1YdBQDQ
	ys+fyfDBfyfdGTxPi9WBPCgqzBem68Ys8vMBIt17s9f5wZKjwKwYrFrhg7qlUO/a9V1dmrFZ4md
	AyAXQQBKBEVsF6NaippRTxywmtd4Gl6FKCjKRZBoiQUGQspA7MWa0nP98LloQMmpbI2daQ1lnbQ
	NiM/yUuLvG9mJThKIUCPcsOHEXlb6MGl0F1fQnqx6MERI4FiI6J9xnQkWw6VHk4rhny7ff3sWK0
	yIfBtSPSnVN/SxbsCL1G/Qts4jhMwPClQ0yFLH138nuEdw/Z6q7FxUqG1kItw2VRE+3QdB/SzYH
	3S9r+5hziCsjYYAQ==
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1593533085a.1.1776168640513;
        Tue, 14 Apr 2026 05:10:40 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1593528985a.1.1776168640050;
        Tue, 14 Apr 2026 05:10:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm2975846a12.24.2026.04.14.05.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 05:10:38 -0700 (PDT)
Message-ID: <42977e71-f6ed-4ba5-9616-b1e2ebe2a1fa@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 14:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
 <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
 <2dfa4af5-d3c4-41ac-9762-0a9101f436ee@oss.qualcomm.com>
 <nr6ziek4s2mulvnxyvy2v67zniy7ftyuwwgbqgpuqiyc67arg5@756dyguscmjp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nr6ziek4s2mulvnxyvy2v67zniy7ftyuwwgbqgpuqiyc67arg5@756dyguscmjp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2CCUrTmZbW9h2cCZsA_hfIdOXJjc8RRo
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de2ec1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=aBA1A0hji4P6j46pBtAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2CCUrTmZbW9h2cCZsA_hfIdOXJjc8RRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExNCBTYWx0ZWRfXzALenda+5xkv
 F83BNCTniOAFj2AnHlhTPH/wpMun07UBTSwDstYv3tzsVABMlO6EmzA1PhDw30OmIeyO23Cbl6w
 BBo7D5h4DZYSyon7iQ4py7C0b8E/8lFkIO9zC1UmPrgtVucOhfGRte0xipwa0sWz11hhGM4ejJb
 2VrGqkwoDo6FF3EYDkHQRndUeAxaebdm9UeUMrNJuhPKMM/oEZHihVyVK6A2Dr6s28CBMIhQtC6
 1W41ArcGCDI65xiSVqKrp2A1xh51RFrDZ6JKfFt/irgg27j9ld5qx2GVKKGig7kHRQfy+p07HEi
 zRYXqho3uzQkuTDnCwXKiCvgzLTXH+73lZyxZ0TYDoN3nWZ4uW/6Ax7537PH2Q/9k2VywXwW0gZ
 tLWejg6pulRNwgE/+Xp5zDGBFTTMVM9ckes+IBZEGHSBtZc9EJxJ/h9M/6mx+pQBGE4nIGwiI6y
 /GlgrOjDttDvfMmOwiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140114
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103138-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBE193F9E9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/12/26 2:44 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 10:22:04AM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 4/10/2026 12:03 AM, Bryan O'Donoghue wrote:
>>> On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
>>>> +	.cc_gdsc = &cam_cc_titan_top_gdsc,
>>>
>>> So.
>>>
>>> You can represent this in one of two ways.
>>>
>>> - By making the GDSC a depends of the sensor
>>>    Obviously a PITA to keep doing.
>>>
>>> - By making the link from CAMCC to the GDSC
>>>    The question is, is it valid for CAMCC or indeed
>>>    any clock controller to be both a provider and
>>>    a consumer of the same power-domain.
>>>
>>> The other question I have is; in this setup you have
>>> does the GDSC you've made a link to switch on/off as
>>> it should ? Have you checked ?
>>>
>>> I think you can make the argument both ways.
>>>
>>> - The sensor should consume the PD provided by the
>>>    controller - like CAMSS and CCI does.
>>>
>>> or
>>>
>>> - Lets optimise the representation of the dependencies
>>>    so that the consumers don't need to know about it.
>>>
>>> The self-referential nature of the change seems a bit odd to me but, at 
>>> the same time, I find the over-representation of power dependencies like 
>>> pointless spinning of wheels too...
>>>
>>> ---
>>> bod
>>>
>>
>> Since sensor driver is a consumer of camcc clocks, the associated power‑domain
>> for those camcc clocks also must be voted from the sensor(consumer) side,
>> rather than by marking camcc device as a consumer of its own GDSC. This also
>> ensures all sensor dependencies are accurately captured in sensor DT node & voted
>> from sensor driver.
>>
>> The approach in this series also doesn't work on chipsets where use_rpm is not
>> set for camcc or for split camcc as mentioned in cover letter. So if sensor
>> driver is common across the chipsets, it would still require to vote on titan
>> top PD on chipsets where camcc is split or use_rpm is not set, so it is better
>> to vote titan top PD from sensor driver only across all the chipsets.
> 
> Well, the sensor is not consuming the Titan top PD. It is not wired to
> the sensors in tha hardware. Instead, a proper fix would be to make all
> camcc / mmss drivers inherently set use_rpm = true.

I think this is a hw design "problem".. the CAM_CC HPG talks about having to
first enable power & PLLs, then the CPAS clocks, then the TITAN_TOP GDSC and
only then the other clocks & cores should be turned on..

So essentially, some parts of CAM_CC should be ""inside"" the CAM_SS bus that
was floated around, but at the same time, other parts of it are prerequisite
for the operation of the subsystem, which makes it difficult to cleanly
describe..

Konrad

