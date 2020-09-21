Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0D927337E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 22:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgIUUHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 16:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgIUUHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 16:07:11 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B84C0613D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 13:07:10 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f2so9986095pgd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=AlaOoj5U8m2P/REWaLVWAETneQOfeX+pZHRa7JtDSF4=;
        b=f0yBwq9ua+qdjOCG6vn+3kaP22P1cY5PInD+ibNgbd/aHNTT7S8qHE7eFOY3ydNi//
         /5w79PRdWCAUVjzEB8erGf/nZRM9PcmqT0x2A/pWuwLezPY1tKewYpqzUWRDAebqtG/s
         U6q0XLN6zkS4oXW3Lw6v/KHVPkP3BS9vZ/mp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=AlaOoj5U8m2P/REWaLVWAETneQOfeX+pZHRa7JtDSF4=;
        b=CMa1GJ8YC3a2HOi+Tb36OYuBUggTI0JgfROnYkssjTD/SLykM6GiZUJtPdv1wEuhgN
         twgyhM4Tho0jqUrMM5cHQ5ME6unOZepam7foSuz5RP03hYrFpBw/Sm+TKhIBjbh35Oue
         afBgSMMqaoADQZYkFXc6m3BtjpAQbr327ufKObcwGshMWsjmfTYUJPpGjGdjpcVvYHq/
         b3xZHzuyk+uLMBPvBpC3oFlVgIv82R4jaLLyE3++J49V+jk0qkOBwkF8EyjAdaUyCq3N
         KN3ktkHmtBItiamc2SDkQ3b7Od+SVEwdyqL1zJ/2+id4kd8aQNILBRsRFywd5C2ch4Xf
         SCog==
X-Gm-Message-State: AOAM531eno/n4RDAyc2Vc+PXVwCth/xWACXXR/UyIWdo8fz2IDExtck1
        KdHWZu4DiZHqdIItWxSfTCa98/dA4etCXA==
X-Google-Smtp-Source: ABdhPJxddrWMwrfYN0JMc7XwtqcK/4YMKiP3KYQmU9PGpgN7qWprcAbkvUC+EF7+rsNBDcVst4acZA==
X-Received: by 2002:a63:eb58:: with SMTP id b24mr972895pgk.178.1600718830284;
        Mon, 21 Sep 2020 13:07:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id f18sm13938548pfe.153.2020.09.21.13.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 13:07:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200918174512.v2.2.I3c57d8b6d83d5bdad73a413eea1e249a98d11973@changeid>
References: <20200918174511.v2.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid> <20200918174512.v2.2.I3c57d8b6d83d5bdad73a413eea1e249a98d11973@changeid>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Switch sc7180-trogdor to control SPI CS via GPIO
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, akashast@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Mon, 21 Sep 2020 13:07:08 -0700
Message-ID: <160071882844.4188128.5172158545089744293@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-09-18 17:45:28)
> As talked about in the patch ("arm64: dts: qcom: sc7180: Provide
> pinconf for SPI to use GPIO for CS"), on some boards it makes much
> more sense (and is much more efficient) to think of the SPI Chip
> Select as a GPIO.  Trogdor is one such board where the SPI parts don't
> run in GSI mode and we do a lot of SPI traffic.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
