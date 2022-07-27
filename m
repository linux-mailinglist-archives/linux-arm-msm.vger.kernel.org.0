Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198955822D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 11:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiG0JNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 05:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbiG0JMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 05:12:50 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B013748CA2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 02:09:39 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id y9so12208098qtv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=t0hf4UQntBvjEEgtCvAucH7uGKb1uBzrDXI50Jj9ZxE=;
        b=A/l93MPO1KNPoZGVDh1VU6A6ApZqMu7OLydaCYN7ZJctYpEjXnCB9osGgGauErcew0
         nxnaFLLzX1LIHCbHUYzPKuDi4YpKsgcsHUpaww+G9xLnCh469E3tkDBQ/HB0UF6RMMEi
         1ch9o7BjGIj+RxrbI8xq4BC6jUkLxZUysnfHLxp3UbgElfTSoY4bilRe34f21CHX/BwL
         QRyupQuEMEGJuCWXYjcty/OH0UfI3hKZ5o3yuw6cGMfOyfYxZC1B/jijKfjJd7Ot81Uz
         uBz6L5JO+CPaZhVhLDBGfnfo9be145yFWeOoz5/JKgapmHKsWwLgb0uq5F6MWNSBzU/O
         nY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=t0hf4UQntBvjEEgtCvAucH7uGKb1uBzrDXI50Jj9ZxE=;
        b=3y8o8HEmX3QltC723xddaXTIxrhJnYvAGqmBFGrW8c71PsIrjZwsolrWjfh1OyaxNk
         Ceczwpd5bZin7KLProrLB6jSkxyZK3txk18ubz7HJIK5hZh+rptWydCQ7Fvfq7b2RXCv
         oUOxbd9CqRggb/l3cs23uadH/Gxz0C/+PcITK52OFoY9uYJIW+rQG/GwsrsI/TOw9w+U
         Sruipf/YK98dJPvnCXGUWM8YVm4kBXw0ieU1PD77Az6FQdrRiKbzsaSPt4Q9DzGxtVss
         0+9xA/KveAFQ1jbBiRMGmWjJLKZDqdG8ApCTydR71hvGiMyev8untgOoh6jzlX9fZr34
         LcmA==
X-Gm-Message-State: AJIora+oT8EUnnZyTSL80pJo2HJXNPe1UAS3w3+hPiexJJSFoQX9QX7I
        3PEY5Ggk20rqIEir+31YSQDBawQtVck8GFPxIuPh4Q==
X-Google-Smtp-Source: AGRyM1v2Hu8xIE4ak2/29qw0dXfDCsbwXTinqCIWgXkDLw/iJ212tDw4uXeu+cTi1kcFSjmv49UYSFY8i4sJ2Uc5qxY=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr4993421qtx.370.1658912978790; Wed, 27
 Jul 2022 02:09:38 -0700 (PDT)
MIME-Version: 1.0
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 27 Jul 2022 12:09:27 +0300
Message-ID: <CAA8EJpr2S-81+q-vjmk5i+T-JwaadkRpjCr_oGi7fMf7o3iH3A@mail.gmail.com>
Subject: PSCI domains without OSI support
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>
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

Hi,

Lately I have been working on improving the msm8996 platform support.
Vendor kernel seems to support domain-like idle (see [1], [2]).
However when I tried changing upstream msm8996.dtsi to use PSCI
domains, I faced the firmware reporting NOT_SUPPORTED to an attempt to
enable OSI (thus rendering PSCI domains useless, as they are now
marked with ALWAYS_ON).

I noticed that vendor kernel makes a call to cpu_suspend() with
power_state following the original format (described in PSCI spec
5.4.2.1). What would be the best way to support this?
- Allow DTS forcing the PSCI power domains even if OSI enablement fails?
- Add a separate cpuidle driver?
- Just forget about it and use plain PSCI as we currently do?

Additional topic: for one of idle states the vendor kernel uses a
proprietary call into the hypervisor ([3]). Up to now we have ignored
this, as 8996 seems to be the only platform using it. I suppose that
adding it to cpuidle-psci.c would be frowned upon. Is this assumption
correct? Would it add another point for adding a separate cpuidle
driver?

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c31-02700-89xx.0/arch/arm/boot/dts/qcom/msm8996-pm.dtsi#L32

[2] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c31-02700-89xx.0/drivers/cpuidle/lpm-levels.c#L927

[3] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c31-02700-89xx.0/drivers/cpuidle/lpm-levels.c#L944

-- 
With best wishes
Dmitry
