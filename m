Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E35675861
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 16:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjATPUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 10:20:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjATPUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 10:20:22 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD525DB7AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 07:19:59 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ss4so14716068ejb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 07:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oohYZqlXb/UEppW6rQtISKF6pXwhrVR4gJAAjhthm3M=;
        b=L3xzaMDpCnHoKgPC6Jo0Lpa2a+zydubEH2Zg2XksukzxOMnWENJ9xKNJ+jyT4XsxiJ
         UjfEGE0epmcdSxMhuJylugp1jH4Muof1LwCIwXHgaPZLddeTIhHu2Yzo8r0mYBGbwISX
         TBvCCSki0UHfCvGuOB0/cPthgQ1LC4jnBx4Z/zySb8p4kKax9wUs0TocD2mMEN0cQE5j
         9M+pGd0g7jKfv83fwFXEi5HjSMMIYoYg5magZ1avuVzYTpD0h7e2FeTDyY7dT6Uph0+6
         wcra6nRWFpLdsxXTPywthzp2EMw1cOgYwirD1GwC/rwMvwYUKMJKxG/V9USVssv4GOeI
         hj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oohYZqlXb/UEppW6rQtISKF6pXwhrVR4gJAAjhthm3M=;
        b=CDc+yFkTo85iPNlEvQ61vNIJHHyeZeNFuyerpVJqL/ZBc+Td46Jgb/+rPcJUnpO9UM
         KhO+Y5CmO+J30vSzyNXkbgCGRaSIL/zA5Is5K29w9hpq9ZtIxSPdlEEGoKNkoBPSsWz+
         u7sLsj8nN/1IoTInFAkQ8r42XEf1a1gnzkeUEea/qfvETi2LysjUlLjhrx6+8HE94vwn
         oURdbYjfiXZ9uZ9RP0KEO+OIfZAsh07Ga3NAHnrdD9PTEPBg2+Dz0asT6YUl/3iI799i
         vuYqUw1DxtUQ8g54leDGoEwTihTVyoYwAfvI3kS9bGIYaCHno9bilqwct9i8lp+CNT6J
         shcA==
X-Gm-Message-State: AFqh2krHguB6obZJOHfivdtHSauO2tM/3nNZx6lE17PGncBiksRO8Ikr
        SOSc4CB9advMMfpVDHwHkhDv1Q==
X-Google-Smtp-Source: AMrXdXuNmUs4phh4bB2kbw3WJrDxVfTHziau8J+3frDuKxt57+6s1sDoG8Uc/9i74Lj8U3HHEjyqxQ==
X-Received: by 2002:a17:906:608d:b0:872:a2ee:271d with SMTP id t13-20020a170906608d00b00872a2ee271dmr14170359ejj.53.1674227998279;
        Fri, 20 Jan 2023 07:19:58 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090633cf00b008711cab8875sm6977298eja.216.2023.01.20.07.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 07:19:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 20 Jan 2023 16:19:57 +0100
Message-Id: <CPX4AK05WU5V.2XZ2KT3M3ZHA@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: smd: Add XO RPM clocks for
 MSM8226/MSM8974
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Rayyan Ansari" <rayyan@ansari.sh>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230119190534.317041-1-rayyan@ansari.sh>
 <20230119190534.317041-2-rayyan@ansari.sh>
In-Reply-To: <20230119190534.317041-2-rayyan@ansari.sh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu Jan 19, 2023 at 8:05 PM CET, Rayyan Ansari wrote:
> Add the XO and XO_A clocks to the MSM8974 clock list, which is also
> used on MSM8226.
>
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index fea505876855..42ea3bb37f63 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -549,6 +549,8 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_=
pin, cxo_a1_a_pin, 5, 19200
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, =
6, 19200000);
> =20
>  static struct clk_smd_rpm *msm8974_clks[] =3D {
> +	[RPM_SMD_XO_CLK_SRC] 		=3D &sdm660_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC] 		=3D &sdm660_bi_tcxo_a,

Hi Rayyan,

This doesn't apply on linux-next.
The references were renamed to clk_smd_rpm_branch_bi_tcxo*
Please rebase.

Regards
Luca

>  	[RPM_SMD_PNOC_CLK]		=3D &msm8916_pcnoc_clk,
>  	[RPM_SMD_PNOC_A_CLK]		=3D &msm8916_pcnoc_a_clk,
>  	[RPM_SMD_SNOC_CLK]		=3D &msm8916_snoc_clk,
> --=20
> 2.39.0

