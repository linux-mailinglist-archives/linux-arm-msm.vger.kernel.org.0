Return-Path: <linux-arm-msm+bounces-66523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C712BB10A21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0D011CE6C33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D9B2D130B;
	Thu, 24 Jul 2025 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQKAa7pQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B882D191F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359857; cv=none; b=OiY+7vTDRDU+WyvV6hdKEP/sRvtb592AkAEnQTfyPP8SZbap2h6Virboej7V6upbHzkGGwdjcXyTY3GXUkbUsjIJy1woD1v6A6aXJrTIq8JtN5pR/4KRINtLMIGMKYtw+miqVeQJs6D+JJefRiD8Zockf1kOMsawodGe5IPU7RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359857; c=relaxed/simple;
	bh=Wj8k+LZ9ypk7cshOxTezUe0f1uo0ed1ov6Dko5eZRLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teh213p6ieF5SToWxwLw9q8ywCNK8VOIOuSupy3OIVgP1J4QDX2mGBqkQqd/LMfM1m5pf1DY4xoVR9ZxdUH2UuyJjKpIThnrat9NnzX1atnbD9KQJ1DgebiEh6tm1G52T9j4/vwVCGmW0+pNd4kZDv9U1wcsRgtCybctMCb5uyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQKAa7pQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9W7W8001900
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V1dVQ7o60lfQaW1OhD1N9qDwz1+DHJ+n9It7+EueNOQ=; b=XQKAa7pQDBQe7jY+
	bNCv2CUsz+XKQvB4s/WVjY55X/H4ygN3BuwyGNl4ggGVzbkDNp0vTOh/9B9NHSja
	4pNhbHGPOhSJOEv46cacMMe0uLN7zO8bOVHYO9GALll5VaYcBEcCNi4/r5tE2+BW
	3kRdZcE6uvdY8BVP61RcJcf51jK54Dv0hZFgT83VQGhQ5ls1UMwE3yhFbDSd5N6/
	bmOUwNaznG12++IoRgvRxEJYQpgAv9it+7p9eMo4bXz4NpBF3oHzqTJvA781wIuo
	1p634aemIf08jzR1L9bixaQojoyP8cwt3LDOjd9V7s61y7p59PSohtPUJYxhmbje
	tuNwEg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1uf8ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:24:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3bde4d4d5cso765797a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359853; x=1753964653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1dVQ7o60lfQaW1OhD1N9qDwz1+DHJ+n9It7+EueNOQ=;
        b=dpadoKHprqR2GxQt8NjRtcteuoC5RTFexD5j+DAK+2saMky4FSmvMWlSDWQud7hdr2
         m8QSInYbRbmU5HBfXptCnOVhJ3tatykSPzrVKdu58LUTbqnMLJR+UrvmOH7z3wWJOWFI
         by+nRGVOa66gTXSGVOXNHNJYdn94MOoQ+DiR2XJNyQfI6jhyMPIjA6wgCEhBgR4meZSj
         CYJHn11f2jp3FBlDLl6O3uxJZQ9/pRK5PY9rnVF5+XVVKBR5zec1ND5bcidmuMujBn9/
         N4YNkORNFmyM42+hdOAlg1oGWej9/ARrZHY8EMokVu6QhmwPMDSeKJPEChHlMD9yi0+W
         DD/g==
X-Forwarded-Encrypted: i=1; AJvYcCUmQ4h4/0UfNgNFNaXeTatb4ZIyMgUswWAMqzudvlD5g1bMG+6hPG6dlj1DmbmLqo+DNSftRXA1GDKhTl6j@vger.kernel.org
X-Gm-Message-State: AOJu0YwGLo8v4fHz1D8VLLYnI1AQQnoLDlOBhV7rUyGUieCc3E1i+DwA
	kIu23U+pyQx9eyenkpcpU7Je8a/yI64xw7f52KigGgrIFCsXQAVbUv8QPS//i04NY/GSh2DgrXK
	2M7PA1T3965OuNbeKbrR/1pl2IqpY3RPmAMddYvY57rRJpyvmpBgZFs+X8Qha+MhtCfwj
X-Gm-Gg: ASbGncuJYOL94zgZBZLyk+rwiMNQGYDV8fdBCkbAiwugo5OAxxgjKxEM7bx7gnv2NKX
	/VKKiWS7Bm84NhxLef739jUILuL5ytKp8z1pX4TPCMY0cI/2HJiurv2M8GLSF6TDD+tfgKO6aB/
	bFx36Qp9oAjk1r2STBK1du2CLLtsJ03+c8hJYRrDJnEfyF6k5qV7FCLjtuP42YNXv0BwMvJcecm
	gWy/60uhf5b4wam93crWMLI6jAQe6XTM8tOs7/UF5soGjeRHk5jlrfEfipfHM2WADLCeDLuFrnH
	CkR+88d9F4qfCwswR1X1lCWZW26K8uyKqDNZxPE2Xmuc930SFvAMcYjXpLUK8DrGGy4NXtLY8A=
	=
