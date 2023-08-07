Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA06771C9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 10:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjHGIxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 04:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjHGIxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 04:53:22 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251F01721
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 01:53:21 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so3480331276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691398400; x=1692003200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VywFqzUwRikyUxE2DnI0oGd/yMt91JTP1bpULF3P/rA=;
        b=egGsPsWx79ZytXzS8jR876wuwAbVGlnQuNZOvxqrHvHDhZQBDdrpt8HylWcVSaBbFO
         0nhXfW1vWhDObm6zGgd7Z0RJ2nKkSXVLkHq6HgMAOCey1OUZBhym91aEt/m/W6ZE1lJ0
         5+rwb4JrT3E4CUGRUh8hyaE3N/ndRccbQyiWSMNVbgQnD8bQNiODFt0iEAP1PeXojTaX
         xdYJM4z8Iy6Us1Qj+/qHDoc86g4gbfALQ1RAcvaYia1ypCteA7nHLqgNRt6KPiM9I/yB
         a4ngMaxavijmNe8qRGgnz0/Sb+Pg59piibfchNBgP1cBL21wZVktIzZ+KUdEIg/d787G
         P68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691398400; x=1692003200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VywFqzUwRikyUxE2DnI0oGd/yMt91JTP1bpULF3P/rA=;
        b=LLYSFdKcI6xTiYZk+pw9NGnCoDF9TMZfUqsgzTPEnzXklR7vd4HLqHEzdUAKzQBm1c
         dOnHlCEXCpk40lFq05xLf2ExtGAIUopDt+gAMoKXwCpihjMqbZ+9PeZkxhgP4a/TSCsc
         xBJEc56oiyaHZcmcSPTS9Y7Vs/pHMzEj6whYtQ/YOG1bhZY+T30uUMWGgisB4M8M+1Em
         Bj2j77F5SP5n1lT9dfoKxsdZK7PbwZ6t66SUztd4eqobd/cVhIqEFUVca1Y5Ok+yy/ep
         qzYnW4p1yPXWGysKizrzzmnUcnpm2KkDef4n2Bkb5MD5DZPx8ZE6d0/uWihG5MuCq3bV
         vc0g==
X-Gm-Message-State: AOJu0YzNUFF2/7gRv08FlydlelWNYjUYshMMqF/yYMnsAgM3xzTjvp7/
        Nuq/IQxWBY+3vtp4RxBBdPEsOiVpIGSccKrJNiniLw==
X-Google-Smtp-Source: AGHT+IEz46EERtshtV203W5qQhkfPicBxkUGXbBmQJ7UNsJLN8Ep2x9oUFL1iiaNTNCKH0BmTltIYftcXDjCPL9MIEk=
X-Received: by 2002:a25:c343:0:b0:ced:44f6:2d73 with SMTP id
 t64-20020a25c343000000b00ced44f62d73mr7277101ybf.50.1691398400362; Mon, 07
 Aug 2023 01:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230722-topic-6115_lpasstlmm-v2-0-d4883831a858@linaro.org>
In-Reply-To: <20230722-topic-6115_lpasstlmm-v2-0-d4883831a858@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 10:53:09 +0200
Message-ID: <CACRpkdY+7Ax8Fk4jPLvo_iS1=bggTcFnv9vzUXRS2dNQPxq14A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] SM6115 LPASS TLMM
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 24, 2023 at 1:39=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> Konrad Dybcio (3):
>       dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add SM6115 LPASS TLMM
>       pinctrl: qcom: Introduce SM6115 LPI pinctrl driver

These two applied to the pinctrl tree. Great work on this series BTW,
thanks for Krzysztof for review help!

>       arm64: defconfig: enable Qualcomm SM6115 LPASS pinctrl

Please funnel this patch into the SoC tree.

Yours,
Linus Walleij
