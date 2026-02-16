Return-Path: <linux-arm-msm+bounces-92980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEePJXkrk2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:36:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD52144BCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 961DE30075F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9823126A8;
	Mon, 16 Feb 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqVQTaga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHI4/CIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE901E32A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252344; cv=none; b=QJr/yhxeOMJPEq8KMGViK/qtMio3xh6SL654GIpIUtWCwfxtUj6EAcrJaVwSNnVnyCmFRe6yloG1BM6QrsjgN/frK0rveGxUg7ryjTcoW/U68JUtzADKqISFtxgjxBTx5p5yqZtT/ZToc3NtjGIumUwW7eZYzkmmKRS5sh76VFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252344; c=relaxed/simple;
	bh=7ILzGh/toqjngrTqFZyOGHhGMctwIJ3F0SYJfRRZqM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSVcJxcanlUP4iRZlA9B06U1rOf+cSBpkEwSKisL45uLjMXev76NTQMPJtrBduyTWxCeROM4Vtq+vxlnicq6/Tse3v+zrdOS05mxIK/pJw6oQNOUE9bQLbFBnDMneYvOxswUoY64f2NswBlvBCNJI03U236j99iXQ7PyvE8gBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqVQTaga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHI4/CIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8fpwL2801723
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQv61Msy8BxuXhXgP+XdM18S+/m/V9yLtC21yQ/Fo8w=; b=KqVQTagaXK52vZza
	yjKG+vsJipeSt45oIginBde75+8P98iWfohSdNNA05XOXIVLIxrxH1Nu3zgD0gd7
	TPSBi2Eqd9M9IZ/fxm4fnRf6S+NY2yb0j32Nvbq3hXobPAVKJgaRo/Wzd5f5FiPz
	vL9tDk6eBRegAtIFfBTtOSBduyN53aZEFftqutHVRsLsCSExRGN8p7tOpkVJIsom
	OH00dKAxRPMtXFr+Fb1GxP67Br5N7UjP7T/Tbv3QeoHGieaUnWyqNbEna3kbA1Tv
	lUKQgfwcGtJkv7hyfW9Bw1qZdW4Rd9FznNm89481ugO57Ojvdn3eoBzWm3PL7vNE
	q1rhLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxuguqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:32:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954937be97so25162536d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771252342; x=1771857142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQv61Msy8BxuXhXgP+XdM18S+/m/V9yLtC21yQ/Fo8w=;
        b=ZHI4/CItB0scXYhiiWGJcS90IEJLnOfmOqYW9+v4Wbhbq7PsBsfj/9yZtAYj6L/no9
         qdummBDK7yl6XjmbIC/h8pO0kuFWY4Trl+EGp6DaXxAjY6hatWYVCzKyf/obHGljCd5z
         iA3wxVYUIEjS6+LC9Yfzkbob1FqHwD8OpRHYJwsncif7t184zdPBaLuaOHiqRGxuxp1b
         K7K1vn+kZ5y/NThLPqcGOTsizYx6TVHS1srl8hklowQ+5lWMsZdGkaqWZ8q4FVSalKsN
         HDdgyd9RBAsx3rR7DDeK57NSnWetff9BE6LzZ7aYAkyf9wK4F1XNXu5eK8w1vVWTKO1E
         bmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771252342; x=1771857142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQv61Msy8BxuXhXgP+XdM18S+/m/V9yLtC21yQ/Fo8w=;
        b=IbxDBV7ALHxKBjP8vtx8lQxC6WeZS2NoU9ctDLEzbSpVY3qO7+vdphDW60PAcszC2t
         6s/XqCjaaZrLsLPKTVXo7XXKiU6XYMxawJBQMS0aOWnN+0pp4B8ULoW1AiItr57WnHC/
         3uHvlQfjClB/ROlcu77WLHuhBDGTSxPeXnVpvyTxUFQB5M/1w7LN6N4xH1ff7tPWUrM/
         HaCY0Ba0/F9ayojeN7aBx3Z1fA3Hlz4B5XnC4IZlxdbbs/aE11R5ka1PUX+Qe6jnG5yl
         qqBrtizstw7Zf2b6LVayF0j6mmsl5+K20StwYW2EiubgVkuiBiJrdX/5XfMzWTZyBKmz
         aPyg==
X-Forwarded-Encrypted: i=1; AJvYcCXvyAezOpv7qz31+LIWhSNz4WgIilHDBDLhHOzPgsE/soSYCyEsOl92NUk3MyWT/RtlhgqgsKre2gDIBLJ6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzm8uN2/AFCZ0aOGOgixKcN80DZr0mQ07E369y0fuIXSD5Yn9Y
	CJMmVAn2vw4/2FC31JKUzEOIo/HwvKQ0OHNMxd9WfCPZ1ij+7lUTK7+H1/UUa/1NoaFVj72KoNM
	gqDgpv6UNhlkqDjvplEYtAx22ZvlrdrqliLV2D2nIoEBQMLw/K9sT/NhMJ2dFTe76B2Ea
