Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD502574D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 09:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgHaH6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 03:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgHaH6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 03:58:17 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C41CC061573;
        Mon, 31 Aug 2020 00:58:16 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l21so4519979eds.7;
        Mon, 31 Aug 2020 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=huQdyM+q9reHAMotsMXMrR+uvxt0zB89ISm5NsTKcqY=;
        b=cj+8D5tQCSmxfAdRNPAPmuTudMTpVoAPeOSrZRptzQ9EhDEPiOuSrmIXydsDMC+IeB
         KiWnCQxbIr9VmNhmjBuWIJNcYSz0fR7DGnIqjOs89G7ZOSCNSd4uUdBC/+VoIYOCm2Ug
         bag1Qks2Ap1zSsyUVQwE6/t2STKAtjsFe4VxvfYryowvEC6R/zSSoasSY0gBbLtpdOWI
         V9V/LvGoRfx9PsVevepeL/OpGnrrSmB8c3+pKeIPMwAQBzJp9EGr45gCIG7Z8rB3mx7a
         oaJm6l+/FCsoGio3O55Cy9zRlcqCOZ9rzgHzEcMtCww4c7Z8OoLasFoK7bMVvoJi4/0f
         sRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=huQdyM+q9reHAMotsMXMrR+uvxt0zB89ISm5NsTKcqY=;
        b=cUERPBR8WsfrdQpqm04iC4r6PVteMRJojU2nVlbbadms8SRvRcLoVJtSUJwUYmL5OB
         +XpN6fLWydUSK5vJgHuh1U4XB6e9PDZzkB4iIBu1foLR5TFN8j+lhZCKOk6QxgAYLYKB
         Q8oEQ+PxH7N8JxmUG3bAS9nFnlwMGKBjiNjAxd6qFSm3H1GeLJLbvNr2Za56s2sLFeO0
         foqbXMe4O7ofT9RJm64O5o870bYQJ84odtc++k+8Anvn6WeUz9TIgdJyjQiyijPshqBf
         Df2XkUZ2/B4b3KRjsdcDAxLOpIzGIZS6G66QK4FPjqeANzW80ersPknljGjiENqft6QW
         xadw==
X-Gm-Message-State: AOAM5310vQSiTVb/repF31VCITzsAjeJC19+RyRd6jozIzXtVMqt5nSx
        b2nvjhEPZ9KY/E0jBQMuIAaf3YESi1/EI7eH4NrEVIiA5EM=
X-Google-Smtp-Source: ABdhPJyYEmEjgTlSTI3u2NEAheWGVf1siQ0TfcnMk8UQJ0LD/ssFBMKoiOcwk2Zx1mkLhm0A/hOUiN2gs3xnvJ0Zz2M=
X-Received: by 2002:aa7:c4c8:: with SMTP id p8mr59745edr.231.1598860695181;
 Mon, 31 Aug 2020 00:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <1598851448-5493-1-git-send-email-amit.pundir@linaro.org> <CAMi1Hd3n2rfr+k09L8WO1S1Tn1s3xJencmr1q3a6e-FOgXr5Qg@mail.gmail.com>
In-Reply-To: <CAMi1Hd3n2rfr+k09L8WO1S1Tn1s3xJencmr1q3a6e-FOgXr5Qg@mail.gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 31 Aug 2020 09:57:39 +0200
Message-ID: <CAMS8qEXcANkb-HoTk8zrXQEzkQO4cnFw4hj5tMp82UEVKd+eHQ@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Hi Konrad,
>
> I couldn't find answer to your question around missing
> (regulatorname)-supply properties. Need help in figuring out that
> part.

When the phone boots up and RPM(H) kicks in, you should see regulators
probing like "s1 supplied by foo". Without the *-supply stuff, you
will likely get "supplied by regulator-dummy". This happens here [1]
and to my knowledge it is the "eletrical wiring" for Linux, as in it
makes Linux aware of which regulators are connected electrically to
the same supply (so that kernel knows when the supply is on and what
voltage it's at). For qcom platforms, this is common per-pmic (afaik,
please check if you are able to!), so you can likely just copy-paste
that part from msm8998-mtp.dtsi, which also uses pm(i)8998.

Konrad
