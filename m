Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA656018D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiJQUKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbiJQUJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:09:50 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0C82B1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:20 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id x13so7385967qkg.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FVNAJsBy5Xeh6Zx2ZwrnOcJ3oyCxrYa12VWNGDy4jM=;
        b=Drsb00NlRo21B7O4IQl6ei7sw5FgqNB4BKyj/WYoSTCLVTRmHi2Yk9xg0PgT4KW3mx
         VqSuazBgZUKvg55nRvy8pGnRgr7GnhgLZs+N3Dq3o7QYP17fPi182Mrjr2sG89vdzh+k
         3++8R+LJcqAmXbfZVXELsOpAcA987b4FITk5Cc7kMM+eohU0odBtzku8gMcyGtmv/N9X
         wFwUe5tZ3QOkdPG8nqWnyEPbBVVLuksWY9K1tMoWcR1u0bPNs+4bbNXckmft+lwpnfqu
         PA31mMCtMzGmnhm4RtlHIvrDfNPA6SwtkTZ1wbB04xujzfZN+1fcQWDdEdIBN74NkXhg
         RP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FVNAJsBy5Xeh6Zx2ZwrnOcJ3oyCxrYa12VWNGDy4jM=;
        b=6jolW/JgQ/f9zHI7/eKoteMbstIBdzlXNCQAyaaDUtaysbmkB8UyyoSiyAEeOYq/NO
         lLgbkSuhLPSsY6Ty4VYd4UiW20WHUgojRbe+aLlR7Lx+G/WX+DSVScOxjMDx36nwnjZ+
         PJjeaLfVq8+lTwP0LY3mjXHqGYaYAFc198gujzydmGEsxn5FA+8zDTh9hRCndcEnVNHm
         mxe7itLWSMGDRVNdV0zA7JaH8lvIaNI+z7ZHUl0PpettB/Kokxlrc/0g/brpXwEpYbEz
         v9aRF77aH2fsD5ylBfqbXIYn9EoH2B+DYi557iv/fSknrgbs1o1WRMpO5nYmhuKMVW/0
         w4eA==
X-Gm-Message-State: ACrzQf0HWHdPPAGcMEOCCiW96IKPrKOe1XgY3N5/+YOmdG5cKdOJL665
        IlYTS9y976AKastTAQwUWn6l7Q==
X-Google-Smtp-Source: AMsMyM75Y0UjjeM2EUB5ctV+tOW9A3e9KzvK1eA9Djd5ZnUpsIHnjVMFzIMerTjWt8Q0dp8/sotrJw==
X-Received: by 2002:a05:620a:1f3:b0:6e9:e33d:3bb6 with SMTP id x19-20020a05620a01f300b006e9e33d3bb6mr9173008qkn.115.1666037344822;
        Mon, 17 Oct 2022 13:09:04 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 18/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
Date:   Mon, 17 Oct 2022 16:07:59 -0400
Message-Id: <166603728602.4991.3551400728577673146.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-19-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-19-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 16 Oct 2022 13:00:19 -0400, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.  This method also unifies
> the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.
> 
> 

Applied, thanks!

[18/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/07741416a0922197899696e1a109f0cc58d4944d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
