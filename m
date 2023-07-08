Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B002D74C012
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 01:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjGHXtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 19:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjGHXtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 19:49:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5624C1BF
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 16:49:23 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso5065764e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688860161; x=1691452161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vgv5u791CzVky0vBXeKG+F8pBApIGVbdfqDFjtqV08s=;
        b=Ncb8R50MmuuW3bLrx53ceadY2sawS6C/+F+4J5idq+y1TanW/FXUKFRNnqThAhmvBH
         kS3AwBlamVcFpq3CVf6cpraeqdtlZzo/OjXT2Oy9jAta8sLQSeXOjKyvqW9Fy85kvjo6
         qbSEsQc1qYuInpU4ATy+0k6dzMqKFryhxrXlycUfg4QrOM8TwbVFbLjxbQ0h1WpjFLtq
         YgaCq01ZlXjsHhraku1m4sPTimJGYvlxzeSolKxkWn81bKe0xsgT3L2dXXc7iGNnk2Ar
         hWk/TST/vg3iFzuUv/aMkI/LES1pI9UFLxqNDssFt2tHG4B7YHh5znYtxRZyJA7gINYS
         U6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688860161; x=1691452161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vgv5u791CzVky0vBXeKG+F8pBApIGVbdfqDFjtqV08s=;
        b=bDewMiR9oFi9utaxqdt8nAXfnR+G1Ef+HoJur89nA/ro1LgXO5xqR5+PMeuHRYt3oB
         ln35zvpa7qAm6jeDcjdjJt496+XOyTW1XaNW8A4rszUhlGKPkCKx03Tqgl3lNVmF2a7O
         7te4PlBnvaQZTHGOgguo8dxhWz38bQDE/hX9KCxwXdyvhUZKwELNdUPjqIlcF5lGaNRf
         6CFkeTTOITtgrfTEZ02B4b5lJHvYd4xiEJLASVKb7XF8MJVXKVhYipCtYrLCpaakKh51
         N/GhTLHz6+UEQcaj8D4iQIEhjUrFZoYqqemSf8Sx4eGAY7egREpRo5atj3J11WPDyu9u
         ENmA==
X-Gm-Message-State: ABy/qLaZqHeYmuCh30PBE+WXnO4vzkowE8uRks4qkgvw9VHf7nuJCqQz
        UjG7Fhve9n1ACX8ViybMXRjJiQ==
X-Google-Smtp-Source: APBJJlHtOJPmKYW93U8ytAF98inZOUA9QvYgc00a3TYadRgRfvQRwrjpmRnDZ0zVNYVKoO+BuRK2oA==
X-Received: by 2002:ac2:465b:0:b0:4fb:8b2a:5e09 with SMTP id s27-20020ac2465b000000b004fb8b2a5e09mr6169195lfo.43.1688860161591;
        Sat, 08 Jul 2023 16:49:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c23-20020ac24157000000b004fb743b3ea0sm1156266lfi.115.2023.07.08.16.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 16:49:21 -0700 (PDT)
Message-ID: <c48c5f9b-eb6d-3f44-0128-d6ac35110add@linaro.org>
Date:   Sun, 9 Jul 2023 02:49:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 00/11] Add Qualcomm PMIC TPCM support
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        lujianhua000@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 16:36, Bryan O'Donoghue wrote:
> Bootable tree
> Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/usb-next-23-05-14-qcom-wrapper-typec-mux-bjorn
> 
> V8:
> - Makes pm8150b_typec::status = disabled by default - bod
> - Greg merged the TCPM description and driver to usb-next so two patches less now.
>    I've rebased this series on to usb-next using "--base=auto"
>    All of the kernel robot dts/yaml checks should now pass against usb-next / a4422ff221429c600c3dc5d0394fb3738b89d040
> 
> V7:
> - Adds R/B to "dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output ports" - Krzysztof
> - Fixes indicated, adds R/B to "dt-bindings: usb: Add Qualcomm PMIC Type-C" - Krzysztof
> - Fixes indicated, adds R/B to "usb: typec: qcom: Add Qualcomm PMIC Type-C driver" - Guenter
> - Fixes indicated, adds R/B to "usb: typec: qcom: Add Qualcomm PMIC Type-C driver" - Caleb
> - Adds R/B to "arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching" - Konrad
> - Adds R/B to "arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost" - Konrad
> - Fixes indicated, adds R/B to "arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM" - Jianhua, Konrad
> - Connector ports/endpoints left inside of connector
>    Documentation/devicetree/bindings/connector/usb-connector.yaml - Jianhua
> - dwc3_role_switch_in -> usb_1_dwc3_role_switch_in
>    qmpphy_typec_mux_in -> usb_1_qmpphy_typec_mux_in
>    Both ports/endpoints defined inside of pm8150b dtsi - Konrad
> 
>    I modified the name of both so that the port/endpoint would be directly
>    adjacent to the containing node in the dtsi file for code locality/readbility - bod
> 
> - Fixes newline indicated "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1" - Jianhua, Konrad
> - Fixes newline indicated "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy" - Jianhua, Konrad
> 
> - connector
>    I have left the connector defintion and its ports/endpoints in the platform dts
> 
>    The reason for this
>    a) Prior art e.g. arch/arm64/boot/dts/qcom/sc8280xp*
>    b) The connector is really a non-SoC/PMIC component its something that is defined
>       for your platform.
> 
>    I'm open to further debate on this topic:
>    Link: https://imgflip.com/i/7kw6ck
> 
> - port@1 -> port@1 "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy" - Jianhua
> 
> - OF: graph: no port node found in /soc@0/spmi@c440000/pmic@2/typec@1500
> 
>    I left this as-is since the DT model we want is to connect the connector directly to
>    the PHY for orientation or controller for data-role switching
> 
>    I similarly didn't put this hack in place to remove the warning but "it would work"
> 
> V6:
>   - I'm dropping the previous V1-V6 log because the text is getting too long
>     here's a link to the previous cover letter instead
>     Link: https://lore.kernel.org/linux-arm-msm/20230501121111.1058190-1-bryan.odonoghue@linaro.org/
> 
> 
> Bryan O'Donoghue (11):
>    dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
>    dt-bindings: regulator: qcom,usb-vbus-regulator: Mark
>      regulator-*-microamp required
>    dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch
>      as optional
>    dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output
>      ports
>    dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
>    arm64: dts: qcom: sm8250: Define ports for qmpphy
>      orientation-switching
>    arm64: dts: qcom: pm8150b: Add a TCPM description
>    arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
>    arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
>    arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for
>      usb_1
>    arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for
>      usb_1_qmpphy
> 
>   .../bindings/mfd/qcom,spmi-pmic.yaml          |  4 ++
>   .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 44 +++++++++++++++
>   .../regulator/qcom,usb-vbus-regulator.yaml    | 10 +++-
>   arch/arm64/boot/dts/qcom/pm8150b.dtsi         | 40 +++++++++++++
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      | 56 ++++++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 18 ++++++
>   6 files changed, 170 insertions(+), 2 deletions(-)

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

