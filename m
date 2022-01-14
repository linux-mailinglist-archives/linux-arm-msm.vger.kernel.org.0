Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01E248EF43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 18:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243894AbiANRdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 12:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241472AbiANRdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 12:33:50 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2D5C06173E
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 09:33:50 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id c14-20020a17090a674e00b001b31e16749cso22813404pjm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 09:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NpkWfGVGqnc91YTgK3WlM5S8pWGG5vJjqMuZVdyWTiY=;
        b=GryrtVZT6GTQPVBnsyBN9dip7/snn5Inu5rK8omBqPJTRhiJy2LQrz5RS2a1PPTrKq
         PPEW91dcI+2puozvKu0Srwl0P1oaZCjFjRdA7TLZ+Yb4CKKM4bvGA2WrBV1oxjqoo9ou
         Dis7n2+PQvrDroMHSvmj+BSrJ9ivaqfU6O7jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NpkWfGVGqnc91YTgK3WlM5S8pWGG5vJjqMuZVdyWTiY=;
        b=vIUs2D/iFMjjHc8AJT//5KxO7WedjXPKHw64MnkGyWyaDDMwdopwBhZR4Pd/vENxie
         xaXTKTjAQSjjQWBGMxeTNh0W7CX2qNos3IzmRnDO2/HYCPIFKQj1XWpz6w9sUUzmcKnB
         K+0Kzg/ClLwBngZ58viezv4kqFrEmIruTeS/LzwVs46+FQQOlN/v+sYHYqgXS5jfxX7J
         0sRnvnnm0m1wj+R3zvrI5OX1GzWhvZJ3Cbd/Wjb7U1ZSUnLuzAe1hFMgYilPTf0PUJNE
         igviLp9X+Cu0EC3VaLDygEfC/jcaU4TZBDzOQx6O+bB6MYiMHtSwn1w7+Xw9z4HFoUtE
         WnCg==
X-Gm-Message-State: AOAM531HwT2OKJy297nbXSRxbyuKF/hnEbC2RA0PRQipexdAm5k/0eoB
        pwjQVWua/0Oj9IA0PTunC7ah7w==
X-Google-Smtp-Source: ABdhPJyuRSsUFHNVVNJZzR5cpzVwwv7EuqU/qi1pgH1A4aLiTLjJ+3Ad7B3EtY6bTj6b70kG8wmdUw==
X-Received: by 2002:a17:902:aa92:b0:149:6e0b:18d0 with SMTP id d18-20020a170902aa9200b001496e0b18d0mr10380502plr.34.1642181629982;
        Fri, 14 Jan 2022 09:33:49 -0800 (PST)
Received: from localhost ([2620:15c:202:201:a0bd:cd39:e43:7570])
        by smtp.gmail.com with UTF8SMTPSA id i194sm325306pfe.10.2022.01.14.09.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 09:33:49 -0800 (PST)
Date:   Fri, 14 Jan 2022 09:33:48 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, swboyd@chromium.org,
        pmaliset@codeaurora.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7280: Fix gmu unit address
Message-ID: <YeGz/Nu9VNlzEHBR@google.com>
References: <20220114004303.905808-1-dianders@chromium.org>
 <20220113164233.1.I19f60014e9be4b9dda4d66b5d56ef3d9600b6e10@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220113164233.1.I19f60014e9be4b9dda4d66b5d56ef3d9600b6e10@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 13, 2022 at 04:43:00PM -0800, Douglas Anderson wrote:
> When processing sc7280 device trees, I can see:
> 
>   Warning (simple_bus_reg): /soc@0/gmu@3d69000:
>     simple-bus unit address format error, expected "3d6a000"
> 
> There's a clear typo in the node name. Fix it.
> 
> Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
