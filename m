Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F0964C8AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 13:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbiLNMEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 07:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237754AbiLNME1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 07:04:27 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A158E27DC4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 04:02:54 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id 130so4267509pfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=peaw+2jBoexT/V/OL/klaMSfRkpK0w1QubB8hlHtjKU=;
        b=IffZpvmos6IFA8F2Mu7UX03vFoZdzSvAl4wArexI2TJ+mCg8LYPObJ0caqqBk6KELc
         7e96IX0TGhm3EbfxrnJUHspRY4C5kzZjXA8RPZhE2bOdCe6tjVnt+Z3CF0kf/nY0nL+5
         zhLxH/gVF/oPszrMxuCbjkfNqT6s3OZYE50HYnrLZ7oMjvbFnJ2FU0kVIkcZhH46wiwl
         wLPAdUYt+VKJPhUoSBgt566qcUxTJYhAUxZrXrKHxPKFY8264tYoNHL+XtQdD6DjNdwK
         dtgAPPBovln+d78d738YPXAKKoU4rCSJQNQzmoESEN0DTVhkyEgeq7ajtPDj3m1qgn+h
         UaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peaw+2jBoexT/V/OL/klaMSfRkpK0w1QubB8hlHtjKU=;
        b=8RhTnQ84Y6KCTddwo3H8N3pEhNAW/lZYuq7Dw1Pz88TsSMNwKlLmB6J0xWnz6YAWvj
         9IIzXOR2ptk6o+AZYLs0yBpFcKoNlDMnO9BqY+S76R8fRIJN2v50Qs1dxavWy+X4vNUA
         Ybl59mgA02KMhj0bC8r5vvvpjon74JtZ4H7iVefRvTXUQWrRGBdKQtMRxsI/VZ5a2x86
         qv4ZmElIPm5aM4CzFm+gi8jNIlVZJiYYbrTDqSI98y9JKrDNBeaep/j/BKNAriRxsE9a
         UvKphpSzof/9lSHqyeO9592SOR3TXwfBWOXvKJ/AJ/8ZWW6qPQLILhpkgPDU8ROoQkvj
         8sWQ==
X-Gm-Message-State: ANoB5pkcupaVEIKUBhCIgKvNAjYij22e5J9QPhSzCUWHCeTSIubdfWce
        08yuGNqq7Zj2nSPciPOfrzkEFgKwecuiOvNxvEsSBw==
X-Google-Smtp-Source: AA0mqf6ACT1hXHaNkKcTvIqqDuxXiD+Qw3prO4hyGi38uOl9IwijS+lvf8GiQLNL3EwGrPbufcxLrNNbvCYdwt6fqnk=
X-Received: by 2002:a62:8409:0:b0:575:1168:a970 with SMTP id
 k9-20020a628409000000b005751168a970mr54638196pfd.54.1671019373770; Wed, 14
 Dec 2022 04:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org> <877czn8c2n.fsf@kernel.org>
In-Reply-To: <877czn8c2n.fsf@kernel.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 14 Dec 2022 13:02:42 +0100
Message-ID: <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
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

On Tue, Nov 22, 2022 at 12:26 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Kalle Valo <kvalo@kernel.org> writes:
>
> > Manivannan Sadhasivam <mani@kernel.org> writes:
> >
> >> On Sat, Nov 05, 2022 at 08:49:43PM +0100, Robert Marko wrote:
> >>> Currently, trying to use AHB + PCI/MHI cards or multiple PCI/MHI cards
> >>> will cause a clash in the QRTR instance node ID and prevent the driver
> >>> from talking via QMI to the card and thus initializing it with:
> >>> [    9.836329] ath11k c000000.wifi: host capability request failed: 1 90
> >>> [    9.842047] ath11k c000000.wifi: failed to send qmi host cap: -22
> >>>
> >>
> >> There is still an outstanding issue where you cannot connect two WLAN modules
> >> with same node id.
> >>
> >>> So, in order to allow for this combination of cards, especially AHB + PCI
> >>> cards like IPQ8074 + QCN9074 (Used by me and tested on) set the desired
> >>> QRTR instance ID offset by calculating a unique one based on PCI domain
> >>> and bus ID-s and writing it to bits 7-0 of BHI_ERRDBG2 MHI register by
> >>> using the SBL state callback that is added as part of the series.
> >>> We also have to make sure that new QRTR offset is added on top of the
> >>> default QRTR instance ID-s that are currently used in the driver.
> >>>
> >>
> >> Register BHI_ERRDBG2 is listed as Read only from Host as per the BHI spec.
> >> So I'm not sure if this solution is going to work on all ath11k supported
> >> chipsets.
> >>
> >> Kalle, can you confirm?
> >
> > I can't look at this in detail right now, but hopefully in few days.
> > I'll get back to you.
>
> The solution we have been thinking internally would not use
> MHI_CB_EE_SBL_MODE at all, it's not clear for me yet why the mode was
> not needed in our solution. Maybe there are firmware modifications? I
> think it's best that we submit our proposal as well, then we can then
> compare implementations and see what is the best course of action.

Kalle, any ETA when you will post your idea?
I am constantly hitting this crazy limitation and my idea does not work on cards
like QCA6390 so it's not a viable workaround at all.

Regards,
Robert
>
> But it looks that not all ath11k hardware and firmware releases support
> this feature, we would need meta data information from the firmware to
> detect it. I am working on adding firmware meta data support[1] to
> ath11k, will post patches for that "soon".
>
> [1] similar to firmware-N.bin support ath10k has
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
