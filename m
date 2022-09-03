Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA4F5AC0F6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Sep 2022 20:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbiICS5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Sep 2022 14:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbiICS5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Sep 2022 14:57:42 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB73258514;
        Sat,  3 Sep 2022 11:57:36 -0700 (PDT)
Date:   Sat, 03 Sep 2022 18:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1662231454; x=1662490654;
        bh=VGJCbi9E6zy+TDpVAJ4LsqUBDPR7B/yyFMQeaOxR41o=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=fVMTwm4DFu+oc04zTLBFZaHM6EWsuHa2/n1xMCaGUUUM7HcG6NxjYB7AVGbE+oiuE
         lAg3gpV9SsQd9FB8io7BfmeNNFwG6+bxwEiY97Jokqnk6+ku1fu5Pai2yb8AO941bq
         MGM5m+FCG8IYf7F0tZN1c1B6fA1LTdIq4n4XlwVY=
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v2 3/9] dt-bindings: nvmem: Add SoC compatible for sm6115
Message-ID: <4e9f32d1-8b0a-bb91-1485-2fa674b58514@connolly.tech>
In-Reply-To: <20220903174150.3566935-4-iskren.chernev@gmail.com>
References: <20220903174150.3566935-1-iskren.chernev@gmail.com> <20220903174150.3566935-4-iskren.chernev@gmail.com>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/09/2022 18:41, Iskren Chernev wrote:
> Document SoC compatible for sm6115.
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/D=
ocumentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index dede8892ee01..54053e16b8fd 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -26,6 +26,7 @@ properties:
>             - qcom,sc7180-qfprom
>             - qcom,sc7280-qfprom
>             - qcom,sdm845-qfprom
> +          - qcom,sm6115-qfprom
>         - const: qcom,qfprom
>
>     reg:
> --
> 2.37.2
>

--
Kind Regards,
Caleb

