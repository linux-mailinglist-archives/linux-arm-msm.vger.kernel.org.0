Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283AD5B5EC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 19:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiILRFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 13:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiILRFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 13:05:00 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FCF1401B
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:04:59 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso11442269wmc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=WSw0pG/esjCvtsqbCZ9krXSHuD6wI+jRIe9K2h4z8vE=;
        b=M+3vZ3XYg3plZw4SCpqXxsMCFP0ST9C7W5K7z6MZpYYVMcxT+IUg/e6fUcHFz2osey
         YF+Gv6HKoY8jTBAe6fewxh+f0iCDgtHVUMf3absPfnYtAAtubjczbpK1X+KfzE2NUjZ0
         b2Wdo5D6cCJ0w9d6q4GjC36EX2pw7dMtmV3V0jcHdnGpDc9+lsPv/O3sMLY5wjErkFrs
         nTWgTSLnjENbBX1QJv7RXL3gKZCsIeOt2vShbU3PfPaisCWQdT38SgY27Kt7QV2iGRNe
         mnm3BEoSmHDK6m1j+EtsG1+4zDdih6yEoj7kwZVKQCo4abwBzVV4puZ1SvBJ85DP7Fdj
         2/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WSw0pG/esjCvtsqbCZ9krXSHuD6wI+jRIe9K2h4z8vE=;
        b=NWX0xpkQ7TeIkdRz+B1rTJ3rmxJ+glkK52s/PgtcjYz6BKSSRBuBdZQczmCWrK9Vt7
         e8RSj6eQW6ZW2BO9/BoUL2dNd/zI1k6oEAfiUqFeFN+Jhfb++dQf0Vvx4ld/U1sy5FQ6
         C22YUHcg554f3ZO2yhhOyDpZLQdY8sXT9IcgVkgS32gHLbssIJucL9f8dweXS9F942Mc
         w9fyztXsqWQgoUd2X/FYw/UrOPMVJiY+ZVUXOLTVm2+M7SYBSYZ3a+0JVZauCKxg7Dt9
         Ywpva+fo0OTuUjRLHGqSjlFPLVawMm5vQw4M/hl4n4YqEWbIiZyyRRwF1yZ0tC9ioGvI
         czUg==
X-Gm-Message-State: ACgBeo2OsjP1BD9cGvKZCKRLdy4dmlcWLkmQqy5xZDL8n00O3O83kt2V
        WEzlq4KZh4AZ3WX8jdFQySV5
X-Google-Smtp-Source: AA6agR6+rS18XLjMNWEqzEBtmPWOlkpQZncpaLMjiQ4cZn4b5Bcr1Cs3YLzaJ4GensI/rkTvZup/wQ==
X-Received: by 2002:a05:600c:22c7:b0:3b4:92ba:ff99 with SMTP id 7-20020a05600c22c700b003b492baff99mr1414325wmg.190.1663002297558;
        Mon, 12 Sep 2022 10:04:57 -0700 (PDT)
Received: from thinkpad ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c359000b003b486027c8asm5053277wmq.20.2022.09.12.10.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 10:04:56 -0700 (PDT)
Date:   Mon, 12 Sep 2022 22:34:37 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        quic_rjendra@quicinc.com
Cc:     helgaas@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, quic_vbadigan@quicinc.com,
        quic_hemantk@quicinc.com, quic_nitegupt@quicinc.com,
        quic_skananth@quicinc.com, quic_ramkri@quicinc.com,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v6 5/5] clk: qcom: Alwaya on pcie gdsc
Message-ID: <20220912170437.GA36223@thinkpad>
References: <1662713084-8106-1-git-send-email-quic_krichai@quicinc.com>
 <1662713084-8106-6-git-send-email-quic_krichai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1662713084-8106-6-git-send-email-quic_krichai@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Rajendra

On Fri, Sep 09, 2022 at 02:14:44PM +0530, Krishna chaitanya chundru wrote:
> Make GDSC always on to ensure controller and its dependent clocks
> won't go down during system suspend.
> 

You need to mention the SoC name in subject, otherwise one cannot know for
which platform this patch applies to.

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sc7280.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 7ff64d4..2f781a2 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -3109,7 +3109,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
>  		.name = "gcc_pcie_1_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = ALWAYS_ON,

Rajendra, should we also put PCIe GDSC into retention state as you have done for
USB [1]?

Thanks,
Mani

[1] https://lore.kernel.org/all/20220901101756.28164-2-quic_rjendra@quicinc.com/

>  };
>  
>  static struct gdsc gcc_ufs_phy_gdsc = {
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
