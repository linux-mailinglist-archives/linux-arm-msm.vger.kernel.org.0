Return-Path: <linux-arm-msm+bounces-67155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028FB1610F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF1A545FD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40967292B57;
	Wed, 30 Jul 2025 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZFLgRwk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8826A296148
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880948; cv=none; b=N9APd/XpEWsz9qhD6+fRCErsHp1dsszaInUa636rnkUZQfXAO1f1R1AqILVlw6lR+08Jyf5Bm7o+JsB0rfIpdYXP0fvQjgho7fTDri18ZALkhTT/XO8EZbYOYkcV+rEyUYvBdiwWJZKDwkqkLQSsLB3DfDfIerPqmErtvinhs1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880948; c=relaxed/simple;
	bh=iuuKGIizxFYPlT/bt0zoSMj0nd3jCkg/TFY2jENqJBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYI8XnqqKITVGUH+epSWQe8Nc8Rken5i98FaQejMuQP1bmSt+kaLswikCDUiKzyMqqM/mMlq14vMhsaJpxp/NRa1yVA+m+urc/EWqqtd1dDUNcIXqG//aBaB5kotlM2wOFb38JOwwimrwRCTuO+DjgqqeA5OnlsxNvgHcPNA51Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZFLgRwk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb90g017604
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNDjzyGP/l854i6KT01aZoOncfqe5cUyUJTb5qnC1kY=; b=hZFLgRwkVOm0twVG
	7m3CXCrAyBdRSRzunSCBpu6djgXBoZcpeLkDHNYd2NpE5xF6cyxTZA2siSVH7HIa
	Tv/nAKLx4Q4QsS6Cc3XKH8hWf4UrPm2OVZZgwaXFt7Sbucn4Kj0bBVs6BIZ32v4P
	cLGuDWHyOqn969q4Tn8BC18yfsUAZCFSsSn1CfaLgmy9caCLf93LjRZwUcpCxUrY
	35EgB+ICiKCym9XzOZ+Q/l2l34T8Ufn2hfLyhLL1NGZ1874NdY24SBQPPouQU8To
	6f8oQGEQhft2GVVqTYgUNV7QNnnUEImy3SXRfmTlU+7Gfkry2a+7Xbd1tMQfxMcA
	5JbZGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda3rmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:09:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748d96b974cso979419b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880944; x=1754485744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNDjzyGP/l854i6KT01aZoOncfqe5cUyUJTb5qnC1kY=;
        b=Bi3Ytn6bBPNDgmSt/KG64x55uDravOUwl+Hq6jhm67/dQ/mxxlE+fzzgA0d95y9KI0
         mA507XAyOOjBtCXGBbK+oKVlZuthlZ+j81QHKDKtCoMAW0TjIewtrw6V2BaVG8Q0UVCr
         FDyVDYcJrw60D+63t9rvVWENiXyIc/nF++D6HX3nYyrPMFRVAFpvH1noatfzDv2lu4p9
         MwGI5zvkIKYYuiuZQfg+MWoygXZ2QV6ucyI7VuFj0q8WZmYZlFd0xBmaY7r1RhGeNrFU
         u3yb+N9vQerG9mvIdLIwCuM0eaN4GqYqu0B5trQle45jugRQnM3RBf8SUwa4xhmKcFCj
         KOyg==
X-Forwarded-Encrypted: i=1; AJvYcCW+6BAr2/mYdK5Dpj6zu7g7TJOJE42YcO391O9nufplWDiVenBfYCuqKAzXo0siGh7UbGxzDLeok9SsezfB@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwa/A8WIOifZ8EevQOJyPtexH3oc8ccDNW/6WxrKAxUmq40/a
	4qMcyXdOlk15StBxAJ2es5o48GzYagJ/WuQxdKY/n0UL3gq5oGRlB8x38lthkrA7RgpLEr2x2Aa
	tI7GDAYX3nCtejJPCO5wcI7frF8R6InU8wbdryRhcJjG+30630Zw09+fWnEp2k0uykQsU
X-Gm-Gg: ASbGncvSK5OO4HYhyQU/QRw1H6EHj1nVm2RK1tORkH0WsLiJKzqh5m9AjD9mBqO1kRD
	xGYMvoFXP8ZjnXhNDK+qbL885AIVNyNTl7r60UprAyrCo07d2MVt3nP/QUCL3sE11uHrGgy04Mv
	E6eo/IM9OPF26AcQK9gXvt+R2CeGTlf5wSE6Pd4PIrKOdSN0Svn2AYnAnrRu54LhPuBrCaEOdPE
	FNUUM+IOnng5r8RGK3k9dO9gLa1+Woc/jMsr8Nv/Jim1BC/C/ajTrm329XOJTQUx9OPVCkCfxkK
	sAjv4BwaTHLCB2EsnYCBqZUYnO2p3S8YT1PmArKZ977Sd17wv/vOiWxHPjvcOMm0YydgL6kIaw=
	=
