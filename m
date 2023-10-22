Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F337D22C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Oct 2023 12:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjJVKvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Oct 2023 06:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjJVKvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Oct 2023 06:51:45 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C92119
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Oct 2023 03:51:42 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7af52ee31so23347027b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Oct 2023 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697971902; x=1698576702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qtBLYHItiMRAtWv2eIIyDWdvOr+sJvW/WOE9B0k2XRw=;
        b=NkuDTB4O/Nd48Yas/JhUC6lJqnb8ZTYBFcyAFQnf58+4ERJbJNFS6EIjiKsXode/1O
         IfkXOwBc0PNWRITMYxnSiXUNm+D5b/jYFAkz51FcLgPe47Ux9KBzHB6JyuDqu2nvU6u2
         EeDyjQOZUZYu+AvrVhEuTdZS7Dq7wNVY3dtqDyJBE1psT4VBFsnBMDaNY2JRYYBtk/nx
         Wz8gbaPLbQwYtD8CprBZoF8h5rqD30Qn2a9AzRTEFoJSiFSifG3hRXIc1gUd3vBaXqSY
         Y35sK0HAdzUMlBJLIJwiJviu58678KPSerquWshltnMO33OP8Twqj8U9FuqbEMstCAP7
         TP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971902; x=1698576702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtBLYHItiMRAtWv2eIIyDWdvOr+sJvW/WOE9B0k2XRw=;
        b=quLnZQEsxlLwGDPBGH6pS/x9TBt9pBrMfNqnIU4+MvxqoXZrKbvmiW06DZsZC5Dcyj
         Mbda9YfBwsp591LIQpWb4NCpmyyuq4Rj6kFFjKV8gS7+KbB1hdYkI8OTP+ekV/48OYxU
         zoleHK0tmVSWi2tnHW2bOW54JI9iny7wLF2PhPAy/TyNV6IonKZWhyzOFCLUd/qufUe7
         DZwcxozDZL7NW0sUTZ9S8O3UmcKy+lgD78Oxai4D6HJy2uOuZT6Y3IwWfyi6SDIv7NnE
         lIIk77I8cVFDNI3ddDwrEUHHLOh+NrkWr5H5ZGiiGFv5y1FTDsr5ffC2ilogl7HGuj97
         EYdw==
X-Gm-Message-State: AOJu0YyzzSFEkUQDWisUAu5P96dci91yD/Fmc8++MMH+Zg0pHes2y9wI
        3f26LvAb3cJXXlHMaxdXcXSIWHcCWrDGbFyCWk3thg==
X-Google-Smtp-Source: AGHT+IHvSGTdwWJCN+NUWfNu/iFOGpqaoQeYpFbg6MJyqmijJSTWlLgR/hV+HQSRRk+O0gguRdSlYnVT5vCX2KlXnKA=
X-Received: by 2002:a0d:df02:0:b0:5a7:be1a:6c32 with SMTP id
 i2-20020a0ddf02000000b005a7be1a6c32mr7073499ywe.24.1697971902097; Sun, 22 Oct
 2023 03:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231021-sakuramist-mi11u-v2-0-fa82c91ecaf0@gmail.com> <20231021-sakuramist-mi11u-v2-1-fa82c91ecaf0@gmail.com>
In-Reply-To: <20231021-sakuramist-mi11u-v2-1-fa82c91ecaf0@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 22 Oct 2023 13:51:31 +0300
Message-ID: <CAA8EJprtd8htkDWAvhamgEo3DWMMDYe-P6cnr6nwLnms=N0k9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: qcom: pmic_glink: enable UCSI for SM8350
To:     wuxilin123@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 Oct 2023 at 13:20, Xilin Wu via B4 Relay
<devnull+wuxilin123.gmail.com@kernel.org> wrote:
>
> From: Xilin Wu <wuxilin123@gmail.com>
>
> UCSI is supported on SM8350. Allow it to enable USB role switch and
> altmode notifications on SM8350.

We have had troubles with UCSI on sm8350. I have a workaround for this
(and earlier) platforms. Once it is ready to be posted, I'll include
your patch in the series, if you don't mind.

>
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 914057331afd..1196e79e6fb3 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -341,6 +341,7 @@ static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT
>                                                            BIT(PMIC_GLINK_CLIENT_UCSI);
>
>  static const struct of_device_id pmic_glink_of_match[] = {
> +       { .compatible = "qcom,sm8350-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
>         { .compatible = "qcom,sm8450-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
>         { .compatible = "qcom,sm8550-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
>         { .compatible = "qcom,pmic-glink" },
>
> --
> 2.42.0
>


-- 
With best wishes
Dmitry
