Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51D672029E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 15:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235654AbjFBNHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 09:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235901AbjFBNHV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 09:07:21 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B381B7
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 06:07:19 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-75b064451d3so197022385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711238; x=1688303238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RAI4vy7gsUhap988dUNs7BKw8upS15dtgSM+VQvSEy8=;
        b=lSdiN6qXb01JDFh7xVCXNtJWGHjWni9tPWdGWAgSyFBRjuoPvUMBqa7C8INDifwZ+H
         7/28dqNVGUgZ0yMqB7Iqc+rry+/bLYL3Kh9tHKIkpD+X6HW2jOZk2QTY6TWY9LJH1ghw
         2OHafWQe0kLj0AgQw+GaImQsH8GvQMx1GjVeJnIbMK8nmbXqmwYbmKNzF4puhnvCuPwD
         1eqUDexjmX04YO5lNWI0pPOec+ULtmrcWvY/KqCZJ4w80EN0bSbrY/8jsuVhbHx9SpNY
         8oQUq+6CcHpfzTzhlk/vOwXqE7olwW5j+pEswRQDSJr4nqfx7V2YoOiNBvgdJsWMsdyf
         v6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711238; x=1688303238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAI4vy7gsUhap988dUNs7BKw8upS15dtgSM+VQvSEy8=;
        b=Y1GBot7lNXXUNFJ7e02wudLfM1eQH8EA5rDFrujSm9HsSrNkceIizXrGZ0cht+MI2A
         3FFJmMaLK2fxuehMIRy3jBj76fye/XvBl4L3iNep/r36DlOiJ0ifPcUlvpfRZUWuzCgA
         QkRYH8O7w4hzyi7A0j5Yr2B0Wuc2TlnyWEGAHOeZt4I5/FcuwZNFN5KEeaaGJZgzW9uO
         ohnAbNW2hgoa9f4yS3DRI0czG6aPyhqqd80uwCmXVBfrZjaQ1uLchARrE4MBMhYFx8pl
         p66Pq10m6K1r5Kzmt0eRZXbtfLKspcupLK75X3a6wfpYa9SmxMdwj/n/ESY/8aINHgnp
         8hwA==
X-Gm-Message-State: AC+VfDxl3CA4Rv8fKJRSi/A4ikNOCP9xk1tMazpKjulI/hpWsIl6fuTt
        WSpGZCa23eTL1QddM2wG6gDBWcJJrT9iVaULW6P2qQ==
X-Google-Smtp-Source: ACHHUZ4h6QFgC70g3Tm8W5gJdO09duxPAozEZ1wU7UWxUx+ToaQIyE3xchZLn1sLYCdRxrhXyN74lcExyjydetLiOyU=
X-Received: by 2002:a05:6214:27ec:b0:626:cf8:633c with SMTP id
 jt12-20020a05621427ec00b006260cf8633cmr13482756qvb.38.1685711238577; Fri, 02
 Jun 2023 06:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com> <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
In-Reply-To: <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 2 Jun 2023 18:36:42 +0530
Message-ID: <CAMi1Hd1WF77UF0khEs0XFFvS05issVNo1=sxY9e+VcNFFOCcuQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2 Jun 2023 at 13:00, Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Thu, 1 Jun 2023 at 19:35, Doug Anderson <dianders@chromium.org> wrote:
> >
> > If you reorder the nodes in the device tree, I think it'll change the
> > probe order. Does that affect anything? I'm wondering if there's some
> > sort of delayed reaction from a previous regulator.
>
> Hi, Bumping lvs1 and lvs2 regulators up to the top of the list in the
> DTS https://bugs.linaro.org/show_bug.cgi?id=5975#c4 does seem to work.
> I can't reproduce the crash in 125 reboots so far, while I'm still
> testing with only qcom-rpmh-regulator kernel module. I'll do some more
> testing with full system running and send this re-ordering fix I can't
> reproduce the crash further.

Hi, successfully rebooted AOSP with v6.4-rc4 on DB845c about 100+
times with this above mentioned lvs nodes reordering in the device
tree. I don't see any obvious functionality breakage in my limited
smoke testing so far either. I'll post this workaround/fix for review
on the lkml.

Regards,
Amit Pundir
