Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12026B8F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 10:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjCNJ7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 05:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjCNJ7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 05:59:32 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982EF20078;
        Tue, 14 Mar 2023 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678787971; x=1710323971;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vsj9T9Br4xjmd7W1//zB56r/FVJi0Idwj1ldmitXAZs=;
  b=TgJowHUKzlMcPoUTM5yBGv50F2mXqUYXebgWRUKJCa+s4zAE2Cj48do0
   OABjrp8xvZBh/Wn9neqDKo3TY+6GWIuOmOd5cYrPO8nr6uZ5z3ZkKJyGG
   ieFWOSYQavvTdtgBeIWVJ675AS4gl2F7a8oj4Cc3c5dwyIYgneCqNFInW
   TyuxV31drpopoHLzGo3ZbhWHyUeEf2VnMPfA9p5EMbGuVFywe7RaTZE6b
   1rwlmYbhn1OnOy7ZApXQsU21TwN4mhx+n69Gu/oYJrb2DyIm3E8vSG8JT
   wzz2HKhiYkHcuKb60JmN835vnNr0d6oiORyLmylCZ4tksy7WjWUs5Zf/z
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="336073495"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="336073495"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 02:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747941254"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="747941254"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.237.142.115]) ([10.237.142.115])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 02:59:28 -0700
Message-ID: <5e912413-eee4-5b25-5f6d-00ccc7501b9d@linux.intel.com>
Date:   Tue, 14 Mar 2023 10:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, dafna@fastmail.com,
        ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        stanislaw.gruszka@linux.intel.com, dri-devel@lists.freedesktop.org
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
From:   Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On 06.03.2023 22:34, Jeffrey Hugo wrote:
> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b0db911..feb2974 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17253,6 +17253,15 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
>  F:	drivers/clk/qcom/
>  F:	include/dt-bindings/clock/qcom,*
>  
> +QUALCOMM CLOUD AI (QAIC) DRIVER
> +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/accel/qaic/
> +F:	drivers/accel/qaic/
> +F:	include/uapi/drm/qaic_accel.h

Aren't you missing repo link?
T:	git git://anongit.freedesktop.org/drm/drm-misc

> +
>  QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
>  M:	Bjorn Andersson <andersson@kernel.org>
>  M:	Konrad Dybcio <konrad.dybcio@linaro.org>

Regards,
Jacek
