Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BA15609AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 20:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbiF2Ss1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 14:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbiF2SsO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 14:48:14 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354E93ED2E
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 11:48:06 -0700 (PDT)
Received: from [192.168.1.101] (abxh53.neoplus.adsl.tpnet.pl [83.9.1.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 45E043F827;
        Wed, 29 Jun 2022 20:48:03 +0200 (CEST)
Message-ID: <256312fd-d93f-3711-b2fe-b30c636c3dc8@somainline.org>
Date:   Wed, 29 Jun 2022 20:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sdm660: move device nodes to
 sdm636
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
 <20220521203520.1513565-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220521203520.1513565-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.05.2022 22:35, Dmitry Baryshkov wrote:
> The sdm636 is a lighter version of sdm660. It lacks Turing DSP (cdsp)
> and has slightly different CPU speed and Adreno version.
> 
> Reflect this by moving all common device nodes from sdm660.dtsi to
> sdm636.dtsi and including the later file from the former one. Currently
> this is implemented in the opposite direction, sdm636 includes sdm660,
> thus adding cdsp support would require adding delete-node statements to
> sdm636.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
