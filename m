Return-Path: <linux-arm-msm+bounces-115674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ETGyEAj1RGoG4AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:07:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE696EC91B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:07:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j+HzF7h+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EXPG9EsJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115674-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115674-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 017573051292
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DCD436341;
	Wed,  1 Jul 2026 11:02:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DEA42DFEA
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:02:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903777; cv=none; b=NmltVVUSN8rulG1t/nYn3I/uO6L6PgxYdfZl+chVDpukYhKR7XI6XMcbCbNJo4R7qlasroDkZ+8XI53bbTHdcLMvQ/hp2QcRDjdVefYXvE2/YdtRw97rs0Hdbeh+q2xT2Q82km2m6MV7Qp8ZmG6uBAfsFOrRJjxAc/kAUba7dj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903777; c=relaxed/simple;
	bh=u0T30LeQQOSUGxQo0pfn/k3f7dJ5+eUKOz5i6sCaeeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLigc8kmnXyqoWLoc2WNilo2Ox6kFaxmg1vHKFWQaqz8bPhlB0NEPTg+CndJEp3p5x7LNEUQTnTMyMfbCt13MLzj8nHy4Sr3Xek+Og5s7Hmt+CMyDGYORiPMWpePbwBiFD6xSILqTl4GaxatugTI5U9yZh/r8rb0iIad5tIy5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+HzF7h+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXPG9EsJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8RI0761296
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=; b=j+HzF7h+yWvHFJaj
	xP6V7MnB5UqGZJ5SKxdy/vefIya+F/K3wbABeyLLp6iW3vizyFNsUHhHAD3nD+r/
	OyXRPuChpj4NhhyEVBEaJhTRn23BrkSBuTbrXB+frWPGvqpg4zn8bsaG1GuuGUYS
	jIeyribqpUAAdzgBV9Q0j8h8rgDnLOTXRg3Y+XFYRMLVSgy3DiW3DM6NxD9gz5ov
	zo3hFyHTk+BLne3oti/HdwiTPyVcXhUgwD5meYkElEey3cX9kDHsp4GL2WLV+z/e
	BGhsYj0RvHoBOdKdqJJVxgM/0AG77l95u5LzLouix7V75x0Qz1lZ1pbDw9CnuSa6
	LrWx4w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3pgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:02:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so35575137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903775; x=1783508575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=;
        b=EXPG9EsJcXONfLwnESpDQ8ftjviXNQYBsk/1ZJnd/ukxqcga8a6ka34mVURIGDUKDB
         Kc7vn/VDR64giUf4LHMQ/AeayW1tYRxYuAPtrUamDKhOqie0uXnEngpLiPMjWEnY5jp7
         mwHMGtFZTifqntNs2V/mbV3hlLkpBYIf7TmwLER1xM+8315B1FjPdJCVLX9sDt+V8tR1
         Ry4ZnWaeYbvIwSGLQKWIGfyhaCEXMPAOp7Zg3O2KJyipQXm+ryXU/YQoRxuoSCtiPzOb
         aAlojL3KU/Trt01yp2DpVsGMnQY7fl43vJaRlXHuCU5BXoDmBu2zek46gOxndnv9Mhb0
         YKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903775; x=1783508575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=;
        b=PkSXh7B9cN7ozZ8H+OcrxPZ1OGixfFTUVgHEKPpwoPvj9zvWJy2HM8B4s2Um/6mUCL
         NlvA8JqEowZSEZgKZDGDqwO8ZbL5EUA9h0nzXMaZh2MkwIJo19Sx5hg015sKSFav5hpz
         oUHTlDaCNFlPoBMCBslLTSgnrr71mxybvP8qWjazLc5YQ6EzxT4A3j6lfT/FEFIZYRdN
         XuUdnxzhF764e87aHgMVye93NpP/IabTCg1UADOjeLYA2miv4unS8X09oShl+Qzs1REw
         ubLGARiFF4JUe4EhYhoZfg1oQA4KXWc9XDzjoDBYVTnmRljsplxEyLtEQ6x1oTi//gwi
         if3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoyUdar7GosjfXmKBQFsNjS0EbCTdVEdQT2ddsIVQcNqXywy/0t5iqk9WUqY3+ipmqCNS2QzksLfkYn3N9w@vger.kernel.org
