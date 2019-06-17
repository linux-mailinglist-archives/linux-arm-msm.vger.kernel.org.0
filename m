Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA5148682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 17:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727765AbfFQPEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 11:04:34 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44034 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfFQPEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 11:04:34 -0400
Received: by mail-io1-f66.google.com with SMTP id s7so21808277iob.11;
        Mon, 17 Jun 2019 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTD1u2qNrb/0/7aEjHb4eOnJekVh9jkQY4qQ+7iNk2U=;
        b=AVdsXp5/9GFfwzExr0pUZOVDtunnFEYvPOMPfLBxUeDtlVYqUVcIUGRINBBKYj0jMz
         n1CGyzri5StuE2A3ImnDJmyduzxp/w5qGp7UjAubUKf9gTtoTi+qcK2NzjBfqDi72yg8
         r/4+V1bcJma7sNsRbVtyYNZQXybIPuKScQVrVZsO0UEFC+UzPllVqN4yZktMSQbhJvKc
         QMoby1OdZDUtbXb6K8bDBAq/n9tX7VNIi5k9ZRGD4DL1yq94SIOmpkxRBWihzpEBer4A
         6brBXcRe8K0jFNz+Cb/7QlG28VzvrBpk/zgvAezoPF9WahN+CUIvDEB0Yv59vMlwOjQz
         joaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTD1u2qNrb/0/7aEjHb4eOnJekVh9jkQY4qQ+7iNk2U=;
        b=UaNI48AVvJFN9sD0xhZFQrAKIyuU75p5WDq/ke/WJEXe+AKvIoPgUW5tn8jJJ8lJAv
         VxzRyFtqZg+LKMeg01AZwWwWcstw6Z4G6YZjRrO5IgyYq4fxGA/oXFu+Gy0tc0fLxpeN
         HHv+/kMJxqp5deH7AiH0g6T3HdpZhyyGL2ybvITAXsqkSHyXmTv024Guff5nqlDa56xd
         C4zV73RKrSgNoe3P2C1dWLwNZnBTD8WK+TuEBwS06o/cvumyHNpy5CxsFET6MBT3AZ3v
         hxtiOhV2lLOSICo6C+2GpN7iP37A426Nxwt0ID96MmEtSYxYBNC360wF8eZZWHyIG4II
         TliQ==
X-Gm-Message-State: APjAAAXA2N60PHL9vTR5M/SI6w0WIXOYl5OiaTlT0okOeoOP2YylXibF
        6I0FpbIerIMNa61000IXFX6XRt239DNbFC6L2LPCPQ==
X-Google-Smtp-Source: APXvYqzJOUOditiAVeURtLpNoIA2f2xjXKzFaadRj+FHCpzqHhDXq/Ren1Xv/Tc1KCFpN37LcghdUAE+7q4iELERadU=
X-Received: by 2002:a5d:8049:: with SMTP id b9mr171243ior.199.1560783873997;
 Mon, 17 Jun 2019 08:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com> <20190617145853.GT5316@sirena.org.uk>
In-Reply-To: <20190617145853.GT5316@sirena.org.uk>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 17 Jun 2019 09:04:23 -0600
Message-ID: <CAOCk7NrSBjbyJ3YJoF22i9ysxVTw38SvsaSi9JwVrj7W8er24A@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] PM8005 and PMS405 regulator support
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 17, 2019 at 8:58 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jun 13, 2019 at 02:24:36PM -0700, Jeffrey Hugo wrote:
> > The MSM8998 MTP reference platform supplies VDD_GFX from s1 of the
> > pm8005 PMIC.  VDD_GFX is needed to turn on the GPU.  As we are looking
> > to bring up the GPU, add the support for pm8005 and wire up s1 in a
> > basic manner so that we have this dependency out of the way and can
> > focus on enabling the GPU driver.
>
> There's something really weird with the threading in how you posted
> these, a few of the patches are in reply to the prior patch so indented
> a level down.

Sorry about that.  Bjorn pointed it out to me, and I think I figured
out the glitch on
my end.

Are you ok to proceed in the review, or do you want a repost?
