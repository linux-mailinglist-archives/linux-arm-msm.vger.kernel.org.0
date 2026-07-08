Return-Path: <linux-arm-msm+bounces-117620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VS44GhJBTmrrJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:22:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C747972643E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:22:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Uvw/lvtv";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gaUEnlwA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117620-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117620-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B11573092BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C19543CEEF;
	Wed,  8 Jul 2026 12:19:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2643CEC4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:19:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513153; cv=none; b=dwfKrob9m3aNSZon6Zc7uW2Tt1CeCMQrXGjwEGCI3q+SC0kAy1ERkXB26PETx9oavcvC+HmHlwln8v01uze1xcb0Ui0r3XNX1t30+qoRhPav5eeXUTe/6jT2W2Z4mPRwOQaOjLEiqNYJkczQrO2e9l1fjSSEkD1uMYNwOMKJZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513153; c=relaxed/simple;
	bh=gPGpInfCJ6WsoYHEKSt3twT3UDTC58WmSefrK7jcPEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/ZfjIyOJLI34nIHuFTAuPVkTrxFEPeFZFSOaWGar4cY/CKAfBPSUUVtirUVnQnTtqPAX4TcOG2oj5ZgGpVEYvboqqAWq2knXn9od8cYrupMWx2eSYu2CY9H8WtFEkt17vVjt9M5toV8TS58HtEAtjVeq57XVTCpxG4PqhEblaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uvw/lvtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaUEnlwA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C39Um2605301
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=; b=Uvw/lvtv45LRcvCN
	zECuZeMWRuOYeUqqkDaKNBLJRSf83grZmWr8jYCWYSWiuK9bZKffmBxGDc1y/4pR
	1p2H63PXKjpXnx4Ym72/AG8+ugpzLnceYYWhWBqHmWZiSowV8zHaiC/VTNlpWP4i
	LAngysYymtFcRHghxSDPrsZZ5cqJaxsiyyUKg/9zpdT1v0zNAoWOKbESoPhQOU8B
	xDDT1j3zJN9d2E2Lvokqq8JPKuUPOrgDDi/AaM54wH11Ki8wQxlkZgjxbyDfAXeY
	YvWQ2TLtWokIk5Bt0m3yFQ2laLQMPbUAMPT2WezczOjHF+APH5lfyjmPVctgOI32
	+zOGBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5ajkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:19:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so1722101cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513150; x=1784117950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=;
        b=gaUEnlwAkUO1DevYYF+y4UAj65fWqr/a7oHahkQwqks9mJecl/Exz/zEYv1R2pgKpv
         UQZbMJUAld63ySqEgl7ue77oLjoEHCFFXjc6tZOiLYbCThYhL2B43PMhh1z7g0osD08i
         II4litcwBtCP02h1GoqO0YUi3YzZRWLuRII9mdPDTT20kc/dWSkNHiWD82s56EcvYzRR
         8pKV9we7QVhDozSfn3MXsnZemNYpfooWTJKv87S3BxqMPfGR/qq0EfyQi++M85tuECLx
         9GxBqqUY6GvoULSVkGpLNJ1ukaR/bLCoJfbdTG9Ygg7dojEf7o2rU67n3YyRJ/AdFz7N
         TfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513150; x=1784117950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=;
        b=RVJNZc/RUIyl8a5qOD0i4sp4qiUtJf9mD/uEjR+UnkxGa7ban36FjG87PU983DgztK
         vwk4dz/eWe+tZaqJu0yEl817ZKRwfqxdT2NhWQ5p9ygZYQkO8BwgRwwFaHCnKYR9jXN8
         +TBp1tkfP8N+lflfyc76cklCWUuPm6YdAZRZcKRu9j9l8ChW7+RcBOV4x8MG++n2beHL
         Yho4KKYHo8++9Zrj0SXl2H5HGYgjjst8SnQWDr68q0CMuH3wl06dY+dGZMOzseZnbOWp
         ZaYFw6v2TuOeelH4vRBHqVFxOkFmJSRP6Kt5qxUFHcMIj6LgUHY2tPln8FI5u+lbT8YR
         CgXw==
X-Forwarded-Encrypted: i=1; AHgh+RoCxv3IvVtgUjUWYSCtEXz/TvTyCS0wMpEL8z6LaePDmAMnaNsfFZyVqdKhVNC/Pw9pJ9ebyNHNA1OIUzpr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo8M6a+SxigYbwh89Etv/udX32yUa+Pw6IybgZfaj/6dQqpcA3
	a4/MmaK1vIOcrTtIb1m24ZNoSHUpmwqzTS02G4q+HqswvCNNnyxLlETb+jHajZEk8mCEDUSC7OW
	lnqH1bwDmQ4qG936BOql7SaGp8si8H4aCEBBpPOqipJdEPqUC+M/Ec4wZ4tt0rqT9B4Sd
