Return-Path: <linux-arm-msm+bounces-111816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3mKgAKebJmqxZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:38:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6585655322
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:38:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MoWRIXR9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CJSzLX1J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111816-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111816-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0BA23111146
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7CF34D91F;
	Mon,  8 Jun 2026 10:24:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503862F261C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:24:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914271; cv=none; b=iUArILV4JZtSawxo6Y2JZcn0zY0dj52Dl579zS3hbt+Tclw6Btje+fYgqi1n4ISYdB6VP6TYsj03+elGRSHYyETwgkOIgZcyWA3rSr/Pt971/KawLZEflrJLsziLtSiUCULknFKdcPe/ND8oX30uzsVmZtrDH2SqespRC/Ug/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914271; c=relaxed/simple;
	bh=ry0/wyfJvjHyRLLbRU3tqt5QD+4LC8uoNFaeEFr/D0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tp4Z2GDs1AdIeh7KKhufAEpHCT9YKyhIKVm9V8EjULfvfWfapL/eGxXpkzVpbDg6jbeZKsOTrrYzgWIkno0MWKoEVseqv1A+Bd+JuYNkaPD+oikfxZDTyn8MbdPQ3cQ5bZIYOgbcyEJZWa1XAThdR/UsaOSVhQtoKUSPqCKX9PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoWRIXR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJSzLX1J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OvVS2833009
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl18tt9uabj/nguluA4JVVRo9uAXjAMzBlxUvfENfq0=; b=MoWRIXR9JaXxt15l
	iYNkPZum6uBiwgomMuT3IxFz+D1u3ygV1S1vG4NhmYqD1Wafxwi07nIAA2MGGEVb
	apuK262xH6yiKTW1nCfTWqsBKO3cUZF2HsEYCauEbxdyWDuVaT/M18aet7PzC3fm
	DczfJ5qcXgdCfjFrHM+IrE4+DM+eYo89KwsLChZNNNGtie++brQfOkHxCuBwTjOn
	OSyqz2oKJM3UPa/KCGpujWMdmq2aA7V6OF7HO1Ao8+tHQgsHqW8NxcOQq2PlBdPu
	PGImVGsuL4XeKNjtCpehcaIRYFb6DnF9qbuoNMgwKrIbJNURlp/rs/rIN5Fd6YT3
	sy6aNg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrfdsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:24:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c3315d31so46169165ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914268; x=1781519068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xl18tt9uabj/nguluA4JVVRo9uAXjAMzBlxUvfENfq0=;
        b=CJSzLX1JXDoxYPQVuSj9oV0lbVkKCwLqdCf+99GpjnDxwEpl92BdZIidK6B3I1CTYJ
         SJioQb/lUjZEqVcm6A0RuGfIO9njS2f0Y5NR9SyRbz6u2ENhL+5m21MzpXtklodTm9S1
         +epzkTfz/0LR0tphCvSIv9NlYz2i9C6W6xaGxxBRCeYfbK+T4lenrURvbyCDsf6Z8bL1
         jgXi8P80nEZ0NxHDWEnf5i2SupYSdrkUcPf0kvu0uVe9EU4lYCPNJ0DpIUJ4FsbtbbV3
         O7YBaq13Pk+vQvvMuyHC1twMCllgXokegk35fQYasuHRGdLQYr0SYsOE+IiiLZyARWOL
         jmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914268; x=1781519068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl18tt9uabj/nguluA4JVVRo9uAXjAMzBlxUvfENfq0=;
        b=MtdWunvTB/nmTYuq/l8WdJHyVDR4GVTqbxfRAlIoP5BYOWuiizQPIG704ZjYw2nIjL
         b8iCo33K9d0RhO53gcjiFzM31nlaMd/yYBikya8E+JM9y3OAxIE6kxt3fXk0RnKAEqwP
         5VtzEOW7FGpUa0s1OwqEhx5SSlPljvE65YFSCzWu2NAPwNIvQxOkkERGIXoafcQIrQGT
         ScVXkpyU06tLhaEbSFthnqz6g3ksiPbZw88SIkuwWVMlapyz0TUTz7amFQ5HzYE9CJ5n
         s4du0bjcD5Y0l0U0TfXYUtytgwasPuyFBslTu6Bl2yiXQsg5my1kQUaHn3Gb/D8xnv+X
         Ljow==
