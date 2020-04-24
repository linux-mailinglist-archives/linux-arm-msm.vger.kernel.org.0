Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25F71B7D81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 20:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgDXSGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 14:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726813AbgDXSGJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 14:06:09 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24800C09B048
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 11:06:09 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h12so2845851pjz.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 11:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ZPbn+iyaDp4cEt6gq261dacrQwB2jOJPwOFzXYvpkjQ=;
        b=H2bD3LNMVT+z8T3e/Fifq37OinFmRXBv5hrj6ZumEIAB98tTCIlVjzFeRgFLpxlZDw
         EmbdZAmb3VC8TdJtrefmGbn5Z517ReANwkM51h05bWZ3l37S2O1NwXQJ5UxSVR51gnXE
         3vAki1gsQzGBWbK6x5pAeDllPxZNNs7P7SrjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ZPbn+iyaDp4cEt6gq261dacrQwB2jOJPwOFzXYvpkjQ=;
        b=GBmz3sB27HSA59nP9C4zCeKSGqdBxvfnvsxUylbScZT6jptufOPA+DLnLOq3nLCNB8
         r2r4aNoZ9N1IwuCXh4UwEGLkL7WyIG75MWGvqpmCBF5TajQgA/RO7DT59ugVpHILXcOM
         vdSek4HfWEVWKyB5+Qfsikq3QhTNDbIVPis/PJ52d7nxGzzNkhUOu90MadQIjEtjXD9M
         oWkCdRzZeNajxl4fkyZ1NSVoK8RHX93ouuc21oOoIgLxb1mpF3g2y3KA4o3UVKdidmTv
         yhX7PI2mZijbNOoLs5Bz8Hidgei2XzlusmuYaFoT+jIaXYoznKBZMd6vkNFwIg8/19u5
         Jrwg==
X-Gm-Message-State: AGi0PuYSN4x9C6pcykAm/1wTabRGz+0cDAnVTs5u7nF1xa5ZRbxQ9+xg
        de8FsqYiuuumzZNbzHVt23OfmnmyrCI=
X-Google-Smtp-Source: APiQypKHhrWUqqcTi5z8uECZoDGeIh9vywF8H7Ic5EIZ1iW9HAVnD6/S66ve0Niry9IQqLcNNI9AEA==
X-Received: by 2002:a17:90a:d3ca:: with SMTP id d10mr7914508pjw.24.1587751568502;
        Fri, 24 Apr 2020 11:06:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q201sm6519329pfq.40.2020.04.24.11.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 11:06:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424094610.v5.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
References: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid> <20200424094610.v5.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
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
Date:   Fri, 24 Apr 2020 11:06:06 -0700
Message-ID: <158775156694.135303.3535369004080151247@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-24 09:46:56)
> @@ -581,24 +575,19 @@ static int tcs_write(struct rsc_drv *drv, const str=
uct tcs_request *msg)
>         if (IS_ERR(tcs))
>                 return PTR_ERR(tcs);
> =20
> -       spin_lock_irqsave(&tcs->lock, flags);
> -       spin_lock(&drv->lock);
> +       spin_lock_irqsave(&drv->lock, flags);
>         /*
>          * The h/w does not like if we send a request to the same address,
>          * when one is already in-flight or being processed.
>          */
>         ret =3D check_for_req_inflight(drv, tcs, msg);
> -       if (ret) {
> -               spin_unlock(&drv->lock);
> -               goto done_write;
> -       }
> +       if (ret)
> +               goto unlock;
> =20
> -       tcs_id =3D find_free_tcs(tcs);
> -       if (tcs_id < 0) {
> -               ret =3D tcs_id;
> -               spin_unlock(&drv->lock);
> -               goto done_write;
> -       }
> +       ret =3D find_free_tcs(tcs);
> +       if (ret < 0)
> +               goto unlock;
> +       tcs_id =3D ret;

Sorry, missed this. We should keep the tcs_id =3D find_free_tcs() thing
and then assign ret to it on failure. Otherwise the return value of this
function is -EBUSY or the tcs_id number instead of -EBUSY or 0.

> =20
>         tcs->req[tcs_id - tcs->offset] =3D msg;
>         set_bit(tcs_id, drv->tcs_in_use);
