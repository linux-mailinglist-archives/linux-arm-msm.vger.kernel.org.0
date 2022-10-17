Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703C9600E04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 13:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiJQLrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 07:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiJQLq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 07:46:59 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AFEDAF;
        Mon, 17 Oct 2022 04:46:58 -0700 (PDT)
Received: from cp.tophost.it (vm1054.cs12.seeweb.it [217.64.195.253])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 9C8181F949;
        Mon, 17 Oct 2022 13:46:56 +0200 (CEST)
MIME-Version: 1.0
Date:   Mon, 17 Oct 2022 13:32:27 +0200
From:   konrad.dybcio@somainline.org
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: qcom: ipq8064-rb3011: Add SoC compatible
In-Reply-To: <20221017014653.12970-2-krzysztof.kozlowski@linaro.org>
References: <20221017014653.12970-1-krzysztof.kozlowski@linaro.org>
 <20221017014653.12970-2-krzysztof.kozlowski@linaro.org>
User-Agent: Roundcube Webmail/1.4.6
Message-ID: <ef456d5900fdca381d1f796e5e55041c@somainline.org>
X-Sender: konrad.dybcio@somainline.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-10-17 03:46, Krzysztof Kozlowski wrote:
> Add qcom,ipq8064 compatible fallback for the SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> index 5a65cce2500c..162c9c50e301 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> +++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> @@ -5,7 +5,7 @@
> 
>  / {
>  	model = "MikroTik RB3011UiAS-RM";
> -	compatible = "mikrotik,rb3011";
> +	compatible = "mikrotik,rb3011", "qcom,ipq8064";
> 
>  	aliases {
>  		serial0 = &gsbi7_serial;
