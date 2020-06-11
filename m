Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD091F64AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 11:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgFKJ0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 05:26:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:43082 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbgFKJ0C (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 05:26:02 -0400
IronPort-SDR: inFvZ5camFibgkFOLD91fdDC69QWLHXGEVVbR5eMNoHdxEye3kkln8hjyZVsISUQjig6tx+Adp
 Plxyy6fjP5XA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 02:26:01 -0700
IronPort-SDR: GPQzoh9Bx+RX+Tk1e1fWY7vAqHvvL6Vq+NjhyiNCj6ZIYNqwYaoN9QIW4YBXJ9HM4rjEvW7NKE
 rWf9khWxisEw==
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; 
   d="scan'208";a="447857473"
Received: from cstenzel-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.45.107])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 02:25:57 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     sam@ravnborg.org, abhinavk@codeaurora.org, swboyd@chromium.org,
        seanpaul@chromium.org, Tanmay Shah <tanmay@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
        chandanu@codeaurora.org
Subject: Re: [PATCH v6 2/5] drm: add constant N value in helper file
In-Reply-To: <20200609034047.9407-1-tanmay@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200609034047.9407-1-tanmay@codeaurora.org>
Date:   Thu, 11 Jun 2020 12:25:54 +0300
Message-ID: <87mu5avtr1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 08 Jun 2020, Tanmay Shah <tanmay@codeaurora.org> wrote:
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>
> The constant N value (0x8000) is used by i915 DP
> driver. Define this value in dp helper header file
> to use in multiple Display Port drivers. Change
> i915 driver accordingly.
>
> Change in v6: Change commit message
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via drm-misc if that helps you.


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>  include/drm/drm_dp_helper.h                  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9ea1a39..4b2cfff 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8085,7 +8085,7 @@ static void compute_m_n(unsigned int m, unsigned int n,
>  	 * which the devices expect also in synchronous clock mode.
>  	 */
>  	if (constant_n)
> -		*ret_n = 0x8000;
> +		*ret_n = DP_LINK_CONSTANT_N_VALUE;
>  	else
>  		*ret_n = min_t(unsigned int, roundup_pow_of_two(n), DATA_LINK_N_MAX);
>  
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 2035ac4..589132a 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1134,6 +1134,7 @@
>  #define DP_MST_PHYSICAL_PORT_0 0
>  #define DP_MST_LOGICAL_PORT_0 8
>  
> +#define DP_LINK_CONSTANT_N_VALUE 0x8000
>  #define DP_LINK_STATUS_SIZE	   6
>  bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
>  			  int lane_count);

-- 
Jani Nikula, Intel Open Source Graphics Center
