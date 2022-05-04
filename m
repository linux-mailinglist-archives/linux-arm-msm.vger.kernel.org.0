Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2FB51A4CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 17:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345462AbiEDQCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 12:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352692AbiEDQCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 12:02:38 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E14C46648
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 08:59:02 -0700 (PDT)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 00E4F3F857;
        Wed,  4 May 2022 17:58:59 +0200 (CEST)
Message-ID: <24a5d46f-162a-95a2-6a81-f1193c30b37b@somainline.org>
Date:   Wed, 4 May 2022 17:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: sdm630: disable GPU by default
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
 <20220503220927.960821-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220503220927.960821-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 04/05/2022 00:09, Dmitry Baryshkov wrote:
> The SoC's device tree file disables gpucc and adreno's SMMU by default.
This should not be the case, but
> So let's disable the GPU too. Moreover it looks like SMMU might be not
> usable without additional patches (which means that GPU is unusable
> too).

it will only be fixed after iommu changes (hopefully) land one day..


> No board uses GPU at this moment.
>
> Fixes: 5cf69dcbec8b ("arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 240293592ef9..45eaaa6a4a74 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1050,6 +1050,8 @@ adreno_gpu: gpu@5000000 {
>   
>   			operating-points-v2 = <&gpu_sdm630_opp_table>;
>   
> +			status = "disabled";
> +
>   			gpu_sdm630_opp_table: opp-table {
>   				compatible  = "operating-points-v2";
>   				opp-775000000 {
>
