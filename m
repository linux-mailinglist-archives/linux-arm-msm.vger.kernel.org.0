Return-Path: <linux-arm-msm+bounces-110812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +No7JjfiHmqVYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 16:01:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6262F1BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 16:01:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oCo7FMfK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DuxENL3V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110812-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110812-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 750C7306E1A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 13:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C423F3E6DF4;
	Tue,  2 Jun 2026 13:53:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB453E5EF7
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 13:53:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408428; cv=none; b=Svkescp5iEAc45gUT8KWgxTJWwGjvc1MOajNmVdmgTiSHQvWqirBxiOU/OcSwH4TiS3BF5ssSeeAhC4UdMhtB/nBlrCPtqiShqDNWwG3FFMkVHiQ+ybe69yW42+vyDwgKl4GAKZMt6/fmDtuJcDwbAkr06Npsui2dftf2syWpIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408428; c=relaxed/simple;
	bh=g0W1PyzooAtJ3scJ3oC1HLYrSZOEKQZ6lGmXblvMhfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XF5Ja9PxzUiApsdNsmgXQaGVGdavt11GaB4zOl2B08FLvUNqijbulkHy3OuDjEbRAPP1oT186iBA+TqXj5bnbRZ9AGmiAKM8lbbP+WbVsB/ekm477oUTKv4Bv9y2v/WhKdMKvhMSyh4HxgQNQueqSJ3T+D1Sxmomv0SMMcFNE4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCo7FMfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuxENL3V; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CVTu02885067
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 13:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mb77+VbDY/WZt4TrGoR5MtuoBG8W9yZaYbwMG3StSPI=; b=oCo7FMfKvLe7P1eJ
	Rx9fCO46e8PCGH3r9O3boH+fhY6YKQnWiuB+8eboaHIdSMVt3ZSaoc814+VDTdID
	10D37B5+yJT9HdjaFGABToADZQaZdXMFJvvAUsAGpv8chaKTB9OcG1d21fnjkEY0
	rzEwz6oK5ug7AF18VVUhHbDCwkKUcbcgH0fBGskr0GVOW7BrJjf5kShYv0BhOyJl
	HCRv2hNQyTpkp3wP6/3kjmx4YqWlvUd3lj+Vw5fDp1wx2CC42kjnjTEmhnktceJE
	IFCLSGtiJVjiF3yMgDGCvmmF4/Fs6tDS/TUiGUXv6vzIOZrDEYVHsQgxTB3evCj1
	+M70VA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu11na0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 13:53:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf2bc4371bso28524955ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780408425; x=1781013225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mb77+VbDY/WZt4TrGoR5MtuoBG8W9yZaYbwMG3StSPI=;
        b=DuxENL3VkmBMxf+tirx7eELKJLp6+8SUaWkQzmgmGSdXz4wMoP3f0Az7MEKYF70fFZ
         DIybOs0w/Pql6Gt0Ja3hV5Cl5ID2KVVVXeTptspua2MK0+mZxesAX6CmSZqFDFy4Y4x3
         DBbEo60QqWFGXxv+ScQ9JhkrZKDgJPhc4wS2dNHgI/bOjY6AHeXGlgPSBZ41xSHRiHRY
         u8CTCIIGSixZVe6ICHSymombTKtVNyNOEhkQHov48ZEU4o2txH6Hw2El2gZOoXKfV59v
         LqZ6nv24vvkK5GAu3R5JhN7FHxzGwiaQl7YdEBVVtVJqmEdBcwQyR6QUphQyMGCbRp/u
         vzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408425; x=1781013225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb77+VbDY/WZt4TrGoR5MtuoBG8W9yZaYbwMG3StSPI=;
        b=aluK7r4xdsL1WzYMxF+1RzFdnZAf/M6UtXJA4gT9FSoFnnxUNEDPSH0yECEXO2+Owk
         0YYPa/bhHYYlpP7pXK4er9BLvUrhkM6nPqfGa5Ydx5eByJVj8pP/FKr8B0u9zvY489qb
         NxhqGylR7Co48HWDxOH18oR9DgpXUKdcUtxVZpYa6nQJrMie84gOjJRWndyFSfOL32Ap
         167ir8gI2NSMeNVBfTv66nJS+mdAAeY6O4hJw+JZMC6Lb1vngoPqLYHIxrtZVB1XhwC5
         eMmiGs1F7a9AsTqIJuIe8avdpJ6K+/EdYQv+j0Zt4sDlb20rE0v4oLaDz3DWotVtH79g
         qD/g==
X-Forwarded-Encrypted: i=1; AFNElJ9jCJRztYiGLJ1kVgXf0HAXZUYl4D36u9Eek2+2BXCCGNGZG3Vply+j79Po1JF0o9P47SWaA7vA5wJDU+2I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PWvCAe54OM/KdIDwAfYfMStT3fb7TGcw7njtSFRkAJPTDBkj
	QFXw11i4IVSRLyM4bV2sDiebFenM+DXMWlvZeMkweEUxuO9aVJ6L/eJjjhS7T28HedTiCAD2TTy
	8CNFaTot08s+ZWG0DHoksYHv29KYst1Qrd6bV5QU62BNdDUfW5bVFRYDuR1weL5EZqhQ1
