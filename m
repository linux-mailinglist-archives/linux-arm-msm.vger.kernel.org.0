Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D90B5658A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 16:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbiGDO3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 10:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbiGDO3R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 10:29:17 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FFB10B1
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 07:29:16 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id j7so10829265ybj.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=8L3u9yLimYhqEYiPckuKAsVAuSvOnpygme4DEwcN/0I=;
        b=Bf/vmVTnh8EhRejg8RxNRn2jb9ee2q9ErYzhp3fApr6P3EPG44bE+6JuwqHpkwSyZL
         ug5a6g4FeQbRm0QbDKhIsPXkYJult1O05HSgF0t2lkauniY5sng28EsK613uFL1IDlYg
         k9rqN27XzCSvYB7UkykvKuvZoSnKt7lzmQ6frNFz9Uz8W0zxDdLBtfAi64yVHia4ZCRA
         VakjoKqWhuzlY8s2fUod9K1UOqqBh2EreYc7xKbw3h15RAPtE5372nfShgMH16yOQyaN
         DnEwph4UPdFl0Lk2ChwP1S/izDRFD6vPGY6NpF3eJ47gsQ/DibhN8SFKLCIXi3f6vMqV
         iLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=8L3u9yLimYhqEYiPckuKAsVAuSvOnpygme4DEwcN/0I=;
        b=WPeyuXPMgVDeBFSnG0GA3qmmfceN4KQEEm7mKjR0nmNXnzc8z24EtNrzSVRTtVaeJc
         DMLjeKorjktDXd9YxH4/PRla60IlSCH66bdcsgLNX1aJgWsemDDk4mrU/SnusDYJEEqE
         bZs7UhXiff/DP/Rjegb2Q3VKhOIbOFLik4nwondcnhjPtKVCCwfMVS7lZO0IY2VUA1HZ
         ky0cKhMx62T5nKdP5lNcKscRi+Jm6bJIOfZmlesDrMuhEahZfBVrmXewn1b9KBXbOskB
         7nWD4IbAWji2MUrDasDV1FZHux2TrZWsEwYa+paWam9xGH9xxcxs9xXZwTSLlXj3AvZ+
         luKg==
X-Gm-Message-State: AJIora99ykYXdEvhpZE7PVXYtBCW1u8XoVRm1eALkIqH2/dRDs9onZvo
        P70Z1HxYhwc7L8lRlArmT2ji2YArRRKE6Vn+Nw==
X-Google-Smtp-Source: AGRyM1voX2rGsvgw9fTsp1p5uPNB88BWDYFqD5vFlIEjLxCtJplHwuMPDoXxf35111NN1Eo96ubwjb0sk2NZFxP4qxE=
X-Received: by 2002:a25:abb3:0:b0:66e:2f9a:4201 with SMTP id
 v48-20020a25abb3000000b0066e2f9a4201mr11903241ybi.125.1656944955827; Mon, 04
 Jul 2022 07:29:15 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mayumisakimoto7@gmail.com
Sender: masakootus21@gmail.com
Received: by 2002:a05:7000:9708:0:0:0:0 with HTTP; Mon, 4 Jul 2022 07:29:15
 -0700 (PDT)
From:   Mayumi Sakimoto <mayumisakimot7@gmail.com>
Date:   Mon, 4 Jul 2022 17:29:15 +0300
X-Google-Sender-Auth: F1X5TD4pmkMacwzrHlrvtn6FWjY
Message-ID: <CAANVZKLcY+C=ouUQCO7ZwY2gmThEgkvazgLtyAFqxvrnJG4tSQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Greetings,

 I hope this email finds you well, Please accept my sincere apologies if
my email does not meet your business or personal ethics. Please I have something
very important to discuss with you.I need to entrust you with a
humanitarian project, Please reply to me as soon as possible.


Kind Regards,
mayumi sakimoto
