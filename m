Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66049172A7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 22:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgB0VxO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 16:53:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37449 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729959AbgB0VxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 16:53:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so565706lfc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OBxG5p3NtRm8vJZ9SrWGbyvBMMrZfbcd6sEkh872Wpk=;
        b=J2HlgJvotRvArCBanF+nmCfWdRF8pDW66BdmQms7zfNgyS7lRauYT3bDS5OboDi2DM
         ifdOo7gJ8d+ZZyQcHW2Fg38xWkUDpHzNNzVJKJHCx5P3h/fPWvAmbJsxP/jGHk9JHs8h
         efR20upDTYOd5dbP0XxRZK/5y/3u0AYyvc+eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBxG5p3NtRm8vJZ9SrWGbyvBMMrZfbcd6sEkh872Wpk=;
        b=IfYI554fmbA/u90unXcs8zXyxlEM63fwbl5BkJL6/1+ohNgR1T9b2Ugd5WXts3371t
         Yh1sMBR+5v9fswl9ejuHDKbQlILzIxopgxG9cUC7RMF+4ibINhnpCIdDxgDL6IvwV110
         td0oWxyGtj6RAmn5veTO8JFQg8u+FDjgCrnZIh7H5mVDkGogRfwiQwmqs423hYrBqj9P
         /HL/R3K7eTuZuGCnievvxeewK6nbZtvhlsSqAuSmbyiuweXTGRLdBCqBclTvWLyEqVeU
         pgoBgVEctvIJ+EJi81tVlKFvvv3q+Bxgcv0iA9KFjvoBhJSSW8dctwBFls6CM1eN1Nwl
         ad+A==
X-Gm-Message-State: ANhLgQ3kHMsOEAvCLsrODyl9ZzAo0q4WQWuqipGtq7oUJU5no2sjTRqc
        j4YiPek9BMm3+o/4/nJEWWDRwc+6zuU=
X-Google-Smtp-Source: ADFU+vvkJABL7Lu/rfv+z8UvJaitkcduuM0uz0alKIfIHW8QRTc5yKLb90VVspks1DgBpXujj9aG2A==
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr764829lfl.215.1582840391804;
        Thu, 27 Feb 2020 13:53:11 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id x21sm4256722lff.0.2020.02.27.13.53.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 13:53:10 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 83so535564lfh.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 13:53:10 -0800 (PST)
X-Received: by 2002:ac2:5226:: with SMTP id i6mr725638lfl.99.1582840389628;
 Thu, 27 Feb 2020 13:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20200209183411.17195-1-sibis@codeaurora.org> <20200209183411.17195-5-sibis@codeaurora.org>
In-Reply-To: <20200209183411.17195-5-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 27 Feb 2020 13:52:33 -0800
X-Gmail-Original-Message-ID: <CAE=gft5OOQVKe9ow2ApbEAjmgqRc05hHVxUi4os+4-gvpMh4Yg@mail.gmail.com>
Message-ID: <CAE=gft5OOQVKe9ow2ApbEAjmgqRc05hHVxUi4os+4-gvpMh4Yg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] interconnect: qcom: Consolidate interconnect RPMh support
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-pm@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 9, 2020 at 10:34 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> From: David Dai <daidavid1@codeaurora.org>
>
> Add bcm voter driver and add support for RPMh specific interconnect
> providers which implements the set and aggregate functionalities that
> translates bandwidth requests into RPMh messages. These modules provide
> a common set of functionalities for all Qualcomm RPMh based interconnect
> providers and should help reduce code duplication when adding new
> providers.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Assuming Georgi's comments get addressed:

Reviewed-by: Evan Green <evgreen@chromium.org>