X-Received: by 2002:a17:903:240f:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23f9814af72mr109485885ad.12.1753359853240;
        Thu, 24 Jul 2025 05:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1FdMA0poljbqQuKYh8fiEQSr0OOY0KXJdzE/FuO1KdXgKFoFLZXlo3+g/2LdSYkgJes+jag==
X-Received: by 2002:a17:903:240f:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23f9814af72mr109485125ad.12.1753359852692;
        Thu, 24 Jul 2025 05:24:12 -0700 (PDT)
Received: from [10.219.57.35] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f3d3sm14862155ad.40.2025.07.24.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:24:12 -0700 (PDT)
Message-ID: <56599da9-0200-72b5-012e-942a1fc954b2@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 17:54:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v12 0/8] Implement vendor resets for PSCI SYSTEM_RESET2
To: Florian Fainelli <florian.fainelli@broadcom.com>,
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
        Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
 <beb26682-d2e4-40e6-89ac-87f18c0401d0@broadcom.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <beb26682-d2e4-40e6-89ac-87f18c0401d0@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688225ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Q-fNiiVtAAAA:8 a=TK8Ma2dr1QVmNkQoTrMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MyBTYWx0ZWRfXwv/hCPsCrmu6
 +jNkUOBCRl2pXl4gozWJBVitRZjMzSBUHj1sNukuSRhwuBTUosq05bQHdF9nz5VooF00+Aw7ViB
 +rAiWCnRnHPVM0+7xE+muvCuGutW0KGTZlew8zyPvjsc97BUvR+g/5J24Cy6jjt8iYYrlTWE1xT
 +jfUt4psH3Ee4/g3N60Vdul0b3m7kFdUhXSu7zF96AbEMOhiEaIG1lqGgXwMO1AMnzcCM5kfbW9
 hhyeIY5jJVPH/Faxk1Al5yp9ixZovW0GIYhn1hkaFaMo6BZPlanu0DpEYda4+jp/wu4aHwudyh5
 g4KtRpiBkGFdfiwq89L8ruEqVsZqsEMBmOCCGC55BHPhM+jhlFd94WybFHnfPr29oCSKm0NnRou
 wH/jAzD/Y7fFw1YiVMDdBOMbdw9gHKIAkoXpZ+2OCpZyCvCGVTT43oTcHGlSoSwRCop7BZy7
X-Proofpoint-ORIG-GUID: mv7rj7yCPM1gdvYjxs-t21NTtYw53WLR
X-Proofpoint-GUID: mv7rj7yCPM1gdvYjxs-t21NTtYw53WLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240093



