Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350865A7CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 14:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiHaMGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 08:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiHaMGg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 08:06:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5E06CD02
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 05:06:35 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p16so1629177lfd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 05:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=s7NlDumETs9wQ3Y95JXvaCOT89PMenrVizz0Vrnaec4=;
        b=IkY358kZDf4ErtZ5IzZdXwdGiVx6cEp1mwN+Ar4JtDwUGkMkhrl+g3NHzn9/4Bcnjb
         C2Vy8xYEZ88lTwrfdKS/EaGV7sRWAnQNu65bmgIhh4EmSBCHONzCEn8MGOVbOnbyJeNC
         Ka1D0mmC4Fubu177W7fWjdWToDtkYDX6YZvWpkSKlwggQE5jk7ksEyGmbAh5J10y6kPJ
         kCLGFvGyx2XD9HBkOJtCXS41JbiXQM4qVMpdKM4SX5r61wJBVxRk6eGOiGFhXOAn+i9v
         upNza+nNlA/KCq+KJnRSYM5CUSfC1L9iIHF7yzxATNY2F+u8KQq2j0n3hldy9ecXwk0O
         mNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=s7NlDumETs9wQ3Y95JXvaCOT89PMenrVizz0Vrnaec4=;
        b=4+h49bKssW3vMry2qw1BZTXHubzmyGemUdbeWFk4pxmvBy9O5AJbSVS239sfx07UXQ
         O+bHV0DknJHcqrsgOtK+XJFG32VMWe8Erus4Ur1zTgP93eEk+/MVjCSd1ctQworiKIj9
         6cZoWRQUex7cyqHKgRDC5ptCK38Yyeti5ljcLcHcQYLrWbHajB2FMw/jtXtNymX1M+9R
         DM9TVVPQV9erD1FOoc4W9JlM3aIxl9Z8scUpJZXKD3kM/G+CuDd+lkYaRu2HlI5bPcD9
         3o5EiEv3lCbH/Qp5By5XLvC08z+4o78hhD7ME7OwgFUhGu8rLF9+DOXgvnN3QS7DREQm
         dWqQ==
X-Gm-Message-State: ACgBeo0rry5i8ENaBCW451RnccVE5TUlsptkJwBhy+rCOQuCfcQal33Z
        8qxVJOi1tb7jLR2buQwqCltqn6HFjleV/5urrXI=
X-Google-Smtp-Source: AA6agR7cEreXLpLAwBgLUPqyrDc3ong+V522Xg4S3xVpUsJ9tuC2UDQHJjc9SONYmQCvWuEiMDgs/bTAuBPOze6peqs=
X-Received: by 2002:a05:6512:228a:b0:492:b7cd:9599 with SMTP id
 f10-20020a056512228a00b00492b7cd9599mr8517583lfu.625.1661947593527; Wed, 31
 Aug 2022 05:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:810:b0:211:82f4:7268 with HTTP; Wed, 31 Aug 2022
 05:06:30 -0700 (PDT)
Reply-To: golsonfinancial@gmail.com
From:   OLSON FINANCIAL GROUP <ekefelix2018@gmail.com>
Date:   Wed, 31 Aug 2022 05:06:30 -0700
Message-ID: <CANOdbzKb4Wgz-qLnjtc=A98bO2Pr5N8n=pTjtZ=9rGwoiFwuWA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ekefelix2018[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ekefelix2018[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=20
Hallo Gr=C3=BC=C3=9Fe,
Ben=C3=B6tigen Sie dringend einen Kredit, um ein Haus oder ein Auto zu
kaufen? oder ben=C3=B6tigen Sie ein Gesch=C3=A4fts- oder Privatdarlehen, um=
 zu
investieren? ein neues Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Un=
d
zahlen Sie uns Installationen zur=C3=BCck? Wir sind ein zertifiziertes
Finanzunternehmen. Wir bieten Privatpersonen und Unternehmen Kredite
an. Wir bieten zuverl=C3=A4ssige Kredite zu einem sehr niedrigen Zinssatz
von 2 %. F=C3=BCr weitere Informationen
mailen Sie uns an: golsonfinancial@gmail.com......
