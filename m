Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD0D766A14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 12:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbjG1KT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 06:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbjG1KTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 06:19:55 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97C73A9A
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 03:19:47 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-583c48a9aa1so21675067b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690539587; x=1691144387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qCnkLOusAvdrrWTSqkIH6Bmp+W/nX54guZfAcZWLujE=;
        b=kWhHjCVcQp/OuWXbafYRHpht91G3RCQl9Iq7XIX/NdqEv997TOIHH1xIiL1P1aEYWa
         QG+23PNU+nYooBkbvWRRRTxPD7gbGHdWo7X+2QAXcZJ7VRkcBpZoft6sWVih8L4+djce
         CPL20EjiEKiKmJJSe+8VZFqxaZ8vbEj/oAajnwXodK5VBPLClZ6GAeLgrNlYlZV/1tot
         99+EiJXC0gZWOSVXtX2saNFiIba3Xc0jUyjuhKqIzePWYfN3R2FQW6YVQvSudZaTcSrx
         6V5qJGryJlONPSQnQWeClWeNy3UD9VyrkKezDpImBJH8XJE104HPChjqxHjFMjKZSvBT
         S0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690539587; x=1691144387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCnkLOusAvdrrWTSqkIH6Bmp+W/nX54guZfAcZWLujE=;
        b=E5o2lnTEhQAB8QXxBhmPR1+yqWd5xpdBbN1kzTVpenkWXWhYC77n9xbzP6fAJaEY5/
         r3vJPFKRCWG77Frpy5USJ74vlcaDWz+lcqKzt4XZeiGnRlxklFmLk9YiWHQXarM9W0jt
         9m5kp0LzzFDmg6eMBFaGALCnNQ62+wPZsCGeSykp4L/CPBYYDLJjbymBo42WHo3uC5Jg
         2Ru5+OP5IaLD/jtkmCZnVWsh0Jmn2xO7lc4CspNagTDBbX1e1Jc7u6i0dsyJF/nA58jB
         RUqPaDAFlSbtxodH8/iBT7rdYPRACF6Y04/Ds1+lOTSLzp9n+SZH1gfKd/5ErJK2wu+f
         RO+Q==
X-Gm-Message-State: ABy/qLbn6vLRKY3OS4hLCURKXoS+zhRg58/2sh/aVgX1mFSy8uiyt3JK
        t5YGqs4e+/+rSf+2RnLnkZGgwLTzpLkXU1ou5rDcMw==
X-Google-Smtp-Source: APBJJlForyLt7cNQ7qy3St40y3d0ASTk8IUe6IWJ9Su0XmN9wUU0pUVoHZ1Du58/u5n3xRN+wa69OnPzN+idqcLYWTs=
X-Received: by 2002:a25:ae68:0:b0:d10:904a:cdf7 with SMTP id
 g40-20020a25ae68000000b00d10904acdf7mr1383429ybe.31.1690539586833; Fri, 28
 Jul 2023 03:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230728100857.471984-1-dmitry.baryshkov@linaro.org> <e4de7d39-978a-0996-1b03-8e7a6712b477@roeck-us.net>
In-Reply-To: <e4de7d39-978a-0996-1b03-8e7a6712b477@roeck-us.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Jul 2023 13:19:36 +0300
Message-ID: <CAA8EJproo0yv7Zo6T6fVNfvDVy7JrtMCmixHH73iaWbssehZbg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] usb: typec: qcom-pmic-typec: enable DP support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Jul 2023 at 13:14, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/28/23 03:08, Dmitry Baryshkov wrote:
> > To enable DisplayPort on the platforms supported by qcom-pmic-typec
> > driver, we need to register a corresponding drm_bridge for this device
> > to be able to receive the OOB hotplug event sent to the corresponding
> > DRM connector.
> >
> > Reception of the hotplug event is implemented by [1], but there is no
> > direct dependency on that patchset. This series implements the remaining
> > parts: registration of the drm_bridge and setting of the proper
> > destination for the OOB hotplug event.
> >
> > [1] https://patchwork.freedesktop.org/series/120393/
> >
> > Changes since v2:
> > - Reworded commit message for the first patch to explicitly mention that
> >    the "displayport" OF property was rejected (Bjorn)
> > - Removed several #ifdefs from the qcom-pmic-typec patch (Bryan, Konrad,
> >    Greg K-H)
> >
> > Changes since v1:
> > - Properly handle CONFIG_DRM dependency. Disallow building DRM as a
> >    module if qcom-pmic-typec driver is built-in (Bryan).
>
>   config TYPEC_QCOM_PMIC
>         tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>         depends on ARCH_QCOM || COMPILE_TEST
> +       depends on DRM || DRM=n
>
> This disallows building TYPEC_QCOM_PMIC into the kernel if DRM is built
> as module, which is pretty much the opposite of what is claimed above.
> It does not affect DRM at all.
>
> Not that it matters much, but I find it confusing if the change log
> claims to do the opposite of what the code is doing.

Ack. If there is a v4 I'll fix the changelog to invert the condition.

>
> Guenter
>
> >
> > Dmitry Baryshkov (2):
> >    usb: typec: altmodes/displayport: add support for embedded DP cases
> >    usb: typec: qcom-pmic-typec: register drm_bridge
> >
> >   drivers/usb/typec/altmodes/displayport.c      |  5 ++-
> >   drivers/usb/typec/tcpm/Kconfig                |  1 +
> >   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 35 +++++++++++++++++++
> >   3 files changed, 40 insertions(+), 1 deletion(-)
> >
>


-- 
With best wishes
Dmitry
