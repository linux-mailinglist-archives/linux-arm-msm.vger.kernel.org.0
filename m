Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DE23F7DA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 23:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhHYVYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 17:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhHYVYg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 17:24:36 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F40C061757;
        Wed, 25 Aug 2021 14:23:49 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F155E1FEF7;
        Wed, 25 Aug 2021 23:23:47 +0200 (CEST)
Subject: Re: [PATCH v2] clk: qcom: gcc-sdm660: Replace usage of parent_names
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
References: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <f46e9c0a-970b-9391-66d4-70cf514fd93b@somainline.org>
Date:   Wed, 25 Aug 2021 23:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 8/25/21 10:45 PM, Bjorn Andersson wrote:
> Using parent_data and parent_hws, instead of parent_names, does protect
> against some cases of incompletely defined clock trees. While it turns
> out that the bug being chased this time was totally unrelated, this
> patch converts the SDM660 GCC driver to avoid such issues.
> 
> The "xo" fixed_factor clock is unused within the gcc driver, but
> referenced from the DSI PHY. So it's left in place until the DSI driver
> is updated.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Added "xo" back to avoid regression in the DSI PHY


Tested again on the XA2 Ultra just to be sure, all is good now. Thanks!

- Marijn
