Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D204A4DFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 19:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350406AbiAaSYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 13:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349150AbiAaSYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 13:24:32 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E9EC06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:32 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id e81so28342389oia.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f6VOFFGj1qnMeMl99dR3lQJNjcE4yvoIF4l+t5DT8R0=;
        b=OeXIRCNrV9do1eoAS1AxMDagZMthxM01KmjRm6bMJeqytC2sbzD3OxvRBfarGecpB/
         uUrkaTK4DKTCwKxNfegcNWi9/XCHnVOj47BONhCqmRwVDiWRPPJdxcQB6a9v7b2DFyLJ
         cbP4iDRi2b3HfoPk5IqfXKPFrEjFMjr8q8E3LfMPk127i1yVmeBbSGYX0PjBHNZxFBaS
         77R/pFFWHehWAxoYl6CCFhUtn93MXwYQQJK+eLP8vffcp5CNBjSBVXXi1Fd7C8FgnOD/
         HAPyXh07TVQUATsnB8g+DzUzrv4npsNhqHDslcfIQd8aHTL9lbmPdL9dEV92X8O42s0p
         INbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f6VOFFGj1qnMeMl99dR3lQJNjcE4yvoIF4l+t5DT8R0=;
        b=w2JquVWTozEAXBink6x1vX9JgWvhH3zY9e86GVjO3uj753zbkoTiPxaviyAlfsyrzr
         aoGK6tp8gZGZDcSUBALXhaWBp37SdomGumUpNbIHfgLWOWg3nzr+i6wlblE/ANwOsWU1
         2iSLllrH+qgnKgVTr1/vzuGqkiN5vxBwPfdWff7n6To7lIdqkznVN8r7eac5+hZg0A73
         dVYFEkza/4XYpyveao0fxOqREt5KzOflCA9bCigAtPFFsXiL7Hoif3h/xYaEDPlzGSk+
         tITk2FwzhNDramxMiX7GBdj5P2ZuyC71XGhSXBToEMKigTEV7or6Tg5dF0lc4CPQ40sB
         K6WA==
X-Gm-Message-State: AOAM533zUQf+R63LP3o393CKBOxxfpgTU7oiyB7e5HF6fV6iD/hAftp1
        MciGh91qd5lPry/wDH4BPfkHXw==
X-Google-Smtp-Source: ABdhPJzk4Xf1Oqvbt7FyrQDJ8LZD5T6yYg72uBGLLyXtBwGsAGDJrK9Hp+VEdMHZ/VF0M0PF4bTjLw==
X-Received: by 2002:a05:6808:3022:: with SMTP id ay34mr98682oib.240.1643653471816;
        Mon, 31 Jan 2022 10:24:31 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:24:31 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     mka@chromium.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, sibis@codeaurora.org,
        quic_rjendra@quicinc.com, pmaliset@codeaurora.org,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        konrad.dybcio@somainline.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>, kgodara@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] arm64: dts: qcom: sc7280: Introduce herobrine-rev1
Date:   Mon, 31 Jan 2022 12:24:20 -0600
Message-Id: <164365345129.3009281.3222256950941436555.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220125224422.544381-1-dianders@chromium.org>
References: <20220125224422.544381-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 Jan 2022 14:44:17 -0800, Douglas Anderson wrote:
> This series adds support for herobrine-rev1. Note that it's likely
> that with the introduction of -rev1 we can drop -rev0 support, but
> we'll keep it for now (though we won't try to "fit it in" and share
> code with it).
> 
> This series is confirmed to boot herobrine-rev1 atop mainline, commit
> 0280e3c58f92 ("Merge tag 'nfs-for-5.17-1' of
> git://git.linux-nfs.org/projects/anna/linux-nfs"), though it requires
> a hack to work around a misconfigured DMA for i2c14
> (https://crrev.com/c/3378660)
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sc7280: Fix gmu unit address
      commit: 142a4d995c6adb6bf5b22166f51b525e83c96661
[2/5] arm64: dts: qcom: sc7280: Move herobrine-r0 to its own dts
      commit: 61a6262f95e0c400baee59ced0721f49ffca604c
[3/5] arm64: dts: qcom: sc7280: Factor out Chrome common fragment
      commit: 56eead37681511d3bd5c5869cf2878865942ba75
[4/5] arm64: dts: qcom: sc7280: Factor gpio.h include to sc7280.dtsi
      commit: 40ab97eb383dfd9de37d049883a8707397a478b1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
