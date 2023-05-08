Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCC526FB1A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 15:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbjEHNgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 09:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbjEHNgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 09:36:10 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B832FA39
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 06:36:07 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-55a10577911so65105877b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683552967; x=1686144967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b01PDYfJqd1yLDl8EB7zSyMERkrPn+OwVMQORzGUbc=;
        b=nEVav/FsigMrHRGJ87udNWnlSpzHXwvmWMdc8wW2XITf4OLHTmRMeN4hHZcboFOpJy
         tU1XXJMvUMV1C7Qp4TUtWu2BVpLpuKXrnku4yvUufCg4pCcCwysehOA5E0izZcMGg9OS
         EitiGRp+Z5YrVyHQ3H1f8C8RWrNa60GOIvvHTvPJCb/3VI56Lg0spoqPLINi86fGgQwJ
         7LAVenbLJ3MvtRW24PbV6xjZeQN5ZC40OFF1dNSsoKgqjDQqV7aC8MDRKAVszTQSLA/X
         +QI1a2hx6hiCUdHhvQTFWHFKWSgqFFwJL31JrhKCaSQdY81PoHnGk8HG5vxlqe27FnCT
         WYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683552967; x=1686144967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b01PDYfJqd1yLDl8EB7zSyMERkrPn+OwVMQORzGUbc=;
        b=YYlaeyVg/LWoENPf+wGi5yKz8iuXhqDPhPLoAy4BFUkR4Rm2xoCUv9nVzmHvdiOP7j
         ZvUq+ODmJhwISxIU8LP2vivZZwXxoBGXOYcdS2oMb68ns+A7xMXsdssKwek1d4HhnlF6
         JCIRjAQS0KGyo9yRIaawb5HOA/Gq0Y1IvhpiyanIbUh5NE9dhu5jkZEgq8HvgwMyN5kk
         Haq4Q6yVVsZLU/+QhEAtZlBgX4HC1Oje/iNsvigILIxI9fJ8ZiWbaM4EztZ5RSBvDU3g
         4TuEFaxQHnBKiad/lxSpQqiCcKnVQAuvkNiEWRoq+2ciCLa7LLnF5kVFVCaYMcaY1KQl
         xvAw==
X-Gm-Message-State: AC+VfDxmY/Z9L/o6580lV3Ht28TAtqeAxx9M8r+UyobJXUFMXZ9iCiVV
        Z+RDWDsLAd/ZrOC5ncTUYtynp2aQRjTRwi/qrEqjY53s4pEkVKg0
X-Google-Smtp-Source: ACHHUZ6H4UI48jW1UOnqKY+jqexZYTAl0fAQsGo9666itT4G8aDM6XIh4ishdOPMYTffUyW3ZMTcqpeZxyt6Tlx5lSA=
X-Received: by 2002:a81:a091:0:b0:55d:1c72:e1de with SMTP id
 x139-20020a81a091000000b0055d1c72e1demr11788038ywg.37.1683552967033; Mon, 08
 May 2023 06:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230430125154.126863-1-saraday@hust.edu.cn> <20230430125154.126863-2-saraday@hust.edu.cn>
In-Reply-To: <20230430125154.126863-2-saraday@hust.edu.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 May 2023 15:35:56 +0200
Message-ID: <CACRpkdZvTd4ibqhS2xQ_7BWLEkXzB_0qguccEV2X0d77KhC2UA@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: qcom-ebi2: simplify the code in qcom_ebi2_probe()
To:     Ziliang Liao <saraday@hust.edu.cn>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        hust-os-kernel-patches@googlegroups.com,
        Dongliang Mu <dzm91@hust.edu.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sun, Apr 30, 2023 at 2:54=E2=80=AFPM Ziliang Liao <saraday@hust.edu.cn> =
wrote:

> The code use platform_get_resource() and devm_ioremap_resource() to
> allocate memory resources for the device. It can be simplified by using
> devm_platform_ioremap_resource().
>
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")

It doesn't need Fixes: if it's not a bug, but who cares. Maybe
the stable maintainers care.

> Signed-off-by: Ziliang Liao <saraday@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
