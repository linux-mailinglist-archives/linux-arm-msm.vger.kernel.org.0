Return-Path: <linux-arm-msm+bounces-76529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A38DBC759D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 06:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07D37189DC84
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 04:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0236624501B;
	Thu,  9 Oct 2025 04:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWW3pZxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70108240611
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 04:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759983301; cv=none; b=HD1sIkexSUF4j6AErOC0qWSlkQfrerX6ILvsRJ2bob1+2m7PW4F1e2119V/O3tI/yMwf6wkBV8IOtDAFsMu3H45HAdVMELgaSsAEzOHrw33oXtTuDopJChtBYWL33zYXMgt0sxlDkT0NpzHDTSkzrLcab3xst3X9gCUYkmuXyCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759983301; c=relaxed/simple;
	bh=oe7VuLNsgGCgL70KMCtbXqjMfR3AriFiWIM7bP1/9eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph8XVeV/o4VsE12IwYLdOsRfx8sLO9syLiRJInudmtWwNsVLc0NxXottVwI6WP39hdW++YUImyHUe/Eq+qmDzOZ05P+KY82SXQ2ZGxfueELni4Qsq9K4Wf2KQTR7RhgZFCJO/iiVTMaTDcb1eTbg2SaDZVDemEUw/yOJbELMXK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWW3pZxi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5JBt008739
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 04:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/js+3taDhrejgB7UpAvscxRkqjCCg2tof4BrdDtD+8U=; b=kWW3pZxibhYsonos
	xFC0Upj6XzEn7h5r4ubL8lgzYXy+Q0HtPkjbzsqXRM18PRMGM9cyKHwjDEX5qYPF
	ZY/Wk1YVir1y0qjNR0J8silgm524wvvCaPrdA7oPaZakeKmDjFwD1z8tcfEDnThV
	5QznhUwAmIjzmOZX+M+Nxokx/dnz/dFtADSLWaq26b8eJWvs0LlxjFrqchiU34G3
	ItF5lxyUg9dRPsSDfRq3XEKOPUIg4qGP+O8Cqz0nRPK1CV//hcjxz/ObvGFose9E
	p9Vk6gT5CEWB81YKxm00drPgcowOoU0hrMVX0jKOiToYs9PRLDp5MrUpQBJAJQ1I
	D4TI7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4n9e03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 04:14:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269b2d8af0cso1554255ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 21:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759983298; x=1760588098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/js+3taDhrejgB7UpAvscxRkqjCCg2tof4BrdDtD+8U=;
        b=Uv6GuG961+OthsskMMbwuw2CFIT423tr0OS5bQIfoqVGLIJCm1DXw2kXPKdqwgiZ8F
         9sAeER/jKEzj93OnYfwTbna1umuCh9EiPdM3OCQ0x9ap0Qsv6oRRHY36Ikn1pIUsHDXs
         lc1U+v2Lwdk7ZSCtu6V58vWLDQ7Mrjg/J1nW9GS/ClsJkbPWOdmjAyDJoJ7/351+68tG
         9lsniB7dqY+1D/CwYd3jSUJunuk0NteUuWeW+QLRTQ40YYWHxGVvYX9rPxxA8HkoyRXw
         W8FNOogrLEND1568S5eP4xBXstTJkpZChx14IGU1yPh07ZkBVV6wbgcVYLtMHqvmSNqz
         goxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYemjGftTSPNXIa5OyBZfRpoLB5C0qh1WTUfGsO8pRIAyJOyUSnVZodYd3kc27d73bOSj6WkTngwmD1r2l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0MBLhymjaMaLa6h28fEzcRaD0LnGT8pAdp9YH/EFGebakWy3F
	rNiKH18k85oc9QISGu4Rkl9nVg9xADs16ZI4v+s/v1dq/sxAX3KsbTFMSNKSWoFc7+nnnCybkCC
	tuXrEKiPtNlHkrYvsm9e9Y7+mxs6VDlk3UkqXqGSIFkHd0hs05UWFZ+eME9BN//skE8n1
X-Gm-Gg: ASbGncus/kIjGh+541djDvJbRovfG1h0tShZhG9aXV9v6f9Z54inkRESNShjxDXJp4t
	7VUIDNisF9K6H335RXEjHOhcK2CAO4DJh3GhC1vlylq6V9caNsYtnMeDIgPF5kkOpKJHdase9nG
	s1yAd7C9BLUArSr80fu24TwQ9OGS550GHNClDLrilX+aTEuBVVBC4iqt6eLDdnJR4AwwYFnR8st
	y9d/0xwRuQRuWNTjYcTAMKN0zREaLkHktM24XgpU7z/H8Y23yfZnWSctNXPlz5DbMpuaOcgGZzb
	aLLffDUH5xmqVjzYrZU3xysPalcECPw1SXTJA4mQNcpCCLS9FeyMqvywvRcezptET+ctVFYqJ9N
	V2tQ5bKtQcJSi/Np+vHpdKSUgIBnTaG0dlOwcXATfiQ==
