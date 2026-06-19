Return-Path: <linux-arm-msm+bounces-113856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BALlLHJcNWoRuAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:12:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FE66A69CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:12:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YEqPUls8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="a6/20cwe";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113856-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113856-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6560300E729
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FBA3B14CD;
	Fri, 19 Jun 2026 15:12:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26374140E5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:12:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881967; cv=none; b=W/oU1xWvpYys9bjh4NEGpf7oI/vZ2K+jX4IlcDACeoqXahnSwBP1JvHHrkIGfQe7TRPT5QJKjAA7WrZnhdX3cai1zk2o3wMWv4CRbtPI4lHX0bnDg5m78TmEqYvouTfJkCQWmlIFTlKdegOlvPFhHvCQIHWGwaQSLzAg0oZQmYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881967; c=relaxed/simple;
	bh=GRj1sgqzYGCEgcL3nAikH53kEMjykGRo6DuvwrkeGHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQD+NjPLXsqUyzkp9ueejIuAvEbFK5QH8L/zWC0oS8kOCYQBFm/H86gZDsJbCFyN7ANUahOrvEB1sQ0gfrVW9A0mHTwLF7SuoQEilVJ2YPgi/MneWUfpDrneCIV93ghYSC4IvvC5XAXouQXDZGceZXH1xPNbgTa65U1q8oxXvyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEqPUls8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6/20cwe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDBYoM833381
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7yHqNvHf7zsxMoKY4S/aHvIz1bHIGx2ls9sOtVtBQE=; b=YEqPUls8augKfigE
	aqLZFa2egqWqhqKUNoRWF9aU8/R+a6S1y8pX9bWShu5UAFWtG0b8Wb6fNjfhPYIp
	dVqbm4bA8l7Os0XSZx9TmhNoES6pZwe/SkYUGe0Q7PVrOeHZmLRn2vbn9h72z+ZZ
	O08j+NYonIwsw5yYlAY7sZCMSb7+rQIbdlGthqJqmOVXIkgAS5Q/cYOKJCfZUWx2
	PBQPef2J3RVxNnChf1Q0US+07rO5PeL5eRi7KGTuSAlD5lJCeOKax5p6sp1dGYT4
	wyJ43C4uzcUTU8h7Ts6BxKz99Jel+C9XLDg0N2d2mHHacVaBaostBnstVW7tNcgA
	akcPXw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtjc3fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:12:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-72845b7072aso130535137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781881964; x=1782486764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7yHqNvHf7zsxMoKY4S/aHvIz1bHIGx2ls9sOtVtBQE=;
        b=a6/20cwe+P8G1Sr6ZhggdCZbIdjBqNsq3qGR/2wdDWlWLUlvqbdIqtZqeF5tuXO5QS
         cNVSfZDenzm9c3+hUL1ocbWTyH1HHO2Urm2x+dlYKfYLYdiqqJnxuDXyWzyX+4mrHW96
         eg3TiK55d/cOq6SKF1FzvhSUcdPgN4+3T3iKEKQ4iKA3kCcLjTOeNFKQt6B7WMugclAc
         9G3alnkVXEMF5uZ48zGA7vyzPQ2Stf0TxbnZrUJ3Z7djvjWqfdqDLBggWcBUH/VfZZlV
         xhEEBWncmSaMw6+py0CfWHwuAMEN13B4QQLS/ccP+15Y8A6fdM22sbk/I9S9BqEAGqJc
         ys3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881964; x=1782486764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7yHqNvHf7zsxMoKY4S/aHvIz1bHIGx2ls9sOtVtBQE=;
        b=q1JT51M0eGvTs1tzFmMqcW8m3vme28tMmS0L0glVOkAtwrWPjkWibmAgIC96AfE0fM
         2NRqbDt5/S5bcfPgtHWdQs6wKwpzylFvqCY2Lr43xMRVlZ/ZUUcRC8fSBZD9kxPEH8rj
         gfnUpevILG7wTSd6/rDi6VMdI+CEhjn2BjbMWDHUbiaXpn3GvEUZ1cx/n+CZJnO7tSDo
         WwRqZ5GLYwTvlL2yS2qPw4Y9/2pt7kTr6Jbq69gO4/O7IHr8e9GARVJdDJptoDEF8gZd
         wCKQmlSJHgqx6uTRPmcDUIHPIpIrGe15+mHUe41HSCm/30M1C9BjLVvzkeQ4bzxIjCpw
         1+4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Jz1Q0bZzGq5uGkMlC6sQfG+YzvWNlhaMc790s5s7cuVY+kADfC23xmNfHwWXbVDUyutiodkJMsAqCVoEU@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEkSDvd3JMJ6yOAzrOEKSi91T2jfoXdocYli7ZLxiX8U9NYGo
	meiNvaXc88NmhCjtpj5+rrOq6ulgruQz+CYG67JnlrDXcWA1BDfsBEzOBWpv/uuum0sLdHk05hs
	LHexJaKDO6spTi44fI3g3hmZKh6naBeWW7okYqUrRaKqEC74pW+/DixQDJ8/+zA2J4JQz
