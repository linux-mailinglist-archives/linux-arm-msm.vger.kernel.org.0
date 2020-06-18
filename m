Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB91F1FFABE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 20:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729538AbgFRSF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 14:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729506AbgFRSF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 14:05:26 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D431C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 11:05:26 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p3so557252pgh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=U/NBx5iNuxPhAKHb+kUULsBBMbGGlzASGtNIcw4W5uE=;
        b=Z72UdmlicDyKDeBJTvQpVBA3ht1UUD1b0OD1QjLw/ez1ugGh5UQKAMSLjzs45zbd8W
         Z943RjYBpyrshoTRMDtmv8OsXhbIPDWquxtsT+ddOZhy4NjS2dFIMzzquu2HAa9WCfRR
         Q8Opd/GT3dGPW++wFXkafku/r93AieqnWAq7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=U/NBx5iNuxPhAKHb+kUULsBBMbGGlzASGtNIcw4W5uE=;
        b=Il7XeINgKWDPVl4qnws54XjrwcCLFZO08pO3DHjRwrR3UNXzSKan1P7Ew97g41s/QG
         XXdbnIVErYGLJvB5MnbY7Ghex6YN49kvWrGXagQyPoPNRe/FZpqUxC2NYeR+pop0bAFs
         uWmomTqzKd26u087W2ZySRxSero8HZN2aDUd6wFvbcR3CefE/hD/AJwi9/QEcmKTqELE
         llcIDLpqk4SbHdo6NQuB/SSUNy8EUeENf6qTnwqlcBm+2IIc5qouPqjDVPEx1byt/Apk
         zX3pPCHeW3TjK0R3c5ncDR061BMvN5/+k2tB3Iw8J7nxBYvBZHpdTHQkotoeDhlmByQQ
         TNuA==
X-Gm-Message-State: AOAM530hQ0stZwm0Zb2FugbdlfKUveTHYxQvQabyVG11F4EU82FEbOi0
        5UiCwmIHmZZO+n6w/AL3z9bmQw==
X-Google-Smtp-Source: ABdhPJx3p0Z9jr1KsFl6XpysHkvnoVCnziYUSjlxCRl5yETq1eNcKTLonfueBPsrFSZtLmcL6Q7P0g==
X-Received: by 2002:a63:5a58:: with SMTP id k24mr3964247pgm.1.1592503525574;
        Thu, 18 Jun 2020 11:05:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d6sm3133807pjh.5.2020.06.18.11.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:05:24 -0700 (PDT)
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
Date:   Thu, 18 Jun 2020 11:05:23 -0700
Message-ID: <159250352382.62212.8085892973272354046@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-06-18 08:06:26)
> @@ -126,20 +120,23 @@ static void handle_fifo_timeout(struct spi_master *=
spi,
>         struct geni_se *se =3D &mas->se;
> =20
>         spin_lock_irq(&mas->lock);
> -       reinit_completion(&mas->xfer_done);
> -       mas->cur_mcmd =3D CMD_CANCEL;
> -       geni_se_cancel_m_cmd(se);
> +       reinit_completion(&mas->cancel_done);
>         writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> +       mas->cur_xfer =3D NULL;

BTW, is this necessary? It's subtlely placed here without a comment why.

> +       mas->tx_rem_bytes =3D mas->rx_rem_bytes =3D 0;
> +       geni_se_cancel_m_cmd(se);
>         spin_unlock_irq(&mas->lock);
> -       time_left =3D wait_for_completion_timeout(&mas->xfer_done, HZ);
