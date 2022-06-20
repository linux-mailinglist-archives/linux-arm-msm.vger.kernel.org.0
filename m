Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E943D551883
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 14:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242138AbiFTMNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 08:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242719AbiFTMNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 08:13:21 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0943885;
        Mon, 20 Jun 2022 05:12:56 -0700 (PDT)
Received: from [192.168.1.101] (abxh227.neoplus.adsl.tpnet.pl [83.9.1.227])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CBEAB20533;
        Mon, 20 Jun 2022 14:12:54 +0200 (CEST)
Message-ID: <cb15fe73-2805-7776-307d-02e1b175301c@somainline.org>
Date:   Mon, 20 Jun 2022 14:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/7] clk: qcom: gcc-msm8916: modernize the driver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.06.2022 23:27, Dmitry Baryshkov wrote:
> Please excuse me for the spam, I've erroneously sent v2 without the
> requested change.
> 
Please excuse me, I didn't notice and gave you R-bs on v2 instead..

Konrad
> Update gcc-msm8916 driver and bindings to use DT-specified clocks
> rather than fetching the clocks from the global clocks list.
> 
> Changes since v2:
>  - Use xo-board for the XO rather than RPM clock. This will be sorted
>    out separately (requested by Stephan Gerhold).
> 
> Changes since v1:
>  - None.
> 
> Dmitry Baryshkov (7):
>   dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
>   dt-bindings: clock: separate bindings for MSM8916 GCC device
>   clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of specifying
>     num_parents
>   clk: qcom: gcc-msm8916: move clock parent tables down
>   clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
>   clk: qcom: gcc-msm8916: use parent_hws/_data instead of parent_names
>   arm64: dts: qcom: msm8916: add clocks to the GCC device node
> 
>  .../bindings/clock/qcom,gcc-msm8916.yaml      |   61 +
>  .../bindings/clock/qcom,gcc-msm8976.yaml      |   21 +-
>  .../bindings/clock/qcom,gcc-msm8994.yaml      |   21 +-
>  .../bindings/clock/qcom,gcc-msm8996.yaml      |   25 +-
>  .../bindings/clock/qcom,gcc-msm8998.yaml      |   25 +-
>  .../bindings/clock/qcom,gcc-other.yaml        |    1 -
>  .../bindings/clock/qcom,gcc-qcm2290.yaml      |   25 +-
>  .../bindings/clock/qcom,gcc-sc7180.yaml       |   25 +-
>  .../bindings/clock/qcom,gcc-sc7280.yaml       |   21 +-
>  .../bindings/clock/qcom,gcc-sc8180x.yaml      |   25 +-
>  .../bindings/clock/qcom,gcc-sc8280xp.yaml     |   21 +-
>  .../bindings/clock/qcom,gcc-sdm845.yaml       |   25 +-
>  .../bindings/clock/qcom,gcc-sdx55.yaml        |   21 +-
>  .../bindings/clock/qcom,gcc-sdx65.yaml        |   21 +-
>  .../bindings/clock/qcom,gcc-sm6115.yaml       |   25 +-
>  .../bindings/clock/qcom,gcc-sm6125.yaml       |   25 +-
>  .../bindings/clock/qcom,gcc-sm6350.yaml       |   25 +-
>  .../bindings/clock/qcom,gcc-sm8150.yaml       |   25 +-
>  .../bindings/clock/qcom,gcc-sm8250.yaml       |   25 +-
>  .../bindings/clock/qcom,gcc-sm8350.yaml       |   21 +-
>  .../bindings/clock/qcom,gcc-sm8450.yaml       |   21 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |   14 +
>  drivers/clk/qcom/gcc-msm8916.c                | 1020 +++++++++--------
>  23 files changed, 669 insertions(+), 870 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
> 
