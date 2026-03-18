Return-Path: <linux-arm-msm+bounces-98437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BZrJMKNumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:34:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECACD2BAE51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8619E3003EC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666BD3BFE40;
	Wed, 18 Mar 2026 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBAEG9Tx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dji2kYph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51F53A5E76
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833386; cv=none; b=B50x7j7P1yLCpmiLVihUpORxtEPVwQ8IMePOJmRedKlawMJQLnO1EfjnLWOlgpF4iay2oU0KwS/2NsCbmubA/6XrGdiqeu2DgUSSnWvmpPHrh4US28QsXHp5ZN0RjM8+yx6Ha2v5JpiVZv/85blpoaZeWhBLawcmpT8owmkTk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833386; c=relaxed/simple;
	bh=vIvLWzNaSaJ+TJyGFrAttctz3ButSBGXrVZWzeWg4Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4QPUQjdj3rY+LMtYQXaqo50trSamBfND0em64NDVZYtKmD7OL+ZrcpzcoStjXJRlEDX0OEFSwvD+NUAwWant/3pci8BQtxSVPqgI4JXr48QyB0K4jWYm/VIxBoXvWyno93ttYwiXt1yY7pYC7bYyJYOIQoHl7hgrkhdSMG8hiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBAEG9Tx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dji2kYph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MrID3358374
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rt3Niom5zfDQ+BPSAeDMv86/pbN8GgM7nWLFD/powk=; b=iBAEG9TxsPEQj4/n
	lmZRrPuQwetiQXBh6MXIwbeUjKDFELFXoG36+4R9Sl1Y6dZoren4jFRbOVdkxPhf
	9MQV1lUpSDODnU4B8ZtOFIwwpR+qOM0JxOWCr9KOO0iby7dW0dccJohcU9nMp5g7
	0CIRi0Gm9TBLs/aBFspUu/cnJUvREA7AvqZRSXgeyPZ0Ry9nekp8dWg54vrST20A
	T35YEwPYtXViDLmM0nCSl9p5giWHVo9BcfNTeS9DcQEmvkXjzQ9y+1lKQpUtCJT8
	vgG6EA9UWeJXsdGTaeZg3cEdJFz+hHxvErj75WQKsX7osnbGKStbqzOodfFsQb/i
	Sh6CaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0emf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:29:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899fcb63705so38462456d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833381; x=1774438181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rt3Niom5zfDQ+BPSAeDMv86/pbN8GgM7nWLFD/powk=;
        b=Dji2kYph/hf1fqaoiPGcluhGbd7soEoy+8qlZgNyf49uQPHFXIXgy7D/ULOhurFVqf
         XEW/bxyS9np9pHBNi3y7HK42w2Qt1CRqlfuynw7e72kT1aN4gt9nXldDsSW7j9vopwEi
         MjHfSuz5NtrmiVP/ijLEarT1rQnWJU4ao9dSSeXUJATXIvIXjh/VLBtwMKcNc9ibfokp
         BfeX2IjrbgGlqJuKz7vs6NtAL10Aps4QHRcXvrZF9BV/4mSdq9bBPeIAHQ6pCuphccrk
         Tx4uTkWYbbj+oVWnOvQm7dxTSUVTe5uL5oU+d2XVHlhzfGlfZK6SxWT0WltfrAJVikqk
         3tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833381; x=1774438181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rt3Niom5zfDQ+BPSAeDMv86/pbN8GgM7nWLFD/powk=;
        b=mesSGjZSHNalOYOHbSaj/WsFsSMf2H00sbn4BMrtgfJID0Ml6ATgDF7xmzhwXTM0TO
         9f7OyLKIPZ0b+McM7qV4kCBcCpn9/ruQQHOn7VQvCOfp3GT69BA+qihJGfjPmVZB7GS0
         U0fHnHcDIyS5TdykrfgnWXebe9t6xalt3ohSmkIhPQgu501L9Ls4Firok0RDSw48lddB
         yQP8eZFz6QmNE/s8ZJ2dmNmtOcdsnfua2GnpNI3ysshLnf3xlQy2t4gIITGF9FA2ur6k
         hHwlE/JGtCj8xmtg+Y2ZGd83OnTrAfPFyjqXdL8zYXUftF1SW6T2llaVe0Uc3RWn+YaM
         SVAA==
