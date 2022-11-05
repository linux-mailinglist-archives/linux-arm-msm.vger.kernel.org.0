Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2006561DA12
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Nov 2022 13:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiKEMjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Nov 2022 08:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiKEMjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Nov 2022 08:39:09 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C85017078
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Nov 2022 05:39:08 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f63so6588037pgc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Nov 2022 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=kq8TjKIfMuAddEcVf9rp0MAfAJKYgNJ2cBueguYMfNrrn5Y92RfhwFFtqQvsnJ25Za
         h8SiEvPnMYeYwSArc6GY5SQq2zL79mDe+hlmdrq1jqhbH32Nym17IyGJ74jGudUVTyjZ
         ZLa+VsNOq9rTzyLWrUxnZgdCFuXXszm94ql2h5uYD4teS2ObX7Ib8b3enSyx0rZvP7zG
         5FbHMpk+xlNrX2y2GPhcopcKv7ZR4EpypqjNop73JfuR6545JlmmQxS6l+camVmBR4vB
         Qcb7Ryy9wzPcpeWZUz6H6C51a26OjytDawXkXf5lh/Pu+41hWQfHFExixc8fiMddJWTE
         Lgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=GBA1MzEUxl+FZC9Y2pYNBY3nKNat00UDnrwcZp1jf4+nwaWX55AcnGzTwrq66GOtwU
         cVvJKer1kQxon3+qoQbsfww9q/EAt4PUTJmzds9tiyxvZKDzB0OqMUJnT7oc5J/gsflz
         ivoQT62IhoHhr691nDFBe2x055zxzOxdnnwo1NGFDjHRJkUkItnwtpAfpFLz7l7l+uvZ
         dQlZpL3O5urNyz40EqFTypKGN+OXEw0yhBYzo0l6khBGrLra9A3VNnl3SdeLFanQLHKs
         gMmROy+NB7JBRYckR6z4eL8WW4P9rmr3LOw0S+t4XlvCCrVnxH1MH/IvThC02tra+VF2
         H7NA==
X-Gm-Message-State: ACrzQf17h0GgMHVocZeHonWeS61p05437fXeA5tBOPOD+6pYG5kj2jmn
        y47KY5ksqUzq01eC4+QLl12O5ViYwJDmJbPE40o=
X-Google-Smtp-Source: AMsMyM5P7QJPc4xabig4w413XzwG+LvLR4ujBQF052MYyp4X4jLct43goqeG6nAke9/cOoRc7kMVFnOPm8Ba6LmlOPE=
X-Received: by 2002:a05:6a00:1251:b0:56d:b039:1f8 with SMTP id
 u17-20020a056a00125100b0056db03901f8mr23491834pfi.72.1667651947721; Sat, 05
 Nov 2022 05:39:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:2e91:b0:83:922d:c616 with HTTP; Sat, 5 Nov 2022
 05:39:07 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <wamathaibenard@gmail.com>
Date:   Sat, 5 Nov 2022 15:39:07 +0300
Message-ID: <CAN7bvZ+AZ+N2xWXWK-6rTbyGw_5yApLbz-J5U42mOWMbcyp4aA@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
