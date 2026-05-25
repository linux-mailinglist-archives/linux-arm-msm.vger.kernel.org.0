Return-Path: <linux-arm-msm+bounces-109568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AIJAgr1E2puHwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:06:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23C5C6E60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6AC3300CC80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E3F3ACF04;
	Mon, 25 May 2026 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBavmqBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxMi8EV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5D3A75A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692807; cv=none; b=U9gTdc9EDMrbLGk9n0m0CtWYzy5o28v6sycmEPE5XWmKxvTMKwyEOmL0wK7oTG+1Y1SdWaFyrkPEQ1xM4O/ImFUreBRdqVJB2ggScUsqRlY2+frycFENZdMLyGfyZoy3MLiyD1eLxCt8hhzU2ys0YoaLitr2iZeHiFstQtu4UJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692807; c=relaxed/simple;
	bh=m9oogMcTFdVycGrltx0hH1QPpPdlBZgo0o40YOuoCZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/Q35bSAx5BmIY5qELqjAxSW/QMk80ohr72cmCotNWLX4w3+xP/LsMOl1lDj49eiGT/r1oR3pe5rzoU+e/+QV5LRyP/OCL9XIqF7G+/iOheHfj+ite5ySPgb1vbEW6Tj+UBFXe66IibTmtTrWt35Js/J8R5IAGjOV13KIZBQfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBavmqBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxMi8EV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1oAIA3267799
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=; b=VBavmqBTPXTLJHsp
	avOpVTI8iw/wpN/3SASQZA+myXg1PGacSa+Yt4zGJVE7AohDiFaOROFdsro4jMYN
	AB/csJYymjpLHlVpQYjQFMpjVIEgiVxmeCLIUNtc7yECkatsAn+0rU6Opn93TEtL
	FtBkD0q9Fxwy/Jt8NxDE6f1lAGLVyGsuNur5CfWxOu8bR6j5gyc3+ehjV0N2m3Im
	haV+xzYQDIrD5cvPedQKacRVBszRIO8d7wMpXVXV3IHbT+qjqRvqMLbeq1UfuPKR
	fUTefWeQSE+v/7bs3X3vvkG9W72rlyWLDWyNh0ZXibqOs6l88u7sWBAE6KrEGypr
	ImupaQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmnutu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:06:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso5365819b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 00:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779692803; x=1780297603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=;
        b=HxMi8EV9w5vZ1iZOgdo9jZi3U8qpy94e65gplbtC/2Tx/CUpNwC16SHlElSRpw0EdO
         m+2qXoQ5u4qvrrkFN2pnPQKFkuNO2frMgy/dxHH+0UESlqxjnAlkAaSEMqEi4QPDtyuy
         XhTnIkch/Nm8dDSWaanJ99QpZ4bSJMPXPuoR7x6sbEwrAzUcnaoJxzvHCI7h5JQ4Hwjg
         +3/2M1QlwUZe9PKzRQWtq45xlcwTA0+z06ll3Q1kwYYMMPupikiuTmbJUgYUNdGIel4L
         ImITHxnzm7DQcQTGmTYEJF4sWsWb5uaec9FMMdJtEgKFkVbZXc2KbZRS3LzZFzKhtN3f
         6x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692803; x=1780297603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=;
        b=nPNhlHsjRW8+mdfPMojD0iWAK5W/wqSHNyOO3irZ8poMnKT66njZ5CJdYWWB6n9ycL
         ZwNG/683l1BTPmVExPbVwRHula8z+uJEB2pvtqtrldiVJEw52hr0nQ6lvI0J02pbUPJa
         STpEpJgTPElwZzPmkQYX2JrygPtCo35G2aZ4zOEFES7hSQdFpumkx0tFuWZnwICrFCNt
         eDOFAjIGvsWlzZu31aredmUraRKeK7pA6bUAKpxAI9VTJyStuOkhCoAnoTRtABmnzKrX
         QfSFhtfUoJ/xHM5Oi5JModNP9QvaCcFy04WmfzkY7uqWKEiTceBvDHlo7SRbmtFldGmN
         my1g==
X-Gm-Message-State: AOJu0YxEgPCI+qPGjR4ZAUN9VpDQ4QwKbI8dm+XuU9TjYYwSPAu9f2/s
	0bCWeKaXwHu2W3bpeb7Sedkb5sQHcYHEvfTC+AKr5ub7xER0V66pWrwwRn1cvTe8yJYjsRlp+oi
	/uY+uYl3y6mjYNgAmtDfNic7hmJwjRw5hARuZXfoauedwi49CxnLn4zAsbJlA3/2L50sv