X-Forwarded-Encrypted: i=1; AJvYcCW4zLtQOtU5jzd2hX0bN8cho7t9uzctTObBResLv++j69hbvgduSZi+cl4zMsUzT3s0kpUIImqmv8GIV2Wj@vger.kernel.org
X-Gm-Message-State: AOJu0YzYW0yLpZyH6pwG49NFikSaB0dmNrxG9KSX1+GQlywDy+HAlFQO
	xBFJRhrLRyUopGZw67I0+vqIAQymbrDeYkc9T8Dta9ph8ziL48ZxzmtY9cBZqCX2yDpg7IBezVI
	hyHbdg7YWng1hOAzi1V/yKlLUMKZaFADt0GEWNfky3dc9uNLVIE+W/XIlSOVpEKrxin8F
X-Gm-Gg: ATEYQzzjCbCL+1CRivdphnBCUgYFWaxJLHpDITCFWqeg3AA0p60jDwj12IhXybYCthD
	GJveBGZrasDwpRePAiKA16BlLvYy8DXdNfQVwCzzCsWnbZvTx72n+ga7O/rPGvympkuA/s6aCn6
	QZ7wPkKQJc4SwknoMXQAIHt4/Y+Y6JzlxI1RpyyHokR+N9bAnXY0r8LG5v0yLhpWPZVHFbqyGdQ
	aEIv7VqLlyPA/OH7dWHTyrVonoZURSNI94MjbyjvAWQQh27rQqb2Nu7ala5fljg8c6fiTSV2Z1G
	/DYmnJyqcZk1N6XCYOsJ3/vc2zGDALuMwTrGLtWUH2w/lbd+wA4+uksOvVhgNoeQ5srB1aUfMh5
	GsU2IPaYy61W1K8fSUr9z8nJeKrj7hRgXqgt7YNepQ79IRaKsbvCrHJpZAClsPjUMnlz1xPLEQW
	DhXWw=
X-Received: by 2002:a05:620a:4724:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cfad2533demr297209285a.5.1773833380890;
        Wed, 18 Mar 2026 04:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4724:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cfad2533demr297206285a.5.1773833380361;
        Wed, 18 Mar 2026 04:29:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667af38d891sm1582078a12.9.2026.03.18.04.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:29:39 -0700 (PDT)
Message-ID: <4ed72391-fcd2-4ad7-94da-45fe13012953@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:29:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
To: Alexander Koskovich <akoskovich@pm.me>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
 <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me>
 <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com>
 <nNinWyYOTp_1MjE-6JI6S4NPPxfZHvnIZLblp0x4t71DVOXn0ScH--kpAs-wHBQVUpgSvIZmOKRMmUVNzs8Vcm8PG3_4hFIW1jVx1RES2sg=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nNinWyYOTp_1MjE-6JI6S4NPPxfZHvnIZLblp0x4t71DVOXn0ScH--kpAs-wHBQVUpgSvIZmOKRMmUVNzs8Vcm8PG3_4hFIW1jVx1RES2sg=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lYT63AiGJkkEJAl0f_EW4YzQcJjUN4ya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfX6qPPUc7v5Frw
 xPu/N1M6j3tkIOn08bhg/Wuwd0INbqS2f2NXLqJFMV3VYj3pCSm90s0e26Ymcie3bHQR+DUB5kw
 yQKLcC/A3fyyuvgkH8LDi5zLGjhAShBeWFbt4jZoFX3scu7M36l16VvBMhfBxvLGtMP0aNZpBPP
 ly30oD8TRETKUoBolvCvIBXZDfAI/0thX3CbZKfmgtmUgkFPiHsAnFT8TJB4m4IjbJUfN721E+0
 f1ynPF3k7+zFSlVkSH56BGYo8+2FBwSdGWdU5QofBuxwSsjvi605vO90zPb8dC2s1GuJLMdpj8z
 kBCfJp+l1NXDSE9r5nyWZurafs3/utAPzo0rHdbKl8hnnitde7KezXGu5Jep2Aa8pBXO7mqxTJZ
 N1N6gAV9BCzHicF61c+niVIo4uLrtapVYhHWT2ucBmJLzL5saLiUbxwdp5BWh9zRtF+Z4C18yn9
 Hqb3brgCTSH/SCGICag==
