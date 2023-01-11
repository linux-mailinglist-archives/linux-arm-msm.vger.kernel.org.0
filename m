Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EEB666174
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 18:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbjAKRLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 12:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbjAKRKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 12:10:55 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7508AB6F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 09:10:50 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so20718602pjk.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wbn0wOToWYz8Hqus0qOCdl65fCabjHuCUD8bFfQCj64=;
        b=PfTiVUep3xEEXd1CwcCgWM/skOcA1SOl2c2pnoewwiTXqAFMRGYHEl3tAboy/P89Sx
         hesN2lBOF8VTEH1Qp04k02SidAjeJqkEOnIdXRBOxY48WBLosMNAJFvvum8BhHb7e1CR
         zVf+o46D6GdR5hmPJEV50J31C38Ei+Sfa3W6CkKm19IakoKwdFz00D4Xz59YhYvmM8DR
         0hnmQK79ppN6iRtRvzIHPNacgW//0PM9q0amW3hax1NyiAEG3XZ4J/8oVlG6Dli1Extt
         zAj40+jCRt9lbx4zbAELmflze88AdQgaPX3RLOW67JGhc24wPdAYagNZ815W6G1ltHnN
         UpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbn0wOToWYz8Hqus0qOCdl65fCabjHuCUD8bFfQCj64=;
        b=mnYX5cJgf8hmArZbBN/Gq2Ue3AuOyNH9JCzixpGAG2m9aAbPUkk867dJUD617KgHQ8
         1Frz1BtZzD3zlZpPMkxdaZ7/BAfgXE54vTitRmffNaHRhoiBfkbubhAC6uwQBIfEh7/r
         DYRPvV+t+8MTfVPTSoUjt3++O6s3OSDt4PX9w/ceNww3pZvPDsX9hlugTCtlmNl61tmo
         WcyGJpH0EJDlrnA1hBFCzY7sXeMyHbjXj1xn+IndKTSa+/wvupu0wyDuywwg2lgaCgYZ
         mAw/Qon6qwlRmKmLbiFmVLWDcHBYjtKavVfo1uZ0LSH0K/jdzKBNQQhJLIQkXOJmir6O
         24mw==
X-Gm-Message-State: AFqh2kqMafm+wBTC5Y0qYHn4KqBH26Y9T68Mqc5R+SHrmqI2cvt98WUF
        2gdELmF44ztOrnT9IgihpJab/O+wWv1ExRtD24D83Q==
X-Google-Smtp-Source: AMrXdXuyLrj3KOt2zYA3aATYluNcRvTg5OCBMB3qKOVlm/93ZiJeMguzrue9ZVjvaNF+I7+L+/kGDr2M31vnIlaQdGE=
X-Received: by 2002:a17:902:8643:b0:192:ca49:4c50 with SMTP id
 y3-20020a170902864300b00192ca494c50mr2809774plt.36.1673457049979; Wed, 11 Jan
 2023 09:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org> <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
 <87358hyp3x.fsf@kernel.org>
In-Reply-To: <87358hyp3x.fsf@kernel.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 11 Jan 2023 18:10:38 +0100
Message-ID: <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
To:     Kalle Valo <kvalo@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Robert Marko <robimarko@gmail.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        gregkh@linuxfoundation.org, elder@linaro.org,
        hemantk@codeaurora.org, quic_jhugo@quicinc.com,
        quic_qianyu@quicinc.com, bbhatt@codeaurora.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> >> Really sorry, I just didn't manage to get this finalised due to other
> >> stuff and now I'm leaving for a two week vacation :(
> >
> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
> > and the current workaround for supporting AHB + PCI or multiple PCI
> > cards is breaking cards like QCA6390 which are obviously really
> > popular.
>
> Sorry, came back only on Monday and trying to catch up slowly. But I
> submitted the RFC now:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/

Great, thanks for that.

Does it depend on firmware-2 being available?

Regards,
Robert
>
> Please take a look and let me know what you think.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
