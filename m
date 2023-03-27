Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF98B6CB0E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 23:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjC0Vp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 17:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjC0VpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 17:45:09 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FD0271C
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 14:45:04 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-545ce8e77fcso118766237b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679953504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Od1yrRw9W0dDs3CqT7zBZ9uROZ36udzvsBtgFGjS0E=;
        b=nJJC9+Vtewsjq4C44MAfep9cBROtkUlVfjhIvW8jPihW1JxYSYxcgz8nuv+wRlNyfO
         VBQOCmg5nV9AXlBXv59COMt77+n+f1i/KRcQfmyDNRpLAtbAX1dhMEWktZXkB22ng3et
         6gG1BHtIGQ0JQ51n3bqiged3a7tH9vYNd43mcjTIrTIKJYR4hi7SJqcg71X0tzNO597I
         yS0qAbe0tDH1cuRCSFYgRv+9eZR5iiNmRp6wBFlx5uG1mx7x9jDuyKVEF/b9fupU6Eef
         A9s1l4g9GgJPAXfYWgNXAjcH0bNHsclAtf0w4i+HZzwdeUVeoklVqx5dhZJzp3D0Z5vY
         y2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679953504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Od1yrRw9W0dDs3CqT7zBZ9uROZ36udzvsBtgFGjS0E=;
        b=msgqEia3QXnORj4PA/QvCYHXERSn/Yx30GboypPDtq6fSRaY3a6vE+ssSFbbDqhk4V
         wBXgXm4Kd9ei+nGq2n25EC4mRZGvwM9YR8GIJNEB+VFgvzjIJ9BK59xQfsSIG3okHiz4
         Aqo5FNfliWMHEZoPJskYoafQo8acCwaBgRLptxBClNoLqsPvSrL/1Cg8Z5idVla6thAP
         4zzEtL+K2357gAJpllryW9R+IElFAtCi1sp6y2PKPHWzLev9rXP95Llr2BqkFZOC2Zlu
         /V2UyivmsgzEJlcCIBtML2bj39Yk7SQMALr5VjYPZ3ZeS8dETqInSOYgztBDj+J8Qdx3
         FzNA==
X-Gm-Message-State: AAQBX9dgaxoknINHv/fCH6QxSclBAXnqs9q8soK0NJWgN1VnQ0LT2mo0
        vLI4IeZy15HVcCg1hqJTAFXHccdULUwNSv/Fih3kDA==
X-Google-Smtp-Source: AKy350ZiZF5MjjPsOVfoZJqYbz6+9AyDpWJmzjBpGI3FukJ1AYFDm8mdtZ8HxExb9n4AJbaKdmnLzxtqtcjOdjCI/G0=
X-Received: by 2002:a81:4426:0:b0:53d:2772:65d with SMTP id
 r38-20020a814426000000b0053d2772065dmr6146370ywa.9.1679953503833; Mon, 27 Mar
 2023 14:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230323173019.3706069-1-dianders@chromium.org>
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:44:52 +0200
Message-ID: <CACRpkdaGpaiOVjEN6Ftq5=-yuAyD0xb7OcvtEsoqbTzias-xxw@mail.gmail.com>
Subject: Re: [PATCH 00/14] Control Quad SPI pinctrl better on Qualcomm Chromebooks
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org
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

On Thu, Mar 23, 2023 at 6:31=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> The main goal of this series is to do a better job of cI can apply ontrol=
ing the
> pins related to the "Quad SPI" IP block on Qualcomm Chromebooks. This
> is essentially 'v2' of my previous attempt in the patch ("arm64: dts:
> qcom: sc7180: Fix trogdor qspi pull direction") [1] but since it's
> spiraled out a bit and there are no patches that are exactly the same
> I've reset to v1.
>
> The early patches in this series are just no-op cleanup patches that
> can be applied. They're not terribly critical but since they are
> "Fixes" I've listed them first.
>
> The next patch in the series is a very simple and (hopefully)
> non-controversial SPI patch. It can be applied independently if
> anything else.
>
> Next, we have a bunch of pinctrl patches (including the device tree
> bindings related to them). I dunno what folks are going to think about
> these. If everyone hates them, we can drop them and just change the
> later patches in the series to use "input-enable" instead of
> "output-disable". It feels ugly to me, but it maybe less upheval.
>
> Next I removed the now-deprecated "input-enable" property from all
> Chromebooks. None of them were necessary.
>
> Finally, I did what I really wanted to do in the first place: attempt
> to cleanup the pinctrl states of the Quad SPI. These patches have a
> hard requirement on the pinctrl change.

This looks good to me (TM)

Do you have a merge plan?
I can queue the pinctrl patch into the pinctrl tree, and
the pinctrl binding patches.

Will you take the rest to the SPI and SoC tree?

Acked-by: Linus Walleij <linus.walleij@linaro.org>
FWIW

Yours,
Linus Walleij
