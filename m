Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900035F3463
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 19:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiJCRX1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 13:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiJCRXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 13:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C52A2F007
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 10:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664817796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZcKEyglz2TbKS11RyS2nvN0KWcDU1wuM3YnwQLNBo2g=;
        b=YKAyUB/9ozIzUzi3ALX2Royk4yChuVEONBEegCs4W1TOmraTGWhrnPqBUEMMRPCOAUYJmU
        JnVFMwdW7x0B6P2Hl4a4lQTz6vU9d/l3J6+/gfUj9croIpuPShEIfY0Rn39m3RXVLDqjvs
        /8z/QKV9Ig/6qa/KHoALdtHbrANavwg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-3kFSzY0sMLqDexMZzgjGZA-1; Mon, 03 Oct 2022 13:23:15 -0400
X-MC-Unique: 3kFSzY0sMLqDexMZzgjGZA-1
Received: by mail-qt1-f200.google.com with SMTP id g6-20020ac84b66000000b0035cf832dec9so7624446qts.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 10:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ZcKEyglz2TbKS11RyS2nvN0KWcDU1wuM3YnwQLNBo2g=;
        b=dq5Gy3s2dYR7wC2HbnMEmS8F+VUBWML2AmDmfEFIs4MrsqCwnQgF82iV8ZqfRRO4ze
         tau7fANbtX/ClqD2J71fXUwf/Er52vDW/SJ04YFEVJF0glrGwa5b6/8Ee/hYkyWln0jM
         ghJLzxyj1c+eOLgdBHEnisirgkeGNuN1FDw5xIcq6WzHNjizAU46d202kP8U43GL2cnb
         Tph4IiBuTc+V6aZuYGyeUdy6mSulY8Znfe2cSCP0zNu2EsVsMjjSn3NlpmgfBWzM3LQ4
         0g4nXxvC+Hvl7BIrUX6GIe3YqbypJKXfYvPPXe6auvi5ntho+rxbBxQj7/Qz5Jpqc3qT
         mRTg==
X-Gm-Message-State: ACrzQf1vquvdvEM95wVCV+jz5ZPi13Vra0cVXEjMgexAqMYoVqWEiq5N
        SNL2KQTczP4EaaPsHz4BRT2MVAZSeiRpOtX7/JXLF62oG/lZKaC8790qgWZwO1nPLiK6i9Gt51d
        gMIaFpMnSxyVXmJeIjp9AyZmA9g==
X-Received: by 2002:a05:6214:f0b:b0:4af:9262:d52c with SMTP id gw11-20020a0562140f0b00b004af9262d52cmr16854202qvb.57.1664817794959;
        Mon, 03 Oct 2022 10:23:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qcgzaUWumDfu5NTpxrYh6RI2AyvoF+HtSaDAGCLvDxpVt/UGtXGzaAVXPuKw1Kj+/faZGHQ==
X-Received: by 2002:a05:6214:f0b:b0:4af:9262:d52c with SMTP id gw11-20020a0562140f0b00b004af9262d52cmr16854184qvb.57.1664817794750;
        Mon, 03 Oct 2022 10:23:14 -0700 (PDT)
Received: from localhost (pool-100-0-210-47.bstnma.fios.verizon.net. [100.0.210.47])
        by smtp.gmail.com with ESMTPSA id h12-20020a05620a284c00b006cebda00630sm10429201qkp.60.2022.10.03.10.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:23:14 -0700 (PDT)
Date:   Mon, 3 Oct 2022 13:23:13 -0400
From:   Eric Chanudet <echanude@redhat.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-rt-users@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: qcom-ipcc: Use generic_handle_irq_safe()
Message-ID: <20221003172313.vv3isog3nsc3r2pn@echanude>
References: <20220909162043.2734873-1-echanude@redhat.com>
 <YyBP+eNIBCN0OsGt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyBP+eNIBCN0OsGt@linutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 13, 2022 at 11:40:09AM +0200, Sebastian Andrzej Siewior wrote:
> On 2022-09-09 12:20:43 [-0400], Eric Chanudet wrote:
> > PREEMPT_RT forces qcom-ipcc's handler to be threaded with interrupts
> > enabled, which triggers a warning in __handle_irq_event_percpu().
> > 
> > Use generic_handle_irq_safe() that can be called with or without
> > interrupts enabled instead.
> 
> wouldn't IRQF_NO_THREAD be a better match here?

Agreed, my apologies for the delay:
https://lore.kernel.org/linux-arm-msm/20221003170849.383005-1-echanude@redhat.com/

Thanks,

-- 
Eric Chanudet

