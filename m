Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B3852C240
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 20:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241446AbiERS0b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 14:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241483AbiERS0Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 14:26:25 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFC5190D35
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 11:26:23 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e4so2971777ljb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=od5uWvVsPOq4I2jfpLO/cfL7S5BDWB+6iI2HjhmFDi8=;
        b=YFi7YoiK2sCoELwEdEVKRfjqdXWbA905k1dvjTeVLCplX6bNiQP/OQNji20m5/I8PT
         5/bpQ3GAVS1nt9PKEIIiGeJIu5HxotShLdncl6eM1JtDb8bnHdRi3r4u7Zia5EevqpcY
         KAaHQDZGdTRrlIflRuhVU2RCL9TeDjGnSNelx9v+ffLnYHtc0/NXegxhtdNdCh8wRu6K
         E+OmwCQezZG4k2VQMex1HglxK1OLmX8SYInqAkOKU2dD/JyCZNjo2mmAzTyjwwAhQtyr
         giX6MbX+FhuP2LNH38gojAT/2wComJtGQiP/qcPFNp/xi0cQ0fn06ntCIqNOYEyUu83p
         7Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=od5uWvVsPOq4I2jfpLO/cfL7S5BDWB+6iI2HjhmFDi8=;
        b=RECixniUXoj/v6JT7e+EZbCIrPVdAS7eeeIoPLRKFenmuWKjHVoXjzx0Kz6ZJaT7mS
         gOkzGMoBovPJnidn/SAIJVZ+VHi69r0+JsYQeKyRrLgFcARBmGRWSc73yJIfpNSB3KHW
         8rUwfID3bXLa6ivAYjLhP6FHes6X/PWwb2V4s9G1fbtgGhjr/veHTsWXJ/y0M6Pm158b
         BjS0W/ucBwyeqql5VxTNXID1p0muiFzDCAsVyNXuClJZ+3hgLHVjz4hLZm6UAdzWfhcE
         FeM3ADe0caBMRyVyLt/ST7VdbTywgOyPCZHWNaNc41J9/SCePgClVLkSAnxbK3Zpe302
         5eYA==
X-Gm-Message-State: AOAM530V2CUnaql/U2Abd4jfmvyKoNPDLsyxx0FX0hv360/jIxREA3az
        Zet41YLvqSZ+/9QQ7IMadNiLdrqhZm5BFA==
X-Google-Smtp-Source: ABdhPJxENUsQBLAa4UkhjQW3jk2j4PMM065g3mgcmn31EqwZri4gX76qk8umBhxThR46lEc7Pnx8FQ==
X-Received: by 2002:a2e:91cf:0:b0:24f:11ea:d493 with SMTP id u15-20020a2e91cf000000b0024f11ead493mr385182ljg.408.1652898381751;
        Wed, 18 May 2022 11:26:21 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id h12-20020a19700c000000b00477baba9504sm22360lfc.40.2022.05.18.11.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 11:26:21 -0700 (PDT)
Message-ID: <783bbf39-779d-3ac8-a965-9d98ec1993ec@linaro.org>
Date:   Wed, 18 May 2022 21:26:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 3/5] clk: qcom: gcc-sm8450: use new
 clk_regmap_pipe_src_ops for PCIe pipe clocks
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220513175339.2981959-1-dmitry.baryshkov@linaro.org>
 <20220513175339.2981959-4-dmitry.baryshkov@linaro.org>
 <CAE-0n53wjtJpUeMswrkQq1mAQEEfXiUhuvq4W4t=7gMpkbsiNQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53wjtJpUeMswrkQq1mAQEEfXiUhuvq4W4t=7gMpkbsiNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 20:59, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-13 10:53:37)
>> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
>> index 593a195467ff..a140a89b73b4 100644
>> --- a/drivers/clk/qcom/gcc-sm8450.c
>> +++ b/drivers/clk/qcom/gcc-sm8450.c
>> @@ -239,17 +218,21 @@ static const struct clk_parent_data gcc_parent_data_11[] = {
>>          { .fw_name = "bi_tcxo" },
>>   };
>>
>> -static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
>> +static struct clk_regmap_phy_mux gcc_pcie_0_pipe_clk_src = {
>>          .reg = 0x7b060,
>>          .shift = 0,
>>          .width = 2,
>> -       .parent_map = gcc_parent_map_4,
>> +       .phy_src_val = 0, /* pipe_clk */
> 
> Make a define? PCIE0_PIPE_CLK_SRC_VAL and drop the comment?

This value can change between the muxes. Thus I'd prefer not to do this.
Compare it with the parent_maps, where we do not use defines for the 
'val' part.

> 
>> +       .ref_src_val = 2, /* bi_tcxo */
>>          .clkr = {
>>                  .hw.init = &(struct clk_init_data){
>>                          .name = "gcc_pcie_0_pipe_clk_src",
>> -                       .parent_data = gcc_parent_data_4,
>> -                       .num_parents = ARRAY_SIZE(gcc_parent_data_4),
>> -                       .ops = &clk_regmap_mux_closest_ops,
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "pcie_0_pipe_clk",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_regmap_phy_mux_ops,
>>                  },
>>          },
>>   };


-- 
With best wishes
Dmitry
