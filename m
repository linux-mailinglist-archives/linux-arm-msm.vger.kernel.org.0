Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5945BB3F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 23:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiIPVhC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 17:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiIPVhB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 17:37:01 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731B1AB415
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 14:37:00 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id s125so3599625oie.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 14:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=JV8JgVA+FWWi07ejVoHZTD4Ooe6hnpy5/CArDPU4RIE=;
        b=qFyjfsvbcP3RScwiKnyvmU+POLn9rudlAfIVdmPcxoabdZoXjhwdes8fd6A49KU6Xm
         1SpFfqfbiztkLIZnudUWFqvedBbxyT6sITZuZOMzrLsglQnqvIWYSWi63wR87MQDX1R9
         pc8bRMNPob49InfhH1RQYPJxQPsVg4cQAcug3HIdrK/LZ99grImpz5MkD39jF+mIRU2v
         SL/HfaC8jK7LLdSq2Np4bHF5KHXLjbCXFwSFCBmGoG21niU0X84f3TRTwXNWY2gOIO85
         K2pCHx2U6cb3ADheNqFzYIyc+SwSE5f5HvPtNhhJQa08Tqs8e43n88LuzgONov74PeJG
         hLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JV8JgVA+FWWi07ejVoHZTD4Ooe6hnpy5/CArDPU4RIE=;
        b=TmaZ9af5tZGQaTt3p7zIuQnEuWqASAFbTdAw1Hc0nodcvfcK7TBXCGnfUHVHakpijz
         J26a+srviALvUCUiqc95HIAfi3jOelzXQcnZ6rIv3c0V6eolf4HyFW3sX3pEGLmXbfKy
         K8UDnCjRHuWPiFniVmgMaJdMEHUoXJhU+ICt3rsaNVnJr7TS0nPQ8L4e2F3IrGO1iAft
         hdMBYf/rPx4xzUPLA42slFvK8mMWzgio6gwIaqTQRzNqsiyVPAxnuCfZj2wRhaj0SUJO
         I0BDtfI1r4ovWzEgtDE029E/ev5kJnoucbqFzWcK0i6AJrYc9KuT512+gTfNOPMrKzDJ
         /77Q==
X-Gm-Message-State: ACgBeo3/kCf9/ZgehuuOQtt28i69SElDOZl6tfWET9/A1S+0xJypYRCy
        MoIRsw2PHCWeqXxPvkeg+drWFMJz3odX6ClxHbM=
X-Google-Smtp-Source: AA6agR4VVJBD/+aCEbBMQAQIvvczYBGI6azWdvhw1WkzlAVStE8f8VZ7RH8KD2Asn+zui2y4owOVXDqPUR1s5V4zXGU=
X-Received: by 2002:a05:6808:210f:b0:350:185d:2f31 with SMTP id
 r15-20020a056808210f00b00350185d2f31mr6387364oiw.224.1663364219457; Fri, 16
 Sep 2022 14:36:59 -0700 (PDT)
MIME-Version: 1.0
Sender: samco.chambers1988@gmail.com
Received: by 2002:a05:6358:5384:b0:c7:538c:4574 with HTTP; Fri, 16 Sep 2022
 14:36:58 -0700 (PDT)
From:   Doris David <mrs.doris.david02@gmail.com>
Date:   Fri, 16 Sep 2022 14:36:58 -0700
X-Google-Sender-Auth: UmFsySLS4r93OxQGOkmJYeb3Oqg
Message-ID: <CACePhLkYNPA_86yPrBBkusm3Cg1PnqyGdwZj1RHPyQTuw_FLRQ@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.9 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Greetings,

I sent this mail praying it will find you in a good condition, since I
myself am in a very critical health condition in which I sleep every
night  without knowing if I may be alive to see the next day. I am
Mrs.Doris David, a widow suffering from a long time illness. I have
some funds I  inherited from my late husband, the sum of
($11,000,000.00) my Doctor told me recently that I have serious
sickness which is a cancer problem. What disturbs me most is my stroke
sickness. Having known my condition, I decided to donate this fund to
a good person that will utilize it the way I am going to instruct
herein. I need a very Honest God.

fearing a person who can claim this money and use it for Charity
works, for orphanages, widows and also build schools for less
privileges that will be named after my late husband if possible and to
promote the word of God and the effort that the house of God is
maintained. I do not want a situation where this money will be used in
an ungodly manner. That's why I' making this decision. I'm not afraid
of death so I know where I'm going. I accept this decision because I
do not have any child who will inherit this money after I die. Please
I want your sincere and urgent answer to know if you will be able to
execute this project, and I will give you more information on how
thunder will be transferred to your bank account. I am waiting for
your reply.

May God Bless you,
Mrs.Doris David,
