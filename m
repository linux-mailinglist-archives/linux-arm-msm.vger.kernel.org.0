Return-Path: <linux-arm-msm+bounces-66878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D75CDB13D83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B27DE16A26A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFC526F477;
	Mon, 28 Jul 2025 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCgracz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4043F9FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753713793; cv=none; b=baX+eDgP3A/Zs8Tju2C152zmLpIoOkUGl68d5xP/egKKjMWlVV4WafRf/ALnzL5i/5a/dJMzBJZlRki7GsgQ51bCQtwQRaLJZUqNNL8DXhV6yTjCGa6yrDfan88w5yovbylglHwOq52yi9o0JevAWqeXwabEoYPfXDPbep6ODfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753713793; c=relaxed/simple;
	bh=kPzTmDqWphtU/qdg1ICXp/2n8T7OfZhf28GzogkdcE0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m6NhUhj2jcnbJOshorjOuEF84bV0vxK7a5gjJo7tSD5+1ejLp300qZkBacbdK7NsPq3guMe0pvBSwm5oMnY8XDHOsr46HTYXKYAzyf2u+QhyouPa2Oy95lauCVPK5b6HVAuid0ldQL2cxBgiXcAufOtLnb/7zvfEuywG0+n+EZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCgracz/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so47934285e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753713789; x=1754318589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqYUlRZTzwtS04zGP6tYbDYAXbK12WfQpvfGegVe3To=;
        b=bCgracz/lxXme9h7Kzscp5coxlhhITxaRLYgg21RRabaJHQF0cyMeePbUdqIMsqDVt
         JmfMXvPALxSMICqcPfTdW4rCnu/NYFXI7D0YTqG8cHEykzEL9WimwxpIfqo0YGN1f0F6
         fNUDCh6QMqaLqnwUntwrVN3Bv6srHwdZJvep8HJwXI+3vtnqR9PbnzpX7PKs9GVWvb0R
         uIW8an1dPtjXJ3G5xKULRf6D7QxjXLsApEdxca7leCjTzYIzPraEWswsdnE8hkAbq2mq
         YRWEs9d2uoBzq1DAK5bQBtjYlLkf+keAwTaejBmv9Oh3akI60Opd2pLAj61sXjF8iNKo
         J4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753713789; x=1754318589;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vqYUlRZTzwtS04zGP6tYbDYAXbK12WfQpvfGegVe3To=;
        b=T0DAW/dCCExjUAoZLQ0lQXA7hLtFSiOja8wJLJ2auqRlYyd7OGUkx1skJYKBhvpgGm
         PnYXPbil+FbTxacBMKi/MhQNc0RRu9Cy4OF9T7Rdof7rsU0QjWBAcls9r6Lo72s9JXnT
         aOIBPoq55LfpTjQ3PucYzRsIhrHNQcm8yUXi8YO0LbaTGNVLd0m+79ckvF2bwOZT3Rqm
         t79A7y7QkdUovIqUeWoTs3huZFC8JP3O4JMpqLlQ+oJy/6cbo+fgYudnX+FwjcpZy7vI
         LrTNQi4PUsCiHAp6aqHonpWHkPACCX3Nst8GplhAzAW25YxE5Sdx2cE1EoevoVK3n/Qo
         rrbw==
X-Forwarded-Encrypted: i=1; AJvYcCX5fGJ9su9W/qY/hK0oX92ZvTYJrbzbyPrshTSoqgB0cQ3DeAOTsNTt6A+x2zWN+mDQI6bBov/O/9Cwi5jN@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbkToLwYjy1qpkVowBZUDCKQaecouknWF8iyXkqFEGyDlZFs8
	k2+Xx68xaQkY0PmCcuIpgjPGwvSLZCnQGYUpZFZGb/SnpyNNev6ARkocYE6VFCFfzmQ=
