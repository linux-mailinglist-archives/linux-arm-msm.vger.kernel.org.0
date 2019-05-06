Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE5A914503
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2019 09:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfEFHJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 May 2019 03:09:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42112 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfEFHJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 May 2019 03:09:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id y10so3592224lji.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2019 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iRT2BpDptSkxB+ApVYaSpu4TH0+tPZF2HuarptiGZHE=;
        b=oKQMEJ8hH/CtsoFlFjBJEHKYnOh4w/g2pDH66nAnJWQ20Bk5RpeuVDK4fYGsd80t9p
         byiDPusCcIFnWgH5BXvaRXanBTBFCJXeidbHDr5G45NiIafotdeIuOz2VZykaC5H5Mp7
         Nt9PVf7G+4Swhgyxg4QvbTm2YBJcbUPRdTbUp1SwOlewc1CYb/GLrGuOb6cmQc0yb4a/
         BrP3pyrvcYHSqZNzskcaDH54+p+5J+0CzC6yNY0DcmV45l1J+6m8LmA4v53vZvbhzZ7B
         lbTe0TnINsOdajsQO3lUCoKbIXFXHwOa3cxXBTBTMW4Y8TZWgRbWv/7E2GDTiCcMxUBR
         ar8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRT2BpDptSkxB+ApVYaSpu4TH0+tPZF2HuarptiGZHE=;
        b=F28pgs4UatTrea49MmKYKuuGajHIdZQPSBxXCLKjzLHr2ZYchqSE9y7nN4AUZyRPBQ
         XdGq079PS9QKYNuJPxq5f9/x4Xjz7WE8900AjaxYlS1VoEtOSxYx1xUGL4kkiAF42QmR
         ++Mtf81HUO2T1QqyAu79+EIadIfJAN+bLp3B2brlwKIpMKvfDsAAccYLUZJFl5G0YqAA
         Ez8tPrSBQ6X3p+qr7+T0EDPg2QWl5mbnhwMFh8uCRp/rm+vpPX9ArPfrzxw9qr5WlNLF
         6ExnBWdQA+rkiU7EYIWoTxi3bUG+NF0/ORYZKkHwflGNXkz1klRVXlHxEodW60E6bNpP
         +Okg==
X-Gm-Message-State: APjAAAV6wzBqh82cIfDnqeKxpfQQ+SQtm8jRnEfjqVN5rhdayMTTnQM7
        uYw22CN9hEqFgufDcjCJOLChT8F+sO6fjzqA+kAhmQ==
X-Google-Smtp-Source: APXvYqzoDokcVuvzHXFld3YjPVy3p1eBu2FljGmJcbGtSdNiGf7iikESKDnQSx54yh3i2/GC34Hlw9JUZsHZhhRerZE=
X-Received: by 2002:a2e:8e93:: with SMTP id z19mr9439736ljk.159.1557126573442;
 Mon, 06 May 2019 00:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org> <20190505130413.32253-7-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-7-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 May 2019 09:09:21 +0200
Message-ID: <CACRpkdZeMcn-kJqtaZUmfXeibh3SmyKDMUMZt-gLSzEDhGcdCA@mail.gmail.com>
Subject: Re: [PATCH RFC 6/6] ARM: dts: qcom: msm8974-hammerhead: add support
 for display
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 5, 2019 at 3:04 PM Brian Masney <masneyb@onstation.org> wrote:

> Add initial support for the display found on the LG Nexus 5 (hammerhead)
> phone.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
