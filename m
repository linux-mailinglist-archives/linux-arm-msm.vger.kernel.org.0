Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 555C859E9CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiHWRgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbiHWRe4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:34:56 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D9E80345
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 08:15:31 -0700 (PDT)
Date:   Tue, 23 Aug 2022 15:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1661267729; x=1661526929;
        bh=/a5Sr9z4hKMkNQE2RiJnMU4myUih+AbOa22vER9x60Q=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=oF0ZlcI3jQo3o5di1EQm3lYNC4ZqhwDt2qOck1QEd3v0d7RAxquP6nkgnHPYV2qdH
         WCLhYGe7AasNrtjbOhAQ5T2eDUEuE8wivgsavw8lBv3oJx4G/En4bdzrv0l4DQ91z1
         jRkymxY7CQP77zuG7VMoO5V3GzOsRFNQdl/aK/8Q=
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: move DSI opp table to the dsi0 node
Message-ID: <2af8e228-5334-d5fe-eee5-2067d84481dc@connolly.tech>
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/08/2022 20:11, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 38 ++++++++++++++--------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index bc773e210023..5843e46a3164 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3571,6 +3571,25 @@ dsi0_out: endpoint {
>   =09=09=09=09=09=09};
>   =09=09=09=09=09};
>   =09=09=09=09};
> +
> +=09=09=09=09dsi_opp_table: opp-table {
> +=09=09=09=09=09compatible =3D "operating-points-v2";
> +
> +=09=09=09=09=09opp-187500000 {
> +=09=09=09=09=09=09opp-hz =3D /bits/ 64 <187500000>;
> +=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>;
> +=09=09=09=09=09};
> +
> +=09=09=09=09=09opp-300000000 {
> +=09=09=09=09=09=09opp-hz =3D /bits/ 64 <300000000>;
> +=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>;
> +=09=09=09=09=09};
> +
> +=09=09=09=09=09opp-358000000 {
> +=09=09=09=09=09=09opp-hz =3D /bits/ 64 <358000000>;
> +=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>;
> +=09=09=09=09=09};
> +=09=09=09=09};
>   =09=09=09};
>
>   =09=09=09dsi0_phy: dsi-phy@ae94400 {
> @@ -3663,25 +3682,6 @@ dsi1_phy: dsi-phy@ae96400 {
>   =09=09=09=09clock-names =3D "iface", "ref";
>
>   =09=09=09=09status =3D "disabled";
> -
> -=09=09=09=09dsi_opp_table: opp-table {
> -=09=09=09=09=09compatible =3D "operating-points-v2";
> -
> -=09=09=09=09=09opp-187500000 {
> -=09=09=09=09=09=09opp-hz =3D /bits/ 64 <187500000>;
> -=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>;
> -=09=09=09=09=09};
> -
> -=09=09=09=09=09opp-300000000 {
> -=09=09=09=09=09=09opp-hz =3D /bits/ 64 <300000000>;
> -=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>;
> -=09=09=09=09=09};
> -
> -=09=09=09=09=09opp-358000000 {
> -=09=09=09=09=09=09opp-hz =3D /bits/ 64 <358000000>;
> -=09=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>;
> -=09=09=09=09=09};
> -=09=09=09=09};
>   =09=09=09};
>   =09=09};
>
> --
> 2.35.1
>

--
Kind Regards,
Caleb

