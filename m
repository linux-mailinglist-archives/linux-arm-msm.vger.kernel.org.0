Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FEF122199
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 02:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLQBdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 20:33:35 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:56170 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfLQBde (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 20:33:34 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20191217013324epoutp033de144c71956236dfa5fa1b16e7ca593~hBJoK9vGy2735127351epoutp033
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 01:33:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20191217013324epoutp033de144c71956236dfa5fa1b16e7ca593~hBJoK9vGy2735127351epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576546404;
        bh=L4bC4iFZip8u+jXXdMOgfE32OMTXf9j8EuWpCNkJnio=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=oq3h+gGDBrJRh1+kIRvrwHCZtmbCbklWkkjuKlu/onPIx+kCmqt+pfR39j7ry/CD7
         CkJJBa435+ysBYYqlhQveqxyMzbyoXP+vq0AAlKt7hi+vpJ2UyJlkpbujocMEwjHMc
         RQXp+RsdPTua7WxzAC3ljMs7VDZ1u9x5EL+8zaGE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191217013323epcas1p226e2e3628f5a90f9b060b6e24b0063b5~hBJnpnbO01567515675epcas1p2W;
        Tue, 17 Dec 2019 01:33:23 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 47cLJ04PYKzMqYkX; Tue, 17 Dec
        2019 01:33:20 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        11.E4.52419.06038FD5; Tue, 17 Dec 2019 10:33:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191217013319epcas1p22d5bd1cb147345fdec972b41f5af719c~hBJkHI68U1234612346epcas1p2T;
        Tue, 17 Dec 2019 01:33:19 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191217013319epsmtrp22488c10e85e626d2ad935f7b55890df5~hBJkGGasU3276332763epsmtrp2e;
        Tue, 17 Dec 2019 01:33:19 +0000 (GMT)
X-AuditID: b6c32a37-5b7ff7000001ccc3-fb-5df830602562
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8E.A8.06569.F5038FD5; Tue, 17 Dec 2019 10:33:19 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191217013319epsmtip149a93cfd401a9d9bbf9d3a335c7ecf36~hBJj1JvmN0861608616epsmtip1b;
        Tue, 17 Dec 2019 01:33:19 +0000 (GMT)
Subject: Re: [PATCH RFC 2/7] mmc: core: devfreq: Add devfreq based clock
 scaling support
To:     Sayali Lokhande <sayalil@codeaurora.org>, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org, devicetree@vger.kernel.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, vviswana@codeaurora.org,
        bjorn.andersson@linaro.org, riteshh@codeaurora.org,
        vbadigan@codeaurora.org, Talel Shenhar <tatias@codeaurora.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <0929e6e1-428e-29c5-dfd2-6010ecd54654@samsung.com>
Date:   Tue, 17 Dec 2019 10:39:54 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1531475583-7050-3-git-send-email-sayalil@codeaurora.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxje6f2ErHpWRI78GPWauUBS7LUWjpsly1Rsoj9YXCQzY3gDNxTp
        V3pbAuoPks0PkOGI4kKDYmIwkYG4yuRjbYrQrSK2AcFvBRMaNyGgk6lkyz56e1nGv+d93+c5
        b57nnMMSmjk6nS23u0WXXbBydDJ5dShTp9unXyzSj/zB4eFYB40DR64zeCQ4T+LWUJTC3wZ8
        NG4MRhg83t9C49A/JwBuuzumwsHZUQofDoQYPF/zC4UfxbooPNa9wODI9U4ShzsLsb+nnsHe
        8G80vvK6nvooxdxxtgOYxxu+VpnP+5+pzL72Wtr86I6fNv/lDZLmBd+7Bczeii0WUSgVXVrR
        XuIoLbeXmbidu4u3Fhtz9LyO34xzOa1dsIkmbtuuAl1+uTXuhdNWClZPvFUgSBK3IW+Ly+Fx
        i1qLQ3KbONFZanVudmZLgk3y2MuySxy2D3i9fqMxTtxXYWnynyCcpxdVVS0dL8kaMPCdqg4k
        sQhuQuGhWbIOJLMa2AvQ76GzhFK8BGhkaoZWitcATXw5wdQBNiE5Ht4jqzUwANCU/0OF8xyg
        SV+UkgcpcC+6E40x8mAVrAUoEq6n5IKAxwn04pKPkVk0zELBX+/RMl4J16Lbi9NAxmqYh1pv
        DpAyJuF76Iejs4lTU+EeNHz1qyXOO2i4OZbgJMF89P3Mg4QhAqahB7HWJZyBeuZaEn4QnGRQ
        37ULhOJ6GwpOzwEFp6CZcDej4HS0MB+gFXwQXRwO0Yr4GEDdwVFKGRhQsO2kSs6CgJmoq3+D
        0l6L+v48A5TFK9D8K9mxHJcaHTuiUSjr0PiTx0vBr0Hnj9bS3wDOu8yOd5kF7zIL3v+XnQNk
        O1gtOiVbmSjxTsPyC/eBxFPPyu0Fl6O7BgFkAfe22ln5pkhDCZVStW0QIJbgVql7tfGWulSo
        PiC6HMUuj1WUBoExnnYjkZ5a4oh/HLu7mDduNBgMeBOfY+R5Lk3NLo4VaWCZ4BYrRNEpuv7T
        qdik9BqQocmYLBnK+WKHabYpL3B/onprwcD60+7xvgsPCy9m34p0vtm+4vOqA/UNGaFPdnbd
        SHt6cl37oeSmU+rDVW/lrhzZ3fzZ++Kh3BeeZ9HI6BVLW8Otxhv2j6dq+2pOFZ5pBI5rqaY1
        mZd+ijX8bdXl5Tel5D+e/nT7QM+P/dM/P6ebd+w3cKRkEfgswiUJ/wIKLuq8AAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRzGe3fOzjlqq7fN8p2Bl0UYI02t6P0QEkSxbxmIomZ60uMF3ZQd
        L2kIGlZ4SVuS0tAtLxG4abjKSylb23RKKS1zhUhfHKSJkkoplFRHC/bt9zz/5/fpzxBSDxnM
        5GmKOa2GLVBQ/uSAQxESmR69lRbdPRyFJ71mCo/enqDxG+sqiY3OaTFuHbVQWGedovHMyzYK
        O383Afz4o1uErcvvxPjWqJPGq1VfxHje+1SM3c83aDw10UtiV28SHhlsoLHetUbhZz8axOdk
        KrPBDFQzjXdFqq6RJZHK0lNLqeY9I5RqW28lVRuWkHg6xf9sFleQV8ppT8Rl+Oc+GGkiilq2
        RNfbzOtkFbCZRHWAYRA8hepdiXXAj5HCVwA1zQUKjKActbjHiN2JDDkc/O5kBaDX1UhgGUxB
        nmkvXQf8mUBYC9B6o14sBALWE6h57RspBCmcBWjZZCAEhYJKZF38RAm8H4aj2a0FILAExiHj
        WxspMAmPohd3lsUCH4SJaLh7QbS7OYAmH3p3Nn7wIur/OrfTEzAC/TK8J3Y5CM15jf/6UDS4
        0kbcAzK9j673UfQ+it5HeQTIHiDninh1jpqPKYrVcGVRPKvmSzQ5UZmFagvY+bZSOQQmJtLt
        ADJAsVeCijfTpGK2lC9X2wFiCEWgZCjsbyXJYssrOG1hurakgOPt4DBDKoIkoYXjyVKYwxZz
        +RxXxGn/X0WMX3AVgO5rPTerA5yfM05nypfG+uL7U9sr2r/3ebqyj7HkzwsRicOxM+H21k2H
        zhRgu78dSXdkP5H3tA7l6AwNpoFVNklXqS9buuTqSjZm6mom+zcqw7qbjVc/LEsXThbayPyM
        K5dveBPOjK8d6TzfnFZTmbBnX+ihzuMyaUjqonO9Q0HyuWyMktDy7B9Fpd/c6QIAAA==
X-CMS-MailID: 20191217013319epcas1p22d5bd1cb147345fdec972b41f5af719c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20180713095349epcas3p4f208da00caa889bdafc907ab76a88376
References: <1531475583-7050-1-git-send-email-sayalil@codeaurora.org>
        <CGME20180713095349epcas3p4f208da00caa889bdafc907ab76a88376@epcas3p4.samsung.com>
        <1531475583-7050-3-git-send-email-sayalil@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 7/13/18 6:52 PM, Sayali Lokhande wrote:
> This change adds the use of devfreq to MMC.
> Both eMMC and SD card will use it.
> For some workloads, such as video playback, it isn't
> necessary for these cards to run at high speed.
> Running at lower frequency, for example 52MHz, in such
> cases can still meet the deadlines for data transfers.
> Scaling down the clock frequency dynamically has power
> savings not only because the bus is running at lower frequency
> but also has an advantage of scaling down the system core
> voltage, if supported.
> Provide an ondemand clock scaling support similar to the
> cpufreq ondemand governor having two thresholds,
> up_threshold and down_threshold to decide whether to
> increase the frequency or scale it down respectively.
> The sampling interval is in the order of milliseconds.
> If sampling interval is too low, frequent switching of
> frequencies can lead to high power consumption and if
> sampling interval is too high, the clock scaling logic
> would take long time to realize that the underlying
> hardware (controller and card) is busy and scale up
> the clocks.
> 
> Signed-off-by: Talel Shenhar <tatias@codeaurora.org>
> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> ---
>  .../devicetree/bindings/mmc/sdhci-msm.txt          |  10 +
>  drivers/mmc/core/core.c                            | 560 +++++++++++++++++++++
>  drivers/mmc/core/core.h                            |   7 +
>  drivers/mmc/core/debugfs.c                         |  46 ++
>  drivers/mmc/core/host.c                            |   8 +
>  drivers/mmc/core/mmc.c                             | 200 +++++++-
>  drivers/mmc/core/sd.c                              |  72 ++-
>  drivers/mmc/host/sdhci-msm.c                       |  37 ++
>  drivers/mmc/host/sdhci-pltfm.c                     |  11 +
>  drivers/mmc/host/sdhci.c                           |  27 +
>  drivers/mmc/host/sdhci.h                           |   8 +
>  include/linux/mmc/card.h                           |   5 +
>  include/linux/mmc/host.h                           |  70 +++
>  13 files changed, 1059 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 502b3b8..bd8470a 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -26,6 +26,15 @@ Required properties:
>  	"cal"	- reference clock for RCLK delay calibration (optional)
>  	"sleep"	- sleep clock for RCLK delay calibration (optional)
>  
> +Optional Properties:
> +- qcom,devfreq,freq-table - specifies supported frequencies for clock scaling.
> +				    Clock scaling logic shall toggle between these frequencies based
> +				    on card load. In case the defined frequencies are over or below
> +				    the supported card frequencies, they will be overridden
> +				    during card init. In case this entry is not supplied,
> +				    the driver will construct one based on the card
> +				    supported max and min frequencies.
> +				    The frequencies must be ordered from lowest to highest.
>  Example:
>  
>  	sdhc_1: sdhci@f9824900 {
> @@ -43,6 +52,7 @@ Example:
>  
>  		clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>  		clock-names = "core", "iface";
> +		qcom,devfreq,freq-table = <52000000 200000000>;

I replied about OPP usage on DT as following.
- https://patchwork.kernel.org/patch/10522931/

>  	};
>  
>  	sdhc_2: sdhci@f98a4900 {
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 281826d..0eaee42 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -14,6 +14,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/completion.h>
> +#include <linux/devfreq.h>
>  #include <linux/device.h>
>  #include <linux/delay.h>
>  #include <linux/pagemap.h>
> @@ -112,6 +113,556 @@ static inline void mmc_should_fail_request(struct mmc_host *host,
>  
>  #endif /* CONFIG_FAIL_MMC_REQUEST */
>  
> +static bool mmc_is_data_request(struct mmc_request *mmc_request)
> +{
> +	switch (mmc_request->cmd->opcode) {
> +	case MMC_READ_SINGLE_BLOCK:
> +	case MMC_READ_MULTIPLE_BLOCK:
> +	case MMC_WRITE_BLOCK:
> +	case MMC_WRITE_MULTIPLE_BLOCK:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static void mmc_clk_scaling_start_busy(struct mmc_host *host, bool lock_needed)
> +{
> +	struct mmc_devfeq_clk_scaling *clk_scaling = &host->clk_scaling;
> +
> +	if (!clk_scaling->enable)
> +		return;
> +
> +	if (lock_needed)
> +		spin_lock_bh(&clk_scaling->lock);
> +
> +	clk_scaling->start_busy = ktime_get();
> +	clk_scaling->is_busy_started = true;
> +
> +	if (lock_needed)
> +		spin_unlock_bh(&clk_scaling->lock);
> +}
> +
> +static void mmc_clk_scaling_stop_busy(struct mmc_host *host, bool lock_needed)
> +{
> +	struct mmc_devfeq_clk_scaling *clk_scaling = &host->clk_scaling;
> +
> +	if (!clk_scaling->enable)
> +		return;
> +
> +	if (lock_needed)
> +		spin_lock_bh(&clk_scaling->lock);
> +
> +	if (!clk_scaling->is_busy_started) {
> +		WARN_ON(1);
> +		goto out;
> +	}
> +
> +	clk_scaling->total_busy_time_us +=
> +		ktime_to_us(ktime_sub(ktime_get(),
> +			clk_scaling->start_busy));
> +	pr_debug("%s: accumulated busy time is %lu usec\n",
> +		mmc_hostname(host), clk_scaling->total_busy_time_us);
> +	clk_scaling->is_busy_started = false;
> +
> +out:
> +	if (lock_needed)
> +		spin_unlock_bh(&clk_scaling->lock);
> +}
> +
> +/**
> + * mmc_can_scale_clk() - Check clock scaling capability
> + * @host: pointer to mmc host structure
> + */
> +bool mmc_can_scale_clk(struct mmc_host *host)
> +{
> +	if (!host) {
> +		pr_err("bad host parameter\n");
> +		WARN_ON(1);
> +		return false;
> +	}
> +
> +	return host->caps2 & MMC_CAP2_CLK_SCALE;
> +}
> +EXPORT_SYMBOL(mmc_can_scale_clk);
> +
> +static int mmc_devfreq_get_dev_status(struct device *dev,
> +		struct devfreq_dev_status *status)
> +{
> +	struct mmc_host *host = container_of(dev, struct mmc_host, class_dev);
> +	struct mmc_devfeq_clk_scaling *clk_scaling;
> +
> +	if (!host) {
> +		pr_err("bad host parameter\n");
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	clk_scaling = &host->clk_scaling;
> +
> +	if (!clk_scaling->enable)
> +		return 0;
> +
> +	spin_lock_bh(&clk_scaling->lock);
> +
> +	/* accumulate the busy time of ongoing work */
> +	memset(status, 0, sizeof(*status));
> +	if (clk_scaling->is_busy_started) {
> +			mmc_clk_scaling_stop_busy(host, false);
> +			mmc_clk_scaling_start_busy(host, false);
> +	}
> +
> +	status->busy_time = clk_scaling->total_busy_time_us;
> +	status->total_time = ktime_to_us(ktime_sub(ktime_get(),
> +		clk_scaling->measure_interval_start));
> +	clk_scaling->total_busy_time_us = 0;
> +	status->current_frequency = clk_scaling->curr_freq;
> +	clk_scaling->measure_interval_start = ktime_get();
> +
> +	pr_debug("%s: status: load = %lu%% - total_time=%lu busy_time = %lu, clk=%lu\n",
> +		mmc_hostname(host),
> +		(status->busy_time*100)/status->total_time,
> +		status->total_time, status->busy_time,
> +		status->current_frequency);
> +
> +	spin_unlock_bh(&clk_scaling->lock);
> +
> +	return 0;
> +}
> +
> +static bool mmc_is_valid_state_for_clk_scaling(struct mmc_host *host)
> +{
> +	struct mmc_card *card = host->card;
> +	u32 status;
> +
> +	/*
> +	 * If the current partition type is RPMB, clock switching may not
> +	 * work properly as sending tuning command (CMD21) is illegal in
> +	 * this mode.
> +	 */
> +	if (!card || (mmc_card_mmc(card) &&
> +			(card->part_curr == EXT_CSD_PART_CONFIG_ACC_RPMB ||
> +			mmc_card_doing_bkops(card))))
> +		return false;
> +
> +	if (mmc_send_status(card, &status)) {
> +		pr_err("%s: Get card status fail\n", mmc_hostname(card->host));
> +		return false;
> +	}
> +
> +	return R1_CURRENT_STATE(status) == R1_STATE_TRAN;
> +}
> +
> +int mmc_clk_update_freq(struct mmc_host *host,
> +		unsigned long freq, enum mmc_load state)
> +{
> +	int err = 0;
> +
> +	if (!host) {
> +		pr_err("bad host parameter\n");
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	/* make sure the card supports the frequency we want */
> +	if (unlikely(freq > host->card->clk_scaling_highest)) {
> +		freq = host->card->clk_scaling_highest;
> +		pr_warn("%s: %s: frequency was overridden to %lu\n",
> +				mmc_hostname(host), __func__,
> +				host->card->clk_scaling_highest);
> +	}
> +
> +	if (unlikely(freq < host->card->clk_scaling_lowest)) {
> +		freq = host->card->clk_scaling_lowest;
> +		pr_warn("%s: %s: frequency was overridden to %lu\n",
> +			mmc_hostname(host), __func__,
> +			host->card->clk_scaling_lowest);
> +	}
> +
> +	if (freq == host->clk_scaling.curr_freq)
> +		goto out;
> +
> +	if (host->ops->notify_load) {
> +		err = host->ops->notify_load(host, state);
> +		if (err) {
> +			pr_err("%s: %s: fail on notify_load\n",
> +				mmc_hostname(host), __func__);
> +			goto out;
> +		}
> +	}
> +
> +	if (!mmc_is_valid_state_for_clk_scaling(host)) {
> +		pr_debug("%s: invalid state for clock scaling - skipping",
> +			mmc_hostname(host));
> +		goto invalid_state;
> +	}
> +
> +	err = host->bus_ops->change_bus_speed(host, &freq);
> +	if (!err)
> +		host->clk_scaling.curr_freq = freq;
> +	else
> +		pr_err("%s: %s: failed (%d) at freq=%lu\n",
> +			mmc_hostname(host), __func__, err, freq);
> +
> +invalid_state:
> +	if (err) {
> +		/* restore previous state */
> +		if (host->ops->notify_load)
> +			if (host->ops->notify_load(host,
> +				host->clk_scaling.state))
> +				pr_err("%s: %s: fail on notify_load restore\n",
> +					mmc_hostname(host), __func__);
> +	}
> +out:
> +	return err;
> +}
> +EXPORT_SYMBOL(mmc_clk_update_freq);
> +
> +static int mmc_devfreq_set_target(struct device *dev,
> +				unsigned long *freq, u32 devfreq_flags)
> +{
> +	struct mmc_host *host = container_of(dev, struct mmc_host, class_dev);
> +	struct mmc_devfeq_clk_scaling *clk_scaling;
> +	int err = 0;
> +	int abort;
> +	unsigned long pflags = current->flags;
> +
> +	/* Ensure scaling would happen even in memory pressure conditions */
> +	current->flags |= PF_MEMALLOC;
> +
> +	if (!(host && freq)) {
> +		pr_err("%s: unexpected host/freq parameter\n", __func__);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	clk_scaling = &host->clk_scaling;
> +
> +	if (!clk_scaling->enable)
> +		goto out;
> +
> +	pr_debug("%s: target freq = %lu (%s)\n", mmc_hostname(host),
> +		*freq, current->comm);
> +
> +	if ((clk_scaling->curr_freq == *freq) ||
> +		clk_scaling->skip_clk_scale_freq_update)
> +		goto out;
> +
> +	/* No need to scale the clocks if they are gated */
> +	if (!host->ios.clock)
> +		goto out;
> +
> +	spin_lock_bh(&clk_scaling->lock);
> +	if (clk_scaling->clk_scaling_in_progress) {
> +		pr_debug("%s: clocks scaling is already in-progress by mmc thread\n",
> +			mmc_hostname(host));
> +		spin_unlock_bh(&clk_scaling->lock);
> +		goto out;
> +	}
> +	clk_scaling->need_freq_change = true;
> +	clk_scaling->target_freq = *freq;
> +	clk_scaling->state = *freq < clk_scaling->curr_freq ?
> +		MMC_LOAD_LOW : MMC_LOAD_HIGH;
> +	spin_unlock_bh(&clk_scaling->lock);
> +
> +	abort = __mmc_claim_host(host, NULL, &clk_scaling->devfreq_abort);
> +	if (abort)
> +		goto out;
> +
> +	/*
> +	 * In case we were able to claim host there is no need to
> +	 * defer the frequency change. It will be done now
> +	 */
> +	clk_scaling->need_freq_change = false;
> +
> +	err = mmc_clk_update_freq(host, *freq, clk_scaling->state);
> +	if (err && err != -EAGAIN) {
> +		pr_err("%s: clock scale to %lu failed with error %d\n",
> +			mmc_hostname(host), *freq, err);
> +	} else {
> +		pr_debug("%s: clock change to %lu finished successfully (%s)\n",
> +			mmc_hostname(host), *freq, current->comm);
> +	}
> +
> +	mmc_release_host(host);
> +out:
> +	current->flags &= ~PF_MEMALLOC;
> +	current->flags |= pflags & PF_MEMALLOC;
> +	return err;
> +}
> +
> +/**
> + * mmc_deferred_scaling() - scale clocks from data path (mmc thread context)
> + * @host: pointer to mmc host structure
> + *
> + * This function does clock scaling in case "need_freq_change" flag was set
> + * by the clock scaling logic.
> + */
> +void mmc_deferred_scaling(struct mmc_host *host)
> +{
> +	unsigned long target_freq;
> +	int err;
> +
> +	if (!host->clk_scaling.enable)
> +		return;
> +
> +	spin_lock_bh(&host->clk_scaling.lock);
> +
> +	if (host->clk_scaling.clk_scaling_in_progress ||
> +		!(host->clk_scaling.need_freq_change)) {
> +		spin_unlock_bh(&host->clk_scaling.lock);
> +		return;
> +	}
> +
> +
> +	atomic_inc(&host->clk_scaling.devfreq_abort);
> +	target_freq = host->clk_scaling.target_freq;
> +	host->clk_scaling.clk_scaling_in_progress = true;
> +	host->clk_scaling.need_freq_change = false;
> +	spin_unlock_bh(&host->clk_scaling.lock);
> +	pr_debug("%s: doing deferred frequency change (%lu) (%s)\n",
> +				mmc_hostname(host),
> +				target_freq, current->comm);
> +
> +	err = mmc_clk_update_freq(host, target_freq,
> +		host->clk_scaling.state);
> +	if (err && err != -EAGAIN) {
> +		pr_err("%s: failed on deferred scale clocks (%d)\n",
> +			mmc_hostname(host), err);
> +	} else {
> +		pr_debug("%s: clocks were successfully scaled to %lu (%s)\n",
> +			mmc_hostname(host),
> +			target_freq, current->comm);
> +	}
> +	host->clk_scaling.clk_scaling_in_progress = false;
> +	atomic_dec(&host->clk_scaling.devfreq_abort);
> +}
> +EXPORT_SYMBOL(mmc_deferred_scaling);
> +
> +static int mmc_devfreq_create_freq_table(struct mmc_host *host)
> +{
> +	int i;
> +	struct mmc_devfeq_clk_scaling *clk_scaling = &host->clk_scaling;
> +
> +	pr_debug("%s: supported: lowest=%lu, highest=%lu\n",
> +		mmc_hostname(host),
> +		host->card->clk_scaling_lowest,
> +		host->card->clk_scaling_highest);
> +
> +	/*
> +	 * Create the frequency table and initialize it with default values.
> +	 * Initialize it with platform specific frequencies if the frequency
> +	 * table supplied by platform driver is present, otherwise initialize
> +	 * it with min and max frequencies supported by the card.
> +	 */
> +	if (!clk_scaling->freq_table) {
> +		if (clk_scaling->pltfm_freq_table_sz)
> +			clk_scaling->freq_table_sz =
> +				clk_scaling->pltfm_freq_table_sz;
> +		else
> +			clk_scaling->freq_table_sz = 2;
> +
> +		clk_scaling->freq_table = kzalloc(
> +			(clk_scaling->freq_table_sz *
> +			sizeof(*(clk_scaling->freq_table))), GFP_KERNEL);
> +		if (!clk_scaling->freq_table)
> +			return -ENOMEM;
> +
> +		if (clk_scaling->pltfm_freq_table) {
> +			memcpy(clk_scaling->freq_table,
> +				clk_scaling->pltfm_freq_table,
> +				(clk_scaling->pltfm_freq_table_sz *
> +				sizeof(*(clk_scaling->pltfm_freq_table))));
> +		} else {
> +			pr_debug("%s: no frequency table defined -  setting default\n",
> +				mmc_hostname(host));
> +			clk_scaling->freq_table[0] =
> +				host->card->clk_scaling_lowest;
> +			clk_scaling->freq_table[1] =
> +				host->card->clk_scaling_highest;
> +			goto out;
> +		}
> +	}
> +
> +	if (host->card->clk_scaling_lowest >
> +		clk_scaling->freq_table[0])
> +		pr_debug("%s: frequency table undershot possible freq\n",
> +			mmc_hostname(host));
> +
> +	for (i = 0; i < clk_scaling->freq_table_sz; i++) {
> +		if (clk_scaling->freq_table[i] <=
> +			host->card->clk_scaling_highest)
> +			continue;
> +		clk_scaling->freq_table[i] =
> +			host->card->clk_scaling_highest;
> +		clk_scaling->freq_table_sz = i + 1;
> +		pr_debug("%s: frequency table overshot possible freq (%d)\n",
> +				mmc_hostname(host), clk_scaling->freq_table[i]);
> +		break;
> +	}
> +
> +out:
> +	/**
> +	 * devfreq requires unsigned long type freq_table while the
> +	 * freq_table in clk_scaling is un32. Here allocates an individual
> +	 * memory space for it and release it when exit clock scaling.
> +	 */
> +	clk_scaling->devfreq_profile.freq_table =  kzalloc(
> +			clk_scaling->freq_table_sz *
> +			sizeof(*(clk_scaling->devfreq_profile.freq_table)),
> +			GFP_KERNEL);
> +	if (!clk_scaling->devfreq_profile.freq_table)
> +		return -ENOMEM;
> +	clk_scaling->devfreq_profile.max_state = clk_scaling->freq_table_sz;
> +
> +	for (i = 0; i < clk_scaling->freq_table_sz; i++) {
> +		clk_scaling->devfreq_profile.freq_table[i] =
> +			clk_scaling->freq_table[i];
> +		pr_debug("%s: freq[%d] = %u\n",
> +			mmc_hostname(host), i, clk_scaling->freq_table[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * mmc_init_devfreq_clk_scaling() - Initialize clock scaling
> + * @host: pointer to mmc host structure
> + *
> + * Initialize clock scaling for supported hosts. It is assumed that the caller
> + * ensure clock is running at maximum possible frequency before calling this
> + * function. Shall use struct devfreq_simple_ondemand_data to configure
> + * governor.
> + */
> +int mmc_init_clk_scaling(struct mmc_host *host)
> +{
> +	int err;
> +
> +	if (!host || !host->card) {
> +		pr_err("%s: unexpected host/card parameters\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	if (!mmc_can_scale_clk(host) ||
> +		!host->bus_ops->change_bus_speed) {
> +		pr_debug("%s: clock scaling is not supported\n",
> +			mmc_hostname(host));
> +		return 0;
> +	}
> +
> +	pr_debug("registering %s dev (%p) to devfreq",
> +		mmc_hostname(host),
> +		mmc_classdev(host));
> +
> +	if (host->clk_scaling.devfreq) {
> +		pr_err("%s: dev is already registered for dev %p\n",
> +			mmc_hostname(host),
> +			mmc_dev(host));
> +		return -EPERM;
> +	}
> +	spin_lock_init(&host->clk_scaling.lock);
> +	atomic_set(&host->clk_scaling.devfreq_abort, 0);
> +	host->clk_scaling.curr_freq = host->ios.clock;
> +	host->clk_scaling.clk_scaling_in_progress = false;
> +	host->clk_scaling.need_freq_change = false;
> +	host->clk_scaling.is_busy_started = false;
> +
> +	host->clk_scaling.devfreq_profile.polling_ms =
> +		host->clk_scaling.polling_delay_ms;
> +	host->clk_scaling.devfreq_profile.get_dev_status =
> +		mmc_devfreq_get_dev_status;
> +	host->clk_scaling.devfreq_profile.target = mmc_devfreq_set_target;
> +	host->clk_scaling.devfreq_profile.initial_freq = host->ios.clock;
> +
> +	host->clk_scaling.ondemand_gov_data.simple_scaling = true;
> +	host->clk_scaling.ondemand_gov_data.upthreshold =
> +		host->clk_scaling.upthreshold;
> +	host->clk_scaling.ondemand_gov_data.downdifferential =
> +		host->clk_scaling.upthreshold - host->clk_scaling.downthreshold;
> +
> +	err = mmc_devfreq_create_freq_table(host);
> +	if (err) {
> +		pr_err("%s: fail to create devfreq frequency table\n",
> +			mmc_hostname(host));
> +		return err;
> +	}
> +
> +	pr_debug("%s: adding devfreq with: upthreshold=%u downthreshold=%u polling=%u\n",
> +		mmc_hostname(host),
> +		host->clk_scaling.ondemand_gov_data.upthreshold,
> +		host->clk_scaling.ondemand_gov_data.downdifferential,
> +		host->clk_scaling.devfreq_profile.polling_ms);
> +	host->clk_scaling.devfreq = devfreq_add_device(
> +		mmc_classdev(host),
> +		&host->clk_scaling.devfreq_profile,
> +		"simple_ondemand",
> +		&host->clk_scaling.ondemand_gov_data);
> +	if (!host->clk_scaling.devfreq) {
> +		pr_err("%s: unable to register with devfreq\n",
> +			mmc_hostname(host));
> +		return -EPERM;
> +	}
> +
> +	pr_debug("%s: clk scaling is enabled for device %s (%p) with devfreq %p (clock = %uHz)\n",
> +		mmc_hostname(host),
> +		dev_name(mmc_classdev(host)),
> +		mmc_classdev(host),
> +		host->clk_scaling.devfreq,
> +		host->ios.clock);
> +
> +	host->clk_scaling.enable = true;
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(mmc_init_clk_scaling);
> +
> +/**
> + * mmc_exit_devfreq_clk_scaling() - Disable clock scaling
> + * @host: pointer to mmc host structure
> + *
> + * Disable clock scaling permanently.
> + */
> +int mmc_exit_clk_scaling(struct mmc_host *host)
> +{
> +	int err;
> +
> +	if (!host) {
> +		pr_err("%s: bad host parameter\n", __func__);
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	if (!mmc_can_scale_clk(host))
> +		return 0;
> +
> +	if (!host->clk_scaling.devfreq) {
> +		pr_err("%s: %s: no devfreq is assosiated with this device\n",
> +			mmc_hostname(host), __func__);
> +		return -EPERM;
> +	}
> +
> +	err = devfreq_remove_device(host->clk_scaling.devfreq);
> +	if (err) {
> +		pr_err("%s: remove devfreq failed (%d)\n",
> +			mmc_hostname(host), err);
> +		return err;
> +	}
> +
> +	kfree(host->clk_scaling.devfreq_profile.freq_table);
> +
> +	host->clk_scaling.devfreq = NULL;
> +	atomic_set(&host->clk_scaling.devfreq_abort, 1);
> +
> +	kfree(host->clk_scaling.freq_table);
> +	host->clk_scaling.freq_table = NULL;
> +
> +	pr_debug("%s: devfreq was removed\n", mmc_hostname(host));
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(mmc_exit_clk_scaling);
> +
>  static inline void mmc_complete_cmd(struct mmc_request *mrq)
>  {
>  	if (mrq->cap_cmd_during_tfr && !completion_done(&mrq->cmd_completion))
> @@ -143,6 +694,9 @@ void mmc_request_done(struct mmc_host *host, struct mmc_request *mrq)
>  	struct mmc_command *cmd = mrq->cmd;
>  	int err = cmd->error;
>  
> +	if (host->clk_scaling.is_busy_started)
> +		mmc_clk_scaling_stop_busy(host, true);
> +
>  	/* Flag re-tuning needed on CRC errors */
>  	if ((cmd->opcode != MMC_SEND_TUNING_BLOCK &&
>  	    cmd->opcode != MMC_SEND_TUNING_BLOCK_HS200) &&
> @@ -354,6 +908,12 @@ int mmc_start_request(struct mmc_host *host, struct mmc_request *mrq)
>  		return err;
>  
>  	led_trigger_event(host->led, LED_FULL);
> +
> +	if (mmc_is_data_request(mrq)) {
> +		mmc_deferred_scaling(host);
> +		mmc_clk_scaling_start_busy(host, true);
> +	}
> +
>  	__mmc_start_request(host, mrq);
>  
>  	return 0;
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 9d8f09a..fc0a9b7 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -34,6 +34,7 @@ struct mmc_bus_ops {
>  	int (*shutdown)(struct mmc_host *);
>  	int (*hw_reset)(struct mmc_host *);
>  	int (*sw_reset)(struct mmc_host *);
> +	int (*change_bus_speed)(struct mmc_host *, unsigned long *);
>  };
>  
>  void mmc_attach_bus(struct mmc_host *host, const struct mmc_bus_ops *ops);
> @@ -46,6 +47,8 @@ struct device_node *mmc_of_find_child_device(struct mmc_host *host,
>  
>  void mmc_set_chip_select(struct mmc_host *host, int mode);
>  void mmc_set_clock(struct mmc_host *host, unsigned int hz);
> +int mmc_clk_update_freq(struct mmc_host *host,
> +		unsigned long freq, enum mmc_load state);
>  void mmc_set_bus_mode(struct mmc_host *host, unsigned int mode);
>  void mmc_set_bus_width(struct mmc_host *host, unsigned int width);
>  u32 mmc_select_voltage(struct mmc_host *host, u32 ocr);
> @@ -91,6 +94,10 @@ static inline void mmc_delay(unsigned int ms)
>  void mmc_add_card_debugfs(struct mmc_card *card);
>  void mmc_remove_card_debugfs(struct mmc_card *card);
>  
> +extern bool mmc_can_scale_clk(struct mmc_host *host);
> +extern int mmc_init_clk_scaling(struct mmc_host *host);
> +extern int mmc_exit_clk_scaling(struct mmc_host *host);
> +
>  int mmc_execute_tuning(struct mmc_card *card);
>  int mmc_hs200_to_hs400(struct mmc_card *card);
>  int mmc_hs400_to_hs200(struct mmc_card *card);
> diff --git a/drivers/mmc/core/debugfs.c b/drivers/mmc/core/debugfs.c
> index d2275c5..630ca8e 100644
> --- a/drivers/mmc/core/debugfs.c
> +++ b/drivers/mmc/core/debugfs.c
> @@ -225,6 +225,43 @@ static int mmc_clock_opt_set(void *data, u64 val)
>  DEFINE_SIMPLE_ATTRIBUTE(mmc_clock_fops, mmc_clock_opt_get, mmc_clock_opt_set,
>  	"%llu\n");
>  
> +#include <linux/delay.h>
> +
> +static int mmc_scale_get(void *data, u64 *val)
> +{
> +	struct mmc_host *host = data;
> +
> +	*val = host->clk_scaling.curr_freq;
> +
> +	return 0;
> +}
> +
> +static int mmc_scale_set(void *data, u64 val)
> +{
> +	int err = 0;
> +	struct mmc_host *host = data;
> +
> +	mmc_claim_host(host);
> +
> +	/* change frequency from sysfs manually */
> +	err = mmc_clk_update_freq(host, val, host->clk_scaling.state);
> +	if (err == -EAGAIN)
> +		err = 0;
> +	else if (err)
> +		pr_err("%s: clock scale to %llu failed with error %d\n",
> +			mmc_hostname(host), val, err);
> +	else
> +		pr_debug("%s: clock change to %llu finished successfully (%s)\n",
> +			mmc_hostname(host), val, current->comm);
> +
> +	mmc_release_host(host);
> +
> +	return err;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(mmc_scale_fops, mmc_scale_get, mmc_scale_set,
> +	"%llu\n");
> +
>  void mmc_add_host_debugfs(struct mmc_host *host)
>  {
>  	struct dentry *root;
> @@ -253,6 +290,15 @@ void mmc_add_host_debugfs(struct mmc_host *host)
>  			&mmc_clock_fops))
>  		goto err_node;
>  
> +	if (!debugfs_create_file("scale", 0600, root, host,
> +		&mmc_scale_fops))
> +		goto err_node;
> +
> +	if (!debugfs_create_bool("skip_clk_scale_freq_update",
> +		0600, root,
> +		&host->clk_scaling.skip_clk_scale_freq_update))
> +		goto err_node;
> +
>  #ifdef CONFIG_FAIL_MMC_REQUEST
>  	if (fail_request)
>  		setup_fault_attr(&fail_default_attr, fail_request);
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index abf9e88..1e46aa4 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -32,6 +32,10 @@
>  #include "pwrseq.h"
>  #include "sdio_ops.h"
>  
> +#define MMC_DEVFRQ_DEFAULT_UP_THRESHOLD 35
> +#define MMC_DEVFRQ_DEFAULT_DOWN_THRESHOLD 5
> +#define MMC_DEVFRQ_DEFAULT_POLLING_MSEC 100
> +
>  #define cls_dev_to_mmc_host(d)	container_of(d, struct mmc_host, class_dev)
>  
>  static DEFINE_IDA(mmc_host_ida);
> @@ -435,6 +439,10 @@ int mmc_add_host(struct mmc_host *host)
>  		return err;
>  
>  	led_trigger_register_simple(dev_name(&host->class_dev), &host->led);
> +	host->clk_scaling.upthreshold = MMC_DEVFRQ_DEFAULT_UP_THRESHOLD;
> +	host->clk_scaling.downthreshold = MMC_DEVFRQ_DEFAULT_DOWN_THRESHOLD;
> +	host->clk_scaling.polling_delay_ms = MMC_DEVFRQ_DEFAULT_POLLING_MSEC;
> +	host->clk_scaling.skip_clk_scale_freq_update = false;
>  
>  #ifdef CONFIG_DEBUG_FS
>  	mmc_add_host_debugfs(host);
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 4466f5d..c8aedf3 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1526,6 +1526,170 @@ static int mmc_hs200_tuning(struct mmc_card *card)
>  }
>  
>  /*
> + * Scale down from HS400 to HS in order to allow frequency change.
> + * This is needed for cards that doesn't support changing frequency in HS400
> + */
> +static int mmc_scale_low(struct mmc_host *host, unsigned long freq)
> +{
> +	int err = 0;
> +
> +	mmc_set_timing(host, MMC_TIMING_LEGACY);
> +	mmc_set_clock(host, MMC_HIGH_26_MAX_DTR);
> +
> +	err = mmc_select_hs(host->card);
> +	if (err) {
> +		pr_err("%s: %s: scaling low: failed (%d)\n",
> +		       mmc_hostname(host), __func__, err);
> +		return err;
> +	}
> +
> +	err = mmc_select_bus_width(host->card);
> +	if (err < 0) {
> +		pr_err("%s: %s: select_bus_width failed(%d)\n",
> +			mmc_hostname(host), __func__, err);
> +		return err;
> +	}
> +
> +	mmc_set_clock(host, freq);
> +
> +	return 0;
> +}
> +
> +/*
> + * Scale UP from HS to HS200/H400
> + */
> +static int mmc_scale_high(struct mmc_host *host)
> +{
> +	int err = 0;
> +
> +	if (mmc_card_ddr52(host->card)) {
> +		mmc_set_timing(host, MMC_TIMING_LEGACY);
> +		mmc_set_clock(host, MMC_HIGH_26_MAX_DTR);
> +	}
> +
> +	if (!host->card->ext_csd.strobe_support) {
> +		if (!(host->card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS200)) {
> +			pr_err("%s: %s: card does not support HS200\n",
> +				mmc_hostname(host), __func__);
> +			WARN_ON(1);
> +			return -EPERM;
> +		}
> +
> +		err = mmc_select_hs200(host->card);
> +		if (err) {
> +			pr_err("%s: %s: selecting HS200 failed (%d)\n",
> +				mmc_hostname(host), __func__, err);
> +			return err;
> +		}
> +
> +		mmc_set_bus_speed(host->card);
> +
> +		err = mmc_hs200_tuning(host->card);
> +		if (err) {
> +			pr_err("%s: %s: hs200 tuning failed (%d)\n",
> +				mmc_hostname(host), __func__, err);
> +			return err;
> +		}
> +
> +		if (!(host->card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400)) {
> +			pr_debug("%s: card does not support HS400\n",
> +				mmc_hostname(host));
> +			return 0;
> +		}
> +	}
> +
> +	err = mmc_select_hs400(host->card);
> +	if (err) {
> +		pr_err("%s: %s: select hs400 failed (%d)\n",
> +			mmc_hostname(host), __func__, err);
> +		return err;
> +	}
> +
> +	return err;
> +}
> +
> +static int mmc_set_clock_bus_speed(struct mmc_card *card, unsigned long freq)
> +{
> +	int err = 0;
> +
> +	if (freq == MMC_HS200_MAX_DTR)
> +		err = mmc_scale_high(card->host);
> +	else
> +		err = mmc_scale_low(card->host, freq);
> +
> +	return err;
> +}
> +
> +static inline unsigned long mmc_ddr_freq_accommodation(unsigned long freq)
> +{
> +	if (freq == MMC_HIGH_DDR_MAX_DTR)
> +		return freq;
> +
> +	return freq/2;
> +}
> +
> +/**
> + * mmc_change_bus_speed() - Change MMC card bus frequency at runtime
> + * @host: pointer to mmc host structure
> + * @freq: pointer to desired frequency to be set
> + *
> + * Change the MMC card bus frequency at runtime after the card is
> + * initialized. Callers are expected to make sure of the card's
> + * state (DATA/RCV/TRANSFER) before changing the frequency at runtime.
> + *
> + * If the frequency to change is greater than max. supported by card,
> + * *freq is changed to max. supported by card. If it is less than min.
> + * supported by host, *freq is changed to min. supported by host.
> + * Host is assumed to be calimed while calling this funciton.
> + */
> +static int mmc_change_bus_speed(struct mmc_host *host, unsigned long *freq)
> +{
> +	int err = 0;
> +	struct mmc_card *card;
> +	unsigned long actual_freq;
> +
> +	card = host->card;
> +
> +	if (!card || !freq) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +	actual_freq = *freq;
> +
> +	WARN_ON(!host->claimed);
> +
> +	/*
> +	 * For scaling up/down HS400 we'll need special handling,
> +	 * for other timings we can simply do clock frequency change
> +	 */
> +	if (mmc_card_hs400(card) ||
> +		(!mmc_card_hs200(host->card) && *freq == MMC_HS200_MAX_DTR)) {
> +		err = mmc_set_clock_bus_speed(card, *freq);
> +		if (err) {
> +			pr_err("%s: %s: failed (%d)to set bus and clock speed (freq=%lu)\n",
> +				mmc_hostname(host), __func__, err, *freq);
> +			goto out;
> +		}
> +	} else if (mmc_card_hs200(host->card)) {
> +		mmc_set_clock(host, *freq);
> +		err = mmc_hs200_tuning(host->card);
> +		if (err) {
> +			pr_warn("%s: %s: tuning execution failed %d\n",
> +				mmc_hostname(card->host),
> +				__func__, err);
> +			mmc_set_clock(host, host->clk_scaling.curr_freq);
> +		}
> +	} else {
> +		if (mmc_card_ddr52(host->card))
> +			actual_freq = mmc_ddr_freq_accommodation(*freq);
> +		mmc_set_clock(host, actual_freq);
> +	}
> +
> +out:
> +	return err;
> +}
> +
> +/*
>   * Handle the detection and initialisation of a card.
>   *
>   * In the case of a resume, "oldcard" will contain the card
> @@ -1751,6 +1915,16 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
>  		}
>  	}
>  
> +	card->clk_scaling_lowest = host->f_min;
> +	if ((card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400) ||
> +			(card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS200))
> +		card->clk_scaling_highest = card->ext_csd.hs200_max_dtr;
> +	else if ((card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS) ||
> +			(card->mmc_avail_type & EXT_CSD_CARD_TYPE_DDR_52))
> +		card->clk_scaling_highest = card->ext_csd.hs_max_dtr;
> +	else
> +		card->clk_scaling_highest = card->csd.max_dtr;
> +
>  	/*
>  	 * Choose the power class with selected bus interface
>  	 */
> @@ -1942,6 +2116,7 @@ static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
>   */
>  static void mmc_remove(struct mmc_host *host)
>  {
> +	mmc_exit_clk_scaling(host);
>  	mmc_remove_card(host->card);
>  	host->card = NULL;
>  }
> @@ -2064,6 +2239,13 @@ static int mmc_shutdown(struct mmc_host *host)
>  	int err = 0;
>  
>  	/*
> +	 * Exit clock scaling so that it doesn't kick in after
> +	 * power off notification is sent
> +	 */
> +	if (host->caps2 & MMC_CAP2_CLK_SCALE)
> +		mmc_exit_clk_scaling(host);
> +
> +	/*
>  	 * In a specific case for poweroff notify, we need to resume the card
>  	 * before we can shutdown it properly.
>  	 */
> @@ -2132,6 +2314,7 @@ static int mmc_can_reset(struct mmc_card *card)
>  static int _mmc_hw_reset(struct mmc_host *host)
>  {
>  	struct mmc_card *card = host->card;
> +	int ret;
>  
>  	/*
>  	 * In the case of recovery, we can't expect flushing the cache to work
> @@ -2151,7 +2334,15 @@ static int _mmc_hw_reset(struct mmc_host *host)
>  		mmc_power_cycle(host, card->ocr);
>  		mmc_pwrseq_reset(host);
>  	}
> -	return mmc_init_card(host, card->ocr, card);
> +
> +	ret = mmc_init_card(host, card->ocr, card);
> +	if (ret) {
> +		pr_err("%s: %s: mmc_init_card failed (%d)\n",
> +			mmc_hostname(host), __func__, ret);
> +		return ret;
> +	}
> +
> +	return ret;
>  }
>  
>  static const struct mmc_bus_ops mmc_ops = {
> @@ -2164,6 +2355,7 @@ static int _mmc_hw_reset(struct mmc_host *host)
>  	.alive = mmc_alive,
>  	.shutdown = mmc_shutdown,
>  	.hw_reset = _mmc_hw_reset,
> +	.change_bus_speed = mmc_change_bus_speed,
>  };
>  
>  /*
> @@ -2220,6 +2412,12 @@ int mmc_attach_mmc(struct mmc_host *host)
>  		goto remove_card;
>  
>  	mmc_claim_host(host);
> +	err = mmc_init_clk_scaling(host);
> +	if (err) {
> +		mmc_release_host(host);
> +		goto remove_card;
> +	}
> +
>  	return 0;
>  
>  remove_card:
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index d0d9f90..40144c1 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -892,7 +892,10 @@ unsigned mmc_sd_get_max_clock(struct mmc_card *card)
>  {
>  	unsigned max_dtr = (unsigned int)-1;
>  
> -	if (mmc_card_hs(card)) {
> +	if (mmc_card_uhs(card)) {
> +		if (max_dtr > card->sw_caps.uhs_max_dtr)
> +			max_dtr = card->sw_caps.uhs_max_dtr;
> +	} else if (mmc_card_hs(card)) {
>  		if (max_dtr > card->sw_caps.hs_max_dtr)
>  			max_dtr = card->sw_caps.hs_max_dtr;
>  	} else if (max_dtr > card->csd.max_dtr) {
> @@ -1059,6 +1062,9 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
>  		}
>  	}
>  
> +	card->clk_scaling_highest = mmc_sd_get_max_clock(card);
> +	card->clk_scaling_lowest = host->f_min;
> +
>  	if (host->caps2 & MMC_CAP2_AVOID_3_3V &&
>  	    host->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330) {
>  		pr_err("%s: Host failed to negotiate down from 3.3V\n",
> @@ -1082,6 +1088,7 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
>   */
>  static void mmc_sd_remove(struct mmc_host *host)
>  {
> +	mmc_exit_clk_scaling(host);
>  	mmc_remove_card(host->card);
>  	host->card = NULL;
>  }
> @@ -1228,6 +1235,62 @@ static int mmc_sd_hw_reset(struct mmc_host *host)
>  	return mmc_sd_init_card(host, host->card->ocr, host->card);
>  }
>  
> +/**
> + * mmc_sd_change_bus_speed() - Change SD card bus frequency at runtime
> + * @host: pointer to mmc host structure
> + * @freq: pointer to desired frequency to be set
> + *
> + * Change the SD card bus frequency at runtime after the card is
> + * initialized. Callers are expected to make sure of the card's
> + * state (DATA/RCV/TRANSFER) beforing changing the frequency at runtime.
> + *
> + * If the frequency to change is greater than max. supported by card,
> + * *freq is changed to max. supported by card and if it is less than min.
> + * supported by host, *freq is changed to min. supported by host.
> + */
> +static int mmc_sd_change_bus_speed(struct mmc_host *host, unsigned long *freq)
> +{
> +	int err = 0;
> +	struct mmc_card *card;
> +
> +	mmc_claim_host(host);
> +	/*
> +	 * Assign card pointer after claiming host to avoid race
> +	 * conditions that may arise during removal of the card.
> +	 */
> +	card = host->card;
> +
> +	/* sanity checks */
> +	if (!card || !freq) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	mmc_set_clock(host, (unsigned int) (*freq));
> +
> +	if (!mmc_host_is_spi(card->host) && mmc_card_uhs(card)
> +			&& card->host->ops->execute_tuning) {
> +		/*
> +		 * We try to probe host driver for tuning for any
> +		 * frequency, it is host driver responsibility to
> +		 * perform actual tuning only when required.
> +		 */
> +		err = card->host->ops->execute_tuning(card->host,
> +				MMC_SEND_TUNING_BLOCK);
> +
> +		if (err) {
> +			pr_warn("%s: %s: tuning execution failed %d. Restoring to previous clock %lu\n",
> +				   mmc_hostname(card->host), __func__, err,
> +				   host->clk_scaling.curr_freq);
> +			mmc_set_clock(host, host->clk_scaling.curr_freq);
> +		}
> +	}
> +
> +out:
> +	mmc_release_host(host);
> +	return err;
> +}
> +
>  static const struct mmc_bus_ops mmc_sd_ops = {
>  	.remove = mmc_sd_remove,
>  	.detect = mmc_sd_detect,
> @@ -1238,6 +1301,7 @@ static int mmc_sd_hw_reset(struct mmc_host *host)
>  	.alive = mmc_sd_alive,
>  	.shutdown = mmc_sd_suspend,
>  	.hw_reset = mmc_sd_hw_reset,
> +	.change_bus_speed = mmc_sd_change_bus_speed,
>  };
>  
>  /*
> @@ -1292,6 +1356,12 @@ int mmc_attach_sd(struct mmc_host *host)
>  		goto remove_card;
>  
>  	mmc_claim_host(host);
> +	err = mmc_init_clk_scaling(host);
> +	if (err) {
> +		mmc_release_host(host);
> +		goto remove_card;
> +	}
> +
>  	return 0;
>  
>  remove_card:
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b5519a5..e9fe8c6 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1705,6 +1705,43 @@ static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
>  
>  MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
>  
> +int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
> +				 u32 **out, int *len, u32 size)
> +{
> +	int ret = 0;
> +	struct device_node *np = dev->of_node;
> +	size_t sz;
> +	u32 *arr = NULL;
> +
> +	if (!of_get_property(np, prop_name, len)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	sz = *len = *len / sizeof(*arr);
> +	if (sz <= 0 || (size > 0 && (sz > size))) {
> +		dev_err(dev, "%s invalid size\n", prop_name);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
> +	if (!arr) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	ret = of_property_read_u32_array(np, prop_name, arr, sz);
> +	if (ret < 0) {
> +		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
> +		goto out;
> +	}
> +	*out = arr;
> +out:
> +	if (ret)
> +		*len = 0;
> +	return ret;
> +}
> +
>  static const struct sdhci_ops sdhci_msm_ops = {
>  	.reset = sdhci_reset,
>  	.set_clock = sdhci_msm_set_clock,
> diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
> index 02bea61..354fc68 100644
> --- a/drivers/mmc/host/sdhci-pltfm.c
> +++ b/drivers/mmc/host/sdhci-pltfm.c
> @@ -36,6 +36,9 @@
>  #endif
>  #include "sdhci-pltfm.h"
>  
> +int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
> +				 u32 **out, int *len, u32 size);
> +
>  unsigned int sdhci_pltfm_clk_get_max_clock(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -101,6 +104,14 @@ void sdhci_get_of_property(struct platform_device *pdev)
>  
>  	of_property_read_u32(np, "clock-frequency", &pltfm_host->clock);
>  
> +	if (sdhci_msm_dt_get_array(&pdev->dev, "qcom,devfreq,freq-table",
> +			&host->mmc->clk_scaling.pltfm_freq_table,
> +			&host->mmc->clk_scaling.pltfm_freq_table_sz, 0))
> +		pr_debug("no clock scaling frequencies were supplied\n");
> +	else if (!host->mmc->clk_scaling.pltfm_freq_table ||
> +			!host->mmc->clk_scaling.pltfm_freq_table_sz)
> +		pr_err("bad dts clock scaling frequencies\n");
> +
>  	if (of_find_property(np, "keep-power-in-suspend", NULL))
>  		host->mmc->pm_caps |= MMC_PM_KEEP_POWER;
>  
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 162b9af..f0aafab 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2427,6 +2427,32 @@ static void sdhci_card_event(struct mmc_host *mmc)
>  	spin_unlock_irqrestore(&host->lock, flags);
>  }
>  
> +static inline void sdhci_update_power_policy(struct sdhci_host *host,
> +		enum sdhci_power_policy policy)
> +{
> +	host->power_policy = policy;
> +}
> +
> +static int sdhci_notify_load(struct mmc_host *mmc, enum mmc_load state)
> +{
> +	int err = 0;
> +	struct sdhci_host *host = mmc_priv(mmc);
> +
> +	switch (state) {
> +	case MMC_LOAD_HIGH:
> +		sdhci_update_power_policy(host, SDHCI_PERFORMANCE_MODE);
> +		break;
> +	case MMC_LOAD_LOW:
> +		sdhci_update_power_policy(host, SDHCI_POWER_SAVE_MODE);
> +		break;
> +	default:
> +		err = -EINVAL;
> +		break;
> +	}
> +
> +	return err;
> +}
> +
>  static const struct mmc_host_ops sdhci_ops = {
>  	.request	= sdhci_request,
>  	.post_req	= sdhci_post_req,
> @@ -2441,6 +2467,7 @@ static void sdhci_card_event(struct mmc_host *mmc)
>  	.execute_tuning			= sdhci_execute_tuning,
>  	.card_event			= sdhci_card_event,
>  	.card_busy	= sdhci_card_busy,
> +	.notify_load = sdhci_notify_load,
>  };
>  
>  /*****************************************************************************\
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 3b0c97a..740471f 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -346,6 +346,12 @@ enum sdhci_cookie {
>  	COOKIE_MAPPED,		/* mapped by sdhci_prepare_data() */
>  };
>  
> +enum sdhci_power_policy {
> +	SDHCI_PERFORMANCE_MODE,
> +	SDHCI_POWER_SAVE_MODE,
> +	SDHCI_POWER_POLICY_NUM /* Always keep this one last */
> +};
> +
>  struct sdhci_host {
>  	/* Data set by hardware interface driver */
>  	const char *hw_name;	/* Hardware bus name */
> @@ -562,6 +568,8 @@ struct sdhci_host {
>  	/* Delay (ms) between tuning commands */
>  	int			tuning_delay;
>  
> +	enum sdhci_power_policy power_policy;
> +
>  	/* Host SDMA buffer boundary. */
>  	u32			sdma_boundary;
>  
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index de73778..c713581 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -245,6 +245,10 @@ struct mmc_card {
>  	struct mmc_host		*host;		/* the host this device belongs to */
>  	struct device		dev;		/* the device */
>  	u32			ocr;		/* the current OCR setting */
> +	unsigned long		clk_scaling_lowest;	/* lowest scaleable*/
> +							/* frequency */
> +	unsigned long		clk_scaling_highest;	/* highest scaleable */
> +
>  	unsigned int		rca;		/* relative card address of device */
>  	unsigned int		type;		/* card type */
>  #define MMC_TYPE_MMC		0		/* MMC card */
> @@ -308,6 +312,7 @@ struct mmc_card {
>  	unsigned int    nr_parts;
>  
>  	unsigned int		bouncesz;	/* Bounce buffer size */
> +	unsigned int		part_curr;
>  };
>  
>  static inline bool mmc_large_sector(struct mmc_card *card)
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 64300a4..321ab39 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -12,6 +12,7 @@
>  
>  #include <linux/sched.h>
>  #include <linux/device.h>
> +#include <linux/devfreq.h>
>  #include <linux/fault-inject.h>
>  
>  #include <linux/mmc/core.h>
> @@ -82,6 +83,12 @@ struct mmc_ios {
>  
>  struct mmc_host;
>  
> +/* states to represent load on the host */
> +enum mmc_load {
> +	MMC_LOAD_HIGH,
> +	MMC_LOAD_LOW,
> +};
> +
>  struct mmc_host_ops {
>  	/*
>  	 * It is optional for the host to implement pre_req and post_req in
> @@ -161,6 +168,7 @@ struct mmc_host_ops {
>  	 */
>  	int	(*multi_io_quirk)(struct mmc_card *card,
>  				  unsigned int direction, int blk_size);
> +	int	(*notify_load)(struct mmc_host *, enum mmc_load);
>  };
>  
>  struct mmc_cqe_ops {
> @@ -260,9 +268,60 @@ struct mmc_ctx {
>  	struct task_struct *task;
>  };
>  
> +/**
> + * struct mmc_devfeq_clk_scaling - main context for MMC clock scaling logic
> + *
> + * @lock: spinlock to protect statistics
> + * @devfreq: struct that represent mmc-host as a client for devfreq
> + * @devfreq_profile: MMC device profile, mostly polling interval and callbacks
> + * @ondemand_gov_data: struct supplied to ondemmand governor (thresholds)
> + * @state: load state, can be HIGH or LOW. used to notify mmc_host_ops callback
> + * @start_busy: timestamped armed once a data request is started
> + * @measure_interval_start: timestamped armed once a measure interval started
> + * @devfreq_abort: flag to sync between different contexts relevant to devfreq
> + * @skip_clk_scale_freq_update: flag that enable/disable frequency change
> + * @freq_table_sz: table size of frequencies supplied to devfreq
> + * @freq_table: frequencies table supplied to devfreq
> + * @curr_freq: current frequency
> + * @polling_delay_ms: polling interval for status collection used by devfreq
> + * @upthreshold: up-threshold supplied to ondemand governor
> + * @downthreshold: down-threshold supplied to ondemand governor
> + * @need_freq_change: flag indicating if a frequency change is required
> + * @clk_scaling_in_progress: flag indicating if there's ongoing frequency change
> + * @is_busy_started: flag indicating if a request is handled by the HW
> + * @enable: flag indicating if the clock scaling logic is enabled for this host
> + */
> +struct mmc_devfeq_clk_scaling {
> +	spinlock_t	lock;
> +	struct		devfreq *devfreq;
> +	struct		devfreq_dev_profile devfreq_profile;
> +	struct		devfreq_simple_ondemand_data ondemand_gov_data;
> +	enum mmc_load	state;
> +	ktime_t		start_busy;
> +	ktime_t		measure_interval_start;
> +	atomic_t	devfreq_abort;
> +	bool		skip_clk_scale_freq_update;
> +	int		freq_table_sz;
> +	int		pltfm_freq_table_sz;
> +	u32		*freq_table;
> +	u32		*pltfm_freq_table;
> +	unsigned long	total_busy_time_us;
> +	unsigned long	target_freq;
> +	unsigned long	curr_freq;
> +	unsigned long	polling_delay_ms;
> +	unsigned int	upthreshold;
> +	unsigned int	downthreshold;
> +	bool		need_freq_change;
> +	bool		clk_scaling_in_progress;
> +	bool		is_busy_started;
> +	bool		enable;
> +};
> +
> +
>  struct mmc_host {
>  	struct device		*parent;
>  	struct device		class_dev;
> +	struct mmc_devfeq_clk_scaling	clk_scaling;
>  	int			index;
>  	const struct mmc_host_ops *ops;
>  	struct mmc_pwrseq	*pwrseq;
> @@ -360,6 +419,7 @@ struct mmc_host {
>  #define MMC_CAP2_CQE		(1 << 23)	/* Has eMMC command queue engine */
>  #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
>  #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
> +#define MMC_CAP2_CLK_SCALE      (1 << 26)       /* Allow dynamic clk scaling */
>  
>  	int			fixed_drv_type;	/* fixed driver type for non-removable media */
>  
> @@ -523,6 +583,16 @@ static inline int mmc_regulator_set_vqmmc(struct mmc_host *mmc,
>  u32 mmc_vddrange_to_ocrmask(int vdd_min, int vdd_max);
>  int mmc_regulator_get_supply(struct mmc_host *mmc);
>  
> +static inline void mmc_host_clear_sdr104(struct mmc_host *host)
> +{
> +	host->caps &= ~MMC_CAP_UHS_SDR104;
> +}
> +
> +static inline void mmc_host_set_sdr104(struct mmc_host *host)
> +{
> +	host->caps |= MMC_CAP_UHS_SDR104;
> +}
> +
>  static inline int mmc_card_is_removable(struct mmc_host *host)
>  {
>  	return !(host->caps & MMC_CAP_NONREMOVABLE);
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
