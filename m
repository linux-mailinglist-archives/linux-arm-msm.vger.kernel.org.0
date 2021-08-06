Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91A83E2E28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 18:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhHFQJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 12:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhHFQJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 12:09:33 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E0AC0613CF;
        Fri,  6 Aug 2021 09:09:17 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id p5so11747551wro.7;
        Fri, 06 Aug 2021 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UkovV5Mdm34kfjLhrBJxDW6rWpVAnpOVBBkBNhBbuBw=;
        b=eUgzGME8cdzduHUfwOOm8zmY6zIpxSdy7wmhhLgEUjxbJkIvpULnEky10lk3FtMrvl
         UZ6OHlCzag61IYqQIa0te1mFl73r577/eKNRY7SPqCCQvXof0ffSUPDVD5dbvpLwIQ31
         55/gThTCnOon28rJpumeNyma17HjuZM8zpe0xSA/ihojSbvIHUWnWWi84bX8fcIjYKeU
         /PRi8jCkciZ3W+GISHav2cOLzDDOBhmVU1pfT0J9vesnFECohhma72930IzR6ko9Dwjf
         bwWv57N7Q5h5tmST8s8vgZVQbv71IwsbQzo+zRxWDgwjyjWvyRQxIGYbGTAf07NHQrM/
         Bd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UkovV5Mdm34kfjLhrBJxDW6rWpVAnpOVBBkBNhBbuBw=;
        b=czkOyqZGAWT3A2Bg27NcS/5DofSxU2hDD93DoXlzn9vekVrRaYxNxV4QKudL8BhB58
         2xc6jh8FG3aWpeyJNrhAlCG1lOQgfDM32RqqAaiwzgGMJiKWKPsriOLiq9y9kYWAxum1
         Uci/Yyu9Up/aAKV5Si0zu4Zub9HNjvEmdNcHc//26olnzNr4PS5VywWpf5YfumvFlJok
         YV/TqrfAjVByhjEhQ72xCUImhEzhWF/PtBaYU/a3E/Z66oVoxjcuANvwa7Rh60tKt0SW
         u53mDPaUCB/leTkaeJAADGFM84nv4Oezl/buKROC1esgsMDAN7pHc1NhLtSqLLi/mdrT
         RIkQ==
X-Gm-Message-State: AOAM530pDT1RJxQyqJqFMZu3AGUcSiP6C165N7UW5Bhm7KP2DVe2aVGQ
        bmcNU9r/YFIVict74ZIMMBQ=
X-Google-Smtp-Source: ABdhPJzXPeu96xDIdWfZqFZE0cPJQ7eYsvH3bXXQ4Y+i8LIO+dH45v/7KIhttjndGg/S5+JUQVmkNA==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr11556445wrm.220.1628266156141;
        Fri, 06 Aug 2021 09:09:16 -0700 (PDT)
Received: from [192.168.74.110] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id f17sm11813515wrt.18.2021.08.06.09.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 09:09:15 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] phy: qcom-qmp: Add support for SM6115 UFS phy
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20210805091727.942471-1-iskren.chernev@gmail.com>
 <20210805091727.942471-3-iskren.chernev@gmail.com> <YQ0xrgDjxXeNecAS@matsya>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <86fcdc11-9f2c-0aa0-ebab-a26fa9ac2aca@gmail.com>