X-Forwarded-Encrypted: i=1; AFNElJ/g15TePggcDyOZHmc8G/SBVTFXajjkq3gIlvJuIvON7hZinMdZG41JYSoUoJWbh5ASng+8hfJ0TWJRkF47@vger.kernel.org
X-Gm-Message-State: AOJu0YzCambgFQgIXrATWf4VpKyYuGzpBcYKNbF2k6knpcYmHKyz4la9
	yvm12kGPfALgyIwTpNZcjNjJzpTqI+maXF6H4U/Lf11BEbyejEjqKX0dhfZJ6IK+jy7Yx/eqbhp
	kKPDvp1yj1UHI7wdRRCVgBWn2biUeQ0Teq5TqDQIeAe1NGZeUS2WUbk/v2D9hPhs+P3BA
X-Gm-Gg: Acq92OFnnY6F6tN3Exx59A+Sdktgk9UXqkYZAh1uSmP8hecAfHGNZMkBSXdYL+/7diB
	ipin/vJWSxN4QzN1lE3A0HalsfmZAFk7aDEq+KJJk4+4v0kIAYci4Qz2MhYajKVXUf519SFAHpR
	XchniXgD6xhb4bwPvnLpVEtNN+ZqqNPOAYz10EwAx66fLRHR9keGBFQ+Vh5StxyESZEQ6cPIEh/
	+G+42F4EAU2utBx/Smi+0SnLqh2BBClLCK1UpSocdAtTKxnk75Y5Y97RlRaJ2HpsCKgXic+KdNR
	EnuyPBpYE2+QR3yP4hzQa5a8mjjUBOtUv71LhFobcyZQBjCj6qJhsr61uKc20jtKGPy3KdohMz6
	M5j0pEKUZ4TCsBfGMn3fUpIGZtoEMlNQHo0OrTzS4/lVSJoRngDhRghLldVq4hg==
X-Received: by 2002:a17:903:faf:b0:2c0:ca99:3d73 with SMTP id d9443c01a7336-2c1e7b2f203mr167666635ad.8.1780914268095;
        Mon, 08 Jun 2026 03:24:28 -0700 (PDT)
X-Received: by 2002:a17:903:faf:b0:2c0:ca99:3d73 with SMTP id d9443c01a7336-2c1e7b2f203mr167666315ad.8.1780914267621;
        Mon, 08 Jun 2026 03:24:27 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm237322705ad.9.2026.06.08.03.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:24:26 -0700 (PDT)
Message-ID: <81724048-0cb1-4305-b613-374c14df87d5@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 15:54:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
 <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
 <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
 <a5313752-17ef-4d00-9f61-7717e4f06982@oss.qualcomm.com>
 <aiQO6RdkqVnBuzp6@umbar.lan>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <aiQO6RdkqVnBuzp6@umbar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfXzmwjfoYfwilZ
 8+P4Ngw8ojB+BelkfhlhzbDExSBioCj82x8ZmyC/Joa96YVp/Z1n2vGBNAiVHcHKYMk32pvZUsh
 J88GZegZGKee9KiPFjL7yufENa3qnsunBtBgCli0S+Mc8TFXudHFJrgy+ogLQ5bLvL2bs6fCkZL
 snNx4KbXMX/Yxy8O09HDT5HjxhQAOPfMwQSAN9RnLw14LdvquB2x564nlY02pcIUD2aDbljnsAa
 DEGOzmqfPbf0Ye4QnY0YPkrebPsyQy2inYYE6OwmBpfb2TWRNOaK+Qm6qAfGjaJu71FfyN/ZRyR
 yHE1tdQEbgiguK3vfzZH/LpYx60tTYnv+KDo0PKzlA+YgWmQcoayL/RVQof5EZp+anf9aHr/kWy
 LKXgdnbYb5grJLgmJtQXU5SeJ4FySBX//gv9o4nJaaZc2yoHXH3ku2yGGrmS3DP4Zbzw5zEQdLf
 /N+EPGpN4xKwstwgrow==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26985d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IV4c8OSHAAAA:8 a=OE-cVudxAAAA:8 a=8Tz7o-WSTiqKbu9PhaEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Q6n48rkgcAvIKCAITAMI:22 a=xpPxSgvXB0Ioxg6u-DGP:22
