Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB04D27FE1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 13:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbgJALI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 07:08:57 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:22554 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731134AbgJALI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 07:08:57 -0400
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j/IcvFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.1.9 DYNA|AUTH)
        with ESMTPSA id z04ddcw91B2u63q
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 1 Oct 2020 13:02:56 +0200 (CEST)
Date:   Thu, 1 Oct 2020 13:02:49 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, shawn.guo@linaro.org
Subject: Re: [PATCH v3 0/2] Add MSM8939 RPM power domains
Message-ID: <20201001110249.GA1592@gerhold.net>
References: <20200930100145.9457-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930100145.9457-1-jun.nie@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 30, 2020 at 06:01:43PM +0800, Jun Nie wrote:
> Add MSM8939 RPM power domains and associated document. This is based on
> Stephan's patch set to reuse max state definition:
> https://lore.kernel.org/linux-arm-msm/20200916104135.25085-1-stephan@gerhold.net/
> 
> Changes vs v2:
>  - fix max power domain state value.
>  - trim code layout.
> 
> Jun Nie (2):
>   dt-bindings: power: rpmpd: Add MSM8939 RPM power domains
>   soc: qcom: rpmpd: Add MSM8939 power-domains
> 
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 27 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        | 10 +++++++
>  3 files changed, 38 insertions(+)
> 
> -- 
> 2.17.1
> 

Thanks for making the changes! I don't know much about MSM8939 but from
what I know this looks good to me. FWIW, for both patches:

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
