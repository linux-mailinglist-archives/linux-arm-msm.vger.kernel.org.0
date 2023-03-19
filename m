Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FB16C0531
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 22:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjCSVFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 17:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjCSVFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 17:05:16 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0833EF97D
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 14:05:15 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-544b959a971so158536177b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJwr32nXo3n3jCAviEoeLqs6lIUA78kCP1VpZbyNQgg=;
        b=CL+UY8SopOn9ob1vM7RQAWFKv3P1o5tmKWr0GBhdBtvGJeilM1qaiBUS12BV7T77aS
         sktmDLln7XEEo1Zb1BFKsV+IOlm8f8/eEAyjtQ8ICoYDI6iXiVoMsh52xuIlCzL/Bon0
         jCSS3T7aTPzQ079DapAu1+cJSQUi9Iifgz2vPh1RtY6afQ9TeLK/aEusRym625gF3Oul
         5pHKSAFD4t0KTRY13yse7lyNLD+zhIUVC3CQWz9iImuR7uFyMw63OIVM+Swlax+OsgEu
         2GpLEC8FrcB5lY7uuxuffDLGzZJ5cQAsZ2DYKjOOIasZTWmXpscgF+eLkTtRq2AcJ/CF
         mEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJwr32nXo3n3jCAviEoeLqs6lIUA78kCP1VpZbyNQgg=;
        b=xdkprj8IMgPQn2mpdIdFqFXAvjNbxuMH40h/nSCgdaC6jdLl4D2zniPZ7wn0iWh0kv
         6ybFAf9EUujVM8o8XZsKJWezDU1i7sSQlRx3P9esC7y0v0YJ7LzDDThqbNoce7DO5VIK
         /5qFqZq1JtfOLBZv2ziYN4mz5pzHe7jqAVvw+rWB+6+u2yS87RKbDoQTgGarPLPar00/
         xVETFVjd4B0Vgki+YqaYjFcE/6NbHASnJbAhux9Y7JVCTCPfWQKwKnjSwPVdi19L32Nu
         0kTtXgY/I05N/tINSeOYxCXROAaad+wka8k4mlIuwV6lY90onCQKTHOOoSn3cnmdpwlj
         Z1sw==
X-Gm-Message-State: AO0yUKUXGPl0qbcs3j0pchDS9M1pbR9hhihTgOi6RTOacy7+qW8EYiMB
        EOK8s9UgNravuD658Sc43RKA5k3CwFaVYWDTBBmNoQ==
X-Google-Smtp-Source: AK7set+xsBN/Np6Fm5HDOI9Y0MBGXMYg1Su1jiQMnSUNnee2Q6cteK4f+D2SVzraHD9lMSM2HujZ4D5MerQnoteiJIk=
X-Received: by 2002:a81:a807:0:b0:536:4ad1:f71 with SMTP id
 f7-20020a81a807000000b005364ad10f71mr8255817ywh.9.1679259914203; Sun, 19 Mar
 2023 14:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230314222705.2940258-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230314222705.2940258-1-konrad.dybcio@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:05:02 +0100
Message-ID: <CACRpkdYpTFncS476ud16RsSv7sraLtJzOVzEL_bNaZRdkSg3CQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,qcm2290-tlmm: Allow input-enable
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 14, 2023 at 11:27=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:

> Allow the common input-enable. This was missed with the
> initial submission.
>
> Fixes: 5147022214db ("dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bin=
dings")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Patch applied as non-urgent fix.

Yours,
Linus Walleij
