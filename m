Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF6D729D07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 16:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241359AbjFIOiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 10:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjFIOiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 10:38:16 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52671BFF
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 07:38:14 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b1af9ef7a9so20583201fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686321493; x=1688913493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHDHmxkGz/lI3u3ur4hiLPnCzium3o5kvrOi4S/iPfk=;
        b=Y0cjCsZMoWMWGg+SMHVOza0excOs0NGIGevbqqqkDkfl7wvnvOhxNXeFqxgw1C1EdV
         dZD9rjz5whlGUDfRk1epIhSNtcxidIr7wwlKjMOYuVLlnZByToKFZbvDkYLVNa7/pPpZ
         0UCxxTJqvJm80yWohS1HzpFKOEnranUDgi+eUMuQ476bBUv5OXVq0qsPwkKJ5PQHJSO8
         O6SR86YOuVk07sKGTxcFutjileg7gx3AtqE8LHXijmIeGmtvgoks/yN1B83qT43yBfGu
         BRoVm0CbFxD8kqvha/Sg9c7r+z7Sua/X3goazlMyRZk6//Uy+7bXN7lAW38yvqgDYqDo
         V5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686321493; x=1688913493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHDHmxkGz/lI3u3ur4hiLPnCzium3o5kvrOi4S/iPfk=;
        b=VBhX477ZtRExEOlpE96DgPbpkqXmdYAwaT0fbawkLHkTtgf9GfmhnJ80XIjJPp1Vnw
         ilL9cbfyxQKwkmFxX5T74vyHKhxPycyErE9ehSvgiU4HVYP3El1OKl1oLuEaDXO0eLoo
         db2ZrOclqPTw4vMOFoMJecs2xwpKriCCh4b+gjZ//7LhzWwkeQ+eT+UGeaLmtiys1xTs
         M5an7QhlnV3T3w7cwEPTBgQXD3eo1YBU/5K7hh/GWt83RzyUAHMscNGbFDZNQGnJ3U/l
         u1c6w9GE3AK5DjJXXCiXrWS34yA8y7ByBye1hH429iWoi+ED9l/zKAN8BqSYTOAlUHng
         1MNw==
X-Gm-Message-State: AC+VfDz1tbjvrj9Waeonv2SDd0ck+Gn1ZUlbO4AnYvjqFbknZhaA1NE2
        QLLmT8bKREidNPdpRlsWh9+mwg==
X-Google-Smtp-Source: ACHHUZ6rHOHjZwsR/NQbYQvCWcp01awhykTlGNHQgtFG0m+Bn7RXS9iwMN5OaI5vfYbefU7keMTF+g==
X-Received: by 2002:a2e:b1c9:0:b0:2b1:b0d2:5f03 with SMTP id e9-20020a2eb1c9000000b002b1b0d25f03mr1256932lja.15.1686321492843;
        Fri, 09 Jun 2023 07:38:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id h18-20020a2ea212000000b002a7853b9339sm408315ljm.119.2023.06.09.07.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 07:38:12 -0700 (PDT)
Message-ID: <56d170e9-bcde-094c-615f-636e2a8ccb13@linaro.org>
Date:   Fri, 9 Jun 2023 16:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: qcom: sa8540p-ride: Specify ethernet phy OUI
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        richardcochran@gmail.com, bmasney@redhat.com, echanude@redhat.com
References: <20230608201513.882950-1-ahalaney@redhat.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230608201513.882950-1-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.06.2023 22:15, Andrew Halaney wrote:
> With wider usage on more boards, there have been reports of the
> following:
> 
>     [  315.016174] qcom-ethqos 20000.ethernet eth0: no phy at addr -1
>     [  315.016179] qcom-ethqos 20000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
> 
> which has been fairly random and isolated to specific boards.
> Early reports were written off as a hardware issue, but it has been
> prevalent enough on boards that theory seems unlikely.
> 
> In bring up of a newer piece of hardware, similar was seen, but this
> time _consistently_. Moving the reset to the mdio bus level (which isn't
> exactly a lie, it is the only device on the bus so one could model it as
> such) fixed things on that platform. Analysis on sa8540p-ride shows that
> the phy's reset is not being handled during the OUI scan if the reset
> lives in the phy node:
> 
>     # gpio 752 is the reset, and is active low, first mdio reads are the OUI
>     modprobe-420     [006] .....   154.738544: mdio_access: stmmac-0 read  phy:0x08 reg:0x02 val:0x0141
>     modprobe-420     [007] .....   154.738665: mdio_access: stmmac-0 read  phy:0x08 reg:0x03 val:0x0dd4
>     modprobe-420     [004] .....   154.741357: gpio_value: 752 set 1
>     modprobe-420     [004] .....   154.741358: gpio_direction: 752 out (0)
>     modprobe-420     [004] .....   154.741360: gpio_value: 752 set 0
>     modprobe-420     [006] .....   154.762751: gpio_value: 752 set 1
>     modprobe-420     [007] .....   154.846857: gpio_value: 752 set 1
>     modprobe-420     [004] .....   154.937824: mdio_access: stmmac-0 write phy:0x08 reg:0x0d val:0x0003
>     modprobe-420     [004] .....   154.937932: mdio_access: stmmac-0 write phy:0x08 reg:0x0e val:0x0014
> 
> Moving it to the bus level, or specifying the OUI in the phy's
> compatible ensures the reset is handled before any mdio access
> Here is tracing with the OUI approach (which skips scanning the OUI):
> 
>     modprobe-549     [007] .....    63.860295: gpio_value: 752 set 1
>     modprobe-549     [007] .....    63.860297: gpio_direction: 752 out (0)
>     modprobe-549     [007] .....    63.860299: gpio_value: 752 set 0
>     modprobe-549     [004] .....    63.882599: gpio_value: 752 set 1
>     modprobe-549     [005] .....    63.962132: gpio_value: 752 set 1
>     modprobe-549     [006] .....    64.049379: mdio_access: stmmac-0 write phy:0x08 reg:0x0d val:0x0003
>     modprobe-549     [006] .....    64.049490: mdio_access: stmmac-0 write phy:0x08 reg:0x0e val:0x0014
> 
> The OUI approach is taken given the description matches the situation
> perfectly (taken from ethernet-phy.yaml):
> 
>     - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
>       description:
>         If the PHY reports an incorrect ID (or none at all) then the
>         compatible list may contain an entry with the correct PHY ID
>         in the above form.
>         The first group of digits is the 16 bit Phy Identifier 1
>         register, this is the chip vendor OUI bits 3:18. The
>         second group of digits is the Phy Identifier 2 register,
>         this is the chip vendor OUI bits 19:24, followed by 10
>         bits of a vendor specific ID.
> 
> With this in place the sa8540p-ride's phy is probing consistently, so
> it seems the floating reset during mdio access was the issue. In either
> case, it shouldn't be floating so this improves the situation. The below
> link discusses some of the relationship of mdio, its phys, and points to
> this OUI compatible as a way to opt out of the OUI scan pre-reset
> handling which influenced this decision.
> 
> Link: https://lore.kernel.org/all/dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com/
> Fixes: 57827e87be54 ("arm64: dts: qcom: sa8540p-ride: Add ethernet nodes")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 21e9eaf914dd..5a26974dcf8f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -171,6 +171,7 @@ mdio {
>  
>  		/* Marvell 88EA1512 */
>  		rgmii_phy: phy@8 {
> +			compatible = "ethernet-phy-id0141.0dd4";
>  			reg = <0x8>;
>  
>  			interrupts-extended = <&tlmm 127 IRQ_TYPE_EDGE_FALLING>;
