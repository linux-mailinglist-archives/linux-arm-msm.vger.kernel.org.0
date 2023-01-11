Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0600B66574A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 10:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235843AbjAKJVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 04:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238265AbjAKJV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 04:21:28 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B8D5FF8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:21:25 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id 17so16192358pll.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BDAYJ0rba9Lt9b0XJjJxh+A0UhRZ127T1rCwiGZHjnc=;
        b=x2XQxLUwZR2yYsRMaInf7HWF92ZLD+A8Ta/XpfOy9ltRTG81C6B4t3CzTcmvP7jz3/
         lWh6f2dtGJ219/jUuv2iH7m/U4NGBjFHzp4071AJBOgyXRI1ViS2OKfAS8IL4VqJH41J
         Sy8z6MGyzL59k+PLtxV0hmjP4lkCDie1EJO1VFeVSeJqtTm1ierzThCCy4zhfPI1bJJq
         WFxrtIqvv7HqOo8fSEqABusv8jmYDrsdBNamTK0v9HWaNAQhTdj17J1A/NH1zrh3/0Vf
         IZODWNH23nkOj9DJvhqo5rr6LJGyKBZnO2cbdGaE+ivTzuOeqxf0C3NlLLut3Tsm9Dtq
         uu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDAYJ0rba9Lt9b0XJjJxh+A0UhRZ127T1rCwiGZHjnc=;
        b=hSlLBVdJ9a1E1KczKCWeaMkVV5YIWSHkmVYllunxVKNRkHT7HuhfhFWjy4Vbiu1AHQ
         RAw4z7atCnRED2R8Ga54xgU8NEEfJHimiqIZKucXTA/3Kz0LbzICfCFYBB3yGQMrT3v2
         tKGGfg+Uyc4rT84tJvbfu7lGLlGuOj2qkIMfLwX2UKuoqDAT6svZDc0PHqrj7DxMpf4T
         VMHzFFYXpd1bVvKWdCfkzCjuK1ttJXCLR9quAT1oWYxu6BJh44Le/uHm7WTKjOrkdJXJ
         r1co9ewPTiA35QWoVQ7oL6k7gy+eefSOiSPlNEF0C4RuO34JKx9r2djT7xM5f7efFrxs
         43lQ==
X-Gm-Message-State: AFqh2kpSQV4sXoDE/Ly+r0UaDt2BBbubaX1yoDuJyfYg5yQEguNopyJ9
        kLs+XXkhFdhoWouAFE0JO0JxFHRmBufEfO0aRBgjDw==
X-Google-Smtp-Source: AMrXdXs1BfLQg12NC/c7gfJ2HOmIPIiSva1z4dPZByoL2IWMaM3TOIFUfRduiYyr0b0soYPNL3Jt1Ey8jdQq4xjQLaw=
X-Received: by 2002:a17:90b:48cf:b0:226:164f:522e with SMTP id
 li15-20020a17090b48cf00b00226164f522emr3628516pjb.22.1673428885353; Wed, 11
 Jan 2023 01:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org>
In-Reply-To: <87k02jzgkz.fsf@kernel.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 11 Jan 2023 10:21:14 +0100
Message-ID: <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
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

> Really sorry, I just didn't manage to get this finalised due to other
> stuff and now I'm leaving for a two week vacation :(

Any news regarding this, I have a PR for ipq807x support in OpenWrt
and the current workaround for supporting AHB + PCI or multiple PCI
cards is breaking cards like QCA6390 which are obviously really
popular.

Regards,
Robert
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
