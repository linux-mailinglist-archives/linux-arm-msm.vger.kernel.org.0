Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4E4C4F048D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 17:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357364AbiDBPrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 11:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357349AbiDBPrB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 11:47:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660564EA15
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 08:45:05 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id yy13so11674132ejb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SxgNlsQse7FaU2q/YUY12Tb8zzBMGH2dN/lYCw2C2MA=;
        b=HYn5qvBfwMdmVRCdf9/VU8daAvKdrrC/i/pvNXejm9ClP2XH35KddersofsMdWJMSZ
         k8QjDkddbJddrC3HAxCqy8IiTaBqzfWS2BTjr+6IvNwrPERLwxVRjOZ5a3fpKNiyraWr
         6id/mO1FjgXGfv6KFr6Ri6IB5ERbsYJjhVHuqKX1Owu1lY6NPmTi7Qu1UnHVMHu9XIaa
         48w0U8xk3UE5YN2yedAtAZnqQ1bFJHNwC7INv082qLSWFDYx9mGYzhzU01SD5PRjdBVs
         svNsrYccsKgEwhG00+jg6Tb2Lv5MJz0fs9mCzWaUou0qzLjpEAjlCYN5dn2qRNsJ/A5G
         66mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SxgNlsQse7FaU2q/YUY12Tb8zzBMGH2dN/lYCw2C2MA=;
        b=VOiYG1Zf0FcBVTl3fSpgRggjWflHZHlIkcdcSt8kghxVbmnrG/gz60HcCjQGbJceto
         IwvsHavehsBYiaYO/HUZYD6nzCrO3k+Rt70DDhe2sERDfSOviYs7gkwosff2DAlkb4ih
         12EdMus+m3Vo/78C7bctnVjRXByPf1uy6WK3zSjPF1C9Q3VxDM9zvN9SO5nN69fUSjU2
         BEBk9jZMoUPSX3beCuRgthdImfwduOQicriL6YduL99RB+WhMXeoI/gek49Hy5zGsHVC
         fqnfYk0a0yXl+8DKz2UjUztqHUNBfGh3sw21U62+djABQq8Mro9cFpVRNoMkKhvKo/yb
         h9Ng==
X-Gm-Message-State: AOAM533m9VzKBE8kZnMbS4MQaRa1B3yTeiXUXYCfL8iwOU+RdCX6gXwN
        jkKU/WHtyZCpJolYIFMJQIwF9A==
X-Google-Smtp-Source: ABdhPJy7z/quutRixV1mFFSi2Iym0mHwGG9pPXCs0zHaDaHjYpOFQAeiF+f7vRHS2p0fO8nigamjAA==
X-Received: by 2002:a17:906:c0c8:b0:6d0:562c:2894 with SMTP id bn8-20020a170906c0c800b006d0562c2894mr4332066ejb.625.1648914303690;
        Sat, 02 Apr 2022 08:45:03 -0700 (PDT)
Received: from [192.168.0.33] (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id c2-20020aa7d602000000b0041997b3ce40sm2573579edr.86.2022.04.02.08.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 08:45:03 -0700 (PDT)
Message-ID: <f5b9df5c-ffff-0c33-04bd-8dd7a1d1b136@linaro.org>
Date:   Sat, 2 Apr 2022 16:45:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/6] power: supply: add Qualcomm SMB2 driver
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <20220401202643.877609-1-caleb.connolly@linaro.org>
 <20220401202643.877609-2-caleb.connolly@linaro.org>
 <20220401225342.swzyi7fspbzh4qbh@mercury.elektranox.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20220401225342.swzyi7fspbzh4qbh@mercury.elektranox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 01/04/2022 23:53, Sebastian Reichel wrote:
