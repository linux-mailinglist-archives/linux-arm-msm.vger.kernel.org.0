Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E372F5B04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 08:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbhANHCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 02:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbhANHCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 02:02:37 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D138DC061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 23:01:56 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b5so2692969pjl.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 23:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=JYt8EI7ieKorpASVOTgek/+xr+Y9gbz77CFyRzCwwWc=;
        b=LFFNI2M+BRcL71xQeiE/HQKmU6e8hRTnsGw7tApsujH74JkBAe7fqku6FUdkM5IR+Q
         SJhfYYVAxqyypI4g788jHX+tNEe5BpDe+vRDiFNdrtMlJ94LTtXniKeisrj4iSf/B8Sf
         voXJ0UtPw/36wMa3gDL2uiOjH3OxNXB9WkmaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=JYt8EI7ieKorpASVOTgek/+xr+Y9gbz77CFyRzCwwWc=;
        b=qvFbHBOnYUnX1AC72tAYa9QVDUzK4vSrOBD+pAg+NgqYJgx6wFmQtkDJjiwFaIFb1+
         p7io2pI13PV72Mv9FJu1xroN0gdBZvCSuEJoE8crpGArGojY8ORAUVJA/ezgDNtSX33q
         aVuR3n1VpiSaoFcEGBrnPskY2+PTS/kMk5kwo6UdEY560jBL6OE/WP/8R/zArAekJ6/F
         fKsG1LZbZL4IhaiVWuGlqegLY10f8QhobX95MzO7sLcHcEgNSexT4/Srnm0L9PL7mP8+
         25+KHKtF7nNLMpTRiMWQNzbOTh3nwLLbbq0SHDZZ+oMRaavDdTr/9B2XE5S2UQVHc2HL
         gaYw==
X-Gm-Message-State: AOAM532Z8o2AgvZZcwnGfrpctDnpPga5IQUf4pqzNNujcHeRS4Rp9Lcq
        3BubRhfuUL5IcTJuk3P6ptD1eA==
X-Google-Smtp-Source: ABdhPJwJ+hg053U92FUixpn8y1FNmzaBdqnBVUnK/a8LK5a+UIXuUEwJAkdG0MN7awaogQxUdzC5Lw==
X-Received: by 2002:a17:90a:c791:: with SMTP id gn17mr3543162pjb.28.1610607716259;
        Wed, 13 Jan 2021 23:01:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id b12sm4286109pft.114.2021.01.13.23.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 23:01:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210108093339.v5.2.I3635de080604e1feda770591c5563bd6e63dd39d@changeid>
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid> <20210108093339.v5.2.I3635de080604e1feda770591c5563bd6e63dd39d@changeid>
Subject: Re: [PATCH v5 2/4] pinctrl: qcom: No need to read-modify-write the interrupt status
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Wed, 13 Jan 2021 23:01:54 -0800
Message-ID: <161060771402.3661239.1174238618385699475@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-01-08 09:35:14)
> When the Qualcomm pinctrl driver wants to Ack an interrupt, it does a
> read-modify-write on the interrupt status register.  On some SoCs it
> makes sure that the status bit is 1 to "Ack" and on others it makes
> sure that the bit is 0 to "Ack".  Presumably the first type of
> interrupt controller is a "write 1 to clear" type register and the
> second just let you directly set the interrupt status register.
>=20
> As far as I can tell from scanning structure definitions, the
> interrupt status bit is always in a register by itself.  Thus with
> both types of interrupt controllers it is safe to "Ack" interrupts
> without doing a read-modify-write.  We can do a simple write.
>=20
> It should be noted that if the interrupt status bit _was_ ever in a
> register with other things (like maybe status bits for other GPIOs):
> a) For "write 1 clear" type controllers then read-modify-write would
>    be totally wrong because we'd accidentally end up clearing
>    interrupts we weren't looking at.
> b) For "direct set" type controllers then read-modify-write would also
>    be wrong because someone setting one of the other bits in the
>    register might accidentally clear (or set) our interrupt.
> I say this simply to show that the current read-modify-write doesn't
> provide any sort of "future proofing" of the code.  In fact (for
> "write 1 clear" controllers) the new code is slightly more "future
> proof" since it would allow more than one interrupt status bits to
> share a register.
>=20
> NOTE: this code fixes no bugs--it simply avoids an extra register
> read.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
