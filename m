Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F29E16495FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Dec 2022 20:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLKTLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Dec 2022 14:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLKTLI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Dec 2022 14:11:08 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1F0DEFE;
        Sun, 11 Dec 2022 11:10:56 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so23022994ejc.4;
        Sun, 11 Dec 2022 11:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WFk3Ha/y7pNYcZ4CQj5dPXoaiXBxGx8mxN+bqWFfNQw=;
        b=hFl5eTX7YDB4EXSzDfZEPYzixaGbv1lHC+PHFud4mhj4PJ4vuqIkKzusymJiAyQlBf
         gPY6mMUKYKysP09Y2Mg6vXZFxhXtHUZmhmWvNny/4EzIVMUygcQhe+GFbjbK/XeycB+U
         oRiiLT+sGW/t3yDeYrXYYjIEO+/d3uj2Ja5/uwlnLdrjU6GkoIm3w4sTOPPLYP285TH2
         QO3M16TloCcuBnfRitu0JgJnx0RqM9XPmwQtXoCIbZ3FwejzNwpnI8DDPDfdUrxm0Y64
         4aqC8onLitxAY4+k/AGGRcUHArNE3n6/zKfWstbJECTWSEbQONdiyOQAmmkz7zEsAYKq
         SVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFk3Ha/y7pNYcZ4CQj5dPXoaiXBxGx8mxN+bqWFfNQw=;
        b=GGvlfIz9pZy9Q2FcUrwLk3/J+AnKLBRlxu1nlGoAPfep6sZE0mVE4DiTbvFU1Ua8oL
         1gr6cbUkUqeXbKZlamiUaAFZ/lTGC8qkZBaPUSlUA90G/hsOeWBb+DkNVT/36WZSvV/d
         BB59+MUFBWAFhdlfF4hK/+98kHzTf+BGZJdaZtpUx0V7nvsuXQjzeND/T8C9R/5/5STu
         ZMhrPIH6dWZ/Z6PfVwPqgQ5ichrmiLGboWZCkUXGGeW9glvUB0sGcZVhIdszXD49mWAk
         iem25fs0w56FZhPXxFKcRYu7h89plpPRqtTQCwHDehjPrf5y37NJFoCf6j4FmNp9lqwq
         kM6g==
X-Gm-Message-State: ANoB5pko18ygqu4jhth6h1Xay5uEiYE8hbLX6omwXaDE13Ljnzaym4Zs
        Rc9ZtskCmmLo6xDK/rBWQS3ogm9tuL8NKI+o1FE=
X-Google-Smtp-Source: AA0mqf78LAlr0O4GWAmtaVYZZ2KAkMWCtMR3iEe+wWmoy+n8XwbmVqBCvod8lV+fwIXqmkJ3DqkefEHz2iAP9rtIUtY=
X-Received: by 2002:a17:906:e87:b0:78d:b88f:1548 with SMTP id
 p7-20020a1709060e8700b0078db88f1548mr83717588ejf.221.1670785854935; Sun, 11
 Dec 2022 11:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20221211100501.82323-1-dominikkobinski314@gmail.com> <CAB1t1CzXzt4idK2wkvF7hqXdOF=obkb7oG0Tu4PGwKYAX5nwNg@mail.gmail.com>
In-Reply-To: <CAB1t1CzXzt4idK2wkvF7hqXdOF=obkb7oG0Tu4PGwKYAX5nwNg@mail.gmail.com>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sun, 11 Dec 2022 20:10:42 +0100
Message-ID: <CAB1t1CxSG18tSockTLZaz6BTGXaEWbXZ2+EBpWSfr0HgHvxoqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: msm8992-bullhead: add memory hole region
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, pevik@seznam.cz, agross@kernel.org,
        alexeymin@postmarketos.org, quic_bjorande@quicinc.com,
        bribbers@disroot.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dominik, all,

Tested-by: Petr Vorel <petr.vorel@gmail.com>

Fixes all my problems! Thanks for fix.

@Konrad @Andy @Bjorn Although it looks like it does not need to be in
6.0.x stable, I'd be for merging it there.
Not sure how about the other versions (I'd be for not adding it).

Kind regards,
Petr
