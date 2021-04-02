Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715203524F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 03:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbhDBBMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 21:12:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54403 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234047AbhDBBMV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 21:12:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617325941; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+Yni5q+FxzLsCq7NA7tG30P8JRAnN4P0W8qH0iJRtEA=; b=pbpWTWzDWpuqvV6bSgdQj3j/eVV10E4BSif2+PelzP21Z9fW6HOu0sftsBKuYceNL3RY1EVO
 525yXh2za0+jQKeLbPnlKZBYrot4bxrRhkYvT0nYLNQO7ZkkblRaJFtknca+MT4/mpmmqHlD
 +LzQ7Axa1Y6WVIvFl38vYRu0mys=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60666f728807bcde1d8e5b4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 01:12:18
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11B33C43463; Fri,  2 Apr 2021 01:12:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.70] (cpe-76-167-231-33.san.res.rr.com [76.167.231.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E989AC433ED;
        Fri,  2 Apr 2021 01:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E989AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
Subject: Re: [PATCH v2] firmware: qcom_scm: Only compile legacy calls on ARM
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20210323224336.1311783-1-swboyd@chromium.org>
From:   Elliot Berman <eberman@codeaurora.org>
Message-ID: <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org>
Date:   Thu, 1 Apr 2021 18:12:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323224336.1311783-1-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/23/2021 3:43 PM, Stephen Boyd wrote:
> These scm calls are never used outside of legacy ARMv7 based platforms.
> That's because PSCI, mandated on arm64, implements them for modern SoCs
> via the PSCI spec. Let's move them to the legacy file and only compile
> the legacy file into the kernel when CONFIG_ARM=y. Otherwise provide
> stubs and fail the calls. This saves a little bit of space in an
> arm64 allmodconfig.
> 
>   $ ./scripts/bloat-o-meter vmlinux.before vmlinux.after
>   add/remove: 0/8 grow/shrink: 5/6 up/down: 509/-4401 (-3892)
>   Function                                     old     new   delta
>   __qcom_scm_set_dload_mode.constprop          312     452    +140
>   qcom_scm_qsmmu500_wait_safe_toggle           288     416    +128
>   qcom_scm_io_writel                           288     408    +120
>   qcom_scm_io_readl                            376     492    +116
>   __param_str_download_mode                     23      28      +5
>   __warned                                    4327    4326      -1
>   e843419@0b3f_00010432_324                      8       -      -8
>   qcom_scm_call                                228     208     -20
>   CSWTCH                                      5925    5877     -48
>   _sub_I_65535_1                            163100  163040     -60
>   _sub_D_65535_0                            163100  163040     -60
>   qcom_scm_wb                                   64       -     -64
>   qcom_scm_lock                                320     160    -160
>   qcom_scm_call_atomic                         212       -    -212
>   qcom_scm_cpu_power_down                      308       -    -308
>   scm_legacy_call_atomic                       520       -    -520
>   qcom_scm_set_warm_boot_addr                  720       -    -720
>   qcom_scm_set_cold_boot_addr                  728       -    -728
>   scm_legacy_call                             1492       -   -1492
>   Total: Before=66737606, After=66733714, chg -0.01%
> 
> Commit 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and
> legacy conventions") didn't mention any motivating factors for keeping
> the legacy code around on arm64 kernels, i.e. presumably that commit
> wasn't trying to support these legacy APIs on arm64 kernels.
> 
> Cc: Elliot Berman <eberman@codeaurora.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
It might be a good idea to wrap these lines from qcom_scm_call with #if 
IS_ENABLED(CONFIG_ARM), and the corresponding ones in qcom_scm_call_atomic:

   case SMC_CONVENTION_LEGACY:
       return scm_legacy_call(dev, desc, res);

If something is wrong with loaded firmware and LEGACY convention is 
incorrectly selected, you would get a better hint about the problem: 
"Unknown current SCM calling convention." You would still get the hint 
earlier from __get_convention, but that may not be obvious to someone 
unfamiliar with the SCM driver.

I'll defer to your/Bjorn's preference:

Acked-by: Elliot Berman <eberman@codeaurora.org>

with or without modifying qcom_scm_call{_atomic}.

> 
> Followup to v1 (https://lore.kernel.org/r/20210223214539.1336155-7-swboyd@chromium.org):
>   * Don't change the legacy file to use legacy calls only
>   * Wrap more things in CONFIG_ARM checks
> 
>   drivers/firmware/Makefile   |  4 +++-
>   drivers/firmware/qcom_scm.c | 47 ++++++++++++++++++++-----------------
>   drivers/firmware/qcom_scm.h | 15 ++++++++++++
>   include/linux/qcom_scm.h    | 21 ++++++++++-------
>   4 files changed, 56 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 5e013b6a3692..0b7b35555a6c 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -17,7 +17,9 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
>   obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
>   obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
>   obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
> -obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> +obj-$(CONFIG_QCOM_SCM)		+= qcom_scm_objs.o
> +qcom_scm_objs-$(CONFIG_ARM)	+= qcom_scm-legacy.o
> +qcom_scm_objs-$(CONFIG_QCOM_SCM) += qcom_scm.o qcom_scm-smc.o
>   obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
>   obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
>   obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index ee9cb545e73b..747808a8ddf4 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -49,28 +49,6 @@ struct qcom_scm_mem_map_info {
>   	__le64 mem_size;
>   };
>   
> -#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
> -#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
> -#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
> -#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
> -
> -#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
> -#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
> -#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
> -#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
> -
> -struct qcom_scm_wb_entry {
> -	int flag;
> -	void *entry;
> -};
> -
> -static struct qcom_scm_wb_entry qcom_scm_wb[] = {
> -	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
> -	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
> -	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
> -	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
> -};
> -
>   static const char *qcom_scm_convention_names[] = {
>   	[SMC_CONVENTION_UNKNOWN] = "unknown",
>   	[SMC_CONVENTION_ARM_32] = "smc arm 32",
> @@ -260,6 +238,30 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
>   	return ret ? false : !!res.result[0];
>   }
>   
> +#if IS_ENABLED(CONFIG_ARM)
> +
> +#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
> +#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
> +#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
> +#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
> +
> +#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
> +#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
> +#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
> +#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
> +
> +struct qcom_scm_wb_entry {
> +	int flag;
> +	void *entry;
> +};
> +
> +static struct qcom_scm_wb_entry qcom_scm_wb[] = {
> +	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
> +	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
> +	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
> +	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
> +};
> +
>   /**
>    * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
>    * @entry: Entry point function for the cpus
> @@ -369,6 +371,7 @@ void qcom_scm_cpu_power_down(u32 flags)
>   	qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
>   }
>   EXPORT_SYMBOL(qcom_scm_cpu_power_down);
> +#endif
>   
>   int qcom_scm_set_remote_state(u32 state, u32 id)
>   {
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index 632fe3142462..735e975320e4 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -68,11 +68,26 @@ extern int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>   	__scm_smc_call((dev), (desc), qcom_scm_convention, (res), (atomic))
>   
>   #define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
> +#if IS_ENABLED(CONFIG_ARM)
>   extern int scm_legacy_call_atomic(struct device *dev,
>   				  const struct qcom_scm_desc *desc,
>   				  struct qcom_scm_res *res);
>   extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>   			   struct qcom_scm_res *res);
> +#else
> +static inline int scm_legacy_call_atomic(struct device *dev,
> +					 const struct qcom_scm_desc *desc,
> +					 struct qcom_scm_res *res)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
> +				  struct qcom_scm_res *res)
> +{
> +	return -EINVAL;
> +}
> +#endif
>   
>   #define QCOM_SCM_SVC_BOOT		0x01
>   #define QCOM_SCM_BOOT_SET_ADDR		0x01
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index 0165824c5128..0ec905d56e1a 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -64,9 +64,6 @@ enum qcom_scm_ice_cipher {
>   #if IS_ENABLED(CONFIG_QCOM_SCM)
>   extern bool qcom_scm_is_available(void);
>   
> -extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
> -extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
> -extern void qcom_scm_cpu_power_down(u32 flags);
>   extern int qcom_scm_set_remote_state(u32 state, u32 id);
>   
>   extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
> @@ -115,11 +112,6 @@ extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
>   
>   static inline bool qcom_scm_is_available(void) { return false; }
>   
> -static inline int qcom_scm_set_cold_boot_addr(void *entry,
> -		const cpumask_t *cpus) { return -ENODEV; }
> -static inline int qcom_scm_set_warm_boot_addr(void *entry,
> -		const cpumask_t *cpus) { return -ENODEV; }
> -static inline void qcom_scm_cpu_power_down(u32 flags) {}
>   static inline u32 qcom_scm_set_remote_state(u32 state,u32 id)
>   		{ return -ENODEV; }
>   
> @@ -171,4 +163,17 @@ static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>   static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
>   		{ return -ENODEV; }
>   #endif
> +
> +#if IS_ENABLED(CONFIG_ARM) && IS_ENABLED(CONFIG_QCOM_SCM)
> +extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
> +extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
> +extern void qcom_scm_cpu_power_down(u32 flags);
> +#else
> +static inline int qcom_scm_set_cold_boot_addr(void *entry,
> +		const cpumask_t *cpus) { return -ENODEV; }
> +static inline int qcom_scm_set_warm_boot_addr(void *entry,
> +		const cpumask_t *cpus) { return -ENODEV; }
> +static inline void qcom_scm_cpu_power_down(u32 flags) {}
> +#endif
> +
>   #endif
> 
> base-commit: 3b9cdafb5358eb9f3790de2f728f765fef100731
> prerequisite-patch-id: 77da2cfd7591b1d7c35e879dca67d4f037f40e48
> prerequisite-patch-id: 021337034973fa8ce52fc8c84787f40dabb33df6
> prerequisite-patch-id: 5d374e97d8f0d384098a46e91006811ab89c84b0
> prerequisite-patch-id: 892de894cc937f7fe6ddb8f95ec9e2e3557830c7
> prerequisite-patch-id: 33b2442181aeb8adfa1c08d9a167d3bcbd1660fe
> 
