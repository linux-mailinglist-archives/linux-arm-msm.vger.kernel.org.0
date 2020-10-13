Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A048C28D0AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 16:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730584AbgJMOvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 10:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730386AbgJMOvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 10:51:20 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848C0C0613D0;
        Tue, 13 Oct 2020 07:51:18 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id t25so117725ejd.13;
        Tue, 13 Oct 2020 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k3dP/jpo1Owd828LcFiwJioeRx4crqT7rWT/+gIFGrQ=;
        b=ims2lI8k+oSfPTm8c3OKq5H3Dgt/ozsmusTD7SU6wCa8+hg/C8OpKLVgtjtYnD2RGv
         YxDZ+Ef0jXduOCnv0nK4I2n+02ZxU1H0chvvI5k+76XGfmRRpD/IjR3Uc19J3y3abfWv
         VlGS4xeQRRoH3/5AMnj9TKclWZCE+T5eqVZrU0P0INOGUZrUWakJJW2F9Qe4+rqaEPHk
         A/FAhjha0dwTGogN4BleG2Pi6vcMxPLiVaXuze6/+3H+bnJHMCnQ7vSd7FM59MixgKV5
         DU4XIpJMRykPyOtKvSZ4dEY5pF9yTcqjMW4Ai4hYoierx+ikVjoROMweCg9qRyt1fDQG
         mxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3dP/jpo1Owd828LcFiwJioeRx4crqT7rWT/+gIFGrQ=;
        b=RsnQVtAneY3wd4tLt8/QWavu+zVUE9WiE51yFfIYWbBzEGZGDfhEbqn+99yeNfNqCf
         ZS8Jvj5qN0bap6qXo4Uwh35kL0Khjg4P0i/fyULPuRJ9B25gWgvOv4JIqjLzIoOj6i5T
         bX5gpYvU+vHAuxt4aA0Q4wd9v7qBZmJ4C3MJ7fLOkkl5OdvmewC9hbOXQwJkXqF7u9MQ
         MeVV1gF/QHKKfA4YuoR/xVxSrZvtYf/Q18KjKFyU2rS4h0Y66ZSjdJ1Mt3bpzvHczAMI
         ThXWRvMeN3bMH/WXUOqI2jUTd9Fafn0XH1qhnz+XXkei0Z75rDjPksevUgqJA9BGy8f3
         2iVA==
X-Gm-Message-State: AOAM530EuSnpvwgKXRGBEnGf+iMjHaf7KS57zAkZXTIYBxcFTsljqYgd
        Z6/9WMiLKHD8b3Je+e0PCOFIxHFvVmmuMfPqC1E=
X-Google-Smtp-Source: ABdhPJxGq/B+qxuFaeqBMSXMkkN1aT/Pj95XtxzwU12Jr4b7yWB6eTKTzwlwSqeYBkbnz23YvR4JjWLAZfx8i27c3U0=
X-Received: by 2002:a17:906:7e47:: with SMTP id z7mr112957ejr.418.1602600677230;
 Tue, 13 Oct 2020 07:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200926130306.13843-2-kholk11@gmail.com> <202010010401.JGjaiuVi-lkp@intel.com>
In-Reply-To: <202010010401.JGjaiuVi-lkp@intel.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Tue, 13 Oct 2020 16:51:05 +0200
Message-ID: <CADQ2G_H7ey8tfneOjtmDx1-hyzq1RvZzLeLZPtTM=2qOezrinA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: qcom: Add SDM660 Multimedia Clock Controller
 (MMCC) driver
To:     kernel test robot <lkp@intel.com>
Cc:     kholk11@gmail.com, Andy Gross <agross@kernel.org>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Yes, The unused parent map should be removed and resent.
