Return-Path: <linux-arm-msm+bounces-109607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG5AEBIYFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:36:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFD5C8B2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F519301E3E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43A13E6DEA;
	Mon, 25 May 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pecBBg+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDPB4Lqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC353E3DB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701675; cv=none; b=mqwHkYdSFONkoIAgx6bXYnXTYI0Vwe9uAv1Ila7kizuz1Mb1M+3bKLUAcN6WW3JE9dbr1etMpi5YXTVFmfoF7ScOGf5jlMacruibR8/0sf4mlgsEd+Uy+YFx6FSS6Smwzd4DMibQTgbf0VmHFdcKumWOsFIZuRFrbHociiUKF1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701675; c=relaxed/simple;
	bh=sHZwQ8kTbtkLCbKSor+QBOmkUwZQk6J8JDiHoGrcmzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTGyzjP2DPX+Qdqw44fZCuNuG98D4s9jM/Ncvb/EG1LzMb6hXTyV7akUJxRj0vOV0KkgvvzbjDUkCKd3lVJEM/fjmT3mi4x2nXXsqTBRmeDHOzH/TueRxMaqD8OkuPymxBc5XovuB7lez+tDOfWGzVnzrMBMIF0qbceTyctE3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pecBBg+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDPB4Lqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P70YK61688066
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=; b=pecBBg+SsBTrRmQr
	Pg3TUzF8MmHBHR09X/FqARhTkfJBdK/6RDtiEhRtj0mRcmkDgKDSdOyuEqytApXq
	WVyX2QxasQhCfnhMP1AAAa+uO8xVM0J4enEU1Tuw/qqDW08qzaNautouP7MWtx5H
	l0e14uTrUywGuttuq2vndYtaxZOjzhC5eBdrP8HGvsaBvTQj4qNigwBwMGN/mtnk
	gOkeXwzCYrLxwvdLGa9b+AqwunWbx9/zRFTvUn4dW+g53zBJ9Ebx4HKlEOWkPiEl
	2XgYhnhjsZ/MxUS/iGyWahjRobN1Z+WsZDjBbv8HOAphLPS69hhTRPa1uX1Z+41p
	Vxg53A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asx31y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:34:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so9513249b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701672; x=1780306472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=;
        b=TDPB4LqxmUonPgyOf8cS2BdCGQh6NvvwB4O+Mtc9kvyeXegmx2nJwyVJsAB41hUqbo
         /QGKYEt2XKsyfq210116/9elcLUyHOdRhcBntURiko5s8F2Fmg2nzcNBD9JZ596r+Zla
         x4R6yahYjyU+V7bWgnZEWL+moHo/ckrpKidcr6YkAggiG2/W4PxlU5Eg+8ckChgHhTEg
         AU61yhxnVq73TR4uFiP8Q+fcLbWDbI9sHwpP1xmKyZFpHyKbK1lCloXYYFMHcYWVhMHV
         pR/lnmgNX0FSSOBpkPDWPTBnbDpXfY3LZ+SyeE2W+Q+llPMLDQarYcxmA6hecmUC3fwq
         Mp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701672; x=1780306472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=;
        b=ZSNRDEjabyZA5qFt4s/rE0DIUKqna0KCsJGb4uT0Qk0BZAr9rEfggVFwZCdFvOlKui
         rnYKt18sn92gNolqC26qVNBMdz3quynJWU0RTMRNBltjOUgNVg0FUf1bqxS0UepRXwNM
         N4Q80XwwFPAEst82HS34wAVOzDQEdzcqZda7lRY53sSvbKT6ud2M3oBpe44hL6axGVMd
         hYd/sGo3Td8rlUwBJeOqnpo24VKd30znuz8qaNNIv0ImqQSJP+59hknbwFh2zBNadeTr
         DpjY32upKiVbiUzJBhRYsgWzV0PeUVJee4TO+X+nkLyEkuDwp63/64+LonVPj9+VaPVq
         riPA==
X-Forwarded-Encrypted: i=1; AFNElJ9l9gbvuyjWJEZsGNdkmPUlgqwHge6fDBKm948CzfjxEuUnruY1p9HmlHRQ3SEnLIEKZMokIKM6ziOWDXYb@vger.kernel.org
X-Gm-Message-State: AOJu0YxOvwKh5/J2C6bC+8E2nhAWGJAZTn6Mr+Q0j1IwRGVqCZ4IueSP
	8panVwFvuPWXue/Z9pu8gaIKqVs9UFVjB61jmvpuavuCVlLFFoPjnwLdMmupaG9zwcKSlYAlo/z
	xIYfQJvH98DCh9QH9MK3vdPMXqaOADcIbSS1N/TsgZumaduE8kgghxLRwRwSsRngbVcDL
