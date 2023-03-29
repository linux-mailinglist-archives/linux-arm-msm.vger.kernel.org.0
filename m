Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470C76CCEBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjC2A1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjC2A1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:27:14 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7123B185
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:27:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id i5so56927495eda.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1680049631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEpY2ODUY5mEqcj9vNQ0ZYZkQmo1P7yFLhuPa4WcepM=;
        b=SfnATT8MDX4N45OHq834fFTpo5bzClAd9VvPwG/QFM41uPnZ1Nvec8zwAzyYHB8V1U
         5AvfxRBgtbyHq4hulLOe6wKecl2mWADZWNw2gWPb/pWeF2En4DuJ3w28Ju7mS5HpwpwL
         vaLOX3x18ByQD5sv1yiZlr/lLpQ4SrByuZASqkwqnL6m+NqERyn/nm424Q5Bcy/gQxiG
         7P9UvUrsxmuL3mwzfGnhrSHe7NmbBqDq24lA8fTQQGlOS9mHXd64ZNAhUdKIih/qt7St
         uiGgqgie5BtYzXOkOhHLX1bapebmILjuI4x26PlMAGTgjTZyHFc/OvaowzexvcL6/uh/
         UPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEpY2ODUY5mEqcj9vNQ0ZYZkQmo1P7yFLhuPa4WcepM=;
        b=FaAhrvGBh6TPo9CBPMYasN08ycq2cD1sTrul2oEVbvapt4bMZ7SMUZS/Cu1sJCKYuk
         krpmUdYzVo/NbE2ose4fS9/q/68Ipr6FohKsqkYiPPiRP7hzV9yFD2C7fPKMMckdQY0+
         QWs7y+uVftmBYZK49194wec2/fCbmvu01ZU/kVkg3YAJAfZSkQGo/emyUB5x6Qv7499B
         sHH1SrOKuni/vAwrQ+QxowdBf0eyGmrCKs4NsAlRgcdY8sdN5J6ajVDyeGaqsciQE6DJ
         Ks+F2fTKzRLXPXzxBhCpqiibFxHGvhcIWkLWRdi+MIGlOlBswO6/Zk/3U15YoZDbAk2W
         Kaqg==
X-Gm-Message-State: AAQBX9c6rfyrWvpem7EGTm91kdOq4HSLXM3rtJHMLPrMMuIZdJjMcwC0
        3/9SYQZ9kStcRh2S/spQJnGpyIfvFgPAydBsUJEFkQ==
X-Google-Smtp-Source: AKy350a6b0RNSg0qEukxWpVN2dB5p+ti+B0uqThdB7kAShSe5xvwdydY4q/AP6PYlOkUDiuZPxqS5m+rA0BZBXLXUJM=
X-Received: by 2002:a17:906:524b:b0:877:747d:4a90 with SMTP id
 y11-20020a170906524b00b00877747d4a90mr9121390ejm.14.1680049630974; Tue, 28
 Mar 2023 17:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230326233812.28058-1-steev@kali.org> <20230326233812.28058-5-steev@kali.org>
 <CABBYNZLh2_dKm1ePH3jMY8=EzsbG1TWkTLsgqY1KyFopLNHN6A@mail.gmail.com>
In-Reply-To: <CABBYNZLh2_dKm1ePH3jMY8=EzsbG1TWkTLsgqY1KyFopLNHN6A@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Tue, 28 Mar 2023 19:26:59 -0500
Message-ID: <CAKXuJqi_DJ1GEP-rurJqJF5EyooNQO=daBOo0dipCGqS8QV=Dg@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: qcom: sc8280xp-x13s: Add bluetooth
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luiz,

On Tue, Mar 28, 2023 at 5:24=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Steev,
>
> On Sun, Mar 26, 2023 at 4:38=E2=80=AFPM Steev Klimaszewski <steev@kali.or=
g> wrote:
> >
> > The Lenovo Thinkpad X13s has a WCN6855 Bluetooth controller on uart2,
> > add this.
> >
> > Signed-off-by: Steev Klimaszewski <steev@kali.org>
>
> I would like to merge this set but this one still doesn't have any
> Signed-off-by other than yours.
>
> --
> Luiz Augusto von Dentz
I don't quite follow - should I be adding others S-o-b?  I know that
Bjorn had previously sent an R-b, and Johan as well, but since the
code changed, I didn't bring them forward.  If I'm doing something
wrong, please let me know!
--steev
