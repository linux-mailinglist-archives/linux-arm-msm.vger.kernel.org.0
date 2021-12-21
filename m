Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBD547B953
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 06:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhLUFVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 00:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbhLUFVQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 00:21:16 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3F7C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 21:21:16 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id v6so658277oib.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 21:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0QLqAoDKJsg1dGUMSjeCS+VGE3zdkPwHCp3Bo0q8/Ak=;
        b=KAIclTI4evRp7nT/4Q2oXMJpDB91p0ZIn4twtJwsS4q1/7NUBqlRw63GEDbEQYsIjJ
         puOrQw2zD3a2ZJyG2cUBTd3UjIumwWFB9iQEPpReo3qTvhNe/qtmXyBrrztmbB+nHqV8
         sy1Mg6ubU1JsOZwdqFIpPbafrfhAf+FCpGAtgG2DSIceXXlTSwEeZ3WsxUN6HpqMk+6y
         Xo8L7il/NQ9hNS/kFDHS6D6P5vAFR70K31CqTyZd7hkDPUD8uSiUo+Tf/jdGzSzY2ZIk
         PR++DB+XTDRNhHffJ/j5J/flv+HrWOYsrvGwqcwq3/oP5+A0mAXki7YPsK8KvKo+gLRy
         1U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0QLqAoDKJsg1dGUMSjeCS+VGE3zdkPwHCp3Bo0q8/Ak=;
        b=N+hXlfV3Pz+Fzg1S23xGFM4UuZG/5BcJgubMIng9RzHzO7hxQQldG58D4cH1SzDBnM
         s/GssEIYZHcWpSLl5bPlhog+iKdYwIBtUTTzsbAWFuJ1R/YfaO4zYxuC3K2tNSX0l08r
         /pzP+NJTk8DWH1Sfjob1SeYA4tzp72OEZMnO3VEJzm0BxLU+r+tQ8uuMNQ0KVMMWFPxl
         eP6ZFw4CW1JBsEHW/HX2rkiDZEupJfkh+GJU9Q+gOWb+maeJJxm3B6J1oxJVkQqoB9Yy
         d0nGPslyFDAJA9yUWDKY8+B9utgOPzKOujM5pNPxTAHKxAvT7UGtRua2MOCDNEFeKKId
         YqsA==
X-Gm-Message-State: AOAM532v+mhpQtk+u8AeY/DXM9NoHnRYwO63H6J6+mfgde8iSWPQ1pZx
        F0GEZjHuPgd2YgLCSnu8PeAc4A==
X-Google-Smtp-Source: ABdhPJy2gEnobqFmxzYDnJiuxK3331uFIFx6DfpPWtAfKuAgPn4eO74/jjYysHmSWrN7sYn8H9WKJA==
X-Received: by 2002:a05:6808:1454:: with SMTP id x20mr1132268oiv.166.1640064075732;
        Mon, 20 Dec 2021 21:21:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v19sm3573867ott.13.2021.12.20.21.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 21:21:15 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8450: Add usb nodes
Date:   Mon, 20 Dec 2021 23:21:09 -0600
Message-Id: <164006405161.3630669.2656550759295128918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216110813.658384-1-vkoul@kernel.org>
References: <20211216110813.658384-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Dec 2021 16:38:12 +0530, Vinod Koul wrote:
> SM8450 features a single USB controller which connects to both HS and SS
> phy. Add the USB and the phy nodes for Qualcomm SM8450 SoC.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8450: Add usb nodes
      commit: 19fd04fb9247fb5dce01919fa83ed037ec569247
[2/2] arm64: dts: qcom: sm8450-qrd: Enable USB nodes
      commit: 27a0d0b846d9add93a65c25149aae14ec3f75524

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
