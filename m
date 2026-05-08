Return-Path: <linux-arm-msm+bounces-106636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJMSLa6+/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:45:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B84F539F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D67B43057897
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6745E3D1715;
	Fri,  8 May 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPSKZGx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtH0Q3fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0F5355F2A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236843; cv=none; b=bxphfKsaWRGSffZGV91PQpffrxV1aaD5ETjNroemdSMW0PrvfLhE7a5BZrWaNJeugjGdbYPoOK2mEze2Jq9oBPQwlOcmHymhk1WA92rVWAVjoQ3wmtA/5dVXz83jF/ilnjsP56S8aIAk5YSajR/Kwag1+QU+239eoTWZpi7sW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236843; c=relaxed/simple;
	bh=+T5+q35cuY+NlFHqqyvjfWN2ynytkYaXlJr0sE2THbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWi7ackKT4ql1GHwp/XR9niXKpxDVxDTZ3KbqDibf5xd/4YTxq2AARvH16gwv+e/KSpClnUlXBI4XwO5DsXAkB5/F40Mocs8ttR+KhR2779T97fNaQFIL+XGa4uZPoFNCjnIGDcUbBlOLnps/rivCvOV0wvGgjq2kRFYvsZOrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPSKZGx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtH0Q3fa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486K6cq1174056
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5N3bycfk8K09CTomGGhOd7ne15WBNfddTr96uzcofg=; b=oPSKZGx5tBnbDKsm
	4OE2mQdc2f4NHlzRJJsjHCJOjxHh07cEFC+bFvBUsWRCWP+VH/p0bsWKoVd121gu
	kOnecTshvWo1+RQw1ygQkkGVzvLAfkGZ4KtR0G+tNzfjSxKZc8+i52vbXixFXOP+
	0t+7vRb4u4xmiUhvqPjr6crOQ3qOSIq27lvpsM3VkduGFWxTKs8nEOQA5slSqXtK
	B9ZNsh61Uj9yT7Gj/suKVzoOUZL+XQHlNZhKI9HVbVfopwGx8eSBWC6x6XQ+eSFq
	rRvBC+znikk8zqxPnmMnVU9Df2zZesCj3xDmdv2CIxhFlDeCqpEOpAG84VEtnHtM
	LJZ9bQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hafpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:40:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313443ffa2so106067137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236839; x=1778841639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5N3bycfk8K09CTomGGhOd7ne15WBNfddTr96uzcofg=;
        b=DtH0Q3faRJoyF/LxeNfyb4NdVYXw2YFBjfovexFVKMh9Iu9v5iStN1As9Lx0VtWXmQ
         SEkkP2h+Vf5DV5jMwGFNr+isV6FpcSHgW/PfT6In6zQLYnRc9VV92wCunLUZAmcp2jm2
         lsPpe/fuaXqhsydtXPZJE8L1z3E2QVGZVTTQaTJUn7K6/VQg0cz+so2LrDVy2Oj4p4nI
         81yaNig84wMyWsN1CfOxvv8advQiq4kEGsKWDy8OX0SAyAA5WYGGBQClklAt2JcJ0UqB
         NGSUwD9owrLzwHRjAD9pzpey72n3NhSYD3/U7MlFBq5TFBZPhG2fYP2f04RZxbBmMIJg
         2+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236839; x=1778841639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5N3bycfk8K09CTomGGhOd7ne15WBNfddTr96uzcofg=;
        b=AcdsbDYzVCwQTpI/pj3HOZNTft62pR9O0DXjdWOOugcImJMPJOmE8gSkrVUccoiH8e
         xxe46A85jKSKSFK90dmlNa7OdF/o/Ns3+N6pgaL+P6LoTEpYEn54UHAvNgvWzRJNMjhi
         olNuyoN/kDR4GZz6GpFU40+KotjQoO2z1dI8SFmwNsO/AqHV4juVyYMexDNsbY297LQz
         0IFEJqpwicYnQzdI/hlua+qD43msTqt2UKxhvtjGqslttjhhndcUEyFk/IThhZcGs2sM
         bRCl5PJ8xqAvCW1eCE5Bhz5YfizrzYL1ZObNsO6QAbK0hN3wZ36adMViKm0zVSYKTZZF
         tguA==
X-Forwarded-Encrypted: i=1; AFNElJ+Tx26pUoXO0b8jG9Tp2fl03mIDU+eGwn17hPR5c29wnwVCAZrh2/LvjZUcGhCpeR02ck3RV2SyuGMtSH6F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rFrAh7EQJamVixSJB06yBEOw5XtDEvVG6SC7FdJrUHrvhVJK
	LmTssOUKN4w/1SwUWp9qSbo6sLP6chJQD7pHVRbjmMMnWGHBShugvWkELLS1IvboTl9AJfue2cU
	7iN+2bU0XZDB/rdwHJg2K5KQT6s6swxh+kqWa66o4bLflG9w5Vb6u0tcX9m1bCE8wfp8/
