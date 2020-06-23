Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F6D20686D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387813AbgFWXai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387779AbgFWXah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:30:37 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85400C061573;
        Tue, 23 Jun 2020 16:30:37 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id w16so495081ejj.5;
        Tue, 23 Jun 2020 16:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qydbJUy2HOEAW8ox8dW2jzADQiWiDFET2z5DKZOc4lk=;
        b=keKkgmsm3peohRXedinyra2qm/0qEiJyZVa3jsF+qzSgUCkKiWCLgu8tXNEDzl7wyZ
         J2MLzqly+YgEthzYaAojyDSmT0JG+ZHOH3VZm+DIVROICIC1irJKnJmDBgihcGEvKKoq
         BwOo/+Z3eWUD4cCUUd7S7KMfj9Ybgqj7jd79EtXQrwB564o3TBBuuVsqEVPFcwd/UM0t
         cYneiC1qx+aU0x6D5zhKwBkKEN+ZmusFRVtbiLPIaHxhIewfLJQRuNVl8hXy7QtZRo4n
         KGX8usLjP1XDTqeMW9dMfsxQxXliBsZUrFvYcfyJFFGsPYyF5n5T7MzwJ5MwJ8P/zZKF
         qw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qydbJUy2HOEAW8ox8dW2jzADQiWiDFET2z5DKZOc4lk=;
        b=jeU9pT7wTFRJ4zy95/OQkTW7+luq6KNm/SwOFVpjm1i4u6CLtcIn3UlwQzflRLg+0y
         RLFrBsOCVnkoD2PmsjP19u5rtGneLzzQB9t3x/AoF29UexwwPqqQy4Q1qkK+YkgkX9eI
         BFP5iVRVRUhWbJTfOjrtQ89JipskO46PjP2sL8DAH5wr3xlYLxrB5RTmOrlMqnUDgqk/
         ghLxR+P/fBbPTXJQ2OUGHxFkY1EnM+j7koyO/naY3D9zLluZSTcgtyKZiAwz5CCrMWNM
         JBRLw5EU6w8ZHX/8CHPMQPnwrnYAiAH8e08O6GVvsdl2YJPZcsHV3/38gJtBqA9MdeA6
         IuVw==
X-Gm-Message-State: AOAM531FIT9hUFCEGyOki+OxDHNYD9+4sS0xgDIVOKZioqqDLd+0/eao
        zdTJuLhrXGVL/UwthBfjK6I9JVQSKyZz165g0UE=
X-Google-Smtp-Source: ABdhPJyl9OeCOL30EfuG+Fu9f5Q3c7QmhU1FtTXQe3JvnchNw08GN1s0oqNBJnkSlig6VanYILFNuSssIhBCc4YEvzk=
X-Received: by 2002:a17:906:945:: with SMTP id j5mr22444075ejd.52.1592955036219;
 Tue, 23 Jun 2020 16:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-7-konradybcio@gmail.com> <20200623231919.GL128451@builder.lan>
In-Reply-To: <20200623231919.GL128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 24 Jun 2020 01:30:00 +0200
Message-ID: <CAMS8qEXeFO0vNKHoJeDKKprdECFLVtXOWnphc6iRjOBigeFe1Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] arm64: dts: qcom: msm8994: Add SCM node
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

>Shouldn't this be "qcom,scm-msm8992", "qcom,scm" ?
>
>(Or rather "qcom,scm-msm8994", "qcom,scm")

Some DTs only have the SoC-specific one, and some also
have the generic one. But I can add the generic one if
you wish.

I went with 8992, as I added it in the 8992 series
(gonna update that one soon, too, so we can get it merged)
and I didn't want to needlessly duplicate it. Ideally maybe we
could switch to just qcom,scm for clockless SCM compats?

Regards
Konrad
