Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBA6165CB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 12:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgBTLYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 06:24:34 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34409 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgBTLYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 06:24:34 -0500
Received: by mail-vs1-f68.google.com with SMTP id g15so2433656vsf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 03:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hazjaD2YUbJGiqWwoXV+JokYu0HUKkUko31jANlJplk=;
        b=B5GzCQW/zlr8puDwPi0fy0nIhsM0bVlk2rPvQg75NJL7JTWJtE2W0DmhKepCcD9hOy
         P6gzPhV66fDRSvy49GHQ/eO7JhmvEZ98x9GYJqD4vwRd8pvFYpcz0idz0e98SyhXg9Lb
         iT0thb0Hq8t+pZvpfKWhfG4Z/W+w2pEmD7yplbkMmTcciincv93hFuPM3rs/0SYJgQ4G
         q1krnaE6G2GnMgd5qoziYG4jjVG9QJXehy2YbAVVo4kHfDp2MEqBeCHqhitNfomRkD1w
         AcAp7hyof0nZWU9JgU881XYLYnc3l6Q/DRyzxhRSvm2qNHPWyAt9l1EiFJ30GHA8AEPq
         VQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hazjaD2YUbJGiqWwoXV+JokYu0HUKkUko31jANlJplk=;
        b=m+DZsVH/QkOsYbcH5D5mlt60Mw8cisZjwBLb89U1TpdUdJWkyEcd1S/TZrqMiHVyHp
         EVSFKhq2tvh1v+u7HRtEfWSkZvwszw4jCDbVDUWNpJFD7IbqTmjs6XxuatVVeyoq9EDt
         03HJm5gmRAibACSCMyYufNp9JjQjNZ4z+BAkWKIqZmNQipnLHKL8MdF1+SfwlAvjMthl
         OOpE0NBzYlmGxctv54u0tutvDM1CzJNGctjH0mBlgVJ+KDLX9sd0BeZa2R9dIVEx6e/0
         pjUiebDJUkqoD2gGYezi+Qf92M0bbA4onlgVXCtweYIk3nQqTRDbxmVO7lwhR9tt3seM
         dntg==
X-Gm-Message-State: APjAAAVrNaDGpaw9LaCaJKLt39FxrVY8OftrwBgo9OXSklITvZ8RG68+
        QxmfIuQtZsYsASdVXauvAA4bWEk1wO/tXDl0Yh9WMGod
X-Google-Smtp-Source: APXvYqw2Vi/gK8Y4s/OvdpgxSeePyP+00Ez91phnSXxKSI+4QTscidoLFaPYKAlgM/aym6gCwQw2Dbmx+YfjLnYuGuk=
X-Received: by 2002:a05:6102:7a4:: with SMTP id x4mr16028226vsg.85.1582197872123;
 Thu, 20 Feb 2020 03:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com> <20200219203544.31013-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-6-ville.syrjala@linux.intel.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 20 Feb 2020 11:24:20 +0000
Message-ID: <CACvgo50oWkF8vjpGmOYSwaK+khZuAE0yW_npf2UEMQoRTokLBA@mail.gmail.com>
Subject: Re: [PATCH 05/12] drm/msm/dpu: Stop copying around mode->private_flags
To:     Ville Syrjala <ville.syrjala@linux.intel.com>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Feb 2020 at 20:36, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The driver never sets mode->private_flags so copying
> it back and forth is entirely pointless. Stop doing it.
>
> Also drop private_flags from the tracepoint.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Perhaps the msm team has a WIP which makes use of it ?

Otherwise:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
