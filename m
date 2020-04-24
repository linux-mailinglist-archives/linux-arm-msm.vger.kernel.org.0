Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBB31B7DDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 20:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgDXS2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 14:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726793AbgDXS2s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 14:28:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BEAC09B049
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 11:28:41 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e6so4201525pjt.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 11:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bo0gNJYD9TaFbPTYHZNdZmu8XOHkiYZaUwRrLiBlQt8=;
        b=nkIS6iDRrrk60XZCjmY+b/v/aV6BYN4xCBd8JR8pU3jX6L/soKWm+Sqyeu8fhaaFxq
         f0BlWcYwlEmb0vivIreM3UV+VDxe1vpG5wjN84IqLo1WLefte/5eKcfX7qaczFq1CjVY
         qVJs06yBb884/K7vZKoHnou30mWwKHw9J9Lbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bo0gNJYD9TaFbPTYHZNdZmu8XOHkiYZaUwRrLiBlQt8=;
        b=kKL1qoFZdte9Nb5oElgqSORp4nsIB9oGKu1n9HHrrcZnpGjm/CpZH2MXfdgDoRlb+e
         feMvzPIno83JFueFU19vmwd1BIJs1d+ElGb8mPG422KUlL0ljkewauZoaZMi9W41eKPT
         TYstNHcUhsY6Ome1QEdenEoQSix2Y4m5+Td7yWOmPwXc9sH5z+IagKSqpMZ3xuKKgBlF
         2qtNOlQqLQz141a1n57xjEW1sNLlNim4JcO40VHhix2mzmQEVkLLoX1ROwSFO3vLADXa
         u5EfjC7Jab5euKVMdit1jqiGasctT6/83xseJbBxS/UeFskNjtomAU/EUOyOtNXPZZLC
         Km1g==
X-Gm-Message-State: AGi0PuaQJMwlHbkxI5NRJmvTR45XlGiC3y6J2L9r8+in9fZ4A4s5RYAK
        3yIAs9Pe0BXrIfGuyQmYu9NVUw==
X-Google-Smtp-Source: APiQypKQd5ZOUkWaJNEa8HpJ4UolzAGh5EYjp2Mw2Gm3PoS9ogmjosprM/Z1/YDNMycww0TPlZdvrg==
X-Received: by 2002:a17:90a:8c93:: with SMTP id b19mr7824732pjo.141.1587752920900;
        Fri, 24 Apr 2020 11:28:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j2sm6512273pfb.73.2020.04.24.11.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 11:28:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <158775156694.135303.3535369004080151247@swboyd.mtv.corp.google.com>
References: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid> <20200424094610.v5.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid> <158775156694.135303.3535369004080151247@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 4/5] soc: qcom: rpmh-rsc: Simplify locking by eliminating the per-TCS lock
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     evgreen@chromium.org, mka@chromium.org, mkshah@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com
Date:   Fri, 24 Apr 2020 11:28:38 -0700
Message-ID: <158775291872.135303.5673866534956446786@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2020-04-24 11:06:06)
> Quoting Douglas Anderson (2020-04-24 09:46:56)
> > @@ -581,24 +575,19 @@ static int tcs_write(struct rsc_drv *drv, const s=
truct tcs_request *msg)
> > +       ret =3D find_free_tcs(tcs);
> > +       if (ret < 0)
> > +               goto unlock;
> > +       tcs_id =3D ret;
>=20
> Sorry, missed this. We should keep the tcs_id =3D find_free_tcs() thing
> and then assign ret to it on failure. Otherwise the return value of this
> function is -EBUSY or the tcs_id number instead of -EBUSY or 0.
>=20

Ah I see that ret is only returned on error. Nevermind that comment. I
should make that coffee this morning...
