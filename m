Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1BE35779D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 00:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhDGW1B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 18:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhDGW0v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 18:26:51 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E46AC061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 15:26:41 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id g15so368435pfq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 15:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=JXPy38tfqTqfc+T5dVpi1XXHqSqn3E1QM/6f1Rr5mOk=;
        b=i6oxZsrN2uHTsT61cNxB1nxF9hb2PhcteS0JlifLdBsW4BiSL+gbz8trTvNHKaMOMd
         3/SFsC68vJSzHmkLKIz1iOr39J4rPCDvKrNvyBpMY7oyk2c7Ca19WyluVDpR+chWCQk2
         +Gi9lZoKRprSmuvobSbozdQPP4be5kdldZf64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=JXPy38tfqTqfc+T5dVpi1XXHqSqn3E1QM/6f1Rr5mOk=;
        b=XHNXLKvlIry5IvmfzYSYW6u9eBjP8Ao+1SnTHrC0aRzkHf52QdMag1r9ymSppXDwhr
         Q9eKiFqTl574RandQOXMhccBb64pGIWkMEr6tYvaWaYvE19VlFDFRaDFXqKDR2bKONPZ
         B0bYqm4ELUCAGds1eMGiCVwjCmhsQZjSNMk9NidEtc5bSxfvFAxYyf7AtA6bLybw77IH
         jVw9rf4f/Ap/5t5ZRawPjjgLnr4CdV5s7L0ILVST9z2TTO43EpdZhEpWnU4kO8dQBdql
         eFvd121LH+DIXPim/QKSgWA3JGXInFdcM2F27C0WjEIIYQahOrJykOLWYTmED4qUgblO
         iLmg==
X-Gm-Message-State: AOAM531l00u7JW2ZZKWVNkaWnXi2ICkRNsj7fZUvCmD+kL6pt7WSU7SG
        NMtir0ZaqmvN26rgg5/zMfewSg==
X-Google-Smtp-Source: ABdhPJwuRGlxdxk1WdD4pe5eQF+zxZrxvAYORZ86RBH7fPDz58DVdW+JSKIGoISeFTHJhi0QYinqMw==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr5449733pgd.402.1617834400851;
        Wed, 07 Apr 2021 15:26:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e193:83c5:6e95:43de])
        by smtp.gmail.com with ESMTPSA id t16sm22857191pfc.204.2021.04.07.15.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:26:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1617774437-31293-1-git-send-email-dikshita@codeaurora.org>
References: <1617774437-31293-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH v3] media: venus : hfi: add venus image info into smem
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, bjorn.andersson@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Wed, 07 Apr 2021 15:26:38 -0700
Message-ID: <161783439891.3790633.10162001433140117260@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dikshita Agarwal (2021-04-06 22:47:17)
> Fill fw version info into smem to be printed as part of
> soc info.
>=20
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>=20
> changes since v2:
> - adressed all review comments.=20
> ---

Please address the krobot errors. Looks like we need a 'depends on
QCOM_SMEM' in the Kconfig for this driver now.
