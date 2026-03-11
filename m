Return-Path: <linux-arm-msm+bounces-96913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGLgCBMwsWkVrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:04:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839B25FEDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17A6A3047086
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFAC3B6C0F;
	Wed, 11 Mar 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TR2ZTjGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y06XkwQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C557D3C6602
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219830; cv=none; b=Qv0HogdJYs8A6ZwNv5uuXGwYdWbLaRUwA5n7UgWp3DZMU66gvdogBX+T+anmIfonmm0XEVyVsCk0kHXtbQkL+nYMDOralquOs1CXmabkJcQTi3Le5pTB6itMZdkatl5S7GY/kaIAqa8N8fpJ4ayRyzgyo3q6YBjj2vs/igygC9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219830; c=relaxed/simple;
	bh=ykZUsVq7y9xvlDXNfBvvliTEDDYnOsPpQ79R0T/BKQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5TEMbnYvWme8eeLhdzFptHBYxmKg2VMB+eqcFxEVsRr2s7h9pWKymN4d50LRGkSDgf8McLWHww3qJIm7Yxz5oegucMHVZwfiZ77FQFnKeRsYiEpAosBNx9Oln7r0ZGZwpryHtbpNcIJE2a2Z8FSVbbAKcQZz3eJ27npjqLLG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TR2ZTjGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y06XkwQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6UcuY1863660
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kCnBWNCf69gb/PaJq8dq5wUaLn/Sj53D+Eb89nvJ94=; b=TR2ZTjGDz07iq04Q
	lGKZsaKveXsj1n/yz26WHJ7jTp00RodZgnIttoVksQjnLjpMhQNaq7T2vQoA3g+R
	+/+y0/0h3j/oupVqtdHr0WOXvfG7B+m0olK2rSRr1Z7ub7jkslpizjEiesg/dQrH
	OoX4qFR6Utp2YxDCFVYWVKC6fcZY4U6BRDt+eitYlLOYrbTy40ob888RTCMXD7mr
	Faw0V5Hjyge7CZNy54HaVpaN/GulKtB6Bv/weWnTkp2JW5rgdL0lO4qDD/hDCwhG
	4y26ViqgXryD0E6hr2upw2lvHpSZN3aCDAoeUbQGFqa3QE09fJKlgApV1/00PoGV
	h/fPgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw83nx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:03:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd97debc51so111576285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773219823; x=1773824623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kCnBWNCf69gb/PaJq8dq5wUaLn/Sj53D+Eb89nvJ94=;
        b=Y06XkwQcLnZOc520ze95Sd5O+moPj1Fhw7uFgEjRxhu0wDFVLI3WPGxjcnq2RcgQza
         dVl4c6+VvvwPjlMSuKJgGaWxeDLtTl/AaeN2fosY5AS3DiwfZXThN/v3BpFjFjsLrnxc
         N6XlnrGNjJcSBfjjl+mfP7PN+UD3JiRRe/3s26So5RXjk7sJS2QeyhmBE7eQFBhVC0s0
         7rpzpRxtcDubi3s7s9xnLHLO6HxuEX3XSYdtKZY1BoeDZ6v/+K/9Gh6pTN4jvYmUwkFr
         OKkcg0VsdQwTmd3LVzV+WipRXqT1+2PPrnyEl+z7/JkFqnDk2Rahkr+jIN4bPfv0UW3j
         iCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219823; x=1773824623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kCnBWNCf69gb/PaJq8dq5wUaLn/Sj53D+Eb89nvJ94=;
        b=oMjPxBPEcPjOurrEv4zbrEjlx8x2c9uZeku1BitrIdm8ASzQjArKnVejYtjDmuGZ4C
         5JqZyplueRoWgSCWRtbg3Z4A2wZBWIwLFyei6VhN1NNN1/aRIqkr/jgsgl6Tuk+enOJX
         CTDK7bZ6IKoPabIG8pMzq/+pRhS215WoXCtdPbEHMrpKshzkMB3YbppbiuquSTWsTMn1
         l6/IKA/M61X7EjhPszkcLQxhqsV6QdPAsSqecUXQ+lG3OCg0sZHoKY4Xj10mwq9q8XGf
         SrYrrMGmQ+Ck6B53CVGGl99yYSGrzk7xdzMdveXW1FwEt+61QXjH7JR/rotp6o2fuJq3
         7azw==
X-Forwarded-Encrypted: i=1; AJvYcCUSbvsIwOvbvu3VcP3YallDItFfMLewK9EfxKRS+h969U2fWisPMXE5h0e6FhIISHUYIvzWIYTcEB6DF+A4@vger.kernel.org
X-Gm-Message-State: AOJu0YzSBNfrJCoC3WEh2pdFsx8MN8jgKycti/BwT7UBQEsMxch474pY
	Z9gCF/b2RRFwMOj8pAZ7FIjT2XlbKJP8IN/gOCwxeHMZIxw0KIbF52xpBpnMNrZnW1TK75vICAk
	xVjsRykpeucKWVoVVPxkaTXowAV78DQABK2XKKodw5rAmMIy0hgaOsxHdK3YzFrbHWqBB
