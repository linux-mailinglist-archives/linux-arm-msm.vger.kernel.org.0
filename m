Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746AA41A369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 00:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238076AbhI0W6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 18:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238031AbhI0W6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 18:58:03 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8981C061740
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:56:24 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so24496999ota.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJ0UkhVUse0owYw0meU2mVKVFJcfpj5Elb4nNJo/rUg=;
        b=U6dcOpMzCitoKbfby6IB2+UU7U/AckDV50+5UbpLQC8KtuZLZ8lqUCfVzWhNGytk4d
         LJ4ElrRBRt9hEn5BLyqGyCnsR8UAOZdLkPKLInohRoIeRSYN3qGmNr2Hbk0wgvB/Mfe9
         w42dNltXmI8U5vtusrxRTcsiS9gjwnTCziwkE8y6pupEyVUf4c3/iPkg9qAC3u8FMVt7
         ET4G8oTG0CAfl1+xNBafMqimLZUp3KjFgMxJasXINF/5LVptSgwX2KAhEsucDRXFSFPr
         WdrncGGZ9RPBlZ/CiWGjKvrJuAeqf/wBuJibgmLHcFofJOPdw+v3gIkjhaRfWGlrAEN3
         7oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJ0UkhVUse0owYw0meU2mVKVFJcfpj5Elb4nNJo/rUg=;
        b=HcTHn+dfdAhczUQgkWtcbJUEAoQSsmb9ssrdLSqCK37KwXAo7ISqiFQ6MPKKwXQvfw
         gTAnGLdUnfo1r+up3jFycQz8MXWHf9ihkcW99S3bRHYPyo7j7iLUukguGWQaMR1NDJN4
         mAL7mKXnDj9cY9Faf0oMqd02quok4Sh3u0UsS/WquVUu7ClrRw2LzLsa+8t1Vuk+2IwX
         4scoPsNV9pBbpsf+NdujnQUNHiiwUfrP3OpkszLxgdTRDmo9IiJ31qfHVLDFh8Agzbt5
         pKUxxkH+XLDoev9A7Op6KJNNPxJE1SUEIr2PttCw+W95/VA0H5kr/aAn3EA0MOd6fx8R
         bIqg==
X-Gm-Message-State: AOAM533w7SrU5GLwP7tk+1aU1yHUXGpUdwTRNfv8Gy3/tnwmxC5iEuBy
        a/aLZVVovIRtr0VM3YEI0Pp1pg==
X-Google-Smtp-Source: ABdhPJyuTVvLBVFtId0sbqAztJopYbSNFfuNroaV6GsQ3dhAD8Sn3wd3fnjgzoj64LglgGhREAT9ZA==
X-Received: by 2002:a9d:74cb:: with SMTP id a11mr2254882otl.45.1632783384302;
        Mon, 27 Sep 2021 15:56:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w184sm4231084oie.35.2021.09.27.15.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 15:56:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: msm8916-longcheer-l8150: Add missing sensor interrupts
Date:   Mon, 27 Sep 2021 17:56:18 -0500
Message-Id: <163278329750.1522839.12342678140663941056.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816123544.14027-1-stephan@gerhold.net>
References: <20210816123544.14027-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 Aug 2021 14:35:44 +0200, Stephan Gerhold wrote:
> So far there were no interrupts set up for the BMC150 accelerometer
> + magnetometer combo because they were broken for some reason.
> It turns out Longcheer L8150 actually has a BMC156 which is very similar
> to BMC150, but only has an INT2 pin for the accelerometer part.
> 
> This requires some minor changes in the bmc150-accel driver which is now
> supported by using the more correct bosch,bmc156_accel compatible.
> Unfortunately it looks like even INT2 is not functional on most boards
> because the interrupt line is not actually connected to the BMC156.
> However, there are two pads next to the chip that can be shorted
> to make it work if needed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-longcheer-l8150: Add missing sensor interrupts
      commit: 51c7786f5d4201422e076b9a3650e543a61d36da

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