Date:   Fri, 6 Aug 2021 19:09:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQ0xrgDjxXeNecAS@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/6/21 3:57 PM, Vinod Koul wrote:
> On 05-08-21, 12:17, Iskren Chernev wrote:
> 
>> +/* Only for QMP V3 660 PHY - QSERDES COM registers*/
>> +#define QSERDES_V3_660_COM_ATB_SEL1			0x000
>> +#define QSERDES_V3_660_COM_ATB_SEL2			0x004
>> +#define QSERDES_V3_660_COM_FREQ_UPDATE			0x008
>> +#define QSERDES_V3_660_COM_BG_TIMER			0x00c
>> +#define QSERDES_V3_660_COM_SSC_EN_CENTER		0x010
>> +#define QSERDES_V3_660_COM_SSC_ADJ_PER1			0x014
>> +#define QSERDES_V3_660_COM_SSC_ADJ_PER2			0x018
>> +#define QSERDES_V3_660_COM_SSC_PER1			0x01c
>> +#define QSERDES_V3_660_COM_SSC_PER2			0x020
>> +#define QSERDES_V3_660_COM_SSC_STEP_SIZE1		0x024
>> +#define QSERDES_V3_660_COM_SSC_STEP_SIZE2		0x028
>> +#define QSERDES_V3_660_COM_POST_DIV			0x02c
>> +#define QSERDES_V3_660_COM_POST_DIV_MUX			0x030
>> +#define QSERDES_V3_660_COM_BIAS_EN_CLKBUFLR_EN		0x034
>> +#define QSERDES_V3_660_COM_CLK_ENABLE1			0x038
>> +#define QSERDES_V3_660_COM_SYS_CLK_CTRL			0x03c
>> +#define QSERDES_V3_660_COM_SYSCLK_BUF_ENABLE		0x040
>> +#define QSERDES_V3_660_COM_PLL_EN			0x044
>> +#define QSERDES_V3_660_COM_PLL_IVCO			0x048
>> +#define QSERDES_V3_660_COM_LOCK_CMP1_MODE0		0x04c
>> +#define QSERDES_V3_660_COM_LOCK_CMP2_MODE0		0x050
>> +#define QSERDES_V3_660_COM_LOCK_CMP3_MODE0		0x054
>> +#define QSERDES_V3_660_COM_LOCK_CMP1_MODE1		0x058
>> +#define QSERDES_V3_660_COM_LOCK_CMP2_MODE1		0x05c
>> +#define QSERDES_V3_660_COM_LOCK_CMP3_MODE1		0x060
>> +#define QSERDES_V3_660_COM_CMD_RSVD0			0x064
>> +#define QSERDES_V3_660_COM_EP_CLOCK_DETECT_CTRL		0x068
>> +#define QSERDES_V3_660_COM_SYSCLK_DET_COMP_STATUS	0x06c
>> +#define QSERDES_V3_660_COM_BG_TRIM			0x070
>> +#define QSERDES_V3_660_COM_CLK_EP_DIV			0x074
>> +#define QSERDES_V3_660_COM_CP_CTRL_MODE0		0x078
>> +#define QSERDES_V3_660_COM_CP_CTRL_MODE1		0x07c
>> +#define QSERDES_V3_660_COM_CMN_RSVD1			0x080
>> +#define QSERDES_V3_660_COM_PLL_RCTRL_MODE0		0x084
>> +#define QSERDES_V3_660_COM_PLL_RCTRL_MODE1		0x088
>> +#define QSERDES_V3_660_COM_CMN_RSVD2			0x08c
>> +#define QSERDES_V3_660_COM_PLL_CCTRL_MODE0		0x090
>> +#define QSERDES_V3_660_COM_PLL_CCTRL_MODE1		0x094
>> +#define QSERDES_V3_660_COM_CMN_RSVD3			0x098
>> +#define QSERDES_V3_660_COM_PLL_CNTRL			0x09c
>> +#define QSERDES_V3_660_COM_PHASE_SEL_CTRL		0x0a0
>> +#define QSERDES_V3_660_COM_PHASE_SEL_DC			0x0a4
>> +#define QSERDES_V3_660_COM_BIAS_EN_CTRL_BY_PSM		0x0a8
>> +#define QSERDES_V3_660_COM_SYSCLK_EN_SEL		0x0ac
>> +#define QSERDES_V3_660_COM_CML_SYSCLK_SEL		0x0b0
>> +#define QSERDES_V3_660_COM_RESETSM_CNTRL		0x0b4
>> +#define QSERDES_V3_660_COM_RESETSM_CNTRL2		0x0b8
>> +#define QSERDES_V3_660_COM_RESTRIM_CTRL			0x0bc
>> +#define QSERDES_V3_660_COM_RESTRIM_CTRL2		0x0c0
>> +#define QSERDES_V3_660_COM_LOCK_CMP_EN			0x0c8
>> +#define QSERDES_V3_660_COM_LOCK_CMP_CFG			0x0cc
>> +#define QSERDES_V3_660_COM_DEC_START_MODE0		0x0d0
>> +#define QSERDES_V3_660_COM_DEC_START_MODE1		0x0d4
>> +#define QSERDES_V3_660_COM_VCOCAL_DEADMAN_CTRL		0x0d8
>> +#define QSERDES_V3_660_COM_DIV_FRAC_START1_MODE0	0x0dc
>> +#define QSERDES_V3_660_COM_DIV_FRAC_START2_MODE0	0x0e0
>> +#define QSERDES_V3_660_COM_DIV_FRAC_START3_MODE0	0x0e4
>> +#define QSERDES_V3_660_COM_DIV_FRAC_START1_MODE1	0x0e8
>> +#define QSERDES_V3_660_COM_DIV_FRAC_START2_MODE1	0x0ec
>> +#define QSERDES_V3_660_COM_DIV_FRAC_START3_MODE1	0x0f0
>> +#define QSERDES_V3_660_COM_VCO_TUNE_MINVAL1		0x0f4
>> +#define QSERDES_V3_660_COM_VCO_TUNE_MINVAL2		0x0f8
>> +#define QSERDES_V3_660_COM_CMN_RSVD4			0x0fc
>> +#define QSERDES_V3_660_COM_INTEGLOOP_INITVAL		0x100
>> +#define QSERDES_V3_660_COM_INTEGLOOP_EN			0x104
>> +#define QSERDES_V3_660_COM_INTEGLOOP_GAIN0_MODE0	0x108
>> +#define QSERDES_V3_660_COM_INTEGLOOP_GAIN1_MODE0	0x10c
>> +#define QSERDES_V3_660_COM_INTEGLOOP_GAIN0_MODE1	0x110
>> +#define QSERDES_V3_660_COM_INTEGLOOP_GAIN1_MODE1	0x114
>> +#define QSERDES_V3_660_COM_VCO_TUNE_MAXVAL1		0x118
>> +#define QSERDES_V3_660_COM_VCO_TUNE_MAXVAL2		0x11c
>> +#define QSERDES_V3_660_COM_RES_TRIM_CONTROL2		0x120
>> +#define QSERDES_V3_660_COM_VCO_TUNE_CTRL		0x124
>> +#define QSERDES_V3_660_COM_VCO_TUNE_MAP			0x128
>> +#define QSERDES_V3_660_COM_VCO_TUNE1_MODE0		0x12c
>> +#define QSERDES_V3_660_COM_VCO_TUNE2_MODE0		0x130
>> +#define QSERDES_V3_660_COM_VCO_TUNE1_MODE1		0x134
>> +#define QSERDES_V3_660_COM_VCO_TUNE2_MODE1		0x138
>> +#define QSERDES_V3_660_COM_VCO_TUNE_INITVAL1		0x13c
>> +#define QSERDES_V3_660_COM_VCO_TUNE_INITVAL2		0x140
>> +#define QSERDES_V3_660_COM_VCO_TUNE_TIMER1		0x144
>> +#define QSERDES_V3_660_COM_VCO_TUNE_TIMER2		0x148
>> +#define QSERDES_V3_660_COM_SAR				0x14c
>> +#define QSERDES_V3_660_COM_SAR_CLK			0x150
>> +#define QSERDES_V3_660_COM_SAR_CODE_OUT_STATUS		0x154
>> +#define QSERDES_V3_660_COM_SAR_CODE_READY_STATUS	0x158
>> +#define QSERDES_V3_660_COM_CMN_STATUS			0x15c
>> +#define QSERDES_V3_660_COM_RESET_SM_STATUS		0x160
>> +#define QSERDES_V3_660_COM_RESTRIM_CODE_STATUS		0x164
>> +#define QSERDES_V3_660_COM_PLLCAL_CODE1_STATUS		0x168
>> +#define QSERDES_V3_660_COM_PLLCAL_CODE2_STATUS		0x16c
>> +#define QSERDES_V3_660_COM_BG_CTRL			0x170
>> +#define QSERDES_V3_660_COM_CLK_SELECT			0x174
>> +#define QSERDES_V3_660_COM_HSCLK_SEL			0x178
>> +#define QSERDES_V3_660_COM_INTEGLOOP_BINCODE_STATUS	0x17c
>> +#define QSERDES_V3_660_COM_PLL_ANALOG			0x180
>> +#define QSERDES_V3_660_COM_CORECLK_DIV			0x184
>> +#define QSERDES_V3_660_COM_SW_RESET			0x188
>> +#define QSERDES_V3_660_COM_CORE_CLK_EN			0x18c
>> +#define QSERDES_V3_660_COM_C_READY_STATUS		0x190
>> +#define QSERDES_V3_660_COM_CMN_CONFIG			0x194
>> +#define QSERDES_V3_660_COM_CMN_RATE_OVERRIDE		0x198
>> +#define QSERDES_V3_660_COM_SVS_MODE_CLK_SEL		0x19c
>> +#define QSERDES_V3_660_COM_DEBUG_BUS0			0x1a0
>> +#define QSERDES_V3_660_COM_DEBUG_BUS1			0x1a4
>> +#define QSERDES_V3_660_COM_DEBUG_BUS2			0x1a8
>> +#define QSERDES_V3_660_COM_DEBUG_BUS3			0x1ac
>> +#define QSERDES_V3_660_COM_DEBUG_BUS_SEL		0x1b0
>> +#define QSERDES_V3_660_COM_CMN_MISC1			0x1b4
>> +#define QSERDES_V3_660_COM_CORECLK_DIV_MODE1		0x1bc
>> +#define QSERDES_V3_660_COM_CMN_RSVD5			0x1c0
> 
> why are these registers 660 specific and not V3 like we have for
> other generations..? Quick looks with V3 regs tells me that seem
> similar....
>

Well, I looked at them for a long time and the only thing that is similar
are the first few QSERDES registers from COM_ATB_SEL1=0x000 to
COM_BIAS_EN_CLKBUFLR_EN=0x034. Everything else is different. So I can re-use
the V3 for the similar regs, but they are 10%, so I figured instead of combing
through all of the sequences to save 10% of the constants and make it slightly
less readable just use new constants.

Let me know if I should reuse the 14 regs from V3.

Regards,
Iskren
