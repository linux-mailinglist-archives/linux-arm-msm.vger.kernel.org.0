Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70149A979
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 09:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732611AbfHWH7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 03:59:45 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33431 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729880AbfHWH7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 03:59:45 -0400
Received: by mail-lf1-f67.google.com with SMTP id x3so6503777lfc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5z7vfbHtMApujxavzWgIXVc/rQILAwEhpus5OtLUmrs=;
        b=Z5FXlxmuxQ6DfUq/GB4OKAJfLFayCZSEywWTGWPqXb1Ll+4UtGZKe/h7W9WqxZFCL+
         4IiV1fF9W3GkwOQtesDOeraTHg4NaWNA/272Jwc0/BV+GsorLqj06xkS3dvXozEL7G94
         iasZEp6fG435M3O2KNTt9wHYTooFRDhji4NsuwBFQ1jYTuABI9bsPorCe4lFdDtqzLAa
         uLVEd+QUfe5QpHZnrDs9m+BETpOEdGSh05iLf3j26TB4s7L4BXt1q0jhFKZge6kKMizB
         VnC7jra0j8rvzwweeHGsz9xsn8iKUIHd2UekHeIJrYg7MpVeqfZJh8wEZVUW3mgQOsyu
         HhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5z7vfbHtMApujxavzWgIXVc/rQILAwEhpus5OtLUmrs=;
        b=Ughj7oSqPNSN5X1Byjs30WR6kguPcC6x6ZgXhtBanO2htlENDBiAWynzKcQ4qCvhZ2
         igJOfuidoTnwgVBQYVYHCB+FnDo5Mf+hdJuGnYo7aFGGc6Oq2m+Ii52HFqK5I0PkfcAU
         Savh4V47swKHn1ZhwqcFYnkRpvPz/+YpE5rTZGjtA4jGV5mxGswUi5LwsMrte9vcdGze
         8pVGNAU2I9+I6ok5lkaUsgqGMYV9rmfOGMaViE41q9H+fVT/tNs8qffTg4Rh+8p4xY6f
         16LXxZmZf05yxS0ZHlj1TI583+1cUSOFYR+M0RHKsNvENqkETKrGse01fGiK3SDBMBrx
         uKHw==
X-Gm-Message-State: APjAAAWRwDmBAL41QpZLZcSFmM83/BRu5fHG//PiuLbTgXCZvHXOd1JO
        W9ioYqdh3UdY0Z69C5XY2awbR0nQkeeGvD6hEJZfWw==
X-Google-Smtp-Source: APXvYqz/JGdMYhTiM4E2N3WP4i5MloBBgn5IEamDPj4bNWv1rf+cVyUn1fnWDNPWIK8jDrnsG/09l2nJNj1VCjfqiBI=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr2059258lfn.60.1566547183271;
 Fri, 23 Aug 2019 00:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190814123512.6017-1-vkoul@kernel.org> <20190814123512.6017-2-vkoul@kernel.org>
In-Reply-To: <20190814123512.6017-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:59:32 +0200
Message-ID: <CACRpkdZAsuU4kOHjgNT=q_PyONcZgor8CdgRRh=jFtF7YOqbgg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150b support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 14, 2019 at 2:36 PM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PM8150b GPIO support to the Qualcomm PMIC GPIO
> binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied.

Yours,
Linus Walleij
