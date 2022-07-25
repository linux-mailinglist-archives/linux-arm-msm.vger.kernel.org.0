Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE643580284
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 18:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235175AbiGYQSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 12:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbiGYQSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 12:18:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0610F1571C
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:18:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id q23so5598270lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LfcvaXiE0JN8HCPiniZBMtz/AbK0xOVq0Sg2Gtmo2VE=;
        b=PiiavNoTr/u5jRkyzuiTfqyxaJRHzDFV/yqyUu1RiC1IKD2gXL4oVRgsLgCzosTFf5
         wjZvj20coLGK2rv7XElO1GRLmB8HhvBCGMHBsUpwgFq5Zg57WQ4pKQaJ3oGaO+wmmAAJ
         TMA6pj/7RbpS275t4IR8oFQURAVyyofUMtsEZnzF34khxdIK/rj05A4rTUEIzCEaXAU9
         Lm25HJzBV1KLWBtfmmI9E7/dyVswMFdejQP46TwW4hh2HkmgTHFaksQ1UibsJEm57zGN
         GGENnEPX9gJplG77EuklMPSM31r1/MSYqkvj9Q9TG2di95YfKIdCf+ATbTDc03ZeYx9k
         0GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LfcvaXiE0JN8HCPiniZBMtz/AbK0xOVq0Sg2Gtmo2VE=;
        b=7u8nmxkT0mA9M56SweR5J6GiO2o6xHT3vt/4gBJfMZAJGqoFLKCJ6tnQRtSd/b+Ykf
         YX9WcOq/EWYqG5yVx3bBEsqx814UIHja5X1QFWIiRINBkfdNM25j25XCkusPXZZkdJ0y
         EGatz/+2aBXOJkLldr3Nyw+8QdlFSfHHRIcgDjLgNp/zKxwnciL8xoivbbOQA9Y6eMcs
         mv04ZOrH+eG/5fij607RbG0gbVSS0r619PDeafKU1ucJm8YfMbfqnAjf8IxfnJoAZWsB
         lqyHmwyOoOTzDc+TIreRZ/i6Y4qaHue6Pn10HWq7wFvWNsqHwOMx/bVBmbtj0TxUzEZf
         UZjQ==
X-Gm-Message-State: AJIora/VzPtyEIbbQUDQb8XUU1BkBIxMX9GC297oJhj0Gb94GmNPoGPV
        gHF5Hq9iVYegtyd99Zl23YCn2w==
X-Google-Smtp-Source: AGRyM1sLhMNxGrNlrI1HOC8PGGP6QiK+WeQVDeKnrB20NdfsKWtEC6/IKAi1/zJrcmk6Z0V0E2kwpw==
X-Received: by 2002:a05:6512:15a0:b0:48a:7ca5:ae61 with SMTP id bp32-20020a05651215a000b0048a7ca5ae61mr4998410lfb.635.1658765931270;
        Mon, 25 Jul 2022 09:18:51 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id n20-20020a05651203f400b0048a93bd163fsm371443lfq.78.2022.07.25.09.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:18:50 -0700 (PDT)
Message-ID: <62982c58-2a06-0005-cb2f-ec78913da8e1@linaro.org>
Date:   Mon, 25 Jul 2022 18:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
 <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
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

On 24/07/2022 00:50, Dmitry Baryshkov wrote:
> On Sat, 23 Jul 2022 at 20:48, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 23/07/2022 11:09, Dmitry Baryshkov wrote:
>>> Describing each compatible board in DT schema seems wrong to me. It
>>> means that each new board is incompatible by default, until added to the DT
>>> schema.
> 
> s/incompatible/non-valid/
> 
>>
>> The bindings do not document something because it is or it is no
>> compatible. They document the compatible. Your patch essentially removes
>> the documentation, so there is no point in having compatibles in board
>> at all...
> 
> I do not quite agree here. Please correct me if I'm wrong.
> Schema defines which DT files are correct and which are not. Which
> properties are required, which values are valid, etc. So far so good.

Schema is a tool, we create here bindings. The bindings document what
you wrote above, plus compatibles and any other pieces mentioned in DT spec.

> For the device nodes it declares (or is willing to declare) all
> possible compatibility strings. There is a sensible number of on-chip
> IP blocks, external chips, etc. Each and every new chip (or new IP
> block) we are going to have a yaml file describing its usage. Perfect.
> For the machine compatibility lists the arm,qcom schema declares which
> machine compat strings are valid. And this looks like a problem. Now
> for the DT to be fully valid against DT schema, we have to define its
> machine compat string.

Although one of goals is to have schema compliance, that is not the
reason why we document compatibles. Compatibles were documented long
time ago before DT schema came, because the bindings require it.

Bindings define the interface between the DTS and software which uses
it. SW is kernel, bootloaders, user-space and some more.

> For each and every phone/sbc/evb we have to name it in schema. I think
> this is an overkill. 

Qualcomm is rather moderate, nothing big here so definitely it is not an
overkill. We almost do not have there SoMs. Just take a pick at
Freescale - this is much more complex than Qualcomm, so any changes
should start with that. Qualcomm's "complexity" is not a reason to do
anything...

> It feels like we are putting DT information
> (mapping form machine compat to SoC) into the DT schema.

No, we are documenting the compatible in bindings. Just like we always
did and we always had to.

> For qcs404 we already have a schema which uses three items: {},
> qcom,qcs404-evb, qcom,qcs404. This sounds like a perfect idea to me.
> We allow any board, created by Qualcomm, Google or any other random
> vendor, named Foo, Bar or Baz, as long as it declares that it is
> compatible with qcom,qcs404-evb.
> 
> To go even further. We now have the qrb5165-rb5.dts, declaring
> compatible = "qcom,qrb5165-rb5", "qcom,sm8250".
> If at some point I add a navigation/communication/whatever mezz on top
> of it. It would make sense to use compatible =
> "qcom,qrb5165-rb5-navi-comm", "qcom,qrb5165-rb5", "qcom,sm8250".
> Adding this to the growing list inside arm,qcom.yaml sounds like a
> nightmare. I can only hope that at some point JSON schema gains
> postfixItems support (as proposed) to be able to change e.g.
> arm,qcom.yaml to list just our qcom,something platforms as possible
> postfixItems for the schema.

Again, Qualcomm complexity is nothing compared to Freescale. :)

> 
> Regarding having compatibles in board files at all. I think that they
> are somehow misused nowadays. Instead of declaring that the
> Dragonboard 845c is compatible with "thundercomm,db845c",
> "qcom,sdm845-sbc", "96boards,ce-board", "96boards,iot-board",
> "qcom,sdm845", the DT file declares nearly useless
> "thundercomm,db845c", "qcom,sdm845".
> 
> Thus, if we (mostly) use machine compatible array to just define
> Vendor+device name and the underlying Qualcomm SoC, I propose to leave
> just a sensible part (SoC) in DT schema, while allowing any string in
> the first part.


No, because you miss then the purpose of bindings - to document the
compatible which is the important piece of interface between
DTS/bootloader/kernel/other OS/user-space.

To summarize, you propose to not document board compatibles. This is not
what we want, because then the next step is - let's don't document SoCs.
If you do not document it, means anyone can uniliteraly change it, e.g.
in kernel DTS, which will break all other users (e.g. user-space or
bootloaders) parsing the compatibles. And before you say - no one parses
the board compatibles - let me just say that several user-space
(embedded/closed) parse them, bootloaders parse them (U-Boot, Google's
Chromebooks and others)

Best regards,
Krzysztof
