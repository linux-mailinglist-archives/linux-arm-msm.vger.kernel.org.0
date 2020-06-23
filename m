Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F116720687E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387881AbgFWXf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387717AbgFWXf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:35:28 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F29C061573;
        Tue, 23 Jun 2020 16:35:27 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id z17so79143edr.9;
        Tue, 23 Jun 2020 16:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NEyk/wB0qGmsMWEbocOsoIHwIq+V4NJ+u58hlkbuXTE=;
        b=OhR9prGrBTG8ITiMeDiXb/5yHt5gVJ+btDWjM5xVZCHviYAJPZmS2ckksSWklJ3SnD
         tuAJM6zkNhUeMCb/QJm0gpGvHZh76r9l7YB7Xt7kmeQQRinNpp7s9sUzt+twRPfoanxL
         h8dp94umx03MazDvlCUspHMGkYmtI7t/2sz/SoyEMHQl0owD45fgIWVmeXV4m4+J2L/k
         EvZOtULYaW16+G+azFXXa/JFLEGcnyKtttRZMhejdG70nz8J2fuIOO5bXYM+wDzL+OKG
         kmwL73d41L23KVYY4Q43iDMx7g8f6v91owluxWgDOe9J5Ac9FLXZvjP4jonAPFCzc4qn
         EL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NEyk/wB0qGmsMWEbocOsoIHwIq+V4NJ+u58hlkbuXTE=;
        b=bKtXZqKqrOm2W9cMUlCb2wFxyZsIuMcEcpCAjirKANcn0nDJqbMPHCyg0QK21Bwq5H
         /juw/0faMjFzQyEnGvNiOQcEamcs2V09ZNLXgntU0aZ/woHBYjpDT/IwKR80VZhWjaBg
         4iCkjLLx2xwz582BjfWCNvn3hQvHgP90l8cmytLTIEaZXvosc4mdhLWts0ifnfMm+Aep
         /AOdW0eNCQuPlg5ueySvMlZcpBwEYgabNne6IGcAGIWd3jOSpzAB2VMNpHTq8IAL8Cq/
         K/8nbGQeJz0o4YddamObcRVvOXgPjlCwjjiPLQ7LrnmCo1nDAiSvVxfDiQm9qICsL31M
         PmDQ==
X-Gm-Message-State: AOAM531/fbIxyWpAE/c4sfTJ+7kvEh24DMvZ9sgvPT26TYOuVCelt8Yy
        xRc5q2SrbD8UQHlw+Ubp8BcR2iUcqNUd34x++lo=
X-Google-Smtp-Source: ABdhPJzXKv7kQiitxOPK8MlHEEWLx+C+OQNJSD9EH6T1whJUxg69uXKiGswptZh7r56A26zDbcuqMJPRaLRcsLsspFg=
X-Received: by 2002:a50:e08c:: with SMTP id f12mr24149457edl.233.1592955326376;
 Tue, 23 Jun 2020 16:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-5-konradybcio@gmail.com> <20200623231541.GH128451@builder.lan>
In-Reply-To: <20200623231541.GH128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 24 Jun 2020 01:34:50 +0200
Message-ID: <CAMS8qEV9hwL1MpEHzVC+w2rkQhdZ1aH3Dy8Mn1X_2Eu7W2naWA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm64: dts: qcom: msm8994: Add support for SMD RPM
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your review.

I will send the regulators/rpm patch very soon.

Regarding the mbox, do you know whether it should include any clocks
on 8992/4? What comes to my head is a53/57pll, but that's not there yet..
So perhaps I should just add it with .clk_name = NULL?

Regards
Konrad
