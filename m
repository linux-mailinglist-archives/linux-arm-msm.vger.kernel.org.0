Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D14452CCFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 09:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiESH3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 03:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiESH2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 03:28:55 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4428AE7C
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:28:54 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id c1so4148723qkf.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=nwXcMtuFaaBTutJXJW8OP33gJnejQFnEoOoT6tEJEt4=;
        b=D0+mPRYu9xHIfppSMuH6TP5cfUWo32ahWqXkSxB/s8SxnSoI9ScweIHnCIfx8IRVQ5
         YKFDl04Aev0TFnVWIBHvTu9NSKpOFFlcSGjn177zeVaGfT2Gzie8Q52wTfbUUJqvAxRB
         SFmm7fXm1HZeukYp3p1sqPvQ+jfl3U3tSwxFK8xabKVe+TEVx9nyYRi7BPu95MyhQbx+
         J3pP8IISxcV4eRgFJm518DEUIPeLLMlPplekkavzYG6/DHKX1eBRrPZFy7mI53fSl43w
         xYHV6WvgRJqH+8AbPQvWZAL3u7LR3wRUcTGqWsKtYR2NdV2mZNSwE8EHjkAlC20QIsKL
         tyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=nwXcMtuFaaBTutJXJW8OP33gJnejQFnEoOoT6tEJEt4=;
        b=ndZcolvsirsWFMGQyUWESvzzB7jXcFndxj4JJBLQemrggLgCjRGM6nWqQIuNnndbnG
         J1REMe7FVX61u6l/wrco+MlpbwJ/RaCqlj3Ecw9KNtMluPrJ2PZF7mWHTSpRnSJlI7Qm
         tnKOGi47af+4NICJJ9617ZDE/sMGE9SqJnafgdt4mprGWwaQPyxXA6aItSld2gZZBepJ
         iMJYtIkvkGV70kayCPrkl9W50TwSEvUckVh7vFf6U5an4SL26PFqcHWdOWL/slQWtp3c
         10WUFFhDfZSBeGRKqno6JzKgG1qdbPdfMHYVERfPSnTW/ahonm75Mpcvl4TRQ9WTEawg
         on3Q==
X-Gm-Message-State: AOAM531jmrwzVfmR5SAgrdVIVISJea8WJyiLjO1LE1Gd29wNeYeflZw/
        wEQS6fiyyvGfB98Yw6GflEdNu9K5RdZCPZdHYjE=
X-Google-Smtp-Source: ABdhPJxkDLZAItHF8XGuGIJRvtZtJiyZn/jmmLdjAsbl369/Wk3Vo1NTEFbYPNYyG/HAByxmOfGSHzdA68S2klFHYGY=
X-Received: by 2002:a05:620a:408e:b0:6a0:10bc:55dc with SMTP id
 f14-20020a05620a408e00b006a010bc55dcmr2093906qko.767.1652945333920; Thu, 19
 May 2022 00:28:53 -0700 (PDT)
MIME-Version: 1.0
Sender: 1joypeters@gmail.com
Received: by 2002:ac8:5f4d:0:0:0:0:0 with HTTP; Thu, 19 May 2022 00:28:53
 -0700 (PDT)
From:   Dina Mckenna <dinamckenna1894@gmail.com>
Date:   Thu, 19 May 2022 19:28:53 +1200
X-Google-Sender-Auth: qciulGZuLDljT76xKdK74IfWxNg
Message-ID: <CA+F+MbZ6fBoW0e6-sdqn+esKJUTw6ff5ddP5GUM222Kn2u8_fA@mail.gmail.com>
Subject: Calvary greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.1 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_80,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:735 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8328]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [1joypeters[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.9 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  1.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello my dear.,

 I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life. I am Mrs. Dina Howley. Mckenna, a widow. I am
suffering from a long time brain tumor, It has defiled all forms of
medical treatment, and right now I have about a few months to leave,
according to medical experts. The situation has gotten complicated
recently with my inability to hear proper, am communicating with you
with the help of the chief nurse herein the hospital, from all
indication my conditions is really deteriorating and it is quite
obvious that, according to my doctors they have advised me that I may
not live too long, Because this illness has gotten to a very bad
stage. I plead that you will not expose or betray this trust and
confidence that I am about to repose on you for the mutual benefit of
the orphans and the less privilege. I have some funds I inherited from
my late husband, the sum of ($ 11,000,000.00, Eleven Million Dollars).
Having known my condition, I decided to donate this fund to you
believing that you will utilize it the way i am going to instruct
herein. I need you to assist me and reclaim this money and use it for
Charity works therein your country  for orphanages and gives justice
and help to the poor, needy and widows says The Lord." Jeremiah
22:15-16.=E2=80=9C and also build schools for less privilege that will be
named after my late husband if possible and to promote the word of God
and the effort that the house of God is maintained. I do not want a
situation where this money will be used in an ungodly manner. That's
why I'm taking this decision. I'm not afraid of death, so I know where
I'm going. I accept this decision because I do not have any child who
will inherit this money after I die.. Please I want your sincerely and
urgent answer to know if you will be able to execute this project for
the glory of God, and I will give you more information on how the fund
will be transferred to your bank account. May the grace, peace, love
and the truth in the Word of God be with you and all those that you
love and care for. .

I'm waiting for your immediate reply.

May God Bless you,
Mrs. Dina Howley Mckenna.
