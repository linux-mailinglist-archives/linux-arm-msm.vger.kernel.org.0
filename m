Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93E5785E65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 19:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237782AbjHWRRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 13:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237475AbjHWRRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 13:17:35 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2E1E6A
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 10:17:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c1d03e124so743164966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692811050; x=1693415850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS+TPc34qbEYEOTCakdAp1dhbKIZynKL3y59Y3CigWo=;
        b=WueiVPoMozMdknbeqgWLH3xZEo28P5yxES/Aa+dDp0TXnz4IGZOWdvLXalQ88prxKU
         nehXO+OC4lDaefVkhLN5B6EMiikX4J9wTiJnxGTPF+i0oGnghn/Ypu65emvtvV1Sab0g
         Z+HwzqUiVRE25vIiyjE2QzoKtw8m2r0XVOMCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692811050; x=1693415850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MS+TPc34qbEYEOTCakdAp1dhbKIZynKL3y59Y3CigWo=;
        b=jB3NWKUWDwj7ngchxYGtaRgXtAehFM/RTPgap2JtGddxz/Hd3ZPeE4z3btMINdW/fj
         ZYotPOW+9h95/vOBbPk9T0uOfU8Z+GDHhOmNmGa0F714gYTiI8P61LBcvkjVWrqJ6F1v
         Vo8nDZ2pwPBE0cBu62PP3eIb0zMvk/dHAiUBCcPTjYrtjMxH0GHMKWS3yBnSn4ut+RIN
         5m54qkwI/avdPsY1a7CJmnpDChzqjBl2txZvl0nifQqcVCfT7FzWL/0rvVNQJ/h6H36c
         lMfhVmPTO7+eNG6tBu4EOOf5WcleQ/KBiMDaMYFuWd4s/J6+4A0utcQtcnPvoH/xNvge
         WVzg==
X-Gm-Message-State: AOJu0YxJEDUQZZ+95NmmF2EdcMQgEWDHyYO5khMRy2QsNyFI5GRL2k2n
        N7R+C0ePkeDhnQZEJWULe2qGtuTRGq1HozMDVkaGjoLZ
X-Google-Smtp-Source: AGHT+IFy6royrkDdeJygLfUO7jcWaiiItXah3Sp0VG2Ke6gYjskUkGjneAPcWWul7qjjb+7ZZsT+mg==
X-Received: by 2002:a17:907:2bcf:b0:99e:6cc:798 with SMTP id gv15-20020a1709072bcf00b0099e06cc0798mr9875014ejc.64.1692811050188;
        Wed, 23 Aug 2023 10:17:30 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id kf18-20020a17090776d200b0098748422178sm9907624ejc.56.2023.08.23.10.17.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 10:17:29 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-529fa243739so978a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 10:17:29 -0700 (PDT)
X-Received: by 2002:a50:9f4e:0:b0:523:b133:57fe with SMTP id
 b72-20020a509f4e000000b00523b13357femr275913edf.1.1692811048986; Wed, 23 Aug
 2023 10:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230822094414.123162-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230822174101.v4.1.I26e017b00a341e7a5a2e94a83596923713408817@changeid> <20230823-raving-either-fb7bdb98b846@spud>
In-Reply-To: <20230823-raving-either-fb7bdb98b846@spud>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Aug 2023 10:17:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2kHPu2coSniUXfDJH8gYMV6115NKkyS7Rt4mEx4fzew@mail.gmail.com>
Message-ID: <CAD=FV=U2kHPu2coSniUXfDJH8gYMV6115NKkyS7Rt4mEx4fzew@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: add sc7180-lazor board bindings
To:     Conor Dooley <conor@kernel.org>
Cc:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 23, 2023 at 8:11=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Aug 22, 2023 at 05:44:13PM +0800, Sheng-Liang Pan wrote:
> > Introduce more sc7180-lazor sku and board version configuration,
> > add no-eSIM SKU 10 for Lazor, no-eSIM SKU 15 and 18 for Limozeen,
> > add new board version 10 for audio codec ALC5682i-VS.
> >
> > Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.goo=
gle.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Conor: any chance you could reply to v6 (instead of v4) and add your Ack?

https://lore.kernel.org/all/20230823151005.v6.1.I26e017b00a341e7a5a2e94a835=
96923713408817@changeid/

I _think_ the v6 patch series is in good shape so I don't expect
Sheng-Liang to have to send a v7. I'm worried that your Ack will be
lost if it's not sent in response to the v6 patch.

Thanks!

-Doug
