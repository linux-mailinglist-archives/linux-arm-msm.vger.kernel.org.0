Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F124704E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 15:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjEPNEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 09:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233026AbjEPNEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 09:04:39 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A1D6590
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:04:16 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ba76528fe31so3676569276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684242255; x=1686834255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyHzhEzewtSr9qT80gAaJVsweRm/vdYifkr1pznjePs=;
        b=GzDncsFtWn3PiK6yqKbw3AyG24JOvl8bqlLQIvAIdzzQ0FELfv20xMhlm9Q8Goa3WU
         PGaSPH4poNqcHAcUUyegimmR0+0OcvxE5TM20CDOxVJ22EEY6wVIV9yLDVOclhhfn19j
         Dq1JOARRbxhJ3sjcqGjnhjCtEQeiCA5P+F7RumEQXxRzFIS8BAiBtDftBJ4DkbOrFwDQ
         bWt8BzI3gItcBTae00pswDLrCJjJ9jJOilaxOGS6+NypQajgaxjt5g8d1vqdsywgM7Ry
         IwSXKwZdZChUUclMrPqt+/F+gSjOTjoLV+jFSr3aAqBIBMPU6JuUWdc9mv3i2cBUEd3Q
         gigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684242255; x=1686834255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyHzhEzewtSr9qT80gAaJVsweRm/vdYifkr1pznjePs=;
        b=ka+tjjEyicvzrBUy338dXWrvNFAyMCFC6iXcp1ohwv+8jXBp1guFkxLbmRZEnquozU
         SUmdZeV/AVZZ0/vKm6E2wqpvmU7LPqtYWX3LaqL0wMuMfg/XeMINCVIn6vuHK0Xlrqn0
         6PA3CeqE52XudGfb/+7RebOI6HuaPQUBYKO8FBQbWBIdr2w4axYRTB2/OGT5v34kS0vI
         qrtheoWXjHd4u3/6BhHnF3KFnOWnb4+L/wv+XvC7v4v0fQtSFIKnJ296WVvnt3SbgWEb
         V24BjztpHDe5/y8E+pX+hs9rnydd5gSgNAPCR5TR3V6OtRDqjfPMLWb4J++2xBoh4kB8
         8rTw==
X-Gm-Message-State: AC+VfDzgGujtoGDKKEPkeBezOM8ytersILZ9iaHoYLYkyzVH2PgtajY/
        8hY+dceACrPe+e7eukSqXWPh3yRUOkRR+ed1fb8uIw==
X-Google-Smtp-Source: ACHHUZ5LLSZp5N8AjFtcsS+Nblq75Sx9hUmlFiigH+cSwbzXVQ2MmX0+UvUYUq2zTalIgFeaTqBJCdYWkYRvJvugECA=
X-Received: by 2002:a81:1cd0:0:b0:55d:a851:1aab with SMTP id
 c199-20020a811cd0000000b0055da8511aabmr33116341ywc.17.1684242255182; Tue, 16
 May 2023 06:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <1684133170-18540-1-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1684133170-18540-1-git-send-email-quic_rohiagar@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 May 2023 15:04:03 +0200
Message-ID: <CACRpkdbu95hkFWJtCKoUXCyLfS2hxUywD41iF45ZtgKzqjXAJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Refactor the pinctrl driver
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org,
        andy.shevchenko@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 15, 2023 at 8:46=E2=80=AFAM Rohit Agarwal <quic_rohiagar@quicin=
c.com> wrote:

> Changes in v2:
>  - Added changes for SM7150 as well.

This v2 patch set applied!

Yours,
Linus Walleij
