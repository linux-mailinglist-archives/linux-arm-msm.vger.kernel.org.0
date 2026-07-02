Return-Path: <linux-arm-msm+bounces-115933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dLMtOyZCRmryMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:49:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7CB6F62C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:49:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QbXVTwLD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OW+mUJQv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115933-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115933-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CE263186532
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABA539F187;
	Thu,  2 Jul 2026 10:35:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382FE3AC0D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:35:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988530; cv=none; b=HNs3BAdZA+355sQxz4pU0Oc1/AllTkFnZj/i/eD/XS2dy/p0ZMAWFjJE/7l+mlnPz/pH8Q9HhhYqOclOSzadrwTeZoKIjXbblFww1cBgpDorrei1uFm6dUJEfa9w2rVkj+P7lZEijG4KnO0O1WgQfeEdvuPdSpQzCBNccs15RlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988530; c=relaxed/simple;
	bh=j0GGMHg1diw/qhZYdIqWwYOIqLRfFgkBKW7hsoCV5Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpcYbtW7ETckfL3bb//MWgbw/DUlCqE28dwuPK2ZC9FLIfXPHDU4pjGk23PDJw/y2wxlPTzjLCuXIXFU9k1/ew3mV5inj5AqSsH9Sca6Az8wbYltsvzcBNf8ze0x6p+NR22OgYuyqzINsa0fBT+dvhHgdF4nFfgvjxzLJh94gY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbXVTwLD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OW+mUJQv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KU9W4115738
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DgYb6zsewBl7d28TB+1ifuWz2yIUGyplVmY8SkZ4A10=; b=QbXVTwLDi+dti1oB
	27At7urc7lkUQF1OYt/0BPgOjwR7wdpmaI9ax6viwpuNEM+thvFGUdgjfyqyWGK2
	Y6AWUkIUTHM1MS63VeqmZCWtxI5pv/FOgA+xpApwVceTvs1DDy+N0A3bcI6jB+tD
	7bb3ZkHZxDvnYAg+WheFn683Fvq+0dczq/s2Q0DYdEuVIlPVEKlj0goppnM2RDas
	3Grf9Xt6XaE0ixfGyq6n0mvbdYmL4GXgkefiUgJcTA8jCRhrQBOhE49jFgm++YB3
	sSO+c8ZX54u5Rnw22VHSAc0vnX6vBZgOCW/zq1qA2nrTG+I2jfxVEBJOx8RCXcua
	w/Myyw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9408w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:35:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ebb599e528so4077696d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782988524; x=1783593324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgYb6zsewBl7d28TB+1ifuWz2yIUGyplVmY8SkZ4A10=;
        b=OW+mUJQvF+Fhncc4PLez2yqF1NdhVW8Z/Fn20qChon/8OFAISX1mw/t51JAmuJ+RHL
         W1VQqfAxS+HLpWcQQYDJUc5lWIsIew7P7Nu7PrNxOQY0uKRvkMaCwxIye6ytU9dtTGWp
         /8yMsJKwJW4aHalfpxWxLRadKpduXLRCPGC6cESJAk3IMDIewfvl1xMh/+vXjoxXukit
         xivqBP9qJOHBmYJzDoW3/XXQj/iDqA1kG3//thiJruIWMIJqtoPvZ2HsId9lwloadfz8
         hWXTlvSwPg72LGc1k02Xr+uvszwyNWy6pBZNj/WqtbzIAWJXZzmFWhamC9p9IS/XQpej
         QKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988524; x=1783593324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgYb6zsewBl7d28TB+1ifuWz2yIUGyplVmY8SkZ4A10=;
        b=hALP10WjR0K80dWrOYUaF5p7ylK2z1GbEBd3Xgzdm8PurMg3bpufNaMUPGBwzH6Zej
         FPxyJ18VIpA7OPgmscr8EvfRvF7ZGGMa6ztG/G7PykIHLd1wE+UaM+3B5G1EIAXqVXak
         KLDiPdIgE4c8dv42Osib/f+ji89PQHcnADUb6DzO3Ad5i6Cn/eG3/PI47Ghkh+u2W4Vs
         ewgGlw+bTcmcCm6ZOqhkc8RGgTsUWJml97EsLgf3kmAAIrP6FlNYK9d3u28xtPzUN7Qq
         HuGPZ0xR1/++3iBDSTpRKBacJ8wu8KwmDDGUxS3uPT5qRIrLMX0vYLnsbdqiKsUBheF6
         u+Hw==
X-Forwarded-Encrypted: i=1; AHgh+RoOzceC1kAK8iIM8V7Tf8Vm/GEpg1RTdQIf7I8vkfP1xghsbQ8SkWWpiItbCOMUe14pMcdXe49v13m8eaDa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GLuGFjMzmLfgOnbX4225ZZn3ELz9lr+tHDguYGQ1vtfLJ7Up
	ZlFo609O37Tw+SKlJ3WfCFM1pm98ziqG9708GdrHIzzDNdONJ+ij6yIhmkX7OCNp8lk+/59JR7p
	N1hzG5A4bLjNHagIvXMf/SXXZQfy8/lkrZraY5KYTuUy8rodURN9P1ZH2Qk4sITO034Lm
