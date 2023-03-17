Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8FD6BF34F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 21:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjCQU6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 16:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjCQU6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 16:58:18 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85E0399C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 13:58:16 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5419d4c340aso115869027b3.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 13:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679086696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78yALmTsSciSeto27pgZIDoTUCcCZg0Xi7D0VKEquOI=;
        b=ReNqhlEAqD/sjcsPCojeM9w+k8jN3tbhjOvqFb5lB6b1itAJPunkb/lHyjF8e2zKyT
         JDo7lBArgVDBe0QdACN1oz12hmgq1mcaaUzJ4pX6igZKfxBSsbueysICZR/nxsoSeLsA
         fW4NL4S7AAmQIppB1LVJeo0iFltJzFmISdTpePZCIZ11udmbpU+XWOkvLaItCnrEkg4Z
         aTvXk7Lcfan9TvvbJWh7rPgUQb+TkyC7tDJGoX56xfEqSsDHiVzT0IO97mCFgLOjsSQt
         Y29K+xdi48dUhkt7rp1yj+yvJ/BL+7dUci2Po0wG2FDdQttm7+3Vlx02uUlpYCt0YDf6
         Btnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78yALmTsSciSeto27pgZIDoTUCcCZg0Xi7D0VKEquOI=;
        b=TFpr36zxbtJ0RobNlhnTPxgBD9eqT/CPai0/sUr9q3FEwGLqITDmRjhN/v64PdVkRj
         voDiUd+jcWKlwcbuXIIiwFmo2Pnd2svKjLySpsZf7NVCmSaV2zA4x/pQWdWPROuXBShd
         dA4P7wzq1C1mmb4XazXIdHzOxs5l/XEFcxTjs4M+eH2KgEnJH8QavU/pTD3gvroBkp71
         akwbxp0R6zb7/0yASp+9jzURKEE3r/iusQLayD/1jPHWNkQ6R6hsFTSfP45Y+ovSUumR
         ka9w5iDixrh8Xr/DYntDvthvzJNFrnCbvtdghjweLEd0xo6f7gNZqUTnYWsvBBwssQCj
         oh9w==
X-Gm-Message-State: AO0yUKVjRf670UgpSGha28MNR7Hl2DG46zwkIaAZxeQsTpGebV5Ei9Id
        BjrDvJ2oPIL0MswORUTRc1fKC0++OIcFuzunUroL0w==
X-Google-Smtp-Source: AK7set/ZRWZmr4fK9BRzq5dNAUC2K47cgi7Bwlzsv/gVUp7p6JUstQoJ4CPHuimwv8Pv/cAkKKJ7oBLmS6UNDDVaUFQ=
X-Received: by 2002:a81:c645:0:b0:53d:2772:65d with SMTP id
 q5-20020a81c645000000b0053d2772065dmr5177050ywj.9.1679086695996; Fri, 17 Mar
 2023 13:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <1679070482-8391-1-git-send-email-quic_mojha@quicinc.com> <1679070482-8391-3-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1679070482-8391-3-git-send-email-quic_mojha@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Mar 2023 21:58:04 +0100
Message-ID: <CACRpkdbA27buNiOTz6ad4gyS4FCvcoYru6QB5k9Lqwiu72sf9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: qcom: Use qcom_scm_io_update_field()
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 17, 2023 at 5:28=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> Use qcom_scm_io_update_field() exported function introduced
> in last commit.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Fine by me, but I want you to first consider switching the
custom register accessors to regmap.

Yours,
Linus Walleij
