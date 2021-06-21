Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA1A3AF169
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 19:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhFURJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 13:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhFURJm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 13:09:42 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6125CC06114C
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 10:02:58 -0700 (PDT)
Received: from [192.168.1.101] (bband-dyn238.178-41-213.t-com.sk [178.41.213.238])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B8DC1F46C;
        Mon, 21 Jun 2021 19:02:55 +0200 (CEST)
Date:   Mon, 21 Jun 2021 19:02:49 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Message-Id: <P0A2VQ.Z2SRD0005J6R3@somainline.org>
In-Reply-To: <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
References: <20210612094631.89980-1-martin.botka@somainline.org>
        <20210612094631.89980-3-martin.botka@somainline.org>
        <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On Sun, Jun 20 2021 at 11:03:04 PM -0500, Jassi Brar 
<jassisinghbrar@gmail.com> wrote:
> On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> <martin.botka@somainline.org> wrote:
>> 
>>  This commit adds compatible for the SM6125 SoC
>> 
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  ---
>>  Changes in V2:
>>  None
>>  Changes in V3:
>>  Change compatible to apcs-hmss-global
>>   drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>> 
>>  diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c 
>> b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>>  index f25324d03842..f24c5ad8d658 100644
>>  --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>>  +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>>  @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data 
>> sdm660_apcs_data = {
>>          .offset = 8, .clk_name = NULL
>>   };
>> 
>>  +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
>>  +       .offset = 8, .clk_name = NULL
>>  +};
>>  +
>>   static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
>>          .offset = 12, .clk_name = NULL
>>   };
>>  @@ -166,6 +170,7 @@ static const struct of_device_id 
>> qcom_apcs_ipc_of_match[] = {
>>          { .compatible = "qcom,sc8180x-apss-shared", .data = 
>> &apps_shared_apcs_data },
>>          { .compatible = "qcom,sdm660-apcs-hmss-global", .data = 
>> &sdm660_apcs_data },
>>          { .compatible = "qcom,sdm845-apss-shared", .data = 
>> &apps_shared_apcs_data },
>>  +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = 
>> &sm6125_apcs_data },
>>          { .compatible = "qcom,sm8150-apss-shared", .data = 
>> &apps_shared_apcs_data },
>>          { .compatible = "qcom,sdx55-apcs-gcc", .data = 
>> &sdx55_apcs_data },
>>          {}
>> 
> These all are basically different names for the same controller.
> The 'offset' is a configuration parameter and the 'clock', when NULL,
> is basically some "always-on" clock.
> I am sure we wouldn't be doing it, if the controller was third-party.
> 
> -Jassi

I'm aware that its not great to duplicate but i just followed
how it was done previously.

I will probably send a patch to lump the common conf together.

Best Regards,
Martin