X-Gm-Gg: Acq92OG5g13IoHntgB+8mLq8ggP+Kz2th5KUdprRZyP0PTGQ8NVBkeHpZ8xGvE7u6wu
	P0yTAgVWm/43KLqUPYnn6gSGw6aWCWTHsoOR2irrLqJ3IpGHVikV5N3tFjSMAYocRVakprcebdt
	lypIS8ZBBZkgNfMTRq5ZkqhtlLNTqo3lRuWbLiVI7ArGP/3p21pKprtRVfbGlVPhQZatSLxRc08
	n0WgQtzFdt1EfdXmOqzYbi838qY+AiNauTq270WFKOYbeCTlzNxzUnEfmwCllYA8vjMa1iKPd94
	3FSB7Xhzkb/QO6jtKxRCC4+89Xa7SPOZ/oq/Vk7En84FrUoOOs40feny2MVL4xxyPtL9sXC4+Zg
	UP7gpR1ikKmx/vbaZYhGrD0QdxmoJ1cBpQFUzdyqrzYdcs5womKTpPAHE
X-Received: by 2002:a05:6a00:3c6c:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-841a0c8731dmr1853834b3a.26.1779701672287;
        Mon, 25 May 2026 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c6c:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-841a0c8731dmr1853810b3a.26.1779701671783;
        Mon, 25 May 2026 02:34:31 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd80cdsm10474835b3a.49.2026.05.25.02.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:34:31 -0700 (PDT)
Message-ID: <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:04:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
 <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfX6sKHXEWCyT/d
 SLat77tTBR84eIAz4T5OFfUg39owCUG6oVGBJYGPVYt2bD3e6++1HpszEDRreKgLNqKj4sq3D0D
 CVcext63PunYJs/fkLV+2XP8snSMq+m6eAb2U5cMr+Q3ltB3u49O2LjqnRauxvhRRB/3sjk99D5
 4NCZZvU9NiqtDdecVsRA/zp7HydaCndW2+zYYFwwgqlj1IWsUSJqosHV7SpslEBTsK9sHqN8KvW
 UMuZaujipvQEviL6aYJD+nBHPoBI0CN4MK3GF2VO33+xY8nvs0SreArIMRBP9Xbulnl1dhwxhB3
 5GPCP7PL2HGRAcm2dwDUlZhn52CahSRrBQXo1+hLMnH+VHewI0mhRToMbcgsFhupN3dmzlXi/nL
 Cq2tR+zR+AwXqdR4RvK3gjBYHST0zxMeHSfMf2b4rZ137SKp7R/cw6jnmsLHSftdwjEFbi2TOKR
 ili65mWy3bydlPWNhHw==
X-Proofpoint-ORIG-GUID: vbM_mrw8nrdM6pk5mGWPJqu3R4C0dfrv
X-Proofpoint-GUID: vbM_mrw8nrdM6pk5mGWPJqu3R4C0dfrv
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a1417a9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=VqCRv7ZaHuqyx2qM4PwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com,vger.kernel.org,lists.infradead.org,broadcom.com,oss.qualcomm.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-109607-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
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
X-Rspamd-Queue-Id: DAAFD5C8B2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22-05-2026 14:38, Bartosz Golaszewski wrote:
> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>
>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>
>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>
>>>>>
>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>> mind is something like a new field in mfd_cell:
>>>>>
>>>>>      const char *cell_node_name;
>>>>>
>>>>> Which - if set - would tell MFD to look up an fwnode that's a child of
>>>>> the parent device's node by name - as it may not have a compatible.
>>>>
>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>
>>>
>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>> have the child device reach into the parent, look up the fwnode and
>>> then assign it to itself after it's already attached to the driver.
>>> This should be done at the subsystem level before the device is
>>> registered.
>>
>> Leaf drivers reach back into the parent all the time.
>>
> 
> But drivers don't generally assign firmware nodes to devices they are
> already bound to. This is racy as in probe() the device is already
> visible to the system. There's no synchronization of device property
> access - properties are assumed to be read-only for a registered
> device.

thanks Bart/Lee. Any pointers to take this from here?

thanks,
Shivendra

