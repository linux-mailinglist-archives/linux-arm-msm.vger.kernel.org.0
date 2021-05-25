Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104733907BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 19:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbhEYRe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 13:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbhEYReK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 13:34:10 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59484C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:32:37 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id z3so31007938oib.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xhyQbxQiIDbXKL8bcaq+cdxjGQpKczxyo6wQp2aZBcw=;
        b=CLTda6dWa1UGW9Rl6A2/5lV5NXjgFZw25Cr1ZVCzPihAvyRfrnFEObTQh2aHR7HBZ3
         3nlxjfjikttkpTelUrmu6eEiChgGt0c+wN40+C2WZb4CGmFIJNZ2psRcyxjPzoVjC2Yy
         3DuBQWzb+XsdAxE4eOXSrseDyNHqbL4GZ+rHbuk7BcSEBNfCTahR8HpFzjWkDWsGPeAr
         /1KzfAKd220GP0Z3+KLNP09L2Mz2exIcUvyHzEA8hy4xHtienNwAuA1xO5ZOIITp11FL
         yjhVrN1v9s10Hij9+QxKsKxjsOqZ8KyYbWKXOfOISI14X5rZ3V1BOPqiD+2MW7R0DdT3
         TJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xhyQbxQiIDbXKL8bcaq+cdxjGQpKczxyo6wQp2aZBcw=;
        b=No6HlX60Rb3FBLRutWyWrVDWwl9L7kzojI0XYXB5UCWdNevHdaY2xcmGSQCAOEDS4F
         ZOC5P5YRj7BAhkYVm1bVUZPDxGUTJ5Rm5cGCc6gFFSYETF71I5yBFe8q+2PjBYpjYr50
         M+O7TS0rnyb284LF7QZfOFdrXtkOuckHCf8BtWIR3HycA/7RKmPZBnkHoz41A5kmTzwV
         SGLPK2uTWDrlprp+rQQWzdPbrtdROh/w06srJsv+Rl6+qWJvRsDy3NADGOxWRc/z6xTR
         j2e2fjrl7a9iXQkqfWb3Qwoh6A6FVO58Uj9G1O/2yWMlPzSbDWE5QE9UE/3y1iI0ryqo
         zTnQ==
X-Gm-Message-State: AOAM531v0Wf7p7jd9ZcMELvEOdaA9/iqP62ykFE2U+vNk9SgOnGYkN1t
        G7sb+6yniD4+Nw2Py4U3gNwVY/TA2o+lfQ==
X-Google-Smtp-Source: ABdhPJxqoozHJJ7wjj4F9r2dlkRutJ2w2JsSMNksb6X/yS+btuBXBvfHz7L+Q6xWYdVSOrT1Tt7ZPA==
X-Received: by 2002:aca:c64a:: with SMTP id w71mr3777569oif.44.1621963956700;
        Tue, 25 May 2021 10:32:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k7sm3666171ood.36.2021.05.25.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:32:36 -0700 (PDT)
Date:   Tue, 25 May 2021 12:32:34 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
Message-ID: <YK00sn1fvCrtVQaJ@builder.lan>
References: <20210510120547.1315536-1-balbi@kernel.org>
 <20210511044312.GK2484@yoga>
 <87wns5g0c6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wns5g0c6.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 11 May 03:07 CDT 2021, Felipe Balbi wrote:
> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
[..]
> >> +&remoteproc_adsp {
> >> +	status = "okay";
> >> +	firmware-name = "qcom/sm8150/adsp.mdt";
> >
> > For platforms where we have a Dragonboard or similar we push the
> > test-signed firmware to qcom/<platform>/. I presume that the Duo
> > wouldn't run on the test-signed firmware.
> >
> > So I think it's better to make this qcom/sm8150/ms-duo/adsp.mdt...from
> > the start.
> 
> ms-duo would look odd. How about qcom/sm8150/microsoft/adsp.mdt?
> 

Sounds good to me.

I do prefer using the non-split firmware package though (i.e. .mbn), if
you don't have it you can repack the .mdt + .bNN files using

https://github.com/andersson/pil-squasher

Regards,
Bjorn
