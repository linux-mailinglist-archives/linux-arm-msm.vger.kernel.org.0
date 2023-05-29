Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4177371476E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 11:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbjE2Jss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 05:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjE2Jsr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 05:48:47 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672CB8E
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 02:48:45 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-565de553de1so23851257b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685353724; x=1687945724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkLT+DVMzICOnkgjPvqf4ZsRIt+r0mHmPWKwJTBzXWU=;
        b=CyDVTNmv1DnZ4uqfsBFy4mv/pjTmzqCkJpWiVzdJpXG2ug0CxBEqgyYxdlZjvSxSfI
         LUHvbKq8eYW7LzoUsp3uQ/aS+LGNCavbyjMbsXRhYBOSxEsWx4p1wiTweTbHK1m+eob6
         IqlIP3hjDac3skT4Eq7fAr5ljdVssSgOQ7ZWKCRa28Gxbe+DJYuYu36CmzpIZ4dJF84g
         egCaQxMqG9mAEs+bzE5smlDv8Bcx2ELQY4B3bsEM/QsuMfLdOR9vbGFWateb7AdUAeG2
         lmwug8b8FgVkUcFq7YhBcPRiUIzZ8nLwbCetyk+pZypV/3F0IblhNVai4APo7W9+u7lQ
         ac2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685353724; x=1687945724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkLT+DVMzICOnkgjPvqf4ZsRIt+r0mHmPWKwJTBzXWU=;
        b=M5T7m9CkQlQNdplbbzujYusFtjwUU8XDhWKnuxn/5mUK5gQD3Vh8Klnmyazuc1C15W
         hC4/mjRUQI59EWsmC2nCS3Ja0tOItn8r/oBx6NipHGN8neg7wN7r0TouqDI/P0NDS+5C
         iWbvMbNrmDZC7REsCwfJumDRTg6Zex9Kx0iRD+hkJLiJL68fKcWefY4xyclSEKQNt+aY
         TKuo+NB4ul1WPIwB/LhzydBvbW4lB/Umsso7W9Hu2MYGaR/CW3WBW1fJ6TCqOP/V48DC
         OxBAvLnWm4Qhle9+um3XoE2B6Ie6xGstfEwatH3PnNqUSEcncFwW3AXWVcd6EDRs4Wd0
         RjwQ==
X-Gm-Message-State: AC+VfDwcag7lMLrtxVa8KJzg4S5os0ZZHdr7lbmhdhydMF3CmkdA4aBJ
        AyaSAGlIzdLVSMyfJLxwCvlZp/cQS5DJqkEmDOJHiw==
X-Google-Smtp-Source: ACHHUZ45PczqAN4JRC6veTjLq/Vb+3bm10ke8fPRMdk1dEMz8VzTvJT1CAFvipsfEvpARvYvLwKiaBMuDU7HWiITYEs=
X-Received: by 2002:a0d:d948:0:b0:561:89f1:6bb with SMTP id
 b69-20020a0dd948000000b0056189f106bbmr8975758ywe.6.1685353724684; Mon, 29 May
 2023 02:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <1684425432-10072-1-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1684425432-10072-1-git-send-email-quic_rohiagar@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 11:48:33 +0200
Message-ID: <CACRpkdYOOsOwLRw_5=MzmrwpBg8EnkgNKD1+gXjSUHqvtRuqkQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add pinctrl support for SDX75
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
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

On Thu, May 18, 2023 at 5:57=E2=80=AFPM Rohit Agarwal <quic_rohiagar@quicin=
c.com> wrote:

> Changes in v3:
>  - Addressing minor comments from Bhupesh related to reusing variable.

v3 patch set applied for kernel v6.5!

Good work on this!

Yours,
Linus Walleij
