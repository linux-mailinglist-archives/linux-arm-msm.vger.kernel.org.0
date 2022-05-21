Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C8352FDCA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346587AbiEUPXg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239672AbiEUPXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:23:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7855DD31;
        Sat, 21 May 2022 08:23:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DC82DB8068B;
        Sat, 21 May 2022 15:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40760C385A5;
        Sat, 21 May 2022 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653146612;
        bh=1sBaKTEpZUECoimbgq+v+Won0gG8MA7P4JfOdXHmcb8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Q4uAWMdURThdouxbJ7OeAFHlecKohVcBjavYiKf4jOBZWi7e3dzbXQlF3ffs02ouW
         qKq+7HkloWb/wIWsSjMihq+tsBQAeeIpXxnybGUYrUAEk76B4RtklTzqX1SPj5wvQz
         ijhMZYpPosefPRa8/KZEGofMCPCAlgQoIHGsECd8LJkkTSAaHYI5IRLri+7qlSDUlW
         dljG1Xsr7xmNZDfU7tRiTlb0zTN7mHWfWLrxSgoWYVmScj14FdKdpaGV3Qbbniw+qq
         2+DEDrDE6ApikBJJIh/C5Ku5tsxmhp4HKLyoUUyw0TP5ISIv1SDzkkt6R9CUzH2zv5
         AA2WPpkSrs7Tw==
Message-ID: <89411cf4-5407-9ef8-e264-cd38dc206425@kernel.org>
Date:   Sat, 21 May 2022 17:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: qcom,gcc-apq8064: move msm8960
 compat from gcc-other.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
 <20220521151437.1489111-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220521151437.1489111-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2022 17:14, Dmitry Baryshkov wrote:
> MSM8960 shares the design (and the driver) of the global clock
> controller with APQ8064. Move it from clock/qcom,gcc-other.yaml to
> clock/qcom,gcc-apq8064.yaml.
> 
> As the example in gcc-other.yaml was using qcom,gcc-msm8960 compat string,
> change it to qcom,gcc-msm8974.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
