Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D560558924E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 20:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238225AbiHCScQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 14:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238182AbiHCScP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 14:32:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD835A2D9
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 11:32:13 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w3so6890863edc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 11:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZXfRi2mrIZZJ4KT+IlnXdFrbfLahWQ9yKxKFGGib4WU=;
        b=vJpjJnv819lAmb+wvmRcOd8vOeY1RIek0+vV+Gvx04J52TG/kQshlpRjluOXzezWi8
         KsSRCBaBh91P9wcB9L4OqcYXySGjKAiTUU0MwekqbLpXpIiu/ikZaEU797i4da4Mu/WB
         MfWjXUZLSff3XLo49IyYW3v5TmtFEFBfX5Iz63fY8JvnacQbmrPZtp9wiQUa1BfeRvor
         zx8zLjlpbfINh/gd8LoJGXEAkRHmyRva3QwXYaOk9bsakjtT2Cl0Zr7RcUlF1HyQXEWz
         gALAqQ2cgwzfCrF3oRakUrh4qMF1NZ+vJKXLThiF/ZM0gOKqvbSAKJT1Z466VKdSG2h2
         fklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXfRi2mrIZZJ4KT+IlnXdFrbfLahWQ9yKxKFGGib4WU=;
        b=cx3TcGb0rjphWvY72SuMbeUg8eG7Dql/59tvzJDOCXSFdVb8YCXCBsTSJOJ94UW17E
         q2LbWrLhhoXx0D66TSK/x94X4GA2HgCRQfZxWvjpt4vT9+LieUPzX+ZeAF7vVl7BFonr
         1/3DmS7fJdASpibWcpr5IlGaR45ZoIt4wusjYLUfIvI+KcqB+PABg7bq8pFX/z4s+BU8
         u60QA65k4BKwy/PX3z5TaJprf9Gi0e1dvZsWVxehJ3MNYm5mpG82DMeXeGUzsljpAQLU
         HAV999msmPR355VGspkdT76PLIZM/hAKiFc1leuTcuGymtZai1mD4hDwnr2JBhv/y56x
         +MTw==
X-Gm-Message-State: AJIora+f6OqAaQU9Qr2QYjKo+l8il9LHOHBLVi4612s5pl69ZnEP/sSS
        QCnEeQs/UAMeIje4SwWs4QY+7HE5MuNhaws6+itqRA==
X-Google-Smtp-Source: AGRyM1t1FAn79Uu5qj6TGgqMXM+EElLhXe+jDnN9s2bDbKN0iwuzIaboCHGHmWpqhGheaaxbcHfZn4zes/4QxnrfeAw=
X-Received: by 2002:a05:6402:371a:b0:43a:ece9:ab8e with SMTP id
 ek26-20020a056402371a00b0043aece9ab8emr26744736edb.126.1659551532069; Wed, 03
 Aug 2022 11:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <1658829764-124936-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1658829764-124936-1-git-send-email-john.garry@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Aug 2022 20:32:01 +0200
Message-ID: <CACRpkdb5Af+7xb+QaSqAq9tkSwth58P9j2qZUdcRkDh62kbbcA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make PINCTRL_SM8450 depend on PINCTRL_MSM
To:     John Garry <john.garry@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, olof@lixom.net, soc@kernel.org,
        arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 26, 2022 at 12:08 PM John Garry <john.garry@huawei.com> wrote:

> All the many other configs depend on config PINCTRL_MSM, yet for config
> PINCTRL_SM8450 we select config PINCTRL_MSM. Make config PINCTRL_SM8450
> depend on PINCTRL_MSM to be consistent with the rest.
>
> Signed-off-by: John Garry <john.garry@huawei.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>

Patch applied. Seems self-evident 2 me, if Bjorn gets upset he
can beat me up for it later.

Yours,
Linus Walleij
