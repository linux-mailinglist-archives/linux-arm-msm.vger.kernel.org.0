Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886EF203E40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 19:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgFVRq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 13:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730131AbgFVRq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 13:46:28 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8D9C061798
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 10:46:27 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g7so13719611oti.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+PoE8yiRYasvpVTcmOB/KM09iEzE1JRP/lNZ3k5npcg=;
        b=X6lFlikLjM57gw/5/KFf4WYh17y5pOO2Nd1bjA1AMFtYVBiSjVsW17Tj/7u5AZivQM
         umURivbWdUVI4Dv1pVwIrReNSuJDyC8dR0afrvIcTuuK1sji1ftuMW+u/N+iz55GH/ri
         oUC58t4kl6Hgnf0uh3I6Ry4/7A2nmwlB+5U65UdHO5s4I2QtwUvUbu+Snhk64GJLrMM7
         k6So4J7ewwHay12xDDthdTKN8td7+Uvpz5QY94/U+VXmGzHCebhIrkUOGPNzWKWsuFRJ
         GT+XDOTxZY1FtkUsWFckwSq6dsLlq/urXW0nbXEjwWcs79Dj3apXWpEdcaCt5fRPQE1I
         izdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+PoE8yiRYasvpVTcmOB/KM09iEzE1JRP/lNZ3k5npcg=;
        b=IKPdEIvdO6DWKNMZ/S6pI2mjFIg9NoLPicaEsGhOjT6tFix6/MoXjGH92iYy7lruyY
         iaLwfdfyByTwFeZs/GTtRjScsHfdge3j+fDCIxf3HxcZpwEpB+E4HLvl48Sw2aM778/E
         A8NdbM9GUxezobzC72T+fjQdakQmE+cGLhy8FgGnYYIQTPgF6qmp98NnI3dV5Gk74Kwz
         U/ixBeDYbLxoas3Rhh7qxhhHebINBo9AVX6FSUBtpbWyynTKo4v+e6QgqZeYJB93OAWm
         zCPP/4RM00lRiLA+oAMSWixoFhKjxe38C2ckYGAZVgIPR+T9tqs8rqGXhWrYciwT0TXS
         LvWg==
X-Gm-Message-State: AOAM530uKy8+ativuQZ418M4MoVXPgBNlv+MGntzVth1bkidd2/Zf5DK
        U4KYTFN+4ZhcFnM6+6cYmReHmw==
X-Google-Smtp-Source: ABdhPJyUdRtRq9tztqPkA0Ij9COzUJcM37XZ1xYZCEeJmqizxWTn8SkN0elI/ub/TlCx51fdAkVsvQ==
X-Received: by 2002:a05:6830:4a1:: with SMTP id l1mr4509025otd.215.1592847986993;
        Mon, 22 Jun 2020 10:46:26 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e25sm3434158otj.73.2020.06.22.10.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:46:26 -0700 (PDT)
Date:   Mon, 22 Jun 2020 10:43:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/8] soc: qcom: socinfo: Add socinfo entry for SDM630
Message-ID: <20200622174341.GR128451@builder.lan>
References: <20200622075749.21925-1-konradybcio@gmail.com>
 <20200622075749.21925-4-konradybcio@gmail.com>
 <20200622080503.GQ128451@builder.lan>
 <CAMS8qEWrnHc3CWrW-vzwxu+PR8FL9hcvCtBpS4oK9ZYXgGfLJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEWrnHc3CWrW-vzwxu+PR8FL9hcvCtBpS4oK9ZYXgGfLJg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jun 01:37 PDT 2020, Konrad Dybcio wrote:

> Hi Bjorn,
> 
> you said "Applied" - so should I omit this patch when sending a v3 of
> the series or keep it in there?
> 

Seems I missed pushing out the drivers-for-5.9 branch, but the change is
staged for 5.9 here:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next

So you can omit it from now on.

Regards,
Bjorn