X-Gm-Gg: AfdE7cl6c1ZEcj3E3OjHmtGm5Tw0As6Wcrcyyc6o+gQLW5YfbNJwa/UduXw9baIBndz
	aoRV3x/oWmBzfdXmYusWfAFJkMtmRC7oTgzS3Nvd6m16GlCdmO8pPhWbgBDu7VxKYkqRsWNKGeY
	SaqNiaWF0WW0P1TIc+pNI7IjthHxVkEtMfzEsAsVi/a3VDhv/Ntg9Svmmd5dtxDNnkRtjjM2Fss
	QJp7g0GR+ydxv8cN/547+WILSPFTxyLMQ37lhWhBO7tozSM6pi5SwhA2/1qNMGlDuxi5Jz9Cc5O
	Ass7tlhDMShdbFfTXXCijD1gOCj8zR+5ltfB3Od0UPXgeyU4lD1GzmCMqneCxZmM7GSp6ozIGmi
	TnOD/SNe6b238Dyn31a5FOVg1ChDB1j6WvoM=
X-Received: by 2002:ac8:5dcb:0:b0:51c:2324:666 with SMTP id d75a77b69052e-51c8b4333b7mr17388371cf.3.1783513150194;
        Wed, 08 Jul 2026 05:19:10 -0700 (PDT)
X-Received: by 2002:ac8:5dcb:0:b0:51c:2324:666 with SMTP id d75a77b69052e-51c8b4333b7mr17388031cf.3.1783513149617;
        Wed, 08 Jul 2026 05:19:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c1470325sm160963866b.14.2026.07.08.05.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:19:08 -0700 (PDT)
Message-ID: <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e403f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=y1t4v1gd98P_d2K2kl0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX5EmzhSrK/7A0
 FM3MIyNyGe2c4jVzgxFNUFMefdVxD59W6ZzdKGQ8taaqrIfv8XYa4Sr6Bmp51sgHF3N8WwUsFmh
 nIuZG4OmDG2zJndyZXNKbHjB0gBvUA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX25fV1o+aX4PR
 8MeDGuMKZiLZTbJrwLRJ5ClS/sR4rR+ze/hvWmRGAgOwCEWlteLBRT8uszDRplt7lbU9Rp2Ump5
 X1gOumZakVLImPT+n/EMr2NcG05DTaFeJU+atU2LeAVPopaMCgHuczpWhht8ZhoKCHuWeAZH5jI
 8oxQjLE/y4zpf4l/zarWsYMYO/AvVven+yT8pImrrKAjDj8Ll8Ofe2xvrvOHEQ5outlSFTK5jB4
 jEJvTtNAA+s3xjShQYdcyX/L10Ua5Q++rtXe3IchktyrB5uB1dSB9L9abzLONvJa1VjaaZsE0GA
 ndnSojkITAFSIOa1hHTUX3VN/a598gDxrse+bYEhG1eyWq82JE7KHaX/xXJ9RyqiDudE4I7z4ud
 jf/vtj1YJGW+9mf8lL6G/fRZ7vUpUwwezl8LVk82iwaDZwQyS8Fkqn/SL/ZKfXeUzGv6q8fPqKv
 BYDuFD2p8JRUZfMH6rA==
X-Proofpoint-ORIG-GUID: _RL6jDeB1XOxXMU7_6zM_SXDBhn582MP
X-Proofpoint-GUID: _RL6jDeB1XOxXMU7_6zM_SXDBhn582MP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117620-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C747972643E

On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 11:11, Konrad Dybcio wrote:
>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

[...]

> OK, I can see how this thread is confusing.
> 
> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
> 
> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
> 
> OTOH we _want_ to make the top-level binding into a bus, we've discussed that several times.
> 
> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
> 
> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
> 
> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.

I think this needlessly increases the amount of combinations we'll
have to keep supporting down the line (with a ton of compatibility
boilerplate code)

Konrad

> It means we can work on splitting apart the existing camss node in isolation to make CSID, IFE as peer sub-nodes.
> 
> We definitely shouldn't be making those sub-nodes dependent on compat="camss" but they definitely will be dependent once we finish making compat="camss-bus".
> 
> When that is done I fully agree TOP_GDSC belongs in the bus node, like MDSS.
> 
> I hope that makes sense.

