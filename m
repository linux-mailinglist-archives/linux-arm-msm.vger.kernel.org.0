Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8BB6F3042
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 12:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjEAKiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 06:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjEAKh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 06:37:59 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216E5D9
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 03:37:58 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f193ca059bso12787085e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682937476; x=1685529476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XUFrN73mOh0JgUZRe7aXQZS5NNy9xGVMTM/WhLZlcp4=;
        b=byoHvCMmhUlW5EU6O9UVDBWuiZ6f6/vcO7hXQEvXxj+870kLIHd+U6kr5e59Z7bh89
         FtV7Tt5AmfXcrjhtnn0mlc7mDLfCnJM3zJQCLN/KDNpTIsH5djQcv7wjdhyB0TJ2PkNK
         k0LgSEBPVizKU9LOfBTBoXnMRQOvbq1fWkdh9SyVSHzuGsmJYqqEfLp+O8lSANRsIJ+2
         /Kbtq9OzzX53T5WxnsMMjLqAV1x7CzF8EH5zA+gdjINvkGNIl/Se0G/M/5Zp8AieIlnf
         QNR6fcV31aHtNrCIxH9vZgkaK3BlN8aPCqrXeSRzX5+cgVwMJCnF7E07WmRGLzkRcvsW
         zOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682937476; x=1685529476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUFrN73mOh0JgUZRe7aXQZS5NNy9xGVMTM/WhLZlcp4=;
        b=a5iv38wMkXMx1QijpQn63CYJ/mv7BmKJMCi/rNkCJ34yDzVzSpTAEfXwKrMocOVuqo
         bd0+z8bfzpTx9ZgreCzI2lYXJJEjgT8Eoz8PiS1n7clAMTow3/2d4GZV3yNTABVEbiZ3
         KyrBBfi0j0b4v2T9ZFoTlQm7lQHQqLaS6m4n2W3ouY+asSh35hwJcxx1MvVt8lpH3BC4
         sUvbiHwEwdG+m7irqYRCBIdCwUWXmLDyKRJIdGAhtSM3AgMkwclAjYXqPWPQAO6Okok8
         frY2y8AIxQ0mU4j+jluMW6Qa04Dxm7bHAd5DCe7cljuSZ4aBYeCCvOcEQuKa9ZxVtOR2
         mLJw==
X-Gm-Message-State: AC+VfDw1dIET2QW542JUveiHCUnFh4a2NO0P6zy0UG9Vy18Ew5Wum7uX
        QIf74OhQnkOf1FAHM8l10opatUWwTmlaeJ2KRS6P1A==
X-Google-Smtp-Source: ACHHUZ5IdM5Qveq9OfQ8rEUvlCr0SKGNHHh0wMsIpYCugnf3wnjOK6EF+kdiJZBvF1zZRAdR4PIJ3D7CiLgO5Pymows=
X-Received: by 2002:a7b:ca47:0:b0:3f3:1cb7:b2a3 with SMTP id
 m7-20020a7bca47000000b003f31cb7b2a3mr8615957wml.9.1682937476525; Mon, 01 May
 2023 03:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230501102035.1180701-1-bhupesh.sharma@linaro.org> <6a37f442-3448-93d0-99dd-705f2727f80a@linaro.org>
In-Reply-To: <6a37f442-3448-93d0-99dd-705f2727f80a@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 1 May 2023 16:07:45 +0530
Message-ID: <CAH=2Ntw0ihy0j=Yx1PTjr1O9asgeFCp8CGVwvnJ97aJ7Ky8Epw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb4210-rb2: Add SD pinctrl states
 & fix CD gpio
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 1 May 2023 at 16:06, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/05/2023 12:20, Bhupesh Sharma wrote:
> > Add the default and sleep pinctrl states for SDHC1 & 2 controllers
> > on QRB4210 RB2 board.
> >
> > While at it also fix the Card-Detect (CD) gpio for SDHC2 which
> > allows the uSD card to be detected on the board.
>
> Separate commit is needed for the fix with Fixes tag.

Ok, will send a separate patch in v2.

Thanks.
