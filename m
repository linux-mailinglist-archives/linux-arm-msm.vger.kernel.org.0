Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15035697FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbiGGCbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234869AbiGGCba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:30 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630FD2F3A7
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:29 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id e1-20020a05683013c100b0061c1a6b8d11so85088otq.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oK2SJjEhTggYYxnFjeKyhMWpld2Shnt1WogQNz9ZWt4=;
        b=b8Nftf1+gVLUZADvs3JrrqWwzsMkxoFGpQdnFWO3PhmLgH3K5yJb1ttbkntWXhTz0U
         TdY18K9vAPZI0wCZGKLW7mO1IQbW7LZN0WCRrG85wYCEKvXoQVutNoRvkdXjfsBr8end
         xoKAJnI8aV1HetHS09dbWZa8HFInAU7096/9CiN3T9Fb7KOC6VFgTmU16OOdcUJWPCNi
         hZVZjRB9FSIOe+hp7L418286z0jPdxXtX2Z+ePa+XhtRrb46aY3MNP4CM0jBmgyrSYGl
         vRvUUA5AMCqvZWCCqksuRvMSn4HLYSMsx7fVSSjD601+vF92bSyyo1Mqee2CaOPv4WBV
         OGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oK2SJjEhTggYYxnFjeKyhMWpld2Shnt1WogQNz9ZWt4=;
        b=mJWh5/uwUY0thOXlXbR6f5IFEIqMmnh4Cd9r9bJUp9YkZIsbwszTMc/a73Ekzglfgd
         fo/Kp48BenEDLgN1hgFGTy2loWxE069OqtWU5NrgLCRpek3qnjD8nAvLPvVdUujbSvoU
         V3njFPamgc/Dw2UNoCTptPAS86VUX2jqZADUgQVgEx7sks2/P0pFk+XrtiM9Cpl/hNbo
         +LvbIZ3FrjcN9jgcUiyVDvXQeayho/0daySRW2tocHaZoSUpX0MEi4IrLwE0oKImgZKM
         +ZHgUuYlGgXn7/fwW+fN3k1ZaUhYgQ1hZUukx4PFiNZ4IV/RiZG1H3vyDfacs4trQePX
         QYaw==
X-Gm-Message-State: AJIora8fILAv7kkaUZQ3ptZeNGM5cgwRT1bYnfx0bUZOL41JEK5f8671
        j0R6NjIiYYoSe46YOGmSomtIuw==
X-Google-Smtp-Source: AGRyM1v98X7snoUpPNxjRFDKBjeSvqNMi/hq36nvn6S446lI5edKB+tuLs2dFVzRumbU9IU6arTtxw==
X-Received: by 2002:a05:6830:2706:b0:618:b7d1:696d with SMTP id j6-20020a056830270600b00618b7d1696dmr15965747otu.354.1657161088694;
        Wed, 06 Jul 2022 19:31:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: dts: qcom: msm8996: add missing clock sources
Date:   Wed,  6 Jul 2022 21:31:06 -0500
Message-Id: <165716107314.864223.11212990456023074686.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jun 2022 10:19:32 +0300, Dmitry Baryshkov wrote:
> Add missing clock sources to the RPM and global clock controllers.
> 
> Dmitry Baryshkov (4):
>   dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
>   arm64: dts: qcom: msm8996: correct #clock-cells for QMP PHY nodes
>   arm64: dts: qcom: msm8996: add GCC's optional clock sources
>   arm64: dts: qcom: msm8996: add xo clock source to rpmcc
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: qcom: msm8996: correct #clock-cells for QMP PHY nodes
      commit: b874fff9a7683df30e5aff16d5a85b1f8a43aa5d
[3/4] arm64: dts: qcom: msm8996: add GCC's optional clock sources
      commit: edb8e38ca99f198b59c967c9e26719198cea8bf8
[4/4] arm64: dts: qcom: msm8996: add xo clock source to rpmcc
      commit: 2b111e30c3b114d20ddaf3b79d07723fdedbe1a3

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
