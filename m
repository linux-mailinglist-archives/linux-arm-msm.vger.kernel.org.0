Return-Path: <linux-arm-msm+bounces-109303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNybNSFMEGq5VwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:29:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F05B3F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02954317231D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3923793A5;
	Fri, 22 May 2026 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ptexrnz+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFbiFneb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF191378D7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451523; cv=none; b=pmbdS3M3Gxhowee1Y/F+5RYSd5x6srZv6yR2PeC6fxp49hiuF4Tc4X1jnHPJ1Rqm01rbv3Yi3eCWtAH/S8dmOymyXvXZr4WkihM6Na79PRUQ4ffvhg8WFmH9b8YAWSyI+5r5hvPkMJQkWxWxbKmgmUPAU+PA0EdkCtpJZiwcGhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451523; c=relaxed/simple;
	bh=8bPCQx9vgOCU0cWDmOpsxkr3sr3KuUZG3ErxTmrg4v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrX6+6TitaxUa8hJsDX1ZMGVbKeGCAs1drOsD2sGuMCpk9FjRNav7RevUK3VfF92Pd9RF3PcU5Sgloe+igb0G5gxV6NTh6EjdiiKvkAqDk3O0iDAqBgMPkb9jWuq1VP7zQsz5DDX8IGArKH4dzt/mcwHFdBSx6k6Z/VjBamLn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ptexrnz+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFbiFneb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9wAfB313001
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W7eQg2v0CxxDHZFA3msI98q1SBsWDCGz6iSHghls+k=; b=Ptexrnz+2y96YXX5
	jBcQwa2Ms7HXs/z7bUm/Ivh6W0CKprff2xeL4OLdUJ/VAYZQXlrATdmtYkSAA/8A
	iheCTTbWfmp9i0n/JogQtOMEW9m/KQYrGhVaZHpyAvDXUqQz1ZgRy481ZaLJCJDO
	0ASZcW+7J/jX+rEuwftvD2xOVMI8NvFy6C3uI7bUq7vWDCBZ/qIkbC8iAwi+uv0u
	sYzMo3tIi39F/o27GmXeWoHEFH5bGD4ZGUauTcz0TmYMLan5FRUJTDkVEpH6EjJs
	bW0HEaltIs60T3FD5BHNrXR7+t+R+/mynPvN7oB+gZGXplUZya5JBJ+CqoW+tqda
	kvy5tw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833pkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:05:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575b9b7cc20so406928e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451519; x=1780056319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/W7eQg2v0CxxDHZFA3msI98q1SBsWDCGz6iSHghls+k=;
        b=EFbiFnebXbPq99u3/oXwJ8llFz/5iIMfuR6vwaJPrrwSlk4rhoP3ggk8QyFIr61Lqd
         Bv1guC+rD8yPYqoO9moJ+IWQWbj3sdpQ/IKmhxCmZoOinYymtSUVq0BSigGEZLqoZ+iO
         i0dbyb7naZ1c0TMMsB3Ad9jp3hYyBxTu5zcGPFI5zsMiE94vDVBv1fZcJIUOniRqs8Ep
         xD1yz+ZoHJZQ+vYXV6RhIEmzlIJXTR4WnB/x/PHltsQgTT278mvOfF75/b4Cp2l7thta
         NzNA8Xjp260gJ/zxCRr44IDLjwatpBQ7u2ctK2IxytEGPVdc0iPmSH28lDG6NGko26SF
         rdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451519; x=1780056319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W7eQg2v0CxxDHZFA3msI98q1SBsWDCGz6iSHghls+k=;
        b=s90wjzEk0BzWr4FfrajM7LdMe0IKDtF5EwVOTRyORlEZ2OWHCE1Y+S9UMXkLoGzftV
         ikxceUWxRmk/afISADzEyss6c+HnC8Ku8WYjTeYLJsPUruEOysv5pQ35xg/dDu0hqcyY
         1zQ7iJNC04N2Caj6t69qgKXpWflRgK4AK3Fi37mypZKWIv0AV14JhiLwlupp6HqAKLvu
         7FTjctTyoUK0OCZJA+Y1VBr3x8rCKI3YTaZwSM/HKFhGbnmi3aLfvcuGbCHnXT4k2YBW
         Gm9VGBRbj5ZixcgQV8BkWhoylgp3SZPXHqx+xHchpNFE23SAJZZgEZixZJX0YgFPvQ8t
         gbDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X47700e6scYCe9wqmjPULgUKIYxhNKtkDHiSKuInbVegLA/eyGMKLtOb+4QL3sZTgStMwPfegiQxb4CC8@vger.kernel.org