X-Gm-Gg: AfdE7cmrwMTnXIsVgfIbbRvk5+XYYQNeIrqo6Hd/w9hp1+WyUhItB0jfTKE/oK6hF0F
	CfHpNm12izaTHA6uYAsCThFLZTHFm8onK/1x2mX3uo6WcdTIj6w63xVPmjtzZLBVtqT/PyFLDXy
	FRd9z1snwFEcCwVDzKhRyM90jmr3sFI10SBv0ehnlwThmEBUAHP111SBzkjny2ekGgneNKK2gVy
	GkkVaGTmf8qpqenVql4WSut121cUxNYNzF2Z4xj6OesicRXcKRJjJ2zaRLFmVGWHKU0Dflkcb2b
	dubOPFR+p9anADKDjzTijDtlosroVQwUatZqk29AtsaOY3fTXqmQT+fRLsw0jK7Elt3QXvpfvzk
	NuX69XFWGcqrZ/8+pMxwzjgtvRkhlAvNU5lw=
X-Received: by 2002:a05:6102:a4d:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72a010296bbmr1121382137.2.1781881964366;
        Fri, 19 Jun 2026 08:12:44 -0700 (PDT)
X-Received: by 2002:a05:6102:a4d:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72a010296bbmr1121367137.2.1781881963829;
        Fri, 19 Jun 2026 08:12:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696fbcbb9d8sm946703a12.13.2026.06.19.08.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:12:42 -0700 (PDT)
Message-ID: <044c0fa3-4793-4907-9058-347263511232@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:12:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
 <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
 <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
 <0947e485-4619-43a3-a127-5b887780190b@oss.qualcomm.com>
 <5vfu3h66pelbhzyfqnagxg2j6r5mn7jupx3nmewt2zsggfa6sj@ttqr775cybxa>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5vfu3h66pelbhzyfqnagxg2j6r5mn7jupx3nmewt2zsggfa6sj@ttqr775cybxa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfXxenLUUVHe9p3
 8nHqonso+iqB5QM8nQTye3xf+XzrJGzlqqeFWDToYBYpB4L62cF1/GM+UUH45gnlaY0R/W13jyK
 l8FtOBbYxlMQIhhfmqqkgDpOOAO83cM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfX5W332caElZbM
 II65iDWVQUMpxAipH5bdnJcNHrVsaiUzXWSjgVXCAk5qIxkbw5UZWqa0Zki1rJUqmQuy49tpnpG
 2Lo6imxeuJqJjk2vg1bhwXXt7IBC20wpqcR8R89zsvpH7hZb6K4emuoDVc7iF1Cgf6SFyesWXKJ
 3JzvzHYZGWoKcI/mfvSoAgHyU+EWIEf6yzruR4r3zDKSmESfXRMcNPdtINE7nEgGQ9SULDHHiAF
 +ybdoK1QKtE9/y+N/H75VJr4ixP6jKUuYhsJvkvlseqwgovpJcd3wALpQmLvxi0lUy3oR4W8pqU
 wxXhijwufDKVdd0GhzrRh2nNge9Nf/zMqQeZG0oysYr8SlTXEwjRtUs2QZ5fB/t/HtS5jKacA97
 pc1weOWfd9WiuuBdcAm7Rzl/u6cmy5o+bqJJgldo0KuXm0dsyuKDh2QTNEN/oamgWx42KwuJmjt
 G0ArdLTWNeMadjHYLeA==
X-Proofpoint-GUID: FVrvaowW_IPf1BWk-xHNHIY7IeTsKO2g
X-Proofpoint-ORIG-GUID: FVrvaowW_IPf1BWk-xHNHIY7IeTsKO2g
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a355c6d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OOGWXGrbggnT5pNHG1IA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113856-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09FE66A69CB

