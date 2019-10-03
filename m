Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21EBFCB241
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 01:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731221AbfJCXXD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 19:23:03 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39480 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfJCXXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 19:23:03 -0400
Received: by mail-pl1-f196.google.com with SMTP id s17so2227148plp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 16:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=TiQAIr9ujj+zBKHfm8KctaRq17mtsGT6UynXcmjKAZc=;
        b=WY4aT7DqS6IE6Gh2reTYnoeEJWe4VpS+j3vX3ix0BQe83t331uITUPgiKeEnabROhP
         Oxc+enz2CsjCq00kr0/IXVwvGVTMdOMfGbfWz0felSjYhJsh0CZJHP2y/C/Cp+kxomU5
         8scxJbiIK7o5xWZNYnTTsu4LSc71Ge3BRxvXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=TiQAIr9ujj+zBKHfm8KctaRq17mtsGT6UynXcmjKAZc=;
        b=c84BFcaSjM60/4Izy6hfIQlHuyEl6aj+WsgxNfVLqHS7ubqwhKBAVtwFYf6TThmFbE
         JMNKwqV0RHa45mupJoTC6fSAuxhKVKRvlnTtxvq6+B+sza0Anuu7YKpHTbuMahhNlmtp
         Uo3WI0f1Upvq4rQ7IMovJZgNPsePm8/P1ECP0w0R4culXhbHHqx/wUJZTWEYtYJ8AoGk
         TXK1O9BctK84ZqJjGSbiK85X6VamYu5yBR8AdpG4CUn4pCayP4tZDS8GQO90Hi5a61GJ
         0J8/kTKldXwW5O9hun82pd959ew7Y5cvZ8Y54sqSRxWwM/y1lDrD2I2+mYpjJJvg8z7n
         eATA==
X-Gm-Message-State: APjAAAUtzRipi6e7tpFmrl+5RwyHHF7+YXOR5i5cf2rT1Md7uvExtSV5
        vrxnorM2GjLmkBD6/Xo3CPFm9g==
X-Google-Smtp-Source: APXvYqwa8ClrHoSx3+ILUpKWaD9UmZCA+Ooz3j2P/NN8Tj5I9zGlyJEhqu7+JzCyCf/0ukStyC030A==
X-Received: by 2002:a17:902:b909:: with SMTP id bf9mr12302497plb.60.1570144981888;
        Thu, 03 Oct 2019 16:23:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z21sm3847587pfa.119.2019.10.03.16.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 16:23:01 -0700 (PDT)
Message-ID: <5d9682d5.1c69fb81.4efda.d786@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
References: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Murali Nalajala <mnalajal@codeaurora.org>,
        gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     mnalajal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] base: soc: Handle custom soc information sysfs entries
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 16:22:59 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Murali Nalajala (2019-10-02 17:06:14)
> @@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
>  struct soc_device *soc_device_register(struct soc_device_attribute *soc_=
dev_attr)
>  {
>         struct soc_device *soc_dev;
> +       const struct attribute_group **soc_attr_groups =3D NULL;

Don't initialize this to NULL because it is only tested after it's been
unconditionally assigned to the result of the allocation.

>         int ret;
> =20
>         if (!soc_bus_type.p) {
> @@ -136,10 +134,20 @@ struct soc_device *soc_device_register(struct soc_d=
evice_attribute *soc_dev_attr
>                 goto out1;
>         }
> =20
> +       soc_attr_groups =3D kzalloc(sizeof(*soc_attr_groups) *

Please use kcalloc() instead and drop the define for NUM_ATTR_GROUPS
because it's used once.

> +                                               NUM_ATTR_GROUPS, GFP_KERN=
EL);
> +       if (!soc_attr_groups) {
> +               ret =3D -ENOMEM;
> +               goto out2;
> +       }
> +       soc_attr_groups[0] =3D &soc_attr_group;
> +       soc_attr_groups[1] =3D soc_dev_attr->custom_attr_group;
> +       soc_attr_groups[2] =3D NULL;

Drop this assignment to NULL because kzalloc() and kcalloc() zero out
the memory anyway.

