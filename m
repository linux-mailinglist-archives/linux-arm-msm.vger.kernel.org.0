Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 938FA729072
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 08:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238692AbjFIG4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 02:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238589AbjFIG41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:27 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACAA3598
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 23:55:57 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-565cdb77b01so12517297b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 23:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686293747; x=1688885747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZUFecL2O9/GZEN1hKmxyv/duFaVrRit7bbN2Zt7pr4=;
        b=qyfcFmQFLMByJcnxqXDdxeSb/MNFQeAXc1wPdxjpYjXQzj9rOlzIZyboOdvsOJu9so
         x+n1m8djqBu2kiZjDdWumE6EYw/lEtjgEUGeap4fJH4hFNuTlvlP6fe6AjgjmKyPviir
         GLYffRr/ZIKq3jWb7BYWtOW8WN8M3O8scfI009yCXOWPNv2WtMhTFOaN2tHH7Yn7TcYL
         nDBJzBisAlm93BYhM+Q4Wy9ogenG2bFR0b1C+Rmcl6xuCclrBt8wN9Wb/2Q62CK4Zhpo
         A+nHe4Im6G9KG7KBGcMriGfdWL1qqWcgIEZzHkiyDJmEg3VgB2R08a09EKyz61uKCtSc
         +Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686293747; x=1688885747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZUFecL2O9/GZEN1hKmxyv/duFaVrRit7bbN2Zt7pr4=;
        b=jn/xdKu488AJeYQ1T4MbYGMRqKQC207/8wtSYB4tatpBTPhknu0oF/dBte1A0mEIb/
         dAIj4t+lK/WCPTdPZcWx2v1U4wOtYNhDvIBcapuKBR31FY2WrWGWuLt3hZD292B/iDww
         PhSe5GhYwKFxHjvhVglJP5KHuEVDDINRNbFcoJ4bbLx1aDDes9IHC1WOykT4yXcsp6F6
         DZ5SS0xriZ71yLKQ2xLJOMdArgZ8sf+vRFSzi7ZCJzMBnAx6e3OLw0oBDJ/Yj0CFEPma
         t1/fnbOO/iwxjLZ15Oy6ialR/4+jxA9+z7gKT6UbKajes0pBntrSSYDzwL52YOlzeIjh
         y3qQ==
X-Gm-Message-State: AC+VfDyqik0O2mjZHKz1P6GAuWPqR26h1fYm5SCJOENg3OWD0l07LoP3
        L2550uOAayPQnMJ9JsKCJCwyegmCaodjwIDWgmBvjQ==
X-Google-Smtp-Source: ACHHUZ5vQLrbvAK4LANdhCpIwv+QOEXpNH+EWL8HamiNOTDPfSaHPkHL1fwjMU3qEMq3LNmnQmyOQwm0D0Hp66yTLlo=
X-Received: by 2002:a25:f804:0:b0:ba8:32c9:dfa1 with SMTP id
 u4-20020a25f804000000b00ba832c9dfa1mr350415ybd.60.1686293747188; Thu, 08 Jun
 2023 23:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230602033146.46387-1-quic_minghao@quicinc.com>
In-Reply-To: <20230602033146.46387-1-quic_minghao@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 08:55:35 +0200
Message-ID: <CACRpkdaxuSW+4yL_b3iTKacAedYxrjcZ4YFy+sYU__THX3zDsA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Add support to log pin status before
 suspend for TLMM
To:     Minghao Zhang <quic_minghao@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_satyap@quicinc.com,
        quic_tsoni@quicinc.com
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

On Fri, Jun 2, 2023 at 5:32=E2=80=AFAM Minghao Zhang <quic_minghao@quicinc.=
com> wrote:

> This change supports to print pin status before device suspend
> to debug for TLMM. And expose 2 APIs to enable/disable this
> functionality.
>
> Signed-off-by: Minghao Zhang <quic_minghao@quicinc.com>

I'm waiting for a review from the maintainers on this one.

Yours,
Linus Walleij
