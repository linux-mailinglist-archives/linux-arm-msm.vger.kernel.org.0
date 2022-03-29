Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548BE4EB5FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 00:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbiC2Wb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 18:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbiC2Wbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 18:31:55 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F457EA25
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 15:30:11 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b19so26757016wrh.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=gt069rYNJR0FCCxMRCLerqY/0V+bE/apBhEawc/77mhQiGB8X4NjibLORyJmeP3ptc
         WILFz0t/duNU3QjEhXB4Tzc0m6ZDnsO/b4gCX7Yv7sxN3lfooKfhO9oJUySm9NhvsXbX
         ntEZjtNO1rdWyvGmT0I2JVNCYhpm1K9vgkR6uj579yuO66QOIgT4gcgKN3/OM3GEqP0Z
         FFXUWfQNz2tvcNSdtpMzU5SihTuprXmod/Hn/mhzBKKoo8nZ7Ou++WCY91nG7TZ7wzzQ
         7y9wA5MjV8wJMBOSJhQ6/x9AyB5RCkjcOOIWVAzx+0uEjNvtVaoYLQrtuXxQxnzGWMcc
         Y3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=47OFO3+qYy4suNmqSMqoM8MLm2Po+mY+0lD+1npXXqW7F2ffn2jdkz6UOAPmiTAeDn
         vothYYL5RT4cfYvFl7OHO3xpqheBshXQeADRIPeyngSz7fMM4LYZVkTlI5oKX+VfJCBT
         ayadwYF08N3eAAQjXXoLecSiWMUVnDCXQdlaQV9Zz0vCchZ4xELVbA9Do0ISLaqcO9s0
         chaT3QjVp6nqDjvACfsdaB/470lEB4/zGU91udz1+ByUmrKvwJyCa0WvOe2wngQtGXpI
         5U6nZ7cDrc4OWTD0KNjVmi0tVmvVV3JHCpcPs15KHBo0hckS4XOXEEivjyOknwGlDtux
         lTqw==
X-Gm-Message-State: AOAM531nGjNTYPHKLjdgs4QenIjfb2rocs0RCHHjgtZuNMlQVdgFQivl
        /zQfTPSaNxSUnsVkZHDCgtg=
X-Google-Smtp-Source: ABdhPJwCJCSD3c8Pd+I3F0PbZtYQbcejnaMQq+8VDqmTDjbavzZbcEWTegTMSb6ylRTnkAyW2nAmHw==
X-Received: by 2002:adf:f24d:0:b0:203:ee8a:2160 with SMTP id b13-20020adff24d000000b00203ee8a2160mr33147049wrp.497.1648593010065;
        Tue, 29 Mar 2022 15:30:10 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.187])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d48d0000000b00205cf199abcsm2851970wrs.46.2022.03.29.15.30.05
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:30:09 -0700 (PDT)
Message-ID: <62438871.1c69fb81.a7286.bce7@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:30:00 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