X-Proofpoint-GUID: lYT63AiGJkkEJAl0f_EW4YzQcJjUN4ya
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba8ca5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=SwhEMycmah-h3sa3uUYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98437-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECACD2BAE51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 12:14 PM, Alexander Koskovich wrote:
> On Wednesday, March 18th, 2026 at 6:28 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>> +	/*
>>> +	 * There are also ER & EVB boards, but those have meaningful hardware
>>> +	 * differences that make them not compatible with this devicetree.
>>> +	 */
>>> +	qcom,board-id = <31 0>, /* ER2 */
>>> +			<40 0>, /* PR */
>>> +			<41 0>, /* PR2 */
>>> +			<50 0>; /* MP */
>>
>> I would guesstimate MP is Mass Production and everything before that is
>> engineering samples.. perhaps that doesn't hurt - maybe some curious Asus
>> engineer swings by one day!
> 
> Actually the unit I have is 'PR', it's one I got from ASUS when they were still
> sending out phones to developers. I guess the units they shipped out were preprod.

Oh, nice!

Maybe 'public relations'..


>>> +		source-pdos = <PDO_FIXED(5000, 900,
>>> +					 PDO_FIXED_DUAL_ROLE |
>>> +					 PDO_FIXED_USB_COMM |
>>> +					 PDO_FIXED_DATA_SWAP)>;
>>> +
>>> +		sink-pdos = <PDO_FIXED(5000, 3000,
>>> +				       PDO_FIXED_DUAL_ROLE |
>>> +				       PDO_FIXED_USB_COMM |
>>> +				       PDO_FIXED_DATA_SWAP)
>>> +			     PDO_FIXED(9000, 3000, 0)
>>> +			     PDO_FIXED(12000, 2250, 0)>;
>>
>> Both ports have the same PDOs - will this kaboom if you plug in two chargers?
> 
> Good catch, from what I can see there is zero hardware isolation. Downstream
> prevents dual sink by only allowing one port to negotiate sink at a time (seems
> to always prefer usb_1 if both are plugged in, guessing because its used for
> the dock), but there is no upstream mechanism to handle this as far as I know
> (not sure if this could even be done cleanly as it'd require cooperation
> between pm8150b_typec and rt1715).

Could you please remind me how the two were connected? Maybe we can work
something out. Sounds like it would make sense for the two to have *some*
sort of relationship described

> 
> Will just drop the sink PDOs from usb_2 and have it be only source to avoid
> this issue.

SG as a workaround
>>> +&usb_2 {
>>> +	pinctrl-0 = <&rt1715_mux_en>, <&usb2_mux_en>;
>>> +	pinctrl-names = "default";
>>> +
>>> +	/*
>>> +	 * Disable USB3 clock requirement as the bottom port only supports USB2.
>>> +	 * The USB3 lanes are routed through the pogo connector on this board for
>>> +	 * use with accessories, so will need to revisit this when we start to add
>>> +	 * support for those.
>>> +	 */
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> So, is that right?
>>
>>                                   ┌───────┐
>>                                   │ POGO  │
>>                                   └──┬──┬─┘
>>                    superspeed        │  │
>>        ┌─────────────────────────────┘  │
>>        │                                │
>> ┌──────┼─┐      highspeed               │
>> │ DWC3_2 ┼─────────────────────┐   ┌────┴──┐
>> └────────┘                     └───┤  MUX  ┼───────PM8150_GPIO9
>>                  ┌─────────┐       └──┬────┘
>>                  │ GPIO170 │          │
>>                  └─────────┘          │
>>                       │               │
>> ┌────────┐ RXTX   ┌───┴──┐        ┌───┴──┐
>> │ UART   ┼────────│ MUX  ┼────────┤USB-C2│
>> └────────┘        └──┬───┘        └──────┘
>>                      │
>>                      ▼
>>                     GND
> 
> I misspoke in v3, UART is not controlled via a mux it's just a gate. Was
> looking at the board previously and it seemed it either went to test points on
> the board, or USB. But the enable GPIO controls both. Have it renamed in v4
> staging atm.
> 
> But yeah that is accurate otherwise wrt the USB 2 mux.

Okay.. I don't know whether we have infra to handle it today (+Dmitry?)
but generally we'd need something like

usb-mux {
	select-gpios = <&tlmm foo bar>;
	// sense it via some notification?

	ports {
		// conn to usb_2_hs
		// conn to type-c
		// conn to pogo pin connector
	};
};

rt1715 {
	connector {
		// mux conn
	}
}

pogo-pins-connector {
	// mux conn	
}

there was a similar attempt (I bumped it up.. maybe it'll be merged soon)
at describing a pogo pin connector, so part of that may come in useful:

https://lore.kernel.org/all/20250225223038.879614-2-swboyd@chromium.org/

but in any case, that's a song of the future..

Konrad

