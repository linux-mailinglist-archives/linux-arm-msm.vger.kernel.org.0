Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4FE24C834
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 01:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgHTXMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 19:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgHTXMF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 19:12:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F9DC061385
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 16:12:05 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k13so2619plk.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 16:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=25VvJRAxxSKZOja+m6/X23XfJDnDiYp/jYGjfMbcAb0=;
        b=jIR7tO3qoi5slAacYS+iETQLXWk1DQkkglZGqJ+4elEWjSZruJbneRmnrPIo97LQvf
         q/vETU/eIWQWYgpnEEuNQU9fPEZ5Ma+G9wHb7cy1QZTLD7+hgcGHlUhec4X+ULeBmuIs
         mZ+EjHo39gcE5PDuOziXfU70k2mkN1S/vFLDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=25VvJRAxxSKZOja+m6/X23XfJDnDiYp/jYGjfMbcAb0=;
        b=gzIf/RsWIjdMdJf662TUzl4KLdgL7yRwYZONgtUhPz02enrAYYK3IQ8t0OuBE9MfIb
         YV1vlRWi7logZ2rW0P7+KxkRYYPJTHeMKxFrxRUkGLAKvKFBzjdhHGHxdhJNc9BwahyU
         uBtE8BCxZ8imfzN26IOIB0wkkk0uDV4MXpWoad8jH8ZFoKJCOr1v0WI21R9fVGDOLlLR
         sRzWjptQ2a/3bXeu/q8RPer7eyB/Lok1dLWvA2UI8ddPaHx/OXOg0V03Ua+MMqix/lyE
         aAHiDfeT5gi14RGi91tq0j5ASmpON6BuEmg5yy7WXdR3nQsIBXbDfqUssYRAxSs+XNni
         JWUQ==
X-Gm-Message-State: AOAM530e5CGLTNUH+mWqezeDhrkaRfYzM/nJG+2q+yEC36qDXZ8lRt6c
        8yHhOCJ/A2yQzAiQqeLQTQ7BWnjTdsfOtw==
X-Google-Smtp-Source: ABdhPJxg6gWWIr+NYNyeNoh/vt3CrN4ueRdwUBhK+gGqkDpx2GGsrTCxJyCGNkmaTYlqXYnvTmNnvg==
X-Received: by 2002:a17:90b:885:: with SMTP id bj5mr133571pjb.133.1597965124880;
        Thu, 20 Aug 2020 16:12:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 8sm117847pjx.14.2020.08.20.16.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 16:12:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1597831670-17401-3-git-send-email-mkshah@codeaurora.org>
References: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org> <1597831670-17401-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH 2/2] Revert "Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a module""
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Date:   Thu, 20 Aug 2020 16:12:02 -0700
Message-ID: <159796512284.334488.2457174259443414342@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-08-19 03:07:50)
> The _rcuidle tracepoints are removed from RPMH driver which prevented
> to compile it as module. Bring back the change to make it module.
>=20
> This reverts commit 1f7a3eb785e4a4e196729cd3d5ec97bd5f9f2940.
>=20
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Please send the original patch and add your SoB to it. Reverting a patch
out of the history works, but doesn't do justice to the authorship of
the patch.
