Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2426547F085
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Dec 2021 19:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353414AbhLXSKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Dec 2021 13:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353402AbhLXSKj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Dec 2021 13:10:39 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A296CC061759
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Dec 2021 10:10:38 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id a26-20020a9d6e9a000000b0058f37eeb861so9312183otr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Dec 2021 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O+E1w+hgBca1POJJ3V7WgopBSO82CqmpublPBn7uXlQ=;
        b=Y/PW+6Ww6SSHO9pEv/h/fMW+QRkfMMQarxizT6K3x6EJCKFKWzm2qrgcXTwXuJ24rf
         4iPYkxEmxzFJucNKluuk5sVPHH6foy/LCAnHP3Shnc/LuhuhkN12mt4T3344tTD0YGNk
         g5SG8m5EP+yEb5PI3o02keKX46GWjeYvfKkdB490cnZNJ8KwLKmqXaTPLnepa4Uk1TfB
         pNti15oXos1s3jKQZ8fTmqkAhQIQ1dDX2PTwvIfRkNfrdsogo72BbZL97S3HA09LqJHk
         59O01WdgG0fLc2oCADooPiQlLCw+oiex6LQ9vQddlFxEexI2Hi9dzBbV+FVCF2+shezR
         r4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O+E1w+hgBca1POJJ3V7WgopBSO82CqmpublPBn7uXlQ=;
        b=MD9dxpxu9B/CfdlTmzQrefFhCOBN/i0eJHkK4SpBAzHOQDMeupEISmQAeT4+/GHTUj
         FGyYOISAhJkunYL5C7WU356Wlhl/9Sf6+P9TThIZj1cz5QMlZozV597KAunZdAar9yvV
         pkH2ibQBWS9wn0rS3DRP8Oy9FOiC7FB7+5vZIUAXExiJSlJxuQBvRJSp8fP0vbCLObMX
         woK1Ntj60U+y35kj5ga+tOn96Uk/JgYxlJl4vISW7Pra3Au44CQhqmAeJywTymoTbmpd
         A6pNt4EbTGhnd5JHkPCgDZMj8VHZMeYs5bCJyM2hAjzwpg62zczYAs6t6JjG1HmtHfuj
         nh1g==
X-Gm-Message-State: AOAM53374q3/jPJBenlfHLI0qyDa/Ok/j5ptiFR69upGAHuahkgRDc9Y
        VPmG04sUAPN7F7fVgfGUyYkNGldfX1M9zA==
X-Google-Smtp-Source: ABdhPJzcy58aEyxi+kpkVGGjeuCAvblEfeKTXjQa+cRZQkwV2Fcspki9WHDYTBSeryUiLK2beEbHpw==
X-Received: by 2002:a05:6830:1e13:: with SMTP id s19mr5383465otr.358.1640369438032;
        Fri, 24 Dec 2021 10:10:38 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o19sm1785949oiw.22.2021.12.24.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 10:10:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht
Subject: Re: [PATCH] ARM: dts: qcom: sdx55: use standartized naming for spmi node
Date:   Fri, 24 Dec 2021 12:10:32 -0600
Message-Id: <164036941060.3935440.6919654945648950806.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224162937.53404-1-david@ixit.cz>
References: <20211224162937.53404-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Dec 2021 17:29:37 +0100, David Heidelberg wrote:
> Following naming convention, rename qcom,spmi@ node to spmi@.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: sdx55: use standartized naming for spmi node
      commit: 4c444c21bf14a748466be0cf627380cb51cb6877

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
