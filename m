Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB7C1546F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 16:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgBFPAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 10:00:05 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:36326 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgBFPAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 10:00:05 -0500
Received: by mail-io1-f67.google.com with SMTP id d15so6649459iog.3;
        Thu, 06 Feb 2020 07:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0aeF5q1G0b73eoVDS2ac2sJ7K68iVciT6eE2yPZtXHY=;
        b=elysSnpttUIUL+HnDwisS+ujdHIotO/snGFPQXZZvkTXPEuR9rfRUl3lzb8v7OoB8C
         9IfMuYl+P+mG0llybzT47GOIwMk1ziCGFBVxjvoqNq+E9VZ8dadJuwv3kGfLtfvSP6pI
         CRz5e9kbOA8HHcDaz3+ATOCjLsjb/Wvp3t7ZtTK/wQSy2rcd5Mlp0Ee94b6bvyR1z/Ry
         +PeFIqdg15wss+TQffZXE6jUFNLu5ngzXPyd7cLfYFOjY6MzAKLNnt7NvAAWEdD/itqh
         zUup/d8x0xdjtjuzO4m3eUgocSc9K+j6Ydaq7UwBb+9OTtOmQJ7h+z/Fa5wl5iNTWvcs
         hEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0aeF5q1G0b73eoVDS2ac2sJ7K68iVciT6eE2yPZtXHY=;
        b=qLCvLim9adOSUvYZislXYUgKAiQSfTtyDSuOyFbq8mNZ3rhwXDyHxcyM5X0ER0Kn9c
         6TgnnNNxca0lDBrq8mMbSO/KM2yA0Vd9wcCz63+uS49uvKsusjK4Cfyarw1bdcECzdL9
         8+6TAApdpT9HuKUDIQQX0Po/Lgqc7RRkrEWGS+MQgoYitl6Yz3OZGDstiOsjcVbdFIt7
         +IOhkDZfc5oqJ6V+yssK0kPoo4cIlr+GdOpEA5wlwTcw8fGDTl93vO376L8n5q+2vbos
         smX60kZFvCvEvKPsXoUQno9CQ10jQrIUiPDpjDTGj7raJlsBQNdHE4cmMDf0c9jBnRGn
         TLZg==
X-Gm-Message-State: APjAAAWYx+6yRe8D4aPjzSQNRO43kQ8Ri1bbLDUmI5x3n23TBod+JVLS
        rFzz1h8aJrxCfvfGnZz/bJ+F1pwzubnEJG5piS4=
X-Google-Smtp-Source: APXvYqxkTC68/mfvtuxSHKMnH0Wkjkd0rk/KuumAHnhmOJfquHLD75sVXLQ73KJAz4U4IFF8i2RAghE1ku4PpNRN+cc=
X-Received: by 2002:a5e:da09:: with SMTP id x9mr31540090ioj.33.1581001203294;
 Thu, 06 Feb 2020 07:00:03 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 6 Feb 2020 07:59:52 -0700
Message-ID: <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> For a given byte clock, if VCO recalc value is exactly same as
> vco set rate value, vco_set_rate does not get called assuming
> VCO is already set to required value. But Due to GDSC toggle,
> VCO values are erased in the HW. To make sure VCO is programmed
> correctly, we forcefully call set_rate from vco_prepare.

Is this specific to certain SoCs? I don't think I've observed this.
