Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61FFB6A6CCC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 14:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCAND5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 08:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjCANDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 08:03:44 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E763298E0;
        Wed,  1 Mar 2023 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677675816; x=1709211816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hHlTjwTkChkzVi/DkEFFqsmPHUTsXsCM4ky8Wc3ELrI=;
  b=ILgYx2+RXLO6m8/cnKog0BoDNvJClZjIFONaOfL3v/mnet3qQXx4rLGX
   9RT/Th7p+37BQqxQnq5sP4katvBcgKT4XUazt4HZStlwsZL8npIOeeMqu
   YXlLjpRwZlU3+Rwwt1f9zaLFs+76yZ1XJgq7pdbcCaLU5z39qvee7K8zx
   AYDNCIe3oU5/J/4DiXbkSSghOyF1Ooy79ub4alQ9+cxFmLKYMhxCX6FIP
   BJW+5tQkot+todOYHbrlSnJ6EFMShn2evHOJa/BCNJH7ICgHh812VuN8F
   HR3gIcmFMKBBb9LV6gGxCFAQf7iob5Zmro2fSp0dWsfGFriGk/YjHQceY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="361982459"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="361982459"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 05:03:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="667861447"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="667861447"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 05:03:30 -0800
Date:   Wed, 1 Mar 2023 14:03:28 +0100
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, jacek.lawrynowicz@linux.intel.com,
        quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
        quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 8/8] MAINTAINERS: Add entry for QAIC driver
Message-ID: <20230301130328.GB3815307@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-9-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675698105-19025-9-git-send-email-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 06, 2023 at 08:41:45AM -0700, Jeffrey Hugo wrote:
> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 263d37a..0a264f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17170,6 +17170,14 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
>  F:	drivers/clk/qcom/
>  F:	include/dt-bindings/clock/qcom,*
>  
> +QUALCOMM CLOUD AI (QAIC) DRIVER
> +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> +L:	linux-arm-msm@vger.kernel.org

Is this correct mailing list ? Should not be dri-devel ? 

Regards
Stanislaw
