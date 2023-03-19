Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC686C00F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjCSLpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjCSLpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:45:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124867EC5
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:45:17 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id cy23so36577461edb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AALslAoe0f58x/upghvBm4otytb7e+6cZvcVGnQerVQ=;
        b=e2OGjR1atPlKu7+s+mYVotkapnFiukp2s8xnlTkl9ByrbpDeTDdDZBfCI2+6cFwF7p
         Jp+JUatbwrt5W7b253/Ig2xAeavK7LhjQSWwyHIPWEVFuPeePePMy4SHE/PQ3Ub2BsvJ
         BlMdcb8StWW8oJe6YN5z382Mw0HOrUvQtpH2m2CTVofC5artMeaHvQiTLYm9KIibtl5J
         t6DmSf4E+YKDLAiXYWrJhz1oFbE225sF2EAsXxmIjf0LZiPIOPv392RplXC017bBNTw3
         vwYnptZSk/nvev6XFAnSC5rmDdsWYaJDx2/u7yc9v0ywZ6Fqw9SDMEx5AevMtYkFSbJ+
         IQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AALslAoe0f58x/upghvBm4otytb7e+6cZvcVGnQerVQ=;
        b=fl8D6lKz1kALbwX5FrslsRHk7SwMA1a4nCOaRIXvURveORsQMwjGaJCb7EX4qIknYR
         IIZ/cfJ/+CpCm58C7SERdciiiUj+c/Dh6ediexczmpX8yuR+eSsm/gYhQ9UkEulDjruj
         reZKct0R1bvy7h8C0qJAzZY7hfD/8S716N6sW6IOAnRmwvdvW3KwPEPTiLfBRfogMQpS
         Sqbdw2e8Tbapz1uVNuZkLG1ZecOLGyxhLuhS/XGnz620qCRBap7K2xMuFDKX21ivDhB1
         AP5ah9exlUhv3ueaCzLETVMOcdgHzTI1EiS0jwy2Eqw+mYrjfEBk1zeuximFhmZ7ICOe
         6Sgw==
X-Gm-Message-State: AO0yUKW1F82az/gcPMPzCE2J7D5SFfvyYzVeNz/9ivqEDIU2piOP3QT5
        0RVJyxLyJC5Ct9jjNEMQbf/sAA==
X-Google-Smtp-Source: AK7set+0oXTC/dEnNMVy9Bqhp4rQGj2tLFPaI0y4BxXG05Rp3tXvivQ+BWYXcp+yv4ux7JzpiEUpAg==
X-Received: by 2002:a17:906:ad85:b0:889:5686:486a with SMTP id la5-20020a170906ad8500b008895686486amr5490178ejb.30.1679226315603;
        Sun, 19 Mar 2023 04:45:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id x11-20020a1709064a8b00b009342fe44911sm267900eju.123.2023.03.19.04.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:45:14 -0700 (PDT)
Message-ID: <3f5efb36-f9be-0816-b9cc-dc87966552cc@linaro.org>
Date:   Sun, 19 Mar 2023 12:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 04/18] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add port as an optional
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> port is required to instantiate a remote-endpoint which can receive
> orientation-switch messages from a Type-C mux.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> index 52886cdb0e506..1c887e34b1223 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> @@ -65,6 +65,12 @@ properties:
>      description: Flag the port as possible handler of orientation switching
>      type: boolean
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node to link the PHY to a TypeC controller for the purpose of
> +      handling altmode muxing and orientation switching.

Please extend the example as well.

Don't you have there two ports? USB and DP?

Best regards,
Krzysztof

