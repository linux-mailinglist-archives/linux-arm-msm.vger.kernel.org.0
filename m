Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B74173D20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 17:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgB1QhL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 11:37:11 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35689 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1QhL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 11:37:11 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so1450743plt.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 08:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=/NFEg+xGYEe7/uJwrQbwOpUOv1hOItyafkcLvnfAmT0=;
        b=J3yZmrrV3Yq1gwNk+dVNMYetlczt9oMqD4SHb1amr3kSZc/XwoiwOLXQzlyY/MXsby
         /N+/ZcDG/Uqs0Tg+hSKcFaBbSKRNKHRUIcDKfSK21ozoIaRZ6WKb4mRL3+hCdG0/mQQH
         4LYxnz97NwzMaCMuj3qYgTgWjSBji06ocb/qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=/NFEg+xGYEe7/uJwrQbwOpUOv1hOItyafkcLvnfAmT0=;
        b=G67QU/iYIjH4wBuHnApdXAgd9mHuhG2N4UrNQTkxx4WjjTA6yYU9TQjLTf5axSRzf5
         lN6kAutVqWZlXacfuz1qF/F8jCo1BlNhYyCO9j90XfaYow4QxAN/IoQP3VZgY8HNH6S5
         9mSjU785ggO+fh4ia7CEeobSAcLrA0Dhto0JFV1HySEP8PFWDLvZerfMZYTMP1BUUPZF
         z7KqUWt1exIupf7LXMmpzG4jt8hqwE8CMMxJamEDB5l6rd9rXWwGvKec9c0bSLWvI+7q
         7/CBL8Cvor2MJxUpXEkC9Nf4+lgsB+KOxwI/s7FN7E7qOdOiB8LgnnGI6S1yPGsh0u26
         IEtw==
X-Gm-Message-State: APjAAAXBsSQroo7LbwivCLtyZWERotUrme0Y5OYb7gfBzVTTj6HIytPt
        wIKD5yZvqBaDQMG5jogkoW63wQ==
X-Google-Smtp-Source: APXvYqyRZ6+r8SmVVFg3L/kcl5C/KHZlU9NEagz8JNIOMLLjgjEOWOnX/B92lp/J+hoQT9XmkDZg8w==
X-Received: by 2002:a17:90a:cb96:: with SMTP id a22mr5583966pju.96.1582907829843;
        Fri, 28 Feb 2020 08:37:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w25sm11402209pfi.106.2020.02.28.08.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 08:37:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200228124810.31543-1-rojay@codeaurora.org>
References: <20200228124810.31543-1-rojay@codeaurora.org>
Subject: Re: [PATCH V3] tty: serial: qcom_geni_serial: Support pin swapping
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        skakit@codeaurora.org, msavaliy@qti.qualcomm.com,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        gregkh@linuxfoundation.org
Date:   Fri, 28 Feb 2020 08:37:07 -0800
Message-ID: <158290782779.4688.4351067333155148519@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-02-28 04:48:10)
> Add capability to supoort RX-TX, CTS-RTS pins swap in HW.
>=20
> Configure UART_IO_MACRO_CTRL register accordingly if RX-TX pair
> or CTS-RTS pair or both pairs swapped.
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
