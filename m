Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45EF073DEB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 14:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjFZMR7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 08:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjFZMR6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 08:17:58 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7911BDD
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 05:17:30 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b69f1570b2so17035401fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 05:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687781836; x=1690373836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2hW2XWePew0FaBfSk0kn2Xd1wwZNr5FFaq2x3qcrQ0E=;
        b=XL4iiJYximrR10AfQw9NpMIuARprgWMdDcyUyu5GQVRIW2gWruK4ksuVWvdIYbtFjz
         /L+nwmeQ7TCoWeWWLjRlSmD8J0L76h/4J9LPc2pI76IkEPQsYeMhV6WY10wzMcSmISoV
         ZohmtMscdhJtmAU/e8FaGbKv9BSEOdGc6X9ku+fcOwUQSgVv8FBVaq+GUmOfLszJEF+J
         Sq+zuctXU2H7GvrnO9zDIWfatqQv7sMETZn1VfHAXNH5x4T6F+OdT0cCEV1jAjwQx6+b
         hvTe3Ijn3jrD6+yZHjuXC/lDkXwxT1O10pAr1CFmHkhvR6o4nmgDcBDqkB0zODeh6chk
         YvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687781836; x=1690373836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hW2XWePew0FaBfSk0kn2Xd1wwZNr5FFaq2x3qcrQ0E=;
        b=hb+7XkozKL6YB7GU/NntCaYSI3XViAoHdH/7fjTEKXljGR1iuaF2EQxE8DmDBxPf2u
         QRKijwzYRaeFSW9RUuWJLiJo+ZZZYmgYMSCn5JsyM79nIgnECtXzzlvAZlIY+Hvi0n9E
         9Zp5Xv5HZcZkrT3gyzBcO2mpML16iKsKKIhDzakYzT5x0sh4p/xj7YWR9u1tPuVH4wbi
         twzizSn8B5fJTOelkhpDklFNTOebLPi3R6aWj4z9ZWkWWKMdr5ISIARfWMrIjuy0+4d5
         OMwGausfw4MNQeWTr2sLi/lDaQJuISXsPMGl3JFwS6Y1jvPKjk9LcQg+6y65FRU2dGej
         EabQ==
X-Gm-Message-State: AC+VfDxD/OePOJxlzCuYhBshRoqd41Io7ihbFy4tfjcYllBGWaFAM8DM
        uc2Ij5h/fWNUJF3V3kbPQvkhjA==
X-Google-Smtp-Source: ACHHUZ5kPqeOQ9eJEntrldey/V3FngkwLWOsWYDf43OIjheJBcwE8bJXaDoSROYBW84A7iqIku/WPg==
X-Received: by 2002:a2e:96c3:0:b0:2b6:9909:79cb with SMTP id d3-20020a2e96c3000000b002b6990979cbmr3041934ljj.42.1687781836098;
        Mon, 26 Jun 2023 05:17:16 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id a12-20020a2eb16c000000b002b69f64b08asm664247ljm.37.2023.06.26.05.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 05:17:15 -0700 (PDT)
Message-ID: <64ccb614-51e4-9b04-247a-4abc2b60d965@linaro.org>
Date:   Mon, 26 Jun 2023 14:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v6 5/8] arm64: dts: qcom: sc7280: Add LPASS PIL node
Content-Language: en-US
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        andersson@kernel.org, broonie@kernel.org, agross@kernel.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, judyhsiao@chromium.org,
        quic_visr@quicinc.com,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <20230616103534.4031331-1-quic_mohs@quicinc.com>
 <20230616103534.4031331-6-quic_mohs@quicinc.com>
 <353fe482-62f7-6252-5123-6907f84762b9@linaro.org>
 <c875c617-25d2-04d8-0ab7-f7e8380348c9@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c875c617-25d2-04d8-0ab7-f7e8380348c9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26.06.2023 13:07, Mohammad Rafi Shaik wrote:
> 
> On 6/16/2023 4:55 PM, Konrad Dybcio wrote:
>> On 16.06.2023 12:35, Mohammad Rafi Shaik wrote:
>>> From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>>
>>> Add LPASS PIL node for sc7280 based audioreach platforms.
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> ---
>> The node should reside in the SoC DTSI, ideally the bindings should
>> be compatible with the PAS setup to the point where only a compatible
>> swap is needed..
>>
>> Konrad
> Thanks for comment,
> 
> The base SOC DTSI file already has an entry with the same physical base address which is using for ADSP BYPASS solution.
> For Audioreach solution required the same base address for the remoteproc device tree node.
> 
> Will create a new common dtsi file for Audioreach as suggested by you in previous patch and add this in that common dtsi file.
> 
> Please confirm is it okay ?
Let me copypaste the same answer I gave you to your off-list reply because
you seem to not have read it:


