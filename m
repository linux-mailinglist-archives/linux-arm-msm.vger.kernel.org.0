Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCCD2546E99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 22:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348454AbiFJUpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 16:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347886AbiFJUpF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 16:45:05 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D7139BA0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:45:04 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 93-20020a9d02e6000000b0060c252ee7a4so57093otl.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=JmSm7RdG81p3jLk6y5qdqPkBOS3Ze//O1dXyGVO1Nbg=;
        b=hx7EhdeCKh6inM6hkWhAKuFdb0vq/lRb382k+PleprdIMQ2uGBzzviUYDM3WQ7YATs
         RY0827T+hJF7MsDFblzWBgl6zkXdUOV1uN6SYI9ZFGIhQQC12KR9jg2XH7slDyAwWQqd
         FfdOVfhD2WBsU8VqRmUiwCp+OQnmGKtvGKYN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=JmSm7RdG81p3jLk6y5qdqPkBOS3Ze//O1dXyGVO1Nbg=;
        b=RSm+NpV0QLysaocwJ5Om+JT5fwAFLUhpzkgFXHVfyIOiylZknI1AaZkgovX2EyUY77
         mb5cTEOLizOV32A5CqL97v7nDEknzkv+PFEk8chj+Tqplof3nqs9J5hkzvb9dBUcxJrM
         Z0Tra7YIq2VrtengAiWDeah9vzMCGIoatbdQYYcrXLz0v5Rsq3O+I+dumlOh2F5QVDFY
         PWM18+tRBzkaY/ukSrw+ljRicH2+/HDDsKZRLHPyOIXp11qdV8XAbkFTvTUofMc5NQa6
         D2CRf/CCSjsG6TJ2xgd0j2rsmv2xidvMWazDgyjJJUE0hceAhKitYCh2cJ0/7vnqJeL5
         KIdQ==
X-Gm-Message-State: AOAM533NOGwkpyF4PQ/ALU1CWYFqgG1W9Cl7tW9Zy8ILmAt0IcJmk+qA
        fuV6JvTRBSm3nYzdpuj+9KAA6c5fTg8ItOqUUJ1feA==
X-Google-Smtp-Source: ABdhPJyVwgqwzgCOH7YHHYBukvLs7hN/oJj2R+vCwTuhCUpXh/chu/SlAzFUgiXK7m9UfZ68NJT8jD1/SJSmMWm1T78=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr114803otl.159.1654893902756; Fri, 10 Jun
 2022 13:45:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:45:02 -0700
MIME-Version: 1.0
In-Reply-To: <e8637fc1-804a-4ec5-80dd-4afa2dfd40bb@quicinc.com>
References: <1654602615-28849-1-git-send-email-quic_c_skakit@quicinc.com>
 <1654602615-28849-8-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n53iZk3U3ZWHj8VBUn2gi1KzFz0ZdxABiZvTPzK=cKu1Ng@mail.gmail.com> <e8637fc1-804a-4ec5-80dd-4afa2dfd40bb@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 10 Jun 2022 13:45:02 -0700
Message-ID: <CAE-0n50Xqdy0sCpw449CgxT5rz79tBNGFAF7xgAYZDP4E5r1BA@mail.gmail.com>
Subject: Re: [PATCH V14 7/9] regulator: Add a regulator driver for the PM8008 PMIC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya Kakitapalli (Temp) (2022-06-08 22:20:27)
>
> If I place it here below error is seen
>
> error: ISO C90 forbids mixing declarations and code
> [-Werror,-Wdeclaration-after-statement]
>
> It could be placed at the beginning=C2=A0 of this function near the
> declarations though. I see that many of the drivers add it below the
> array itself.
>

Ah, use BUILD_BUG_ON() then.
