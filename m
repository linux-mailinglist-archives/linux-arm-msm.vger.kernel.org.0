Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501C63119C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 17:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfEaPwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 11:52:35 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:53560 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfEaPwf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 11:52:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55952341;
        Fri, 31 May 2019 08:52:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE7C53F59C;
        Fri, 31 May 2019 08:52:33 -0700 (PDT)
Subject: Re: [OSSTEST PATCH] ts-kernel-build: Disable CONFIG_ARCH_QCOM in Xen
 Project CI
To:     Ian Jackson <ian.jackson@eu.citrix.com>,
        xen-devel@lists.xenproject.org
Cc:     Stefano Stabellini <sstabellini@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
References: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
 <20190530165123.22593-1-ian.jackson@eu.citrix.com>
From:   Julien Grall <julien.grall@arm.com>
Message-ID: <ffd5f689-085a-34f4-d150-5221783c0083@arm.com>
Date:   Fri, 31 May 2019 16:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530165123.22593-1-ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ian,

On 30/05/2019 17:51, Ian Jackson wrote:
>    drivers/firmware/qcom_scm.c:469:47: error: passing argument 3 of `dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
> 
> This is fixed by
> 
>    firmware: qcom_scm: Use proper types for dma mappings
> 
> but this is not present in all relevant stable branches.
> 
> We currently have no Qualcomm hardware in the Xen Project test lab so
> we do not need this enabled.
> 
> CC: Julien Grall <julien.grall@arm.com
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: linux-arm-msm@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: Stephen Boyd <swboyd@chromium.org>
> CC: Andy Gross <agross@kernel.org>
> CC: Bjorn Andersson <bjorn.andersson@linaro.org>
> CC: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

FWIW:

Acked-by: Julien Grall <julien.grall@arm.com>

> ---
>   ts-kernel-build | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/ts-kernel-build b/ts-kernel-build
> index f7d059b0..5536586f 100755
> --- a/ts-kernel-build
> +++ b/ts-kernel-build
> @@ -274,6 +274,10 @@ setopt CONFIG_MDIO_THUNDER=m
>   setopt CONFIG_I2C_THUNDERX=m
>   setopt CONFIG_SPI_THUNDERX=m
>   
> +# Some Linux branches we care about, including 4.19, still lack
> +# firmware: qcom_scm: Use proper types for dma mappings
> +CONFIG_ARCH_QCOM=n
> +
>   ####
>   
>   END
> 

-- 
Julien Grall
