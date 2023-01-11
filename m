Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57BB665B00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 13:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239202AbjAKMFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 07:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239284AbjAKMEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 07:04:32 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93522624
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 04:04:13 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y25so23163283lfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 04:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oib4YU24Hg68PTgy4DxuaT37C/z9vNFEJMvu+koqaY=;
        b=Yy/wIOuY/mFgyZnqWknq7oufXkKfIJpeAPs84I4+i270V8tAVh5OYNivurb3d88WHK
         uae4/ORSHaMCUQ3RCcyBZdM04wm6rZsmDtV/ya95RwGk1c5jgtG+x+IHRAGg1b6Wj6pb
         K2NiOMA/FxKlMAWVqwLyiZWeGJGZS13iBR9GbWx86XYBFXbnAEcRn7Cl+d2QBZ9YWSo+
         0Aw7qV86J1dEpWMr+gDeDfj+SiQG1irUeiDiTBi36ywjeW+2XPUX+In9OHhmmzJaHpkW
         iDK0elnAnK5UQ/04iRbCjndgeJGzppkb/zvFmsbfELoNPvM44+gC7y53cSR0bgZi9eAv
         ZhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oib4YU24Hg68PTgy4DxuaT37C/z9vNFEJMvu+koqaY=;
        b=ia+hn/iPYXMdOMTImnB/1TgthVzjwi/1pf6fP/MyXb+NaKD1X1ym+R72sqRDN3A4Rs
         xy7BYOsTPWkGKkYOFo2e1EsQrpVcojUay/EnSM65wx8t6tuJJaIOXVo7qdCssESBwtaD
         HRgqyGRifOGRe1uM9AsQOMI//KmdHA6Q0hi7Dho6Uz7/CFh+ghumgh/J0VSpIVFuFNfY
         9a5hY1wgb50xFNq+EXDSW7pbwq52IgdQWU80bLTy3OvHZtuU4ouic6l7GljswxrVfc+K
         Ll0RbqRXKm0NWmIxdk6ifDOT5W4bM2Wi1XF+aj+gNmnakStIH2vm8DfNL5a/lSV/pI5d
         YAYg==
X-Gm-Message-State: AFqh2kruqGbzIcUraoUM6xJb8r45wxPgIfYmIEuwRD8jB7ae9ob17r0J
        syvM+WYcM0Z3vwovl+mvkvG69A==
X-Google-Smtp-Source: AMrXdXuQdQMK1AzkjuSB62xM9jMBO+9t20jvTxLZnjpxuujgsDdeHG1DQzho+opaRd7jkzomUYB4aQ==
X-Received: by 2002:a05:6512:3b99:b0:4a4:68b9:608c with SMTP id g25-20020a0565123b9900b004a468b9608cmr24899693lfv.23.1673438652184;
        Wed, 11 Jan 2023 04:04:12 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id d19-20020a196b13000000b004b550c26949sm2688197lfa.290.2023.01.11.04.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 04:04:10 -0800 (PST)
Message-ID: <51a8bb85-8fda-2d79-f753-9461316bae9e@linaro.org>
Date:   Wed, 11 Jan 2023 13:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 4/6] arm64: dts: qcom: sm6125: Add UFS nodes
Content-Language: en-US
To:     Lux Aliaga <they@mint.lgbt>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org
References: <20230108195336.388349-1-they@mint.lgbt>
 <20230108195336.388349-5-they@mint.lgbt>
 <475d3f2f-114f-d6d2-89db-465ba7acd0d6@linaro.org>
 <f1f1337a-30cc-df3c-81d5-2daac61e874c@mint.lgbt>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f1f1337a-30cc-df3c-81d5-2daac61e874c@mint.lgbt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 03:53, Lux Aliaga wrote:
> 
> On 09/01/2023 09:18, Konrad Dybcio wrote:
>>
>> On 8.01.2023 20:53, Lux Aliaga wrote:
>>> Adds a UFS host controller node and its corresponding PHY to
>>> the sm6125 platform.
>>>
>>> Signed-off-by: Lux Aliaga <they@mint.lgbt>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 57 ++++++++++++++++++++++++++++
>>>   1 file changed, 57 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> index df5453fcf2b9..cec7071d5279 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> @@ -511,6 +511,63 @@ sdhc_2: mmc@4784000 {
>>>               status = "disabled";
>>>           };
>>>   +        ufs_mem_hc: ufs@4804000 {
>>> +            compatible = "qcom,sm6125-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>>> +            reg = <0x04804000 0x3000>, <0x04810000 0x8000>;
>> You need reg-names for ICE to probe, otherwise the second reg sits unused.
>>
>>> +            interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
>>> +            phys = <&ufs_mem_phy>;
>>> +            phy-names = "ufsphy";
>>> +            lanes-per-direction = <1>;
>>> +            #reset-cells = <1>;
>>> +            resets = <&gcc GCC_UFS_PHY_BCR>;
>>> +            reset-names = "rst";
>>> +            iommus = <&apps_smmu 0x200 0x0>;
>>> +
>>> +            clock-names = "core_clk",
>>> +                      "bus_aggr_clk",
>>> +                      "iface_clk",
>>> +                      "core_clk_unipro",
>>> +                      "ref_clk",
>>> +                      "tx_lane0_sync_clk",
>>> +                      "rx_lane0_sync_clk",
>>> +                      "ice_core_clk";
>>> +            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>>> +                 <&gcc GCC_SYS_NOC_UFS_PHY_AXI_CLK>,
>>> +                 <&gcc GCC_UFS_PHY_AHB_CLK>,
>>> +                 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>>> +                 <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>> +                 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>>> +                 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
>>> +                 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>>> +            freq-table-hz = <50000000 240000000>,
>>> +                    <0 0>,
>>> +                    <0 0>,
>>> +                    <37500000 150000000>,
>>> +                    <0 0>,
>>> +                    <0 0>,
>>> +                    <0 0>,
>>> +                    <75000000 300000000>;
>>> +
>>> +            status = "disabled";
>>> +        };
>>> +
>>> +        ufs_mem_phy: phy@4807000 {
>>> +            compatible = "qcom,sm6125-qmp-ufs-phy";
>>> +            reg = <0x04807000 0x1c4>;
>> Isn't this too small? Downstream says 0xdb8, but it's probably even bigger..
> What do you think could help me find the new length of the registers? I tried 0x1000 and it probed just fine, but I'm not really sure until what extent I could push it.
The "true" values are probably only in documentation, which
I don't have.

Konrad
> 
