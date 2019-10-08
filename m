Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C47DBD0404
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 01:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfJHXUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 19:20:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36430 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfJHXUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 19:20:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so552158ljj.3;
        Tue, 08 Oct 2019 16:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VQzXIoav405TT6dTemcqRuBgqHl3Y5FGjDgTpEh2AX0=;
        b=P0GQwFclyAzgyHYeMi6w5wApIanM9xSKPtF53wBOKuxv8w/yL27B5CqMv7U5ZihRTO
         jnJx3PhjSh0jIlehA8TnA+zuRwVYCoGm9pC+wl/jEz3LhAozEXuXQbNQQNtY4DSxMoMt
         n8Vl+0XqJtr00HaeChLQ6ExT1ZW652aRWesfadjpPZl1H/vEu6Ei1JFfFPiniqxo3BGz
         iA7jpAP+3diAjxhmyMr/bVdlYiXIsCdmCEFAkey+Vz9hAcIU5mKwcQsI5gqK8Wc5OsWO
         FbTFbDTUeOdNnVGoJeWwp9PzGuHryS3jYq0BUQqlzaDFjcYq0f9HGtzBgmJ9rgcvCVaJ
         E1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQzXIoav405TT6dTemcqRuBgqHl3Y5FGjDgTpEh2AX0=;
        b=BVHU5WaOhSiljT29Y12k2XoyWjfo1WMIAYL0vey8xEJ0XyTYVERt0wiXB0n8Cd0M6z
         KNMw2olKmDOaIQdGL2vaMXJX5ILuntUPH+6adYuWyrnH0z5H2eOmmK+jQtG51wvauz14
         T47kBd6nWgI7iqmSF698+bIJr9FMffhk2DtOHM3NDi0wjZXK1WftaJD1Mte0j5Z6AWIt
         CYmAad0JevXdnGDnwre/F6oaBhWIyWMqhCHOKV79T2ihKTwV6aLeGVUtCmw5jC3zGSdl
         n5HET9plRGVI/ImwcQwG99ubXj3d2zbwB6TgC1jYCuTsXIDX6Ts/stB+mXUpX9m3YoPs
         cxlg==
X-Gm-Message-State: APjAAAVdsITlAz6ELDJ6i4RMqCGu06byPevaY69pK10raotLsYW7xU9C
        95fsZw4llfZ/diB7w5Q4EUPHzf+nwDwogneLQww=
X-Google-Smtp-Source: APXvYqxLEPTdWz9wY2BNYg2D/fGr1ZoSwp7v6UJ6zTFGxpZDHfwhwhNsXbpzW6XanOG3N9z/9eFE9mT18ZQ+jABUNCc=
X-Received: by 2002:a2e:86cd:: with SMTP id n13mr371368ljj.239.1570576803225;
 Tue, 08 Oct 2019 16:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171723.2956-1-robdclark@gmail.com> <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
 <CAF6AEGtTt4Em=7GJiuqhAdvJ-cB8hp=iOuT7egoVr3vW=VMN5w@mail.gmail.com>
In-Reply-To: <CAF6AEGtTt4Em=7GJiuqhAdvJ-cB8hp=iOuT7egoVr3vW=VMN5w@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Oct 2019 20:19:52 -0300
Message-ID: <CAOMZO5DLp+EqMgJg4x8dBXFAPbZ4toKVBdnXdD9EA0b19Zv6yQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use the correct dma_sync calls harder
To:     Rob Clark <robdclark@gmail.com>
Cc:     DRI mailing list <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Tue, Oct 8, 2019 at 8:08 PM Rob Clark <robdclark@gmail.com> wrote:

> afaict this should be at least in v5.4-rc2.. am I missing something?

You are right, it is in 5.4-rc indeed, sorry.

It is 5.3.x stable that has this commit missing, but I guess it will
be backported at some point.

Thanks!
