Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64236257B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 16:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgHaOPe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 10:15:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:49705 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgHaOP3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 10:15:29 -0400
IronPort-SDR: wpvc6XIWW4JxprpMeUgxW4LbsI1aR2CA/vgaEHXx6P2O6JjKGIJyr/foLgxfReygSSlMgeDtte
 Fx7sge4ut78w==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="218521023"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="218521023"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 07:15:27 -0700
IronPort-SDR: PHl/gAhoCZLGvQ8+jRfi1Aj7+9i3q7M8IlbUE6c6MGOsXf8YdgSSQS8VT8xlUL2vnRKbTQDnCE
 n5nxMA683F+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="281656222"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2020 07:15:22 -0700
Subject: Re: [PATCH] mmc: sdhci-msm: Add retries when all tuning phases are
 found valid
To:     Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     vbadigan@codeaurora.org, Andy Gross <agross@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chris Ball <chris@printf.net>,
        Georgi Djakov <gdjakov@mm-sol.com>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20200827075809.1.If179abf5ecb67c963494db79c3bc4247d987419b@changeid>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <a3d42c1a-1ff3-29d9-9094-a41d37721ba5@intel.com>
Date:   Mon, 31 Aug 2020 17:14:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827075809.1.If179abf5ecb67c963494db79c3bc4247d987419b@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/08/20 5:58 pm, Douglas Anderson wrote:
> As the comments in this patch say, if we tune and find all phases are
> valid it's _almost_ as bad as no phases being found valid.  Probably
> all phases are not really reliable but we didn't detect where the
> unreliable place is.  That means we'll essentially be guessing and
> hoping we get a good phase.
> 
> This is not just a problem in theory.  It was causing real problems on
> a real board.  On that board, most often phase 10 is found as the only
> invalid phase, though sometimes 10 and 11 are invalid and sometimes
> just 11.  Some percentage of the time, however, all phases are found
> to be valid.  When this happens, the current logic will decide to use
> phase 11.  Since phase 11 is sometimes found to be invalid, this is a
> bad choice.  Sure enough, when phase 11 is picked we often get mmc
> errors later in boot.
> 
> I have seen cases where all phases were found to be valid 3 times in a
> row, so increase the retry count to 10 just to be extra sure.
> 
> Fixes: 415b5a75da43 ("mmc: sdhci-msm: Add platform_execute_tuning implementation")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> 
>  drivers/mmc/host/sdhci-msm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b7e47107a31a..1b78106681e0 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1165,7 +1165,7 @@ static void sdhci_msm_set_cdr(struct sdhci_host *host, bool enable)
>  static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  {
>  	struct sdhci_host *host = mmc_priv(mmc);
> -	int tuning_seq_cnt = 3;
> +	int tuning_seq_cnt = 10;
>  	u8 phase, tuned_phases[16], tuned_phase_cnt = 0;
>  	int rc;
>  	struct mmc_ios ios = host->mmc->ios;
> @@ -1221,6 +1221,22 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	} while (++phase < ARRAY_SIZE(tuned_phases));
>  
>  	if (tuned_phase_cnt) {
> +		if (tuned_phase_cnt == ARRAY_SIZE(tuned_phases)) {
> +			/*
> +			 * All phases valid is _almost_ as bad as no phases
> +			 * valid.  Probably all phases are not really reliable
> +			 * but we didn't detect where the unreliable place is.
> +			 * That means we'll essentially be guessing and hoping
> +			 * we get a good phase.  Better to try a few times.
> +			 */
> +			dev_dbg(mmc_dev(mmc), "%s: All phases valid; try again\n",
> +				mmc_hostname(mmc));
> +			if (--tuning_seq_cnt) {
> +				tuned_phase_cnt = 0;
> +				goto retry;
> +			}
> +		}
> +
>  		rc = msm_find_most_appropriate_phase(host, tuned_phases,
>  						     tuned_phase_cnt);
>  		if (rc < 0)
> 

