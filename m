Return-Path: <linux-arm-msm+bounces-105175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEM+LHXV8Wm3kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:55:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4E492610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EF2930ABE2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC833C6A57;
	Wed, 29 Apr 2026 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyX8jVoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRVnJaUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E4D3B7B8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455971; cv=none; b=aKXDKK/17R0kQONG3uH++Jn34nN0RTxZCScmXxxZN0wafNXuU9AsfMDT/CMJeF/8G12P90m6+i4MGW7cOPNJ3Zv1e9huZtUhsf59yP0uv3pGZUtM6B/V0ApSz688+z9B52fUE1c+zCJ5qFGvsd4HPuw++NMzqXIPYRY/wFc6mGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455971; c=relaxed/simple;
	bh=2iHOsCpqDchWIbn5ivwEg7G6xgoJ9fs2KwBGymi71SQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dxjko57Bn1SpAuuKNA2EWmjk7MbJRTPmej0m1Godq7Ope0ao/iN6jHuZISle3wTQi+mEuf4p3XYHEpFRCcHRgqFMJGen1TJQorn69+BeJSvuWXT3pVy1HYv0zyw1qJVaZSwEWitzDf1/DtBfKLO8v8qDwlcov7DGANqMDyiWs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyX8jVoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRVnJaUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pmvk901572
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=; b=ZyX8jVoEdRgS5TlB
	r5nhfjnzKPoIgUnZoDE3jUhpJaimuW3ucvLLLImDe4hbF6uO3n9uAFgT/Dd9RijC
	wa758TyTD1u96L3Xqd9iSGGAO2/WTnpt1+H2KtKwO5Hbv6aUJfAwOF0uUrCDYSem
	FfFEp7pWDKCPwA/pu6qm1ZKzklwgM3JCo/vw3EMi7BHolnfgYHMZdNO0aORu8wGb
	9Fvbttejukt71+AZlSryv5wHZ0EFtyDx514P4Bu07E05nO5wtKQD/1w88H3OMbkr
	WUFM0BRNjdPnZWLFn6RyP0lM2FCks4NQQN2vuytzLTBSH8XyTAXc5J8sfZxxqGvE
	EmvQ4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9h37p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:46:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24e9b4d82so5710975ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455968; x=1778060768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=;
        b=JRVnJaUBEt3HDJwZ/UqSd51v40OpVxnJP8rsdOnoN/TquSgdEbQ4LXJmhnUg8TFXmw
         EWpPH1rKQdv81zEwDa+Et1YazQWf8rc3S7SzG/ooxYVKlzWBcrp7gnLszUyJTLbkxmnF
         8WNE7sXQ8oRrlQkOcLD8LJvTxvyGlrSvHrlVVpKcXMJ0RRr2f4UIK3E4OMqpRcXXLUDt
         MICe25spGBVtlUHrCc4O09ASwps6cAeBVPP03EEVCwNPZ09HVzNB6xvYQMYsdrAQSGot
         K1rR7SaQUbREVMz5Y6aI/895b4wyiV137isBtsLazROjEEFEbX0uvJuepf/ubnVNgLoW
         yXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455968; x=1778060768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=;
        b=RvW7/8LadNxzbmEEsTDDe7P+t4IcVXELJgfuD5GgDchopePA+zgGkXIiVTG/sbOuFf
         TJdtNOl5be3eJCj1Iz2mm7KoO7LGXfcGWhCm1MXS6zjI0jv3/2akliN4gUtsaN8l5WA+
         KSGIuYX6TAeWDTiLhJh7k1+Z8Wh0gUhBq9wAMcMvstfvfcP7AzHXfobYQWdeOF8szmsE
         Lm2CJJYh2oQZY7M/rLYi6f/mYfmbT2AMm2IiTCj6vRzGWeBtjWoH7QdtdrrSaI/F4pgs
         YMDJwEm17mB+wylJMUyHhO7nu03CVicl1iuDA7iAZb1v9OtdGjiyWregsMw3l9ZopcHJ
         s6sA==
X-Forwarded-Encrypted: i=1; AFNElJ8RbvYFsxbC3IWwHXIwj6WsORMAh+WTahQ23XNUh4Uu95zf1v6q6kmgRojP5vdO84jKDKHdHEtGJxZ1ON/6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob10Gaw2w/AYYD+lccwAYAGBkaCS4LLEmHh8yq3fwMHOHEF3Y
	FxixcQcSW4cto5JC1C5eSepPPhIydJJbpcswmQkOFjxdBVjf+5GZzfwWUtlT8r3rV8iWEA2n6cz
	RaGsJ77G9kJCPJgjP+pQRjUEXf3NhFdEw1emW9jp8KlD+XZWScnvkoPNfLhk5ogULVsSVkJcgA9
	xJ
