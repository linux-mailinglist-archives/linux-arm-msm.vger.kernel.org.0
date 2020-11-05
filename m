Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759512A75E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 04:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgKEDGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 22:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgKEDGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 22:06:51 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8827EC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 19:06:51 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id h6so268568pgk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 19:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fqzol1toKOJ2RVn1yfN+uFz+FMegwGU92eH/lUKJAVI=;
        b=A4fecVXEo5PihTIYzuZE0apzH31nKR2CH7ATTvax9pzG9s/4Shxgk71uTzHvyDo8WA
         S+5F/z7RlKDa2+lOcjmZpNLEPrZJM3eQr60GhqkDvK9OCRFIDqgmajqaYqdR7+FhIGP6
         x/MAWl41JRq5uPLqQJkrbM/RP9//84d1E6n9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fqzol1toKOJ2RVn1yfN+uFz+FMegwGU92eH/lUKJAVI=;
        b=TZ4ku4vZGzcvdsxLfNAmu62icptwWtRyN99w641OdhAF7Gmw+RNufF/fkaaqTkGfbO
         G6Dwm27NkiMuXO/kYNc4Dt/O1IqJGhIzmdpgdyl6H8VREyvgTHhwhG9xNFyXdo4nfW/Q
         siR1r8x8acKG0VKyJQplBmuJ2OcXFTdnBSZxGs1GUnxEYhJvZbwPoqp00N0lQE4m2be8
         C4XuVh745136pSw/Yds+h84BNg796Q6INx93W4fqDtOYlmX0TerS4xbaPsTEFzTdfNHj
         5mlBDaM69ge1kY1CqftwFsXvz9C8Dlj107Tsy2EzYVUbnDavlrleQq67oxb60V63uaLy
         261g==
X-Gm-Message-State: AOAM530SXB3BTtovoH4ZvHKwaXVJPHTPXxKz7dL/X1AVwB/kOkkPFPTp
        lGY+VQ7LkTU2XnNrcRUY0GlIsA==
X-Google-Smtp-Source: ABdhPJwQqkKr0xcU/WoDFy1ySt/MLLEIAzvNmTX1lPIJkg74SuC9KzLPe0bDYookJJkiZfjHjZKOWw==
X-Received: by 2002:a62:790f:0:b029:18a:ae57:353f with SMTP id u15-20020a62790f0000b029018aae57353fmr369277pfc.78.1604545611022;
        Wed, 04 Nov 2020 19:06:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id t32sm239063pgl.0.2020.11.04.19.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 19:06:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201103204902.11899-4-khsieh@codeaurora.org>
References: <20201103204902.11899-1-khsieh@codeaurora.org> <20201103204902.11899-4-khsieh@codeaurora.org>
Subject: Re: [PATCH 3/3] drm/msm/dp: promote irq_hpd handle to handle link training correctly
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Date:   Wed, 04 Nov 2020 19:06:47 -0800
Message-ID: <160454560709.3965362.13891080172465271158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-11-03 12:49:02)
> Some dongles require link training done at irq_hpd request instead
> of plugin request. This patch promote irq_hpd handler to handle link
> training and setup hpd_state correctly.
>=20
>  Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by =
failure of link training)

This fixes tag has a space before it incorrectly. Also, it should have
quotes.

Fixes: fdaf9a5e3c15 ("drm/msm/dp: fixes wrong connection state caused by fa=
ilure of link training")

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
