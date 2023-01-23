Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2EF367862A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 20:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjAWTVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 14:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjAWTVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 14:21:22 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3842FE3B8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 11:21:20 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id b12so9756025pgj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 11:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WDXuP5MYYXAbh/GyrwzOk8WyuxyPQCqxZw3q4s3iD6c=;
        b=tkgcEhOicbtfDwCpvIXKnd8G/FRlL5uYYpKH27sdSg0dZinBGyNI6cfbqXcMQ0INuI
         C1vXl3B5WfROQHaBB0ZgIO3DsbL8TTj4olwIR8Ff8qa9Mwt6nTxLZAT5FaJB+xs56xnK
         kVn6WRm+zPNaXAoPyvmPoZJesLk00cfksfuo5LjkfIVGYLZXHeQDXVgDWba83T0JDL9f
         paDtjpJa/3TzNyFo77rj/ulC4nTXdGJQ6eubkNb35Z8FDePEJYd6WRLBU0HwgDwNbOgu
         HaDZQhhPOShpXz4hg0RNu6HNR4i95FnsPr2qF0ogzCM5h0eEPZ1xul/uaFP/kdBaUX5+
         YTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDXuP5MYYXAbh/GyrwzOk8WyuxyPQCqxZw3q4s3iD6c=;
        b=nuOtPEjuJX4hP3GI7Pn5ygHsdQp6SJMsK2lou5wCkugcLHYyS7bVFn2gyuDF65ChN0
         HcntkGAnN6b6EBnGLdqmZBa7Omp0TTLRd8jP6w6COZd2BfeB8Z5papLwgxm6Sa782z9m
         QzJGYRsUVh1ufF2heS5JQOwGW1jrDlFUzY2BaGN9VDOEyHTJKRC0X1ZvPZgFP81Xjxu5
         sqNpcwPZ6KAIHmBS4TKvKrR0Aajj7M+9qBWHPS2XjLituc0bjHJ/vSaMiikWFdYozPtQ
         6k2CQP9mRUvTwMENb77P0w09eEI55RlMG/ji0HACs2P/Btt4tNMwyes6Nbrvxb47CeGB
         haRw==
X-Gm-Message-State: AFqh2kqRqZniRvRb1SOgk4V2c00eToHZ53I9Un/nH53zM+ZGMfFjQvKu
        Geo702/YQ82KjzSHJxENw498DT58PKUTBzV2p008nQ==
X-Google-Smtp-Source: AMrXdXuuuKT2bxKJ14LORsl1MPDgTLtc1xr4HHO60shSDgnHFBxnsV//IpkEZxYIMzwOctILURRm6BLFnwBEv1J5vyc=
X-Received: by 2002:a63:a5e:0:b0:4b4:e491:c331 with SMTP id
 z30-20020a630a5e000000b004b4e491c331mr654902pgk.19.1674501679691; Mon, 23 Jan
 2023 11:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org> <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
 <87358hyp3x.fsf@kernel.org> <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
 <877cxsdrax.fsf@kernel.org> <CA+HBbNGbg88_3FDu+EZhqMj0UKb8Ja_vyYsxGtmJ_HGt4fNVBQ@mail.gmail.com>
 <87y1q8ccc4.fsf@kernel.org>
In-Reply-To: <87y1q8ccc4.fsf@kernel.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 23 Jan 2023 20:21:08 +0100
Message-ID: <CA+HBbNH2fzr_knOE9EWD4bUi-guvRa07FAxc9WyCH0jK10BLvw@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 12, 2023 at 10:49 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> > On Thu, Jan 12, 2023 at 10:40 AM Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Robert Marko <robert.marko@sartura.hr> writes:
> >>
> >> > On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
> >> >>
> >> >> Robert Marko <robert.marko@sartura.hr> writes:
> >> >>
> >> >> >> Really sorry, I just didn't manage to get this finalised due to other
> >> >> >> stuff and now I'm leaving for a two week vacation :(
> >> >> >
> >> >> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
> >> >> > and the current workaround for supporting AHB + PCI or multiple PCI
> >> >> > cards is breaking cards like QCA6390 which are obviously really
> >> >> > popular.
> >> >>
> >> >> Sorry, came back only on Monday and trying to catch up slowly. But I
> >> >> submitted the RFC now:
> >> >>
> >> >> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
> >> >
> >> > Great, thanks for that.
> >> >
> >> > Does it depend on firmware-2 being available?
> >>
> >> The final solution for the users will require firmware-2.bin. But for a
> >> quick test you can omit the feature bit test by replacing
> >> "test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" with
> >> "true". Just make sure that the firmware release you are using supports
> >> this feature, I believe only recent QCN9074 releases do that.
> >
> > I was able to test on IPQ8074+QCN9074 yesterday by just bypassing the
> > test and it worked.
> >
> > Sideffect is that until firmware-2.bin is available cards like QCA6390
> > wont work like with my hack.
>
> Not following here, can you elaborate what won't work with QCA6390?


Our downstream hack does not work with QCA6390, so that is why its quite
important for OpenWrt to have a generic solution that works on all cards.

Regards,
Robert
>
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
