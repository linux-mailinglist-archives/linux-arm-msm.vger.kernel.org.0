Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289136FC018
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 09:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbjEIHG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 03:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235205AbjEIHGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 03:06:48 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2D5D2C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 00:06:37 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ba5f2522304so336426276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615997; x=1686207997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oj9FeSZbjZDDERlX4F2wATrCY6iOgGrSoNR2hEpg4Ik=;
        b=V3qxQRoQ5dg2GSgVl8xzkSiXHl8Nvxn7+MmafJp/dfBnwet4If7Q33e+4sFWjf7WCP
         Qu2RjbstKDHW5QPbG/fT9s889D8Vb6yXewQ8Y2qiL7OzaBVuo/YDjUnXdnp55P5jDsSr
         MsoF8wn3PBgTarl8rgnqFYMi9xNJnfYr9DrgIPjqc+Q84doIW2v2GmQ0oMMmbBMeJ9ng
         2eGM/pgxPZYz1cMmG0/6Liup/W8aRghFF3pxJjFuPke+rRkmIjOUcxe237YWkl+B464X
         SQsHy0QyH4Uw3FEUQe0Tx5gQeofp62R6w4uoOd+LB0JnGJl82BDAyuwmFUJ2On2Ou3Nc
         MJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615997; x=1686207997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oj9FeSZbjZDDERlX4F2wATrCY6iOgGrSoNR2hEpg4Ik=;
        b=Zt/gTyG5MkyjchZvotdgCtmsKur1i5Egcu/126nB7cFVnBUX5X4S105Iku3VKgfkbN
         PmBTTt87klzAW3c4vUrdpj1XJHiG7zZ6cEAt9RTOIQaia7RxSIg9uM/ECpKGSB+jeUja
         unVpUUOBmKimd1KPepdhlxHA0stVnTHBnJ23ukwHfI0TAdC/HdVJNUS1KH/rhA7Zj+Y1
         CJ4IYT/JmNJRZKPuCH0ZjcnCAw/IKhHg0xFIp8MF3f9KNJWFx+uvUxUVMkYYpjyhVZMG
         4wbLB9tuNNxj8S+lXXjPNocaDancSudb/KSWjctRrFyhVsyCuYqesCBs+SL+Rgg4mgph
         +TEg==
X-Gm-Message-State: AC+VfDyxB0ooZJkwlql0HT19E75ZehtLNtrc1HtEkuc++MregDDITa1c
        QLUkiUqUnW2I1lJjtPsZRNos9exK48IgfwHP9MR7lA==
X-Google-Smtp-Source: ACHHUZ7TsHWBdGV7F4XhxyNaFvX9oYh3DXjjlJcl8aI+J1OyceGeSYB3DGGRJgmUx+8vbt5xcFGF46i/AU64NCcLong=
X-Received: by 2002:a25:d706:0:b0:ba1:8b5a:581e with SMTP id
 o6-20020a25d706000000b00ba18b5a581emr13838261ybg.17.1683615996946; Tue, 09
 May 2023 00:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230430125154.126863-1-saraday@hust.edu.cn> <20230430125154.126863-2-saraday@hust.edu.cn>
 <CACRpkdZvTd4ibqhS2xQ_7BWLEkXzB_0qguccEV2X0d77KhC2UA@mail.gmail.com> <ecc36fdc-a87b-4b0d-bf2b-cfdd030b0600@hust.edu.cn>
In-Reply-To: <ecc36fdc-a87b-4b0d-bf2b-cfdd030b0600@hust.edu.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 May 2023 09:06:25 +0200
Message-ID: <CACRpkdY0EvVnwO9gxPxLPpFHPdrxWwNfNXtiiZzFNhUq823ZEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: qcom-ebi2: simplify the code in qcom_ebi2_probe()
To:     Ziliang Liao <saraday@hust.edu.cn>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        hust-os-kernel-patches@googlegroups.com,
        Dongliang Mu <dzm91@hust.edu.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 8, 2023 at 6:22=E2=80=AFPM Ziliang Liao <saraday@hust.edu.cn> w=
rote:

> Thanks for your advice.
> Do I need to delete the Fixes in [PATCH 2/2] and resend another patch set=
?

No I think Bjorn can delete it while applying the patch.

Yours,
Linus Walleij
