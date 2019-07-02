Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9825D501
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 19:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfGBRFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 13:05:37 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44269 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfGBRFh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 13:05:37 -0400
Received: by mail-io1-f68.google.com with SMTP id s7so38616502iob.11;
        Tue, 02 Jul 2019 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YKfKPoeyT0KuofxV7ur9+vGd3ucwK2w5OgqwlMB2kjo=;
        b=ehiVyESmaJVL8d6dsoIJA9PzBnBTjQL+V7P6W3bSGJk7C4CAotyLCqeYPhMazPoegt
         BXBHK9Lp0bh5wxqLmIMgCsYOjoheOiniT/gtB5Z5ufGAEOqGj0uz4KVpsUQkeyhVenj8
         GXFGrqREKTRNdxiNFaCX1hamvE8FlBLrg2HvGYtHUxSsLYX3n9x/EMFCZztRdOEupohH
         9oYAQI1mQSjcQJ7rZDqlvZRrnac1gtnuak3XLX7hy6KbuplsIuWq040RAwUxPyW3nNki
         JvIYe8DESD61dZWJsFshze8aYVhmLN5F11ad/bz7B5PlHZhPCdIcY2+amH3kYAzOU4XS
         zrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YKfKPoeyT0KuofxV7ur9+vGd3ucwK2w5OgqwlMB2kjo=;
        b=MVjxQGQa+y4Yd2XLg4V9QVMdseBWizC0oJNbaVxF9dmx8He069pJn8KoENaUpLaSfa
         fUgda1duaFTSpRvgkB3ArirukiVcDQ5U59P/Bam5YMSv8SPVT28HPb96yyrkrthbNcBK
         uinalvhP7694bCGMkqGse/yPIJmaEOOE+C5F+5PDNDNnZM/rA7XNSt4NiDb/I/7WFiUq
         70leRwNvBmoCi9tMhxQTt98mG2d6o6flflJ890zRJtwwqQG0yOCjkB5f0obySqntXk7J
         IwVtUHZNJ3GY0uOlJOsHHS70+9EpPbs9DWTwFBi32rfWKmfw2Bmg+9+wncNpWx3YSG7K
         zEZg==
X-Gm-Message-State: APjAAAWF+RCXhdPn4Tcmlkz9MMzo2aR4Zr3G8FcXP4cU3nWMWkqqf2Pt
        FRqZ1g4O9BWBRpju2SHxjyOQ7PE1zAnWP8CDauQ=
X-Google-Smtp-Source: APXvYqxs/hDXot9vuVIf+rT1Mq0edFTyI+t38Zvd0D5AAG835eIo+vch/SYLmZlG9JOrZ6ASoAZ8Ps6XWgC7yyHesv8=
X-Received: by 2002:a6b:901:: with SMTP id t1mr27892285ioi.42.1562087136966;
 Tue, 02 Jul 2019 10:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com> <20190702154419.20812-3-robdclark@gmail.com>
In-Reply-To: <20190702154419.20812-3-robdclark@gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 2 Jul 2019 11:05:26 -0600
Message-ID: <CAOCk7Np-eCQUmmwvHq7tJEz8OgHOWbtedsvb0bt+1UA6aYxKqg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 2, 2019 at 9:46 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add a debugfs file to show status registers.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
