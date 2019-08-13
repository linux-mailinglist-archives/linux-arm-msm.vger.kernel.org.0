Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A5D8B9C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 15:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbfHMNOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 09:14:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46962 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728536AbfHMNOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 09:14:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DF5E060A00; Tue, 13 Aug 2019 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565702086;
        bh=qAquBtWjxQLm8+6Uv/fnJnteZa6BSH1H1LI/eZ2BbZg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VjJESbkIMwNE8z3TU+GJqHYA1D+EGl8K2bsMplHXCEwtm2gRy96FxCzpj/UMf9YhX
         4P6c23q+Nq7n6XLh6QLrwWJ5kYlJr2rs+zUUOmyW08rnrAVp0NFYhppLh9rm3Uvup6
         gPPwh9dL78s56RDDQyGsupHQfeqmIRc0h3o7f4co=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 69FDD609CD;
        Tue, 13 Aug 2019 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565702086;
        bh=qAquBtWjxQLm8+6Uv/fnJnteZa6BSH1H1LI/eZ2BbZg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VjJESbkIMwNE8z3TU+GJqHYA1D+EGl8K2bsMplHXCEwtm2gRy96FxCzpj/UMf9YhX
         4P6c23q+Nq7n6XLh6QLrwWJ5kYlJr2rs+zUUOmyW08rnrAVp0NFYhppLh9rm3Uvup6
         gPPwh9dL78s56RDDQyGsupHQfeqmIRc0h3o7f4co=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 13 Aug 2019 18:44:46 +0530
From:   Govind Singh <govinds@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/7] clk: qcom: Add Q6SSTOP clock controller for QCS404
In-Reply-To: <20190808150901.D6C932184E@mail.kernel.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
 <20190726092332.25202-5-govinds@codeaurora.org>
 <20190808150901.D6C932184E@mail.kernel.org>
Message-ID: <7e86199d468df84cc2125785fc823b85@codeaurora.org>
X-Sender: govinds@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2019-08-08 20:39, Stephen Boyd wrote:
> Quoting Govind Singh (2019-07-26 02:23:29)
>> diff --git a/drivers/clk/qcom/q6sstop-qcs404.c 
>> b/drivers/clk/qcom/q6sstop-qcs404.c
>> new file mode 100644
>> index 000000000000..b6281986b077
>> --- /dev/null
>> +++ b/drivers/clk/qcom/q6sstop-qcs404.c
>> @@ -0,0 +1,223 @@
> [...]
>> +};
>> +
>> +static struct platform_driver q6sstopcc_qcs404_driver = {
>> +       .probe          = q6sstopcc_qcs404_probe,
>> +       .remove         = q6sstopcc_qcs404_remove,
>> +       .driver         = {
>> +               .name   = "qcs404-q6sstopcc",
>> +               .of_match_table = q6sstopcc_qcs404_match_table,
>> +       .pm = &q6sstopcc_pm_ops,
> 
> This got some weird indent.
> 
Fixed in next rev.
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=159221
I have removed this change from the previous series.
DT binding change is converted to YAML.

>> +       },
>> +};
>> +
>> +module_platform_driver(q6sstopcc_qcs404_driver);
>> +
>> +MODULE_DESCRIPTION("QTI QCS404 Q6SSTOP Clock Controller Driver");
>> +MODULE_LICENSE("GPL v2");

BR,
Govind
