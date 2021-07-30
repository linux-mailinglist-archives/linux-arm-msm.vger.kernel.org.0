Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC8E3DBF5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 22:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhG3UIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 16:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhG3UIN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 16:08:13 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980FFC061765;
        Fri, 30 Jul 2021 13:08:08 -0700 (PDT)
Received: from [192.168.1.59] (bband-dyn19.178-41-181.t-com.sk [178.41.181.19])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 47A203EC89;
        Fri, 30 Jul 2021 22:08:05 +0200 (CEST)
Date:   Fri, 30 Jul 2021 22:07:59 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [RESEND PATCH v2 1/3] rpmcc: Add sm6125 compatible
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka1@gmail.com, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <BLQ2XQ.V1BS3HGQ1PW43@somainline.org>
In-Reply-To: <162742246483.2368309.10033568257822595295@swboyd.mtv.corp.google.com>
References: <20210629102624.194378-1-martin.botka@somainline.org>
        <20210629102624.194378-2-martin.botka@somainline.org>
        <162742246483.2368309.10033568257822595295@swboyd.mtv.corp.google.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On Tue, Jul 27 2021 at 02:47:44 PM -0700, Stephen Boyd 
<sboyd@kernel.org> wrote:
> Quoting Martin Botka (2021-06-29 03:26:21)
>>  Add a compatible for SM6125 and assing correct data
>> 
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  ---
> 
> This patch needs to be combined with the one that introduces
> rpm_clk_sm6125.
> 
>>  +       { .compatible = "qcom,rpmcc-sm6125",  .data = 
>> &rpm_clk_sm6125  },
>>  diff --git a/drivers/clk/qcom/clk-smd-rpm.c 
>> b/drivers/clk/qcom/clk-smd-rpm.c
>>  index 0e1dfa89489e..8200c26b968c 100644
>>  --- a/drivers/clk/qcom/clk-smd-rpm.c
>>  +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>  @@ -1070,6 +1070,7 @@ static const struct of_device_id 
>> rpm_smd_clk_match_table[] = {
>>          { .compatible = "qcom,rpmcc-msm8998", .data = 
>> &rpm_clk_msm8998 },
>>          { .compatible = "qcom,rpmcc-qcs404",  .data = 
>> &rpm_clk_qcs404  },
>>          { .compatible = "qcom,rpmcc-sdm660",  .data = 
>> &rpm_clk_sdm660  },
> 
OK.


