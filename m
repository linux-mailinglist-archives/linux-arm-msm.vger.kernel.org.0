Return-Path: <linux-arm-msm+bounces-106710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFAbDnYL/mm2mQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 18:12:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B74F9433
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 18:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4399F3098E4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 16:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B507D3D6CAB;
	Fri,  8 May 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aonQmiFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jxu+lqqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD42F8EA6
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256306; cv=none; b=AJHv2GHXXx791c/d8/EExk9mpUSqdSbWGeQ+2e6dxqXcEuaj0f++rKRYSfH6QhmElEE24lwMW7hW0d2A/pUOv9YIHghRVbnlcFi8RoKxDQMOgUjtnkdFlJ1S1o/fyYIyjXijfARxCRSGRstH6U7eYqKKBiaiFY8vCF234jof5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256306; c=relaxed/simple;
	bh=HRn2Ky4V1JZSWSHSC+EMGHuinKEViXVgeQ3zyubsmI0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KZtc3Q/DIWFxKvfIHyu8rrxT3C6OrpfafpLVPfuxS2jf1G5JMEk7wkyyOPoEUrulzfXjxxp4r82O4EoYdqOw8gVy5tGKovdxLn+mzJ1XxCXjPV7faEvt3trylgpLN0uGwT2MRFS1yPrDwcBQeFQTiwFtMLbIU52vEvqFTa8oPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aonQmiFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jxu+lqqR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4mt31116301
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 16:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMxAGx/n9sSrvDZ+nUU28V9GmLoIy4DjjLAMpMsKrTk=; b=aonQmiFGg9G/8ttS
	RHlIf23vQr252oSLyiaGxiiemHGtyy0gxyErsOyUdw8UvmQSUnsi8XdKqG79ukYA
	D6swubeyDPk1pSwv0eS7uUuQkF98mRgpa0kuCD1PMC2RNIM3tT4mTHqSFuOpFFXT
	cSmYWQju3wr0f7VXUINF3r1wm3/x4VOPmXDg6MrJEokIrodT7UPyyKoLbNc6zvh1
	jac/VDOkPvLJln/zxFy+QzN8KXc727ZcJ0qw6HHYSHKF2+3/TvraRqR28w1E2Wk9
	tuM5BTXU6HEbTn1QSERvdOpotLmh7M0LBsLleyG1ZhbAphthpeB8jQjURIInViCd
	8undRw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pg01d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:05:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so24630145ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778256304; x=1778861104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iMxAGx/n9sSrvDZ+nUU28V9GmLoIy4DjjLAMpMsKrTk=;
        b=Jxu+lqqRiXKXw6RcWvqb67QW8Kq2frrEL8QHrWuB11sWs/LzfRvZ8Gjj1Mm+QHTOfV
         KOua9WVZmy4DRCYmf/C4H2htp6f5d9gTSLMZmY/pLNJWwYYNQAwOhYFw/KKpIboODNQI
         36LEoIXXONwQqn4BHBtJGt7LtmR1GolHkP65Zjuk8g2G3hpgTho8UH1gdw2RSzXZAhl8
         bzDIvrF0pVUOfApmcrT58oTjt/63SxMN6bX8ahjCG0/pGscrLnctjvt7VdQ/2qstQkFd
         /0zYJoPK9dnjM6kKi1mq/fV8gLb17OVA8aSPX6YgfNWTlfB13x8FpOJyq4GSazDFTS46
         VTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778256304; x=1778861104;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iMxAGx/n9sSrvDZ+nUU28V9GmLoIy4DjjLAMpMsKrTk=;
        b=SI9p+GitFcG6hc3FIqEgYs+/x7fFtDJ6MSsz1mA/B/+x5Xn8eZW0H7k2Perbsz4FKC
         eqgxSD15iXjn02deZ/hYG3+Dmu+YnEz9suQpyRJ6dYcPfpXqoERCyYZLlhRYwMCfy9nT
         E/Iw37vUgefSc+xjS58ZTKCI8IHOV/Z7wlXH2VPOO/wXju11rj42krbNZv6D4i4V7eCM
         Zwsck/sF5g9Q6mvsN2aaf/YNA+I/gZMjx46v5VfSw5hXQYfGbJ3iKeeSJGyBMww8Xt7M
         vJCxcdvtS78Fy+CBj/TQFNu1zDuUnY29aNh/Z/4mZiWHlWTeaqQUUsUazD09+73ml3OP
         22aw==
X-Forwarded-Encrypted: i=1; AFNElJ+KJnbJ9Gqr7PGPvKt4hwrR/Kw+6k9M+AeVfUeSIVeJDDb97s7Y0lllII9C8ZNM+V2ZEKM/EvGCKnWd9OCH@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHIDjxHoCguH5BYBcqB7O4dHZskgpcGD9iCHRiAiRCS5MK8oS
	K3VJH3Aywd1QiBAG5ErjCT7RbY2G1cHFtMhjM9DhZjHmCtf7i3nV7hmzxbaKhgqLoS7q6AdZLd2
	Q/Yt//oaByWp2n4DN9Yydu5tvu4fkaF4Jty4zsdOyilkNHgWbtxGBtISvwOsVNt2Vapdo
