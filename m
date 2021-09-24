Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B47D4169F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 04:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243877AbhIXCYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 22:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbhIXCYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 22:24:40 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502A0C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 19:23:08 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id n4-20020a4aa7c4000000b002adb4997965so1134538oom.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 19:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAYAkbkNZo1Peyg1Lw8w9S8AW36p1FDE1eK2XpmXUvU=;
        b=s7LUn20R6YALzq4CYG9t/YFw6TtC6VEyOMQxS9UUw0QVUXmNHz593CGkeMy61E+IAo
         Vy+mR9N5tQDWHGD234kDWHp4D49AVaPKQ230WO+0EWpK4W0EK8fYP3XUoRY8B+uI91jK
         HD8v4orUdZpnRNtTimlK7c+/xAb+R0FAhPtydwsatPcoaVoaxoayFhEiNz1rxc6hgzRE
         gMI5uibBWxXUkGwCiMQlk9US7KaEI8+trYtp29obJtXgkvQt2t2L5c9NkWytMexVoAf5
         6TB/2nMwr0JUp5M5TKujPA8823YW3eJjcoYPKhbJMw29+/+4h081NBhLdnFSkZinHfIA
         VMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAYAkbkNZo1Peyg1Lw8w9S8AW36p1FDE1eK2XpmXUvU=;
        b=hM9pmJ5n5809FTwwXRtEeCizPQEzZ0GcmNXeO448GgqtJ8yx4CtYCtB1Rp2LTfLQV4
         aOvnDTJwtoVr2FlvunhJ21F8tPOXsr3YuHtPkekHH/X5DSBNASc1ZT0fZ1nW9inZ6jx7
         LFneH8pe6rLw+LfxfKYAaUISO6kiEuYPgIvmpFUIO67ClVN6QYozxyZMRTdhhANxvm67
         R3xRH+pDT2nx42/SFMp4Br3Uta/s307J4H5dVA8RpGRB/vuDyQVzlpuZRRC3kOEbBvW2
         p5XswL56Bn30dyFN0yw4Tj1HXQfBqjcbPXCvLw7/shIMKtWyAXWMg+8+Copetpm7Jf2O
         LIOg==
X-Gm-Message-State: AOAM533deyMyIMhiU65vobZSGgc6FzsDdZvKrz5cOwbUlEHX0pDJl+ib
        S9swb6otiBpDrjqOrCojkFRbUA==
X-Google-Smtp-Source: ABdhPJxGSV4VuO/mPzJ62qLVHmogryzSw/Pa1LYra4xGr0X2iPBv2REt9nXbPy4EP+xFv8xRfRNUKA==
X-Received: by 2002:a4a:6412:: with SMTP id o18mr6564774ooc.79.1632450187659;
        Thu, 23 Sep 2021 19:23:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r19sm1813147otg.37.2021.09.23.19.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 19:23:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     devicetree@vger.kernel.org, martin.botka@somainline.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: sm6125: Remove leading zeroes
Date:   Thu, 23 Sep 2021 21:23:06 -0500
Message-Id: <163245012732.850743.3717197322767814061.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922195208.1734936-1-festevam@gmail.com>
References: <20210922195208.1734936-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Sep 2021 16:52:08 -0300, Fabio Estevam wrote:
> dtc complains about the leading zeroes:
> 
> arch/arm64/boot/dts/qcom/sm6125.dtsi:497.19-503.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f121000: unit name should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:505.19-510.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f123000: unit name should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:512.19-517.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f124000: unit name should not have leading 0
> 
> Remove them.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: sm6125: Remove leading zeroes
      commit: 2e7586bab95f5d284867c35ca46c0f0c19ccbf7f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
