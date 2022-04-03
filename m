Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033E34F0893
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 11:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356206AbiDCJYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 05:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356203AbiDCJYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 05:24:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C4439166
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 02:22:06 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ot30so4306046ejb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 02:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=OTuQUiog2XmLT6Jm2LnAcZJ4IxYwjdtxF6IgEfkS7Y8=;
        b=fZq61mlWlHyc1Y6wGvfGvXgqo6pPeCmp3tFD8va5puX7gSlcNNGG/plOoHxhkQ3kor
         UCxhAaOd3Zqe5ZTl8MjkNgpv/DWlZOzEjEChMyi5G1nrNRKWLrsNTxRr40aFw4AQaMm2
         iV5GaHQgPeT+ZKs/ihqft+Lm4HXvHaJ7686pgWBX2GDRzzQqUsF0/mj7+7dJUGFYdJqQ
         iDS5NzjX/VgRitmDZaasKFMWrNdo2lvckAhPrah27Gf2b2aDkqGl4eYkHfBUD6reUCI3
         jTDSQ363rRgK5d+3td+q58jda0Vm6zYiyz0yL1iu/Bts+TjzEl9BUYt+OJEaKAWXCM99
         eVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OTuQUiog2XmLT6Jm2LnAcZJ4IxYwjdtxF6IgEfkS7Y8=;
        b=v49O0CTWxr9OSCeMY5w7pgxEx3kU1X1tyJq7Zqp2/kIGApOaiK0XlKExG6rBjhoulR
         V/xoV3AqsqatypJ4Ec3mXLge+RzkTSKkA4DTAEfdOWlGdb89EgpVvXRb0mxpa0azNm6k
         GBZZiw+rJP/6o3eB1YyGr9g6X5U23WRIVpZxj3qizNTCwpvSF+xKyqtcuXO8c8Xs9yfT
         tONUOpRLJV2GuFXpT9v5LOObX9CycKjGCmOI2gIuPNIERYYqGjtPfnZ+mcCX0c5g809U
         Gvk2aOync0iSQCcJqtIgxEqrfz1+Sms4ZOLL67fSWa98GMQ3E/Lza7Ns3cr41qkx+vpt
         0xpQ==
X-Gm-Message-State: AOAM530ePzZWhzjsXpV2jdKQcd3YTVB6hSO8fwfrOZtFGndeTu6i7Lcp
        G5zdxPAQ9rIxbj4JmyuTiO6fEBvtPzaumbFH+/U=
X-Google-Smtp-Source: ABdhPJzLg0+erREsH0LkqvZRw0B9apCBelXQz2EGRKuZhrBT/KPSramJjcoWDVpB39OeZGvWHR/AjvJ8iSqNFn5BJys=
X-Received: by 2002:a17:907:6d1b:b0:6e6:2583:cea5 with SMTP id
 sa27-20020a1709076d1b00b006e62583cea5mr5495591ejc.188.1648977725289; Sun, 03
 Apr 2022 02:22:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:b1d4:0:0:0:0 with HTTP; Sun, 3 Apr 2022 02:22:04
 -0700 (PDT)
From:   Ikuku Ajunwa <ikukuajunwa@gmail.com>
Date:   Sun, 3 Apr 2022 02:22:04 -0700
Message-ID: <CABueqtC5yqZjA2-Nahh+2UZbiKPEH6hLa+sSvwcE85Wa-A-PYg@mail.gmail.com>
Subject: waiting transfer
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62f listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6087]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ikukuajunwa[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Valued Attention Sir!
Our recent record   indicates that you are eligible to receive an
optional repayment of cash fund!! $750.000.00 which has been found in
the security vault registered in your favor under your email account
waiting to be dispatch without claims.
the account is set up under your email address  can only be obtained
by you (receiver),all  you have to do is to provide
Your full Name.....................
Direct Telephone: ..............
And delivery address........... For immediate shipment
Thanks and anticipating your urgent respond
finaccial@citromail.hu
Yours faithfully,
ikuku
Section assistance and   Verification committee
USAfro-Euro   Debit Reconciliation Office
ID 4475 UK London.