X-Gm-Gg: Acq92OGLng9DCfDo9vicNqZnZayi3Hr7RM/4pAjucexno/6a7elWcd48ubgjAlDhxDQ
	h2WLp+fYkhzFLQ1XJoTluycEVwJ/NGfGVlRZ4VeIbmtdyQHQzFu64tqxS8Ip5LrBswPP2C59Cuy
	uq6WzybHOCmP+qeDowbvWNIFohsx/aviEJO96fN93U/2lnwvnkSVpOWE30xmkNFCnLdzUCahghm
	olX76xFXu0gXSrm1g+QcUtuXl5iHFmQx2SQ4wQ++gXpOiRsjGwCNOcuh7eJph4t16M4CeM+iWhU
	2VeGdooEmeIRhcH7iP9E4FGGx9CM8fiaZEVbBAtgS3VpfYyfIHM2wY0VZSGza/ucHhzHqDAg1zr
	rnTNViR51bgVV4M6dEQrXi3nN1W4LNv7UmECxaRk6yvmiPTX5+9QBrZ/bcswk0pSUGy44T8KAM1
	vspH9LnZzBkPCU0g==
X-Received: by 2002:a67:f50a:0:b0:631:3ccc:42df with SMTP id ada2fe7eead31-6313ccc5619mr248411137.3.1778236839576;
        Fri, 08 May 2026 03:40:39 -0700 (PDT)
X-Received: by 2002:a67:f50a:0:b0:631:3ccc:42df with SMTP id ada2fe7eead31-6313ccc5619mr248405137.3.1778236839170;
        Fri, 08 May 2026 03:40:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac435a7d8sm62577866b.51.2026.05.08.03.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:40:38 -0700 (PDT)
Message-ID: <ba499581-9cc3-43ba-8b28-6f984d2493c9@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:40:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Add minidump SRAM support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
 <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX96TSWXTDaOdc
 TpaIPsXigGrod6bDyK5iCh+TqeQv3UFU5H18MVpnN8SdKcviweoVrhocX0vK2j1qhcGxPeKtn8f
 yazSIlapmA7BqCWlQEk3Pb0zqdVR09OTtIHmAvkpCTZFcxXg2oQVbu6nOgACaYxcbM4YGrocLkA
 0M1NQtp6ADd+l8cTAu+LKVqqsND7mozq9McoRdmWDUGXa2KPDcjwi6TPDa+E7gYOcqbOugE2iJf
 a6zmvRtHaSZWJ9SeN7mxPqC1t9eP4BkBFhC6pL8YnVP0o5LblEVZYCLZNKlzdwBBP0ygtTBG4pu
 u0GmrhKXfHLta/e+GrbrWlAC3XzW+ncuhPIpAvbxKYvoaVpFbGdcLGFqthM6aWun0kxXynbeclt
 GY617tmAzj+GFDt6kpkRaSXPxPTfGFnKEOOIp19FtJkH4QPdlL3U1xJrbgaUW1wDPpkEzj5Fv/n
 48P/myW3s17czcXmJHQ==
X-Proofpoint-ORIG-GUID: X4k_iCVeaqCCugaj4nAmymlSLipP5Prf
X-Proofpoint-GUID: X4k_iCVeaqCCugaj4nAmymlSLipP5Prf
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdbda8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9V3Mjwdm6-WKsCrvSMUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080110
X-Rspamd-Queue-Id: 001B84F539F
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-106636-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Action: no action

On 5/7/26 3:50 PM, Dmitry Baryshkov wrote:
> On Thu, May 07, 2026 at 01:37:19PM +0530, Mukesh Ojha wrote:
>> On most Qualcomm SoCs where minidump is supported, a word in always-on
>> SRAM is shared between the kernel and boot firmware. Before DDR is
>> initialised on the warm reset following a crash, firmware reads this
>> word to decide if minidump is enabled and collect a minidump and where
>> to deliver it (USB upload to a host, or save to local storage).
>>
>> The SRAM region is described by a 'sram'/'sram-names' phandle pair on
>> the SCM DT node. If the property is absent the feature is silently
>> disabled, keeping existing SoCs unaffected.
>>
>> Expose a 'minidump_dest' module parameter (default: usb) so the user can
>> select the destination. Only the string names "usb" or "storage" are
>> accepted; an invalid value is rejected with -EINVAL. Changing the
>> destination while minidump mode is already active updates SRAM immediately.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---


>> +	if (of_property_match_string(np, "sram-names", "minidump") < 0)
>> +		return 0;
> 
> Do you actually need sram-names? Just to verify that it has one string?

I requested that, because SCM is a very generic node and index-based
lookups would age like fine milk

Konrad