X-Gm-Gg: ATEYQzwa+NL9O13fjpHqaveTfEJ8FdXDZjWkIUm3YIj55YBT+5qJMLfIfKaRIc9G/nv
	5qH9CMnQAdai6AHIJlpxOGM1//puOq5zrpC/J+3FK4Bo1cx3pQ6SjSBS45qaKaZoLLcfrU//X5c
	XkQqbmDqqAbwGdYEoKJCE7wfzzoUUytFcbNgLQUaWc5lzl/GA7T/fJjFhaLWdqGjUKCw3K+argc
	F1hufjIOGQHT98tE+5dlVQ49GHScFSBWFuk7+Tjr03N1q6TATtyOx/8hpzBN2jrtT5QfzyAKLz3
	7sobJmnywuXWjBOqKww4FUun1nQkfoQrYNsv+5WLxINqKzwpD74fA3n9QdPdWv04Gy4NeeVogYN
	DVvxyBkTJBzeyglQqYL/A+L733dW2OMWPSwD9cOWAffpe5eb//GcWlijrgoDo8c1DAS/sLLOOT0
	pflaM=
X-Received: by 2002:a05:620a:4109:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8cda185f98emr172041085a.0.1773219822721;
        Wed, 11 Mar 2026 02:03:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8cda185f98emr172038985a.0.1773219822178;
        Wed, 11 Mar 2026 02:03:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9736e2ca31sm9739266b.37.2026.03.11.02.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 02:03:41 -0700 (PDT)
Message-ID: <2fa0b336-0ca8-4418-9866-e240fc12079f@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:03:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 disable wcn6750 and wpss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <zutya6ebksaqkpjen4qb62kit4lgannbfbvvfie3bpzbf5cgfi@v5xbzjuf3tyy>
 <581ddbf3-e79d-4a25-956f-7045c09a22bb@oss.qualcomm.com>
 <ogn3a6chd2s6ys5voxktnzyldoqfmytadsavvaku5ym22yisyk@uvpf7ax6wwno>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ogn3a6chd2s6ys5voxktnzyldoqfmytadsavvaku5ym22yisyk@uvpf7ax6wwno>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mr5Izy-uG5UQt66-C7k248Dzf0ulOxQJ
X-Proofpoint-GUID: mr5Izy-uG5UQt66-C7k248Dzf0ulOxQJ
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b12fef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TvOmIZUWTGpWBAojQfIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NiBTYWx0ZWRfXygEaVptQMaKj
 2t+nhWB1F6Xoncxa/yZc5/tmMR8cz2gcd+/YIKC/TCCr1BkJ+Sbqes9Nk5JzjDbJ7auKhmK9qoJ
 1j3AArxE4gaoCE5WOBI6GC4p73bCQihbIj06ECDo6ey4OZX2/KRclQ3kyE+v3EAQlbRqhJkpamq
 aT5sfg/SXvLp2rufFafbORaLHqxBVjGah+e2ThA0E3RMbeFQQHx0uxxo/Al8j6wU7ejl3Bzl9+t
 iOx5EprszWEzv0XBgpKUQ+hPhL0KUDLUNTOFG8nzJq+Akh76LW0cGx3bURk6ROxd9jIVzGTNe9N
 fwkQSp5A0fC0lBIp50eZntDFFvXcaaVWQIZtwIDtchkc/QV17p+RvWsJUARGuAABkIzPqxm5Bar
 pFDFNjOjmKDiOCS/DILI21GgqtTtH8HhKm1WJBrRMDJtuwzVtCBOw3QomXphhH83QN+I7iy7i1u
 bUBe4JxKBUHmzryNptA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110076
X-Rspamd-Queue-Id: 5839B25FEDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96913-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/11/26 5:32 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 11:14:55AM +0800, Hangtian Zhu wrote:
>>
>>
>> On 3/11/2026 10:40, Dmitry Baryshkov wrote:
>>> On Wed, Mar 11, 2026 at 10:32:19AM +0800, Hangtian Zhu wrote:
>>>> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
>>>>
>>>> Disable wcn6750 and wpss on industrial mezzanine. On rb3gen2 industrial
>>>
>>> RB3 Gen2, WCN6750, WPSS, etc.
>> Done, udpated.
>>>
>>>> mezzanine platform, pcie0 lines are moved from wcn6750 to qps615 pcie
>>>> bridge. Hence disable wpss and wcn6750 nodes for industrial mezzanine
>>>> platform.
>>>
>>> Are they rerouted on the mezzanine or should the user toggle a DIP
>>> switch somewhere?
>> It's routed signals inside of SOM, no DIP switch changes needed.
> 
> How?
> 
>>>
>>>>
>>>> Depends-on: [PATCH v4 1/2] arm64: dts: qcom:
>>>> qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
>>>> Depends-on: [PATCH v4 2/2] arm64: dts: qcom:
>>>> qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
>>>> for PCIe1
>>>
>>> ENOSUCH tag, please learn to use b4 or git-send-email to define
>>> dependencies.
>> Updated with lore link.
> 
> Nice, but the tag is still not documented and isn't used as such. Please
> use standarard ways to declare dependencies (I pointed them).

(b4 prep --edit-deps)

Konrad

