Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 342FF15B466
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgBLXEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:04:40 -0500
Received: from mail-pj1-f45.google.com ([209.85.216.45]:39516 "EHLO
        mail-pj1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729197AbgBLXEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:04:40 -0500
Received: by mail-pj1-f45.google.com with SMTP id e9so1521820pjr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 15:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PhL4y2Ns/NFToQF8DJTrK0HgwaVtHS/iKBzX00SobGg=;
        b=etSOx2QQEAZg4TSjUxAks7fbX9BcsRkiVRRMYr6FIwMR3psVVZ5yLkRbRsEvo+digw
         xIvPLGAyoOVYrzyaTe6ptofGbcLLTD8Tqobl/9QXZJhfW6O2F2FEKHl1Pwa0mrPViUMW
         YdFchCgHQPcm64dUWuclWZGdJc2pBos0E7WUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PhL4y2Ns/NFToQF8DJTrK0HgwaVtHS/iKBzX00SobGg=;
        b=PLfHdf0E3UeAtcj+u8NgKRaGdU+AZ15u5cDpB5/OZXvbe8jSP828L5he0A2CmY9VKI
         GjIon9me2obiHANrRLOsLp8agRd/sdoBavIvCRN48v72KDT3mSD6+CAljSB1i5WDWWN3
         T9FO6vpANHnu0Omr6ExIYtB4GRzKnYF17daTD224q+YID26KS2NGLvyBDiwNII9DzTtu
         YEYq3Me3qIPpS89Zxi+ar1MXIrXHrYghYsOIDOd8IOm9TLy+cSkNIUULGtTx8Y3o4ynm
         RoIfcfe/sY1MCYZmG2l7VPiS2yDnu8PxvDqO4Savu1A70IxEybDSMTZQyvrUTfHealTy
         1NEA==
X-Gm-Message-State: APjAAAWaSvwK4q/N2C25OqJUxE0n54ZPfqg/2ABur1u+qT4tjFo5rETu
        Yo0wh0aaqypCaKqn+gKe1s9kWw==
X-Google-Smtp-Source: APXvYqzxgU+5yuNF5Rv0HXS9zL8x4pILgTjsHg6W5JxhCX4rgS04HgMQN0+uAntRPS6fbBe1asYfFA==
X-Received: by 2002:a17:902:59cd:: with SMTP id d13mr10720820plj.146.1581548679950;
        Wed, 12 Feb 2020 15:04:39 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v5sm191562pgc.11.2020.02.12.15.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 15:04:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200205065421.9426-1-swboyd@chromium.org>
References: <20200205065421.9426-1-swboyd@chromium.org>
Subject: Re: [PATCH] clk: qcom: alpha-pll: Make error prints more informative
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 12 Feb 2020 15:04:38 -0800
Message-ID: <158154867848.184098.3370579513642470683@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2020-02-04 22:54:21)
> I recently ran across this printk error message spewing in my logs
>=20
>  Call set rate on the PLL with rounded rates!
>=20
> and I had no idea what clk that was or what rate was failing to round
> properly. Make the printk more informative by telling us what went wrong
> and also add the name of the clk that's failing to change rate.
> Furthermore, update the other printks in this file with the clk name
> each time so we know what clk we're talking about.
>=20
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-next
