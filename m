Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B457755747
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jul 2023 23:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGPVGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jul 2023 17:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjGPVGn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jul 2023 17:06:43 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0AB1AB
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 14:06:41 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bff27026cb0so4104176276.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689541600; x=1692133600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdfCwih+5dEsklJPwU/YkEF4cHq6v8XcSCOAFgMBsQg=;
        b=x3DeF3yeIoB4iyzvNdtaDUi3o/duhMLvHXaCCUlrp7rfvqxpWc5AW9fVhVjzk5X6oe
         KlZ57RwU8n4v4ckvFDz55IuXCWzw2vDYvtPF9aEYpyO5BIUpqYYHebA9kpmJwggRv8uk
         0uoq4HJlR52IEYx8f/eFZF7hhsNfd5QMMzHjxRAYfDtwR7RKX+dFoDbAA1qkiDPK7avC
         O7euvbdUvCPC5jurm3QcShLN3jQe4l9wUSCknTIj/4AfeXyvgVijtPb8jRVt0/8NffER
         BtoI0DNY/MGZY0paejKtHSwfr2gVf/IweT/NiOmUbJvQkXC6Jo7sxf4JJ/AIo6adLUn1
         IjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689541600; x=1692133600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdfCwih+5dEsklJPwU/YkEF4cHq6v8XcSCOAFgMBsQg=;
        b=HiyQznAf5haJvyyuYRbiGtVZR/5oFQvfeGDIvxTYpzTFnOf2ZUOPBNfpDEy8S6Sx+V
         8c5JKbVTtd5m+aXceeWVGdViW7CDVbTwbLUPrnMuA9DtgEFHj2Z4otRwnEptRBmsgsCz
         SkuYO76grb1rNnPH5tVMJ5eZL0rsxl4Dxizs13LMxOZy0q7FmuLIae75lo4JuJNuWDBh
         9inG7xllVk206pW1fl+wjbk59fpc7iWRoa+wvjyen1Jcly3rEJHu2ZCN0zTwh+nqCfxW
         1wtzz7xug6kCwXsKAHFwfVHMlHe3oqUpGyp6fK+o7fC3vrQUKHYtPfeCA8CZtI+E/TGw
         oCUw==
X-Gm-Message-State: ABy/qLYtjmznftnVUQLlbbVvC4TbgZvijnxd6nDFtGuvmN60E1w0gGZq
        cfrxUvqpg1eQoAdO7Kc8/+5c8MBjEl/7I66SRioQDQ==
X-Google-Smtp-Source: APBJJlGYH5otWM7ZH+BmR5IMZZxK6D2cr9NtseCkEkmHNTjTEyYhzBuFRf/ivmKV2OxPDC3n/BN3V9HuKHQ6fNxHy+s=
X-Received: by 2002:a0d:d847:0:b0:570:4646:15a4 with SMTP id
 a68-20020a0dd847000000b00570464615a4mr12170396ywe.8.1689541600343; Sun, 16
 Jul 2023 14:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <1688707209-30151-1-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1688707209-30151-1-git-send-email-quic_rohiagar@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jul 2023 23:06:29 +0200
Message-ID: <CACRpkda3SeW=E=cdEd7bvdd_DTTXLoyXAPBx0n6wYOk_GnQoVQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add pinctrl support for SDX75 PMICs
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rohit!

On Fri, Jul 7, 2023 at 7:20=E2=80=AFAM Rohit Agarwal <quic_rohiagar@quicinc=
.com> wrote:

> Changes in v3:
>  - Corrected the versioing in this version of patch series.
>  - Keeping the Reviewed tag as there is no change in the patch.
>  - Updated the patch series subject.

Patches applied!

Yours,
Linus Walleij