On 7/24/2025 5:46 AM, Florian Fainelli wrote:
> On 7/21/25 11:28, Shivendra Pratap wrote:
>> The PSCI SYSTEM_RESET2 call allows vendor firmware to define
>> additional reset types which could be mapped to the reboot
>> argument.
>>
>> User-space should be able to reboot a device into different
>> operational boot-states supported by underlying bootloader and
>> firmware. Generally, some HW registers need to be written, based
>> on which the bootloader and firmware decide the next boot state
>> of device, after the reset. For example, a requirement on
>> Qualcomm platforms may state that reboot with "bootloader"
>> command, should reboot the device into bootloader flashing mode
>> and reboot with “edl” command, should reboot the device into an
>> Emergency flashing mode.  Setting up such reboots on Qualcomm
>> devices can be inconsistent across SoC platforms and may require
>> setting different HW registers, where some of these registers may
>> not be accessible to HLOS. These knobs evolve over product
>> generations and require more drivers.  PSCI defines a
>> vendor-specific reset in SYSTEM_RESET2 spec, which enables the
>> firmware to take care of underlying setting for any such
>> supported vendor-specific reboot. Qualcomm firmwares are
>> beginning to support and expose PSCI SYSTEM_RESET2
>> vendor-specific reset types to simplify driver requirements from
>> Linux. With such support added in the firmware, we now need a
>> Linux interface which can make use of the firmware calls for PSCI
>> vendor-specific resets. This will align such reboot requirement
>> across platforms and vendors.
>>
>> The current psci driver supports two types of resets –
>> SYSTEM_RESET2 Arch warm-reset and SYSTEM_RESET cold-reset. The
>> patchset introduces the PSCI SYSTEM_RESET2 vendor-specific reset
>> into the reset path of the psci driver and aligns it to work with
>> reboot system call - LINUX_REBOOT_CMD_RESTART2, when used along
>> with a supported string-based command in “*arg”.
>>
>> The patchset uses reboot-mode based commands, to define the
>> supported vendor reset-types commands in psci device tree node
>> and registers these commands with the reboot-mode framework.
>>
>> The PSCI vendor-specific reset takes two arguments, being,
>> reset_type and cookie as defined by the spec. To accommodate this
>> requirement, enhance the reboot-mode framework to support two
>> 32-bit arguments by switching to 64-bit magic values.
>>
>> Along this line, the patchset also extends the reboot-mode
>> framework to add a non-device-based registration function, which
>> will allow drivers to register using device tree node, while
>> keeping backward compatibility for existing users of reboot-mode.
>> This will enable psci driver to register for reboot-mode and
>> implement a write function, which will save the magic and then
>> use it in psci reset path to make a vendor-specific reset call
>> into the firmware. In addition, the patchset will expose a sysfs
>> entry interface within reboot-mode which can be used by userspace
>> to view the supported reboot-mode commands.
>>
>> The list of vendor-specific reset commands remains open due to
>> divergent requirements across vendors, but this can be
>> streamlined and standardized through dedicated device tree
>> bindings.
>>
>> Currently three drivers register with reboot-mode framework -
>> syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
>> list of commands currently added across various vendor DTs:
>>   mode-loader
>>   mode-normal
>>   mode-bootloader
>>   mode-charge
>>   mode-fastboot
>>   mode-reboot-ab-update
>>   mode-recovery
>>   mode-rescue
>>   mode-shutdown-thermal
>>   mode-shutdown-thermal-battery
>>
>> Detailed list of commands being used by syscon-reboot-mode:
>>      arm64/boot/dts/exynos/exynosautov9.dtsi:
>>     mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
>>     mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
>>     mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
>>
>>      arm64/boot/dts/exynos/google/gs101.dtsi:
>>          mode-bootloader = <0xfc>;
>>          mode-charge = <0x0a>;
>>          mode-fastboot = <0xfa>;
>>          mode-reboot-ab-update = <0x52>;
>>          mode-recovery = <0xff>;
>>          mode-rescue = <0xf9>;
>>          mode-shutdown-thermal = <0x51>;
>>          mode-shutdown-thermal-battery = <0x51>;
>>
>>      arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
>>          mode-normal = <0x77665501>;
>>          mode-bootloader = <0x77665500>;
>>          mode-recovery = <0x77665502>;
>>
>>      arm64/boot/dts/hisilicon/hi6220-hikey.dts:
>>          mode-normal = <0x77665501>;
>>          mode-bootloader = <0x77665500>;
>>          mode-recovery = <0x77665502>;
>>
>>      arm64/boot/dts/rockchip/px30.dtsi:
>>          mode-bootloader = <BOOT_BL_DOWNLOAD>;
>>          mode-fastboot = <BOOT_FASTBOOT>;
>>          mode-loader = <BOOT_BL_DOWNLOAD>;
>>          mode-normal = <BOOT_NORMAL>;
>>          mode-recovery = <BOOT_RECOVERY>;
>>
>>      arm64/boot/dts/rockchip/rk3308.dtsi:
>>          mode-bootloader = <BOOT_BL_DOWNLOAD>;
>>          mode-loader = <BOOT_BL_DOWNLOAD>;
>>          mode-normal = <BOOT_NORMAL>;
>>          mode-recovery = <BOOT_RECOVERY>;
>>          mode-fastboot = <BOOT_FASTBOOT>;
>>
>>      arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
>>          mode-normal = <BOOT_NORMAL>;
>>          mode-loader = <BOOT_BL_DOWNLOAD>;
>>             mode-recovery = <BOOT_RECOVERY>;
>>             mode-bootloader = <BOOT_FASTBOOT>;
>>
>> Detailed list of commands being used by nvmem-reboot-mode:
>>      arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
>>             mode-recovery = <0x01>;
>>             mode-bootloader = <0x02>;
>>
>> Previous discussions around SYSTEM_RESET2:
>> - https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
>> - https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
>>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> On ARCH_BRCMSTB:
> 
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> For the sysfs bits, should not we be seeing "psci" instead of "reboot-mode" twice in this path:
> 
> # cat /sys/class/reboot-mode/reboot-mode/reboot_modes
> powercycle
As per current patch, we create a class named - "reboot-mode".
/sys/class/reboot-mode

Then comes the DT node name of the registering driver.
/sys/class/reboot-mode/<DT node name of the registering driver>/

Then the name of the sysfs which is set to "reboot_modes".

For case of vendor reset, psci is parent and node name is reboot-mode,
so its generalized to: /sys/class/reboot-mode/reboot-mode/reboot_modes
--

We can discuss, how to keep it generalized and get some other name
in sysfs. suggestions?


> 
> ?

