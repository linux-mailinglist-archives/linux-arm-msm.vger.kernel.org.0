Return-Path: <linux-arm-msm+bounces-108240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGbWIY9DC2qsFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:51:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED3571353
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0FE630B7044
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBDB480946;
	Mon, 18 May 2026 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvo8jY5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgKI+xWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9F548C3EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122751; cv=none; b=uu6mTOHyGfM1OSf5oMXIZzs7xAwwjQDFYqQrzNUAQndxpXP2Ai2lfqrKtVxkF38OYxoGZzLdSC5zXQ7MdKVgaCD+wXCsitGAgBfl6lc96tjf7ylBqNtxIfYwRmUD31KZVzWFPhoz1C88XejD5c2uFo3iDHU2omKOVOhNmqJuJPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122751; c=relaxed/simple;
	bh=WPhVCpKbpwoDRiM7nIZ0if1ojNpzI4x4yH3wQxhgYIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEs9TIatUgTdBDaqrBgSkPSDy2PRVcjETRmM7k1Un8SXSpFISwztZqlDD0gDnaE2sUeVT4r8oEo9gf/jgM5+lkTl1n+zFYwVZWcyyjHuOGdT56GWmvW+oZF9ff4WpjjxrlIATMsCEfhffNR8Ix/Qi0FVO6JIjGEfJGuspj0KBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvo8jY5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgKI+xWk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFuau2700947
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=; b=hvo8jY5Plsw1Yz+E
	RdCH4GM79aGzqN5NMLXp7dg+eLE3RZzMYXH2CGLKHOXm5chzlcQ1b7Rh+Hf5PKY0
	eRvv2GFc1qzvGnSknE+EfZEHchUnmJncTNyXUGfyeW2T8SusyZiu/VRG1RGNA1xP
	LqbVnQShBJAa0l+idHuhs8drTwqK+exCgHdjLTqAYSkblMw6fZCtAmW8OzEwF1NY
	4xn/SIRPGbDKe3riO6C1eY4TQlWUyO2WmcVT3Zstl8NRJQGiqNWnrev4qMWP7kUc
	+hpVRRq574KMqqmxeFlYTU2ogX5uE6OheVIAM1010uUY0iBXXM+vx1XeY2oWRl59
	rr7EGg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82meh1b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:45:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso1392991b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779122748; x=1779727548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=;
        b=IgKI+xWk1Y0lMI0KcLHOo1hbWDoCV45NSw5pZZOvYS+3eGj901OfOQAyz0vBZWSo08
         dm8Ep/bt/4njy8ld8S6mHmtHBXO1gm/kRujgjqdyJMayoh1nziRLLzXHVnXDMVinTtIe
         HeuaKKaz2Nyy27QWpT6nDmuVLI+TYdwJI1FlrQIEt1HQ6gdZr3w058zx49MOmMKlibBp
         14wo0dG8uzqmEhP7FS45vzMAGdi2nWq3URDi5fKbISPXf+SAzbs2BDsQUESnnv6E3T03
         RzUj4lcSzCqG7k0Qj7p0mLRkNdwYe0EmKoq3PwabjK5n3eVlx/IFbY9vjMpZ15/v0QXs
         iREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122748; x=1779727548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=;
        b=kZ8KdrO2WVDGccX2yE66Dhcn/uAdxYWK1KIHUsK4UgSGCYzHpAoTJSv+dQtXdFU0If
         nBAYITwjcfAKm+MkkjMXWuD9giSCNgoGr+s/JiwHrNBhcP7aUFYyBg1I0r1Q4jZqUE6E
         0iYsYRjHrANXK5Nbj/Q9JyZmBl4u7R+lEOtYbN5IFctYHAzX7O7pn9TcyUP5bhVUxnXK
         b5HKMgxt02+urOTIsgx03ZiXtftejpsSLC1/UOldZ0Oady1luBEQRhYgnb3UAR8HZOB3
         VO7rnmB3JD0hN3FClnIr0G3zNn4jS6PiVeQnSz1aC/tyUV2kpQYslcyHukd2ry7tieat
         N1ag==
X-Forwarded-Encrypted: i=1; AFNElJ96a4NqbhiWzpIWOPKbN9oidgrE6P7gmKjD0OJQecrWBEd35KAk+3s5L6ECIQKEFh7ZCic9eZP7poiB4Rh9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9dVIR0q+1AdtYyscf8i6GEajQLMEJd31GSG71zkLMbMC3+r39
	e+Xl4jdWqd++uIoFX2EwPG+xmFxMvrXkZmxUUxYnqNpOj5XjEmetM/qkQZ6AArDdGn/KoCkj7xO
	iFolPmFWmitw6GyNXxCPAKbR5q4ee9CE4IDGI4qnBqzCE0E+mC7Dm0YEqWjcV15flUXJ9
