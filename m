Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3293B4ECB13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 19:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349515AbiC3Rxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 13:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349521AbiC3Rxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 13:53:30 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B57910AE;
        Wed, 30 Mar 2022 10:51:35 -0700 (PDT)
Date:   Wed, 30 Mar 2022 17:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1648662692;
        bh=e/RQ1SaRAskObP1MAJEptYfekeXaggHmvx1g8cmarms=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=hNeT12lIcVXiSBrE2bhJi/Hp5/3CGsuA75yJ1KsxEDRjSGdFoc48yjyPT2QOyIsjW
         c58a4XH4WRuhKFiTb/NR2ULZH59UaxExiN16Nz6om8MET/PSMQzqf3HMuSCSZ/F8DL
         e/HpCgIWBvI+yUNwxMrSHfIbtJEoQ1I+gOW3m+Ns=
To:     Joel Selvaraj <jo@jsfamily.in>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: change firmware path and use mbn format
Message-ID: <ca8ff74d-0781-1bc8-0f2d-29f5b2154c7f@connolly.tech>
In-Reply-To: <BY5PR02MB700966DEE6F6044EBEB5B892D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
References: <20220330064505.243799-1-jo@jsfamily.in> <BY5PR02MB700966DEE6F6044EBEB5B892D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30/03/2022 07:45, Joel Selvaraj wrote:
> The "qcom/sdm845/" path conflicts with db845c's firmware that are
> present in the linux-firmware package. Xiaomi uses their own signed
> firmware for Poco F1 and can't use the db845c's firmware. So let's
> use "qcom/sdm845/beryllium/" to distinguish Poco F1's firmware files.
>
> For easier handling and packaging, the mdt+bXX files are squashed
> using Bjorn Andersson's pil-squasher tool from this link:
> https://github.com/andersson/pil-squasher
Reviewed-by: Caleb Connolly <caleb@connolly.tech>
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/=
arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index 367389526b41..27ba9ad1ad02 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> @@ -121,7 +121,7 @@ vreg_s4a_1p8: vreg-s4a-1p8 {
>
>   &adsp_pas {
>   =09status =3D "okay";
> -=09firmware-name =3D "qcom/sdm845/adsp.mdt";
> +=09firmware-name =3D "qcom/sdm845/beryllium/adsp.mbn";
>   };
>
>   &apps_rsc {
> @@ -208,7 +208,7 @@ vreg_l26a_1p2: ldo26 {
>
>   &cdsp_pas {
>   =09status =3D "okay";
> -=09firmware-name =3D "qcom/sdm845/cdsp.mdt";
> +=09firmware-name =3D "qcom/sdm845/beryllium/cdsp.mbn";
>   };
>
>   &dsi0 {
> @@ -262,7 +262,7 @@ &gpu {
>
>   =09zap-shader {
>   =09=09memory-region =3D <&gpu_mem>;
> -=09=09firmware-name =3D "qcom/sdm845/a630_zap.mbn";
> +=09=09firmware-name =3D "qcom/sdm845/beryllium/a630_zap.mbn";
>   =09};
>   };
>
> @@ -289,7 +289,7 @@ &mdss {
>
>   &mss_pil {
>   =09status =3D "okay";
> -=09firmware-name =3D "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
> +=09firmware-name =3D "qcom/sdm845/beryllium/mba.mbn", "qcom/sdm845/beryl=
lium/modem.mbn";
>   };
>
>   &pm8998_gpio {
> --
> 2.35.1
>

--
Kind Regards,
Caleb

