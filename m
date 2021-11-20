Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E572A458103
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237631AbhKTX6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbhKTX6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:48 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FC3C06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:44 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so22717550otj.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QO/OD3/BBBiVq6Rt6KL9Los6v4OlbPeHntv5wk+CWTk=;
        b=YN9ZbBjpCrEKM/dofy7pGgADAJFwUMqyg97OxtBqis9Sya7/th6l/c4EV7GNtxPIT4
         gS6bn3B05grHr9FKsFWOvlzSW1zpTwYi6ghhNiXLAHUjqTLVVhHwqAagI1CmbNq4+UA/
         rTnTrw/FZ1dQ5EoHxCtISRK4so3i4zG1/SUR6CTKkHIoNGKucmgidVMK7tihNew5ocPt
         e2TTZlcsi0Dnio0air9QZ9IsD5FkX8jfuVNsBBP3cUHG106n3YHZfjp7bpePauG/GDeq
         0zEPNijFOfGoFDw9gn9D93Xq0n9efvd5GwTjtoen8ZUv7UtBZB5WLu+N97XAopRbK8Pk
         lWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QO/OD3/BBBiVq6Rt6KL9Los6v4OlbPeHntv5wk+CWTk=;
        b=hu+hzQ6t8KaWrE5MliUCaiKLlJab4OD9lEa5PRSHiFBCuZSXKeVSUGBjn1/gIVqoS8
         y878w/8FNYuFmFu1W90Lc5TUh2XlM3+oKgi+svQFp3W1pvlv5IIzMUYTW3sj/fF2GTD9
         de0BBVPZyK4SR1+/t9LrcPGSwa70NdRqgCTWwlfNMHixBcXiDUfZWIB3NHHtofEcPGwk
         MHbJ4RRJ4YLGcmGpmnQsn8JxobOTwf6NpIUHB+Gt3I7klWxpu4RUQxnfNu9iT1i4fFVQ
         9MEnP+wkMljrG/xv/kW/hlo9CHh262ndeCjtP6tHo75W37uECowoftuv9Veg/MVGP/zN
         pNkw==
X-Gm-Message-State: AOAM532360mKAQEp0UMju4YOcrFRMUB9gbU8K5l6oJ/wJvKVA3n03osb
        ozHrxiNNa5qhPiAhMXDEh3m8sw==
X-Google-Smtp-Source: ABdhPJyh2aY71qpZE1Yx4JOoxZ0K6ilQ3JI1MrvrA5exL9wf7HujlsShkJxHDpj2Rn9Pf+MOTnONSg==
X-Received: by 2002:a05:6830:44c:: with SMTP id d12mr14137190otc.66.1637452544114;
        Sat, 20 Nov 2021 15:55:44 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:43 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: apq8096-db820c: specify adsp firmware name
Date:   Sat, 20 Nov 2021 17:55:20 -0600
Message-Id: <163745250541.1078332.14837456552158244342.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
References: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Nov 2021 03:29:45 +0300, Dmitry Baryshkov wrote:
> Specify firmware name to be used for the ADSP. Quoting Bjorn from the
> respective apq8016-sbc commit:
> 
> The firmware for the modem and WiFi subsystems platform specific and is
> signed with a OEM specific key (or a test key). In order to support more
> than a single device it is therefor not possible to rely on the default
> path and stash these files directly in the firmware directory.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: apq8096-db820c: specify adsp firmware name
      commit: e2bbebf3b04c62fc3f7e64525c43bf5118a3cc88
[2/5] arm64: dts: qcom: apq8096-db820c: add missing regulator details
      commit: 7c57dcae949d1d39068f1e92233a9bc2dc7dcfba
[3/5] arm64: dts: qcom:apq8096-db820c: correct lvs1 and lvs2 supply property
      commit: a49c3dd1f7827fa7ee3a861b4292dd7d1c346fb2
[4/5] arm64: dts: qcom: msm8994-sony-xperia-kitakami: correct lvs1 and lvs2 supply property
      commit: 227ee1583ba4b3bb973e2a3e32351c242fdfc49d
[5/5] arm64: dts: qcom: msm8996-sony-xperia-tone: fix SPMI regulators declaration
      commit: 4c821bd42ccceca5e0fdc5491374e3d7e6941c2e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
