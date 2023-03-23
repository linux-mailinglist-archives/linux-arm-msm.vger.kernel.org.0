Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3416C6F0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbjCWRcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbjCWRbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:31:41 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E9534010
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:30 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p34so9094608wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679592689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZoadvcYq3zRwthELt1OcUAmnTDKQKRIcaDoyBrhRZA=;
        b=VLveLU9J+QeBh215ifoeTa68GNJ6XnGXxi14qRrRdJXmx9BheChOG2e0myzeyecdep
         ld7s3KBVeZtzWrmonSYbSVeThlxtoxKFnsmxDhxbsjWZVPTTDvZccQ2JT4s1lTmY4c0f
         RxF34v/P/RFwZBINNwxSu9lCe7dIXMsKPBIJfRwWawHhjjbexP8I+AuAyTmoCETYTs6b
         Nb0hMis6IL12GUecZeYXtFxa2pJSgMaw7t6LT/44tylUpbvWjCZvUveL6sy5NTtKr7xa
         UoWXYj2tTyHtoycZyJJypALOg7TELUuzSTBxL+zf6AEOB6WmpcPxB5n29+7iGt8xTn/b
         YgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZoadvcYq3zRwthELt1OcUAmnTDKQKRIcaDoyBrhRZA=;
        b=FTrqmSydIcRk07rsWd38jJgkbBQt315mv8phIT8QrC3b4vNwFIW7LO34LJJAtqq3OC
         Wh6DJTDU3eSWMNAYvdok4vjM2U1TaTFgILmRKiS2XqeN32lBpLB8q7CEia6jCXdntKIp
         vOzJYueAaciyQZTC9PLIWoloOrQ5IU9F6alZyVjKYaX60qa1Do6bGiIo5uzUuT1Iqf+U
         S/HlhHdthTbsy9IgseblZwZi+RZukhDqAEJsOeq/cHuTkv2jxMPOiTQMTSJrvHiWQChV
         nTe6yRdIzTyQ5cRPpXKdCv5bqZQWKE30TCZXQeMzdlCuEILFLjEctxneGL5PHPizlo52
         Y73A==
X-Gm-Message-State: AO0yUKXpPQFbtArqwVqO9+rfxmIpgz8PvI3khP90Z+ml91XQa30aKNcR
        BEP2DjivEqbLu71R8nHPJdTAQw==
X-Google-Smtp-Source: AK7set83huOmWhiPusaKxwZNwqntCmiNrQGjDUyek4mZJSGXP+U7yZfPhNZsrXKF29pmLssRQx2KGA==
X-Received: by 2002:a05:600c:218d:b0:3ed:9576:34ce with SMTP id e13-20020a05600c218d00b003ed957634cemr336352wme.9.1679592688900;
        Thu, 23 Mar 2023 10:31:28 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19-20020a05600c3c9300b003ede2c4701dsm2621824wmb.14.2023.03.23.10.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 10:31:28 -0700 (PDT)
Message-ID: <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
Date:   Thu, 23 Mar 2023 17:31:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZBxkB04KqY8WbeA1@Gentoo>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZBxkB04KqY8WbeA1@Gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 14:36, Jianhua Lu wrote:
>> +	/* Poll waiting for transition to required vSafe5V or vSafe0V */
>> +	ret = regmap_read_poll_timeout(pmic_typec->regmap,
>> +				       pmic_typec->base + TYPEC_SM_STATUS_REG,
>> +				       sm_stat, sm_stat & val,
>> +				       100, 250000);
> This statement isn't very useful and will case a error,
> After I remove it, usb-c works well. What's about dropping this statement?
> 
> [   63.030672] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> [   63.030702] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
> [   63.030895] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230ffe5 hci version 0x110 quirks 0x0000000000010010
> [   63.030926] xhci-hcd xhci-hcd.1.auto: irq 168, io mem 0x0a600000
> [   63.031043] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> [   63.031054] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
> [   63.031063] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.1 Enhanced SuperSpeed
> [   63.031835] hub 1-0:1.0: USB hub found
> [   63.031863] hub 1-0:1.0: 1 port detected
> [   63.032151] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [   63.032690] hub 2-0:1.0: USB hub found
> [   63.032713] hub 2-0:1.0: 1 port detected
> [   63.168912] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: vbus vsafe5v fail
> [   63.169185] xhci-hcd xhci-hcd.1.auto: remove, state 1
> [   63.169195] usb usb2: USB disconnect, device number 1
> [   63.178808] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
> [   63.178825] xhci-hcd xhci-hcd.1.auto: remove, state 1
> [   63.178832] usb usb1: USB disconnect, device number 1
> [   63.182114] hub 1-0:1.0: activate --> -19
> [   63.182791] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered

Interesting.

What's your hardware configuration ? Could it be you don't have the VBUS 
regulator pointed to the correct place ?

&pm8150b_vbus {
	regulator-min-microamp = <500000>;
	regulator-max-microamp = <3000000>;
	status = "okay";
};

&pm8150b_typec {
	vdd-vbus-supply = <&pm8150b_vbus>;
};

i.e. something else on your board supplies VBUS ?

vSafe5V should indicate to the controller that you have successfully 
switched on vBus, so what this indicates to me is that on your hardware 
VBUS either hasn't been asserted or hasn't been detected.

Can you show the printout of *(pmic_typec->base + TYPEC_SM_STATUS_REG) ? 
And can you check your schematics and verify VBUS is supplied by 
pm8150b_vbus and not say by an external IC ?

---
bod
