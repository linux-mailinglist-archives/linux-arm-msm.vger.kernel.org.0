Return-Path: <linux-arm-msm+bounces-75537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086FBAB822
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057853AA16E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E62F1E2307;
	Tue, 30 Sep 2025 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJmIWjj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF281AA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211138; cv=none; b=dqzjnn6Rrhht9gryO8T2ItyXg9wS3vuCvcEyBaOOzQ2X/2Onilxk7nuh/sXPUT8ZmAphUFCgQbm+hjsQcY4cgrNej1wZawZBQ7S3PyqjEn+OrFwRLmjgwiStPjQu5cTEvHijUfSUx7J4/pfoIer9zEKbMHt8uQduWLiZ10Qp6wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211138; c=relaxed/simple;
	bh=ve6oIWZvymellrLLBdWVPtFWTwvtVVk811bmbemuMac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSZ/Q+tg7seN0P75a2uHuGWwn7HmsC5wdGYqAD03be5UKx/3WmHAl0521LTFwDgrkz69ovXKCam9/EH2NKuDYRdNaHzmDL8qeD3z120Qafw3zIgAXSinSccqTVfi8ZCQCgQ/Q4qVF5NO8pq2XGu9an5EIW2QSIJHLonlV323yIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJmIWjj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Hh2U027554
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+cYdN/Q52kS7p4GHmBZmzPjUkGPEpyNfvKUw3IGkUE=; b=CJmIWjj+s+7hFNw8
	Dn0WwLij4xqCtAyGV+eWk/+XhZMFMVt0YVD5Bsk0FxEn7f4Pun4CWRacVh1pNWkH
	SWe4oAX/zdNtqdaNeM4hciVc1mS6OZv47F3aN+G215hiFGjObpkotSfRUVYGjzvM
	JZNIlbwL7sCJRBE9EC8ZXeckAsSB0qHzj6MW2rd28i7HFhGaAgx3al2Nyszzom9d
	iHnGCK5CIjoyA/HIgXrm4N7+Q0qHXu+L6m24QeWYme6aa6m2VzyHF9Y1dqP8iv0o
	XaC3sFSAuufM9LjA2A4/TpZT0b9HRYZkjkIhRWdJAaw/0EFN2zNbDaDgKn7IJmOr
	ltPOBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851fppe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:45:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso65467345ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211134; x=1759815934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+cYdN/Q52kS7p4GHmBZmzPjUkGPEpyNfvKUw3IGkUE=;
        b=ms2Muwau7uTc1c3AJchQksJSsOOk/ZhcWfAN7nkBAeF5PefhRqexKfKWjr2KLdY5HE
         ZMN5f2GoM9EJBd0TqsPiDmP1+asLVzzKmmpZydhidlRgrW4PyJmBitCTGzim8frGbjlP
         aON9Hdlyu+92RWzotu57zazpojf5kHC1cT1VnwxbWz0nj7HKaxkD0slwVK/14UPQtIKn
         rf0vkjZAqkvBYX1/0qYXBQY8AYrP6txh0ZFBClHxLSywyDFHZEWoqIrngvTkCuJNu7Em
         NXRYYpRDe9jmFEX4SOWhVhjNqw/132xVwe+KuPetOV2j8jI3LE/YzEhG27AS0dxz0WTu
         l18g==
X-Forwarded-Encrypted: i=1; AJvYcCWpHG4e2Tu66OQKQ7OFk54L3KjRQXL6Jf3DYWBGIMeBNno+vZ1Mi/UBV4CEpZKbDda1esnbla+Dn3TAhd2h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2aGbMsOzwwvGqVb3X2YCyCrkP42EsfllWKOLhMysGXyFz/ua/
	HSa8+ElbTjaAs6K38JjYtRLakmMBgc40bc2MZB4emsBsSin6BVxIaBvsSUEBHCtgcP+qu2taJQl
	Av+cWpuMw3Iyi/q/mCyojjvWGtB+WAqn5J5qCnemDrOTjL140kpItYRkhbfKXFJhITQJ1
X-Gm-Gg: ASbGncvZUikldkIoZI9oLtHIf+QwtvYN4HgxafLTDSzstyWcKMdYtZeQvWFdiucXppr
	GhZPvQkvYkDyJKTj4FgYJDmnB1ot1FdmUYFJPvoB5cyKzXIDE7zaqGpTFaTiye6jtZqkC6S71JC
	NaTUNLcGPicvZ1JJVfy8LApVWC0ccpcDl12PztBIiTFbzFud4l2S69/jbhiEb+VXDRkfqhlINvk
	MGHPW2CMxAW6THLzKCsKs3n+W9NQaU3FqhhfYESHsZqDG6ecGgaXA2H/2xbZeeWOJQujeWUqLlc
	COBByOV7I725To5ZQLfqcoYqrYUUi8rFLBhBR+9LYQ+qTCCvPpSx6stws5UFzt42dV8DG5ZV9mk
	2DiRMoWERm2+yww==
X-Received: by 2002:a17:903:19f0:b0:26c:e270:6dad with SMTP id d9443c01a7336-27ed4ae51c6mr177949285ad.60.1759211133842;
        Mon, 29 Sep 2025 22:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaNwtMS+L7JYb6fXEGvaAzNNfpnL39xLAuGz7lefMMjZVgnylqawU22M4IEG2k35nREeiThA==
