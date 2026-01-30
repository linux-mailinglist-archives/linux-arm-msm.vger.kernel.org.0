Return-Path: <linux-arm-msm+bounces-91289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB3SN5uWfGl1NwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:31:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B489BA181
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0856C3019F0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40EE36BCCB;
	Fri, 30 Jan 2026 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqK+OqKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNAMDt5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB5834F474
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772688; cv=none; b=qLkFYVC81WJwpbsn6vkHwK05cn50cUM0BCqzeyTdoeDBSxeLdV1F5V6DJheuP/HDUd3VdaHS/P+ae03tmf0wtWnxTWxIsBLvHmx/AuerDTdJvoh3mopnA3L7FqjM9uVNQ9D1iIiOSo5ZwiCTqvIinQWZBVOUh8xUO0nkHg9siLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772688; c=relaxed/simple;
	bh=QVvt5nu4LT2KMvStPdraJbpmI4l8qIEcXRC75/ijkaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3dROpesfVvzuzDVi+Za9S9dD+gFODRp8v3fke0d8gcrddrLqYN+7yFrOPCzZzDGuWSJ9b3+s+gJPr4zR9+4xCxA7hLEGSZajs4viqJ6FYT8aklk/726cRg25qloMD8To9BlOBe2CYGOojDfEbsNITe80Tsa9lt8fHAqTTg9A6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqK+OqKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNAMDt5g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UB0SvK890987
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ib5mMHdjULOWSq+B1jE5ALjJb6hxhBoEZL3r8HeDGzw=; b=iqK+OqKoAqP9zHnH
	9Ri8x8cUS5fdAgr28dmo8C57LjDQoKLT4RBzOR86zSW6z9aThLzw/1cx501rXPej
	Y2wkn7RT/T+L0BkztIIihsrrMHSStKYTiwMlDDpJ26uuJGsA38HxhyWi5nMRW/io
	IN8sZNzaCx+CHlssgCwCEUcJivUGusPioTgG0dqztOrjjpCwyrqorsEDmV1eFzca
	4Y9INc5eVPPrQb0Oszp21+QY11yLgU5XeGmCFMxut4TTVYd3KzefvSINA+ZlYfS2
	FSxyZjBwcxripwp6oZLvFnJ7A/fxmguz+dq288N1zB+qDeAiK6sum+Bobbo9+ijY
	ceAvNA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7syna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:31:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88882c9b4d0so1483836d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769772683; x=1770377483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ib5mMHdjULOWSq+B1jE5ALjJb6hxhBoEZL3r8HeDGzw=;
        b=PNAMDt5gXyKXJJGxUB/9CnWEWX80Wlk3UiRh9NTy4ALiNQ8Al0bilPpch5nRQKWJYy
         2r5/LYM4EV1FtkxwNH4jqxRs1ZuqcxlbswoG7p7FJm/BGHDbDmj3K9lbG71rnlUCxOsX
         OJpUVhoy8mJoitZiXLYS5wn59vqDZNvhNF0v8F/rnecec+JkEfaT6lzgvnotzBrsgVYv
         Afhb+ilzXN2gNKFvG/ThfzbVgZvXTHMx2ejPFM4gBwR8jTpeVaxY/TXrG4a47ohbWuW1
         h8Jx/hgauclnceNg2x8J3MDy8LWvnDACI+fO3YDes5x0pqWjp5iBLgLErlmXxsq7dmpV
         +GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772683; x=1770377483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ib5mMHdjULOWSq+B1jE5ALjJb6hxhBoEZL3r8HeDGzw=;
        b=SeiYbelYtWB9msWDKERiumjiVHyqhTF4nvADHmMXMTGtKQKaGjcYhN5WSWEk92tEBf
         1Jpq3pXlEbCkT0Ed2xpr4fj1jny3zCVOsUMlBus18CEBmfzlUtBaVT6zF8i/Cnc+1o9R
         DDJ+clS61dfbLMY8GxApyy5W9fd6LjJZO4Pe16goXLAcYqU7rMvg33L5pPgfAqEnpGcs
         oo6zlnEPpVY07pdi8V1gSdts8bvv6Cnoh5i+Y64OE6rTAIRN73/3sC7FuwQt3m6DCvZs
         CxCg2URxV2kPo6DI5GzlrY3FUdBdDaoCSOTLhkxfX0hUjH4E1o1XffdcGLWuEcNLKNld
         1lpA==
