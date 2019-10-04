Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E745CB437
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 07:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730420AbfJDFiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 01:38:20 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45074 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbfJDFiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 01:38:20 -0400
Received: by mail-pg1-f193.google.com with SMTP id q7so3075972pgi.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 22:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=SQfRKBgFCS7Kr+5S+BnplfeUt3NczTKM6BoWv0zOCcI=;
        b=O9PJIu0GICr7g7nea8KAKuJrmqEE17mZUBrdxBF8OJO2BKa3wTGDLRui9pr8RcSIks
         HE1Hh5HPbPxvISJcEvGh6WrG9I0RYsNBa1ExeclxjzokVpuzzkIoAjOaQ1zimnuI61eh
         3SmGZvEeeTeINWh7Wb52qDupyKkBWLdnxgutE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=SQfRKBgFCS7Kr+5S+BnplfeUt3NczTKM6BoWv0zOCcI=;
        b=OgU/dYP0enNhks/N9bTQRFrzcUU7ZD3aui3+S5ysjdt3EdpKc+NpZD193OyxqgX2Rm
         jy1fCpqhE7zy1+QV2RohX+kLD1VRiJ3A+9tS6X2qPnHIzzKXGTpU6dskNPK+ZR9/b5+t
         weMQgCuucQkU7CdMYt2cfa6Q/pGMw7ShVqO+2td+9MJW1bYUSVsSFCN9ZCJD5rt2si0k
         nL+0rg9EkF3g/JtV7oQ30SGuTXtk6cs92ySASyNDIgXRmljs4P7z348JFv8n7Cj0kIrQ
         uHgPYlnZRt8PF6nOv7exfJflZtIcnyHcSFfYr8iOt2eYaSSanleLVp4NC187VdLtrs6e
         UT5A==
X-Gm-Message-State: APjAAAWckBBYP3yYEU89XWcf035mSU8+cjyx2TrQhtBiX8j1It2kAqbL
        nLxEhBKOnq3eHALJqNQgASdS3g==
X-Google-Smtp-Source: APXvYqy6BwElSHd5ZVhMCLTrRU1VdGZdH6l+QcctDAUDE3FsXUNCPW3wO1iPMNQXVDf1sd8qpCPHkg==
X-Received: by 2002:aa7:81cb:: with SMTP id c11mr15100061pfn.251.1570167499217;
        Thu, 03 Oct 2019 22:38:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g6sm4250083pgk.64.2019.10.03.22.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 22:38:18 -0700 (PDT)
Message-ID: <5d96daca.1c69fb81.fe5e4.e623@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1570146710-13503-1-git-send-email-mnalajal@codeaurora.org>
References: <1570146710-13503-1-git-send-email-mnalajal@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Murali Nalajala <mnalajal@codeaurora.org>,
        gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     mnalajal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v1] base: soc: Handle custom soc information sysfs entries
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 22:38:17 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Murali Nalajala (2019-10-03 16:51:50)
> @@ -151,14 +156,16 @@ struct soc_device *soc_device_register(struct soc_d=
evice_attribute *soc_dev_attr
> =20
>         ret =3D device_register(&soc_dev->dev);
>         if (ret)
> -               goto out3;
> +               goto out4;
> =20
>         return soc_dev;
> =20
> -out3:
> +out4:
>         ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
>         put_device(&soc_dev->dev);
>         soc_dev =3D NULL;
> +out3:
> +       kfree(soc_attr_groups);

This code is tricky. put_device(&soc_dev->dev) will call soc_release()
so we set soc_dev to NULL before calling kfree() on the error path. This
way we don't doubly free a pointer that the release function will take
care of. I wonder if the release function could free the ida as well,
and then we could just make the device_register() failure path call
put_device() and return ERR_PTR(ret) directly. Then the error path is
simpler because we can avoid changing two pointers to NULL to avoid the
double free twice. Or just inline the ida remove and put_device() call
in the if and then goto out1 to consolidate the error pointer
conversion.

>  out2:
>         kfree(soc_dev);
>  out1:
