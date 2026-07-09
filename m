Return-Path: <linux-arm-msm+bounces-118076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lgHDF67lT2qXpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:17:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B45BD7342E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:17:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IkNM5xFW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CpISSxF2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118076-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118076-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC51E304A932
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592704DBD67;
	Thu,  9 Jul 2026 18:16:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB43F41737E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:16:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620989; cv=none; b=ddVT0twONuL6mkUdH0d3pyV/GiG0mlpscJtHq9A9ISkwyp5635rdo441wkQNXEagpaFPQjcnpo3ROSU78lWDLPwXxYpJhezVGIxdmHbDOsLDtPmLE25BpQFuHtLA5dQZvJDjtxU+KYXs3badZ7Tqf4fCYonZTkq2L46BFadMoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620989; c=relaxed/simple;
	bh=wqiNn6l+nDl9A1NisYGFeyajtfJ+i8wmLRbKPTQb5bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9uAjJ4459+g9sSCqdyyWi19dGRiG+/aNwj0tzLBUpxNWu4M53SCZfV5FlqKiBwrohirpxYbLyfZFISa5kX2vyq23Dhg3Zb8/wUdQCIw6bjEGJpRJIzLjJ96mPOJQBN5Fm1kLbBf9SkyCq/EXd3iozm21sjhfiLNkaOTonoxFnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkNM5xFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpISSxF2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXSFP2330204
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9vlF2zZNrxlsHq6GtF5qElMhuMkGK6oe8/BkTAPX8A=; b=IkNM5xFWZ/N7jHQd
	T4n4/bJmwZSR3bydOHT3YibXPF17tJtrblBQ0FRLVV3SSbBWT2Zf4X3Rwby5f/9n
	uyZDTKYdZ4xougsH5v3JTIV/HFZLBk3NKBPquU2ppBZDFSUZ6BF9a9QdLh9sjBQO
	eKfzqJdlIf/3gIWWVSX97oLMMJD5CqNfyaDEdXA4guziwYBJNiVOR7FULfoWOJiJ
	eunGZDEoU98dmsbZv7E0yOW3qu3k0SggAskocKrS5Js8sRoXrojHwdLogdXhoVfK
	icPOtAbr5EZm9NRM47mhDRii1JnKw1WYqZ/mt402XRsO4yElDxOmVOEMYM6N54xT
	5O7aDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24rkdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:16:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so2286585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783620986; x=1784225786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9vlF2zZNrxlsHq6GtF5qElMhuMkGK6oe8/BkTAPX8A=;
        b=CpISSxF2uv/DlgIBbHBi+FqnjA7Myc4nlyMvhfAuU9EvjGyhQ6IaK553fnDb118k3a
         Q3IRt+VRBIzzuR0QQRO+zBGK8q/hYwIGsifwUmeF3+YcNoOCNaiSv/6DcgvTGK0/U8qq
         O47CV4R5Cv0MTubn+jnjAESNPgpwEcgklH9I5WqqpIUDgoWIWa+HtcXxf9mcLgf32dsT
         6kVrmw29ANbbcO6+nIpA6bpoQdDbSwvgTGq0xUP5GDUly3uLktDtMX55vBGdIXbWCe0V
         X8vyBWnYwQrrKI7555VOZ5bYxULlCzuC8krm7C6p35xQu8PYGB1Fh1bMrRau8ZzSQ7GX
         +Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620986; x=1784225786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9vlF2zZNrxlsHq6GtF5qElMhuMkGK6oe8/BkTAPX8A=;
        b=ArcobANP4AHWsnEfXysIAw0JJd3ZyvIjESCuxan8XR1RR/gqxk7wyconIDeY2sxvjt
         QDBE+rlPBj+5stnq4fi+UlrdNpAVxLD3DpLTAp63LZ5yVFBC/TbrL+MJtfGPsYjrbJnW
         RTYJ0/nk/I+uhL18YpVW/MyiAZntn5/tMwgNpZ9J9Nk1L4ajtFFKKjPFtxgMwEBUY9qw
         OL70gB7H610ZSmv2VskO+MOOUi86JOU03LInKPUSf53/cLbNChwqpu6/9eSPzcwKsKUP
         LW8sLm68dM75AHU4hJ6v4as6fUkp3xlBf2ELiWMZCgb6dXI6tvGtqCta28NSmfKWHkzs
         ZMdw==
X-Forwarded-Encrypted: i=1; AHgh+RrpGPwPu7LfK5gBbbTI8/ajSNi6OD0KixGIv5mEQ2TRDKYVtkPOtrYdL4hnIF4YZh2UELcZTszc7NSbyFJQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5QMDB/Uy8VfA0FC574z/Ja0jObPka/MHKah4n9Kk73fIiWSPZ
	CJ7V7Y4Eo/vSkfadfmCdnrdCfTdoyNp1aQ1rxdrag2WwSfMjFd6vOtrCFK41g31zmF9YBW8WXBC
	D0UAbYPcil/m5qUPy7q0IHc6BjaxZcKInargL/2XUCDlyMFnC8GqaQeEFRQhPu6fDRgGW
