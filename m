Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B2253F719
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 09:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbiFGHYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 03:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbiFGHYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 03:24:34 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FE4BBCCE
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 00:24:33 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id m20so33278921ejj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=OHbou33WPhW0PDy9/CZae9mIrL4buN3/FALSld4obAM=;
        b=nZSLGL0FwMW7ZulHR9U52MbrNEMnewFW3MGol4rpEwxR/xWwklbRptFrN/0ezaWipa
         SVj/FBp8HjTkHSaZhA4aco+JJol3TW+ysVSnLFMXjX1hdO0ILcm4wtBJThFEVNDVVCXo
         4ntrNGY2nycQcp03JB0+YgisUIAkEdLhhtyc+foH1HVsb7bhUUUWeAE8pEpG8RX8LdXL
         D+TDGq3Ylpiuj+mSUPFQoAIi/kpKeuOjYIkwe9sZltrehUP10lYzyOJq2KjZoaS/bP5x
         slQv6+rCeEHv4SpF6VlGXk8Fl6SbD6l8oqnry6LWntt0ByHJQjQnicz2v40WRbqgQUut
         GSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=OHbou33WPhW0PDy9/CZae9mIrL4buN3/FALSld4obAM=;
        b=oNj1RpFlXBQyPkgdjIUkg203242rLGPi+0+5fQdQPaEwqSf9h/lUyUJI1UdSiennkg
         jVv6OfXsfbR6uk8nidvdVQuIRQYAe4+Z/7e3Jtqnosndgi4s60HitSqKyqDqwu3Iy2ec
         6EcwPvANteSuBJX4lGnO9Oh6qT6zPxXFjzGoegPJNb6OBhGlPn6fIUEgCpgC4qvuU3+v
         mCheTla+MWX8SGtlPuqqbuSz81O+90qgLG0BR9oBuVKUEVNSl22JZ28vPw4h+ilvGaVs
         SIofef0AhD8+rfxJ5DjgTG0RP/wwf99+3V6B/YXJP7zIbBYL0LCQewFcFpH3G7gRrSaX
         6D5A==
X-Gm-Message-State: AOAM533UKWBGDPCn4u7MedyZLNdErUVdJe3cE6qqFnSmEvhVB3aHfJyB
        pwlJj15A0ms0gKulRsIO9ios30OB82RruXJev/8=
X-Google-Smtp-Source: ABdhPJzM6ViYn8Xj6BM3INVuLM+AOES80/1QTk2bTK+rPk/zlJbWxB+0auaSVpSpOCaepSZ+lFsOA8UQfOCX2ZJh9Mw=
X-Received: by 2002:a17:906:478b:b0:6f8:5850:4da9 with SMTP id
 cw11-20020a170906478b00b006f858504da9mr24982924ejc.619.1654586671945; Tue, 07
 Jun 2022 00:24:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6402:26c8:0:0:0:0 with HTTP; Tue, 7 Jun 2022 00:24:31
 -0700 (PDT)
Reply-To: andyhalford22@gmail.com
From:   Andy Halford <fameyemrf@gmail.com>
Date:   Tue, 7 Jun 2022 00:24:31 -0700
Message-ID: <CAATdNavPsznxvtSrdYvx28MvzTTn6hj8oMJQVfY=Xjj=mxEA=w@mail.gmail.com>
Subject: Dear Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:643 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fameyemrf[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [andyhalford22[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

-- 
Hello Sir



  I am Andy Halford from London, UK. Nice to meet you. Sorry for the
inconvenience it's because of the time difference. I contacted you
specifically regarding an important piece of information I intend
sharing with you that will be of interest to you. Having gone through
an intelligent methodical search, I decided to specifically contact
you hoping that you will find this information useful. Kindly confirm
I got the correct email by replying via same email to ensure I don't
send the information to the wrong person.



REGARDS
Andy Halford
