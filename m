Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17AEA45810F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237762AbhKTX64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237664AbhKTX6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:51 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D7EC06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:47 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso22680737otj.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NvHPEvBUT7X8A4nDahSdtNCiAX2Kw7Zr3/GHhszoORM=;
        b=QTR+U37RIGttPyJwXVRFtQ0cicXcf4O9Q+fF8ScQFIMirKu2mTLu0zjFDbSFbukB5N
         vwK88knrm7vNdig0HqvrzdsJY+kbioFTV4PYixUgpzjDzM9MgKTnsrKqNxMkpFcK8Qad
         R4FxUk7+2K0yD618uu0EuZKO1tW3g6ARCQjAyI2OHsYhcan4AdmzCSZMrKokepahh0Nb
         AnpXXYg6euNmrujnR5/raWe3z5T1mH4feazk4ukTxxL9LiQR7F6ASgc5jTdJGsLXmx2O
         /X0uTfk9B6aY1Rml/aNfKEyrfAmOi2AH1Wt6FCpV5ToFQfpdntGRBzLDqtM1y1fQmYsr
         Jilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NvHPEvBUT7X8A4nDahSdtNCiAX2Kw7Zr3/GHhszoORM=;
        b=cNpmBURP4qBew/71w0qkjJjFCM9ULT3wWPKH5YJuMJ3QCQuKnzjbR2S5AwbDOPZPXu
         bXND84paUWNlBy0qEvLc48zCDY2aaA2PQndXbsPpnyemC8LzXfBt7kFr66tDtDJiToXt
         XPh65Bwfg3SVBdLcdyeRl9BAY3gDAck3CJmUTPljipA2uNfoI28bnL+t6HFgWta6doam
         GuYMEnF+zSwWhpgM1Y+uPd04QgC8VMk2Js8Vohulstp083yO740fraA2V3imNM4vZ96F
         mPTdFr6fHoAtia9XYK0H+ij++BiNsw8kWdWtTv2eL0/dx+PBII44ow0HepmB9EcfKaWk
         mauQ==
X-Gm-Message-State: AOAM5312A9qSEhEcuejqsVMb/yABTDt7+jyRv3a7uG5LP/S9okUBqsmy
        qgIgQmEiBTeHVhs0FX8nSV1Dfg==
X-Google-Smtp-Source: ABdhPJxTBivkNB4W/MtcUo5nxkje6C98Fg9wM75Gtr5lea4Y+1pwNMOKa40MPCnIT8bGLYya7fBX5g==
X-Received: by 2002:a05:6830:918:: with SMTP id v24mr14480221ott.121.1637452546963;
        Sat, 20 Nov 2021 15:55:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:46 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, martin.botka@somainline.org,
        Kees Cook <keescook@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, jamipkettunen@somainline.org,
        Tony Luck <tony.luck@intel.com>,
        angelogioacchino.delregno@somainline.org,
        Colin Cross <ccross@android.com>,
        marijn.suijten@somainline.org, Anton Vorontsov <anton@enomsg.org>
Subject: Re: [PATCH 01/16] arm64: dts: qcom: sm8350: Move gpio.h inclusion to SoC DTSI
Date:   Sat, 20 Nov 2021 17:55:23 -0600
Message-Id: <163745250542.1078332.6005464366497866635.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 14 Nov 2021 02:27:40 +0100, Konrad Dybcio wrote:
> Almost any board that boots and has a way to interact with it
> (say for the rare cases of just-pstore or let's-rely-on-bootloader-setup)
> needs to set some GPIOs, so it makes no sense to include gpio.h separately
> each time. Hence move it to SoC DTSI.
> 
> 

Applied, thanks!

[01/16] arm64: dts: qcom: sm8350: Move gpio.h inclusion to SoC DTSI
        commit: f0360a7c1742681c390f2d94bb876ce80a8012b1
[02/16] arm64: dts: qcom: sm8350: Add missing QUPv3 ID2
        commit: e84d04a2b221153b88f644d98b5902c3705f5348
[03/16] arm64: dts: qcom: sm8350: Add redistributor stride to GICv3
        commit: f4d4ca9f3934844b99af289cf38d4892c73f683e
[04/16] arm64: dts: qcom: sm8350: Specify clock-frequency for arch timer
        commit: ed9500c1df59437856d43e657f185fb1eb5d817d
[05/16] arm64: dts: qcom: sm[68]350: Use interrupts-extended with pdc interrupts
        commit: 9e7f7b65c7f04c5cfda97d6bd0d452a49e60f24e
[06/16] arm64: dts: qcom: sm8350: Shorten camera-thermal-bottom name
        commit: f52dd33943ca5f84ae76890f352f6d9e12512c3f
[07/16] arm64: dts: qcom: *8350* Consolidate PON/RESIN usage
        commit: 2dab7aac493df72f57498044cb38ca0a6c18e7e1
[08/16] arm64: dts: qcom: sm8350: Describe GCC dependency clocks
        commit: 9ea9eb36b3c046fc48e737db4de69f7acd12f9be
[09/16] arm64: dts: qcom: sm8350: Set up WRAP0 QUPs
        commit: cf03cd7e12bdb43d624dbd55d8467b29e9b608c2
[10/16] arm64: dts: qcom: sm8350: Set up WRAP1 QUPs
        commit: 8934535531c875e6ec67876905982a44e8306c1c
[11/16] arm64: dts: qcom: sm8350: Set up WRAP2 QUPs
        commit: 98374e6925b88cfc4e528faed230a835f91a576d
[12/16] arm64: dts: qcom: sm8350: Assign iommus property to QUP WRAPs
        commit: 9bc2c8fea55c12d3720a80a59f99fdf68b8de773
[13/16] arm64: dts: qcom: Add support for Xperia 1 III / 5 III
        commit: c2721b0c23d975c73bce68d40435d66fbab19047
[14/16] arm64: dts: qcom: sm8350-sagami: Enable and populate I2C/SPI nodes
        commit: 1209e9246632d93f557c651110533bf44f8335f3
[15/16] arm64: dts: qcom: sm8350-sagami: Configure remote processors
        commit: ce2762aec7378892d398b784a4bfd4856dd71043
[16/16] arm64: dts: qcom: sm8350: Add LLCC node
        commit: 9ac8999e8d6c05826664a61bc89509824f45621d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
