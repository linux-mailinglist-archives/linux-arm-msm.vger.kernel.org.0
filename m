Return-Path: <linux-arm-msm+bounces-92457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBlnC6H9imlyPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:42:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99924119046
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BABF03072DB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CD6336EDA;
	Tue, 10 Feb 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SabpRx8f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVb1rvDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE434107D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716455; cv=none; b=GnfY/U0tqnZQQgNE/HYqJhjGg59m/6mnjdUBqU65OfABoX40Pcf6JWAZXmxiB0RTqWdbZkcwRH08hfBOAGM/BBQRdcF3CHhjbzwNzTjML5GNgiB8nS8spN2djFvKQ6PMc+JN0Bgb/35iw5uX1Ioqw+vvPLny8Ens1f783PA/P48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716455; c=relaxed/simple;
	bh=IaFf8Z7TstwEdQwSe5OreMHuEwOc6UsGIJfofeXFebw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8NQwBbLs5TtXwqKGl1uCXdrwXDJj2Rmii6Q75GXUEMemT308hE0W0TfaTWOfknHunaE1dypaSb0UedBOy8OWnI4Xuvv+1oeKpYeFfNH1AIsOIVOJXKaPx7f0hZ986DGqr3GIG5O2y8O3V3KU9l5yWwlS/oexWfOd8dFdfYKwUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SabpRx8f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVb1rvDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3Z3641172156
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HX9D/rIEQoc/3ALF0SX5kf73GjJxX3M6evfAte1kZ8=; b=SabpRx8fkbC5VHGV
	8GnNuiXaflitNXdNWaVnuxJ7yBgFf4WRxvtf2/vwaWo0UugKQsHUj5HMiy4LxRXV
	GtTUdzDJo4NtKv22W9oTlVuW/wt8bKo65dDO8Dfw1JqZalmk4cz6GSE3r7PjYrqa
	TTr1qr21dfHeTEcTfNPJm6407/jk0Lb1f3VyXzwsUBRl45aoirgdDwc8k6Yk2XBn
	M3VymF7vQOESmBewf4E54G5XlJnWQdoyEq5K3xCyY8/NgenqCjzsLaURQkwuO+MF
	0FSAPEnruKnaeml7HEosYYgYMG08z43YxirmJz5cBS0JlTMMEa3ElMxHPnn/925O
	aGCmUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7kftu15y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:40:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6187bdadcdso3469245a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716451; x=1771321251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HX9D/rIEQoc/3ALF0SX5kf73GjJxX3M6evfAte1kZ8=;
        b=SVb1rvDE7z2HR/mQRHujTScwN1CfBAcxC//HE3J6s2PxafO3lk7ScYwdCb39kQh0bo
         yGAVgiTJ+eq3p4kjPwAyEGJOSEF7WDsSaYECWAQ04D9/SCt+4qZouGgT63u2jJjn8sxN
         /ywcVkJKh6tBBWGVNXQF9wP8SajfD/KryqL3S95F+pY12HxCY7/UljIPu7Ft+339PKb0
         YLElC51vSQbV71AudtRIjRe8PjfS8aDwZOwUQNTjFvEjyixYgdcbpCPKRR9pRwfeNZRE
         7gsENL7PdiL4PKPmUzhVpWfO42YLJn2yZGRnn4dj9mq+Bn6Z763WdWT2xwi9h4TsMHwr
         SmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716451; x=1771321251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HX9D/rIEQoc/3ALF0SX5kf73GjJxX3M6evfAte1kZ8=;
        b=QFSzotr1klIKZp66tXyy5FTn4/sPoyR/Vbt3bZx1T5ephlI7nlKpxxU2nGNgjccP7W
         azJINeUxNAEokkLRiXPXHejaRuf118FgG1CotW13Cw4yZKA+62pfjCjJe2DaFrxCHmG8
         oH3CxThUkGQZPToiWrTilD7cqf1GWpiX9D85LG4u3oKsJIeMzBglbaHdEeiMxu+p8J/P
         i54l4sePbjEaWElQUOVA/cusyV0W801Gd3XkA+mGX76BrZEN5sTLfhD3dCxnaDpkZb8V
         SPwqbbi8y9fMPG2nsz3qStcfNv6VqVcsnPL4DTlB8+gBFJ/dproU6rpoUabCpuDcEPsD
         uldw==