X-Forwarded-Encrypted: i=1; AJvYcCWvACwyGbMV0AF0Jozusmh/aeD93kXhkEwqE5ZBVB3Z13hejRWgOaa1pBiX+PI0gXrpJAKLrvmfcWz+eBnH@vger.kernel.org
X-Gm-Message-State: AOJu0YyszMYwhGoiuzpE2H7KHJv/RMgCmHQTFRRwM09bC5hcAQOYzt3y
	AIbfNtTGGp6Vaf6Lh2RdJwbNARMPL+Y/5lCA4z/FaF35SKdd3ZODrIoS1dj8MCCXxxpWWO9haBy
	xuugzFYJe2Vwj/JkxPmM/6tL5v6mOaboKNHtoaS8e2e5mzdZOIVIfCJaxEE74r2iYbobj
X-Gm-Gg: AZuq6aKcC4u+CEbA2NO7utbJ+jmDYR/ok/8nfVBuxWvjqn0t002NrISocgjP03FPZpk
	dHC8UTRm7SjingYb0785L4JK6cLQ6VgoIKAbFs3yH0VKL3KMnz/g9xhYi4VgCpQIkift1aDC/r8
	ZdXwiKsugkHv1rbEeppuu1yE0gn/jANqscayiWLFJwyvSunG713I2JOwu8TlWVBjzih4kE3uQZs
	pq5lm9fC+GD81hUkjEZI9kZRy32wNDsdjlc8Xo2KGxaJmkvBuhu/q7dsKhnF47aVxrRAiq9nNdY
	M4+MTZ2f3OPVz9bE1N05wRIcFssSV1yD6j11N2JTQnkY1EvmSdL+/Yw4TwQcMr5SUzKFIlYSNIu
	rVbOH0pZ2PBy0nMk0cMDNHX1y8Y6gTu6tzP5KazX0f8tAG1CIupifF1OQmUUOq5YTjT4=
X-Received: by 2002:a05:620a:19a7:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c9eb139c25mr285187885a.0.1769772682633;
        Fri, 30 Jan 2026 03:31:22 -0800 (PST)
X-Received: by 2002:a05:620a:19a7:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c9eb139c25mr285184285a.0.1769772682114;
        Fri, 30 Jan 2026 03:31:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc5ddbsm411998066b.18.2026.01.30.03.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:31:21 -0800 (PST)
Message-ID: <d85fd35f-6562-4e45-999d-87a8cfbb4a51@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org> <aVSSNGCtvcYCTylu@rdacayan>
 <8a0083a8-cc5f-4f08-ac8e-7a4516e0de54@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a0083a8-cc5f-4f08-ac8e-7a4516e0de54@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5MyBTYWx0ZWRfX/upGqg3mP3vY
 ur6oj4G8srSO3I4hhMoaq2KjWxqdS/3ushQr+lAubyKrATJKzeAIm2iRFExYkWPuRjUdQnso/om
 TfgK4q9hPf8p1dAir2ofa57j/kHwY5cU5pjkrHCrJMNvF+Q9hA/SbH1emJyleif23Yr5V2oKIYQ
 BpCQxzgTiOsJrL0K8+SdhwH39I2xgaoch00TZLH+pJldTOpRPGfj33kY+gZOvAaOAIqTETquIeP
 li18snO7YlRqpG89uXCbNBw0zi6IjNiyMxJcx0No08Gb/OAurlv7dZfQDnZXkxs1XI9VPyyza8S
 XWp9FgURyz2BE4H1MCZKdW/+n53/KmOdSHayNXiJGs6vWVzZurtwBemb+gJibHHVuVnM+aXIQFg
 RmLNBoTgaIXYZ+KVlaBS2DlJJ11Mu7nyQDvFZFbUQaDJclGihv2KNFbVf9QBg7tZMFMMBEfM2ia
 FUga0Btouz8kSTKIOow==
