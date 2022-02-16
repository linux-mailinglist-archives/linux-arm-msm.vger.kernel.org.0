Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0706B4B8B42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 15:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234946AbiBPOUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 09:20:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234933AbiBPOUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 09:20:39 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D605125D276
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 06:20:26 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id d14-20020a05600c34ce00b0037bf4d14dc7so1715260wmq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 06:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=wMfxI0Hd2SbSzakzeFPLxOWB5h6XEFlubm95jAhvb/o=;
        b=WGexOQIlhTvYMjSmv7dTY8NFq2DFmGwQTbEOeazPGATpb3ygAExomKrk9SgSuzoawm
         IazEfGjnuS8DygMSKN1qL1kVt3vi1UtK/DpMv7qd9m/KqOmyPLlBNu8Lub5BXlXDQqWW
         TftyBaX0AMsJ4w36HssvwqzC9CXwaLUhH6DmtmvLHgtxlwsRfX6TxpFPhsYA13FF0hU8
         +PnEY/TfqLHxsP1OCv7aI0vzQJCfG21iZl47KBmpCwK2LuMeARYQCAbrNX+XwEjbK6zH
         MCYPNfOHelDXiO0XCgtQCsbkUvd8rRlWaEAcMlN+y2F2S79T3gbNUvfRQ9HtCeVWs7ep
         FHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wMfxI0Hd2SbSzakzeFPLxOWB5h6XEFlubm95jAhvb/o=;
        b=QZk9JCnX4nn6vpJvSdZI6tm++vjm9SV50eUH6QXHk5iAuvKz6hINsviC1L/4tYaucY
         XwSpu1E5m1SerwTJocMTs/3x7uHrkxHtQdBnbnLy63Vmm8y4/+AUfq6lw5iuIJs+1O9F
         qcJdyURMZidC89+T6zEdGrmlBXQ7z7hsrOIQgNR2o8k6nMkfs1vFx0iAhMj0ifh/j1/y
         TDF/z1wwAqc1TGHIKH2Pis4uWdmAov9RaDvpEU+vb7F/bE4yDLjtj5ymfREX0S8xryar
         hVq3Wm6hIJjItexSP4cC4upfRSe+aaalJnhqIidTxRmAJ56p+vpYM49NOYSHu3pXSw4C
         CFzQ==
X-Gm-Message-State: AOAM5338hIrG6Mr3Y/VuAvSWNy3w1APZ+bM2l83mvAv64sTIn8H5PdFo
        zCP05N+T45i+/ehV8LykvxCv+w==
X-Google-Smtp-Source: ABdhPJw+HIMlxvyMyiZHqYnDAVhxDQCh9sJA/W3kdjGvLRtbtmg0yVD7Etvv2zoR3BXysQE3ej5LJw==
X-Received: by 2002:a05:600c:34c1:b0:352:41db:bc55 with SMTP id d1-20020a05600c34c100b0035241dbbc55mr1829647wmq.112.1645021225490;
        Wed, 16 Feb 2022 06:20:25 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id n11sm19555593wms.13.2022.02.16.06.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 06:20:24 -0800 (PST)
Message-ID: <a55e8624-7a90-e02f-9c52-5d5d2c825fd0@linaro.org>
Date:   Wed, 16 Feb 2022 14:20:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/7] Add pin control support for lpass sc7280
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
> This patch series is to split lpass variant common pin control
> functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.
> 
> Changes Since V5:
>      -- Create new patch by updating macro name to lpi specific.
>      -- Create new patch by updating lpi pin group structure with core group_desc structure.
>      -- Fix typo errors.
>      -- Sort macros in the make file and configuration file.
> Changes Since V4:
>      -- Update commit message and description of the chip specific extraction patch.
>      -- Sort macros in kconfig and makefile.
>      -- Update optional clock voting to conditional clock voting.
>      -- Fix typo errors.
>      -- Move to quicinc domain email id's.
> Changes Since V3:
>      -- Update separate Kconfig fields for sm8250 and sc7280.
>      -- Update module license and description.
>      -- Move static variables to corresponding .c files from header file.
> 
> Changes Since V2:
>      -- Add new dt-bindings for sc7280 lpi driver.
>      -- Make clock voting change as separate patch.
>      -- Split existing pincontrol driver and make common functions
>         as part of separate file.
>      -- Rename lpass pincontrol lpi dt-bindings to sm8250 specific dt-bindings
> 		
> Changes Since V1:
>      -- Make lpi pinctrl variant data structure as constant
>      -- Add appropriate commit message
>      -- Change signedoff by sequence.
> 
> Srinivasa Rao Mandadapu (7):
>    dt-bindings: pinctrl: qcom: Update lpass lpi file name to SoC specific
>    dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi pinctrl bindings
>    pinctrl: qcom: Update macro name to LPI specific
>    pinctrl: qcom: Update lpi pin group structure
>    pinctrl: qcom: Extract chip specific LPASS LPI code
>    pinctrl: qcom: Add SC7280 lpass pin configuration
>    pinctrl: qcom: Update clock voting as optional


Tested this on SM8250 MTP with WSA and WCD codecs

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> 
>   .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   | 133 -----------
>   .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     | 115 +++++++++
>   .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 133 +++++++++++
>   drivers/pinctrl/qcom/Kconfig                       |  16 ++
>   drivers/pinctrl/qcom/Makefile                      |   2 +
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           | 257 ++-------------------
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  87 +++++++
>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    | 170 ++++++++++++++
>   drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    | 166 +++++++++++++
>   9 files changed, 706 insertions(+), 373 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> 
