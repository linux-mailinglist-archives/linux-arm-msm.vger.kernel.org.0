Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1F534D8DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 22:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhC2UJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 16:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhC2UJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 16:09:35 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8FFC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 13:09:35 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h25so10147900pgm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 13:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Iy90H+4nmGRZh69/cuBoLTgrfWmHOCln5PyIFtnQ2/0=;
        b=SiUmb69ugIMVdsK+/7Ow+hKzUf7ZfrtTKAEvMYfY+cpN5jBYq/n1XrSgBdfqUtoO5t
         qdKyUtJHA+xh+0JhcQKgDRPlTqOMA3pSw/kGV07xj5PFRivzB2KPT/P9ekgHJ7moXw9q
         WV5of9beWP7U5FBhs6KVhbEpVJF0bgM2qwR6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Iy90H+4nmGRZh69/cuBoLTgrfWmHOCln5PyIFtnQ2/0=;
        b=m6zcY37Uk5PTcRANu1ZBON14nl9rGupJmVyxzgbUMYk8gyaDYr/ZIMoSrz+gr3AnnZ
         9KAnAjkTcF0gIDR9f63Jnb/ubT+8cuM9SEZKlVl0hKZ8On1SanMLZgCN0iAO2jnp4tWS
         cJk8RjEIU3JcfFxKJxZWGlv9NYOVXkCaBK8OP0cBfmnJYrZlRRtHcnKlLG/KuPznn7By
         b+rAajlqDNgClZQnAzIX1+ytS64w62NvW0iKjXLlsRePxzgtLdyvXEyT49ESi1hR6m6r
         ZPK1HSuyu5GR/NOr2L6iGvmoiFRMi7IXO0E8SOtmTpQ8c3y3Wj5TdyaWIfdMj6ijzfNP
         Rt8w==
X-Gm-Message-State: AOAM532wYXHdAfioYBvDGjIxPEvFH+0sj4qOGnOs1ZJVtH5H2cLyhpr5
        SX5bawm6/aX+Rzs0Fi5fd9FUIg==
X-Google-Smtp-Source: ABdhPJzcN9RMODHe8byZALIgMDw61p/BLnwTKQQkqfoP+YVO/t/ieO/7kvyL1kmlboOfH95p5IqgpQ==
X-Received: by 2002:a63:4e48:: with SMTP id o8mr25316541pgl.420.1617048574853;
        Mon, 29 Mar 2021 13:09:34 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
        by smtp.gmail.com with ESMTPSA id z2sm18182420pfq.198.2021.03.29.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 13:09:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eeb3cfe92cba2c7981170f3c3ff96dd440b69f25.1616651305.git.schowdhu@codeaurora.org>
References: <cover.1616651305.git.schowdhu@codeaurora.org> <eeb3cfe92cba2c7981170f3c3ff96dd440b69f25.1616651305.git.schowdhu@codeaurora.org>
Subject: Re: [PATCH V2 3/5] DCC: Added the sysfs entries for DCC(Data Capture and Compare) driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Date:   Mon, 29 Mar 2021 13:09:33 -0700
Message-ID: <161704857307.3012082.499264834486221320@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Souradeep Chowdhury (2021-03-25 01:02:34)
> The DCC is a DMA engine designed to store register values either in
> case of a system crash or in case of software triggers manually done
> by the user.Using DCC hardware and the sysfs interface of the driver
> the user can exploit various functionalities of DCC.The user can specify
> the register addresses,the values of which is stored by DCC in it's
> dedicated SRAM.The register addresses can be used either to read from,
> write to,first read and store value and then write or to loop.All these
> options can be exploited using the sysfs interface given to the user.
> Following are the sysfs interfaces exposed in DCC driver which are
> documented
> 1)trigger
> 2)config
> 3)config_write
> 4)config_reset
> 5)enable
> 6)rd_mod_wr
> 7)loop
>=20
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  Documentation/ABI/testing/sysfs-driver-dcc | 114 +++++++++++++++++++++++=
++++++

Please combine this with the driver patch.

>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc

Perhaps this should be an ioctl interface instead of a sysfs interface?

>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-dcc b/Documentation/A=
BI/testing/sysfs-driver-dcc
> new file mode 100644
> index 0000000..05d24f0
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dcc
> @@ -0,0 +1,114 @@
> +What:           /sys/bus/platform/devices/.../trigger
> +Date:           March 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +               This is the sysfs interface for manual software
> +               triggers.The user can simply enter a 1 against
> +               the sysfs file and enable a manual trigger.
> +               Example:
> +               echo  1 > /sys/bus/platform/devices/.../trigger
> +
> +What:           /sys/bus/platform/devices/.../enable
> +Date:           March 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +               This sysfs interface is used for enabling the
> +               the dcc hardware.Without this being set to 1,

Space after period please.

> +               the dcc hardware ceases to function.
> +               Example:
> +               echo  0 > /sys/bus/platform/devices/.../enable
> +               (disable interface)
> +               echo  1 > /sys/bus/platform/devices/.../enable
> +               (enable interface)
> +
> +What:           /sys/bus/platform/devices/.../config
> +Date:           March 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +               This is the most commonly used sysfs interface
> +               file and this basically stores the addresses of
> +               the registers which needs to be read in case of
> +               a hardware crash or manual software triggers.
> +               Example:
> +               echo  0x80000010 10 > /sys/bus/platform/devices/../config
> +               This specifies that 10 words starting from address
> +               0x80000010 is to be read.In case there are no words to be
> +               specified we can simply enter the address.
> +
> +What:           /sys/bus/platform/devices/.../config_write
> +Date:           March 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +               This file allows user to write a value to the register
> +               address given as argument.The values are entered in the
> +               form of <register_address> <value>.The reason for this
> +               feature of dcc is that for accessing certain registers
> +               it is necessary to set some bits of soe other register.

s/soe/some/?

> +               That is achievable by giving DCC this privelege.

s/privelege/privilege/

> +               Example:
> +               echo 0x80000000 0xFF > /sys/bus/platform/devices/.../conf=
ig_write
> +
> +What:           /sys/bus/platform/devices/.../config_reset
> +Date:           March 2021
> +Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
> +Description:
> +               This file is used to reset the configuration of
> +               a dcc driver to the default configuration.
> +               Example:
> +               echo  1 > /sys/bus/platform/devices/.../config_reset
> +
