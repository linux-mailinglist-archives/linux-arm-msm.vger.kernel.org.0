Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B821AD6CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 12:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403791AbfIIKZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 06:25:03 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45307 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730322AbfIIKZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 06:25:03 -0400
Received: by mail-pl1-f196.google.com with SMTP id x3so6306099plr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2019 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=TyNObdox1Iixd3zdjTU48f1Hvwe8ktTALjvLZDb3R8o=;
        b=Gy3GdGrC2H0vAPvVXFy7E3x7By74bGTaeH6NGTKpD7w8/GgGJHjYKmbfMF22EDtA5B
         f5t5fUsvRZnfkAg2s2I3/vJwMxsVh0krMkkMa7Ee4s/w4KIBoRIUCTM0OI59Mh4RXkVw
         R7LTkg25XjGZcEUZlnpMa19BBp6+z5JcwqKWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=TyNObdox1Iixd3zdjTU48f1Hvwe8ktTALjvLZDb3R8o=;
        b=MTiJ3+03uWYTmX+tFfoWQj6CRZLEuQliH+O2T8fsfoky4HXwNPxtiQDbGY9677fTdu
         bIwVIuXRfmT/1g3H5PNRjTUBQS/O0eS/lR9GTIfaBjSI0RgDhv01hSK7tuAulwssxwDI
         6naH7hw/xCyIBJDWRnFbPewfzrJs8AHXUBBq+PmO97YPZGk3/eusNtZhBzc7NbFb6EdK
         LMTff3BXdCNeCcgw3iwjXVpUqaUbw4/F3aGtJGnvqSTux3otBpsrkqsxa/lX5JdxWJoM
         CpBILLc8ibEO9yWa0akHim9FEjCbEV1Gt68x/vqbOe+Z/iQMPUCA5CGfeD9xmaTjrZlu
         HfGA==
X-Gm-Message-State: APjAAAW+aX2nl/TaeVvfWOFaalR9wrgYWjjf89FdkRIFt6UTISiE0Gep
        Lfl9eHudkgXDfL41LONrlBhE+w==
X-Google-Smtp-Source: APXvYqzpzWFH0V95+RGywC3U3nviZcDv33Y78qLcJHexUGEwPoPTOCrEwCOBBtQM/gjQNV2ltj/5YA==
X-Received: by 2002:a17:902:9347:: with SMTP id g7mr23722181plp.0.1568024702129;
        Mon, 09 Sep 2019 03:25:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l6sm33369863pje.28.2019.09.09.03.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 03:25:01 -0700 (PDT)
Message-ID: <5d76287d.1c69fb81.1631c.4ca4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190830195142.103564-1-swboyd@chromium.org>
References: <20190830195142.103564-1-swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:25:00 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2019-08-30 12:51:42)
> Some MMC cards fail to enumerate properly when inserted into an MMC slot
> on sdm845 devices. This is because the clk ops for qcom clks round the
> frequency up to the nearest rate instead of down to the nearest rate.
> For example, the MMC driver requests a frequency of 52MHz from
> clk_set_rate() but the qcom implementation for these clks rounds 52MHz
> up to the next supported frequency of 100MHz. The MMC driver could be
> modified to request clk rate ranges but for now we can fix this in the
> clk driver by changing the rounding policy for this clk to be round down
> instead of round up.
>=20
> Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SDM845")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Cc: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-next

