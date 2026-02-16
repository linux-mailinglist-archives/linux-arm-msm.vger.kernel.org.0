Return-Path: <linux-arm-msm+bounces-92896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CkrDxLUkmnsygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:23:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA49141836
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94C7B3010277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B622FE044;
	Mon, 16 Feb 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENVx6AEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgNfCy5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270F227EA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230218; cv=none; b=ejwKU6gUQZOLg1QIxuT/tMkM/0F5Trl1oxFlCmXMVJMLRGlFKnqkz5Pla2Et+8D0aUgZF5tH3rTY3d18wTZ+JjBQDmZF3mQs/jmIx09ZGIJer0hWAMGok/mwArkJ4WtjshZY7TNwx13ZrILf1cl3v91agXhzTZGk3y0Nthrr4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230218; c=relaxed/simple;
	bh=Zd8rJWDkiD0hxzvlvl+TPVGhSkLkSzKxlaiV1qo4CEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XX0jGvrUBenhgwWfujc0rgaFj0uU2XEK/JOD/JeyRjUsXsJOHNSiWhriRyNn04c/Fc7nKS6PxWhUp8UiBwpiqEgWqgAxep1yd92Dr95YVtt2RV6qFLBPErSElszOT0igQvNNT9WcL36/eUtqppHCAO9MMmIw87THM7AqHIl1MGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENVx6AEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgNfCy5t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FJHYcv2234092
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPADLFwqPS8c/UW04EemXLUF8OqaktGcrz8QN4rqzBA=; b=ENVx6AEonU5g1bK+
	hAOUKGj95rR1IEt1LlsXAWE5J5bh/0A0GG5nozVxQfH8AS1OJ2D4MO1E9CZxxDVb
	WzkpIWZAUHSBAGtSnOFc5peghqDJcVlQq4duXqEN9tgEwSb8U+lsIJrgBj2YsjZU
	VcJMMFUIXabwCxT0bx6lVOIociqY5nA0Zz1j1e2a6UosADbt5kU0IEM8JXVQru4m
	TScaFYiNxkNFucYWel5F2XOEX+NFGWGBGS77jadglaRhFouu+lVKGMZPaQ8ntFvi
	TVeKL5lkaAsqjKxKEYniX6f42iWbZmgTyhG9QpC+Uh3jkWv3zV8Yz+hPoQigx9Ge
	TYKyGQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw1evq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:23:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3562692068aso3658361a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 00:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771230214; x=1771835014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MPADLFwqPS8c/UW04EemXLUF8OqaktGcrz8QN4rqzBA=;
        b=PgNfCy5tSg9xOCkCnTck/BEMNZj/KwxeZcT/nvwEjAeV/+4hDJF/QII5+sHRrpH91d
         5ubwKBGp0e4HY0qiHvflGLec/9mOdjejDTkwtRX2wCzJDHNv4O/fwwBTRWD27gozDjSS
         hkcq8ZSMXqxODyys6AFmUfb8KnSTGgHDKPohJKJpsbfuXpo+uFoUnqNPFArcJUjFMYUX
         RCty0JyUDicKPvdOogL5GeSkQPl72Tsnz91kvrnFvEJkjvX3ZnJgcEO4nyeZy33Jshut
         Ps6W/pDGz8hHb9GYMXb6djED8UqhKb1UwtW3amDhpWwA+C+0eh0sICiU7/XiF/h3yC9s
         kAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230214; x=1771835014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPADLFwqPS8c/UW04EemXLUF8OqaktGcrz8QN4rqzBA=;
        b=BjlVddyJZmL8GwNPhV/2KzeI9/pk9fdAKjn4XZAmDaetNrFa/vf9XrMSYPvrgwS0Pi
         ZlPEusGjkssnihHNj8JAELMgn7463DKoe3Bm/7a0tyLO4GPI52w0IGH6V/CP+/A98+Ds
         tZ/CyjN270jAeMwnKseePa1VAye+oh85yz7pt2cykX2cJIv3Hmr4qBstLhJDGooOaZe+
         xafhf250H21UayU4LqvDFPR4SQq5LgETTSvnCtw153iW7w2/w9R8YQ+LUqAy7goY00qr
         +b8doKh3Td4287aFI8830KqJqOBumi14IcqP8+2SJH6S+WjtYRh886A6wKCx0Ky4nw+v
         xMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbo3qNaa2QZxfxu6+MkzhLME4sPEPg3XhNBmf+3T1vhnMKMDGbbKaNK5cZeUy5S58cmkgLaQQy7Rp2yJAo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0BoXV6ACIb1mE97R+/qmzlQC1aNkvKj/HQiqWh1++iesPN1NM
	4UtJt8d0H2dSXn1f8iRlRsXm39kEy3TgLYYL5sW3jJrBeFSgwpgF/r73EGDw0U4vNLwKNmrFA8/
	zqYEyIKpbRzzY+VZf0SAgV3c5mmCKAzIZfQHz4zdP1CsABcGJMIdX5ke+yVefllg4fLWm
X-Gm-Gg: AZuq6aK83ayM4kjVdjTLIFVZraWukNkwl1pri4Z9YvXmu3BztWoO2Ho4a4UGwFCCY5c
	5S6UE+BetiTDZ1zrFbu82a3M97mUINxlh0wHnRAzT09YctCbaJOKZBMOwVycR1EKeypFaWtNs+n
	0LXTJ2gwYJez0MWHDRXxfpAblFbc/psJon6hZ1FkOyBhBj8EJY+4VvxUhPobrD4kcu4/5ruei1K
	HcGEGXmx488Edq0PQylHIsNerg1gbqAzFKrCUS/N2A97n+3yWNJpSclw+D5aIw7OxK47MAgYqZQ
	H+81N7RQphni4Q0qs1mNF9B96zEHmDirFHBeJuT5DgpBbzpFhjYsjtkeHD1D9qSOyGwiA78urqo
	Vl6Atpy3+kwHNVxtUUVG3nqqNfz4cxS3F+7hn6lKI9OTAD/AAqx8Q