X-Received: by 2002:a17:903:19f0:b0:26c:e270:6dad with SMTP id d9443c01a7336-27ed4ae51c6mr177948835ad.60.1759211133375;
        Mon, 29 Sep 2025 22:45:33 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821desm149919235ad.91.2025.09.29.22.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 22:45:32 -0700 (PDT)
Message-ID: <4276eeea-5877-4420-98da-a5f2eb5c0505@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:15:04 +0530
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
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
 <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-7-7ce3a08878f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db6e7f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=us_dTBczMLAT1r8_uQAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXyvYck5cqPz89
 PkfG8edYI4YpsnPYG7YKsOXKJGD4vP77xtfZFxTRftspO0UYIVH/OOABFf68rozB+JvNugwmGOb
 90DZfthV/pR0i3y/u6W0hdTRSnejEcEWaMKhKEvM6SwoaYdC4k3J9oPSPc3ipwqTsgACFUel6dt
 7IudGA4zs1r4iMkJqDaW/llHRMk5xny4KaYBp/SI6u8MtLyofCUpdD5ufNIlBfpf4NYQm1cX6Wr
 WURizPxJTsR5V69DGkG0XfzIK0FOWDkEr20DfIVqKKjw+vba3vpHinovuOI0JdPmYR9KcNBF57r
 fUPSYtn/NiE5WgdoN3kLiLaAlGa3RS8GnmyFd9eDasqa8tPfNNE87cJ8B6awkMhSwR+XBs7n6rA
 UJYIPhzvUcrU9fIac5XtMrsWzvlGTg==
X-Proofpoint-ORIG-GUID: jVZ-kRqxLnFTS4xpwNN2sMhJerNEqz5D
X-Proofpoint-GUID: jVZ-kRqxLnFTS4xpwNN2sMhJerNEqz5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032


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
>   drivers/firmware/psci/Kconfig |  2 +
>   drivers/firmware/psci/psci.c  | 89 ++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -1,6 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config ARM_PSCI_FW
>   	bool
> +	select POWER_RESET
> +	select REBOOT_MODE
>   
>   config ARM_PSCI_CHECKER
>   	bool "ARM PSCI checker"
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..40a27bc2cc3a3393acc14c7b2314155540ed06c9 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -13,10 +13,12 @@
>   #include <linux/errno.h>
>   #include <linux/linkage.h>
>   #include <linux/of.h>
> +#include <linux/panic_notifier.h>
>   #include <linux/pm.h>
>   #include <linux/printk.h>
>   #include <linux/psci.h>
>   #include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
>   #include <linux/slab.h>
>   #include <linux/suspend.h>
>   
> @@ -51,6 +53,24 @@ static int resident_cpu = -1;
>   struct psci_operations psci_ops;
>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>   
> +struct psci_vendor_sysreset2 {
> +	u32 reset_type;
> +	u32 cookie;
> +	bool valid;
> +};
> +
> +static struct psci_vendor_sysreset2 vendor_reset;
> +
> +static int psci_panic_event(struct notifier_block *nb, unsigned long v, void *p)
> +{
> +	vendor_reset.valid = false;
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block psci_panic_block = {
> +	.notifier_call = psci_panic_event
> +};
> +
>   bool psci_tos_resident_on(int cpu)
>   {
>   	return cpu == resident_cpu;
> @@ -309,7 +329,10 @@ static int get_set_conduit_method(const struct device_node *np)
>   static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>   			  void *data)
>   {
> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> +	if (vendor_reset.valid && psci_system_reset2_supported) {
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
> +			       vendor_reset.cookie, 0);
> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>   	    psci_system_reset2_supported) {
>   		/*
>   		 * reset_type[31] = 0 (architectural)
> @@ -547,6 +570,70 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>   	.enter          = psci_system_suspend_enter,
>   };
>   
> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	u32 magic_32;
> +
> +	if (psci_system_reset2_supported) {
> +		magic_32 = magic & 0xffffffff;
> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
> +		vendor_reset.cookie = (magic >> 32) & 0xffffffff;


Minor Nit: Can we use GENMASK(31, 0) instead of 0xffffffff? Apart from 
this, change LGTM. With that,

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>


> +		vendor_reset.valid = true;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int __init psci_init_vendor_reset(void)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct device_node *psci_np;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!psci_system_reset2_supported)
> +		return -EINVAL;
> +
> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> +	if (!psci_np)
> +		return -ENODEV;
> +
> +	np = of_find_node_by_name(psci_np, "reboot-mode");
> +	if (!np) {
> +		of_node_put(psci_np);
> +		return -ENODEV;
> +	}
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
> +	if (ret)
> +		goto err_notifier;
> +
> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot) {
> +		ret = -ENOMEM;
> +		goto err_kzalloc;
> +	}
> +
> +	reboot->write = psci_set_vendor_sys_reset2;
> +	reboot->driver_name = "psci";
> +
> +	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
> +	if (ret)
> +		goto err_register;
> +
> +	return 0;
> +
> +err_register:
> +	kfree(reboot);
> +err_kzalloc:
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &psci_panic_block);
> +err_notifier:
> +	of_node_put(psci_np);
> +	of_node_put(np);
> +	return ret;
> +}
> +late_initcall(psci_init_vendor_reset)
> +
>   static void __init psci_init_system_reset2(void)
>   {
>   	int ret;
>

