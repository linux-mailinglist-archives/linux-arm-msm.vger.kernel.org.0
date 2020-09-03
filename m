Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF4925BE64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 11:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgICJYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 05:24:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64108 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgICJYJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 05:24:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599125047; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vzyvnVN4EUQzE6hJZKmqXAP1pTaiOlGyUPxPgSRWKec=; b=PV2k2pNobRgqAi6V1X8DiPslv3YHA+48qg9S7lFOTtUFfAKPnr8OjLdOSfZegg81bi+iVK8L
 i66puFpvxhL0u2S0Dmb8iruxZUthN4TCoU5WbcCQn8GhGK9XSjp6ZWn09gntyn4SIgfxhgss
 JYDiSelF8syD3lPQNyW7zDIK28s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f50b62dcc683673f9011171 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 09:23:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F7B9C4339C; Thu,  3 Sep 2020 09:23:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.172.121] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA6F6C433C9;
        Thu,  3 Sep 2020 09:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA6F6C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 4/5] ASoC: qcom: Add support for audio over DP
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-5-git-send-email-srivasam@codeaurora.org>
 <159894552988.334488.8290895362888910651@swboyd.mtv.corp.google.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <25a8ca32-47f9-fb04-5f76-cc9e27f4e412@codeaurora.org>
Date:   Thu, 3 Sep 2020 14:53:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <159894552988.334488.8290895362888910651@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen, for your time for review!!!

