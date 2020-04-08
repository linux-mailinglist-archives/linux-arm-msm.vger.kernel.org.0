Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 250321A1F94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 13:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgDHLL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 07:11:28 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:58243 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728212AbgDHLL2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 07:11:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586344287; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=s31QthLf6r+zfbdeoTdO3eyLBgdOQ87W4bOKtHkgFYk=; b=xM/g7nanPpE/l6kJUdDNophTDD8r4CN21+YPeUT8LewFUePx1neTY9vjL90GKlMfvEWRqsWc
 +KoLj+hrMjdhK1j6d4/yRZKPgkvEv4G+sdE8GWrUMw52AJmXn4T9cLZe3eKTweJpVYuzVQQD
 qCMijRSZfJvXgs/Vf3u7Qgq/OS4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8db155.7f70bdcad7a0-smtp-out-n04;
 Wed, 08 Apr 2020 11:11:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9235C43636; Wed,  8 Apr 2020 11:11:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E99F4C433D2;
        Wed,  8 Apr 2020 11:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E99F4C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 05/10] drivers: qcom: rpmh-rsc: Kill cmd_cache and
 find_match() with fire
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.5.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <c7bf0ecb-414c-bb6e-1bc3-1d2430249b54@codeaurora.org>
Date:   Wed, 8 Apr 2020 16:41:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407164915.v3.5.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 4/8/2020 5:20 AM, Douglas Anderson wrote:
> The "cmd_cache" in RPMH wasn't terribly sensible.  Specifically:
>
> - The current code doesn't realy detect "conflicts" properly any case
>    where the sequence being checked has more than one entry.  One
>    simple way to see this in the current code is that if cmd[0].addr
>    isn't found that cmd[1].addr is never checked.
> - The code attempted to use the "cmd_cache" to update an existing
>    message in a sleep/wake TCS with new data.  The goal appeared to be
>    to update part of a TCS while leaving the rest of the TCS alone.  We
>    never actually do this.  We always fully invalidate and re-write
>    everything.
> - If/when we try to optimize things to not fully invalidate / re-write
>    every time we update the TCSes we'll need to think it through very
>    carefully.  Specifically requirement of find_match() that the new
>    sequence of addrs must match exactly the old sequence of addrs seems
>    inflexible.  It's also not documented in rpmh_write() and
>    rpmh_write_batch().  In any case, if we do decide to require updates
>    to keep the exact same sequence and length then presumably the API
>    and data structures should be updated to understand groups more
>    properly.  The current algorithm doesn't really keep track of the
>    length of the old sequence and there are several boundary-condition
>    bugs because of that.  Said another way: if we decide to do
>    something like this in the future we should start from scratch and
>    thus find_match() isn't useful to keep around.
>
> This patch isn't quite a no-op.  Specifically:
>
> - It should be a slight performance boost of not searching through so
>    many arrays.
> - The old code would have done something useful in one case: it would
>    allow someone calling rpmh_write() to override the data that came
>    from rpmh_write_batch().  I don't believe that actually happens in
>    reality.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Kill find_match moves from patch #9 to patch #5 (Maulik).
> - Rewrote commit message to adjust for patch order.
>
> Changes in v2:
> - Got rid of useless "if (x) continue" at end of for loop.
>
>   drivers/soc/qcom/rpmh-internal.h |  2 --
>   drivers/soc/qcom/rpmh-rsc.c      | 47 --------------------------------
>   2 files changed, 49 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
> index e9a90cb7773e..6a6d776ccca9 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> @@ -30,7 +30,6 @@ struct rsc_drv;
>    * @ncpt:      number of commands in each TCS
>    * @lock:      lock for synchronizing this TCS writes
>    * @req:       requests that are sent from the TCS
> - * @cmd_cache: flattened cache of cmds in sleep/wake TCS
>    * @slots:     indicates which of @cmd_addr are occupied
>    */
>   struct tcs_group {
> @@ -42,7 +41,6 @@ struct tcs_group {
>   	int ncpt;
>   	spinlock_t lock;
>   	const struct tcs_request *req[MAX_TCS_PER_TYPE];
> -	u32 *cmd_cache;
>   	DECLARE_BITMAP(slots, MAX_TCS_SLOTS);
>   };
>   
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 855a1dab7718..da1045c92b38 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -522,42 +522,12 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   	return ret;
>   }
>   
> -static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
> -		      int len)
> -{
> -	int i, j;
> -
> -	/* Check for already cached commands */
> -	for_each_set_bit(i, tcs->slots, MAX_TCS_SLOTS) {
> -		if (tcs->cmd_cache[i] != cmd[0].addr)
> -			continue;
> -		if (i + len >= tcs->num_tcs * tcs->ncpt)
> -			goto seq_err;
> -		for (j = 0; j < len; j++) {
> -			if (tcs->cmd_cache[i + j] != cmd[j].addr)
> -				goto seq_err;
> -		}
> -		return i;
> -	}
> -
> -	return -ENODATA;
> -
> -seq_err:
> -	WARN(1, "Message does not match previous sequence.\n");
> -	return -EINVAL;
> -}
> -
>   static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   		      int *tcs_id, int *cmd_id)
>   {
>   	int slot, offset;
>   	int i = 0;
>   
> -	/* Find if we already have the msg in our TCS */
> -	slot = find_match(tcs, msg->cmds, msg->num_cmds);
> -	if (slot >= 0)
> -		goto copy_data;
> -
>   	/* Do over, until we can fit the full payload in a TCS */
>   	do {
>   		slot = bitmap_find_next_zero_area(tcs->slots, MAX_TCS_SLOTS,
> @@ -567,11 +537,7 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   		i += tcs->ncpt;
>   	} while (slot + msg->num_cmds - 1 >= i);
>   
> -copy_data:
>   	bitmap_set(tcs->slots, slot, msg->num_cmds);
> -	/* Copy the addresses of the resources over to the slots */
> -	for (i = 0; i < msg->num_cmds; i++)
> -		tcs->cmd_cache[slot + i] = msg->cmds[i].addr;
>   
>   	offset = slot / tcs->ncpt;
>   	*tcs_id = offset + tcs->offset;
> @@ -763,19 +729,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
>   		tcs->mask = ((1 << tcs->num_tcs) - 1) << st;
>   		tcs->offset = st;
>   		st += tcs->num_tcs;
> -
> -		/*
> -		 * Allocate memory to cache sleep and wake requests to
> -		 * avoid reading TCS register memory.
> -		 */
> -		if (tcs->type == ACTIVE_TCS)
> -			continue;
> -
> -		tcs->cmd_cache = devm_kcalloc(&pdev->dev,
> -					      tcs->num_tcs * ncpt, sizeof(u32),
> -					      GFP_KERNEL);
> -		if (!tcs->cmd_cache)
> -			return -ENOMEM;
>   	}
>   
>   	drv->num_tcs = st;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
