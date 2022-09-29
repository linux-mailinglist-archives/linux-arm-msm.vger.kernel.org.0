Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D565EEAD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 03:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbiI2BUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 21:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbiI2BUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 21:20:36 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1609CB56D9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 18:20:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k10so60985lfm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 18:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=PyA6JBZ/HLPJA0MSYRFOgBZKQs1v6t/7oG2AsVljbwA=;
        b=cnoIUXNM7y0Bx6E39zrU9pROCXP+TwDSRNusZ4S6UPUgk7lla7MB/QQzbc5dwyEX9P
         8fNXAUPeBK6so/28gYHdEMd4sVI5/q/0+poZEl+j+NGzdhZrT4Oh6Fn8OK1RvlrO3tRc
         faslcLLDDm6RV50iLLmFD/Kgz4ASmJmz2C1cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PyA6JBZ/HLPJA0MSYRFOgBZKQs1v6t/7oG2AsVljbwA=;
        b=7lv0N+/cMwaSzcEDT4791HguAHBMC/awse5QC664HRW8LnfPJxGHVMTx2bp8G0w/k4
         5ZHn/gu00TeVk6bjDd6nn7XtmAwkxOpS6LtDYeOQGxCbf/3+tweltVCkQ9zzSXgiHHE1
         4M1Z5VnpZ/O4gzUtwwflt5ECzRApO0qPHNbUX+Fsg7elHw8Detq/Q19TfNRFu0ZEi/Z6
         O0IzjcqEdcveS/AiuhomOSGMGGwAl39VuFh3yZK0/GxW6uSG9x4LhL5yM8mF8E/eywcL
         1fHboyYBd0ZxdNFbQ3v73tZ+jiNEmFyxQKqGA3QYvHAs7kJMzLVeJGsYGQQT5sNH+jZN
         tPPg==
X-Gm-Message-State: ACrzQf30Qyex+ats33hPFWw/qI+KfjsA0HajfdeyJULV3OXvO43TXA0r
        Mv9ulnP0Y1dpzCstkErQEUMMLgtvwfbDhcDMoVI8/Q==
X-Google-Smtp-Source: AMsMyM6UGys+TKU82G78ADGDam7TNcOi0qQ36vJR4ZLCRet+LNaUHFDhfTG2aNNJ3/LcQS7hJhR1Mv+UkmcjDfeuFVw=
X-Received: by 2002:a05:6512:1151:b0:4a0:50f2:9509 with SMTP id
 m17-20020a056512115100b004a050f29509mr327722lfg.297.1664414432376; Wed, 28
 Sep 2022 18:20:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Sep 2022 21:20:31 -0400
MIME-Version: 1.0
In-Reply-To: <YzQf7hf15vvLeGse@google.com>
References: <Yr66ZZqEnBApHYMA@google.com> <YsLhxx+L3+GJDRyO@google.com>
 <bcc5f059-b991-296a-bba6-9cb1236097f2@quicinc.com> <Ys1tYAO39LKzEAOE@google.com>
 <dc737abb-041b-491a-14f1-a584f9e64a3d@quicinc.com> <CAE-0n528QaTtZFp=WAaHShegFRpKVN_67jQfUJTtsRPr6s--zA@mail.gmail.com>
 <52039cd1-4390-7abb-d296-0eb7ac0c3b15@quicinc.com> <Yuz2O+lZ5W7RviuA@google.com>
 <CAE-0n507SLeYB7XVzGFk=RO6YjOPoGpux+_N2AyrmL354mQJ-g@mail.gmail.com> <YzQf7hf15vvLeGse@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 28 Sep 2022 21:20:31 -0400
Message-ID: <CAE-0n50cX5ky3By976RTecKkpeMoAjoBA4tYuWSZ150JfS9wiQ@mail.gmail.com>
Subject: Re: [PATCH V15 6/9] mfd: pm8008: Use i2c_new_dummy_device() API
To:     Lee Jones <lee@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2022-09-28 03:20:30)
> Wouldn't it make more sense to simply separate the instantiation of
> the 2 I2C devices?  Similar to what you suggested [0] in v9.  That way
> they can handle their own resources and we can avoid all of the I2C
> dummy / shared Regmap passing faff.
>
> [0] https://lore.kernel.org/all/CAE-0n53G-atsuwqcgNvi3nvWyiO3P=pSj5zDUMYj0ELVYJE54Q@mail.gmail.com/
>

You can continue reading the thread[1]. My understanding is it's one
chip that responds on two i2c addresses, thus we don't describe that as
two i2c device nodes in DT. Instead we describe one node and use the
dummy API to make the second i2c device.

[1] https://lore.kernel.org/all/Yk3NkNK3e+fgj4eG@sirena.org.uk/
