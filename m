Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF6A10EB63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 15:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLBONb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 09:13:31 -0500
Received: from mga11.intel.com ([192.55.52.93]:20950 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727362AbfLBONa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 09:13:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Dec 2019 06:13:30 -0800
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; 
   d="scan'208";a="204572503"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Dec 2019 06:13:26 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Chandan Uddaraju <chandanu@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org
Cc:     abhinavk@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [DPU PATCH v3 2/5] drm: add constant N value in helper file
In-Reply-To: <0101016ec6ddf2ce-8548e076-2347-49be-a9be-4d81a14ad8f7-000000@us-west-2.amazonses.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org> <0101016ec6ddf2ce-8548e076-2347-49be-a9be-4d81a14ad8f7-000000@us-west-2.amazonses.com>
Date:   Mon, 02 Dec 2019 16:13:24 +0200
Message-ID: <87tv6ike7v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 02 Dec 2019, Chandan Uddaraju <chandanu@codeaurora.org> wrote:
> The constant N value (0x8000) is used by multiple DP
> drivers. Define this value in header file and use this
> in the existing i915 display driver.
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and ack for merging via drm-misc or whichever tree you find suitable.


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>  include/drm/drm_dp_helper.h                  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index ce05e80..1a4ccfd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7496,7 +7496,7 @@ static void compute_m_n(unsigned int m, unsigned int n,
>  	 * which the devices expect also in synchronous clock mode.
>  	 */
>  	if (constant_n)
> -		*ret_n = 0x8000;
> +		*ret_n = DP_LINK_CONSTANT_N_VALUE;
>  	else
>  		*ret_n = min_t(unsigned int, roundup_pow_of_two(n), DATA_LINK_N_MAX);
>  
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8364502..69b8251 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1357,6 +1357,7 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>   * DisplayPort link
>   */
>  #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
> +#define DP_LINK_CONSTANT_N_VALUE 0x8000
>  
>  struct drm_dp_link {
>  	unsigned char revision;

-- 
Jani Nikula, Intel Open Source Graphics Center
