Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAD4B6A77AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 00:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjCAXeE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 18:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjCAXeD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 18:34:03 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6254A46148
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 15:34:02 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id i3so15758909plg.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 15:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677713642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRnbOushIGayii8e9TGHD8AmU4agQakFfKEOxWBRoZo=;
        b=evRAyZPfhF8pt9QwB2EGm3mqEdexSnOnOxQ+hq9/DxelpWGEHqXeJgEIPPYdxc/yLw
         SsgzjdTlqhiVgjLFT5qREnUiTmgGg+FBSum/VxL2YXwXXYyQB9OXS3brQGT/EV7tJxS1
         VQG1olQFAByH4KbC2bR5wyTc7Ho4UQmvOvcr10/pglzCGcDfsQay/zoE1Z8iWq1dcd2s
         YaOlNesN514nTspp28A4uUjpr0FJN+KZ9nwOL+RHwLVSNbuU0I/ZcWKUwG2uz67TxquO
         vtl0XuEr2Jzd/lwI+V/jSFYnacBIQa7JoTDFeQPZfcN0Mnci0F83fTmBVoZIZsMT3e3/
         BTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677713642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRnbOushIGayii8e9TGHD8AmU4agQakFfKEOxWBRoZo=;
        b=jTG5TI9Fj7eymYRnyjdN3Zxxs17vwGpS5AVf53GXXnbp9vqJ76be7IDRTmL2ieuqqQ
         7eyUAq2w5uQNV/t5ZY+45AJ8CRHHzTYXaDr6N49MmWcodW2Fiq5pFuF5Sz0tsoBbnuSj
         fThq+IpMS4BBhni9iEB1VgwTEmdI/0qhHuDv6FJ2TkVlF66UB5Yogx2mZBHD7LHyNeo3
         g/cHHmDCKNoWuJoM9Bf53PwZzaFgyW4ZSezZaOl+VQnpj+XaGt5iCChO2McIWLqDB3im
         ifA8uSP/YgTOrDINUsOGc3Hs/nyI0wqGYrzQznqXIJS/GY1QL5bJurNqs2ykMHEX7hMt
         T9Sw==
X-Gm-Message-State: AO0yUKX4ClMWvN+/tgW6+TXVTgvPbNud3d4oUA4GXwtdqzHU2ZVhK5TJ
        fm7ybgsrMCYiO2iXPT1TDkJC3ItsvvDdoO+gBP1P1Q==
X-Google-Smtp-Source: AK7set9vQaIGnJBnZuSGxWwvYgDfU1W97KSAF9pAQ7TcZ1kC9CiIP88cqyAB9y22n8IVJ6JkCmAvfbchZO2qI3QrgoE=
X-Received: by 2002:a17:903:44e:b0:19a:87dd:9206 with SMTP id
 iw14-20020a170903044e00b0019a87dd9206mr2961850plb.0.1677713641493; Wed, 01
 Mar 2023 15:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20230301075402.4578-1-quic_johmoo@quicinc.com>
 <CAKwvOdmqShYae=DrwP1JZBYXAYZyDB0SaOkVCvCzQC60MaJcpw@mail.gmail.com>
 <41d287fa-3a0a-cac6-4595-ad47ef873d79@quicinc.com> <0c92e7b8-e415-8ad5-14e7-d94f18c3fa25@quicinc.com>
 <b2055eab-4762-5fbf-8ea6-0956a0a2eb58@quicinc.com>
In-Reply-To: <b2055eab-4762-5fbf-8ea6-0956a0a2eb58@quicinc.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 1 Mar 2023 15:33:50 -0800
Message-ID: <CAKwvOdmUm8oEiiYt64oe0MY+H3U0TxpzVhWbhfvptTDkKHUFcA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Validating UAPI backwards compatibility
To:     John Moon <quic_johmoo@quicinc.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Matthias Maennich <maennich@google.com>,
        Giuliano Procida <gprocida@google.com>,
        kernel-team@android.com, libabigail@sourceware.org,
        Jordan Crouse <jorcrous@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 1, 2023 at 2:33=E2=80=AFPM John Moon <quic_johmoo@quicinc.com> =
wrote:
>
> With some additional help from Nick offline, we determined that the
> issue isn't with clang, but with libdw (from elfutils). You need at
> least libdw version 0.171 for the abidiff tool to work correctly with
> clang (in this particular case). Ubuntu 18.04 ships with version 0.170.
>
> If there's any interest, it'd be fairly easy to add a check for this
> condition under the check_deps() function in the script.

Good job John; mind sending a v3 with that addition, and the commit
message updated?
--=20
Thanks,
~Nick Desaulniers
