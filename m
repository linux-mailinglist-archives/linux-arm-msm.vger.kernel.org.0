Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66604765EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhLOW3C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhLOW1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:54 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F64C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:52 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso26660724otj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gg5dt9Hb0zmVGCxzt79qYDxLV1X8hHdxfhB4BCRqFKI=;
        b=If3qcMg2hmilJ5t/ncMMC4tXSr2qj7UkQZ2BVxT7HA/8s2loDWn6tE54ZmpqoIYG2u
         B7gr7Hio6sRanlvaR514gNKeLkAU3e70T3KZVNlPdcZjZEQywVr9+3uglvJzLWgFP/ls
         0f4v9G7ML17TsiL83P0otWCh0nc7OXiGjz4b78JlrkjWAn1sS/K5RX6ATUpFHtgfgN35
         WbVgBA8nRPudu6/bJ+QZsL7KMmglfH7synT38l/xqGyCf8G/lk9wycKsymHYXiSIcrxX
         SRcx+7j75yw+FMxji3y7hQHAaUEHg82mQaXizjIDpJrMnfPEV+ijc8+hqtNY+hSFChWc
         D4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gg5dt9Hb0zmVGCxzt79qYDxLV1X8hHdxfhB4BCRqFKI=;
        b=L/jKkoVpuQHvh8+ISXDotF7RXgMsyt4xA0n5A3cSN/vV6Keje8PRxPbKIM8YiGrrnP
         bNRe6xLpFedMFRr+z6TZDkNCvHUJ3S3afAIRFCbg/1Vsi6UCYCcj/rq9s0GyxqwjqlAO
         z0PFw7x+V1Guy8GOxAFjp5FUL5SOvKnSVYYrWPf5O03U4y98Cgff79uRyxRyfNo/lsDn
         a6Iq1gejjDX6RdAqOPamP+ZnbvdyzC1hmENDtn6anS7ZvGylshekGRSmIhQ0n7TTBYmW
         mDJJm64R+a/E+hDsVMZ33t15fABXWi43+vBpulxz1E+GqYa+tCvbx+zEYiU7bDFK5BIk
         ldUQ==
X-Gm-Message-State: AOAM530JwXyw8faM1YGiEjHj70DQU/ImXntqPhVFL9Sjis5IUcOhBhJI
        tm5dOwmJq7fDeuvxOeof3xHFdg==
X-Google-Smtp-Source: ABdhPJzdf2xorUoiM+ivWUNh3hLFV/EliXDjTG8Z2XHINAWg7Gk7HQdPPZQmJczofyVwkP5eWrw1bw==
X-Received: by 2002:a9d:7a45:: with SMTP id z5mr10730084otm.209.1639607272298;
        Wed, 15 Dec 2021 14:27:52 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Katherine Perez <kaperez@linux.microsoft.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: (subset) [PATCH v4] arm64: dts: qcom: add minimal DTS for Microsoft Surface Duo 2
Date:   Wed, 15 Dec 2021 16:27:24 -0600
Message-Id: <163960723734.3062250.2855285450516465508.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211209183246.842880-2-kaperez@linux.microsoft.com>
References: <20211209183246.842880-1-kaperez@linux.microsoft.com> <20211209183246.842880-2-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Dec 2021 10:32:46 -0800, Katherine Perez wrote:
> This is a minimal devicetree for Microsoft Surface Duo 2 with SM8350
> Chipset
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: add minimal DTS for Microsoft Surface Duo 2
      commit: c16160cfa5651039f886d5cc6a6d9129e1fe789d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
