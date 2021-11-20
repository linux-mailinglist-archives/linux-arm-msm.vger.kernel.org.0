Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CC9458106
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237614AbhKTX6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237601AbhKTX6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:47 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3799C061748
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:43 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id q25so29733132oiw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iYHIOkX3Z/UFNGHTYq531N1s+o3wyHd3Du2ir8zNPg0=;
        b=uXwi67dpbKoSDz97RtLqEN9PFKBB7tCe+12/UBJi4EDQs/LMax/osrE3nyqUWOQyT+
         iag9TJzqkU1olXigOSNC2B28v8yRK2o1uUW+QWM/nBDR36VfPDmKRntZiABGXMWGlvui
         gJeBEXR7OV3uM4KoDXtpHNGotS8UJE0wP+ztzNbU+Txx41Wv1ddf/fAUdVTw5P71ooKS
         By1PWLSJFoDd8v9v5RjNowkhpKg0I6x5dowbFqSjT+zceDAeIb1PxegM0j8+lPX2T5Cq
         5+0sdQU/v6m+Eu2pbLcVX+b78EbwUZ6XFTNjAYKUMWZrowZVoieMck6lEAdI5rNVmg3P
         XNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYHIOkX3Z/UFNGHTYq531N1s+o3wyHd3Du2ir8zNPg0=;
        b=7fDVexS4T+kMj06uQ46Cgi34gQ85H+hkk0OoflupvmCkrDluWPfjlmwSt/TupRJt1P
         avfci28zZY+iZapyJUTC4osSarCpGrbLQewtgcGF68LXI5O6OX/hH5lcNOTpkTaiKq41
         6XWibVbihiKSjj9IOg+rkbrbf+qcFE9kBVtBWmmvixwD8jE8XtcJh6kdWjYXDExYYos8
         xo84Vm8GPbokLSeZAQd+7FFaAmQriN0r4SZh87Emv8/I6p0vCAVuLQL1NxRhaVsuVXdW
         Y0shDwxGEqnSVtYw4+r6Y/gF7/JeAS/4C2N7BFl+tl52l2ifwREQcG5IjJcq/Pewxdjz
         U6hw==
X-Gm-Message-State: AOAM533gLiGAKAtVgLKV3d+U7NJgVAu9/G4xwwEkdJa6FbFvCS0QPAEl
        fKQ0/WfTJaRzRJOoS5QZf9+39w==
X-Google-Smtp-Source: ABdhPJx0K3PBQBM9kEBxb6PZibneT0sTfESRlFzc75xvXDvyPOZt2G+6QPds5EgFMsC3EW973zMLjw==
X-Received: by 2002:a05:6808:5cd:: with SMTP id d13mr10260017oij.168.1637452543218;
        Sat, 20 Nov 2021 15:55:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:42 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: msm8996: drop not documented adreno properties
Date:   Sat, 20 Nov 2021 17:55:19 -0600
Message-Id: <163745250541.1078332.4376238161221480393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211030100413.28370-1-david@ixit.cz>
References: <20211030100413.28370-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 30 Oct 2021 12:04:12 +0200, David Heidelberg wrote:
> These properties aren't documented nor implemented in the driver.
> Drop them.
> 
> Fixes warnings as:
> $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/gpu.yaml
> ...
> arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml: gpu@b00000: 'qcom,gpu-quirk-fault-detect-mask', 'qcom,gpu-quirk-two-pass-use-wfi' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: Documentation/devicetree/bindings/display/msm/gpu.yaml
> ...
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: msm8996: drop not documented adreno properties
      commit: c41910f257a22dc406c60d8826b4a3b5398003a3

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
