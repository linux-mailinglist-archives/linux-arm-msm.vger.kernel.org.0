Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B52C5F5BE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 23:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiJEVtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 17:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiJEVtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 17:49:11 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6291C80483
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Oct 2022 14:49:10 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id d22-20020a4a5216000000b0047f740d5847so170916oob.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Oct 2022 14:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=5SC6u28FnA0rLbxuQkq7MgCQjxVXqpOOfuZiTx0+JQ4=;
        b=j6t2Cdfih4Iff8tWSYbei/IUoDjD5+M5+IH+0RuBQs4HoIDnZhjhPZ2293WB3QJIet
         XhmnJFF3p/QILfPqlkf9Bflgq0HI8ZNc2NoDxXSF4XgTi8IBo2RaEQ5XMbUArxi8B6aE
         2V9571fy5HYKJt60M9B6bs6bI6F7Ik9qPPFSwBaepwL8v1bPIMos6sJRCODaEPhUP9DK
         H8i56te9ocIaAlDxGaMZCS8ZBgZinzoprtQ/vLx9w5ZjSOySS5+yLeo4Wtf3F7rE+C03
         iAxKTXe7WTNow49dczlvSIcwjMajvAlmPoCtQthvytwN8Dcl87DDPMYiuE1SIVxFl2mx
         r5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5SC6u28FnA0rLbxuQkq7MgCQjxVXqpOOfuZiTx0+JQ4=;
        b=pB+t/a/M5Ml4hZMB5oScnFtDMSANk59JYWlnyha3OU3hb5Uds1Iz7AUmR4EXE3W71P
         0ERijSW2TPX0xqsCC5/npUYrNRGbN8NBHTjpUOOYSfd4cfwHbJc3ytZlvLYopUltH/4i
         48nVxpsYqBF99Sb0C7j4bBPJFS3hSOEJnULCsIWDYJb3WgouSa1rpy1GRfm9UGM1hJ77
         oumRigmcOI9wW5njJ/LTfj2vcC2rjqf6jkN1eJJjgTdB1BUbGJY1J5+nXZJgFi37bDUW
         suphvoGsUGC/0Udysj6w6/ykMgFqOJ71S74fE8QcDmWvbOtrXmuapO7IrrMLRAVHTSpF
         Q8EQ==
X-Gm-Message-State: ACrzQf3j+rmpwVN3w/o3EWFx+VxuKwAx67ntd41gUe9oriyDR9PHgmsI
        In8DqG9BnIcdhgaHbQOjzTmijarXhW8BL47EHGc=
X-Google-Smtp-Source: AMsMyM5dwhvr98YLtAcA0gyXrR+xauWit5IpHYDZQSpWUskdWaFAgzJL/bkvP3mPZ0DKznnqrqkdM/lnS0DIvUJKK2U=
X-Received: by 2002:a4a:a28d:0:b0:476:c2a8:9aa2 with SMTP id
 h13-20020a4aa28d000000b00476c2a89aa2mr567157ool.48.1665006549709; Wed, 05 Oct
 2022 14:49:09 -0700 (PDT)
MIME-Version: 1.0
Sender: okeosazze@gmail.com
Received: by 2002:a05:6358:7691:b0:c8:ac26:33a1 with HTTP; Wed, 5 Oct 2022
 14:49:09 -0700 (PDT)
From:   aisha <aishagaddafi12345600@gmail.com>
Date:   Wed, 5 Oct 2022 13:49:09 -0800
X-Google-Sender-Auth: DTDPTax346EBEzJMwuZ8Sj-FRsg
Message-ID: <CAGz+XHfYJ5weyWCXx-SphuvB+iM+amVQonR=jsSP2nZrD8ZRvQ@mail.gmail.com>
Subject: Hello my dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.9 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        LOTS_OF_MONEY,MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c2a listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [okeosazze[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gooday,

May i use this medium to open a mutual communication with you  seeking
your acceptance towards investing in your country under  your management as
my partner, My name is Gaddafi Aisha and  presently living in Oman, i am a
Widow and single Mother with  three Children, the only biological Daughter
of late Libyan  President (Late Colonel Muammar Gaddafi) and presently I am
under  political asylum protection by the Omani Government.

  I have funds worth "Twenty Seven Million Five Hundred Thousand  United
State Dollars"$27.500.000.00 US Dollars which I want to  entrust to you
for investment projects in your country. If you  are willing to handle this
project on my behalf, kindly reply  urgent to enable me provide you more
details to start the  transfer process, I shall appreciate your urgent
response

Yours Sincerly,
Mrs, Aisha Gaddafi,
