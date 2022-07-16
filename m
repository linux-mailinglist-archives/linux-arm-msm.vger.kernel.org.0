Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026D7576FAD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbiGPPTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiGPPTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:12 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202931CB26
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id p5-20020a4a4805000000b0043548dba757so1422557ooa.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8kH3pgLnFI3Q03S7dHkBD2YLcz6O6vvlJjgyCE6+O0=;
        b=MNCY9+CXfClvtCMCD7dX0OIthRdQWflKBw8LYlLnKKnEF/6n/NmkmqLXsZoJCX2fK0
         BtIpcsIKM43xQ5x7kzKvXfSTy9GcqAF0H2I1A04i5/R5QUHJ7aUXmEWAWxkAfNQJcJ3S
         6XZjFufGXFg6bP7aNBDKG1GQoCzGg7p9drc3cLcukw4P7TlGVuu5b/yi/wlJnjOoYrhj
         4je6YSExjKn+8qdL5TH1U9aSyZaxpkdynLfcu9e8h+f7r9zxkOOthSkHM4gJBKAmMeOd
         J16b+httjc9jtr4zaC5KbA/SMGtek1jqLOoGW8qXKqEdL2YOMuNZZMTBdrJAfn05ha+d
         3f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8kH3pgLnFI3Q03S7dHkBD2YLcz6O6vvlJjgyCE6+O0=;
        b=XbJWJd9xvcDpTNls35nUSrVu0rx3jNQgmhpHp3kFy9lNvz0dtCAmgCLI4au/uMv8PQ
         2UIk50pG/j9g2DhvDzdtiUYTozht8cdHdBoaTfP7iTDMuN/pX+MBnqqSE8VBNdCzPr8K
         XGBdXUGg85XNLsCJP+8gymo+JJwHkIKcCz9360YTYgy7tHT+XcTnPr2e/k0xR7XPpzC1
         tgo9FnaUKFKPMTokC2A/HzDoY5G0qnRxYzXRRNEAlTTHWVFZmRUSn4M7x8o/FUQITPuY
         C9lQ9ACMTehLfnz3axevzK57klsGNShhxLqEULVWNyM9vUHR+l+bGEQhyhIV3B/cr4gW
         LDRA==
X-Gm-Message-State: AJIora92ejajiGoY7U5ZuABWL78bZI7ULbqkBw8bAcdxzPRD7PgQnOIL
        4bQNRSi1Cn7AqwtiVU5XdVm82A==
X-Google-Smtp-Source: AGRyM1tuz0kI68eN3KrZK4rUThcIh6vLC5BKSvPjh0k8tccjvae3nWlU4Yfp0DFwVcgx4hBdoRVM0g==
X-Received: by 2002:a4a:9b54:0:b0:425:9532:a772 with SMTP id e20-20020a4a9b54000000b004259532a772mr6720050ook.72.1657984750322;
        Sat, 16 Jul 2022 08:19:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add lost ranges for timer
Date:   Sat, 16 Jul 2022 10:18:53 -0500
Message-Id: <165798474063.1679948.18170735640327035103.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707160858.3178771-1-bjorn.andersson@linaro.org>
References: <20220707160858.3178771-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Jul 2022 09:08:58 -0700, Bjorn Andersson wrote:
> The timer node needs ranges specified to map the 1-cell children to the
> 2-cell address range used in /soc. This addition never made it into the
> patch that was posted and merged, so add it now.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Add lost ranges for timer
      commit: 769fe42092a68dc34c1897673e781489428a108d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
