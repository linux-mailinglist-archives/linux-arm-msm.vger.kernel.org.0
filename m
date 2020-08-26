Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC0D2539CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 23:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHZVcm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 17:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgHZVck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 17:32:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A87C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 14:32:39 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g29so796988pgl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rkzp89VoreQ7eX4za8vZnmEXUlZ/cYLkTpUfs73UjoU=;
        b=Z8UOpPzBnC2c8OmrazqsmRXFlhv8HP/90v6LNuP3tQE1gAaLXwgaslidJi89qgdWM+
         ruqDUD5YPR9PFsRpBkGVD4JtjPHy5rOnyq32Ts0d4TLpbyLc26ntSl+7yE9R78oikNrA
         BHg4sjVmiHlVxrsRSnSYgHXDYwVF9cSgOd5b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rkzp89VoreQ7eX4za8vZnmEXUlZ/cYLkTpUfs73UjoU=;
        b=CIuQKn/x/a0PqBoabT9+ByyetX/FPJmIFam3YoBGVEKr2MiPqpzayIhbbNWycn7NpU
         tcD7Q8fxb7mbPKB0Pl1GAVE6ppECD7VSJpaNGTdhh52TFaTwBQEGFlSaeUM5rmeRB7RL
         jQbTwzxs7kP3Y70la9yau8og+creQsVWxSnU8joufMWE81jOXKTsZnIhvAO/K7jnvzSA
         Uevl8Lk4SHCDVDrg9cTydGkJmGsbP3GlWnKOHduvKMnu/1ZExWMyLQ2KKtxobq036MWU
         NLlVwR6myYnxXjfXe9GOCJcrQNhNeVg0jQYDFjIOL+HpVGOFbFACO9gTNVsOmuP/5mDL
         l5Hw==
X-Gm-Message-State: AOAM530p41c1EJP15vVmUIM4ICdBEHs6mArXzMcn1VLRt9QjGXcy0Gct
        ozGSEI2DGM+6XlP+QHHcQqLlmw==
X-Google-Smtp-Source: ABdhPJx4a16Orr6CneM5HujT4O58wtmFJ2JxoTu12gg6RVZKdauSqY00wUhdCy7pKPx8KrI9RhEi6g==
X-Received: by 2002:a62:5cc4:: with SMTP id q187mr13657946pfb.95.1598477559338;
        Wed, 26 Aug 2020 14:32:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e62sm119583pfh.144.2020.08.26.14.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 14:32:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200826043616.GF3715@yoga>
References: <20200826024711.220080-1-swboyd@chromium.org> <20200826024711.220080-6-swboyd@chromium.org> <20200826043616.GF3715@yoga>
Subject: Re: [PATCH v1 5/9] phy: qcom-qmp: Get dp_com I/O resource by index
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 26 Aug 2020 14:32:37 -0700
Message-ID: <159847755731.334488.13614233203912102191@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-08-25 21:36:16)
> On Tue 25 Aug 21:47 CDT 2020, Stephen Boyd wrote:
>=20
> > The dp_com resource is always at index 1 according to the dts files in
> > the kernel. Get this resource by index so that we don't need to make
> > future additions to the DT binding use 'reg-names'.
> >=20
>=20
> Afaict the DT binding for the USB/DP phy defines that there should be a
> reg name of "dp_com" and the current dts files all specifies this. Am I
> missing something?

Yes the binding enforces this but this patch is removing that
enforcement and instead mandating that dp_com is always at index 1 (i.e.
the second one) so that we can add the DP serdes region directly after
and avoid adding yet another reg-names property. I changed the binding
for this usb3-dp phy compatible to make reg-names optional as well. I
don't see any gain from using reg-names.

>=20
> PS. Why isn't this a devm_platform_ioremap_resource{,_byname}()?

Sure. I'll roll that into this patch.
