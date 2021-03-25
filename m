Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E93A3493F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 15:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhCYO02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 10:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhCYO0T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 10:26:19 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351AAC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 07:26:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r20so3386454ljk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwetcsVKboaaGI7NOXNHnyGvYuGd+RB0dddZvR4dJYk=;
        b=HnLlDdBGzEt/TgWGyKUmPogRtz8oZQVM03CogodEU/UwYa+YsG6vZA7EP9aRbbnP4f
         E5yi95rKRs907JDF6G/+3OYef1fTAFAP1+qBFhSW7mzeyVUJL237u2l7LBm2jZ3H+/2l
         d9hQZeA5U3EiqJ6rDsZ9HdQy4Eh1gp92TIuRu+KPXd8ctc0e1g7GvTHGTX5c1pufvpKW
         u6NNHIZ6ohMKcDirddqaRBk8zLyijioUnrVIobCFccwipmEmlL0rDZeA1PgAiSlA8cGr
         Y9D1i8QPt2nrKY4y7L1y+ExWE3cSuS2hRVSBmseu/TONVYtDkiMOz9tyz6uNUuWt4yQn
         iukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwetcsVKboaaGI7NOXNHnyGvYuGd+RB0dddZvR4dJYk=;
        b=O9pq5wiRCmov4WNZpohuqPRxwUwOWW1tr0TIkC+Pdm0U6m2JvXziCIkNdhIoOo9YqS
         eFD3UgkFp5t4T0XnXZ4LWqt4hRnEqSH5swey9WN9GUvvc1yCUi7DYwQ1Ko3XB/oXjjNM
         yQ0WXvJbA76OAw7bB91jPgGzOXRA6nREdyDrtlTkiD6hWQdANor+z4GcnciqgJfuCHNT
         bNJBDUOE1u535qvvIn+ngD0KmC/u2I3F4oRtuZLH6Q9sDgL6FeSMLBIZE6N2SjYqf1Mn
         MsIpHfZFEB1TKcECLMHJAtNDhIs3HWOCUL1AXV1UKXC2QXBeLi5sj1441ozGQLF0acxe
         qXOQ==
X-Gm-Message-State: AOAM531ty3FNB+FWylHkCtjH6qLoAKEiNPOqtlcgN/VkYbp/YW97VfEc
        oBmIJiUd3bbFKw0PptPENOIHrQo7+vyFP4QQLK8xeQ==
X-Google-Smtp-Source: ABdhPJwXghMxC+jJkN24Dc68V+VPVcQEjT4VLmT55y6SQ+X6rU7+oMMn50hB89bI9yQv19zi6WlDqbz5VNk4XxOb0gA=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr5808808ljm.273.1616682376700;
 Thu, 25 Mar 2021 07:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131728.2702789-1-arnd@kernel.org>
In-Reply-To: <20210323131728.2702789-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 15:26:05 +0100
Message-ID: <CACRpkdYS9JVnbdW_+_Qi9ujA8j9p-1r7c1UeeKToukQffN1u5w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: fix unintentional string concatenation
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 23, 2021 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> clang is clearly correct to point out a typo in a silly
> array of strings:
>
> drivers/pinctrl/qcom/pinctrl-sdx55.c:426:61: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
>         "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
>                                                                    ^
> Add the missing comma that must have accidentally been removed.
>
> Fixes: ac43c44a7a37 ("pinctrl: qcom: Add SDX55 pincontrol driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
