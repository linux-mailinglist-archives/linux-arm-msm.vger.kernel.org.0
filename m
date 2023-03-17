Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F406BE8A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 12:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjCQLzS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 07:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjCQLzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 07:55:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8855FB4838
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 04:55:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3AB66B82560
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 11:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B01C433D2;
        Fri, 17 Mar 2023 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679054109;
        bh=SQCpgmtlDWwq4EMyAtfzVpB1i3CTS6xAgAoHg9gdmLo=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=bhsMPTno3YC4fmytecKIJS+5uD2jP9gWLkpCjbFpnQuaSDsNEZRcpbeouC1kjvUnI
         dFkp5R6YNIhu7Ktfa73m7EpIlLgzrrnrOrt1en3Sq6sFbvuSHnks7ATfyr2vKi9MrC
         iE+DdNNolybrR0+J6j7+EdoG7qkPX/S9+DF8aGaQSIr1uyyaqzVn4NeRkRnJKkxORx
         clNQn6CW7CPz1LqMou7H5m0EPIl9ddIqnPtEIPdvP2r8uHpEYFCvydnhS/dtDCxebI
         gTxqYuHXJLXyJbwOkZ+XmeWWk0hcdUHgORSCNHTpA1+LDkgz3JCjeuNdQXBt3bZywF
         Kfa2auWZFV2Xw==
From:   Kalle Valo <kvalo@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ath10k@lists.infradead.org,
        "open list\:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
Date:   Fri, 17 Mar 2023 13:55:07 +0200
In-Reply-To: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
        (Dmitry Baryshkov's message of "Fri, 7 Oct 2022 15:22:02 +0300")
Message-ID: <87o7oriodg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> We'd like to ask for inclusion of the board file for the Lenovo Yoga
> C630 laptop. It is
> a WfA laptop using the Snapdragon SDM850 SoC.
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
> - It is an SDM845-based platform (SDM850)
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference: [    8.727834] ath10k_snoc 18800000.wifi: qmi
> chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
>
> * origin of the board file
>   - They come from the original Windows partition, thus being a part
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

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 21 in total

https://github.com/kvalo/ath10k-firmware/commit/8aa55df10c78598c8eef4a6de957474c8802ced8

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