X-Gm-Gg: Acq92OH0u3zBCZzjOXFf7/brB5aBsgBIfoKl6QjtsudSpLxVR0gUygnlMbV6XJxmOdu
	JasZr0Hu6ww2cwo9jLf5AVt2MkeGwiVALv5tiha/OKGs8Jz/A4gBQKhxJ1GUvZCg0lZfAx6SGKu
	DDuN3SoNK3LRcztnllVMvoUjaNU5+BYaypiZjRefL2FReZK9UOqsOgGVH71IiQaEjAxlBLqcB5R
	dlphxwzMfa/okayj+JufH9DOzZT7JGYXewmn1kopAJpzbvdg2ef5cl2tN5T1uD4QoWXtGfD/Ey+
	EQzyd9pXgJPrhfKzNw2hASCULwouJo3Bw0kdmhvsT8E4I4v2lGCGLQjoc3fe93GKhAi8dnmzdQR
	1U/k5MHYR97L1Y2zlDyTlskJvPkhzf9Yw2wwJ1WHpJKZ9rLj2g8gaK+b0cZgYx80=
X-Received: by 2002:a05:6a00:22c6:b0:836:900e:8743 with SMTP id d2e1a72fcca58-8415f35d58amr13665919b3a.36.1779692803478;
        Mon, 25 May 2026 00:06:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c6:b0:836:900e:8743 with SMTP id d2e1a72fcca58-8415f35d58amr13665874b3a.36.1779692802978;
        Mon, 25 May 2026 00:06:42 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fbb66bsm8423647b3a.45.2026.05.25.00.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:06:42 -0700 (PDT)
Message-ID: <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
Date: Mon, 25 May 2026 12:36:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2OSBTYWx0ZWRfXz5/Q4g7FDkEQ
 HaBjZYR4NugNsxTdY8kC3HHXvF/pxzgXLXqyiOYpsG4w3Q4eDAFdHv9+BrD2ghCBR4Wx3VjGxqw
 kRPTMBViVQlb9x559crqC388ie0OF9TNK4U288XwYz1eLhIrU3XUx7pA1zJGQgmi2NoOuKRi/U9
 forADY20nznd/1KhzyRvvxHA/EApweVMlpNmk9B+4QV5IdmxLsg+mP3cA+qT5pFtU6cNh3dA/Ch
 78v1T5BEgHkazFUsq4tTWiMJYeaiUsPY4eVFpf/r+N6D0yuLTKEFSMIsUiL/FEo1Pbbg9gG7jMV
 /95u7Z2DLlnYPQysf9YgL6HwbpGRu5PHMmMoxhwhmI4K8kttZ2J5DV+Xw0RByTm1j4exGA+6yPf
 KKlUtwsUh/Z4HA5zT2r9FNgZienlI+Mk1sLrNMz9ZTeYjFKzVsY4QgbCln10xce9cTsvWqGIdjU
 PIVpSH9qtb94bbgl8xA==
X-Proofpoint-ORIG-GUID: rcDSuFGP2S6_ISb3XvR4FyIW_meG8iuX
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a13f504 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tk3pCZAdYsx0TBu0sJAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: rcDSuFGP2S6_ISb3XvR4FyIW_meG8iuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109568-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F23C5C6E60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/2026 5:51 PM, Bryan O'Donoghue wrote:
> On 18/05/2026 11:23, Jagadeesh Kona wrote:
>>
>>
>> On 5/18/2026 1:05 PM, Bryan O'Donoghue wrote:
>>> On 17/05/2026 18:33, Jagadeesh Kona wrote:
>>>> +/* 1200.0 MHz Configuration */
>>>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>>>> +    .l = 0x3e,
>>>> +    .alpha = 0x8000,
>>>> +    .config_ctl_val = 0x25c400e7,
>>>> +    .config_ctl_hi_val = 0x0a8060e0,
>>>> +    .config_ctl_hi1_val = 0xf51dea20,
>>>> +    .user_ctl_val = 0x00008408,
>>>> +    .user_ctl_hi_val = 0x00000002,
>>>> +};
>>>
>>> I'll again push back on these magic numbers.
>>>
>>> At the very least you should be mentioning in the cover letter log why you _aren't_ making that change.
>>>
>>> Just reposting and hoping it slips by the person making the comment isn't too cool.
>>>
>>> Why can't qcom update the python? script that generates this code to enumerate fields instead of magic numbers here ?
>>>
>>> I get you don't want to do it but, just ignoring the review feedback is no OK.
>>>
>>> What gives ?
>>>
>>
>> Hi Bryan,
>>
>> I haven't ignored your comments & already responded to your earlier comment on why the bit fields are not
>> defined. Most of these values are static settings we get from PLL HW team and we program them only once
>> as is during bootup and are never reused again anywhere from PLL code, so these bits are not defined.
>>
>> Please find the earlier responses for your comments below:
>> https://lore.kernel.org/all/b92a2cbb-fe8d-4378-aa02-d91e2e4dfff4@oss.qualcomm.com/
>> https://lore.kernel.org/all/009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com/
>>
>> Thanks,
>> Jagadeesh
> 
> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
> 
> They are no less magic numbers that way.
> 
> What exactly is the resistance to defining the bits ?
> 
> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
> 
> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
> 

Hi Bryan,

There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
are not reused elsewhere, IMO directly using values from the hardware documentation keeps the
implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
comparison with the hardware spec easier.

Thanks,
Jagadeesh


