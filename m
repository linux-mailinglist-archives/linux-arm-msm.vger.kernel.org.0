Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE21752FE2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbiEUQhw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243521AbiEUQhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:37:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFC360D90;
        Sat, 21 May 2022 09:37:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE475B808BC;
        Sat, 21 May 2022 16:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3840C385A5;
        Sat, 21 May 2022 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653151062;
        bh=oLAo7yoCIIJydsY2tXSPp0MW8Xnzu9IsjAh2zBPQAtI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DKKm5Y7tM0gSXmHEndCZolm0CK7SQisTs0ONk8+uP7CaKvS58Z5CHSu2ksNiMnqNY
         dnPLoinO++K0LQAHDE8hPITnLSobPt3212wFir9lJq67802KdtHyl9C53hInzigcrb
         Yovk4B6HD5tSTBfUbN0WMLtgiC2wICaB1/VYaC0gjt0YkQAB3Z5QjqPJDGiqGQ915A
         gO6VMs9+JiaKYK8zjK62Lc+FxqFm2DVpd6FtMKJDeL6KE7Jy1DPwe1c4wK9/RPeIN2
         ACeRvDxVt5L/R5bvFWiCqpLmbErdYQ+wGEju0aP9KfMHTqoWbqCRaoj7vMuSv66iFt
         sAcV2BdTOnygw==
Message-ID: <a1adf68a-f6a4-1c01-f539-1bf3e21ce00b@kernel.org>
Date:   Sat, 21 May 2022 18:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 11/11] dt-bindings: arm: qcom: document sda660 SoC and
 ifc6560 board
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-12-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220521152049.1490220-12-dmitry.baryshkov@linaro.org>
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

On 21/05/2022 17:20, Dmitry Baryshkov wrote:
> Add binding documentation for the Inforce IFC6560 board which uses
> Snapdragon SDA660.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 129cdd246223..ac4ee0f874ea 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -41,6 +41,7 @@ description: |
>          sa8155p
>          sc7180
>          sc7280
> +        sda660

I wanted to base my work on top of it, but this patch does not apply. I
think you based it on something out of date, also judging by my old
email address you are using (in each patchset). The patches should be
based on current development tree.


Best regards,
Krzysztof
