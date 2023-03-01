Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14CC6A73DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 19:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjCASvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 13:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjCASvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 13:51:16 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A82C4DBF2
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 10:50:55 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id s26so57758148edw.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1677696653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iUZAnJK6gz4oERofIoMWErNXIlGl6/+yG6iePuXC0I=;
        b=OEzv3ztlUkaTFHVQhmuj1cOuU7W508fgRqtyIaeMiq6tyMjmoSbM8qYK+ptLJ2shCv
         hG78D5aijZL8I3UjKY7oy0rMyV1qitjUHubHIKTaUvrcevzM7AkNXIn7fOPtIGoRaBK2
         3H2JyQ1M9DI/AK08U7Q63YyO5mBx2kDhCccp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677696653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iUZAnJK6gz4oERofIoMWErNXIlGl6/+yG6iePuXC0I=;
        b=3hVp353m+XGnM5TsLa3bRSdpFUfzUfiapdlHC/s4hX6xxyoKfjAS0PgElyAdUKq6xR
         uRcXUk21LaOgpQRnfKtajCHiMdYR/yrQ4wlj8K1Pnghsm/vKgxd509h6d0SF0oxbdEbP
         5c1AcObwRkUsFI1XQNgo90MHfddZE+GyMz+DIyOgSuTtdutmxanMyXYUe20PJf3tyvZC
         ntKBGQE2GhdB6Zx5STeZlTyo8UBOeSr08lcMjk/ySMu3Pcsyb6uJU5aaHEJpDO5I8ka/
         fkVzma/noHaHZ34DimYZUt+//l94Z5zqZxpEYW/Q1UFcWMjYJsnDVGO49RKuuNygxtez
         A8mQ==
X-Gm-Message-State: AO0yUKXqA5nGiFqV11B/SF3BDCmKZPD+BDy/RY9LVJ9Bu+VtXrTuAnPQ
        6bQAEwSXTG5paaJDiNucivHgMfZsUkUNGsgabfZpLA==
X-Google-Smtp-Source: AK7set95GnaQnG3VDxV4b3zJKa/RxmX8W7ht68ajFI+h7vpI/iVoISfoXMA8FX+NFvzquBGGVuoyzA==
X-Received: by 2002:a17:906:85cb:b0:8b2:3e72:1022 with SMTP id i11-20020a17090685cb00b008b23e721022mr6710546ejy.29.1677696653385;
        Wed, 01 Mar 2023 10:50:53 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id x2-20020a170906658200b008bfe95c46c3sm6109097ejn.220.2023.03.01.10.50.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 10:50:52 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id h16so57867261edz.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 10:50:52 -0800 (PST)
X-Received: by 2002:a17:906:c08c:b0:8f1:4cc5:f14c with SMTP id
 f12-20020a170906c08c00b008f14cc5f14cmr3831646ejz.0.1677696652007; Wed, 01 Mar
 2023 10:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20230214132052.1556699-1-arnd@kernel.org> <Y/+WghSbz3l6uipn@dev-arch.thelio-3990X>
In-Reply-To: <Y/+WghSbz3l6uipn@dev-arch.thelio-3990X>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 1 Mar 2023 10:50:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj+O8OqVD36P+1cbe-B3wbB9BwfwtM1E6evObs9VpYz3A@mail.gmail.com>
Message-ID: <CAHk-=wj+O8OqVD36P+1cbe-B3wbB9BwfwtM1E6evObs9VpYz3A@mail.gmail.com>
Subject: Re: [PATCH] power: supply: qcom_battmgr: remove bogus do_div()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 1, 2023 at 10:16=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Would you be able to take this patch directly? It seems obviously
> correctTM, has an ack from Sebastian [1], and without it, 32-bit
> allmodconfig builds are broken [2] (the other warning in that log has a
> fix on the way to you soon).

Ok, I've taken it directly.

However, the whole "seems obviously correct" is true in the sense that
it now doesn't complain (and doesn't overwrite an "int" with a 64-bit
value.

The actual code still looks odd. Is that return value for
BATT_CAPACITY truly in that odd "hundredths of percent" format, where
dividing it by 100 gives you whole percent?

Because "hundredths of percent" strikes me as a very odd interface.
Even for some firmware interface. I realize that anything is possible
with strange firmware, but still...

             Linus