X-Gm-Gg: AZuq6aI+bZ5vH1MXRqVTGNdBhZWGpgscT6sgYy3+POkylAw4/t5mece2BARMPwrDCTR
	j2H4trxUES+WzkicK0LRtfFkq6yzIdMdejjEh3Pc8Ygy75vRPL3YmECC9RIIirQ524DZCVU1lDH
	fi2X+n0gvmu/jMbRyvNKMIwVu0lkGHHWszS1UEeWujfPj4zQEfiBw19y3oB1rVAxI2MfTckEQAS
	Li7z22A8rEnXul0Eboya4oLYjE7LMAGxpVQMucvxL8KwDvjQqxbdsccuViIBz7XMwH6UZofNxXq
	GgHCo3FFrY0ZusQ/AMLXOYaBP9mTr76MWmxdf92ift65PXSHBxxAk0X4c4X/uf55lp8n8pGbCVM
	Vc/HA/9/Toh6Nq4XI+NNlFUs8UVBJS11QBiVH+P6xc9Cci3yHItkzgKUryqjQUnGn3afUcl35am
	1pwJc=
X-Received: by 2002:a05:6214:4f05:b0:897:1d50:2336 with SMTP id 6a1803df08f44-897347ccd64mr122425626d6.6.1771252342111;
        Mon, 16 Feb 2026 06:32:22 -0800 (PST)
X-Received: by 2002:a05:6214:4f05:b0:897:1d50:2336 with SMTP id 6a1803df08f44-897347ccd64mr122425226d6.6.1771252341644;
        Mon, 16 Feb 2026 06:32:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385965sm262304766b.15.2026.02.16.06.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 06:32:21 -0800 (PST)
Message-ID: <54c5fbd4-df01-412b-9586-645a2a018902@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
 <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
 <nt7rqp577vxb7qoqxbaqldv4n2erfg6gpkycfqi7hqkdwirncb@squrvhxi2tlz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nt7rqp577vxb7qoqxbaqldv4n2erfg6gpkycfqi7hqkdwirncb@squrvhxi2tlz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IhTV7CvogbYUCBY5CZjJkX_dTuDMPxh2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNCBTYWx0ZWRfX5fcf3yNPF4Ry
 dDihvuomQWgM7Ad4wI/euLbicpB4XpbylSzB2qd31QhKu3apI+K0efx/c51M9oigoJlaYnTT2WM
 HxegJePKsxTwFp8wffCy0h91cW5iWeynLgZrTUxvKYt10l5clq5jtsld5hIP14E7ooXV1sKOYQt
 0oEzv2tZuGNVbUXm1wXerS0pqEJd7sKXfQiqBeXBUJJdU01KXLA7m6LMb25wJul+7nGK4NSjRJk
 ZVlhyfhKv/ihPpJo2ClMna8S7yOKykRmLCpsF81KS39IaCWRWEOqdJED3f9u6T/izV7m38EMLLL
 raIytvsyOR3J0xU8FkyfZvV482Q71OSRewFzI85I3XV5in2HCxffXPlNqcKO9daiC9jWVuHPSSv
 pZECcaK2U4pILcdumhsJgDcR/LfzYC0v6Jl/826NdnYQz3RG7vGZeC4fRRnUDVdJ8gFlUYJWADS
 Ztor2Lg6/uC2BWHqBCw==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69932a76 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=OuZLqq7tAAAA:8 a=Yc6E1KeIVK-B4mHnDT0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: IhTV7CvogbYUCBY5CZjJkX_dTuDMPxh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160124
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-92980-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mainlining.org,kernel.org,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,mainlining.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDD52144BCA
X-Rspamd-Action: no action

On 2/16/26 2:57 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 16, 2026 at 11:53:49AM +0100, Konrad Dybcio wrote:
>> On 2/14/26 4:38 AM, Richard Acayan wrote:
>>> On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
>>>> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
>>>>>
>>>>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
>>>>>>>> From: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>
>>>>>>>> Add compatibles for sdm660-internal based soundcards.
>>>>>>> Why is it called "internal"?
>>>>>> Yeah... I am pretty sure there is no such sound card. You cannot have
>>>>>> sound card internal to the soc, because you need the external components
>>>>>> like codecs.
>>>>>
>>>>> It comes mainly from downstream driver name [1].
>>>>>
>>>>> Downstream also mentions it as int_codec [2].
>>>>>
>>>>> There's also an sdm660-external sndcard [3].
>>>>
>>>> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
>>>> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
>>>> optionally WSA881x".
>>>
>>> Interesting you left out WCD9335 (codename tasha), is it never used in
>>> production on SDM660?
>>
>> I don't know.
> 
> msm-4.4 lists WCD8335 in sdm660-audio.dtsi. I'd assume that's the
> standard codec. On the development kits side, IFC6560 uses PM660L, while
> Open-Q 660 uSOM uses WCD9335.

FWIW I think the SDM630 Sony phones use pm660l+wsa881x

Konrad