X-Gm-Gg: AfdE7clgWYuyuJrHcDSqqnAmT6fTRnZMlwnRxZbK5M5FZL7hF+nByYtTbZtMmlar0Jo
	C88Swcgtd9S8xftBF3a2zrZLEaAgJkIWey0i0EN1klLjMGFa2bhQiVbTmf2Pv3Z8OpqyP03fTsb
	WxlIkOqkif/xTSl5U4Ac9FQifn+V7M/XyYMflAhYizMBB3cDh5L9v3m6lhTQe25cQDbRoh9ONIZ
	ITXqHMCHO5ZFm79PnPS8rVIVVrgQKEQOcOThOzERRmCqwUB1b06vx6JqNvAk3xZzy3QcM2rge4q
	FL/uCbdX+hlEU/wplni6XFdtje5r2EfvsQ1CSUAVYI92VcMD9f7ZtnPU009ETWq1/dCopsyKR1s
	nwj968kJC0XM2cQOGjdcQsiGRNBUo7ni7d1c=
X-Received: by 2002:ad4:5c4b:0:b0:8e8:a3c1:48c6 with SMTP id 6a1803df08f44-8f3c5b017d9mr54477906d6.2.1782988523965;
        Thu, 02 Jul 2026 03:35:23 -0700 (PDT)
X-Received: by 2002:ad4:5c4b:0:b0:8e8:a3c1:48c6 with SMTP id 6a1803df08f44-8f3c5b017d9mr54477526d6.2.1782988523574;
        Thu, 02 Jul 2026 03:35:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698acf2960dsm802383a12.9.2026.07.02.03.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:35:22 -0700 (PDT)
Message-ID: <9cc33cc1-b7f4-4fd7-9bf7-2ec58283cc4e@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:35:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
 <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
 <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwOSBTYWx0ZWRfX9BfHiArgIbnZ
 Fvzb4PpNVVLLQJMjvqIh42aRntGEQe4LvjEdvWB1gwNX5vFzqYPk9cy1X+EOCOADjYigxQ0JZ65
 lRHzf8rgmH4IPNmpW5J01VqP6CQJHn1rdL7YqFPQm2ohWwDqm2sHp3j6Muhd05bgJHHU1ayWquG
 pkp7vPCoSCKsHmnW/70RbPg65V4wo1dRHitRXIcqYeoW+LgkOeFM+BZQj2oYtL0vAginmbY0xQA
 WGcln/nRWSndSxwIDQftuq8aNCycW5Vf7FGFY0pYd5hVIuTy5NDjsTBO+QKVm8dm4ojTIQWVBVz
 e6BqTTDoItB3r2wigowvQABYKBjrMMuIXHMbRywBvby5xrA34O9V9XKcTC25QdoTbO9JLOqN5FM
 WWkrX+no2V/5ioXQ4ail/KUd71nWdvvmZeabW3/MEL5bS4sZ2KVhXBpwkHjA/F+3TPYrJQJoaM5
 HDoeP+2SV3QXdfOKaXA==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a463eec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0LxEN28Ofi49yOki0boA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: my7yfagW6tyhusm2A5W9mEVlXlU2hsdk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwOSBTYWx0ZWRfXwrsOadsyjA8H
 O9TNPRc+IADPHKp9gBSI7YLafRMsmURFI05MYZVZOMts+GBiIzOQYON1NnUVOaPoizXrdbFVkEF
 jcAWzu7d0VvrjzqBNKnvIVuhIlvaLLE=
X-Proofpoint-GUID: my7yfagW6tyhusm2A5W9mEVlXlU2hsdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115933-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yepuri.siddu@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:quic_mohamull@quicinc.com,m:quic_hbandi@quicinc.com,m:rahul.samana@oss.qualcomm.com,m:harshitha.reddy@oss.qualcomm.com,m:dishank.garg@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 4B7CB6F62C2

On 7/2/26 12:11 PM, Yepuri Siddu wrote:
> 
> 
> On 6/30/2026 5:03 PM, Konrad Dybcio wrote:
>> On 5/29/26 8:02 PM, Yepuri Siddu wrote:
>>> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
>>> industrial mezzanine board when populated with a QCC2072 Bluetooth
>>> module.
>>>
>>> The overlay configures UART4 (gpio16-19) for Bluetooth communication
>>> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
>>> lines to minimize power consumption when Bluetooth is inactive. Host
>>> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
>>> SW_CTRL is mapped to gpio86 for power sequencing.
>>>
>>> Disable UART7 in the base industrial mezzanine overlay as it is
>>> not used when the M.2 slot is populated.
>>>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> ---
>>
>> This seems to be a single, unthreaded message. Please switch to
>> using the b4 tool for submitting patches - https://b4.docs.kernel.org/
> 
> QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being upstreamed, we will reupdate our existing patches to align with M.2 power sequencing approach.
> This includes aligning the bindings, DT and also BT driver changes.

This is a tone-deaf reply to a question I didn't ask.

Konrad