X-Forwarded-Encrypted: i=1; AJvYcCX+1s1OfgG99Qt1Kif02cy5cuKFK6OUT2+E9/Kq9VSvLN1JUTjk6RFqmcAexXHShwR8WLVg2Sd5nI3zorq2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhfa3NCsYgFqX3mSl4hlkgykRBlhdFxByEhcMAKKwo+rC9Y2Xd
	4NUCWmCGZMdS/fiSH5nil3HJpH6NxJ1LAxVINw3rCoZqLGUXqwdRW8QnEfoXJOqeA4AuSAYrPbp
	usfdpm+S4bWkrHZp9ixdDsKQRmNWEtw7rDceA51ulLOOcp23/+urjHgJ+zAm48DzWYVp+
X-Gm-Gg: AZuq6aJqv4Cm0RO/gfJy5q+N9PlHIK6f5+XWABfZMkGn4cJrjDQrJaB40ERPjh5tMB8
	99NcMg+ChGusNJf4jFERjqGyyUFqJwdCgtOVrIRHZVk4rBIv9xmmnMB0FZ32riEFHIBkbJSfV0b
	YVtS0UEYymPbXSHmhuSvl4EZ7VaGihW16E/ZGvOzoLc4HzjqB6hT8F5JH69ztgbEDncp8yG3NCE
	35TurcRQCRslm646wuYA5h6pZc5149mhXWyunP9z68wMfb1r2iATO8bpc1qOulZ5LKEsgFrPqHp
	GfJjxWLehnNug37l9o2sE8PdErh7qZkRzS6xeiz0FV7ByGXNyN7x9dlpJDpatUuW9RKoCtYUAO8
	dojGYbnT/zENqlplTVMyeCE/2jrpHwqkXEItJZFW6NOVTfgwm+8+47g==
X-Received: by 2002:a05:6a00:2341:b0:7b9:8142:96f4 with SMTP id d2e1a72fcca58-824879b4c2amr1487364b3a.21.1770716451321;
        Tue, 10 Feb 2026 01:40:51 -0800 (PST)
X-Received: by 2002:a05:6a00:2341:b0:7b9:8142:96f4 with SMTP id d2e1a72fcca58-824879b4c2amr1487349b3a.21.1770716450825;
        Tue, 10 Feb 2026 01:40:50 -0800 (PST)
Received: from [10.217.216.195] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441690235sm13508078b3a.18.2026.02.10.01.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:40:50 -0800 (PST)
Message-ID: <87985615-e8a7-4ded-b082-8d1cb91d49af@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 15:10:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,qcs615-rpmh: add
 clocks property to enable QoS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
 <20260202070534.1281652-2-odelu.kukatla@oss.qualcomm.com>
 <b37e6569-61e9-4998-8fc0-603b83edfa2a@oss.qualcomm.com>
 <95d42fb7-2365-46a0-a995-c9cc51b17424@oss.qualcomm.com>
 <ac26d960-5c05-4681-aefe-4827b74ef29e@oss.qualcomm.com>
 <a9c2f6e2-0185-4a1e-bed6-fd1f542b2367@oss.qualcomm.com>
 <luahjv66e2h6gvxygmy2syzvt4rmdzqlfig6um74ysfhidyztc@eu4whsehmm5q>
 <f694b267-ec02-4867-86a3-b63ff2d908ec@oss.qualcomm.com>
 <trcbrxphzbgldya5cau42irrsnu7wn5swffjyvm74z7emfcevg@muojwgpa6ln4>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <trcbrxphzbgldya5cau42irrsnu7wn5swffjyvm74z7emfcevg@muojwgpa6ln4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX87KCfEeRic5E
 sS/MZM2nc7eF/Cpu51R5RHc7aYD2PxN704QdbFdjZ2aQdj2aUCd7fgGf30OkgfXkCxwv0m5icnf
 ZXH+aRsrjuAKbSD+onx8ATKBbqmsD3cMpKK50thUAZVuDd7QHdUpqzpwbHhsDk9HjAGzEnA0zIA
 lqyI0baw9G8eurtREprO6HYUynzgY/lzVV++VARvcgWRmlgeMUpgv6UkMDAY5mz523ysPAjEu2u
 skL3PRXgxZBVEv2S3JiS9VzdY79kHLq9hYcr4MSRB4kGGPudIaZ5HoK59r/BfA7+vpGdDJ6JlFg
 0C0oTWbeFoZlGSAFDvojAV+ItA4+H+uLBSdBhx0FzHOgS7DgIzLsAK8mJ/kpsd4fgXPzxh0Rx3v
 Yh5hot506b/vJFjP3ieybXl1/vUov2dpEoLTPCOxMKtKQJ44jipnbngbu37bVkCao0e2rx2hdnz
 SuDxpSRmsnTkM7rYJ5g==
