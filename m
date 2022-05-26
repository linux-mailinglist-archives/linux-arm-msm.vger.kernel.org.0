Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BCC534F39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 14:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347433AbiEZMdb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 08:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347346AbiEZMdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 08:33:06 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1137B1C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 05:32:56 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g184so1263627pgc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uq65Yc9kCu5ZjE2VXt2sEUmRK2Eh4giDN/mBcKQQ3j0=;
        b=QoGupt8qrmOwnNhiVyFSJiPevpngkgPfWBCbiokcCcM3h27BsdInR9Dgqo4emdwfPQ
         sn/1IPdQ1v533T4bDlOJymawvStoDCmyQGLl3NnJXK7YLo9qs+OqPoTmFbv4mEimJPYw
         pMECzkzhI8kOyTIp/ex6lWL8mZ5kAYzMvzyvQdFlKTyw5wIv5J/mRRVuz3Ru5pzfqfUr
         flWkFQ9CXbyUA/kLagHzfqWiJI3m8+wot2BWXxdB+GuBkmNFdifzHATLEQCEx46WDpgM
         vt/Sv2MlH8QeHT/YdrBrRh1XnBbzQD3ux6gfgg0tv3JBGwKA47KKFjWunyzr6K0/jig7
         qOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uq65Yc9kCu5ZjE2VXt2sEUmRK2Eh4giDN/mBcKQQ3j0=;
        b=sJg5c2N2px0mW5ok6509M/Zr678jGPMKdzmSxi/Lw9N1YuiwozHIDTfBwE5sv5NfHG
         C7xrQY07Sg2E8QJ8ceDviWIQV1YJoBq1l7B7S9Of1vOpPEmMu1jtaHoMHtzsvw4bxWu2
         2LevReNf0Y+H4AJ1aiZjqHi95ofX7FlgqsvDZHK9XUOstqha0AeAbepX6uBZxXTrVm60
         2FREBzJ/aiZVfljkQma8IUQbTo1n+ANak9ngz38mu6JMwW3h1UQg8eLs+6egncTqeILm
         hijEjeNOZkNwws3sAapuLKK1LYyT6R58yUOCyJoJ1mj/qpJHgj9FOPd8HRHy/0NmgfVX
         RQFA==
X-Gm-Message-State: AOAM533qGe1EaFQIgqpQsiLTQfdSZvmphRfk4HJ0W7OThoWgj1UENryv
        TCEpxOfQWyAPTmQXmdbLP3XGN2shXgZHLki75/lx/A==
X-Google-Smtp-Source: ABdhPJzRXYWySj/H0ovAGxNel6N9wfNcHwmAm4aieUaKbaj1YuK4ixph32MMCv1ewUmnEea9w5A8r0EQlrz4QGU5sz4=
X-Received: by 2002:a63:31d3:0:b0:3f5:d1f4:5f95 with SMTP id
 x202-20020a6331d3000000b003f5d1f45f95mr32383282pgx.178.1653568376009; Thu, 26
 May 2022 05:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-3-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-3-luca@z3ntu.xyz>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:32:45 +0200
Message-ID: <CAG3jFyvgWYUs7TRL-XP=U_c=-3TJ4XJKzmQqKD2CTfC-6-gwBg@mail.gmail.com>
Subject: Re: [RFC PATCH 02/14] media: camss: Add CAMSS_8x74 camss version
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 22 May 2022 at 18:28, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>
> Add enum representing the MSM8x74 SOC.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/platform/qcom/camss/camss.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index c9b3e0df5be8..663cf24f52d9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -76,6 +76,7 @@ enum pm_domain {
>
>  enum camss_version {
>         CAMSS_8x16,
> +       CAMSS_8x74,
>         CAMSS_8x96,
>         CAMSS_660,
>         CAMSS_845,
> --
> 2.36.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