X-Gm-Gg: AfdE7cle575Jkyt9zs82O+XC7C0Y6ynmVb2Cyb7EBkFlRRlGs5Ju8LI+D1sYJtUvtyS
	2TID7kHvHB0et2JgMGLsE8eIjxOiHfzLKFAKVR7hPO8hH2QY0odUpiZxts7Qqh4kEMjbt+/D4qX
	fPshi3muFQ9ARFr07Le8AYD9LKeKzOXCMSbbDKKfFcdvXBo9Qq+b+ZfHcPhxNbRjPK4e8w0c7wT
	laRrTdM3VPtfHlT+X9cziFyxf8iGxK+7SiQInm/ZZwgrw222u45oNUx7Pqxegvo63tE9FvhoH/L
	TLsUFF8z30L5Lg85r3UIET4gSsyILMEcsR2ERRxKJZJGg1lZxSI7ctDkne0FD8EyjLaJQg/yr2B
	BQSTDeIMiAGIG25OXvL/d0gQPii1hVW4SMtc=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr444079085a.0.1783620985905;
        Thu, 09 Jul 2026 11:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr444076185a.0.1783620985462;
        Thu, 09 Jul 2026 11:16:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15db22ed68sm233609766b.35.2026.07.09.11.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:16:24 -0700 (PDT)
Message-ID: <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:16:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B76xptLux1HILm3KSSkY84wHWUmFAVw5
X-Proofpoint-ORIG-GUID: B76xptLux1HILm3KSSkY84wHWUmFAVw5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX8qcoyKEESSXj
 3cgePHQeMYeqEGBStKe2ulK11njlZGFKGn129CsPAuy5KgfI/iPTUZFTm9lKFH4v3d+OCspfe8A
 ks1/YxRcgvvchbcSAkyeFK/gSJvbsxQ=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a4fe57a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=02blghMF5h8Ooo6bNK0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfXyidRSCym8TgQ
 1r7OXrFLBcXFfh6MU3idYCo79l+A/EomhWV+FzcZJgOgWvfWbdXD6RmWC8ui/7IMVE7tfZ+D2iv
 lIOjbRkvo0DfFf9rjLrmPRvtiMJrOVAxbPbbKfEFiqZ/wAKIgzjkukjkR5hcFSpfYVKOp1dQd9R
 sFy2vy0MgyX91uCvd0AB/f3RkE31NrIomVkMedJRmUTYFNHwu3HyfCjiggKb53YMfP2uVdkZOuA
 awyLkTr8iA7Oez2gC/77yhQt8cFShdQPFGv7zjTKgzKEOJbqxUtgChZjHifdjHuss7NUaQUZuZs
 GAmNgclHDbmnDhyOPlHfnThw7XQs03ayxmQN8QrTYz4tTZys6LDe8pnVPF+wtUPjUTOSOoeeurg
 nTRaDvA55CXpWqrLh8TzylWAFfE7s80Wft/ur4XKi/PvFJ4Zqdc8In9Sg9kn/KKX5drJETsNFEQ
 CBjTtithc3gasOoXduA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118076-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B45BD7342E2

On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
>> On 08/07/2026 13:19, Konrad Dybcio wrote:
>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>> [...]
>>>
>>>> OK, I can see how this thread is confusing.
>>>>
>>>> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
>>>>
>>>> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
>>>>
>>>> OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
>>>>
>>>> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
>>>>
>>>> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
>>>>
>>>> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
>>> I think this needlessly increases the amount of combinations we'll
>>> have to keep supporting down the line (with a ton of compatibility
>>> boilerplate code)
>>>
>>> Konrad
>>
>> Fine.
>>
>> Lets drop the bus idea then. I'm happy to close the conversation as
>> peer-nodes.
> 
> It think, this would close the path for upgrading existing platforms to
> split the driver / bindings. If all IFE / PHY / etc. are subnodes of the
> CAMSS, it is easy to play backwards compatibility tricks and
> reinstantiate devices on the fly, pick up only certain resources, etc.
> 
> If they are sibling nodes, it becomes much more complicated.
> 
> I might be wrong here. Maybe we really should try a simple (heh)
> experiment. We have your series which adds CSI PHY as a first class
> citizen. And we have existing platforms where CSI PHYs were packed into
> the camss node (and camss driver FWIW).
> 
> Which way of representing device nodes makes it easier to migrate
> existing platform to the CSI PHY driver, while keeping compatibility
> with old DTs (yeah, ABI, old DTs must continue to work)?

Quite frankly, I don't consider the existing (meganode) description
any valid, and would vote to rip it the second a replacement is
available. But once, not N times.

This is not to blame any of the original implementers, this might
have seemed like the right idea for the tiny subsystem on msm8916.

Konrad