X-Proofpoint-ORIG-GUID: D0MS7eOVFZ8wV6EdhNzT4dR6mUXpeNHq
X-Authority-Analysis: v=2.4 cv=XfuEDY55 c=1 sm=1 tr=0 ts=698afd24 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=C88Ajdsh_gp41bVUDNUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: D0MS7eOVFZ8wV6EdhNzT4dR6mUXpeNHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92457-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99924119046
X-Rspamd-Action: no action



On 2/6/2026 12:21 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 06, 2026 at 10:28:15AM +0530, Odelu Kukatla wrote:
>>
>>
>> On 2/5/2026 3:59 PM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 05, 2026 at 03:10:31PM +0530, Odelu Kukatla wrote:
>>>>
>>>>
>>>> On 2/5/2026 2:31 PM, Konrad Dybcio wrote:
>>>>> On 2/5/26 7:06 AM, Odelu Kukatla wrote:
>>>>>>
>>>>>>
>>>>>> On 2/2/2026 4:33 PM, Konrad Dybcio wrote:
>>>>>>> On 2/2/26 8:05 AM, Odelu Kukatla wrote:
>>>>>>>> Aggre1-noc interconnect node on QCS615 has QoS registers located
>>>>>>>> inside a block whose interface is clock-gated. For that node,
>>>>>>>> driver must enable the corresponding clock(s) before accessing
>>>>>>>> the registers. Add the 'clocks' property so the driver can obtain
>>>>>>>> and enable the required clock(s).
>>>>>>>>
>>>>>>>> Only interconnects that have clock‑gated QoS register interface
>>>>>>>> use this property; it is not applicable to all interconnect nodes.
>>>>>>>>
>>>>>>>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>>>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>>>> +  - if:
>>>>>>>> +      properties:
>>>>>>>> +        compatible:
>>>>>>>> +          contains:
>>>>>>>> +            enum:
>>>>>>>> +              - qcom,qcs615-aggre1-noc
>>>>>>>> +    then:
>>>>>>>> +      properties:
>>>>>>>> +        clocks:
>>>>>>>> +          items:
>>>>>>>> +            - description: aggre UFS PHY AXI clock
>>>>>>>> +            - description: aggre USB2 SEC AXI clock
>>>>>>>> +            - description: aggre USB3 PRIM AXI clock
>>>>>>>
>>>>>>> Should we also include the IPA clock here?
>>>>>>>
>>>>>>
>>>>>> Thanks for the review!
>>>>>>
>>>>>> For QCS615, the IPA clock is already enabled by the bootloader (xBL) and
>>>>>> kept on during the boot‑up stage. Because of this, we do not need to
>>>>>> explicitly enable the IPA clock in the interconnect driver when
>>>>>> accessing the QoS registers.
>>>>>
>>>>> Would we need to re-enable it to re-program the hardware if say the
>>>>> icc module is loaded after unused clk cleanup or after a cx collapse?
>>>>>
>>>>
>>>> IPA clock is not managed by GCC clock controller driver, so
>>>> clk_disable_unused does not disable it.
>>>
>>> The clk_disable_unused is not limited to the GCC. The clock is managed
>>> by the clk-rpmh, so clk_disable_unused applies to it too. 
>>>
>>
>> clk_disable_unused()/clk_disable_unused_subtree() does not disable RPMh
>> managed clocks, so it does not apply to IPA clock.
> 
> You are describing the current behaviour of one OS. The DTS should be
> describing the hardware. Other platforms describe IPA clock used by the
> aggre NoC nodes.
> 

I will update the bindings and the device tree to include the IPA clock
for the Aggre1 NoC node to ensure the driver handles it correctly,
aligning with other platforms. I will send out V2 with these changes.

Thanks,
Odelu
>>
>>>> As a result, the icc provider
>>>> does not need to re enable an IPA clock for QoS access after unused clk
>>>> cleanup. And QCS615 does *not* support Cx collapse.
>>>
>>> Does lack of CX collapse apply to SM6150?
>>>
>>
>> SM6150, QCS615, and Talos are all names referring to the same underlying
>> SoC family.
> 
> Ack, I was making sure that lack of CX collapse isn't related to IoT vs
> mobile case.
> 


