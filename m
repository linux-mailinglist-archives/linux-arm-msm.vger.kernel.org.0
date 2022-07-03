Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8CE564412
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbiGCD7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbiGCD7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:09 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26DDB4A6
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:48 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id q11so8907470oih.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/5lCOqt76KTquRA+hfoeu0rAVdN5qANA94ID5WSrmgg=;
        b=JGqJzU63tcaT7dfcH1l2opA5qPeBVXE5T9LVm8S/x0wqJRCyNJIxfReyT31aAh8QbN
         vHXnl+4kEz0vKX98raJu4sZVT2Drc0xuYpHReUamVwPH6O/Y+wiw8eR7Cv1SIkRQ6yiZ
         bBpWLsKMTtqNFh+rBEOuImhYc4LfJQ6MoqvsldJwBoDXQWEH5Y+kTC37XNgKiaM0pg0G
         cAMFNKH8SZobklTINQFdw5KpzTKQKgPwKFJTQ/1Cu4teKG9WgkdrKD2iBMZmgennTP96
         d957DU1c759eeHYCn4Atj7ux8RcUTKClsaLidVf+7ld89aF55ExUUrXgPvDBAg1BZYiH
         7afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/5lCOqt76KTquRA+hfoeu0rAVdN5qANA94ID5WSrmgg=;
        b=JIminGOJHRzaMwxVqUtf4BB/oXsk6cbzw8O1kJP18Nv0nlFJozR0MgyJBJNTqKOynL
         CQrh8eUpT9uvbZKGUp++qLssaigNaE3u0aU12ANfQFE4c/zMYJAHSb6GYmELhBoK0Bym
         XWFy7il88uKRLHThfaPyzlAVkEs10lMWduFcAY/yr5kR2LNdffWKoi2naaJySUA8qjEn
         wR622dk8KOP5irYv+oxxIhEZJIZnZtQHEKD6GYEV+c5Zbv7u2Gd0VgUUf3JLFVMj38Po
         GKum25SdUkGpe84XVnuv9wrzGMvZ84VVKLHR9De7g8sOhCyS1y/ucEy4ElEc2U5L0Ncb
         gKxw==
X-Gm-Message-State: AJIora+kn5O63mIurOJCfoQ1UBB11LA5Kg5GtN2K4CEz8N41mulqiaZS
        dAAlX9/g+Ci9R+NNHTDDN5NuPw==
X-Google-Smtp-Source: AGRyM1tDPRdnarjw4XpwYjiTHQ3qjxagfEq07XBtgFqkoyszLaoAJC+nG6FUzSvQbTQ/OZhVtTTc9w==
X-Received: by 2002:a05:6808:bce:b0:337:aaf6:8398 with SMTP id o14-20020a0568080bce00b00337aaf68398mr3056206oik.252.1656820665975;
        Sat, 02 Jul 2022 20:57:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:45 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     maz@kernel.org, tglx@linutronix.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART
Date:   Sat,  2 Jul 2022 22:56:39 -0500
Message-Id: <165682055970.445910.10348458712815687939.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220530080842.37024-2-manivannan.sadhasivam@linaro.org>
References: <20220530080842.37024-1-manivannan.sadhasivam@linaro.org> <20220530080842.37024-2-manivannan.sadhasivam@linaro.org>
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

On Mon, 30 May 2022 13:38:40 +0530, Manivannan Sadhasivam wrote:
> The trigger type should be LEVEL_HIGH. So fix it!
> 
> 

Applied, thanks!

[1/3] ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART
      commit: ae500b351ab0006d933d804a2b7507fe1e98cecc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