X-Received: by 2002:a17:902:d491:b0:253:a668:b638 with SMTP id d9443c01a7336-290273c598bmr46026465ad.2.1759983298267;
        Wed, 08 Oct 2025 21:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUYcLZvr1TDduUWf5IW+YzwXsZMsBV8TnFvLqPUsLDWvggUY7/sMA/hO5Cu4Ze/JJFPYsNLA==
X-Received: by 2002:a17:902:d491:b0:253:a668:b638 with SMTP id d9443c01a7336-290273c598bmr46026265ad.2.1759983297782;
        Wed, 08 Oct 2025 21:14:57 -0700 (PDT)
Received: from [10.240.201.55] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20f8csm13510955ad.49.2025.10.08.21.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 21:14:57 -0700 (PDT)
Message-ID: <9ba7562f-bf6a-4759-b4a3-aaa80c45e247@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 09:44:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 07/14] firmware: psci: Implement vendor-specific
 resets as reboot-mode
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
 <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e736c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=yVxwAGkkkSKiqd9de7UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ueuFVjO1wTXdfQ8-l3BL1ElHS0a0AM6q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7DJb9qJs7lRf
 XLtxyowAS3jdy73arxVMUNhMCw8T6J2CJG7a2QEI2X/TL6rkOjkM4V3lOwBvEL43P/JimxJpDlI
 6NWbByG9dxgigJ4+//w8ZjgRDSs9M85GD+GxVPkflEELlIxK/UoCyicP0JefcDKKRvuljH5xYYt
 1cqlHFk8Rt7QpcpIxGbxl9K2S5Ojd8/Vr+MooKvbU42ywmCmViohRXvPOF+rEJyHPy1z2BXG9UW
 s9ubuxKjhHvvTsRWLBDNKMGPE1wdv2mst8dAaeCNHD8ToQxGZsk3ewFMTBTAf/F36wEoPkI5/+d
 ZhL47FJACgzflgFRvNhEpNMIXp+ZNzgVZsMv6SVjVIsKKhbFHafCF5toDVzksKePY8qic9xMBz0
 3Bs+IgTGkrUwOAf0nAry8a6ri4vpTw==
X-Proofpoint-GUID: ueuFVjO1wTXdfQ8-l3BL1ElHS0a0AM6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 9/22/2025 7:10 PM, Shivendra Pratap wrote:
> SoC vendors have different types of resets which are controlled
> through various hardware registers. For instance, Qualcomm SoC
> may have a requirement that reboot with “bootloader” command
> should reboot the device to bootloader flashing mode and reboot
> with “edl” should reboot the device into Emergency flashing mode.
> Setting up such reboots on Qualcomm devices can be inconsistent
> across SoC platforms and may require setting different HW
> registers, where some of these registers may not be accessible to
> HLOS. These knobs evolve over product generations and require
> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
> reset which can help align this requirement. Add support for PSCI
> SYSTEM_RESET2, vendor-specific resets and align the implementation
> to allow user-space initiated reboots to trigger these resets.
> 
> Implement the PSCI vendor-specific resets by registering to the
> reboot-mode framework. As psci init is done at early kernel init,
> reboot-mode registration cannot be done at the time of psci init.
> This is because reboot-mode creates a “reboot-mode” class for
> exposing sysfs, which can fail at early kernel init. To overcome
> this, introduce a late_initcall to register PSCI vendor-specific
> resets as reboot modes. Implement a reboot-mode write function
> that sets reset_type and cookie values during the reboot notifier
> callback.  Introduce a firmware-based call for SYSTEM_RESET2
> vendor-specific reset in the psci_sys_reset path, using
> reset_type and cookie if supported by secure firmware. Register a
> panic notifier and clear vendor_reset valid status during panic.
> This is needed for any kernel panic that occurs post
> reboot_notifiers.
> 
> By using the above implementation, userspace will be able to issue
> such resets using the reboot() system call with the "*arg"
> parameter as a string based command. The commands can be defined
> in PSCI device tree node under “reboot-mode” and are based on the
> reboot-mode based commands.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/psci/Kconfig |  2 +
>  drivers/firmware/psci/psci.c  | 89 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 90 insertions(+), 1 deletion(-)
> 

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

Thanks,
Umang