X-Proofpoint-ORIG-GUID: l9ko4ZSV7xeBosr9iuwngXtIbXlHQ2dy
X-Proofpoint-GUID: l9ko4ZSV7xeBosr9iuwngXtIbXlHQ2dy
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c968b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=6oHZTzlp9KLPi9rkgowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-91289-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
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
X-Rspamd-Queue-Id: 3B489BA181
X-Rspamd-Action: no action

On 12/31/25 9:34 AM, Vladimir Zapolskiy wrote:
> On 12/31/25 05:02, Richard Acayan wrote:
>> On Tue, Dec 30, 2025 at 10:18:39AM +0200, Vladimir Zapolskiy wrote:
>>> On 12/30/25 04:27, Richard Acayan wrote:
>>>> This series adds support for empty endpoint nodes. It is currently RFC
>>>> because it continues an ongoing discussion on how to selectively connect
>>>> some CAMSS ports to cameras and leave others disconnected.
>>>>
>>>> The SDM670 patches are for a full example. If agreed on, this should
>>>> expand to SoCs that have CAMSS.
>>>>
>>>> Example SoC dtsi:
>>>>
>>>>     camss: isp@00000000 {
>>>>         ...
>>>>
>>>>         status = "disabled";
>>>>
>>>>         ports {
>>>>             #address-cells = <1>;
>>>>             #size-cells = <0>;
>>>>
>>>>             port@0 {
>>>>                 reg = <0>;
>>>>
>>>>                 camss_endpoint0: endpoint {
>>>>                 };
>>>>             };
>>>
>>> I do not see this device tree node layout as a valid one. A 'port' provides
>>> an interface description (an option), and an 'endpoint' declares a connection
>>> over a port (the accepted option).
>>>
>>>  From dtschema/schemas/graph.yaml:
>>>
>>>      Each port node contains an 'endpoint' subnode for each remote device port
>>>      connected to this port.
>>>
>>> This is violated in the example given by you above, when a remote device along
>>> with its ports is just missing, thus there is no connection. A forced alternative
>>> reading may (or will) break the legacy, so in this particular case you shall
>>> start from making a change to the shared graph.yaml documentation, since it's
>>> all not about CAMSS or even linux-media specifics.
>>
>> So, if endpoints MUST/SHALL (in IETF RFC 2119 terms) have a remote, then
>> would it be acceptable to label the ports instead, so a board DTS can
>> specify its own fully connected endpoint(s) under the port labels?

I don't know if they MUST, but it IS convenient from the maintainer
perspective since it generally lets people make less mistakes and reduces
copypasta..

We've successfully used this ""model"" for Qualcomm display nodes, as well as
(both non-/Qualcomm) USB-C graphs

> It could be done. For the record, the solution is not to "label the ports
> instead", but the preliminary added endpoints should be gone, and it implies
> that the labels to the endpoints are gone also.
> 
>>
>> The labels to ports aren't looking as "excessive"[1] as they used to be.
>> Is the original review comment on port labels still relevant?
>>
>> [1] https://lore.kernel.org/r/565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org
> 
> It's relevant with a modulus of 'likely', it's so secondary that I've issued
> my RB at that time. You can write a proper dt graph layout without using dt
> labels, and since it's expected that you touch &camss anyway to change its
> 'status' property value etc., you may add ports and endpoints under the same
> labelled &camss device tree node at once. There is no rule to use some labels
> no matter what, but technically you may introduce port labels and add endpoints
> by a port label, this approach is practically found e.g. with Rockchip or
> TI ISP device tree nodes.

Referring to nodes through labels is generally agreed to be the best-practice
given it's the only way that ensures at compile-time that the referenced node
actually exists.

At the end of the day, this is essentially syntax sugar. What we put in the
DT must be somehow interpretable by the OS, and it just so happens that this
doesn't really introduce much complexity while having the aforementioned
benefits

Konrad