X-Gm-Message-State: AOJu0YxDB2gu/OwxYZw+Qb8/tPY+FFh4Ks9lWoBGJYIxVuNRB5tP97K5
	LZWza6kmdebf+F49o0AUZ7mvaJ3rJCaQmc9c3oqx5nMdvy4w09jRuDoO/oAsbCPW8GT/Zv+rjWp
	1ZnubMjqtVnml9+fMF6x2hFL2/xADyTsbwNkyM3ye0muhXSS/qMSJEBEavJVui2WKR2PX
X-Gm-Gg: Acq92OFmUK88cx+7F73x86O4o+Dv71FRgGQTUXwX6j7zkf3XFuQFaCHziQqxNYTKfSL
	9AX7b020Js38T8etnOEvyas8JjxRpuvS4WzhXKv7gSVEbVpesz0XxCjznudnB9Ed/JIPu5N5hvy
	dzafTqOyfutMQmKEhABlMLPr6VZPfPqRVrU4KiQcMXPF+x1aMH/ootgN/+zjocClvJTF0PUFm8q
	3/Fh8A/Qx+TMIfsNXUBL78R/o9QmVY87rV/NC/0B0NKgZ8h/xJb7S1UE8msztCAhSXptFqOWlYR
	rY/MekWW+BIKDe7sNrdCeiSzYbrxxKAlS5j47nCJtYZuFShI6TaXV9Sdc8qBWTOgoLzUz5ksw1J
	+3mtd4iYFqhsr/DctGgrIy6DpOzX6v9f8eoc4N1dBOEdXIQ==
X-Received: by 2002:a05:6122:c2d6:20b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5865e98ed72mr580073e0c.1.1779451519559;
        Fri, 22 May 2026 05:05:19 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d6:20b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5865e98ed72mr580040e0c.1.1779451519025;
        Fri, 22 May 2026 05:05:19 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm612312a12.5.2026.05.22.05.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:05:17 -0700 (PDT)
Message-ID: <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
 <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMCBTYWx0ZWRfX9j2OK1IFeV/w
 4sOzoeV6anW7cwn4XTHmWyocHSr958gIJRDRcvKFaqSZjYhZ7Fr5hFxqNECTQ7LAH3JyO7hqGlU
 yNGm/ZpUds6Ih5/G9XxLKLbauwWvCUnbr2YuKv57zN1tCzq2UqY6D1BdkJyBGFyHKtKLbV2BMPG
 LQfpKEylFUCvKL9MhS3nw8DQJyjuTrElnRxB2Tkx6iGvtn96B5HXIEdH1VxlXCn17h0X9VrpDkx
 gutS0qI0QKw9WHpJ4wcdIh8kyJln7jy6ladcIWBcBZLfCZKQmlEvTabciMIPbykN88aJ9r7ATyz
 MnUd7LBOv67mpVlbuQqWJ/eQDyy5K0zV7zDVEbQilh5PYEE9A6Gc240QBcmGidHEJLxU/0hNhlS
 4SXm5+PfcZIIeMQsLayByzzWz+9MRbcTNmi2zPt5MevA/9vDN85MWABrYgyeEQhw/0oEUz+hhhp
 hLtjmTohuqGF5eboFKw==
