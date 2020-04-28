Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD2B1BB9B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 11:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgD1JUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 05:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727055AbgD1JUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 05:20:49 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7618C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 02:20:48 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d25so1366204lfi.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICN7dCbBx+6WcoJArMnBEzGvK72rSzOZiK5dL2bPeD0=;
        b=GSzf/+wsv5cyATIz/phw1ojwp4XlksxZM2jEHxqwTKLBsfOj2Tm8SPZhPYNBd+ZYiw
         kkFCMlrO12KSyLfwW6Npq2lked/S06URs6P2h7WJVdy8hHZ+CBtRGQCAQDMgJyyyLRaO
         IvBJ7XYQ5jC0tIiRtVPN2ODt0VtbClcg2ZPs2tMKCR1du0uNpaTy0bAsbdFeW8k/6lVQ
         KjKh1X855w6wNtJ5KK+z0/TMd5dyQCBrcsoXmCGNxSxdiKBaLmy+WoA5p4sO8gqIU4K/
         yvpoXibwcg0tLpNTItn8e408z//AZ+7vFd8F9xxOLytU2lVZhMpt9K7sasBX3FT6nu4o
         4phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICN7dCbBx+6WcoJArMnBEzGvK72rSzOZiK5dL2bPeD0=;
        b=HVa/0yoW+EGgB8zXGQPZP3oGtT9fz17WnowahYLkQkod7+lA5pQ0BhRj84vEYjEiit
         TuIDSfEWnfzQdDw0JkBcY9UT+VcPBaSR19OnvKUyjUdKNQGFthADQZyGW/uzkOxg/r1u
         rjmfN6I3ZYH2LJ/++3h1IPPkYeu3HUmkQpnDM8hA9b56O7RAdtEig4F8ToBUGg5npVPX
         JSmusH6HjR38O7mlLuEwCMa/YmUOro74wjBZ5ribD4zUykPRzf/K8xJeHJDYjMNLBqN7
         3KqKflrpJi7V0YLqLLb7iC2Xv+Mp/uOgcXIVv2anx8RhP8Jw3debNhGiBCG5NPbz/Rgn
         rd/Q==
X-Gm-Message-State: AGi0PuZXvfjA5U4HMZTWKPvKWBq4UZ71PSlRDSCSSfBRcaH83aJHbeD7
        1Xv3jxEwpf65CsPxBcSq2D6JtzSY0HCpkVw7fsplpg==
X-Google-Smtp-Source: APiQypIus6ZMe4qjasmN97t76YaFjK6cebZ/M2PBOdjLaAbJq41X1LdszKoDynGbta+EZNl04COKBV/jynSPVQp9okk=
X-Received: by 2002:a19:42c3:: with SMTP id p186mr349742lfa.194.1588065647258;
 Tue, 28 Apr 2020 02:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 11:20:36 +0200
Message-ID: <CACRpkdb9ZmoD5x1g7O-BHFWJ3qNMBGrrVN_=ygDAMuXe76xuFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Qualcomm SM8250 TLMM binding and driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 17, 2020 at 8:19 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Binding and driver for the Qualcomm SM8250 TLMM pinctrl block

Applied both patches. Thanks!

As noted elsewhere Qualcomm is full circle now recycling the
number of their first Snapdragon QSD8250 SoC from 2007
for a new SM8250 SoC only 13 years later :D

Yours,
Linus Walleij