X-Gm-Gg: Acq92OGsUzyXslfx83v85GvIsnp3et8649fcdC65hfEYmToLTpZndXXtXLA+m/KXMJn
	rX5lTKFQ9XjnW4BQYZVjiaH3SPjflAxtIEZNPeF9UUhpoFR9t/UWJnlcNRN6EAtLVSeUXgeRA5u
	PnATM0t7MGk2yERKHkejV0K3QOhxj6KzGrQpo1kFDBE/r/uOMgUP6Qlm6VP5KX9mBzOkCSxEF5F
	ngYvCFjaS2Bujed+0RNfg5XbXajXPnlOyjIHNITosJWFZzDu402kN7ylHkhFhhzUvbMp/DoCCeG
	J7o4kuPMu2n8gYL5XHpr/wDchVUc/564FDMRxON0UVyDbkFn41k4O7vFoo6JwamY/RcP0jov/O3
	3un0ojtEZTRbir5ciSjLAXZ1pGEXMpIHRPY6uzFNXqQipGG339JRmaJ0s
X-Received: by 2002:a05:6a00:2793:b0:83e:26b:528c with SMTP id d2e1a72fcca58-83f33d26f67mr15402123b3a.28.1779122747596;
        Mon, 18 May 2026 09:45:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:83e:26b:528c with SMTP id d2e1a72fcca58-83f33d26f67mr15402086b3a.28.1779122746999;
        Mon, 18 May 2026 09:45:46 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197995absm14411850b3a.27.2026.05.18.09.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:45:46 -0700 (PDT)
Message-ID: <bb032ac7-d818-48ff-9b9e-6f4534a5292d@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:15:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 07/13] power: reset: Add psci-reboot-mode driver
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
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
 <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b423c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=y87zbT2qfcRNAzJ9VcpEUA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_FDhcvgZYVVR_81zoiMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: tfOv1cCKQ2NPbQFE0YkkJtlpmOjB3syC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX9QhnXITCfDCq
 quhkAHhPG3HayLZo5S9eGAZUEEZGCcyE2IJ0OYzWNa7o5ZIn06naHa1av04vUpAJuHiki1SEU2M
 zXAulvIn5/awVmR9py6N1gS1XPp5i0R7Zc/4y567jy2Xr0FmQwPYe6cKlG+pii4dH2YeJcjy/p4
 eDoBymiElrY/+OAEqB/d1/7Z7NDxNwlF5MN7RIGoOsuGb1Vi+bdNT9rip4Uk5lls+Em0X6n7Ht4
 y+jVFncroClXPM6A7B3AhC6OIZuTU/e+kz261kQmCA9bTU304kJX/Myc+rwbSLLKMrLJlSPXuvf
 mVZhVWAY+8ms1MpdrZMiJIYzUOzTqA83uLgkU6+J+K6zFGHe/Il07cdLiyQfKawXM8PfbSGZvjk
 k1HvcJuQNzULFLJdrPOsnDD1zTBiDipjgdvEAhm6se+kNajXfUDEKkZuQfdwdjTXp7Mcuc96sii
 Qn3alFR6t5co1bL0reA==
X-Proofpoint-ORIG-GUID: tfOv1cCKQ2NPbQFE0YkkJtlpmOjB3syC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180164
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
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-108240-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6ED3571353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18-05-2026 14:28, Bartosz Golaszewski wrote:
> On Thu, 14 May 2026 16:25:48 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add a psci-reboot-mode driver, and define two types of PSCI resets,
>> predefined-resets and vendor-specific resets. Predefined-resets are
>> defined by psci driver and vendor-specific resets are defined by SoC
>> vendors, under the psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |  1 +
>>   drivers/power/reset/Kconfig            | 10 +++++
>>   drivers/power/reset/Makefile           |  1 +
>>   drivers/power/reset/psci-reboot-mode.c | 72 ++++++++++++++++++++++++++++++++++
>>   4 files changed, 84 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 36ba42209c0b332813a296880cd55798a5592d2a..4b0815c31679550f5ab719de4a5852990c7cc643 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21342,6 +21342,7 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>>   F:	drivers/mfd/psci-mfd.c
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && ARM_PSCI_FW
> 
> Can you add COMPILE_TEST coverage here too please?

Ack. thanks.

> 
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +	  the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
[SNIP..]

>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
>> +
> 
> You can drop the newline here.

Ack.

thanks,
Shivendra

