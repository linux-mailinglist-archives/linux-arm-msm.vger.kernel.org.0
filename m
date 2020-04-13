Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169911A6FA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 01:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389866AbgDMXCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 19:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389827AbgDMXCE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 19:02:04 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5BFC0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:02:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k15so5211097pfh.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=u3KDTSVXv0G9CPqt4rOITnttjWd68okDX2macURumrQ=;
        b=n4sci+1yC9dhea8Ld6m2EkOlXaVXZ4Mvcv8sQslyGPpQ6N+uSvcMuBE4GemsmnbyFP
         lcY/bkCD2b0vzmYWO/UCm/RnpF06K/2OITxl/Q18RtW1ocd1mUZOhNPEB4iOaQuGH1kL
         nlglXjS+y4HTTQWqKkhaCrFhTAejAn5LX0P+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=u3KDTSVXv0G9CPqt4rOITnttjWd68okDX2macURumrQ=;
        b=Rjg4Xl3jwMp/wzaJV7lIoQIiAJFYzq+8G56+NEXwJL5azqsc4gyOYJ24AT/abS9vH1
         yDvtOMh9WC6AIwZN8owwfCGgWD/VRQFbHAvKD0dKpeilIdsmO8wUhUvgDXaQgRt9pPQ2
         TDMajjg71cx6yL+pRzEcyxer8AmdQHmD/cwjJuzKwykAWq6ZBU95u3lMkhpVNmWRhQ6h
         rC9Cyh9sBRVqBUPpmHfCyBfv0IP990UKA5iqGFKWE3p3fefOacJ03O6pwHbquyoEGWEy
         n02V6bzuoGhVVjZAjro5p7w8zfVmGZQGEAVd9GsFeS0BgZtEyQHPVCkN1lof2pya7ju6
         zGDg==
X-Gm-Message-State: AGi0PuZ/guHEwRpBKasG+xdfUJ2dzdY0xBYg6XX1LKEu/ArGozViSVP5
        11x4Fz0Df+SQv0dPCHI/sj1uCQ==
X-Google-Smtp-Source: APiQypIf8hHrxsaa0BaxWFoOdC3OegBx+rcNktTAQXtM/XA7n0O0tcSlc/yBMFlwH8r1VrUlkXL7og==
X-Received: by 2002:a63:dd0a:: with SMTP id t10mr18844423pgg.229.1586818924267;
        Mon, 13 Apr 2020 16:02:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x4sm9566683pfa.191.2020.04.13.16.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 16:02:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.8.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.8.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
Subject: Re: [PATCH v4 08/10] drivers: qcom: rpmh-rsc: Don't double-check rpmh payload
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 16:02:02 -0700
Message-ID: <158681892294.84447.13195059143414023653@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:13)
> The calls rpmh_rsc_write_ctrl_data() and rpmh_rsc_send_data() are only
> ever called from rpmh.c.  We know that rpmh.c already error checked
> the message.  There's no reason to do it again in rpmh-rsc.
>=20
> Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
