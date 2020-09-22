Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8A827483A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgIVSfw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgIVSfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:35:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DCFC061755;
        Tue, 22 Sep 2020 11:35:51 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o8so24286563ejb.10;
        Tue, 22 Sep 2020 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/6CyOFP20UY15Iz8QDJdwyWLdhO4bKaeA/gA0Zeels=;
        b=EjZ0Z0cyfztnFQruvef1htbCxrqsfoExLvCtzWAeRg0me12yyKy8V/oAFFD+JM999I
         bvkKftVXTdv6XwnIzoNp3jEYffHE5zcUbc4iCBin/HKDH2maoUHuWo6NmpDcTSBAc2B3
         zmF343g36T0sjfGu1XgPc2JbB6gq60bULjxaDYqXyZzYEfpJfOfhaQBpbU1KRBoXWlW3
         VDKSfa/vKcJXKM0NQZi/ibq7vKrEPBs/NNeZa9MK61zRtBdOOkCfwMtjaosKxF4NmtSk
         EK8dDWVsN0Ion4QZ2eqjFtyZzOqRGFgMrK7r9NEuTGbM7tjc3STkMlWYjW8JfE1hv4pz
         GTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/6CyOFP20UY15Iz8QDJdwyWLdhO4bKaeA/gA0Zeels=;
        b=HUGCOFUva1KHO+UzihoMyB5rMgBNvTIIv7xkLrceiswq7hZzS88ZHXDsBaCf1TMwKU
         Y9ZhPZ5bRMkDXnIbYO3PvTMVV4AGgGEEqiWYx1bbiMVokgxbp/4w+xUG0vzC44MwPzpa
         yvav61tYupwV03hgkPYjLlH3/sF5IhMETK5Q0M9YA7PwB+gAbllgeL7v3687VPVnQB8i
         Kvke4KrUsIhNKB+Ej7AQ+zMdmev1hZjoIolfGKQIOeL+dIP+5U+9ac0bp07Czw7ZfdHt
         ycGznWCy1O6Ga1x+uBSdhj+b1MeY5zb8GlUcKz5URf+CrV22jsKW+7A71kr0YqrKuXrj
         0T9A==
X-Gm-Message-State: AOAM533yo/sQ8E0kRyq22j5vAYtPrep+6OUGLiB7Si/gF9JaaWxWhwwn
        hFCi+NFxFOrdIZ2kIBfOdrEbCFWjMfyRrMGrf3w=
X-Google-Smtp-Source: ABdhPJxumdDU8Z8DezP7vDqnyScxyf3YqhVMAmxLWkFuC+LF7SsrMGU0pBoC8ewRCraKlmXdUWla1WPKLjlHpNrrDfc=
X-Received: by 2002:a17:906:cf9b:: with SMTP id um27mr6507698ejb.66.1600799750499;
 Tue, 22 Sep 2020 11:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200922120909.97203-1-konradybcio@gmail.com> <160079963957.310579.17971187414769458107@swboyd.mtv.corp.google.com>
In-Reply-To: <160079963957.310579.17971187414769458107@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 22 Sep 2020 20:35:14 +0200
Message-ID: <CAMS8qEUNGV5YgAc1D054JToe2ybPX8o4kPC8zgDc1=O0cqY0_A@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Fix wrong parent_map
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sheesh, I cannot stop forgetting these...

Fixes: f2a76a2955c0 (clk: qcom: Add Global Clock controller (GCC)
driver for SDM660)

Konrad
