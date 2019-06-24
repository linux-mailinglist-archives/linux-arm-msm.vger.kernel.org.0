Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D990451E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 00:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfFXW3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 18:29:45 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36728 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbfFXW3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 18:29:43 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so14193072ljj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2019 15:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhT8989fkRjAHTk/5G9Ixl6wUhkKgi/8lCPip9aWCe8=;
        b=JP5EwECSiJKsyIgbUlYGyGzSnzKDDRJaw7iPPJh8JN3htzaytbwISBlH/bIDywgvyT
         H31q5WluB5CpCaYV+fymi2WtyF5c5bFmQCyxFSZQMbi+4pygArMY68GBmntozsHK0NB1
         NUPwuVW5vAeWKu/wnSDUXze5ZQRT6Q+25LpvFzjlkKYlFUQ0PJzvAUlZ93283AfQDWUo
         KtDNPbYgszWEqkUhSV4ALCTMkxQ7KPvzhD2+SuEqsw3dCR37wgl3GCOXInkyU4RvhX+C
         gdHttlihdEodR7ODSWGQk87PdsJNe3f9/jhcqWvq+uBkTQVg58mhJ3J3lWnX03i1aTul
         qmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhT8989fkRjAHTk/5G9Ixl6wUhkKgi/8lCPip9aWCe8=;
        b=rqnIeYy3A1jVltScJO0C02t2qVFXFMnc2DUwJnxhBaufGv1OJPCXXH73wfl/7n58T7
         TWcDUm96AUKbo6jKGxNDuuEpNeZtNcW/LDjpycQ+pV0pOUTkYqT74nEeOVmJ45z+5QmU
         wQG9gZ3NlJvGMl+xIhYzRgATJRGQeu+uciPGyHbnj/vWtyXefadIZaxb1wifekpSi3co
         qdE6mXLxaB7+DhGwMitbactIVHUTlR9Ofzs/imrpdSUflEwYWsDtd4FAJQuzNcDMbwea
         iOYzaExZZGBO/MGFvVNjkyZ3LASpMRDWkuiEDr5d9wDHPS6qRza6gEEeIKuaLqADwzZw
         +YAw==
X-Gm-Message-State: APjAAAVUt6fsChNW8iwtgjlymVXFGzIjphFIClSq6SLdkiwC43ugq8bH
        ZCB/OQyhHI3zzvza+gaVWXteIQkvK6pEU+ryN5145A==
X-Google-Smtp-Source: APXvYqytHsZmK/WOqJrR4b8Kg35M17ODcRpW//N4bLgT7nYWgQiJyvSaeQ6y9QVp/vPH0Fq/aMqZOyaMZctt9Ek41Gc=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr50219094ljm.69.1561415381933;
 Mon, 24 Jun 2019 15:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190516085018.2207-1-masneyb@onstation.org> <20190520142149.D56DA214AE@mail.kernel.org>
 <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com>
 <20190529101231.GA14540@basecamp> <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com>
 <20190623105332.GA25506@onstation.org>
In-Reply-To: <20190623105332.GA25506@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 00:29:29 +0200
Message-ID: <CACRpkdYTaM+sBs-bhaXVtAwFtp6+_PWWJ_k9jobd7qB41HubDg@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
To:     Brian Masney <masneyb@onstation.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 23, 2019 at 12:53 PM Brian Masney <masneyb@onstation.org> wrote:

> 2) Do what Linus suggests above. We can use v1 of this series from last
>    September (see below for link) that adds this to the pwm subsystem.
>    The locking would need to be added so that it won't conflict with the
>    clk subsystem. This can be tied into the input subsystem with the
>    existing pwm-vibra driver.

What I imagined was that the clk driver would double as a pwm driver.
Just register both interfaces.

There are already plenty of combines clk+reset drivers for example.

Otherwise I'm all for this approach (but that's just me).

Yours,
Linus Walleij