> Hi Caleb,
Hi Sebastian,
> 
> Thanks for the driver. It looks mostly good. Please find my feedback
> inline:
Thanks a lot for the thorough review, I'll address your feedback and submit a v2.
> 
> On Fri, Apr 01, 2022 at 09:26:38PM +0100, Caleb Connolly wrote:
>> Add a driver for the SMB2 charger block found in the Qualcomm PMI8998
>> and PM660.
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>   drivers/power/supply/Kconfig     |   9 +
>>   drivers/power/supply/Makefile    |   1 +
>>   drivers/power/supply/qcom_smb2.c | 930 +++++++++++++++++++++++++++++++
>>   3 files changed, 940 insertions(+)
>>   create mode 100644 drivers/power/supply/qcom_smb2.c
>>
>> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
>> index 1aa8323ad9f6..c72da3d75258 100644
>> --- a/drivers/power/supply/Kconfig
>> +++ b/drivers/power/supply/Kconfig
>> @@ -897,4 +897,13 @@ config BATTERY_UG3105
>>   	  device is off or suspended, the functionality of this driver is
>>   	  limited to reporting capacity only.
>>   
>> +config CHARGER_QCOM_SMB2
>> +	tristate "Qualcomm PMIC charger driver"
>> +	depends on MFD_SPMI_PMIC
>> +	depends on IIO
>> +	help
>> +	  Say Y here to enable the Qualcomm PMIC Charger driver. This
>> +	  adds support for the SMB2 switch mode battery charger found
>> +	  in PMI8998 and related PMICs.
>> +
>>   endif # POWER_SUPPLY
>> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
>> index 7f02f36aea55..e5db9eda6a9b 100644
>> --- a/drivers/power/supply/Makefile
>> +++ b/drivers/power/supply/Makefile
>> @@ -108,3 +108,4 @@ obj-$(CONFIG_BATTERY_ACER_A500)	+= acer_a500_battery.o
>>   obj-$(CONFIG_BATTERY_SURFACE)	+= surface_battery.o
>>   obj-$(CONFIG_CHARGER_SURFACE)	+= surface_charger.o
>>   obj-$(CONFIG_BATTERY_UG3105)	+= ug3105_battery.o
>> +obj-$(CONFIG_CHARGER_QCOM_SMB2)	+= qcom_smb2.o
>> diff --git a/drivers/power/supply/qcom_smb2.c b/drivers/power/supply/qcom_smb2.c
>> new file mode 100644
>> index 000000000000..63100cfc3300
>> --- /dev/null
>> +++ b/drivers/power/supply/qcom_smb2.c
>> @@ -0,0 +1,930 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2016-2019 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2021, Linaro Ltd.
>> + *  Author: Caleb Connolly <caleb.connolly@linaro.org>
>> + *
>> + * This driver is for the switch-mode battery charger and boost
>> + * hardware found in pmi8998 and related PMICs.
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/kernel.h>
>> +#include <linux/minmax.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of_address.h>
> 
> not needed?
> 
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/driver.h>
> 
> not needed (at this point, since there is not OTG handling)
> 
>> +#include <linux/device.h>
> 
> not needed?
> 
>> +#include <linux/iio/consumer.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#include <linux/power_supply.h>
>> +#include <linux/module.h>
>> +#include <linux/math64.h>
> 
> not needed?
> 
>> +#include <linux/of_irq.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/workqueue.h>
>> +
>> +#define BATTERY_CHARGER_STATUS_2_REG 0x07
>> +#define INPUT_CURRENT_LIMITED_BIT BIT(7)
>> +#define CHARGER_ERROR_STATUS_SFT_EXPIRE_BIT BIT(6)
>> +#define CHARGER_ERROR_STATUS_BAT_OV_BIT BIT(5)
>> +#define CHARGER_ERROR_STATUS_BAT_TERM_MISSING_BIT BIT(4)
>> +#define BAT_TEMP_STATUS_MASK GENMASK(3, 0)
>> +#define BAT_TEMP_STATUS_SOFT_LIMIT_MASK GENMASK(3, 2)
>> +#define BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT BIT(3)
>> +#define BAT_TEMP_STATUS_COLD_SOFT_LIMIT_BIT BIT(2)
>> +#define BAT_TEMP_STATUS_TOO_HOT_BIT BIT(1)
>> +#define BAT_TEMP_STATUS_TOO_COLD_BIT BIT(0)
>> +
>> +#define CHARGING_ENABLE_CMD_REG 0x42
>> +#define CHARGING_ENABLE_CMD_BIT BIT(0)
>> +
>> +#define CHGR_CFG2_REG 0x51
>> +#define CHG_EN_SRC_BIT BIT(7)
>> +#define CHG_EN_POLARITY_BIT BIT(6)
>> +#define PRETOFAST_TRANSITION_CFG_BIT BIT(5)
>> +#define BAT_OV_ECC_BIT BIT(4)
>> +#define I_TERM_BIT BIT(3)
>> +#define AUTO_RECHG_BIT BIT(2)
>> +#define EN_ANALOG_DROP_IN_VBATT_BIT BIT(1)
>> +#define CHARGER_INHIBIT_BIT BIT(0)
>> +
>> +#define FAST_CHARGE_CURRENT_CFG_REG 0x61
>> +#define FAST_CHARGE_CURRENT_SETTING_MASK GENMASK(7, 0)
>> +
>> +#define FLOAT_VOLTAGE_CFG_REG 0x70
>> +#define FLOAT_VOLTAGE_SETTING_MASK GENMASK(7, 0)
>> +
>> +#define FG_UPDATE_CFG_2_SEL_REG 0x7D
>> +#define SOC_LT_OTG_THRESH_SEL_BIT BIT(3)
>> +#define SOC_LT_CHG_RECHARGE_THRESH_SEL_BIT BIT(2)
>> +#define VBT_LT_CHG_RECHARGE_THRESH_SEL_BIT BIT(1)
>> +#define IBT_LT_CHG_TERM_THRESH_SEL_BIT BIT(0)
>> +
>> +#define JEITA_EN_CFG_REG 0x90
>> +#define JEITA_EN_HARDLIMIT_BIT BIT(4)
>> +#define JEITA_EN_HOT_SL_FCV_BIT BIT(3)
>> +#define JEITA_EN_COLD_SL_FCV_BIT BIT(2)
>> +#define JEITA_EN_HOT_SL_CCC_BIT BIT(1)
>> +#define JEITA_EN_COLD_SL_CCC_BIT BIT(0)
>> +
>> +#define INT_RT_STS 0x310
>> +#define TYPE_C_CHANGE_RT_STS_BIT BIT(7)
>> +#define USBIN_ICL_CHANGE_RT_STS_BIT BIT(6)
>> +#define USBIN_SOURCE_CHANGE_RT_STS_BIT BIT(5)
>> +#define USBIN_PLUGIN_RT_STS_BIT BIT(4)
>> +#define USBIN_OV_RT_STS_BIT BIT(3)
>> +#define USBIN_UV_RT_STS_BIT BIT(2)
>> +#define USBIN_LT_3P6V_RT_STS_BIT BIT(1)
>> +#define USBIN_COLLAPSE_RT_STS_BIT BIT(0)
>> +
>> +#define BATTERY_CHARGER_STATUS_1_REG 0x06
>> +#define BVR_INITIAL_RAMP_BIT BIT(7)
>> +#define CC_SOFT_TERMINATE_BIT BIT(6)
>> +#define STEP_CHARGING_STATUS_SHIFT 3
>> +#define STEP_CHARGING_STATUS_MASK GENMASK(5, 3)
>> +#define BATTERY_CHARGER_STATUS_MASK GENMASK(2, 0)
>> +
>> +#define BATTERY_HEALTH_STATUS_REG 0x07
>> +
>> +#define OTG_CFG_REG 0x153
>> +#define OTG_RESERVED_MASK GENMASK(7, 6)
>> +#define DIS_OTG_ON_TLIM_BIT BIT(5)
>> +#define QUICKSTART_OTG_FASTROLESWAP_BIT BIT(4)
>> +#define INCREASE_DFP_TIME_BIT BIT(3)
>> +#define ENABLE_OTG_IN_DEBUG_MODE_BIT BIT(2)
>> +#define OTG_EN_SRC_CFG_BIT BIT(1)
>> +#define CONCURRENT_MODE_CFG_BIT BIT(0)
>> +
>> +#define OTG_ENG_OTG_CFG_REG 0x1C0
>> +#define ENG_BUCKBOOST_HALT1_8_MODE_BIT BIT(0)
>> +
>> +#define APSD_STATUS_REG 0x307
>> +#define APSD_STATUS_7_BIT BIT(7)
>> +#define HVDCP_CHECK_TIMEOUT_BIT BIT(6)
>> +#define SLOW_PLUGIN_TIMEOUT_BIT BIT(5)
>> +#define ENUMERATION_DONE_BIT BIT(4)
>> +#define VADP_CHANGE_DONE_AFTER_AUTH_BIT BIT(3)
>> +#define QC_AUTH_DONE_STATUS_BIT BIT(2)
>> +#define QC_CHARGER_BIT BIT(1)
>> +#define APSD_DTC_STATUS_DONE_BIT BIT(0)
>> +
>> +#define APSD_RESULT_STATUS_REG 0x308
>> +#define ICL_OVERRIDE_LATCH_BIT BIT(7)
>> +#define APSD_RESULT_STATUS_MASK GENMASK(6, 0)
>> +#define QC_3P0_BIT BIT(6)
>> +#define QC_2P0_BIT BIT(5)
>> +#define FLOAT_CHARGER_BIT BIT(4)
>> +#define DCP_CHARGER_BIT BIT(3)
>> +#define CDP_CHARGER_BIT BIT(2)
>> +#define OCP_CHARGER_BIT BIT(1)
>> +#define SDP_CHARGER_BIT BIT(0)
>> +
>> +#define TYPE_C_STATUS_1_REG 0x30B
>> +#define UFP_TYPEC_MASK GENMASK(7, 5)
>> +#define UFP_TYPEC_RDSTD_BIT BIT(7)
>> +#define UFP_TYPEC_RD1P5_BIT BIT(6)
>> +#define UFP_TYPEC_RD3P0_BIT BIT(5)
>> +#define UFP_TYPEC_FMB_255K_BIT BIT(4)
>> +#define UFP_TYPEC_FMB_301K_BIT BIT(3)
>> +#define UFP_TYPEC_FMB_523K_BIT BIT(2)
>> +#define UFP_TYPEC_FMB_619K_BIT BIT(1)
>> +#define UFP_TYPEC_OPEN_OPEN_BIT BIT(0)
>> +
>> +#define TYPE_C_STATUS_2_REG 0x30C
>> +#define DFP_RA_OPEN_BIT BIT(7)
>> +#define TIMER_STAGE_BIT BIT(6)
>> +#define EXIT_UFP_MODE_BIT BIT(5)
>> +#define EXIT_DFP_MODE_BIT BIT(4)
>> +#define DFP_TYPEC_MASK GENMASK(3, 0)
>> +#define DFP_RD_OPEN_BIT BIT(3)
>> +#define DFP_RD_RA_VCONN_BIT BIT(2)
>> +#define DFP_RD_RD_BIT BIT(1)
>> +#define DFP_RA_RA_BIT BIT(0)
>> +
>> +#define TYPE_C_STATUS_3_REG 0x30D
>> +#define ENABLE_BANDGAP_BIT BIT(7)
>> +#define U_USB_GND_NOVBUS_BIT BIT(6)
>> +#define U_USB_FLOAT_NOVBUS_BIT BIT(5)
>> +#define U_USB_GND_BIT BIT(4)
>> +#define U_USB_FMB1_BIT BIT(3)
>> +#define U_USB_FLOAT1_BIT BIT(2)
>> +#define U_USB_FMB2_BIT BIT(1)
>> +#define U_USB_FLOAT2_BIT BIT(0)
>> +
>> +#define TYPE_C_STATUS_4_REG 0x30E
>> +#define UFP_DFP_MODE_STATUS_BIT BIT(7)
>> +#define TYPEC_VBUS_STATUS_BIT BIT(6)
>> +#define TYPEC_VBUS_ERROR_STATUS_BIT BIT(5)
>> +#define TYPEC_DEBOUNCE_DONE_STATUS_BIT BIT(4)
>> +#define TYPEC_UFP_AUDIO_ADAPT_STATUS_BIT BIT(3)
>> +#define TYPEC_VCONN_OVERCURR_STATUS_BIT BIT(2)
>> +#define CC_ORIENTATION_BIT BIT(1)
>> +#define CC_ATTACHED_BIT BIT(0)
>> +
>> +#define TYPE_C_STATUS_5_REG 0x30F
>> +#define TRY_SOURCE_FAILED_BIT BIT(6)
>> +#define TRY_SINK_FAILED_BIT BIT(5)
>> +#define TIMER_STAGE_2_BIT BIT(4)
>> +#define TYPEC_LEGACY_CABLE_STATUS_BIT BIT(3)
>> +#define TYPEC_NONCOMP_LEGACY_CABLE_STATUS_BIT BIT(2)
>> +#define TYPEC_TRYSOURCE_DETECT_STATUS_BIT BIT(1)
>> +#define TYPEC_TRYSINK_DETECT_STATUS_BIT BIT(0)
>> +
>> +#define CMD_APSD_REG 0x341
>> +#define ICL_OVERRIDE_BIT BIT(1)
>> +#define APSD_RERUN_BIT BIT(0)
>> +
>> +#define TYPE_C_CFG_REG 0x358
>> +#define APSD_START_ON_CC_BIT BIT(7)
>> +#define WAIT_FOR_APSD_BIT BIT(6)
>> +#define FACTORY_MODE_DETECTION_EN_BIT BIT(5)
>> +#define FACTORY_MODE_ICL_3A_4A_BIT BIT(4)
>> +#define FACTORY_MODE_DIS_CHGING_CFG_BIT BIT(3)
>> +#define SUSPEND_NON_COMPLIANT_CFG_BIT BIT(2)
>> +#define VCONN_OC_CFG_BIT BIT(1)
>> +#define TYPE_C_OR_U_USB_BIT BIT(0)
>> +
>> +#define TYPE_C_CFG_2_REG 0x359
>> +#define TYPE_C_DFP_CURRSRC_MODE_BIT BIT(7)
>> +#define DFP_CC_1P4V_OR_1P6V_BIT BIT(6)
>> +#define VCONN_SOFTSTART_CFG_MASK GENMASK(5, 4)
>> +#define EN_TRY_SOURCE_MODE_BIT BIT(3)
>> +#define USB_FACTORY_MODE_ENABLE_BIT BIT(2)
>> +#define TYPE_C_UFP_MODE_BIT BIT(1)
>> +#define EN_80UA_180UA_CUR_SOURCE_BIT BIT(0)
>> +
>> +#define TYPE_C_CFG_3_REG 0x35A
>> +#define TVBUS_DEBOUNCE_BIT BIT(7)
>> +#define TYPEC_LEGACY_CABLE_INT_EN_BIT BIT(6)
>> +#define TYPEC_NONCOMPLIANT_LEGACY_CABLE_INT_EN_BIT BIT(5)
>> +#define TYPEC_TRYSOURCE_DETECT_INT_EN_BIT BIT(4)
>> +#define TYPEC_TRYSINK_DETECT_INT_EN_BIT BIT(3)
>> +#define EN_TRYSINK_MODE_BIT BIT(2)
>> +#define EN_LEGACY_CABLE_DETECTION_BIT BIT(1)
>> +#define ALLOW_PD_DRING_UFP_TCCDB_BIT BIT(0)
>> +
>> +#define USBIN_OPTIONS_1_CFG_REG 0x362
>> +#define CABLE_R_SEL_BIT BIT(7)
>> +#define HVDCP_AUTH_ALG_EN_CFG_BIT BIT(6)
>> +#define HVDCP_AUTONOMOUS_MODE_EN_CFG_BIT BIT(5)
>> +#define INPUT_PRIORITY_BIT BIT(4)
>> +#define AUTO_SRC_DETECT_BIT BIT(3)
>> +#define HVDCP_EN_BIT BIT(2)
>> +#define VADP_INCREMENT_VOLTAGE_LIMIT_BIT BIT(1)
>> +#define VADP_TAPER_TIMER_EN_BIT BIT(0)
>> +
>> +#define USBIN_OPTIONS_2_CFG_REG 0x363
>> +#define WIPWR_RST_EUD_CFG_BIT BIT(7)
>> +#define SWITCHER_START_CFG_BIT BIT(6)
>> +#define DCD_TIMEOUT_SEL_BIT BIT(5)
>> +#define OCD_CURRENT_SEL_BIT BIT(4)
>> +#define SLOW_PLUGIN_TIMER_EN_CFG_BIT BIT(3)
>> +#define FLOAT_OPTIONS_MASK GENMASK(2, 0)
>> +#define FLOAT_DIS_CHGING_CFG_BIT BIT(2)
>> +#define SUSPEND_FLOAT_CFG_BIT BIT(1)
>> +#define FORCE_FLOAT_SDP_CFG_BIT BIT(0)
>> +
>> +#define TAPER_TIMER_SEL_CFG_REG 0x364
>> +#define TYPEC_SPARE_CFG_BIT BIT(7)
>> +#define TYPEC_DRP_DFP_TIME_CFG_BIT BIT(5)
>> +#define TAPER_TIMER_SEL_MASK GENMASK(1, 0)
>> +
>> +#define USBIN_LOAD_CFG_REG 0x365
>> +#define USBIN_OV_CH_LOAD_OPTION_BIT BIT(7)
>> +#define ICL_OVERRIDE_AFTER_APSD_BIT BIT(4)
>> +
>> +#define USBIN_ICL_OPTIONS_REG 0x366
>> +#define CFG_USB3P0_SEL_BIT BIT(2)
>> +#define USB51_MODE_BIT BIT(1)
>> +#define USBIN_MODE_CHG_BIT BIT(0)
>> +
>> +#define TYPE_C_INTRPT_ENB_SOFTWARE_CTRL_REG 0x368
>> +#define EXIT_SNK_BASED_ON_CC_BIT BIT(7)
>> +#define VCONN_EN_ORIENTATION_BIT BIT(6)
>> +#define TYPEC_VCONN_OVERCURR_INT_EN_BIT BIT(5)
>> +#define VCONN_EN_SRC_BIT BIT(4)
>> +#define VCONN_EN_VALUE_BIT BIT(3)
>> +#define TYPEC_POWER_ROLE_CMD_MASK GENMASK(2, 0)
>> +#define UFP_EN_CMD_BIT BIT(2)
>> +#define DFP_EN_CMD_BIT BIT(1)
>> +#define TYPEC_DISABLE_CMD_BIT BIT(0)
>> +
>> +#define USBIN_CURRENT_LIMIT_CFG_REG 0x370
>> +#define USBIN_CURRENT_LIMIT_MASK GENMASK(7, 0)
>> +
>> +#define USBIN_AICL_OPTIONS_CFG_REG 0x380
>> +#define SUSPEND_ON_COLLAPSE_USBIN_BIT BIT(7)
>> +#define USBIN_AICL_HDC_EN_BIT BIT(6)
>> +#define USBIN_AICL_START_AT_MAX_BIT BIT(5)
>> +#define USBIN_AICL_RERUN_EN_BIT BIT(4)
>> +#define USBIN_AICL_ADC_EN_BIT BIT(3)
>> +#define USBIN_AICL_EN_BIT BIT(2)
>> +#define USBIN_HV_COLLAPSE_RESPONSE_BIT BIT(1)
>> +#define USBIN_LV_COLLAPSE_RESPONSE_BIT BIT(0)
>> +
>> +#define DC_ENG_SSUPPLY_CFG2_REG 0x4C1
>> +#define ENG_SSUPPLY_IVREF_OTG_SS_MASK GENMASK(2, 0)
>> +#define OTG_SS_SLOW 0x3
>> +
>> +#define DCIN_AICL_REF_SEL_CFG_REG 0x481
>> +#define DCIN_CONT_AICL_THRESHOLD_CFG_MASK GENMASK(5, 0)
>> +
>> +#define WI_PWR_OPTIONS_REG 0x495
>> +#define CHG_OK_BIT BIT(7)
>> +#define WIPWR_UVLO_IRQ_OPT_BIT BIT(6)
>> +#define BUCK_HOLDOFF_ENABLE_BIT BIT(5)
>> +#define CHG_OK_HW_SW_SELECT_BIT BIT(4)
>> +#define WIPWR_RST_ENABLE_BIT BIT(3)
>> +#define DCIN_WIPWR_IRQ_SELECT_BIT BIT(2)
>> +#define AICL_SWITCH_ENABLE_BIT BIT(1)
>> +#define ZIN_ICL_ENABLE_BIT BIT(0)
>> +
>> +#define ICL_STATUS_REG 0x607
>> +#define INPUT_CURRENT_LIMIT_MASK GENMASK(7, 0)
>> +
>> +#define POWER_PATH_STATUS_REG 0x60B
>> +#define P_PATH_INPUT_SS_DONE_BIT BIT(7)
>> +#define P_PATH_USBIN_SUSPEND_STS_BIT BIT(6)
>> +#define P_PATH_DCIN_SUSPEND_STS_BIT BIT(5)
>> +#define P_PATH_USE_USBIN_BIT BIT(4)
>> +#define P_PATH_USE_DCIN_BIT BIT(3)
>> +#define P_PATH_POWER_PATH_MASK GENMASK(2, 1)
>> +#define P_PATH_VALID_INPUT_POWER_SOURCE_STS_BIT BIT(0)
>> +
>> +#define WD_CFG_REG 0x651
>> +#define WATCHDOG_TRIGGER_AFP_EN_BIT BIT(7)
>> +#define BARK_WDOG_INT_EN_BIT BIT(6)
>> +#define BITE_WDOG_INT_EN_BIT BIT(5)
>> +#define SFT_AFTER_WDOG_IRQ_MASK GENMASK(4, 3)
>> +#define WDOG_IRQ_SFT_BIT BIT(2)
>> +#define WDOG_TIMER_EN_ON_PLUGIN_BIT BIT(1)
>> +#define WDOG_TIMER_EN_BIT BIT(0)
>> +
>> +#define AICL_RERUN_TIME_CFG_REG 0x661
>> +#define AICL_RERUN_TIME_MASK GENMASK(1, 0)
>> +
>> +#define SDP_CURRENT_UA 500000
>> +#define CDP_CURRENT_UA 1500000
>> +#define DCP_CURRENT_UA 1500000
>> +
>> +enum charger_status {
>> +	TRICKLE_CHARGE = 0,
>> +	PRE_CHARGE,
>> +	FAST_CHARGE,
>> +	FULLON_CHARGE,
>> +	TAPER_CHARGE,
>> +	TERMINATE_CHARGE,
>> +	INHIBIT_CHARGE,
>> +	DISABLE_CHARGE,
>> +};
>> +
>> +struct smb2_register {
>> +	u16 addr;
>> +	u8 mask;
>> +	u8 val;
>> +};
>> +
>> +/**
>> + * struct smb2_chip - smb2 chip structure
>> + * @dev:		Device reference for power_supply
> 
> name is missing
> 
>> + * @base:		Base address for smb2 registers
>> + * @regmap:		Register map
>> + * @reg_lock:		Mutex for register access
>> + * @batt_info:		Battery data from DT
> 
> status_change_work is missing
> 
>> + * @usbin_i_chan:	USBIN current measurement channel
>> + * @usbin_v_chan:	USBIN voltage measurement channel
>> + * @chg_psy:		Charger power supply instance
>> + * @usb_present:	True if a charger is attached
>> + */
>> +struct smb2_chip {
>> +	struct device *dev;
>> +	const char *name;
>> +	unsigned int base;
>> +	struct regmap *regmap;
>> +	struct mutex reg_lock;
>> +	struct power_supply_battery_info *batt_info;
>> +
>> +	struct delayed_work status_change_work;
>> +
>> +	struct iio_channel *usbin_i_chan;
>> +	struct iio_channel *usbin_v_chan;
>> +
>> +	struct power_supply *chg_psy;
>> +
>> +	bool usb_present;
>> +};
>> +
>> +static enum power_supply_property smb2_properties[] = {
>> +	POWER_SUPPLY_PROP_MANUFACTURER, POWER_SUPPLY_PROP_MODEL_NAME,
>> +	POWER_SUPPLY_PROP_CURRENT_MAX,	POWER_SUPPLY_PROP_CURRENT_NOW,
>> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,	POWER_SUPPLY_PROP_STATUS,
>> +	POWER_SUPPLY_PROP_HEALTH,	POWER_SUPPLY_PROP_ONLINE,
>> +	POWER_SUPPLY_PROP_USB_TYPE,
>> +};
> 
> Make this one item per line. This results in better line diffs when
> something is changed later.
> 
>> +
>> +static enum power_supply_usb_type smb2_usb_types[] = {
>> +	POWER_SUPPLY_USB_TYPE_SDP, POWER_SUPPLY_USB_TYPE_DCP,
>> +	POWER_SUPPLY_USB_TYPE_CDP, POWER_SUPPLY_USB_TYPE_C,
>> +	POWER_SUPPLY_USB_TYPE_PD_DRP
>> +};
> 
> Same as before.
> 
>> +/*
>> + * Qualcomm "automatic power source detection" aka APSD
>> + * tells us what type of charger we're connected to.
>> + */
>> +static int smb2_apsd_get_charger_type(struct smb2_chip *chip, int *val)
>> +{
>> +	int rc;
>> +	unsigned int apsd_stat, stat;
>> +
>> +	mutex_lock(&chip->reg_lock);
>> +
>> +	rc = regmap_read(chip->regmap, chip->base + APSD_STATUS_REG,
>> +			 &apsd_stat);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Failed to read apsd status, rc = %d", rc);
>> +		return rc;
> 
> this returns without unlocking mutex...
> 
>> +	}
>> +	if (!(apsd_stat & APSD_DTC_STATUS_DONE_BIT)) {
>> +		dev_err(chip->dev, "Apsd not ready");
>> +		return -EAGAIN;
> 
> another return with locked mutex
> 
>> +	}
>> +
>> +	rc = regmap_read(chip->regmap, chip->base + APSD_RESULT_STATUS_REG,
>> +			 &stat);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Failed to read apsd result, rc = %d", rc);
>> +		return rc;
> 
> another return with locked mutex
> 
>> +	}
>> +
>> +	mutex_unlock(&chip->reg_lock);
>> +
>> +	stat &= APSD_RESULT_STATUS_MASK;
>> +
>> +	if (stat & CDP_CHARGER_BIT) {
>> +		*val = POWER_SUPPLY_USB_TYPE_CDP;
>> +	} else if (stat &
>> +		   (DCP_CHARGER_BIT | OCP_CHARGER_BIT | FLOAT_CHARGER_BIT)) {
>> +		*val = POWER_SUPPLY_USB_TYPE_DCP;
>> +	} else { /* SDP_CHARGER_BIT (or others) */
>> +		*val = POWER_SUPPLY_USB_TYPE_SDP;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int smb2_get_prop_usb_online(struct smb2_chip *chip, int *val)
>> +{
>> +	unsigned int stat;
>> +	int rc;
>> +
>> +	rc = regmap_read(chip->regmap, chip->base + POWER_PATH_STATUS_REG,
>> +			 &stat);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Couldn't read POWER_PATH_STATUS! ret=%d\n",
>> +			rc);
>> +		return rc;
>> +	}
>> +
>> +	*val = (stat & P_PATH_USE_USBIN_BIT) &&
>> +	       (stat & P_PATH_VALID_INPUT_POWER_SOURCE_STS_BIT);
>> +	return rc;
>> +}
>> +
>> +int smb2_get_prop_status(struct smb2_chip *chip, int *val)
>> +{
>> +	int usb_online_val;
>> +	unsigned int stat;
>> +	int rc;
>> +	bool usb_online;
>> +
>> +	mutex_lock(&chip->reg_lock);
>> +
>> +	rc = smb2_get_prop_usb_online(chip, &usb_online_val);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Couldn't get usb online property rc = %d\n",
>> +			rc);
>> +		return rc;
> 
> another return with locked mutex
> 
>> +	}
>> +	usb_online = (bool)usb_online_val;
>> +
>> +	if (!usb_online) {
> 
> Just use 'if (!usb_online_val) {' and drop the explicit cast.
> 
>> +		*val = POWER_SUPPLY_STATUS_DISCHARGING;
>> +		return rc;
>> +	}
>> +
>> +	rc = regmap_read(chip->regmap,
>> +			 chip->base + BATTERY_CHARGER_STATUS_1_REG, &stat);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev,
>> +			"Failed to read charging status ret=%d\n", rc);
>> +		return rc;
> 
> another return with locked mutex
> 
>> +	}
>> +
>> +	mutex_unlock(&chip->reg_lock);
>> +
>> +	stat = stat & BATTERY_CHARGER_STATUS_MASK;
>> +
>> +	switch (stat) {
>> +	case TRICKLE_CHARGE:
>> +	case PRE_CHARGE:
>> +	case FAST_CHARGE:
>> +	case FULLON_CHARGE:
>> +	case TAPER_CHARGE:
>> +		*val = POWER_SUPPLY_STATUS_CHARGING;
>> +		return rc;
>> +	case DISABLE_CHARGE:
>> +		*val = POWER_SUPPLY_STATUS_NOT_CHARGING;
>> +		return rc;
>> +	case TERMINATE_CHARGE:
>> +		*val = POWER_SUPPLY_STATUS_FULL;
>> +		return rc;
>> +	case INHIBIT_CHARGE:
>> +	default:
>> +		*val = POWER_SUPPLY_STATUS_UNKNOWN;
>> +		return rc;
>> +	}
>> +}
>> +
>> +static inline int smb2_get_current_limit(struct smb2_chip *chip,
>> +					 unsigned int *val)
>> +{
>> +	int rc = regmap_read(chip->regmap, chip->base + ICL_STATUS_REG, val);
>> +
>> +	if (rc >= 0)
>> +		*val *= 25000;
>> +	return rc;
>> +}
>> +
>> +static inline int smb2_set_current_limit(struct smb2_chip *chip,
>> +					 unsigned int val)
>> +{
>> +	unsigned char val_raw;
>> +
>> +	if (val > 4800000) {
>> +		dev_err(chip->dev,
>> +			"Can't set current limit higher than 4800000uA");
>> +		return -EINVAL;
>> +	}
>> +	val_raw = val / 25000;
>> +	return regmap_write(chip->regmap,
>> +			    chip->base + USBIN_CURRENT_LIMIT_CFG_REG, val_raw);
>> +}
>> +
>> +void smb2_status_change_work(struct work_struct *work)
>> +{
>> +	struct smb2_chip *chip =
>> +		container_of(work, struct smb2_chip, status_change_work.work);
>> +	unsigned int charger_type, current_ua;
>> +	int usb_online, count, rc;
>> +
>> +	mutex_lock(&chip->reg_lock);
>> +
>> +	smb2_get_prop_usb_online(chip, &usb_online);
>> +	if (usb_online == 0)
>> +		return;
> 
> another return with locked mutex
> 
>> +
>> +	for (count = 0; count < 3; count++) {
>> +		dev_info(chip->dev, "get charger type retry %d\n", count);
> 
> dev_dbg()?
> 
>> +		rc = smb2_apsd_get_charger_type(chip, &charger_type);
>> +		if (rc == 0)
>> +			break;
>> +		msleep(100);
>> +	}
>> +
>> +	if (rc < 0) {
>> +		rc = regmap_update_bits(chip->regmap, chip->base + CMD_APSD_REG,
>> +					APSD_RERUN_BIT, APSD_RERUN_BIT);
>> +		schedule_delayed_work(&chip->status_change_work,
>> +				      msecs_to_jiffies(1500));
>> +		return;
> 
> another return with locked mutex
> 
>> +	}
>> +
>> +	switch (charger_type) {
>> +	case POWER_SUPPLY_USB_TYPE_CDP:
>> +		current_ua = CDP_CURRENT_UA;
>> +		break;
>> +	case POWER_SUPPLY_USB_TYPE_DCP:
>> +		current_ua = DCP_CURRENT_UA;
>> +		break;
>> +	case POWER_SUPPLY_USB_TYPE_SDP:
>> +	default:
>> +		current_ua = SDP_CURRENT_UA;
>> +		break;
>> +	}
>> +
>> +	smb2_set_current_limit(chip, current_ua);
>> +	mutex_unlock(&chip->reg_lock);
>> +	power_supply_changed(chip->chg_psy);
>> +}
>> +
>> +int smb2_get_iio_chan(struct smb2_chip *chip, struct iio_channel *chan,
>> +		      int *val)
>> +{
>> +	int rc = 0;
>> +	union power_supply_propval status;
>> +
>> +	rc = power_supply_get_property(chip->chg_psy, POWER_SUPPLY_PROP_STATUS,
>> +				       &status);
>> +	if (rc < 0 || status.intval != POWER_SUPPLY_STATUS_CHARGING) {
>> +		*val = 0;
>> +		return 0;
>> +	}
>> +
>> +	if (IS_ERR(chan)) {
>> +		dev_err(chip->dev, "Failed to chan, err = %li", PTR_ERR(chan));
>> +		return PTR_ERR(chan);
>> +	}
>> +
>> +	rc = iio_read_channel_processed(chan, val);
>> +	return rc;
>> +}
>> +
>> +int smb2_get_prop_health(struct smb2_chip *chip, int *val)
>> +{
>> +	int rc;
>> +	unsigned int stat;
>> +
>> +	*val = POWER_SUPPLY_HEALTH_UNKNOWN;
>> +
>> +	rc = regmap_read(chip->regmap,
>> +			 chip->base + BATTERY_CHARGER_STATUS_2_REG, &stat);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Couldn't read charger status rc=%d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	switch (stat & BATTERY_CHARGER_STATUS_MASK) {
>> +	case CHARGER_ERROR_STATUS_BAT_OV_BIT:
>> +		*val = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
>> +		return 0;
>> +	case BAT_TEMP_STATUS_TOO_COLD_BIT:
>> +		*val = POWER_SUPPLY_HEALTH_COLD;
>> +		return 0;
>> +	case BAT_TEMP_STATUS_TOO_HOT_BIT:
>> +		*val = POWER_SUPPLY_HEALTH_OVERHEAT;
>> +		return 0;
>> +	case BAT_TEMP_STATUS_COLD_SOFT_LIMIT_BIT:
>> +		*val = POWER_SUPPLY_HEALTH_COOL;
>> +		return 0;
>> +	case BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT:
>> +		*val = POWER_SUPPLY_HEALTH_WARM;
>> +		return 0;
>> +	default:
>> +		*val = POWER_SUPPLY_HEALTH_GOOD;
>> +		return 0;
>> +	}
>> +}
>> +
>> +static int smb2_get_property(struct power_supply *psy,
>> +			     enum power_supply_property psp,
>> +			     union power_supply_propval *val)
>> +{
>> +	struct smb2_chip *chip = power_supply_get_drvdata(psy);
>> +	int error = 0;
>> +
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_MANUFACTURER:
>> +		val->strval = "Qualcomm";
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_MODEL_NAME:
>> +		val->strval = chip->name;
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_CURRENT_MAX:
>> +		error = smb2_get_current_limit(chip, &val->intval);
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_CURRENT_NOW:
>> +		error = smb2_get_iio_chan(chip, chip->usbin_i_chan,
>> +					  &val->intval);
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
>> +		error = smb2_get_iio_chan(chip, chip->usbin_v_chan,
>> +					  &val->intval);
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_ONLINE:
>> +		error = smb2_get_prop_usb_online(chip, &val->intval);
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_STATUS:
>> +		error = smb2_get_prop_status(chip, &val->intval);
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_HEALTH:
>> +		error = smb2_get_prop_health(chip, &val->intval);
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_USB_TYPE:
>> +		error = smb2_apsd_get_charger_type(chip, &val->intval);
>> +		return 0;
>> +	default:
>> +		dev_err(chip->dev, "invalid property: %d\n", psp);
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static int smb2_set_property(struct power_supply *psy,
>> +			     enum power_supply_property psp,
>> +			     const union power_supply_propval *val)
>> +{
>> +	struct smb2_chip *chip = power_supply_get_drvdata(psy);
>> +	int error = 0;
>> +
>> +	dev_info(chip->dev, "Setting property: %d", psp);
> 
> drop
> 
>> +
>> +	mutex_lock(&chip->reg_lock);
>> +
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_CURRENT_MAX:
>> +		error = smb2_set_current_limit(chip, val->intval);
>> +		break;
>> +	default:
>> +		dev_err(chip->dev, "No setter for property: %d\n", psp);
>> +		error = -EINVAL;
>> +	}
>> +
>> +	mutex_unlock(&chip->reg_lock);
>> +
>> +	return error;
>> +}
>> +
>> +static int smb2_property_is_writable(struct power_supply *psy,
>> +				     enum power_supply_property psp)
>> +{
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_CURRENT_MAX:
>> +		return 1;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +irqreturn_t smb2_handle_usb_plugin(int irq, void *data)
>> +{
>> +	struct smb2_chip *chip = data;
>> +	int rc;
>> +	unsigned int intrt_stat;
>> +
>> +	rc = regmap_read(chip->regmap, chip->base + INT_RT_STS, &intrt_stat);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev,
>> +			"Couldn't read USB status from reg! ret=%d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	chip->usb_present = (bool)(intrt_stat & USBIN_PLUGIN_RT_STS_BIT);
> 
> This variable is not read anywhere. I suppose you can just drop the
> regmap read from this place?
> 
>> +	power_supply_changed(chip->chg_psy);
>> +
>> +	schedule_delayed_work(&chip->status_change_work,
>> +			      msecs_to_jiffies(1000));
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static const struct power_supply_desc smb2_psy_desc = {
>> +	.name = "usb",
>> +	.type = POWER_SUPPLY_TYPE_USB,
>> +	.usb_types = smb2_usb_types,
>> +	.num_usb_types = ARRAY_SIZE(smb2_usb_types),
>> +	.properties = smb2_properties,
>> +	.num_properties = ARRAY_SIZE(smb2_properties),
>> +	.get_property = smb2_get_property,
>> +	.set_property = smb2_set_property,
>> +	.property_is_writeable = smb2_property_is_writable,
>> +};
>> +
>> +/* Init sequence derived from downstream driver */
>> +static struct smb2_register smb2_init_seq[] = {
> 
> static const?
> 
>> +	{ .addr = AICL_RERUN_TIME_CFG_REG,
>> +	  .mask = AICL_RERUN_TIME_MASK,
>> +	  .val = 0 },
>> +	{ .addr = USBIN_AICL_OPTIONS_CFG_REG,
>> +	  .mask = USBIN_AICL_START_AT_MAX_BIT | USBIN_AICL_ADC_EN_BIT,
>> +	  .val = 0 },
>> +	/*
>> +	 * By default configure us as an upstream facing port
>> +	 * FIXME: for OTG we should set UFP_EN_CMD_BIT and DFP_EN_CMD_BIT both to 0
>> +	 */
>> +	{ .addr = TYPE_C_INTRPT_ENB_SOFTWARE_CTRL_REG,
>> +	  .mask = TYPEC_POWER_ROLE_CMD_MASK | VCONN_EN_SRC_BIT |
>> +		  VCONN_EN_VALUE_BIT,
>> +	  .val = VCONN_EN_SRC_BIT | UFP_EN_CMD_BIT },
>> +	/*
>> +	 * disable Type-C factory mode and stay in Attached.SRC state when VCONN
>> +	 * over-current happens
>> +	 */
>> +	{ .addr = TYPE_C_CFG_REG,
>> +	  .mask = FACTORY_MODE_DETECTION_EN_BIT | VCONN_OC_CFG_BIT,
>> +	  .val = 0 },
>> +	/* Configure VBUS for software control */
>> +	{ .addr = OTG_CFG_REG, .mask = OTG_EN_SRC_CFG_BIT, .val = 0 },
>> +	{ .addr = FG_UPDATE_CFG_2_SEL_REG,
>> +	  .mask = SOC_LT_CHG_RECHARGE_THRESH_SEL_BIT |
>> +		  VBT_LT_CHG_RECHARGE_THRESH_SEL_BIT,
>> +	  .val = VBT_LT_CHG_RECHARGE_THRESH_SEL_BIT },
>> +	/* Enable automatic input current limit */
>> +	{ .addr = USBIN_AICL_OPTIONS_CFG_REG,
>> +	  .mask = USBIN_AICL_EN_BIT,
>> +	  .val = 1 },
>> +	{ .addr = USBIN_OPTIONS_1_CFG_REG, .mask = HVDCP_EN_BIT, .val = 0 },
>> +	{ .addr = CHARGING_ENABLE_CMD_REG,
>> +	  .mask = CHARGING_ENABLE_CMD_BIT,
>> +	  .val = CHARGING_ENABLE_CMD_BIT },
>> +	{ .addr = USBIN_LOAD_CFG_REG,
>> +	  .mask = ICL_OVERRIDE_AFTER_APSD_BIT,
>> +	  .val = ICL_OVERRIDE_AFTER_APSD_BIT },
>> +	{ .addr = CHGR_CFG2_REG,
>> +	  .mask = CHG_EN_POLARITY_BIT | CHG_EN_SRC_BIT,
>> +	  .val = 0 },
>> +	{ .addr = TYPE_C_INTRPT_ENB_SOFTWARE_CTRL_REG,
>> +	  .mask = UFP_EN_CMD_BIT,
>> +	  .val = UFP_EN_CMD_BIT },
>> +	/* Set the default SDP charger type to a 500ma USB 2.0 port
>> +	 * and apply ICL override? (OnePlus 6 hack??)
>> +	 */
>> +	{ .addr = USBIN_ICL_OPTIONS_REG,
>> +	  .mask = USB51_MODE_BIT | USBIN_MODE_CHG_BIT,
>> +	  .val = USB51_MODE_BIT }, //| USBIN_MODE_CHG_BIT },
>> +};
>> +
>> +static int smb2_init_hw(struct smb2_chip *chip)
>> +{
>> +	int rc, i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(smb2_init_seq); i++) {
>> +		dev_info(chip->dev, "%d: Writing 0x%02x to 0x%02x\n", i,
>> +			 smb2_init_seq[i].val, smb2_init_seq[i].addr);
> 
> dev_dbg
> 
>> +		rc = regmap_update_bits(chip->regmap,
>> +					chip->base + smb2_init_seq[i].addr,
>> +					smb2_init_seq[i].mask,
>> +					smb2_init_seq[i].val);
>> +		if (rc < 0) {
>> +			dev_err(chip->dev,
>> +				"%s: Failed to write 0x%02x to 0x%02x: %d\n",
>> +				__func__, smb2_init_seq[i].val,
>> +				smb2_init_seq[i].addr, rc);
>> +			return rc;
>> +		}
>> +	}
>> +
>> +	smb2_set_current_limit(chip, 1950 * 1000);
>> +	return rc;
>> +}
>> +
>> +static int smb2_probe(struct platform_device *pdev)
>> +{
>> +	struct power_supply_config supply_config = {};
>> +	struct smb2_chip *chip;
>> +	int rc = 0, irq;
>> +
>> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>> +
>> +	chip->dev = &pdev->dev;
>> +	chip->name = pdev->name;
>> +	mutex_init(&chip->reg_lock);
>> +
>> +	chip->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!chip->regmap) {
>> +		dev_err(chip->dev, "failed to locate the regmap\n");
>> +		return -ENODEV;
> 
> dev_err_probe()
> 
>> +	}
>> +
>> +	rc = device_property_read_u32(chip->dev, "reg", &chip->base);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Couldn't read base address from dt: %d\n",
>> +			rc);
>> +		return rc;
> 
> dev_err_probe()
> 
>> +	}
>> +
>> +	irq = of_irq_get_byname(pdev->dev.of_node, "usb-plugin");
>> +	if (irq < 0) {
>> +		dev_err(&pdev->dev, "Couldn't get irq usb-plugin byname\n");
>> +		return irq;
> 
> dev_err_probe()
> 
>> +	}
>> +
>> +	rc = devm_request_threaded_irq(chip->dev, irq, NULL,
>> +				       smb2_handle_usb_plugin, IRQF_ONESHOT,
>> +				       "usb-plugin", chip);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Couldn't request irq %d\n", irq);
>> +		return rc;
> 
> dev_err_probe()
> 
>> +	}
>> +
>> +	chip->usbin_v_chan = iio_channel_get(chip->dev, "usbin_v");
>> +	chip->usbin_i_chan = iio_channel_get(chip->dev, "usbin_i");
> 
> maybe add another _ and make this usb_in_v and usb_in_i, which is
> easier to read?
> 
>> +	/* RRADC should probe before us, but just in case it doesn't */
>> +	if (PTR_ERR(chip->usbin_v_chan) == -EPROBE_DEFER ||
>> +	    PTR_ERR(chip->usbin_i_chan) == -EPROBE_DEFER) {
>> +		return -EPROBE_DEFER;
> 
> return dev_err_probe(chip->dev, -EPROBE_DEFER, "Missing IIO device");
> 
> to get a proper info string in /sys/kernel/debug/devices_deferred
> for the charger when something goes wrong and IIO never probes.
> 
>> +	}
>> +
>> +	rc = smb2_init_hw(chip);
>> +	if (rc < 0) {
>> +		dev_err(chip->dev, "Couldn't init hw %d\n", rc);
>> +		return rc;
> 
> dev_err_probe
> 
>> +	}
>> +
>> +	supply_config.drv_data = chip;
>> +	supply_config.of_node = pdev->dev.of_node;
>> +
>> +	chip->chg_psy = devm_power_supply_register(chip->dev, &smb2_psy_desc,
>> +						   &supply_config);
>> +	if (IS_ERR(chip->chg_psy)) {
>> +		dev_err(&pdev->dev, "failed to register power supply\n");
>> +		return PTR_ERR(chip->chg_psy);
> 
> dev_err_probe
> 
>> +	}
>> +
>> +	rc = power_supply_get_battery_info(chip->chg_psy, &chip->batt_info);
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "Failed to get battery info: %d\n", rc);
>> +		return rc;
> 
> dev_err_probe
> 
>> +	}
>> +
>> +	INIT_DELAYED_WORK(&chip->status_change_work, smb2_status_change_work);
> 
> #include <linux/devm-helpers.h>
> 
> devm_delayed_work_autocancel()
> 
> Also the delayed work must be registered before the irq, since it
> might trigger instantly during probe and or trigger the IRQ handler
> during driver removal resulting in queuing another delasyed work
> between the autocancel and the IRQ removal.
> 
>> +	rc = chip->batt_info->voltage_max_design_uv;
>> +	rc = regmap_update_bits(chip->regmap,
>> +				chip->base + FLOAT_VOLTAGE_CFG_REG,
>> +				FLOAT_VOLTAGE_SETTING_MASK, rc / 1000);
>> +	if (rc < 0)
>> +		dev_err(chip->dev, "Couldn't set vbat max rc = %d\n", rc);
>> +
>> +	platform_set_drvdata(pdev, chip);
>> +
>> +	/* trigger the IRQ to set up initial state */
>> +	smb2_handle_usb_plugin(irq, chip);
>> +
>> +	return 0;
>> +}
>> +
>> +static int smb2_remove(struct platform_device *pdev)
>> +{
>> +	struct smb2_chip *chip = platform_get_drvdata(pdev);
>> +
>> +	power_supply_put_battery_info(chip->chg_psy, chip->batt_info);
>> +	return 0;
>> +}
> 
> This can be removed, since power_supply_get_battery_info()
> now is using device managed memory allocation functions
> internally.
> 
>> +
>> +static const struct of_device_id fg_match_id_table[] = {
>> +	{ .compatible = "qcom,pmi8998-smb2" },
>> +	{ /* sentinal */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, fg_match_id_table);
>> +
>> +static struct platform_driver qcom_spmi_smb2 = {
>> +	.probe = smb2_probe,
>> +	.remove = smb2_remove,
>> +	.driver = {
>> +		.name = "qcom-spmi-smb2",
>> +		.of_match_table = fg_match_id_table,
>> +	},
>> +};
>> +
>> +module_platform_driver(qcom_spmi_smb2);
>> +
>> +MODULE_AUTHOR("Caleb Connolly <caleb.connolly@linaro.org>");
>> +MODULE_DESCRIPTION("Qualcomm SMB2 Charger Driver");
>> +MODULE_LICENSE("GPL");
> 
> -- Sebastian

-- 
Kind Regards,
Caleb (they/them)