X-Proofpoint-GUID: sWCR4z7zvRzdTW5SCYQufqWyt-vLLKrw
X-Proofpoint-ORIG-GUID: sWCR4z7zvRzdTW5SCYQufqWyt-vLLKrw
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a104680 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ATWgodkRvw0t6Ni2IuoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220120
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109303-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 061F05B3F2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 5:06 PM, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
>> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
>>>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>>>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>>>>>> and DP signal processing capabilities. In that architecture, USB3 and
>>>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>>>>>> The DP part is roughly the same as on the instances without USB4.
>>>>>>
>>>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
>>>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
>>>>>> given moment (not to be confused with USB3 not being able to be
>>>>>> tunneled as USB4 packets - that of course remains possible).
>>>>>> The DP PLL is still used for clocking tunneled DP links. It may be
>>>>>> turned off to save power when no tunnels are active, but that's left as
>>>>>> a TODO item for now.
>>>>>>
>>>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
>>>>>> the Host Router, and as such the QMPPHY's mux_set() function is
>>>>>> nullified for the period when USB4 PHY remains active. This is strictly
>>>>>> necessary, as the Host Router driver is going to excercise manual
>>>>>> control over the USB4 PHY's power state, which is needed by the suspend
>>>>>> and resume flows. Failure to control that synchronously with other
>>>>>> parts of the code results in a SoC crash by unlocked access.
>>>>>>
>>>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
>>>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
>>>>>> submodes.
>>>>>>
>>>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
>>>>>> couple specific overrides, pertaining to electrical characteristics,
>>>>>> which are easily accommodated for.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>>>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
>>>>>>
>>>>>
>>>>> Overall it looks good. The major question (after looking at TODOs), do
>>>>> we need a separate submode for USB+DP / TBT+DP?
>>>>
>>>> The problem space is as follows:
>>>>
>>>> After a TBT (collectively TBT3+ and USB4) link has been established and
>>>> we have a link partner, we may (based on the HW capabilities and user
>>>> config, such as kernel params but not only) start or stop a DP tunnel at
>>>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
>>>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
>>>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
>>>> as a separate DP AUX host)
>>>
>>> So far so good. But I still don't grok if having a DP-over-USB4 is a
>>> separate submode or not. I.e. I see code (and TODOs) to detect and
>>> handle DP going on and off. Would it be better if we specify that
>>> explicitly?
>>
>> I really don't want to end up in a situation like we have with:
>>
>> $ rg _USB include/linux/phy/phy.h
>> 29:     PHY_MODE_USB_HOST,
>> 30:     PHY_MODE_USB_HOST_LS,
>> 31:     PHY_MODE_USB_HOST_FS,
>> 32:     PHY_MODE_USB_HOST_HS,
>> 33:     PHY_MODE_USB_HOST_SS,
>> 34:     PHY_MODE_USB_DEVICE,
>> 35:     PHY_MODE_USB_DEVICE_LS,
>> 36:     PHY_MODE_USB_DEVICE_FS,
>> 37:     PHY_MODE_USB_DEVICE_HS,
>> 38:     PHY_MODE_USB_DEVICE_SS,
>> 39:     PHY_MODE_USB_OTG,
>>
>>>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
>>>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
>>>> (and each of these routers is hardwired to one of the PHYs).
>>>>
>>>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
>>>> super high-res display at one of the physical ports, or a long
>>>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
>>>> we would only need one of the PHYs (associated with the router that's
>>>> wired to that port) to provide a DP clock.
>>>>
>>>> This, along with the normal (logical or physical) present/absent status
>>>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
>>>> or something along those lines to toggle that bit as necessary
>>>
>>> I don't see phy_set_opts(). So maybe a submode then...
>>
>> Sorry, I misremembered the name. The function is phy_configure(), and it
>> takes a union phy_configure_opts, hence the confusion
> 
> So, phy_configure() will be called for the DP PHY to set the DP opts,
> but how do you plan to determine if DP is on or not? Or do you plan to
> add phy_tbt_configure_opts ?
> 
> Another obvious option would be to set the flag if DP PHY is being tuned
> on / off. I don't know if that fulfills your needs.

Either this or tbt_configure_opts. We still have the muxing question to
chew through.

The bottom line is that all AUX traffic happens between the "AUX adapters"
within USB4SS, talking over thunderbolt to other AUX adapters on the LTTPRs
and the far-end device (and anything inbetween in a chained topology) meaning
we only need to engage the DP host itself (and therefore the PHY) after we've
already performed the capability negotiations

Konrad

