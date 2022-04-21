Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4959350A261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389271AbiDUOan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389243AbiDUOaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:10 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC533E5ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:16 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-e2fa360f6dso5557922fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kDgsoi129ZtoHuQ+rTXyXieKhhLblR7vzAhQBtHIUe0=;
        b=ZIujzzy08rxn0hfngK4WStnikFn+g7Y8IzH1/N6IlT+2UI9W380Cf+t8Q+6Un919it
         IFdejc4ql+StqfsY5urY6KtTu7RWIaGVZeK6VS3LHBru9TsebkCz+ztAVsczd089Y9dv
         6ewSdb4cH7QP4DrKkyHOb+vvlyccxOQuig3OHiFiMjZ12Kr5SYfNS8ETIYGLb3KqT4Cp
         7vG3o7Z6mwBvqbPCBXjeLgP0KLb+6NmBqpW/Oy8GwsNGVtN21g5zpPRn5oyJ1ObGiNgT
         LH2GnTWQ5oJQEBVvUWOAHjSWMjlN64UAFe8KZoF1p1loY6kTYs7UKsbDj7DW/cuSDMN3
         Bb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDgsoi129ZtoHuQ+rTXyXieKhhLblR7vzAhQBtHIUe0=;
        b=qtR4Fg8wk8U1VMIwfLBDLT7HCYMwCk3BEoCAhByIItKukeVfYS3MA0ebLtOW8gYCn7
         IecdSB5l+q46KmlW9jGy0s5eL7A625af2LGZj2BJZaOWGbGXQfByepIGtydtqr4bRdDH
         PAcm4g2f2QrE3pONpqos6t/nWsaASNFcEK9H4zU1t/GwdmC7bDIqaTg5C4MhmL07zwK8
         HaegR3oEcfSL5jsBmkDjWqJCVL60sDSvqX6aiKlXdIzI499dfX+9OW0KH2Ol7WXgMiV0
         Hs18Y8tkPkIQUCJYh2lOsPs+4ryzRkn+wTN6Iwu/O2ijvmRz1pVCDyjqYibCOmoeVOil
         iObA==
X-Gm-Message-State: AOAM533Ri+R3hODsZP05uOzzNvlF4bm7vP9MF+ZMXwTnMTYIVCXlIrIk
        V41I8UquACmO8GaGfaUyV168sw==
X-Google-Smtp-Source: ABdhPJzFW2dvWtIYFaaUj9JjINzXku3Vpzgn41MrM2kzsQSPJ4N6pSKOBN+zj2v9kPJ78IJW/RTSRg==
X-Received: by 2002:a05:6870:b427:b0:d3:5044:db1b with SMTP id x39-20020a056870b42700b000d35044db1bmr3815973oap.2.1650551236061;
        Thu, 21 Apr 2022 07:27:16 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Andy Gross <agross@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: (subset) [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
Date:   Thu, 21 Apr 2022 09:26:53 -0500
Message-Id: <165055095990.2574292.8144216013869218124.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
References: <20220401001810.81507-1-jo@jsfamily.in> <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
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

On Fri, 1 Apr 2022 05:48:08 +0530, Joel Selvaraj wrote:
> Add support for backlight. This panel supports backlight control
> through the QCOM WLED driver in Xiaomi Poco F1 device.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom wled backlight and link to panel
      commit: 89561886191c0dcb6ce1491f14552eac16e14a80

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
