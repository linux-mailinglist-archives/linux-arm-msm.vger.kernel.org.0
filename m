Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF5C48AE35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 14:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239309AbiAKNNa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 08:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239294AbiAKNN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 08:13:27 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1279C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 05:13:27 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso5301674pje.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 05:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
        b=g6zwg//a9QU8vjOzOKacgn2iL5xpvHXnzvyoMJJqonQHGEilSNBXUqBTdNoO1aTYjU
         b8KuOsLvcB00fG7JAfXKPVJ1COa5NizMtapAXHBC73iLq7mdygnC1pQLX8+JI0/EjGPW
         UbufR7efyb7NWVALbe3gAk//P0jyrhnCgWwDRN4qGhxbJn3hfThUZtE2gvRd4BpTOtVD
         +ITvGaR6OJI2x+9jEe1bUDuK3M+257YvD1zk0mg3HLF0Il97cFEraY26TOpc+q23YeI7
         aaxXJE3P/6zANOZOVfS4CUdmndNJMgY/Xbm0NPd44G4qgiPWoxwho8kS+M8i+xABWtLK
         RiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
        b=H0a+Os6mNihEAACHC/zsXxDm34m2BgduTdyONGLGeNW/2zqOrFuIObm3baQn0yiBlz
         JYjXz8oAqxXyzd8VZ5G+sn4WD3SmL6PIrqEOLECUjP/OFAEKPxFqb/o3iWvoPCJAQvmt
         rBNztly1P4E0xv83jjB7cMoZ/5t6osrf3aAvsO8JxfMo+Rop3aCGT/Ynj7g8iXo6fbMC
         WxZtgm0I//fD40FXSJsE4eyfJozUDlUG8Tb2czTzM1hl4F9D/yAm48qZKQ04r5mMRRdT
         wtqlw7+3xzqzQizF6fBc/OXSsUCsqYgzEIzzZ8YJ4x3CydhWSIs8eebWzvRUEVBqfe62
         +j9Q==
X-Gm-Message-State: AOAM5330IFefHPnxUz6YmZDlkkqUK4MCzvrT30IziP5xJ2791/+mBaqK
        FD/EN2tOIcZTsQgsUPnSyJuqbUHZjucA27hAuadCJw==
X-Google-Smtp-Source: ABdhPJxwyMF6Tcvmo5uZdzwgEV+4XIb3H24TqD3Yn8Rz8eYeOQVprne/rnr0ys2qO3Yjqztj/DRjPOv1Kds7NiN1Vz8=
X-Received: by 2002:a05:6a00:26c9:b0:4c0:c8df:bc4e with SMTP id
 p9-20020a056a0026c900b004c0c8dfbc4emr733012pfw.1.1641906807193; Tue, 11 Jan
 2022 05:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org> <20220111125212.2343184-6-bryan.odonoghue@linaro.org>
In-Reply-To: <20220111125212.2343184-6-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 11 Jan 2022 14:13:15 +0100
Message-ID: <CAG3jFys7GdC2Un0zv2DjdhmOdWwQipYQm8nsTvKKsGsN9XudkA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] media: camss: Add regulator_bulk support
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Robert Foss <robert.foss@linaro.org>