On 6/12/26 10:00 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 03:36:20PM +0200, Konrad Dybcio wrote:
>> On 5/17/26 9:16 PM, Dmitry Baryshkov wrote:
>>> On Fri, May 15, 2026 at 09:06:21PM +0530, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
>>>>> On 14/05/2026 08:22, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
>>>>>>> On 07/05/2026 13:37, Krishna Kurapati wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 05/05/2026 15:57, Krishna Kurapati wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>>>>>>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>>>>>>>>>>>       1 file changed, 2 insertions(+)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>>>>>>>>>>>> compatible. If not, explain what is not compatible.
>>>>>>>>>>>>>
>>>>>>>>>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>>>>>
>>>>>>>>>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>>>>>>>>>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>>>>>
>>>>>>>>>>>> Hence, I didn't use a fallback compatible.
>>>>>>>>>>>
>>>>>>>>>>> This still explains nothing. How different clock makes interface for SW
>>>>>>>>>>> incompatible exactly?
>>>>>>>>>>>
>>>>>>>>>> So I went by the naming. AUX vs COM_AUX.
>>>>>>>>>
>>>>>>>>> The naming does not matter. If the clock is called
>>>>>>>>> "no_one_expects_spanish_inquisition", does that make software
>>>>>>>>> incompatible? Why would the name itself matter?
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
>>>>>>>>>> clock-names mentioning "aux" ?
>>>>>>>>>
>>>>>>>>> I don't know, I asked what is different in software interface.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Krzysztof,
>>>>>>>>
>>>>>>>>     I checked with the hw team here and found out two things.
>>>>>>>>
>>>>>>>>     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
>>>>>>>> regulators used) is the same as agatti.
>>>>>>>>
>>>>>>>>     2. I thought we could use qcm2290 as a fallback since the phy register
>>>>>>>> init sequence is the same for Talos/Shikra/Agatti. The difference
>>>>>>>> between Talos and agatti when checked in the driver was the init load
>>>>>>>> settings. I checked with the hw team and they suggested using the init
>>>>>>>> load settings which talos was using.
>>>>>>>>
>>>>>>>>     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
>>>>>>>> fallback for Shikra.
>>>>>>>
>>>>>>> Then I do not understand why you are using qcs615_usb3phy_cfg for
>>>>>>> Shikra. You say that the initialization is different, but you use
>>>>>>> exactly the same initialization. So in a meaning of compatibility
>>>>>>> between hardware for Devicetree they are compatible.
>>>>>>>
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>>    There are 3 things:
>>>>>>
>>>>>> 1. Clocks used:
>>>>>> -> Talos supports AUX Clock since it supports DP over USB.
>>>>>> -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
>>>>>>
>>>>>> 2. Phy register Init sequence - same for all 3 targets
>>>>>>
>>>>>> 3. Regulator init load:
>>>>>> -> Different for both Talos and Agatti
>>>>>> -> Recommendation is to use Talos regulator load values.
>>>>>>
>>>>>> SW interface wise, shikra is comaptible with agatti. If we use agatti as
>>>>>> fallback, we would end up using the platform data of Agatti where the
>>>>>> regulator init load is not suitable for Shikra. Hence not using Agatti
>>>>>> as fallback.
>>>>>>
>>>>>> Coming to driver changes, I used qcs615_cfg because it has required phy
>>>>>> register sequence and regulator init load as needed by shikra.
>>>>>
>>>>> So is it compatible with QCS615? If not, then something is incomplete or
>>>>> confusing. The driver uses the same software interface.
>>>>>
>>>> Sorry for the confusion. The Talos compatible represents the USB/DP PHY with
>>>> aux clock input, while Shikra is a USB-only PHY with com_aux input clock, so
>>>> the two PHYs are not compatible with each other.
>>>
>>> According to the memory map, there is an (unused) DP registers part
>>> right after the QMP USB3 PHY. So, sofware-wise it is compatible to
>>> Talos. Having the different clock input means different integration of
>>> the block rather than the differences in the hardware block.
>>>
>>> So, the block should be compatible to qcom,qcs615-qmp-usb3-dp-phy
>>
>> It should still carry its own compatible though, to let the driver
>> disallow powering up the DP part
> 
> Why? The DP part is there, in the PHY, pretty much like it's present on
> most of USBC platforms. I assume it can be powered on.  There is no
> point in it though as there is no DP controller (nor DP pins).

I wouldn't bet too much on that sub-block being fully silicon-validated
given its of no use as there isn't a DPTX onboard..

Konrad