X-Gm-Gg: AeBDietVPzZnZQyiKT78sUaLZE001spJF+54OXeUAXornpFtQvaTZL1aOOBiQxmWXYX
	gyNDy2JWqc9CNKPpBQqHssTDVczfrpf9lN9sFpp9hYGTP8j0+WCyTToV2qYIV3dWteYkZenXKr0
	rBGPlj26ZP455AFG5PwC6ZQZY4U9DIpzSXKjrIhCrUWG5rjPCh/95WcSgjfxANi0ZmwDgyv/NMX
	lwleSxd3nuLmXb+ejwMQmaZggEb5/TraRp/Gan+YKRzbmmmBWG3v62EholVh9yvxGdyGg8IfJ4Q
	UFSBESxXRBejujUSuqFHntgDEQhwPYQPK3WIOEz/K6wJvZI8jwv3khex5/+EHLYXkfplUKwGkwb
	yPg9aK/xzXdSXbXu0kb2c4qqwQljn2qRVl7trEa9BsWUGB+493Kx8uYh80LsxSrZP65I=
X-Received: by 2002:a17:902:e741:b0:2b2:5099:2f40 with SMTP id d9443c01a7336-2b98824f071mr20792815ad.22.1777455967945;
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
X-Received: by 2002:a17:902:e741:b0:2b2:5099:2f40 with SMTP id d9443c01a7336-2b98824f071mr20792365ad.22.1777455967428;
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98897112bsm17629145ad.67.2026.04.29.02.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
Message-ID: <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:15:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iG5NYpH94SjxKGiPFbLdxT8LYC0G3s_M
X-Proofpoint-ORIG-GUID: iG5NYpH94SjxKGiPFbLdxT8LYC0G3s_M
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1d360 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=44wx8BIOPdhe_q6X2V4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5OCBTYWx0ZWRfX8Sz3RNEdWfjB
 Q+FaZIrgjh+gFGdAIabWULv6Abg4vsGUafuDVq0DmTehfC5y1bxpKElne4A26catzhIedShv1Ae
 css4CLtT50RgMODllysik2Z9UXfdy6hmq1zpkcaqL0DNSVtmRxKo+lR/OGKTzL2I5WQv63Ru4W8
 lFjb3CYeJQ7RF4qL2G7KGgJ9cg4B3myQw+46+YaT/p8SEo61xSOERgYmkrNcNEtjGLlc6IVL5rk
 LPXyyQMKJqYOUlYkYC4QGLFizKCdXc2wkJB5BevfKIs6juvD80mZYWUX1jgyAMKQJ6SSy86vIp9
 udaBsdECeEiiLzD8aC1l2HosSlVi+qJp3xkegt3k8CnXkNDVetbJY0+BjodEKi3rI59pDj2B+hN
 t4dIjMrIPMx0CKeVpfCGnFNoZH815l1drIIvX/UW+c5yvRFNxjHbReA0tQQiORSXrumefCYsKc+
 b1b1/AqDdXqyqcJu7aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290098
X-Rspamd-Queue-Id: 37B4E492610
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-105175-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 28-04-2026 18:33, Shivendra Pratap wrote:
> 
> 
> On 28-04-2026 18:21, Bartosz Golaszewski wrote:
>> On Tue, Apr 28, 2026 at 2:18 PM Shivendra Pratap
>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 28-04-2026 13:33, Bartosz Golaszewski wrote:
>>>> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
>>>> <shivendra.pratap@oss.qualcomm.com> said:
>>>>> MFD core has no way to register a child device using an explicit 
>>>>> firmware
>>>>> node. This prevents drivers from registering child nodes when those 
>>>>> nodes
>>>>> do not define a compatible string. One such example is the PSCI
>>>>> "reboot-mode" node, which omits a compatible string as it describes
>>>>> boot-states provided by the underlying firmware.
>>>>>
>>>>> Extend struct mfd_cell with an optional fwnode pointer and attach 
>>>>> it to the
>>>>> child device during registration when no firmware node is already 
>>>>> assigned.
>>>>>
>>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> In the following patch you use this and violate the supposed 
>>>> constness of
>>>> MFD cells. This also mean you need to modify the mfd_cell at run- 
>>>> time. I would
>>>> prefer introducing a field in mfd_cell: bool use_parent_fwnode which 
>>>> would
>>>> indicate to MFD core that - in case no fwnode was assigned from 
>>>> other sources:
>>>> DT or software node - it should reuse the parent MFD device's node.
>>>
>>> Have one doubt on this, When we fallback to use_parent_fwnode for cell:
>>> psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point
>>> to psci node.
>>>
>>> But we want dev->of_node to point to "reboot-mode" node. This may need
>>> an explicit assignment again of of_node?
>>>
>>
>> Ah, sorry you're right. I'd like to avoid having to modify the
>> mfd_cell entry at run-time if possible.
>>
>> How about a callback in mfd_cell like:
>>
>> struct fwnode_handle *(*get_fwnode)(struct device *parent);
>>
>> If set, it would be called from MFD core and would do the name lookup
>> and return the fwnode which would then be assigned to the cell device?
> 

Or should we just drop this patch for fwnode in mfd-core?

Export a new call in reboot-mode framework as:
reboot_mode_register_node(struct reboot_mode_driver *reboot, 
                   struct device_node *np / fwnode)

Use the parent node in psci-reboot-mode and find reboot-mode and call 
reboot_mode_register_node?

thanks,
Shivendra

> sure. thanks. We can make it a callback from MFD core.
> 
> thanks,
> Shivendra

