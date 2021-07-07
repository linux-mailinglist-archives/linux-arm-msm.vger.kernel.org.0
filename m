Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CB83BE00F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 02:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhGGALc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 20:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhGGALc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 20:11:32 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52E6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 17:08:52 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id j34so623169wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 17:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gla55/jHPuxQwImkvjfsRobqklhAZ+qfkkqKLknVHRo=;
        b=mOQgWePcC1K56tlv2aEBFfh91IJFrNCWRU5jA91FKOOzI74PclEHtryhKZPa6uIdmo
         yT+vytXiCu07rIgdx8zH9U7+pdoBVFfTyfXmL8sNceS1OhNNraOLbA7w7nhqgUPqrsut
         2IcnWwzTxT126zlekMje9cG1jJGVEL03HrZmQr5bQTM8YbLC/8RNdTjYg+4dk+HOYjZn
         a178qzfcrWfzoiJdof2Xs4qInKIse/cP4g16ZqRY13DB7WBJrs/xosOYXqOIxWeIo3m9
         OgGZTolqLqEyU07FSoL4Vaf4lUxGo97CbOjMg1394AiCJziHUZmhTMObXAxgfTnD5kzh
         zwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gla55/jHPuxQwImkvjfsRobqklhAZ+qfkkqKLknVHRo=;
        b=VwHcWLVkRLUI/Ox2Zu7t6hdKPZifAyZLjGhNz9/1vKsk1Om+mNtb8UtAAhPepEmWZy
         TsEWEnFDyZtg8ok29rILuc3R01i++9WjXNM/9HGw/0GM6HTGYggFkcxTumfp7myNpNtF
         yHsWnLYDkHEDKAxUAAmIMPNzUkahsg/OAq5n6mrBhNoMbCj/KMwyG+yWyZJO+DxFz2PD
         5qEF/17QmKKPM3cf2DiukuaK/UZCFlCpIRfW9OItMYnWSb1ypL3hWT1SlQMTgYeswVZA
         yHcSJ8Qh9dT8EFkeSs7JYW9zdj99AyYs33frkmQ6sDQFfnHWrQU4Skx9uSFtIRKvVhgQ
         83uA==
X-Gm-Message-State: AOAM533GIM51CUKGhDjWepiCRPJ/qSIHabIccMIkxAaPGWdt87zadx0J
        m/Mvpr0v9JvZaOQzBgUflQPecA==
X-Google-Smtp-Source: ABdhPJymF6fddc5+UbMYl591O+U+Nqqo0im0csyGJ7lPELRs2/bTi63/t82It4FkQWLVPrtmrdv0Yg==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr23123755wmi.107.1625616531204;
        Tue, 06 Jul 2021 17:08:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z7sm4319909wmi.1.2021.07.06.17.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 17:08:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: fix usb2 qmp phy node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     vkoul@kernel.org, kishon@ti.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, jonathan@marek.ca,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org
References: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
 <20210706230702.299047-2-bryan.odonoghue@linaro.org> <YOTvcWnHFkbMHg6K@yoga>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <701dfb98-b876-b5f9-cd55-c90d557e64de@linaro.org>
Date:   Wed, 7 Jul 2021 01:10:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YOTvcWnHFkbMHg6K@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2021 01:04, Bjorn Andersson wrote:
> So while Dmitry is right about the logic in the driver, it would be nice
> if you would spin this patch to make us pass the dt-binding check -
> which can be sent independently from the driver patch.

ok