X-Gm-Message-State: AOJu0Yye64f7WhXPzN/saz0EocS/MQvK3bsf5ONTBJYHMR7sQZDGF9s9
	jdhrcUz9dG972jytJAoIRaQjszVcLg/u1Ilfxw/kVOcxzFfaPp8/LXuel0vN/Toww/7hDgXAqf6
	GOuiqWMM2TBoFVCIHQ9U63hGDsPCqnuSt6K0TPY5TmUzv4QLxY58rypXhOHWm9J2Q+8qy
X-Gm-Gg: AfdE7clqH9xXOfcIcc2n38Hkj039BjH7ixj49m4B3cxV5HIl5TroabB3FFq6U+e/vBT
	fuGOvnXhyhvZI6T0DMUmyydthg5IWgUu4kPzRO2js05MbJmzdR5SmIe5mH3+N0vMZz4f2fxpmQN
	PucPSm1cy3qdjvXedly1kDw08DU8BghlHAc41FxgFBUUuhjG0ULEEwv7AyJ8IMBvstoQOiYP7cN
	1VXRGdBrG/cLo19RFnVYulurjCxXtgTI7r9jPdWRVmYt1SM2DpbTily3WCY59Cn8ZuWI0ObDBvU
	zxS0n5xAi1RIKPtGZoQ10a4H8ba7mqJ8rqvWaOPmCYQk2gxK7OzVC7EOVKunBukBDBmps4RpNVW
	oms7wzaUuafd40xn/cZysN9UsNvGpe13CPJY=
X-Received: by 2002:a05:6102:f98:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73daa8b28f0mr87672137.8.1782903774615;
        Wed, 01 Jul 2026 04:02:54 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73daa8b28f0mr87636137.8.1782903774186;
        Wed, 01 Jul 2026 04:02:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dba380sm256467966b.26.2026.07.01.04.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:02:51 -0700 (PDT)
Message-ID: <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:02:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44f3df cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=TUQMdDBI74RIm7-lXFYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: _gWewVw80KFNNMhdlRQOs4gcc7ds07kb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX2eQMn01qHXZ9
 0nKuekAHHSeV+lr74g2Kl34HjbtdH/rJA3ecx5Dibn/5AOBDeGEnjaiHh50t130049GDQhwVOND
 XYtYX/0IRWyTMwtPAUMIWR3AHxjAwyk=
X-Proofpoint-GUID: _gWewVw80KFNNMhdlRQOs4gcc7ds07kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX+3zFriNgodQ+
 a6Tv4d5t2s4HTHpyF4wDABDCy0gQiwQYohcMlJI8Mi++++GSN2ol3iEPdpflq77Wk1DMU9twXWr
 OWWSwiitCcVbUgWs5atpazpaC4aWMYeSQ5+zR/BTsexdaEhdzrjPldTRhVWm1e0Q7RUpP+K+HLu
 ADW9zC0GpklCbW4HeS49aBh0y1mArEpFYiF+Bkhn2r/vDmmTypef+iXQda0YYNiwBZMHz6d7O1x
 oK9NhzbkPzQXXy6KFQP1T8G9sGzIKXqyWaI7wzGvy6Ir+jUkqsGUmPvLc43UgEFhBOBQa+jqKjl
 SC0A8O3ydntTzZRVWvke8Jzh6pvNUBVaidWA3I/0xiEuXY90xtMSn46onoQedjI9yaXJOf5UR1c
 s0/rTKxREIIyGMXLZ6nMBwj+C9AckUF251Auwg0D0kGetc+iOKnokjolD5k45onSoHx2X8sSrHl
 V0/z9nGiONIxyYkVNKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115674-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EE696EC91B

On 7/1/26 9:31 AM, Jie Gan wrote:
> 
> 
> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>> On 01/07/2026 09:16, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>> AMBA bus.
>>>>>
>>>>> Convert the compatible to a oneOf and add a standalone
>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>> created on the platform bus instead of the AMBA bus.

[...]

>>> AMBA primecell identification. The purpose of the new compatible is to
>>> clearly distinguish this platform-specific case from the standard
>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>
>>> We already have a similar pattern for the interconnect TraceNoC device,
>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>> I do not see there a fake, duplicated compatible for the same device.
>> Can you elaborate how is that relevant?
> 
> Will fix it by removing AMBA related description.
> 
> Shall I update the clock name from apb_pclk to apb as a platform device?

Why?

Konrad