X-Proofpoint-GUID: f53MqZwO-0QscvE97QYwfT9JPKvqfCOj
X-Proofpoint-ORIG-GUID: f53MqZwO-0QscvE97QYwfT9JPKvqfCOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111816-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dlcdisplay.com:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,yun300.cn:url];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6585655322

Hi Krzysztof , Dmitry

On 6/6/2026 5:43 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 04:02:45PM +0530, Arpit Saini wrote:
>> Hi Krzysztof , Dmitry
>>
>> On 5/20/2026 6:56 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 20, 2026 at 06:10:57PM +0530, Arpit Saini wrote:
>>>> Hi Krzysztof , Dmitry
>>>>
>>>> On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
>>>>>> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
>>>>>> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
>>>
>>> I can't find this panel on the DLC website. Do you have a pointer to the
>>> product page?
>>>
>> https://v4.cecdn.yun300.cn/100001_2012175013/DLC0697AAL21MF-1.pdf
> 
> "Invalid referrer"
> 
I should have shared the full part No. DLC0697AAL21MF
https://www.dlcdisplay.com/Resources/1760134404595535872-435-15.html
>>>>>>
>>>>>> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
>>>>>
>>>>> If panel requires it, so should the binding.
>>>>>
>>>> Ack, I will update.
>>>>> ...
>>>>>
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +    description: DSI virtual channel
>>>>>> +
>>>>>> +  reset-gpios: true
>>>>>> +
>>>>>> +  backlight-en-gpios:
>>>>>> +    description: Backlight enable GPIO (active high)
>>>>>
>>>>> What is the name of the pin in ili7807s device?
>>>>>
>>>> Display daughter card has WLED driver as well as LCD bias driver.
>>>
>>> What is the display daughter card here? Is it a Qualcomm board or is it
>>> a part of the panel?
>>>
>>> Also you wrote a lot of text, but you didn't really answer either of the
>>> quesitons. Is there a GPIO on the panel connector that enables the
>>> backlight? If not, this is some external supply on your (assumingly)
>>> daughter card. And it should be modelled accordingly.
> 
> Still unanswered.
> 
Display daughter card is Qualcomm board.

I misunderstood it, I shouldn't added the backlight-en-gpios
in my dt-bindings, I apologize for not answering clearly earlier.

The backlight enable GPIO is on the Qualcomm daughter card, not on the 
panel connector. I will remove backlight-en-gpios from the panel binding 
and model the backlight enable gpio at the board level.
>>>
>>>>
>>>> The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming from
>>>> LCD_CABC output of the panel.
>>>>
>>>> DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN of
>>>> Display Daughter Card (DC)
>>>>
>>>> In the display daughter card of Shikra ITP platform, we are not using the
>>>> external PWM for WLED driver. But connected the CABC output of the panel to
>>>> the WLED driver. Backlight update is happening using MIPI DCS command which
>>>> is driving the CABC output (i.e., PWM for WLED).
>>>>
>>>> Because of above HW configuration, we need to enable the MIPI DCS brightness
>>>> update on this panel. The below command of dlc0697_init_sequence() is
>>>> enabling this.
>>>> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
>>>
>>> So, this should be then dependent on the presence of the backlight in
>>> the DT. Either it is a panel-internal one, or an external one.
>>>
>>>>
>>>>
>>>> After checking this, I realized that this panel can be used without the DCS
>>>> backlight as well when it's using PWM based backlight control.
>>>>
>>>> I can add `has_dcs_backlight`  in panel_desc and set it true for dlc0697. I
>>>> will update bindings and add backlight as optional property.
>>>
>>> Why? Use backlight property instead. It's already there. Anyway, you
>>> really, really need to describe the panel in the bidings. Not your
>>> daughter card.
>>>
>> This `has_dcs_backlight` in panel_desc will serves both the purpose, as for
>> our current platform constraint , we need to create our own backlight.
>> But this panel can be used without the DCS
>> backlight as well when it's using PWM based backlight control.
>>
>> So in this case I need to implement the backlight as implemented in
>> panel-novatek-nt36523.c, panel-himax-hx83121a.c.
>>
>> with this implementation ,I will remove the backlight from the dt-bindings.
> 
> Much easier. Call drm_panel_of_backlight() and if there is no error and
> panel->backlight is still NULL, then create your own backlight device.
> 
okay I understood, I will not use the has_dcs_backlight.
will proceed as you told.
>>
>> Please let me know,if I am missing something.
>>
>> Thanks,
>> Arpit
>>
>>
> 


