Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C198C1FFA9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 19:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgFRRx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 13:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgFRRxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 13:53:25 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3875BC0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 10:53:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r18so3214665pgk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ir9UJL6qlzbqF/eoQrBQerXkNXIPx9dPATNwVgAx1No=;
        b=RDyfYkheyXJdVIK/z/D6LB/q5JWexOPGE5WWIJCxpEIfCjYdnq2EreQNJ27PQPhYl5
         VBH47pBulRMziC3dPK1eJfntFGRrP2OKIg5j44iuk1uHccC4rebxtXMH3JpToEkkRPe8
         pF6VLZDZgP4i35TU9NRIqxh3RZezEV5v5wax4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ir9UJL6qlzbqF/eoQrBQerXkNXIPx9dPATNwVgAx1No=;
        b=hvfq8eGBisVRBTxB5KLma5XaKSPoJg8vCAyxrfNVelfpy2lgdOZaLZK+XOv5O3nHtc
         kJS7U8/rXF0twGaOjRgB+vl1Ilw4s/IqMqGWTaYk65Y7GcPJqKosT+rKYtdEMqoEY4Ya
         nBL/mYw5Y5mDQYCYsWaN+C6yF7Hfp+RuELEHVtpLQ4iBp4jAUAoP0yNvUtt8IrVpM4kN
         3KN3IboQn1v+nXw6Id+XqsRvwz9oVwZtYKrDGiPF7/w5/dbmP4PyLLjkYNCGnm2/xUKx
         HPmDyEUKokijPCyBa30j8lyZf314bz1eab37o9KVUvAoFdVmGVUvD/WY8sar3ipD3tK9
         1J7A==
X-Gm-Message-State: AOAM533wOiqnuadcqDpwNjUvJpe2MTQYXoLvN2RCBTQsmnVDUvZ5nMP+
        XhAvWSUe4NbY66Do3RSaLn6h+Q==
X-Google-Smtp-Source: ABdhPJwLLfeG/qvIUQ0PkT1WAZBOJ+dODyW/t9naB+dy6SkrI+O1rtbXJs3ByChCWrB8DRiZBAsv+Q==
X-Received: by 2002:a63:4861:: with SMTP id x33mr4082379pgk.448.1592502804699;
        Thu, 18 Jun 2020 10:53:24 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c9sm3547470pfr.72.2020.06.18.10.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 10:53:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200618080459.v4.5.Ib1e6855405fc9c99916ab7c7dee84d73a8bf3d68@changeid>
References: <20200618150626.237027-1-dianders@chromium.org> <20200618080459.v4.5.Ib1e6855405fc9c99916ab7c7dee84d73a8bf3d68@changeid>
Subject: Re: [PATCH v4 5/5] spi: spi-geni-qcom: Don't keep a local state variable
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>
Date:   Thu, 18 Jun 2020 10:53:23 -0700
Message-ID: <159250280333.62212.11530324825257967473@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-06-18 08:06:26)
> The variable "cur_mcmd" kept track of our current state (idle, xfer,
> cs, cancel).  We don't really need it, so get rid of it.  Instead:
> * Use separate condition variables for "chip select done", "cancel
>   done", and "abort done".  This is important so that if a "done"
>   comes through (perhaps some previous interrupt finally came through)
>   it can't confuse the cancel/abort function.
> * Use the "done" interrupt only for when a chip select or transfer is
>   done and we can tell the difference by looking at whether "cur_xfer"
>   is NULL.
>=20
> This is mostly a no-op change.  However, it is possible it could fix
> an issue where a super delayed interrupt for a cancel command could
> have confused our waiting for an abort command.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
