Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A123612F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 21:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhDOTh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 15:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbhDOThZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 15:37:25 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8DCC061574;
        Thu, 15 Apr 2021 12:37:00 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id g5so31907805ejx.0;
        Thu, 15 Apr 2021 12:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=c/4p+bM0zLAP+YrYdOZMh9h6ZkPLtIwjMdXaY4pWQho=;
        b=UbRZt36f9qc1Gg0WDrGVuQCqzirT5lXduGLLis5SG9EzwTfHRwNCeap6WR/Pw+S4kz
         LYqmN7NMKEttfPb8HMCycyRvVIiol1cwTBHtVLwV+4QsF9Za9+csAHnyWBlsLEAO+fK1
         PeVuMaZEXXM43/BoR/oiZprVNN87jROK+BiRqIUXBhe3ikimr2z78IYLwyRvYhlfHWu7
         4SOgWQoQP720+Ag6YnPyYq0zKf5WrUAIs26V5Q5aL2M8YRoiVYnR0+zoJ0sRHC0R6tUG
         Q0GD8htKTV/O8KEw7Y11RG+2G6Ekd26jSPEHKunigUf6fGCo7vfFpsMyZkOMqrXrdMk7
         0lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=c/4p+bM0zLAP+YrYdOZMh9h6ZkPLtIwjMdXaY4pWQho=;
        b=QvVGxCralAxQUZ3X6LUTh1lousGgy4m8j/t6HVzqgclOq/GYVKFZ5Xw0bXq1J+Ajzm
         U8hwF0KF60LaUJ4f6gcyOnqHR50N6NmpQy5banKncy0pMn+IJpnrh50jVxVijBJ7ANyM
         xe7//hEcwmrLeNN6kZZ3repPTG4b1tDbUf2z3bCPLjgAP/JLlfKFF2xuJxaLfFkG7OaE
         4G0DK7WzLRAuxJ3RZ4YM5pg/H1C/1AMsQYM4ZVZodbtsuGwEzRJE72v+vmPgsO5IBU9U
         xPpBT3ZsyPjb1DtE7EE1LPUe47uldt90gbfoe1+sibS0DxsEZn4XJ7lxUh452thx2Rob
         Pdlw==
X-Gm-Message-State: AOAM532VnzSJYZaBlZv7D4aOywHZ4424DG7DyrHRXAtYatePx1EFiVy2
        naGmMrbJkhGcgmHTDpmasaNbCYfRpw838A==
X-Google-Smtp-Source: ABdhPJwS2DutvBEFm0jdgX/UPQ1vdccmi41tOuia3FifYvH7xOPLyQzpmbD6LnunztEkn+gdpigQxQ==
X-Received: by 2002:a17:906:5fce:: with SMTP id k14mr5217128ejv.9.1618515419524;
        Thu, 15 Apr 2021 12:36:59 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id li16sm2554953ejb.101.2021.04.15.12.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 12:36:58 -0700 (PDT)
Date:   Thu, 15 Apr 2021 21:36:55 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/1] nexus: Fix gpio-reserved-ranges 85-88
Message-ID: <YHiV12+om0h16f3t@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210415173957.28533-1-petr.vorel@gmail.com>
 <c55fc341-244f-9f77-4ba6-06f4ab7cd07b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c55fc341-244f-9f77-4ba6-06f4ab7cd07b@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

> Hi,

> the patch title should be:

> arm64: dts: qcom: angler: <blurb>

> or

> arm64: dts: qcom: msm8994-angler:
I'm sorry for this error, I'll send v4. Thanks for spotting this.

> But that's a nit, that could probably be fixed when applying. Otherwise, if the device now works:

> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Well, as I wrote, it works till 86588296acbf (from v5.12-rc1-dontuse), which
will take me some time to figure out why. But this commit is valid, thus I dare
to add your Reviewed-by in that v4.

Kind regards,
Petr


> Konrad
