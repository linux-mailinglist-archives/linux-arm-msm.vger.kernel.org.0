Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D60C46512D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350485AbhLAPRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:17:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350740AbhLAPQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:16:36 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7054DC061759
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:13:15 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so35568863otl.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v1bAQqZw2j6DbljrAtjNx2+gnKBHA5IQTB4CHYspsho=;
        b=PRKfGnJp6XEKBBypQcOXwVWpwuHkXUPx73cRbBTXN6gduKkhHK4SN8sqMeKLY7hR2f
         sp4srosoKWXkWiR3jjtlWqAh39zzBKbS78QBw7bYx/Ut8zQ9pPv+3EY4ZYrf+KT6FuwT
         JT7tr7qmdl5ZE353cIBSl49GkNYWXGAarymTNOQrriZXi9YZPEJ+iMWjjTAfu8Km9eL3
         3XooWDTkuwpiIHKmG/1PIgcNiz6rFtsZ5Fu6DU2N0VayoP5rvWhf6GIaxDK9rlEegBTW
         2pSe9Yf8a8g1d1zhKyKVyUT2yJVWIYQIC3whj2GXGciQJtdmT7VZ5QOurEqWXRBc4TTl
         emdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v1bAQqZw2j6DbljrAtjNx2+gnKBHA5IQTB4CHYspsho=;
        b=AtAfgDoYrDWr2DsPe4EKuevBDBw+edFXULS6+BhEOv1Nuq8p94EsLTKVk1HIZurtXZ
         n9lE5ZH8OwguEw22m+/j1HCKv6Peg7p/mFy1pgB5muoznxuneBQ3JlUsh515SjAbnxY7
         olIFtdROYXPIfeNVhJ9+8AG4poU5o/qRSVPCRwAZWklr73FFny3bQlFoSeDy9gvkr9oM
         4wysFZp1SXEiPpYE/rR51GMM9HPHBye3NDHnvo3YF0BZk10cv847CLxBCXZkxtqGeHo6
         LJO4K0J+dLyUlaGoBGWpEspjAndqUa0pbYekBm5522aE0K0BAu5MCJ5lzqgQX0qwnjLv
         eYug==
X-Gm-Message-State: AOAM532x1GriK0B2bbUtJGVTpfp2MMhGKigs/Auv/ZJfvJlxPiaBrEym
        z9h9ra9REqc6+9ZyUCdGXLKPt/Kb2Gsssw==
X-Google-Smtp-Source: ABdhPJxsVfA7xx1bfNc8w8inMDhwGDZqdL7Sb9QgoewtU8pT/Fk8uicsfKUNkv7LDP/dZU3nBBhdvw==
X-Received: by 2002:a05:6830:1397:: with SMTP id d23mr6231017otq.68.1638371594799;
        Wed, 01 Dec 2021 07:13:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id be12sm33933oib.50.2021.12.01.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:13:14 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, agross@kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, kgodara@codeaurora.org,
        mka@chromium.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: Add support for the sc7280 CRD board
Date:   Wed,  1 Dec 2021 09:13:01 -0600
Message-Id: <163837153033.1905338.2350146670308724583.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1638185497-26477-1-git-send-email-quic_rjendra@quicinc.com>
References: <1638185497-26477-1-git-send-email-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 29 Nov 2021 17:01:33 +0530, Rajendra Nayak wrote:
> Add support for sc7280 CRD (Compute Reference Design) Board.
> It shares the same EC and H1 as the IDP2 boards, comes with an eDP
> display and supports both touch and trackpad.
> Since the EC and H1 nodes are identical across CRD and IDP2 this
> series also adds support for EC/H1 on IDP2 devices.
> 
> Kshitiz Godara (2):
>   arm64: dts: qcom: sc7280: Define EC and H1 nodes for IDP/CRD
>   arm64: dts: qcom: sc7280-crd: Add Touchscreen and touchpad support
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: Document qcom,sc7280-crd board
      commit: 7a21328bb3ade238e35c4de81da3ad8d76437b72
[2/4] arm64: dts: qcom: sc7280-crd: Add device tree files for CRD
      commit: 427b249504ea48e9af2014df4b22fe8b31ddb563
[3/4] arm64: dts: qcom: sc7280: Define EC and H1 nodes for IDP/CRD
      commit: 248da168fbae5ab7294a37428256acc570ed552a
[4/4] arm64: dts: qcom: sc7280-crd: Add Touchscreen and touchpad support
      commit: 3ebf11fa4a355116eb2a69a46114ec92f245dbcc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
