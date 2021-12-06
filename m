Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B19946AC26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 23:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357444AbhLFWer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 17:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356745AbhLFWei (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 17:34:38 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8DCC061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 14:31:09 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso15541366otj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 14:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gc3XKEdlwcQi21rErNXJzwZMgigjK1PyUPkJQEPB4SI=;
        b=cWPCB9Ra9CAor0a9Di3yqixNVVDX1o5qLCwHfZf2napJr6GbG5RNbBP/t0VeHfQdFt
         ae+vvfvYKJhxM7RHcsFQES+yyd4dkoB98d6WoMhVCo+HZEhx3OEday1x1yRfE6r6JMet
         E4EJl0Wzen4CYwy4zWLAKGsrVlkvHqZpsdXPOvpC2ZuTcsH8c09k2BhweO/kUdg9TrZU
         3U2nEYh8s7Sb2y9bB72RoC+gL7KHQhH6Ocx1hwWyvooicllIV67A1rNYaUgm7/A4Cp9l
         CX7TOFxmefvEhJMH5Kmp/psMbTL5jHMbXPO5YtKplN/arXEAOH/CQfsWM4Yk9XTNKJ/q
         kvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gc3XKEdlwcQi21rErNXJzwZMgigjK1PyUPkJQEPB4SI=;
        b=2VpxSFCmWAQMuN5KCRTCgDS7St558Vr8rmngQXiPALX9Z2Trl/uGHzf7+77ohcHI2f
         s6a7k8tHSJGpY5Un9XtMjuD/mVLiHWkEZhtkoyPxLdF0LOtQ7SgI7Xv1DFAaEDkWl/kH
         iYQPFP6dVyPcm+Fcy7pSjL8O5THQ728fKJKqNP8NKWEov/Y1aol3C6C8FjTS+Qzt0E8/
         7GhZ0QJykE4BEgBTyWxZo2ONNaXrLUkGTjZTZr9ZKrMoqaer/YBiNEu6inTxmEhjT7gf
         lnL1MBfyFfyVpS6WLTfAJy71ZKx015Lr7/+YtO/eDM8pEQwvU9CcgGViHFDQ7k51RSTn
         /GRQ==
X-Gm-Message-State: AOAM530X1rM3CA2IgtWHwbWkhNdmOG/IfugE8OzCb/3NJwdP+UO2o1vm
        sGYN6WQyJaOfGDEwEeoA7KOEKw==
X-Google-Smtp-Source: ABdhPJw29Gi11NTWTz5X7DKd8NxqD5kfh1TXsX0zn5LVjsDCc5qhT/eb9It0Ve9SzUQ0jq6Qgunp1g==
X-Received: by 2002:a9d:2d81:: with SMTP id g1mr32482183otb.25.1638829868719;
        Mon, 06 Dec 2021 14:31:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm2911815oiw.20.2021.12.06.14.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:31:08 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, tglx@linutronix.de,
        agross@kernel.org, quic_vamslank@quicinc.com, robh+dt@kernel.org,
        maz@kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: (subset) [PATCH v6 5/5] clk: qcom: Add support for SDX65 RPMh clocks
Date:   Mon,  6 Dec 2021 16:30:59 -0600
Message-Id: <163882985136.2324147.8953107100167794416.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <366448562ac52c600c45b5a15129d78b5e8dd5a7.1638402361.git.quic_vamslank@quicinc.com>
References: <cover.1638402361.git.quic_vamslank@quicinc.com> <366448562ac52c600c45b5a15129d78b5e8dd5a7.1638402361.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Dec 2021 16:21:35 -0800, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add support for clocks maintained by RPMh in SDX65 SoCs.
> 
> 

Applied, thanks!

[5/5] clk: qcom: Add support for SDX65 RPMh clocks
      commit: 40affbf8e615addd8cc877f0a4fff1faafc4bb34

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