Taking a closer look, the qdsp6ss region is only used in combination
with PIL mode.. Perhaps it could be remodeled such that:

lpasscc only maps the top_cc region and the single clock within
(which lets us remove the pil-mode property)

qcom_q6v5_adsp takes care of everything inside the qdsp6ss region
(so, toggling the branches)


This would prevent us from trying to map the block @ 0x03000000 twice.

Konrad
> 
> Rafi.
> 
>>>   .../sc7280-herobrine-audioreach-wcd9385.dtsi  | 90 +++++++++++++++++++
>>>   1 file changed, 90 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> index 95d3aa08ebde..9daea1b25656 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> @@ -7,6 +7,8 @@
>>>    */
>>>     #include <dt-bindings/sound/qcom,q6afe.h>
>>> +#include <dt-bindings/clock/qcom,lpass-sc7280.h>
>>> +#include <dt-bindings/soc/qcom,gpr.h>
>>>     /{
>>>       /* BOARD-SPECIFIC TOP LEVEL NODES */
>>> @@ -105,4 +107,92 @@ platform {
>>>               };
>>>           };
>>>       };
>>> +
>>> +    remoteproc_adsp: remoteproc@3000000 {
>>> +        compatible = "qcom,sc7280-adsp-pil";
>>> +        reg = <0 0x03000000 0 0x5000>, <0 0x0355b000 0 0x10>;
>>> +        reg-names = "qdsp6ss_base", "lpass_efuse";
>>> +
>>> +        interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
>>> +                      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&adsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +        interrupt-names = "wdog", "fatal", "ready",
>>> +                  "handover", "stop-ack",
>>> +                  "shutdown-ack";
>>> +
>>> +        qcom,qmp = <&aoss_qmp>;
>>> +
>>> +        clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +             <&gcc GCC_CFG_NOC_LPASS_CLK>;
>>> +        clock-names = "xo", "gcc_cfg_noc_lpass";
>>> +
>>> +        iommus = <&apps_smmu 0x1800 0x0>;
>>> +
>>> +        power-domains =    <&rpmhpd SC7280_CX>;
>>> +        power-domain-names = "cx";
>>> +
>>> +        required-opps = <&rpmhpd_opp_nom>;
>>> +
>>> +        resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
>>> +             <&aoss_reset AOSS_CC_LPASS_RESTART>;
>>> +        reset-names =  "pdc_sync", "cc_lpass";
>>> +
>>> +        qcom,halt-regs = <&tcsr_1 0x3000 0x5000 0x8000 0x13000>;
>>> +
>>> +        memory-region = <&adsp_mem>;
>>> +
>>> +        qcom,smem-states = <&adsp_smp2p_out 0>;
>>> +        qcom,smem-state-names = "stop";
>>> +
>>> +        glink-edge {
>>> +            interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
>>> +                          IPCC_MPROC_SIGNAL_GLINK_QMP
>>> +                          IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +            mboxes = <&ipcc IPCC_CLIENT_LPASS
>>> +                 IPCC_MPROC_SIGNAL_GLINK_QMP>;
>>> +
>>> +            label = "lpass";
>>> +            qcom,remote-pid = <2>;
>>> +
>>> +            gpr {
>>> +                compatible = "qcom,gpr";
>>> +                qcom,glink-channels = "adsp_apps";
>>> +                qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>>> +                qcom,intents = <512 20>;
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                q6apm: service@1 {
>>> +                    compatible = "qcom,q6apm";
>>> +                    reg = <GPR_APM_MODULE_IID>;
>>> +                    #sound-dai-cells = <0>;
>>> +
>>> +                    q6apmdai: dais {
>>> +                        compatible = "qcom,q6apm-dais";
>>> +                        iommus = <&apps_smmu 0x1801 0x0>;
>>> +                    };
>>> +
>>> +                    q6apmbedai: bedais {
>>> +                        compatible = "qcom,q6apm-lpass-dais";
>>> +                        #sound-dai-cells = <1>;
>>> +                    };
>>> +                };
>>> +
>>> +                q6prm: service@2 {
>>> +                    compatible = "qcom,q6prm";
>>> +                    reg = <GPR_PRM_MODULE_IID>;
>>> +
>>> +                    q6prmcc: clock-controller {
>>> +                        compatible = "qcom,q6prm-lpass-clocks";
>>> +                        #clock-cells = <2>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>>   };
