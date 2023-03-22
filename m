Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DA06C5395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 19:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjCVSUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 14:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCVSUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 14:20:33 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5877A64B14
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:20:32 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id s12so23763625qtq.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679509229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh/hJeo7sTFkQ4LaRklYoR/MA7aBfNbUpjc0I8W6RK8=;
        b=kIieKmodvKmMtfZWWknAoZC0ORvppAY/46WmkqoNpL6nPAssbTBEnfITCx2qypsm81
         WJMNRcfF5CWxmgbgXRR0UmHKf5IziK1ZZG0cjnfMfmXqLx+CVPcVxc3FSlFmPf595rjx
         bQjrJJE3GiLg7plTkpfhgXV76QDD63Bmy1z5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh/hJeo7sTFkQ4LaRklYoR/MA7aBfNbUpjc0I8W6RK8=;
        b=cZtuMdcm7jtpa+A5zbfPadh6KkCB7NosRDlsK6rW40nAHyH2GsV27BXFkjKgRQg3d6
         PQLHU+Ta6rAsWDt55WgepOeCzQ41br+Kh6nMVSqBt3/P/5XdArgopNxEeYsS72pjDC8r
         Ac6LW2XjybG3yjIahicPIklsp+7NbWR/TKHrki4VM+aa6YkcIxFNqw3ioCMntwcwYyF/
         9X6fa+wE7PXPkiiXJYOjs10q8GLJcHVPu6ohXCSt/QaeSOMnNfMiCFYClecwqHU7XXG0
         OO6uc21vbzrtTCxIGr2mkFk1m0rFYHhDurRkvHHKoObsid5PGBk32sXTp99ZW1QoG7Lf
         KG0w==
X-Gm-Message-State: AO0yUKUON+NpEChsNYTc1neOkPTU73BdotvuS0zB7GYDY8kToaBYBbCB
        aaOSzR8q99+QpqVGs6Su/QbO0T/NGHcgvEWECEQ=
X-Google-Smtp-Source: AK7set9CEONwHVidyySXJp/FQCB4NZ7+3f+Mhuq7H1qAJbJVX/mD2Sujc5l5V0OsMi5ys1jnMsGTbw==
X-Received: by 2002:ac8:5941:0:b0:3d6:9528:a0e1 with SMTP id 1-20020ac85941000000b003d69528a0e1mr7967365qtz.37.1679509229132;
        Wed, 22 Mar 2023 11:20:29 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id f14-20020ac8464e000000b003e38ee0d80esm720735qto.15.2023.03.22.11.20.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:20:27 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id i6so22114710ybu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:20:27 -0700 (PDT)
X-Received: by 2002:a05:6902:1546:b0:b74:6c88:7bff with SMTP id
 r6-20020a056902154600b00b746c887bffmr357158ybu.0.1679509226666; Wed, 22 Mar
 2023 11:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230220095401.64196-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220095401.64196-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Mar 2023 11:20:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoSWOYuG5K9wcoPXC-490N9yP+JLkg3Nt+JEHvnRdwNg@mail.gmail.com>
Message-ID: <CAD=FV=XoSWOYuG5K9wcoPXC-490N9yP+JLkg3Nt+JEHvnRdwNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7280-idp: drop incorrect
 dai-cells from WCD938x SDW
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 20, 2023 at 1:54=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The WCD938x audio codec Soundwire interface part is not a DAI and does
> not allow sound-dai-cells:
>
>   sc7280-idp.dtb: codec@0,4: '#sound-dai-cells' does not match any of the=
 regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 2 --
>  1 file changed, 2 deletions(-)

I'm pretty soundwire ignorant but this looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Seems like folks who were involved in landing the patch that
originally added those properties should be CCed on this, though.
Adding them.
