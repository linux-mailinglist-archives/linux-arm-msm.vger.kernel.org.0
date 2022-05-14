Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C97852703D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 11:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbiENJWi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 05:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiENJWh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 05:22:37 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4148A2DE7
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 02:22:36 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id r1so19120826ybo.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=mTe6rsF1WlocKfWRCIawejpNJl6lRYSIlYxDz8jltlQ=;
        b=gkAgFBUIA61XpXYAkOixKYtAOPBZCvuwp4SBQxxjEzNUcCOOD0hNm9Mqy5bveyaU06
         g8E/twHkMOK17yzrNBHrCavrodGciHOmlpF+d9WL0NWTWkpMpAJcOflI8fMfnO78Q/Z0
         ESmEP2x4thScbGtSZqsAZm3ud0xA5gncWu2kMyfkhBORVHZgFb5JAY/1CqRMynjP68SC
         Oc2NK9GOTrG3PDhaEK5Ne5iAJBkqvNKjdYn2GM2XvWcwFQbSw606p2tHAMEJLPUFTS5e
         ukMLn/bQaQXRrEGYJ5bjcpALhh3ZIW1iz5M9KE+sMlXkHZSVStFqb7cv/gGh5sE+4UkL
         ukPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=mTe6rsF1WlocKfWRCIawejpNJl6lRYSIlYxDz8jltlQ=;
        b=485bFki0/je54Tat/IQPplIbV6na8SX2WLUwHCqqqrbVKLhY77ediglQl1NApWp+2K
         4a0tAgC5bSDx9DX89WRDZWnziccq3BTE7BGrflma1f0xMttUrVab2GOaerRyHmtMl9Nq
         o2zuZ1DYIr3QIzUAmxkMDIq3jfBf+txcScdb14lOsuQahR9TDXwkHassM005ghDSLafB
         MOoT25uLegovHLW114e9v9o0NA8CjeVyhKe4w5ReylX/qvJL+xdfrnzZ+2B1JHQ41k5A
         Z7X+iOUVFpRIlel2NN4m9ms9bx40QS7l7xjYKmFNJeYAlS9Il6rf/pf/DpRqoP2x5wkV
         NfZA==
X-Gm-Message-State: AOAM53123CQLasqdk439+eDv7OMmW3mQI3Is2yO6aJWpEaK83HcxlgeZ
        wavv/9sPuetqnEHpBSHWYNP7zx3eVPsX1tSA3c8=
X-Google-Smtp-Source: ABdhPJztwj9NMBwqX51c+mCEdbu4+hWlWGGksyLupYDGJ47BmAcOqO0nPeEYwX2VVEkOOIAsYLCgSJ/SGFVL56+IIRo=
X-Received: by 2002:a5b:bcc:0:b0:64d:5c08:222f with SMTP id
 c12-20020a5b0bcc000000b0064d5c08222fmr3377375ybr.592.1652520155287; Sat, 14
 May 2022 02:22:35 -0700 (PDT)
MIME-Version: 1.0
Reply-To: zahirikeen@gmail.com
Sender: abusalim078@gmail.com
Received: by 2002:a05:7110:8089:b0:179:38ba:8bdb with HTTP; Sat, 14 May 2022
 02:22:34 -0700 (PDT)
From:   Zahiri Keen <zahirikeen789@gmail.com>
Date:   Sat, 14 May 2022 09:22:34 +0000
X-Google-Sender-Auth: uaRvrDxejb1Pq0rCBlOVHIfuzis
Message-ID: <CAH0O5dF9rMOdNqqbGHgS7nCK3+ELb1ypTTD8abQrsAuNKVK-sA@mail.gmail.com>
Subject: Greetings to you.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b41 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [abusalim078[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [zahirikeen789[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Good Day,

I know this email might come to you as a surprise because is coming
from someone you haven=E2=80=99t met with before.

I am Mr. Zahiri Keen, the bank manager with BOA bank i contact you for
a deal relating to the funds which are in my position I shall furnish
you with more detail once your response.

Regards,
Mr.Zahiri
