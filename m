Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2D91A933E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634861AbgDOG2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634828AbgDOG2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:28:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215CAC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:28:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id nu11so6265406pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=4JGChkyT9yg17CJiQ62RUBn5YFLQPkb0ZVIdTMs6zXU=;
        b=OZUVO0Waz81uatwwqnokh2zu3vv3udNTjUfSm+D6GCGKAx8ZeHozJfiiOKDL5ljbBU
         E4gsLAYvh87XTk4ra4uuN5F+3/vw2zWIuU2sLmvjZf18G7GYSMPY0r/QTE7F3PHuVdnx
         2VUjGRF227jsX3adUIswGkCddS7bfys7y1VzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=4JGChkyT9yg17CJiQ62RUBn5YFLQPkb0ZVIdTMs6zXU=;
        b=SnWe8sRkSl7dB7+1uzCjSaMWp/agIDxf5uCGBaxGWoK5Kuwi9AfIVQMZ7NGLPe/w8j
         kSV90Q5YMYe9ZfToVr+GwfTqwRxPBYT67ken/96L6n5dUJL68wipDlt6mhK8LzeSejNN
         LM4CYUSIpJJVkgO/m9iYrFBleHQKcDB3c/52zT67f+Ig9NmO6MJj6htOGTDUETUVd/Hb
         bPpm2VX54rGotb7B2u2sGT9ogCCXxk9ugJGLxk2/W1P/qdLEEIFoBNru4VO8E+u7trhY
         XEb/Bdv176OZukBeV97V2Ws2IIjAZyU1WObd65d2UkU+NJHcrj1oztowehp/LYSRr6aE
         vKew==
X-Gm-Message-State: AGi0PuZcMFVAwlQbcx9uk1iHGvuH4BNlkOf4BnbgRgMT1pB13XFHnitL
        /TyLWuDnMtVH/LgfozlvRQRQhmsPVes=
X-Google-Smtp-Source: APiQypJ4zlwwvxPdiqsig/VgQf98Druqy5TnfF7i0/mOTf35b0M0YrHfm8EnQlOk6cFGlEd78c5QjQ==
X-Received: by 2002:a17:90a:c786:: with SMTP id gn6mr4348097pjb.147.1586932128456;
        Tue, 14 Apr 2020 23:28:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id ie14sm1174952pjb.34.2020.04.14.23.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:28:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200415062033.66406-1-swboyd@chromium.org>
References: <20200415062033.66406-1-swboyd@chromium.org>
Subject: Re: [PATCH] soc: qcom: cmd-db: Cast sizeof() to int to silence field width warning
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Tue, 14 Apr 2020 23:28:47 -0700
Message-ID: <158693212714.105027.8469414247721164540@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2020-04-14 23:20:33)
> We pass the result of sizeof() here to tell the printk format specifier
> how many bytes to print. That expects an int though and sizeof() isn't
> that type. Cast to int to silence this warning:
>=20
> drivers/soc/qcom/cmd-db.c: In function 'cmd_db_debugfs_dump':
> drivers/soc/qcom/cmd-db.c:281:30: warning: field width specifier '*' expe=
cts argument of type 'int', but argument 4 has type 'long unsigned int' [-W=
format=3D]
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Also

Fixes: d6815c5c43d4 ("soc: qcom: cmd-db: Add debugfs dumping file")

> ---
>  drivers/soc/qcom/cmd-db.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index 6c308f92a13c..6b5c440c9dc3 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -280,7 +280,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, =
void *p)
>                 ent =3D rsc_to_entry_header(rsc);
>                 for (j =3D 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
>                         seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent-=
>addr),
> -                                  sizeof(ent->id), ent->id);
> +                                  (int)sizeof(ent->id), ent->id);
> =20
>                         len =3D le16_to_cpu(ent->len);
>                         if (len) {
