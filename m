Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 953351323FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 11:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgAGKn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 05:43:57 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32966 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbgAGKn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 05:43:57 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so38546571lfl.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 02:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ij45+y4tQbjswuhc/ASM64hxiBChi1v4xQfYvXcYB6s=;
        b=H0GsPYhVqTjf0ta9+KsTEWOsl8hYTozJg22rau4LHG6gVZDFkftjFg6m6ivAvrew9+
         w6SQ9vWlurV7I7uMUGuJ2MFZWAvwEjc0g9tesLRrgHOIueQ89kWtwxkX2EMeuyhEm4Bc
         ev6hfj2CYGkr6rEZvPPxaufcm3fKBink56/CEXq2AFrAGsbf5O6MxZeWQe8+9iwLYMHv
         8W9MebwA3kDNbKrwIt8wcDAg913dOlEX1+9Mxk0ZSY5pFwl3vy0tECVjQvWSQruqxgWT
         C/TKRJ7priMWYWtbANZnP1AkjqGSZvydwd87XQ9ucfwBtsxPtmJD1GQtgnp+iAJCDd4z
         EqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ij45+y4tQbjswuhc/ASM64hxiBChi1v4xQfYvXcYB6s=;
        b=Tqi+jvSMmKY9MEZPuuASKzXbvz8lOSUYZ4oYuVGYRJ9iviXDuEc3P9EgvfX5rQI4Cv
         jcLu4rXHfuWRKDa4r5zL3iuuXIlVEdYpx5IVF5zi9FKwfeqifa41lWZC/Rt+JM+n6mqM
         JQnzZA8EYz/UwsbxeX1KI0LvUky/jR5bnPioci1ZHYtAKFmlylwlwMUkRcMRHN1Ke/ZN
         kro6UIQMgo867yxzUAxEq+cQTa8nxlr5nRhAhmAbWo4bF6EePXUQDsBA/98dSOeg2rml
         gMchFImSpiYC8jGk8F3QHlseftT+e8FHPxt9ROIKqNg8qmu9KQ88ox3cpzzxuCLDalig
         +FQw==
X-Gm-Message-State: APjAAAV1iQMeEzqnBqIubzys4bqI7QJPIkTn6RDu2No1TiL5f10S5K6R
        Clg6lFsUzVRaDaDdpuCRldRdMzttirZyazlr67cXP6hFXpc=
X-Google-Smtp-Source: APXvYqz+jQpx/la/O2K0/budtRMX6KFmWmOMeG9QERQ6JtTLWAO+vG67nfJvEFSWtJY427WX0m7HLcUZUjplSCki6YQ=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr58271999lfi.93.1578393835746;
 Tue, 07 Jan 2020 02:43:55 -0800 (PST)
MIME-Version: 1.0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-9-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-9-git-send-email-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:43:44 +0100
Message-ID: <CACRpkdYQfiuziMyu+oCyh-8wmgpzVY7V5+CPNqoSLm3+ZEFmVA@mail.gmail.com>
Subject: Re: [PATCH 08/16] pinctrl: ssbi-mpp: constify copied structure
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Andy Gross <agross@kernel.org>, kernel-janitors@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The pm8xxx_pinctrl_desc structure is only copied into another structure,
> so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

That's a pretty cool semantic check finding things like this!

Patch applied.

Yours,
Linus Walleij