X-Gm-Gg: ASbGncs4MYoEom2Fspj0tmxB1RT8ZSQT0Ut7cPn1M/FQD+6LTrgssOfSZos+uw8MZGa
	dSHSe5RHOnfwhAoptATgApnR76YF7mvpsy0gKOaShgxYxd5aD/Bn/iSjcKaXf5v/9ossxj+xnEq
	8bJl8uFpJzfEsStlDTE+M8YzrebsEQRzDPnDwKrINiAOIaqSIQqPlEtwCbpjxUvQTTeMJ1DC7h0
	kLqKA4KwvsJuKpSq4+PcDMqOQS7BZBC53mTBQmNw1XBdZLmXDRoFdQ6mTo/VA8lnwZDvGHFMtP6
	BJWHnVjxIJETc3w/8IVsf7A7pq5K+cYfGzXngS85r3DsiJp62QU2GnsIm/OkWvwL6qlyIMfDTCb
	eJN+xBoUgf2ZcZzwNA3OhtPGyuchILYI3JE+aIeqsQPugTHdDP5JPkSNzqSu0o2BtYuggoVTofX
	c=
X-Google-Smtp-Source: AGHT+IHHwD+fprpfTZ+Tc8raIMnj4baKXWJzwLinnlIU7pm9jcY7mFmzUJ5J5w2BAaeWzUruK5qVcw==
X-Received: by 2002:a05:600c:83c9:b0:450:d04e:22d6 with SMTP id 5b1f17b1804b1-458762fcb8cmr92605685e9.7.1753713788569;
        Mon, 28 Jul 2025 07:43:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9019:46ec:c6f1:c165? ([2a01:e0a:3d9:2080:9019:46ec:c6f1:c165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abc13besm100033685e9.2.2025.07.28.07.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:43:08 -0700 (PDT)
Message-ID: <a008c613-58d6-4368-ae2f-55db4ac82a02@linaro.org>
Date: Mon, 28 Jul 2025 16:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] scsi: ufs: core: move some irq handling back to
 hardirq (with time limit)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
 <20250725-ufshcd-hardirq-v2-2-884c11e0b0df@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250725-ufshcd-hardirq-v2-2-884c11e0b0df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/07/2025 16:16, André Draszik wrote:
> Commit 3c7ac40d7322 ("scsi: ufs: core: Delegate the interrupt service
> routine to a threaded IRQ handler") introduced a massive performance
> drop for various work loads on UFSHC versions < 4 due to the extra
> latency introduced by moving all of the IRQ handling into a threaded
> handler. See below for a summary.
> 
> To resolve this performance drop, move IRQ handling back into hardirq
> context, but apply a time limit which, once expired, will cause the
> remainder of the work to be deferred to the threaded handler.
> 
> Above commit is trying to avoid unduly delay of other subsystem
> interrupts while the UFS events are being handled. By limiting the
> amount of time spent in hardirq context, we can still ensure that.
> 
> The time limit itself was chosen because I have generally seen
> interrupt handling to have been completed within 20 usecs, with the
> occasional spikes of a couple 100 usecs.
> 
> This commits brings UFS performance roughly back to original
> performance, and should still avoid other subsystem's starvation thanks
> to dealing with these spikes.
> 
> fio results for 4k block size on Pixel 6, all values being the average
> of 5 runs each:
>    read / 1 job      original      after  this commit
>      min IOPS        4,653.60   2,704.40     3,902.80
>      max IOPS        6,151.80   4,847.60     6,103.40
>      avg IOPS        5,488.82   4,226.61     5,314.89
>      cpu % usr           1.85       1.72         1.97
>      cpu % sys          32.46      28.88        33.29
>      bw MB/s            21.46      16.50        20.76
> 
>    read / 8 jobs     original      after  this commit
>      min IOPS       18,207.80  11,323.00    17,911.80
>      max IOPS       25,535.80  14,477.40    24,373.60
>      avg IOPS       22,529.93  13,325.59    21,868.85
>      cpu % usr           1.70       1.41         1.67
>      cpu % sys          27.89      21.85        27.23
>      bw MB/s            88.10      52.10        84.48
> 
>    write / 1 job     original      after  this commit
>      min IOPS        6,524.20   3,136.00     5,988.40
>      max IOPS        7,303.60   5,144.40     7,232.40
>      avg IOPS        7,169.80   4,608.29     7,014.66
>      cpu % usr           2.29       2.34         2.23
>      cpu % sys          41.91      39.34        42.48
>      bw MB/s            28.02      18.00        27.42
> 
>    write / 8 jobs    original      after  this commit
>      min IOPS       12,685.40  13,783.00    12,622.40
>      max IOPS       30,814.20  22,122.00    29,636.00
>      avg IOPS       21,539.04  18,552.63    21,134.65
>      cpu % usr           2.08       1.61         2.07
>      cpu % sys          30.86      23.88        30.64
>      bw MB/s            84.18      72.54        82.62

Thanks for this updated change, I'm running the exact same run on SM8650 to check the impact,
and I'll report something comparable.

Thanks,
Neil

> 
> Closes: https://lore.kernel.org/all/1e06161bf49a3a88c4ea2e7a406815be56114c4f.camel@linaro.org
> Fixes: 3c7ac40d7322 ("scsi: ufs: core: Delegate the interrupt service routine to a threaded IRQ handler")
> Cc: stable@vger.kernel.org
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * update some inline & kerneldoc comments
> * mention 4k block size and 5 runs were used in fio runs
> * add missing jiffies.h include
> ---
>   drivers/ufs/core/ufshcd.c | 191 +++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 154 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index d8e2eabacd3efbf07458e81cc4d15ba7f05d3913..404a4e075a21e73d22ae6bb89f77f69aebb7cd6a 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -19,6 +19,7 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
> +#include <linux/jiffies.h>
>   #include <linux/module.h>
>   #include <linux/pm_opp.h>
>   #include <linux/regulator/consumer.h>
> @@ -111,6 +112,9 @@ enum {
>   /* bMaxNumOfRTT is equal to two after device manufacturing */
>   #define DEFAULT_MAX_NUM_RTT 2
>   
> +/* Time limit in usecs for hardirq context */
> +#define HARDIRQ_TIMELIMIT 20
> +
>   /* UFSHC 4.0 compliant HC support this mode. */
>   static bool use_mcq_mode = true;
>   
> @@ -5603,26 +5607,56 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
>    * __ufshcd_transfer_req_compl - handle SCSI and query command completion
>    * @hba: per adapter instance
>    * @completed_reqs: bitmask that indicates which requests to complete
> + * @time_limit: time limit in jiffies to not exceed executing command completion
> + *
> + * This completes the individual requests as per @completed_reqs with an
> + * optional time limit. If a time limit is given and it expired before all
> + * requests were handled, the return value will indicate which requests have not
> + * been handled.
> + *
> + * Return: Bitmask that indicates which requests have not been completed due to
> + * time limit expiry.
>    */
> -static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
> -					unsigned long completed_reqs)
> +static unsigned long __ufshcd_transfer_req_compl(struct ufs_hba *hba,
> +						 unsigned long completed_reqs,
> +						 unsigned long time_limit)
>   {
>   	int tag;
>   
> -	for_each_set_bit(tag, &completed_reqs, hba->nutrs)
> +	for_each_set_bit(tag, &completed_reqs, hba->nutrs) {
>   		ufshcd_compl_one_cqe(hba, tag, NULL);
> +		__clear_bit(tag, &completed_reqs);
> +		if (time_limit && time_after_eq(jiffies, time_limit))
> +			break;
> +	}
> +
> +	/* any bits still set represent unhandled requests due to timeout */
> +	return completed_reqs;
>   }
>   
> -/*
> - * Return: > 0 if one or more commands have been completed or 0 if no
> - * requests have been completed.
> +/**
> + * ufshcd_poll_impl - handle SCSI and query command completion helper
> + * @shost: Scsi_Host instance
> + * @queue_num: The h/w queue number, or UFSHCD_POLL_FROM_INTERRUPT_CONTEXT when
> + *             invoked from the interrupt handler
> + * @time_limit: time limit in jiffies to not exceed executing command completion
> + * @__pending: Pointer to store any still pending requests in case of time limit
> + *             expiry
> + *
> + * This handles completed commands with an optional time limit. If a time limit
> + * is given and it expires, @__pending will be set to the requests that could
> + * not be completed in time and are still pending.
> + *
> + * Return: true if one or more commands have been completed, false otherwise.
>    */
> -static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
> +static int ufshcd_poll_impl(struct Scsi_Host *shost, unsigned int queue_num,
> +			    unsigned long time_limit, unsigned long *__pending)
>   {
>   	struct ufs_hba *hba = shost_priv(shost);
>   	unsigned long completed_reqs, flags;
>   	u32 tr_doorbell;
>   	struct ufs_hw_queue *hwq;
> +	unsigned long pending = 0;
>   
>   	if (hba->mcq_enabled) {
>   		hwq = &hba->uhq[queue_num];
> @@ -5636,15 +5670,34 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
>   	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
>   		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
>   		  hba->outstanding_reqs);
> -	hba->outstanding_reqs &= ~completed_reqs;
> +
> +	if (completed_reqs) {
> +		pending = __ufshcd_transfer_req_compl(hba, completed_reqs,
> +						      time_limit);
> +		completed_reqs &= ~pending;
> +		hba->outstanding_reqs &= ~completed_reqs;
> +	}
> +
>   	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
>   
> -	if (completed_reqs)
> -		__ufshcd_transfer_req_compl(hba, completed_reqs);
> +	if (__pending)
> +		*__pending = pending;
>   
>   	return completed_reqs != 0;
>   }
>   
> +/*
> + * ufshcd_poll - SCSI interface of blk_poll to poll for IO completions
> + * @shost: Scsi_Host instance
> + * @queue_num: The h/w queue number
> + *
> + * Return: true if one or more commands have been completed, false otherwise.
> + */
> +static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
> +{
> +	return ufshcd_poll_impl(shost, queue_num, 0, NULL);
> +}
> +
>   /**
>    * ufshcd_mcq_compl_pending_transfer - MCQ mode function. It is
>    * invoked from the error handler context or ufshcd_host_reset_and_restore()
> @@ -5698,13 +5751,19 @@ static void ufshcd_mcq_compl_pending_transfer(struct ufs_hba *hba,
>   /**
>    * ufshcd_transfer_req_compl - handle SCSI and query command completion
>    * @hba: per adapter instance
> + * @time_limit: time limit in jiffies to not exceed executing command completion
>    *
>    * Return:
> - *  IRQ_HANDLED - If interrupt is valid
> - *  IRQ_NONE    - If invalid interrupt
> + *  IRQ_HANDLED     - If interrupt is valid
> + *  IRQ_WAKE_THREAD - If further interrupt processing should be delegated to the
> + *                    thread
> + *  IRQ_NONE        - If invalid interrupt
>    */
> -static irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
> +static irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba,
> +					     unsigned long time_limit)
>   {
> +	unsigned long pending;
> +
>   	/* Resetting interrupt aggregation counters first and reading the
>   	 * DOOR_BELL afterward allows us to handle all the completed requests.
>   	 * In order to prevent other interrupts starvation the DB is read once
> @@ -5720,12 +5779,18 @@ static irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
>   		return IRQ_HANDLED;
>   
>   	/*
> -	 * Ignore the ufshcd_poll() return value and return IRQ_HANDLED since we
> -	 * do not want polling to trigger spurious interrupt complaints.
> +	 * Ignore the ufshcd_poll() return value and return IRQ_HANDLED or
> +	 * IRQ_WAKE_THREAD since we do not want polling to trigger spurious
> +	 * interrupt complaints.
>   	 */
> -	ufshcd_poll(hba->host, 0);
> +	ufshcd_poll_impl(hba->host, 0, time_limit, &pending);
>   
> -	return IRQ_HANDLED;
> +	/*
> +	 * If a time limit was set, some request completions might not have been
> +	 * handled yet and will need to be dealt with in the threaded interrupt
> +	 * handler.
> +	 */
> +	return pending ? IRQ_WAKE_THREAD : IRQ_HANDLED;
>   }
>   
>   int __ufshcd_write_ee_control(struct ufs_hba *hba, u32 ee_ctrl_mask)
> @@ -6286,7 +6351,7 @@ static void ufshcd_complete_requests(struct ufs_hba *hba, bool force_compl)
>   	if (hba->mcq_enabled)
>   		ufshcd_mcq_compl_pending_transfer(hba, force_compl);
>   	else
> -		ufshcd_transfer_req_compl(hba);
> +		ufshcd_transfer_req_compl(hba, 0);
>   
>   	ufshcd_tmc_handler(hba);
>   }
> @@ -6988,12 +7053,16 @@ static irqreturn_t ufshcd_handle_mcq_cq_events(struct ufs_hba *hba)
>    * ufshcd_sl_intr - Interrupt service routine
>    * @hba: per adapter instance
>    * @intr_status: contains interrupts generated by the controller
> + * @time_limit: time limit in jiffies to not exceed executing command completion
>    *
>    * Return:
> - *  IRQ_HANDLED - If interrupt is valid
> - *  IRQ_NONE    - If invalid interrupt
> + *  IRQ_HANDLED     - If interrupt is valid
> + *  IRQ_WAKE_THREAD - If further interrupt processing should be delegated to the
> + *                    thread
> + *  IRQ_NONE        - If invalid interrupt
>    */
> -static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
> +static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status,
> +				  unsigned long time_limit)
>   {
>   	irqreturn_t retval = IRQ_NONE;
>   
> @@ -7007,7 +7076,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>   		retval |= ufshcd_tmc_handler(hba);
>   
>   	if (intr_status & UTP_TRANSFER_REQ_COMPL)
> -		retval |= ufshcd_transfer_req_compl(hba);
> +		retval |= ufshcd_transfer_req_compl(hba, time_limit);
>   
>   	if (intr_status & MCQ_CQ_EVENT_STATUS)
>   		retval |= ufshcd_handle_mcq_cq_events(hba);
> @@ -7016,15 +7085,25 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>   }
>   
>   /**
> - * ufshcd_threaded_intr - Threaded interrupt service routine
> + * ufshcd_intr_helper - hardirq and threaded interrupt service routine
>    * @irq: irq number
>    * @__hba: pointer to adapter instance
> + * @time_limit: time limit in jiffies to not exceed during execution
> + *
> + * Interrupts are initially served from hardirq context with a time limit, but
> + * if there is more work to be done than can be completed before the limit
> + * expires, remaining work is delegated to the IRQ thread. This helper does the
> + * bulk of the work in either case - if @time_limit is set, it is being run from
> + * hardirq context, otherwise from the threaded interrupt handler.
>    *
>    * Return:
> - *  IRQ_HANDLED - If interrupt is valid
> - *  IRQ_NONE    - If invalid interrupt
> + *  IRQ_HANDLED     - If interrupt was fully handled
> + *  IRQ_WAKE_THREAD - If further interrupt processing should be delegated to the
> + *                    thread
> + *  IRQ_NONE        - If invalid interrupt
>    */
> -static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
> +static irqreturn_t ufshcd_intr_helper(int irq, void *__hba,
> +				      unsigned long time_limit)
>   {
>   	u32 last_intr_status, intr_status, enabled_intr_status = 0;
>   	irqreturn_t retval = IRQ_NONE;
> @@ -7038,15 +7117,22 @@ static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
>   	 * if the reqs get finished 1 by 1 after the interrupt status is
>   	 * read, make sure we handle them by checking the interrupt status
>   	 * again in a loop until we process all of the reqs before returning.
> +	 * This is done until the time limit is exceeded, at which point further
> +	 * processing is delegated to the threaded handler.
>   	 */
> -	while (intr_status && retries--) {
> +	while (intr_status && !(retval & IRQ_WAKE_THREAD) && retries--) {
>   		enabled_intr_status =
>   			intr_status & ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
>   		ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
>   		if (enabled_intr_status)
> -			retval |= ufshcd_sl_intr(hba, enabled_intr_status);
> +			retval |= ufshcd_sl_intr(hba, enabled_intr_status,
> +						 time_limit);
>   
>   		intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
> +
> +		if (intr_status && time_limit && time_after_eq(jiffies,
> +							       time_limit))
> +			retval |= IRQ_WAKE_THREAD;
>   	}
>   
>   	if (enabled_intr_status && retval == IRQ_NONE &&
> @@ -7063,6 +7149,20 @@ static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
>   	return retval;
>   }
>   
> +/**
> + * ufshcd_threaded_intr - Threaded interrupt service routine
> + * @irq: irq number
> + * @__hba: pointer to adapter instance
> + *
> + * Return:
> + *  IRQ_HANDLED - If interrupt was fully handled
> + *  IRQ_NONE    - If invalid interrupt
> + */
> +static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
> +{
> +	return ufshcd_intr_helper(irq, __hba, 0);
> +}
> +
>   /**
>    * ufshcd_intr - Main interrupt service routine
>    * @irq: irq number
> @@ -7070,20 +7170,37 @@ static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
>    *
>    * Return:
>    *  IRQ_HANDLED     - If interrupt is valid
> - *  IRQ_WAKE_THREAD - If handling is moved to threaded handled
> + *  IRQ_WAKE_THREAD - If handling is moved to threaded handler
>    *  IRQ_NONE        - If invalid interrupt
>    */
>   static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   {
>   	struct ufs_hba *hba = __hba;
> +	unsigned long time_limit = jiffies +
> +		usecs_to_jiffies(HARDIRQ_TIMELIMIT);
>   
> -	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
> -	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
> -		return IRQ_WAKE_THREAD;
> +	/*
> +	 * Directly handle interrupts when MCQ & ESI are enabled since MCQ
> +	 * ESI handlers do the hard job.
> +	 */
> +	if (hba->mcq_enabled && hba->mcq_esi_enabled)
> +		return ufshcd_sl_intr(hba,
> +				      ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
> +				      ufshcd_readl(hba, REG_INTERRUPT_ENABLE),
> +				      0);
>   
> -	/* Directly handle interrupts since MCQ ESI handlers does the hard job */
> -	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
> -				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
> +	/*
> +	 * Otherwise handle interrupt in hardirq context until the time limit
> +	 * expires, at which point the remaining work will be completed in
> +	 * interrupt thread context.
> +	 */
> +	if (!time_limit)
> +		/*
> +		 * To deal with jiffies wrapping, we just add one so that other
> +		 * code can reliably detect if a time limit was requested.
> +		 */
> +		time_limit++;
> +	return ufshcd_intr_helper(irq, __hba, time_limit);
>   }
>   
>   static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
> @@ -7516,7 +7633,7 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
>   				__func__, pos);
>   		}
>   	}
> -	__ufshcd_transfer_req_compl(hba, pending_reqs & ~not_cleared_mask);
> +	__ufshcd_transfer_req_compl(hba, pending_reqs & ~not_cleared_mask, 0);
>   
>   out:
>   	hba->req_abort_count = 0;
> @@ -7672,7 +7789,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>   		dev_err(hba->dev,
>   		"%s: cmd was completed, but without a notifying intr, tag = %d",
>   		__func__, tag);
> -		__ufshcd_transfer_req_compl(hba, 1UL << tag);
> +		__ufshcd_transfer_req_compl(hba, 1UL << tag, 0);
>   		goto release;
>   	}
>   
> 