On 9/1/2020 1:02 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2020-08-30 23:39:23)
>> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
>> index 167bf2c..cea7ae7 100644
>> --- a/sound/soc/qcom/lpass-sc7180.c
>> +++ b/sound/soc/qcom/lpass-sc7180.c
>> @@ -190,15 +232,92 @@ static struct lpass_variant sc7180_data = {
>>                                     "mi2s-bit-clk0",
>>                                     "mi2s-bit-clk1",
>>                                  },
>> +       .id                             = I2S_INTERFACE,
>>          .init                   = sc7180_lpass_init,
>>          .exit                   = sc7180_lpass_exit,
>>          .alloc_dma_channel      = sc7180_lpass_alloc_dma_channel,
>>          .free_dma_channel       = sc7180_lpass_free_dma_channel,
>>   };
>>   
>> +static struct lpass_variant sc7180_hdmi_data = {
> Can this be const?
Yes this can be constant. will change in next patch.
>
>> +       .hdmi_tx_ctl_addr       = 0x1000,
>> +       .hdmi_legacy_addr       = 0x1008,
>> +       .hdmi_vbit_addr         = 0x610c0,
>> +       .hdmi_ch_lsb_addr       = 0x61048,
>> +       .hdmi_ch_msb_addr       = 0x6104c,
>> +       .ch_stride              = 0x8,
>> +       .hdmi_parity_addr       = 0x61034,
>> +       .hdmi_dmactl_addr       = 0x61038,
>> +       .hdmi_dma_stride        = 0x4,
>> +       .hdmi_DP_addr           = 0x610c8,
>> +       .hdmi_sstream_addr      = 0x6101c,
>> +       .irq_reg_base           = 0x63000,
>> +       .irq_ports              = 1,
>> +       .rdma_reg_base          = 0x64000,
>> +       .rdma_reg_stride        = 0x1000,
>> +       .rdma_channels          = 4,
>> +
>> +       .rdma_dyncclk           = REG_FIELD_ID(0x64000, 14, 14, 4, 0x1000),
>> +       .rdma_bursten           = REG_FIELD_ID(0x64000, 13, 13, 4, 0x1000),
>> +       .rdma_burst8            = REG_FIELD_ID(0x64000, 15, 15, 4, 0x1000),
>> +       .rdma_burst16           = REG_FIELD_ID(0x64000, 16, 16, 4, 0x1000),
>> +       .rdma_dynburst          = REG_FIELD_ID(0x64000, 18, 18, 4, 0x1000),
>> +       .rdma_wpscnt            = REG_FIELD_ID(0x64000, 10, 12, 4, 0x1000),
>> +       .rdma_fifowm            = REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000),
>> +       .rdma_enable            = REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000),
>> +
>> +       .sstream_en             = REG_FIELD(0x6101c, 0, 0),
>> +       .dma_sel                        = REG_FIELD(0x6101c, 1, 2),
>> +       .auto_bbit_en   = REG_FIELD(0x6101c, 3, 3),
>> +       .layout                 = REG_FIELD(0x6101c, 4, 4),
>> +       .layout_sp              = REG_FIELD(0x6101c, 5, 8),
>> +       .set_sp_on_en   = REG_FIELD(0x6101c, 10, 10),
>> +       .dp_audio               = REG_FIELD(0x6101c, 11, 11),
>> +       .dp_staffing_en = REG_FIELD(0x6101c, 12, 12),
>> +       .dp_sp_b_hw_en  = REG_FIELD(0x6101c, 13, 13),
>> +
>> +       .mute                   = REG_FIELD(0x610c8, 0, 0),
>> +       .as_sdp_cc              = REG_FIELD(0x610c8, 1, 3),
>> +       .as_sdp_ct              = REG_FIELD(0x610c8, 4, 7),
>> +       .aif_db4                        = REG_FIELD(0x610c8, 8, 15),
>> +       .frequency              = REG_FIELD(0x610c8, 16, 21),
>> +       .mst_index              = REG_FIELD(0x610c8, 28, 29),
>> +       .dptx_index             = REG_FIELD(0x610c8, 30, 31),
>> +
>> +       .soft_reset             = REG_FIELD(0x1000, 31, 31),
>> +       .force_reset    = REG_FIELD(0x1000, 30, 30),
>> +
>> +       .use_hw_chs             = REG_FIELD(0x61038, 0, 0),
>> +       .use_hw_usr             = REG_FIELD(0x61038, 1, 1),
>> +       .hw_chs_sel             = REG_FIELD(0x61038, 2, 4),
>> +       .hw_usr_sel             = REG_FIELD(0x61038, 5, 6),
>> +
>> +       .replace_vbit   = REG_FIELD(0x610c0, 0, 0),
>> +       .vbit_stream    = REG_FIELD(0x610c0, 1, 1),
>> +
>> +       .legacy_en              =  REG_FIELD(0x1008, 0, 0),
>> +       .calc_en                =  REG_FIELD(0x61034, 0, 0),
>> +       .lsb_bits               =  REG_FIELD(0x61048, 0, 31),
>> +       .msb_bits               =  REG_FIELD(0x6104c, 0, 31),
>> +
>> +       .clk_name               = (const char*[]) {
>> +                                       "pcnoc-sway-clk",
>> +                                       "audio-core",
>> +                                       "pcnoc-mport-clk",
>> +                               },
>> +       .num_clks               = 3,
>> +       .id                     = HDMI_INTERFACE,
>> +       .dai_driver             = sc7180_lpass_cpu_hdmi_dai_driver,
>> +       .num_dai                = ARRAY_SIZE(sc7180_lpass_cpu_hdmi_dai_driver),
>> +       .init                   = sc7180_lpass_init,
>> +       .exit                   = sc7180_lpass_exit,
>> +       .alloc_dma_channel = sc7180_lpass_alloc_hdmi_dma_channel,
>> +       .free_dma_channel = sc7180_lpass_free_hdmi_dma_channel,
>> +
>> +};
> Add a newline here?
okay
>
>>   static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
>>          {.compatible = "qcom,sc7180-lpass-cpu", .data = &sc7180_data},
>> -       {}
>> +       {.compatible = "qcom,sc7180-lpass-hdmi", .data = &sc7180_hdmi_data}
> This most likely needs to keep the sentinel around so that a match can
> be made or stop if nothing is found.
okay..
>
>>   };
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