X-Gm-Gg: Acq92OFBQo+uXahJjD7CSyErvVSSaPV2pY01U+BPcsO8YZ9OYeDjXGWLDlH9At8s+2e
	gY0uhIscLe24g/zp9xCdKTTVFh4dXtBoYA+QR2iCS4nxA1l7wBmqShxB6v8lojWV5pV3IGvQx+D
	MdoE7lTCCuwoPfs8zGdvIiV0pFtiZQZ6lts8sQUkL9eD2XlpKTog1J/DXGS8IwRfUKjbIaxAd3y
	MHPxaaBWSOOfa1BB5W6iT6N1noeaVqTCXEKaU4sVAxAPAmVfJMVrcus7c1V40BXLa2U+ort2lMk
	O3skAL91IOs7XdcpE2ko9IInxPMnwdHQsiUKPXlsCvDEcQfIC+7A8Ul1Yh6o70eDT4L6JpvQ5xL
	e4baeSzvULwBxWVg1l9tDlZVxJZGhMwUaARYA92njcAc/r4t4tyJ/f8QVLWGrQd5xlIdpykjnmo
	zEl1sIQpalx4y16pQMNDfCJz4o6fiMt+tM
X-Received: by 2002:a17:903:4b4f:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c10ccbc173mr33528925ad.14.1780408425513;
        Tue, 02 Jun 2026 06:53:45 -0700 (PDT)
X-Received: by 2002:a17:903:4b4f:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c10ccbc173mr33528655ad.14.1780408424988;
        Tue, 02 Jun 2026 06:53:44 -0700 (PDT)
Received: from ?IPV6:2405:201:c416:5052:81a2:4375:a071:12a2? ([2405:201:c416:5052:81a2:4375:a071:12a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0751asm143976745ad.55.2026.06.02.06.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 06:53:44 -0700 (PDT)
Message-ID: <4bf2e9eb-f015-48fa-bef2-ba1a58413e3f@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 19:23:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,shikra-epss-l3: Add
 EPSS L3 DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-1-b1528a436134@oss.qualcomm.com>
 <20260530-victorious-resourceful-muskox-cdeadb@quoll>
 <afeab8fd-6951-46a3-8b92-9c3b7075949e@oss.qualcomm.com>
 <709428ff-e732-47b6-a6db-b26cd9149c98@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <709428ff-e732-47b6-a6db-b26cd9149c98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Zo9oC5JgMMw3RuPhONWPwAHL5Rf9ePw
X-Proofpoint-GUID: 6Zo9oC5JgMMw3RuPhONWPwAHL5Rf9ePw
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1ee06a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=FhBE5UMFHDhWvMFztzwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEzMyBTYWx0ZWRfX2QJqhAuz2Quh
 /CMT8rocqeZEHv9eFSxH2JVbdw7XDtAOL4KyVKTvFBxF71n55rPtl8Vw/a+El/Wu8B7DVz8reYb
 mTG1eSysJjD3fwozM4bta++bzOAiVJWXorbOICgi7KJWOh21D8nypYbFmvN993HZk+E5eHdGyUL
 EF5rS9gomLKwNZvJparfILP3G9tVhG48ijy0jEP8guzcURsiHeqfeNJmbQax6two8udSUBYx/m+
 lW/rQ2rDpF5NqYJgyMhHq6VKnYM75hWqXlDYkcMJfj8FOXxLnQc3wVT1WYEf7I8YAQNvBz4CY1o
 pe0Mn0DlzfWv5RbuQVzNJ7D85SHXiH9a66o0TEXhtIHGW5F+ARRDOzpmhSjb7ABcvvkllxsEnB7
 XJPXrj4Et8EeRTO8euDcoeNQSf2R2zoUKzk7e/WoUQUT6kFkUYhiHrTet438sDAYLraoFbBsxHF
 3MyMMQvTKzGRZlREtJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:odelu.kukatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AD6262F1BC



On 6/2/2026 5:29 PM, Krzysztof Kozlowski wrote:
> On 02/06/2026 11:27, Raviteja Laggyshetty wrote:
>>
>>
>> On 5/30/2026 4:38 PM, Krzysztof Kozlowski wrote:
>>> On Sun, May 24, 2026 at 06:03:35PM +0000, Raviteja Laggyshetty wrote:
>>>> +  '#interconnect-cells':
>>>> +    const: 1
>>>> +
>>>
>>> I do not see any differences against OSM L3 binding. Why isn't this
>>> device there?
>>>
>>
>> The EPSS L3 on Shikra is similar to EPSS/OSM L3 on other Qualcomm SoCs,
>> but supports only twelve LUT entries. Due to this hardware difference,
>> the generic compatibles are not applicable, so a new SoC specific
>> binding is introduced.
>>
> 
> This I understood, but the binding would be exactly the same, no? Kind
> of repeating the question....
> 
Yes, Though the hardware is slightly different, it can be still described 
using the existing qcom,osm-l3.yaml binding and can be added as OneOf the 
compatible enum in the properties.

Just to differentiate the hardware difference with existing L3, separate 
SoC specific binding is added.


> Best regards,
> Krzysztof


