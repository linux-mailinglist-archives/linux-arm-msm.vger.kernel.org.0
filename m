Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294F067BEDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 22:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235606AbjAYVom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 16:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235791AbjAYVoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 16:44:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2392028D11;
        Wed, 25 Jan 2023 13:44:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D9462B81BF9;
        Wed, 25 Jan 2023 21:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A2DC4339B;
        Wed, 25 Jan 2023 21:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683070;
        bh=39kH6qD5Se0Jc9BnGw5dKPCTwLa+qsDf5AztkIH0JPY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PN0MWbRzQW7S+vaMeD6ATNGIPDwQDNSuamiSQp23b+VNFRrKxDXIXpPn1TCbee2ET
         h4qFjGoUirAAev5pMGsKIdEj3tftjwy855dIeOzEtIYJ5LIqJAgzRHJumcmGxsdeqW
         tY32i1Z5hWIMMcWWSWPconc9MfB+NcZ86Mub0j2E5oTPnoLIM7kc9MY7aY/AVsz68V
         fGUw+tHAKFgmfn2D2kdqHEb2k1pea1nfEyBXIASyaAEiVFq+i5W4O5Sz6XkwveKUxx
         KFzjlJkXY7K0dRerglbQwDuQ5nxb4kBa1nSYkgQoI6xDf0iKCogMFxR3HVsRHO0uTA
         DlYyLcHJ6XQDg==
Message-ID: <11de8455cd4c1731439f887bd7298010.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-2-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 25 Jan 2023 13:44:28 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:03:51)
> Define clock/clock-names properties of the GCC device node to be used
> on APQ8084 platform.
>=20
> Note: the driver uses a single pcie_pipe clock, however most probably
> there are two pipe clocks, one from each of PCIe QMP PHYs.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yam=
l b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> index 8ade176c24f4..d84608269080 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> @@ -32,11 +56,31 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> +    /* UFS PHY on APQ8084 is not supported (yet), so these bindings just=
 serve an example */

This comment will go out of date and probably nobody will notice. Just
remove it?

>      clock-controller@fc400000 {
>          compatible =3D "qcom,gcc-apq8084";
>          reg =3D <0xfc400000 0x4000>;
>          #clock-cells =3D <1>;
>          #reset-cells =3D <1>;
>          #power-domain-cells =3D <1>;
