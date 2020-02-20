Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D701654F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 03:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgBTCVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 21:21:16 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41776 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbgBTCVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 21:21:15 -0500
Received: by mail-pl1-f196.google.com with SMTP id t14so911430plr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 18:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=YAR5AKH97O4wD1WPqWhh58Z+vTDyTGU+wowRu7veeWo=;
        b=IJZnCzHlX08ZA7i7SWUg3SVtMUVih+MtyIhM06LeI0WUnLEa/A/npW9fObuTqHp5bR
         ng5U6jk3rSrmAJ5psu8/fWOitlD/WVffCzwla/GH8evP5zKSx+xXS6sG+O34VufGl4ih
         fmsg6Os6z9BY6etm4kkLqKNOE9U5+BSnxFpT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=YAR5AKH97O4wD1WPqWhh58Z+vTDyTGU+wowRu7veeWo=;
        b=Zb+hG/8YGqvI6U+H5w3KbpOyKn4bVjoEvwkW7XnJSdSzlFHxaRhxxK+pf10nA9l3ec
         IXtOVb38TYfBEx14g3v76/SHHeZPRj6p+DAdUcHH4ZeiSGWvtOfb3QXWq/JCdoJrmqL3
         B/vekGDPJJjDDsqakcMVIJmQOCSD1vJ9OutZVx/DpVJaGcbj2g/xEfUXu634ORqo1Q9E
         n8m87GzX28vZvfv+Og1y57nTC+9RMg01lAtzFoiHiR8c6uOmSiDHfUM6W1fP7MeaeYpC
         nX7raeyjbE9jlZ0OZpqOI1nZwyFRXpI/sVsO/0lHVZqir6AYflU4E4uNrUYHykeZVovH
         QkMA==
X-Gm-Message-State: APjAAAVc5vd/MnEYuCUCpdKkrtaE3Pszf0BPSLkJrI2KoO8vg+IV98+Q
        HdXi0w9zHw1Ebh3SShhNhCuZug==
X-Google-Smtp-Source: APXvYqwSH9YFZ8odOgVn06hoHxPxyEr2qvJkCwykxh07cvNLocTEBqrTv4zhDDYp2xuIco8iBD2U1w==
X-Received: by 2002:a17:902:502:: with SMTP id 2mr28499313plf.151.1582165273803;
        Wed, 19 Feb 2020 18:21:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h185sm956137pfg.135.2020.02.19.18.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 18:21:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581944408-7656-2-git-send-email-mkshah@codeaurora.org>
References: <1581944408-7656-1-git-send-email-mkshah@codeaurora.org> <1581944408-7656-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [RFC 1/2] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 19 Feb 2020 18:21:12 -0800
Message-ID: <158216527227.184098.17500969657143611632@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The subject should be something different. "Fix irq wake when irqs are
disabled"?

Quoting Maulik Shah (2020-02-17 05:00:07)
> Change the way interrupts get enabled at wakeup capable PDC irq chip.
> Introduce irq_set_wake call which lets interrupts enabled at PDC with
> enable_irq_wake and disabled with disable_irq_wake.
>=20
> Remove irq_disable and irq_enable calls which now will default to irq_mask
> and irq_unmask.
>=20

This commit text is pretty useless. It says what is happening in the
patch but doesn't explain why anything is changing or why anyone should
care.

How are wakeups supposed to work when the CPU cluster power is disabled
in low power CPU idle modes? Presumably the parent irq controller is
powered off (in this case it's an ARM GIC) and we would need to have the
interrupt be "enabled" or "unmasked" at the PDC for the irq to wakeup
the cluster. We shouldn't need to enable irq wake on any irq for the CPU
to get that interrupt in deep CPU idle states.
