Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6EB586EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 18:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbiHAQib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Aug 2022 12:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiHAQi3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Aug 2022 12:38:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A0F38D
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Aug 2022 09:38:25 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s14so12932066ljh.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Aug 2022 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=UpgXbpfO0w/dJq4k0vuSl6sUdwOXFPzo72SUDWGRn4yCt6QTXqfTKNyPrrLSbJ8yzY
         7SvNYiuTJto9ZKlzvm5aoeOkIg+OLPLmA7JtBAqJNAo3ZwaSjplZ/wAzKUOl+dDU/dDK
         hYOtZRuneAEXUY6rJcSHGhuzX712qrYQrFpKbC7RuKjQlSCmwGRK5sGDya2wx4XaUf+k
         IlVzDxfqSKvxeU6NrU/S6TRC1i25W9OIICD2HGjN/h5O8s28u9oHxFPUHjB6EjmlL3W1
         LOFyxwAfOSDkgEr1jZ/ZsXk1P0uSiTY0XrYgKEkG3SBkCMdWMSlGcFhfScKKMVApzTc3
         wpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=nk3VQhIcCFFkP/aliPivS2haaJ82kCLbzJ5RnyB9cXkjMRaAThKs5Z15PdT4NvFXek
         Fckw7Mdzyrxtvq8ml9I7/ilLMHuiPV+DKqKmeZhft8jQxs5XcWLq2SqhvhVXuhBE0Puh
         U2w1DfQBczXtg3d0mIGYhV5mCqiWa3n4akZ+ovpJfPQ11b7KWhfVt23Ufb/W3bvzarEG
         IqsMw2WRqCxnPxZSVgJ0Ffqt4p1cI2CK47aBToYiSRFpO4MkJH/NQ+USkYpTDK4uQcF9
         9FXZHKX0XMkCQOma98P9mD9igP16sM8O86tkWHZSah1SmCdMVngCmnJjdrecT2V3thRC
         d8NQ==
X-Gm-Message-State: AJIora8rnKDqvvRbPXo+LtVpoAq37ekk7kMMN5H8v0OfY4grLU1mM0cn
        ONUatwR5ISHd+QRdjmfxoGkRqIlprQQxi27prKQ=
X-Google-Smtp-Source: AGRyM1uhfxKvD7WlSvnzrbGlwEuRLAbxrb3yEpNH1m/q+RCiRS7C4p1DxknGjCMobov/SaZ/nFOLCAAIjg3qtSJ3b84=
X-Received: by 2002:a2e:be90:0:b0:25e:1496:a0b8 with SMTP id
 a16-20020a2ebe90000000b0025e1496a0b8mr5567966ljr.194.1659371903861; Mon, 01
 Aug 2022 09:38:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:cb52:0:b0:1fa:aaed:e6d9 with HTTP; Mon, 1 Aug 2022
 09:38:23 -0700 (PDT)
From:   Bright Gawayn <gben68387@gmail.com>
Date:   Mon, 1 Aug 2022 22:08:23 +0530
Message-ID: <CAG1+V0w-Pt5No3wNn5Sm7K_0Y_mZnH5=drEjS3cseB6w-yBsLg@mail.gmail.com>
Subject: Lucrative business proposal very urgent!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.9 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:243 listed in]
        [list.dnswl.org]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gben68387[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gben68387[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.5 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello dear My name is Mr Bright Gawayn,  It's my pleasure to contact you today.

We use a certain raw material in our pharmaceutical firm for the
manufacture of animal vaccines and many more.

My intention is to give you the new contact information of the local
manufacturer of this raw material in India and every details regarding
how to supply the material to my company if you're interested, my
company pays in advance for this material.

Due to some reasons, which I will explain in my next email, I cannot
procure this material and supply it to my company myself due to the
fact that I am a staff in the company.

Please get back to me as soon as possible for full detail if you are interested.

Thanks and regards
Bright.