X-Gm-Gg: Acq92OG/fPMbYGP9vmhWW+DUKyZdRPW1cvGrBPmNoumbsXyWNdYlNRFlA3bcdiPTGzg
	MiPVtW+wUjFf4OUjoqLU65q6lWA9yESNaZ1ctYh+RTw9aLom22dIq+0r7C+jJGAupY2I3I/VJKf
	aOMHBdcTiMgzbzdbfGDQvCqrrp0m98yriXrvTyuW16Rlo5qHF9JYVkfIzquyd9ugDMS4OmOwBys
	JaaWWFsRgRjZKe+U2h02F/VWegKMolOfDanYEpEFyopeqcpx2LPOMd9hDi+cvz7BzxrBEYNP45S
	gHljV3grGpOlmtbGR7mEYRySEH7KlNKGp+OEHs6vH8CpyuOh1Q9kCpgZzqHzGE2hY36nnGOkizs
	4vvnvzAxD4qOTCTwvQzCyIhua0iPmEsPZyqF/oHY7xzUWFOB/IQ==
X-Received: by 2002:a17:903:22cb:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2babc857b01mr72746055ad.1.1778256303916;
        Fri, 08 May 2026 09:05:03 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2babc857b01mr72745425ad.1.1778256303252;
        Fri, 08 May 2026 09:05:03 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.224.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27242sm30234755ad.9.2026.05.08.09.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 09:05:02 -0700 (PDT)
Message-ID: <dfc3039b-c45c-44d3-85c0-0d131bb5e55a@oss.qualcomm.com>
Date: Fri, 8 May 2026 21:33:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-1-c78b95f53b91@oss.qualcomm.com>
 <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
 <8101e2c8-0593-4325-a701-84f776dd4b0a@oss.qualcomm.com>
 <eebae734-3b03-4848-a728-a29d8a210e57@kernel.org>
Content-Language: en-US
In-Reply-To: <eebae734-3b03-4848-a728-a29d8a210e57@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 92TzTfbqYaNuFWBgJ-LQSoxLkqHPbaHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE2MCBTYWx0ZWRfX0IQ8pz+FctKD
 zOk6mgbz9dCgjJCyvU6HWTHCyb6H6rRyrD+KQ3xuVtyOzFDgaumBHKFA6fE/N6s9XSbhvwt2f4p
 Y9k76xG4yopVcc1FuflguqnflkLumgXh8fU8tDGOD3ZyYtjCymzXzpC6x2NokcHvSvUL4MELZ3w
 mtG/DSdtBNKbhl12ub+1dmu7MYjMraQTBXXq8Z2Q8m7anncnHxcEE6jr9G+PfkAZTUThXeLTe4O
 agxjn5GYik6LFlCqXzwDWu+E7kScJ7mIvZqh8N+xR2LgqhFPIOt8pBJ8ZOoGAC8af1dsyT3zNPD
 0xCReEnetK+ZKplGdJ9XVhG60qppy8RPuEbzA8X6uHwuOaQBvWzMsxkNDGdN8MXYE6KbFN9sLOs
 PxnEx6v/wNImsRs0qHWcCVdOnZqX12zUWGJpgQSyVkq0tR2xlXlFAEaUmjPkQQYF6y5DakuqJv0
 MnS5s9i4wqJ2Dtrj6nA==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe09b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=laknryXFXokeiUDc/1ZVVQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=FCm5DZQdfCEVbhGlKnoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 92TzTfbqYaNuFWBgJ-LQSoxLkqHPbaHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080160
X-Rspamd-Queue-Id: E87B74F9433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106710-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 05-05-2026 02:23 pm, Krzysztof Kozlowski wrote:
> On 05/05/2026 10:50, Imran Shaik wrote:
>>
>>
>> On 04-05-2026 03:53 pm, Krzysztof Kozlowski wrote:
>>> On Fri, May 01, 2026 at 12:45:44PM +0530, Imran Shaik wrote:
>>>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>>>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>>>> qcom,cpufreq-epss-lite to represent this constrained EPSS variant.
>>>
>>> The entire point of having a generic compatible is that it MUST match
>>> all devices. If it does not, then it is pointless to push that generic
>>> compatible.
>>>
>>> I am speaking about qcom,cpufreq-epss.
>>>
>>> That's nothing new, I was arguing about it already, but now you have
>>> confirmation of the mess introduced by generic compatibles. Solution is
>>> not to add more generic compatibles, because what will be next?
>>> qcom,cpufreq-epss-lighter?
>>> qcom,cpufreq-epss-more-lite?
>>> qcom,cpufreq-epss-high?
>>>
>>> Same was here:
>>> https://lore.kernel.org/all/20240828203721.2751904-17-quic_nkela@quicinc.com/
>>>
>>> So that's second time I object and do object for every new instance. No
>>> to generic compatibles, they are proven to be wrong at least for
>>> Qualcomm.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Hi Krzysztof,
>>
>> There is no functional change to the latest EPSS hardware
>> (qcom,cpufreq-epss) in this case. The Shikra platform uses the CPU
>> frequency scaling block, which is a predecessor of EPSS and is referred
>> to as EPSS‑lite. The only difference between EPSS‑lite and EPSS is the
>> maximum number of frequency look up table (LUT) entries.
>>
>> This constrained EPSS block is not specific to Shikra and can be reused
>> by other SoCs that implement the same hardware. Hence, we have added a
>> separate epss-lite compatible and reused the existing bindings, as all
>> other aspects of the hardware behavior and interface remain identical.
> 
> I don't understand how any of this is relevant to my comment. I know
> what you did.
> 

Hi Krzysztof,

The intent behind proposing an epss-lite compatible was to describe a 
common hardware variant and avoid introducing SoC‑specific handling in 
the cpufreq driver.

While reviewing existing upstream targets, I noticed that SM6375 also 
appears to use this constrained EPSS hardware variant, which is 
currently not represented accurately and would require a similar fix.

Since both Shikra and SM6375 share this hardware variant, would it be 
acceptable to use a common epss-lite compatible for these targets?

Please let me know your thoughts on this.

Thanks,
Imran

> Best regards,
> Krzysztof


