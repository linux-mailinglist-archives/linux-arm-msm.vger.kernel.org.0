Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2E75EE30D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbiI1R03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbiI1R00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:26:26 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66253481E4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:26:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j16so21432911lfg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=vdzPIwg7C3PKLnfi0wdXAYz0fhgIghBeZanBr7yxrY4=;
        b=Jam549HMJC/Vz7pu5ChRmT5oSoI6/N0XhYy0mQLM/dqrkUVdL6fnaM7NR6qHVjUUgb
         74VhpNqQJ9zFlLNfJsRFIfD34wyqjskcbdu+cg/o73KImxXq8NeDl3NrZsuPvF56msRs
         STg/Rbty+f3ORXIFRzXLQaumRivNxLCdjYQSxErKhsvY9kkSNhuLzm/Of+134EWJkRFx
         Fg/xvL8xS8tCJGLAFEo8bkl7j9x+djwBHAANxlIXf4LUFyFXKTgH0jEZ6qkFvZvFd/uP
         /3aqrFKO3S2j7k5wvzAXAanDHwNC4SDwWBnNSfpsh22zl9E6jV7rBiZtUkRCApGM0cTu
         geIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=vdzPIwg7C3PKLnfi0wdXAYz0fhgIghBeZanBr7yxrY4=;
        b=KdxRsZGbOTr2yOZy0+SHmmmeSEQLY0vT9gIEWxDixaV1kdjef+xxjEbRBCBfuOM1Vu
         jcA6Dyjew7e1pfUwY7Xo8By7KrxZ9fpMsFzDt5E7MyhvFO8hQO/5ZE6CqN7XALBJ04SP
         HgZnVVcKUS8ayKcoosTx1UXu7jPKfWph25tLZoWPpEaFGuLl8OLQYhF8lUOtyXFwpDAt
         R0prPaozU4ea386weNjNdK/xWz3mgYMdebUY8B2GxJSMFkKj36juenBKxa9xh3bN+CfH
         p5bI8sNgJAwnsC4j9YD+gKCZ01SKJRLx0wESy7BsTfXbgpEaxcIjtN/Dk2OpCXRJ48Xy
         j/fA==
X-Gm-Message-State: ACrzQf38k38s1DRoi9Z5k9ysbN08F8ln11h9r2vfSLMBASaKPHdQNAih
        1fe419KbVNfLFZM/LpQlLiwWA6M/PCz3VA==
X-Google-Smtp-Source: AMsMyM5xaNiPkfM7hlZSxiQtNaOcfzJRqrNabhOO3y0wIWWqI5mu+EqnaUjtgRH6j+ZJyqZmk7ypBQ==
X-Received: by 2002:a05:6512:22ce:b0:497:499e:c966 with SMTP id g14-20020a05651222ce00b00497499ec966mr13242274lfu.402.1664385983807;
        Wed, 28 Sep 2022 10:26:23 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.4])
        by smtp.gmail.com with ESMTPSA id f1-20020a056512360100b00492dbf809e8sm526869lfs.118.2022.09.28.10.26.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:26:23 -0700 (PDT)
Date:   Wed, 28 Sep 2022 20:26:20 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] phy: qcom-qmp: fix obsolete lane comments
User-Agent: K-9 Mail for Android
In-Reply-To: <20220928152822.30687-2-johan+linaro@kernel.org>
References: <20220928152822.30687-1-johan+linaro@kernel.org> <20220928152822.30687-2-johan+linaro@kernel.org>
Message-ID: <829EB2BC-4DFF-48FB-BB16-944D6597C601@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



On 28 September 2022 18:28:10 GMT+03:00, Johan Hovold <johan+linaro@kernel=
=2Eorg> wrote:
>All QMP drivers but the MSM8996 and combo ones handle exactly one PHY
>and the corresponding memory resources are not per-lane, but per PHY=2E
>
>Update the obsolete comments=2E
>
>Signed-off-by: Johan Hovold <johan+linaro@kernel=2Eorg>
>---
> drivers/phy/qualcomm/phy-qcom-qmp-combo=2Ec        | 2 +-
> drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996=2Ec | 2 +-
> drivers/phy/qualcomm/phy-qcom-qmp-pcie=2Ec         | 2 +-
> drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec          | 2 +-
> drivers/phy/qualcomm/phy-qcom-qmp-usb=2Ec          | 2 +-
> 5 files changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Dmitry Baryshkov<dmitry=2Ebaryshkov@linaro=2Eorg>

--=20
With best wishes
Dmitry