X-Received: by 2002:a17:90b:3fcd:b0:349:162d:ae0c with SMTP id 98e67ed59e1d1-357b5099fc2mr6171129a91.4.1771230214173;
        Mon, 16 Feb 2026 00:23:34 -0800 (PST)
X-Received: by 2002:a17:90b:3fcd:b0:349:162d:ae0c with SMTP id 98e67ed59e1d1-357b5099fc2mr6171113a91.4.1771230213675;
        Mon, 16 Feb 2026 00:23:33 -0800 (PST)
Received: from [10.0.0.3] ([106.222.232.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e9da8a2sm14939095a91.5.2026.02.16.00.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:23:33 -0800 (PST)
Message-ID: <c3e8b907-06b9-26d0-50a4-e9b091050b1c@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:53:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6992d406 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=wLlKp180pkOCiHd7nYENcw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=P2x2pnpvN4DjWuG0SLoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: unuOPKff1JRgEFR-52U61dvfL5ra3R_i
X-Proofpoint-GUID: unuOPKff1JRgEFR-52U61dvfL5ra3R_i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2OSBTYWx0ZWRfX/5sGTKSGruFS
 XfrQug//st0us89a/mwbLLdjhg1cqzfe41pqJXflGhGf1jfL/YXJJgGF2uzPy6PIeA9XZSV3arO
 SQAhdRBM2caGhFszqNQIRNDlZlObFEY4NS0KE01uvtTNpPKLCGZRPpVZWnG9UxBgPYgNouiEZFD
 fIiqXjM6cmrKqtuKfTpCP4wMQW9Mq3oJuLA4XApxYqNRFbGiLb52/pWynnDOJhVY0T5w2tlDQZN
 id89+tepiA9q0O/BPFrKK1fWR3XE8kFjnrCJ7DNnvM2ekfxPeCVlRcDWbbeG1KyROeletR1GtHP
 CnAiwFCl256SR14XXkAMnfMLquLiA0KCyQz/DwMBxwLtZB53uDpwLkh/50CxIHcwp7PgrQnGVVN
 WpLF1mYxjO+wRHmx9TQi2on3CM212uv22TgF+ppAYYPrTCnKyV5ePKPIjgWH6yjA3JqRsVs4Rw/
 EHTGvaPLCFYE5APo+ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92896-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBA49141836
X-Rspamd-Action: no action



On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>>>> 'firmware-name' property.
>>>>>>>>
>>>>>>>> Based on this property and the availability of the referenced
>>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>>>> updates its platform data accordingly. Boards that do not
>>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>>>> automatically fall back to Gen1.
>>>>>>>>
>>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>> ---
>>>
>>> [...]
>>>
>>>>>> To avoid accidental matches, I can switch to an exact filename match
>>>>>> instead. That way, only the specific Gen2 image (for example
>>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>>>
>>>>> How do you detect that for the OEM-signed firmware, which can have
>>>>> random name?
>>>>>
>>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>>>
>>>> I Explored on suggested alternative approaches and seeing some limitation
>>>> with the both of them:
>>>>
>>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>>>> the version string. The issues with this approach :
>>>>
>>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>>>
>>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>>>> Each SoC family uses different naming patterns in the version string.
>>>>
>>>> Example : For SC7280 Gen1 we currently see:
>>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>>>
>>>> So the driver would need SoC‑specific string‑matching rules, which is hard
>>>> to maintain if we are looking for a design to address all available SOCs.
>>>
>>> The only SoC with such distinction today is kodiak. So we can simply check:
>>>
>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>>> 	hfi = gen2;
>>
>> Agree, this works for Kodiak. However, Dmitry was also referring to other
>> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
>> generic way to handle that check.
>>
>> Also, please note that the Kodiak Gen1 firmware uses the string
>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> 
> This is not quite true. Kodiak Gen2 uses:
> 
> $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
> QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd

This is not the correct firmware for gen2 to work with kodiak, the correct
firmware (not posted yet) would have VIDEO.VPU.3.4.*

Thanks,
Dikshita
> 
> A collection of versions quickly captured from what I have here (for
> different chips, but for the overall picture):
> 
> HFI Gen1:
> 
> [skipping prehistorical / museum data]
> VIDEO.VE.5.2-00023-PROD-2
> VIDEO.VE.5.4-00059-PROD-1
> VIDEO.VE.6.0-00055-PROD-1
> VIDEO.IR.1.0-00005-PROD-4
> VIDEO.VPU.1.0-00119-PROD-2
> video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
> video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
> video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
> video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
> 
> 
> HFI Gen2:
> vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
> vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
> vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
> vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
> vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
> video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
> video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
> video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
> 
> It seems we can assume that Gen2 is:
> - vfw-0
> - vfw-N.M
> - video-firmware.N.M where N >= 2
> 
> All other binaries are Gen1.
> 
> Also, we don't even have to query the binary firmware blob.
> After the firmware is started, you can read the version string from
> smem, saving us from strstr over the firmware image.
> 
>>
>>>
>>>
>>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
>>> solved for <=8450
>>>
>>
>> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
>>
>> Thanks,
>> Dikshita
>>
>>> Konrad
> 

