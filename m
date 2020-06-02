Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A7B1EC368
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 22:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgFBUGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 16:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgFBUG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 16:06:29 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AC3C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 13:06:29 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l27so14073519ejc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 13:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=2cvL0+Yd9yN39Q4W3Qqy3Rcpep61FLY3/TIOy09PrYQ=;
        b=ilWBNL6s/oqv/pCLSUhL8IL831D81QGaeiNVKp0LalmXfcBuxutdTlF0Cc5SKaDDl6
         tdO/hoPcG61TPtpylyPK3kBVMD/f1XfPjgfZr9ZO0wxs55mwF7xFscZ+9Pkz0m9MCRpS
         0TqpEQ7+odCILe4DjqorpWyhIhJnKNV2GaeF4kuk0OBrB+2Silo7pL0hJvQ1pa74Go90
         3TtFVFoJc7dGV3BLpr/raidOS4rfGoICmxCxgotaMjst7psccsp0blAyVko+xGS66rCM
         TU4gK+zRCT6bbyG9kC9nO3loifidqpus0Angr7i6i1D8h8h47bA8WUiCM5RuJyfQ4wI/
         f3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=2cvL0+Yd9yN39Q4W3Qqy3Rcpep61FLY3/TIOy09PrYQ=;
        b=fa7zaSdjTOXkZ6AqoxDkE8DHk6w3ouDXpct150zIro0QmHLvFt88ZmL9++Sf03lY2Z
         2XRScCcgjGKnkt+KMUNjD4S7mmPrOzwbiHhd8gefQf60P73GdMedc4b9yZJa1bScnDBe
         reRDmeQRRDSPEL9kgQfFWiK3jUjS/IaPbI1Wuj5yAM3euSSBbyam8itHoQ0QfoEe+7AB
         O9UKB9WvJXmD13qtl4pQGa56g7c3uIeVYAiSLMBnzilMl2psUnKAjVLvvKrOC8y/w2Ed
         BwF2O1vsmuF6+ZUnqjR41MKyoOa4wl/NK9WMGU854U1INDPWNPIec4Sc1Wm0a5EQ1znC
         12HQ==
X-Gm-Message-State: AOAM531UkzGfcUABfCHMKj8jIpwb0fKcM9I72GnfkIR4lX8vmjq9GaIK
        XlBstOd4Y1GOayh7VMx4Z836S0KlFngPlNw5Azk=
X-Received: by 2002:a17:906:ae85:: with SMTP id md5mt16518433ejb.213.1591128388033;
 Tue, 02 Jun 2020 13:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200602200407.320908-1-konradybcio@gmail.com>
In-Reply-To: <20200602200407.320908-1-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 2 Jun 2020 22:05:52 +0200
Message-ID: <CAMS8qEUOYuLfWTm4y9a2ZPJ2KyRs287jfkka0XntSWXyeZhgtQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] soc: qcom: smd-rpm: Add msm8994 compatible
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Interestingly enough, this compatible has been used in lg-bullhead DTS
for a long long time, even though it has never existed upstream.