X-Received: by 2002:a05:6a20:548d:b0:239:c7c:8de8 with SMTP id adf61e73a8af0-23dc0d3e328mr4807705637.12.1753880943797;
        Wed, 30 Jul 2025 06:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs6wjsf0Q2uV+QjNX2+BJebA7gZlSlrORRFmXImrXs/DTnl6FWhcQ6Ay1Cko/oB0Ikr9ynZQ==
X-Received: by 2002:a05:6a20:548d:b0:239:c7c:8de8 with SMTP id adf61e73a8af0-23dc0d3e328mr4807652637.12.1753880943335;
        Wed, 30 Jul 2025 06:09:03 -0700 (PDT)
Received: from [10.219.57.35] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f67c8fcsm7588223a12.37.2025.07.30.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:09:02 -0700 (PDT)
Message-ID: <2b8a2ea6-f13c-ea09-c089-f2296b887859@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 18:38:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 04/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@linaro.org>,
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-4-6b8d23315898@oss.qualcomm.com>
 <b1b34e31904f711e7cf82394843a9966238f2896.camel@linaro.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <b1b34e31904f711e7cf82394843a9966238f2896.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KBfzAIJFwd_D_rQgK9LLXCgyQ0Hv_hif
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a1971 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=OQUscKAIWfOqcitIQgEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: KBfzAIJFwd_D_rQgK9LLXCgyQ0Hv_hif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5NCBTYWx0ZWRfX05MOHfEJBpy1
 fjTiLtB/BT3r0HrQNTTGeG9uxGFMjARIO7cfE8fw74RVrj6v7vwW9Jd47toDBZFPvykhRYOkpSh
 hx2z+1Npuw1l/XRp1Ywxr+AOc1U3iXL89RNUAbhRb66AnBPA8yw2wQzbYwRQ4qNVTvZMFS9Y/qB
 O3ayRmQ744AkmaY/1yJjD+RQHoqJZ7mWHcFg2hHP/6zi0FBuL5wS8OPrURVXI3ZQv8GNlf99lVn
 pMui0lt5VQEgqpZqGDmk+PcCepKpnyjhxk70gImCS+IwpAVL87IjvKnqhxlogWATpv0Mb5XR7ak
 T0RJo35+ZDfrEAhoELxtE3zEKTl6Y0QN9107C3IAHHXVFqd2JdDJi5WW8HpRlS6HtlkENJcRnsD
 BF7zFQSlHSiWuLAvM5uNpQOaZNNA55016QyVTSdi1HM9g1unfgB1aiZDjQY1Le1hDzZKfbal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300094



On 7/30/2025 2:36 PM, André Draszik wrote:
> On Sun, 2025-07-27 at 21:54 +0530, Shivendra Pratap wrote:
>> Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
>> a read-only sysfs attribute exposing the list of supported
>> reboot-mode arguments. This file is created by reboot-mode
>> framework and provides a user-readable interface to query
>> available reboot-mode arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-
>> reboot_modes
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..7147a781e5d4d11977c3a156bf4308aa13310e39
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
>> @@ -0,0 +1,39 @@
>> +What:		/sys/class/reboot-mode/<driver>/reboot_modes
>> +Date:		July 2025
>> +KernelVersion:	6.16
> 
> The version should probably be updated.

sure. will update this.

> 
>> +Contact:	linux-pm@vger.kernel.org
>> +		Description:
>> +		This interface exposes the reboot-mode arguments
>> +		registered with the reboot-mode framework. It is
>> +		a read-only interface and provides a comma
>> +		separated list of reboot-mode arguments supported
>> +		on the current platform.
>> +		Example:
>> +		 recovery,fastboot,bootloader
> 
> I'd personally find space separated like e.g. in files below /sys/power
> and many other similar files below /sys easier to read.

sure. Will make it space.

thanks.

> 
> Cheers,
> Andre'
> 
> 
>> +
>> +		The exact sysfs path may vary depending on the
>> +		name of the driver that registers the arguments.
>> +		Example:
>> +		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
>> +		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
>> +		 /sys/class/reboot-mode/qcom-pon/reboot_modes
>> +
>> +		The supported arguments can be used by userspace
>> +		to invoke device reset using the reboot() system
>> +		call, with the "argument" as string to "*arg"
>> +		parameter along with LINUX_REBOOT_CMD_RESTART2.
>> +		Example:
>> +		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
>> +		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
>> +
>> +		A driver can expose the supported arguments by
>> +		registering them with the reboot-mode framework
>> +		using the property names that follow the
>> +		mode-<argument> format.
>> +		Example:
>> +		 mode-bootloader, mode-recovery.
>> +
>> +		This attribute is useful for scripts or initramfs
>> +		logic that need to programmatically determine
>> +		which reboot-mode arguments are valid before
>> +		triggering a reboot.

