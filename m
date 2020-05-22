Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EF81DE38C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 11:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgEVJyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 05:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbgEVJyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 05:54:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FFDC061A0E;
        Fri, 22 May 2020 02:54:50 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v16so11913291ljc.8;
        Fri, 22 May 2020 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=XzN7vQSAeKD/eMd3BXZFqaFdo1S/tdrEDVtMr2FGnLU=;
        b=Og7+X8GsBOfeJA3VJxO9QrF+eNA1WImqglo1OAStxYRp8TU5PGXrQmNtGmN0qlyp34
         RaxDZmB5YkfLP3SlmIT6TNWFSnle76nSJBo4/fwN8LgyJXBjkfPFCieho97KHlfsf1iM
         mdbPjltolPJBj6iROxZsLe7NtGT37gpt6jsIgbGVYgonW2hN1Wy3V9EuZaU2iQ61t0lo
         OAvVy7v3ekVESgM1gcZZ/fglsARr2nC4a5Qni0+5BI467TUO23O0cxWPCNgOWO0VBEH+
         uOzLY+dAnO5mKK8l2wQ32FuDjQrLZXbLh9J311jODurfsqOzjMrSQ3yWJxZzRW38uoP2
         5+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=XzN7vQSAeKD/eMd3BXZFqaFdo1S/tdrEDVtMr2FGnLU=;
        b=O0C/8HTIl5JXNT4S5KnIgKZafH3qzuFh4Yw8+2VJ5h9TUmnF/czN8zQfIWtKBfNpF2
         H3Dk3AU8PXgGj7daazYcbyIFkmnCiRL2LySj15FyK9qYbvuvO9E463GKS6WTYy+Wrb8l
         G2yiuoCYzDEgt/JWEJPorbVzOrnxotgMVtQ+m6CuoXqxApW1E4wQ+wTfEW8ChHkiNbyb
         wdOcUOT5ujAg3mn+8Yj3Zm3vtfqkqerDrCAVWNhpIKPDg4wNxIgpgOb17W9yp8XdWWb5
         +Oms7UTD2eYIEwucn22qlfDY0sO1unqPGf4IgBNSrnijQvUd1vqlWwt86iJsgVgg9SQ/
         NhwQ==
X-Gm-Message-State: AOAM530OO+KeFxgd0dXHumim5mLGsEBbIRe1GFRB9x4jvCjgOmsdTWbZ
        6N0zbo8Mwyt4g7LPP6zvuOs=
X-Google-Smtp-Source: ABdhPJxls6sqBFx9as0rTD7ea7wRBsOpMahmM8dx899ivTV953sT8LrHdqpRnsVfBCHXJSWevqBg9Q==
X-Received: by 2002:a2e:980d:: with SMTP id a13mr7372013ljj.277.1590141288728;
        Fri, 22 May 2020 02:54:48 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id o23sm2655294lfg.0.2020.05.22.02.54.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 02:54:47 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Re-introduce TX FIFO resize for larger EP bursting
In-Reply-To: <1590050169-30747-1-git-send-email-wcheng@codeaurora.org>
References: <1590050169-30747-1-git-send-email-wcheng@codeaurora.org>
Date:   Fri, 22 May 2020 12:54:25 +0300
Message-ID: <87o8qgwazy.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Wesley Cheng <wcheng@codeaurora.org> writes:

> Changes in V2:
>  - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>    FIFO.
>  - Removed dev_dbg() prints and fixed typos from patches
>  - Added some more description on the dt-bindings commit message
>
> Reviewed-by: Felipe Balbi <balbi@kernel.org>

I don't remember giving you a Reviewed-by, did I?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7HoVEACgkQzL64meEa
mQZY/hAAobcsEW4IFsU2bxTrcCRnV6RQNz20bIfxZRKcyKquzoBrV66YyGxsyE+t
egAiLviJmCxwGdOzOSdHETrrG6HequyOGzwoux/HrGre/OCJqmrh6WnJPunPIqg3
hzYN9Jos3yFDZUUi8KPoYeS88Ke//VKXXKEwKdAyKFrB1BO2+elWtfMexyDluxlk
oZggbGmDVlenHL2/IUrxs6EvkL1ry1ogAa5U97hwwAJApJhjqKDTswoJJvvnm+e5
01pkLPgvD+GWOHKV+zMQ5CnjVc+cVtpTqcQJ3FY+7cbkHgzOcnb2ANgn0gygK68w
ljUf0kopym3Y3uAuEnRzIUdrLZMjwiDepXQb2Q1hoC6sS0ptO3Qso1SFRwGsCiNR
9ocFjCios7dA8obaELDLXMwS3B0dfMW7HR2SFgeVQ9btB00ZYNMyAqE0yMcnhdHv
Er+5fCcHy9ObwYoXbhI30eA64rn1+KBpyJo1UMh1XLoo3Z3ON/nuI/ozaBs7xexb
4OPsf5E4CnkPSSqBpHG1ukGU7uHyEla/lwKCIBteb0iuX2LO+kn5G3tkcd0vBrua
ceZmOk7UDMcYFN8jGNpitKqtrCuhiMn1UpGqdEySJYh40hI92lkAv3/brvouU8Pz
C5R4GNwFrHqYHozr+39cQAX7BKDKoJ7hvzAjIllw4t2Lzum6OEc=
=pWoV
-----END PGP SIGNATURE-----
--=-=-=--
