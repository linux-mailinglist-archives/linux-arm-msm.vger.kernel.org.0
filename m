Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2540F69B783
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Feb 2023 02:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjBRBde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 20:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjBRBdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 20:33:33 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD985642EA
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 17:33:31 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id k13so2965966ljn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 17:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IuVW2CZdmVPPL009AhM1dwVCROCD9NP4LtUFzTmDF/g=;
        b=OnX+xtZpI/R679FSSSy+jfjkNnJLsFd2irLrXV+dz5h5CZh8sXN13ObBbkcvVmMZcL
         Zrv5pGM6QnwyZknxyWBCctLYigb9OAjB/YJZgGIyJy9le3RxS9jzyoGaekK6hfeDKYkY
         mYw1tykwVvZBrP6hOgRyU3DhAg+oOW38JIAdmIRXpoGmcnkGw27jSHkEpnZvuKc5Ff0E
         X0bwK+ypLLySUqQbiJ77HkianPFK5gf51ccLdMoAdrJzMvD1yWJmmO2rLVPDlzrTselH
         /Tlz6JroqBqLtn6uUkziKkqPkpY6T5KbqdGrrFVvPgYqD2lGfvKzdAHX0Jkr/h2NmOgb
         CVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IuVW2CZdmVPPL009AhM1dwVCROCD9NP4LtUFzTmDF/g=;
        b=0eAJ6HUk0SyQYXCrwA9yavU924zNqGYRKd+ozWef36cTeS/GY+iNcR9LFj5T2MR8+D
         Q4ClYDIAEvTIpVXpmWMd8zbx/gEKOekcRyQWWrUBuEGBkniUXKLw5HRFSHh6QUJF5FzE
         tXJeLGU/dfMGV3p6taKmGECnGLuhhOC+KgtRLbEmh3ALBWqUCiAmwk3akGMJHEDvUFoj
         Fal6WXz9Eq5dfycHZV6HSskxW84KJrqjt2LwSjpB+WSMydq3ySTAEOotZn9c1aT6Bw8c
         ov1egr8QXwmpR6p+GF6lwr7tXS/JP5XlfSTZH150Ef7MEWRMKXgeTF0N8a92nN1iyPfZ
         Hv9Q==
X-Gm-Message-State: AO0yUKXmIuekVRWoTqW0HwSED3LRIm+pfAw0kIDt/vysqsNen+z/kY5A
        P2qvMKKMyvk+r/6bHlk1gv5Br6jpJR78p6MM
X-Google-Smtp-Source: AK7set96NnuGQ4KE6QC/nqape/t3SOt9k4jE5QewYTOQk8GjgY5ongK+MfbVDH3OLXmTq2an8p+kYA==
X-Received: by 2002:a2e:9097:0:b0:293:50e7:3d07 with SMTP id l23-20020a2e9097000000b0029350e73d07mr563220ljg.14.1676684010134;
        Fri, 17 Feb 2023 17:33:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s3-20020a2e98c3000000b002934ea0def9sm736302ljj.140.2023.02.17.17.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 17:33:29 -0800 (PST)
Message-ID: <81448efc-5b77-5022-5b9f-3b5188509068@linaro.org>
Date:   Sat, 18 Feb 2023 03:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630
 laptop
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     ath10k@lists.infradead.org
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Kalle,

On 07/10/2022 15:22, Dmitry Baryshkov wrote:
> We'd like to ask for inclusion of the board file for the Lenovo Yoga
> C630 laptop. It is
> a WfA laptop using the Snapdragon SDM850 SoC.

I noticed that you've updated the WCN3990's board-2.bin, but this file 
was not included. Are there any issues with the submission?

> Following the questions from the ath10k wiki page:
> 
> * description for what hardware this is
> - It is an SDM845-based platform (SDM850)
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference: [    8.727834] ath10k_snoc 18800000.wifi: qmi
> chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> 
> * origin of the board file
>    - They come from the original Windows partition, thus being a part
> of Windows drivers.
> 
> * ids to be used with the board file
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
> 
> Note, the device comes with the board_id not changed from 0xff.
> Following the example of Chromebook boards we are adding the
> calibration variant.
> 
> * md5sum of each new board file to add
> 
> $ md5sum *
> 6cd260ad261193fb8b3ddf5293d0103f
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin
> 
> $ sha256sum *
> ff96e5295cc3e3fd86f04049058396cd69cd7f1bc44ef4784f13ffe48ef42a8d
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin

-- 
With best wishes
Dmitry

