Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F59B5211A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 12:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238057AbiEJKHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 06:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237339AbiEJKH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 06:07:29 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252422A83C2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 03:03:32 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id i20so18014397ion.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vjJ/DPgH5OA8A+lItdmXvfVjesRSStJY4gQ0upgp36A=;
        b=VqrhhQuDHo9GvwynUCC9zZUWzwzzNkTn060aD6MxPg3xaJbQ7icXR9MC7QH4A873dA
         5eTlQLvWsZ7544cWIgL5iJ/WBBfbdams5cb9iAngvsEsSpXgBIC+edBQGjs7vjp3hKi8
         7MnPhvMjBR99kqsS/9qNHo+itnuDX+PCAjLEHm9AWfhH0mX+2g3U0OTJ6TL9giwyfrZn
         N57czluHD1tYOrOuCXSq2ML18rR6M0RoWarx4Br5HllBme0tXpe6ApQQ9IQs3x/nFDS3
         lFEtGJERR6fzdJxNUKOPgp5n2AsaA04wsfQcJK15y6ja4TGJEMX4ndXrH2RltH7dQN/P
         pFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=vjJ/DPgH5OA8A+lItdmXvfVjesRSStJY4gQ0upgp36A=;
        b=GUaaYLZ4qVi0qunbhm+MnBbGvvoth2CP5yaeaZd0tyu98heYdvj3rC5tsWKuPS/H/2
         IH4XWqghhGcwSIgIGOIC5kviXlfZlAWHwY4N6TvqbyhYaqULKhUKJ+/phuaM9JtfMfvb
         zXxhluQtkJRz+bAOZnb5ISbDyRUDiqzo+ZIFtYUOOls1ReFwxvapUOczNgpLDJ7y4L3I
         atUY98b5urHfBqGojBXgAb/NEjg/N+7U0zq38tz2fTqgxfxspyh10FxVTRUvZFDhNB/S
         Z9VckmJjj4cCCYlZuQ+MGYIKqRlkCFM6WYafm1BL3m18Hvcb9HuO2Cme5FbzbQtbMz/n
         HbzA==
X-Gm-Message-State: AOAM5305+7d39/y/D1GhvMaWgRJZPNc8xRDMVhQnWjAcVLwm6LzEX/DC
        Yp/L/BL87NniBhtdG/ogfaSrlvPB+O7QTuMcFGM=
X-Google-Smtp-Source: ABdhPJwqsPBTsRDmi98OIrEPNIKP7tGhlIz6dXhzflhY+hV4v34Pq/Kakv9xyGQJrjzFrgh2zViU5/OM4hSrkAR+KjY=
X-Received: by 2002:a05:6638:25d3:b0:32b:7413:a64f with SMTP id
 u19-20020a05663825d300b0032b7413a64fmr9636744jat.268.1652177011508; Tue, 10
 May 2022 03:03:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:1ca7:0:0:0:0 with HTTP; Tue, 10 May 2022 03:03:31
 -0700 (PDT)
Reply-To: qatarfoundationendowment1@gmail.com
From:   Qatar Foundation Endowment <philiplawrence58@gmail.com>
Date:   Tue, 10 May 2022 11:03:31 +0100
Message-ID: <CAKhidwXzxb1POL=4+ZtQJVmpoLcfi14HNOKLHyfwtCpZf-uuOA@mail.gmail.com>
Subject: Dear Beneficiary
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DEAR_BENEFICIARY,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d31 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [qatarfoundationendowment1[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [philiplawrence58[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [philiplawrence58[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 DEAR_BENEFICIARY BODY: Dear Beneficiary:
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
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

Dear Beneficiary,

You have been selected to receive (=E2=82=AC1,000,000.00) from the Qatar
Foundation, kindly reply back with your full name and address for more
information;

Regards,

Mr. Rashid Al-Naimi.

Chief Executive Officer of Qatar Foundation Endowment.
