Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B54253A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 00:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgHZWgq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 18:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgHZWgp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 18:36:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E54C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 15:36:45 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 17so1895221pfw.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 15:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=gB8oYD4Pt7SucchxU+DTOwvZHtGiH0OIq9M1B9Glelo=;
        b=BAjSdUDhLhzv3a5zudU06ZPo6k5P9FUQEHaW1HDzkIUz/bJUmhH2l2l7kBO6nsu9uA
         vGyLlE9+D5QMs6YgHoengrtlsj8wnSzDhW9cvhsb2FVPFl5J0ojeNC2SPsWnWm6rzP11
         3c2eLNCSfNOO6mxK8YQditkEwvvwCpcS+b0cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=gB8oYD4Pt7SucchxU+DTOwvZHtGiH0OIq9M1B9Glelo=;
        b=p8eFSX3akcUhXesHZFNHAoz7FOQdZNgZHPbQvnrwt7fYNCRjCqyAwLpCKeAN5/SAfm
         84njo1rlD0DxUkyrEoWusP1e/v4wDirdbM/TEhKUjifEVvmlhKiYIFBZMvQqeHPch7gR
         n8ZnSi7DLdWC3pQjitLi5YbNuCDw97hT8bW8Hxo+L680iBq6a1t3V7YFwy5Ohc+2Ctax
         LqQ+tImc7kpjqq3vGOq51y74G8beWNw7otJMuaHOtS9UNAxxet32Uwp1I+TITPdicEfw
         kg6cZAPXXLYdTszt0TnGxiYxTDzxXedpTutOgw/8/rbMrQ5P2mipGiTPWLX+y+J6LkmK
         w1tA==
X-Gm-Message-State: AOAM532X5r0B3ywgWuO4eK47Q72/Kl+sQcN16YLp2I/I3wXiXxHzoGsf
        l6as6Ev7FsdId1Fn+DXqYx6OKA==
X-Google-Smtp-Source: ABdhPJzdiI/nHqh7JYW+Vz8f9/GsJbJTcwPvfi3VNEzB8dWcmy2EETtbtqW62ezuMpYK1btN59jjjQ==
X-Received: by 2002:a17:902:7481:: with SMTP id h1mr13480687pll.139.1598481405002;
        Wed, 26 Aug 2020 15:36:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id t33sm52987pga.72.2020.08.26.15.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 15:36:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598354482-15491-3-git-send-email-mkshah@codeaurora.org>
References: <1598354482-15491-1-git-send-email-mkshah@codeaurora.org> <1598354482-15491-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh: Allow RPMH driver to be loaded as a module
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        John Stultz <john.stultz@linaro.org>,
        Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org
Date:   Wed, 26 Aug 2020 15:36:42 -0700
Message-ID: <159848140288.334488.4195649089371689022@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-08-25 04:21:22)
> From: John Stultz <john.stultz@linaro.org>
>=20
> This patch allow the rpmh driver to be loaded as a permenent
> module. Meaning it can be loaded from a module, but then cannot
> be unloaded.
>=20
> Ideally, it would include a remove hook and related logic, but
> the rpmh driver is fairly core to the system, so once its loaded
> with almost anything else to get the system to go, the dependencies
> are not likely to ever also be removed.
>=20
> So making it a permanent module at least improves things slightly
> over requiring it to be a built in driver.
>=20
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [mkshah: Fix typos in commit message, send after removing _rcuidle trace]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
