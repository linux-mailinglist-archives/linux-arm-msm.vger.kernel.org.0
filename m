Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB114A5628
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbiBAFUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbiBAFUN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:13 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F0DC06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:13 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso15144320ott.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cx8fEVB8X8EesF6Bvy5LtHeQjU0eGcRlsykwpkoHgGI=;
        b=Z/ivLjWz+XanTM1yK2Y63SsPtGhseJijnN2oCrexxO25T1gu1UhPkFJzZDM41C+iHE
         znhJHmlsLfZqIucqi6bn8UpnIzctLLZXC69GWcB14OI5dMVqcf/5mK2JzkU2xsNX8pgr
         FpM/qld4PzQ7bQeo65KKusFAyM75ymaF6Lk8tZrqRQh95A50YUhFNc4m5HWUbvyDLm/N
         +Ay0cWt/8DqiZ6JYM1nqitVQB1Q6/WsKQNBN19tMBfwPwEtls9O8MiUHGWFWMkz/F77A
         7uI9y+OG9PWJZql2Xrb+4xMBw3gUEXWicbM80LCfnVRrY8rdgIpy5mpzTa9K1kJOTve/
         wWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cx8fEVB8X8EesF6Bvy5LtHeQjU0eGcRlsykwpkoHgGI=;
        b=ONb2QmiADH/lIS16rS4pEurO6vYGAlACwX4su51gCN58j8vxIls/1PaEiqc5jf2hH5
         oS/llrMuPSzcY/g07K83pi1+YswswPMW3YYv0q/xmnykQ1RI2XgkkOMpT5p+UaaeWHYA
         /e+SEA/tFXhf/bEhi609PtPDi9k3i2kN5l70Y2uXBlMmLAb8V0KlK2Zv7Qd4IxJZTTYK
         1bOhYdxRQCTB6cXBH2IUnIlEuvW6DHHeal1m4YNzLyCYqY4oaSm6Wz6MtrrH3WIx/TBe
         KmFPjj2PHO88Fhfztgpoy+e3pU6zaGh8GMqfAOm1DlYjUT4UsnOGrPzx8kNVTuHU/aC9
         eSUw==
X-Gm-Message-State: AOAM533pNeFVQDs1FTRTy8Mw3Xzy/ZpUrwmrFm/uTqWz85iCAjCiYjn6
        2cFGWbawzlOqbmQNBObzG73JOQ==
X-Google-Smtp-Source: ABdhPJy0LfI4jZMHzaml2YQNVRzNO2LuHftEv2Pju3MWi2mzlanzeFfH3V4ky9Z76VrJ27FL7e6aUQ==
X-Received: by 2002:a9d:6d07:: with SMTP id o7mr13214068otp.363.1643692812815;
        Mon, 31 Jan 2022 21:20:12 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:12 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8350: Correct UFS symbol clocks
Date:   Mon, 31 Jan 2022 23:19:22 -0600
Message-Id: <164369277342.3095904.16603287886524385869.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222162058.3418902-1-bjorn.andersson@linaro.org>
References: <20211222162058.3418902-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Dec 2021 08:20:58 -0800, Bjorn Andersson wrote:
> The introduction of '9a61f813fcc8 ("clk: qcom: regmap-mux: fix parent
> clock lookup")' broke UFS support on SM8350.
> 
> The cause for this is that the symbol clocks have a specified rate in
> the "freq-table-hz" table in the UFS node, which causes the UFS code to
> request a rate change, for which the "bi_tcxo" happens to provide the
> closest rate.  Prior to the change in regmap-mux it was determined
> (incorrectly) that no change was needed and everything worked.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350: Correct UFS symbol clocks
      commit: 0fd4dcb607ce29110d6c0b481a98c4ff3d300551

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
