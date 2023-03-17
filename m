Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15566BE8AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 12:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjCQL4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 07:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjCQL4S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 07:56:18 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8192AA9082
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 04:56:14 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-54184571389so89573977b3.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679054173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb5o9NMW97WH6ZSWEBSm+p2LactDwm89gAf2F/3Y6l0=;
        b=vv3J8HWXGxNXIOL3WzPjbKwZqvxe4NB/4PAv486r+Z+WVbQ7skCEcqS7BbTtgZ1bVe
         Vp2Rftz06dO0Ze/MsFeH1Ejvpg6dMUxeaDzbDzKTilV1wwl81zh1UjXkf5DO3wv7/Z2H
         A986bIiCkIw9lTMoMuLyxvRzIr+OSagLvYEGl5UwOxQ6dABimZWz7yWzEFZP5GqXAI0w
         Zv0pI8JH8WSCVFy4X5j7ul+GRxoyGhU338vOdK7eKs9YrPX/uB9JJkmdimiTZIR8o85C
         GAdw/hk87fYZPREG4g5xewXyCFLpZeOhYBjU1vx8vH7ziZsQYOp134ohPf0sPLz0GeZu
         W+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb5o9NMW97WH6ZSWEBSm+p2LactDwm89gAf2F/3Y6l0=;
        b=X0X6LXopkrQ/3gE1aKxoOzHEw6GilawnY3gOjKwLC2WvJ7bjb90FP7njwfAVjoIuXd
         mV0JTejP4sQlBILNJ254pt5dqrzD3UOsePqdEx4VuEJMhLswJTzSa7XdOQz9mVDphym6
         GqTAduFs6I8Qyu+moxobtX41MU8Y5yEjtvbLwSf5fvVmXVVnDG1mtyfahFa+v7Ul71vI
         S4PRBXyUNWlJZcMVaWixm0rnem4JvZBV8BWq8Qiyv4Ge3suf8C9s/P++E4MO/Bi5Orbl
         Se53a9XHJ61OFbKFyVl7ur0o/0C9f5FEKEnoSUPUqP+n63IUXHlUzN/AebFKJYuqxznw
         OCiw==
X-Gm-Message-State: AO0yUKUSKoIm4hCUzunXu8EE3c4PDjh/aRxzr9NlMEqF8iAmeyikyPtJ
        ei0YQNr57D6plqTgeon+UD7ZdPJGnGfu//MhDvQjCOsLgxUzm+iGPgkmhg==
X-Google-Smtp-Source: AK7set+tGSkTdboyNwnrvxQQd8kS2YmSjSvmZUF6A7AiTYWRbx3oGzg+DuJTelC014W0zlAGiZ7ChE7WRqPYcCKcME4=
X-Received: by 2002:a81:d84d:0:b0:543:9065:b225 with SMTP id
 n13-20020a81d84d000000b005439065b225mr4618691ywl.5.1679054173616; Fri, 17 Mar
 2023 04:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
 <87o7oriodg.fsf@kernel.org>
In-Reply-To: <87o7oriodg.fsf@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 17 Mar 2023 13:56:02 +0200
Message-ID: <CAA8EJprAsKeQdX=6f-E9=xjfbT_Wf5h6-97Rb5Vcy2jBTVzY0Q@mail.gmail.com>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
To:     Kalle Valo <kvalo@kernel.org>
Cc:     ath10k@lists.infradead.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Mar 2023 at 13:55, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > We'd like to ask for inclusion of the board file for the Lenovo Yoga
> > C630 laptop. It is
> > a WfA laptop using the Snapdragon SDM850 SoC.
> > Following the questions from the ath10k wiki page:
> >
> > * description for what hardware this is
> > - It is an SDM845-based platform (SDM850)
> > - It uses wcn3990 chip as a WiFi and BT radio
> > - For the reference: [    8.727834] ath10k_snoc 18800000.wifi: qmi
> > chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> >
> > * origin of the board file
> >   - They come from the original Windows partition, thus being a part
> > of Windows drivers.
> >
> > * ids to be used with the board file
> > bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
> >
> > Note, the device comes with the board_id not changed from 0xff.
> > Following the example of Chromebook boards we are adding the
> > calibration variant.
> >
> > * md5sum of each new board file to add
> >
> > $ md5sum *
> > 6cd260ad261193fb8b3ddf5293d0103f
> > bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin
> >
> > $ sha256sum *
> > ff96e5295cc3e3fd86f04049058396cd69cd7f1bc44ef4784f13ffe48ef42a8d
> > bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin
>
> Thanks, added to WCN3990/hw1.0/board-2.bin:

Thank you!

>
> New:
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
>
> Changed:
>
>
> Deleted:
>
> 1 board image(s) added, 0 changed, 0 deleted, 21 in total
>
> https://github.com/kvalo/ath10k-firmware/commit/8aa55df10c78598c8eef4a6de957474c8802ced8
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



-- 
With best wishes
Dmitry
