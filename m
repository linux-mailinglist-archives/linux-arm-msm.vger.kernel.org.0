Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A59E5693CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 23:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiGFVCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 17:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbiGFVCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 17:02:22 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE7224BCF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 14:02:21 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10c0052da61so12103241fac.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K94orOTf1bd5RyK7KjvNxWS9PtX/Y2Xk860it34DNAw=;
        b=WsUTBbudtDtkr5NNz1el2KHueY2rUJRsGmc92WbgHUHfOJVU4aoKLzFGE/jKiXoXA7
         SE/nygMX6b2mdDt9p40zM+l7ohjrknoxadbwAZ5jRnpAoIcZTgs+ENJl3X7y3+bDEO0F
         m6GX6RFpt2lv7ESOtUmBy3VhtcU2cJh4OMZe9zBiycy3LTzpRisTo2wt/cK7CvWt7GGs
         DeldDZ5oxpP5+B91h6xYnmjlxFtWaER2SC8VpjFAMOLk4aOFAftpqAV7smY+l7iraL8h
         PEA55fTGmek0bSBqsWyYO4SQN22QabbxJJPfSO8b9ch6dpeP56ZC7i+nri+FaA80KqSw
         YuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K94orOTf1bd5RyK7KjvNxWS9PtX/Y2Xk860it34DNAw=;
        b=HeWWmfI3c9nWNtPU2jiq4MgBfCOiHu8ooMS/HgaTsvx2ExR76bYapCnVFCSFr8r9ca
         ny8sTLGSho+OZC+gO9TBs6YfnRCYKJ2oxAH8Sy+1wYswvpA4+8JOj83je7ymEvyLLdtO
         dH5Vipp568/fR6ZGe/0t9q5sizeQqZ0Ds0wIamr/QRdNnvZTIkBZcBVf9uJkVluhHGT6
         kkuC0VLapBFZajGGTrjugKfpNW9ZszoSTge5+F7B2MC7y8HecoYonID3WjB0aswXklOx
         8QP2rqYqNIqGwtXbA1At+d8TRibdVKZDKO9kz+yp7lEcs4NwxFfb7UZ6KPUIvMAj1W4Q
         /n0w==
X-Gm-Message-State: AJIora+9z7ZN7UJs6G8EqVleep3heChP1llrjBlAmWrkf45IDW6O6vzE
        NDrHgbHrFpSG8NRsmlVsWHXxHw==
X-Google-Smtp-Source: AGRyM1u8K4M3qtXswtrd3TkL6FhDRlbVax+yZRy0eZO/gGZwQWWi3wWzHGUmTQTsVzjpIiBlqDkUpQ==
X-Received: by 2002:a05:6870:40c4:b0:10c:24dd:f24e with SMTP id l4-20020a05687040c400b0010c24ddf24emr397488oal.191.1657141340682;
        Wed, 06 Jul 2022 14:02:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m28-20020a9d609c000000b0060c0b3c1b2asm17022444otj.33.2022.07.06.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 14:02:20 -0700 (PDT)
Date:   Wed, 6 Jul 2022 16:02:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sc7280: use constants for gpucc
 clocks and power-domains
Message-ID: <YsX4WnDgXSokH4Fk@builder.lan>
References: <20220706145412.1566011-1-dmitry.baryshkov@linaro.org>
 <20220706145412.1566011-2-dmitry.baryshkov@linaro.org>
 <4e61ab03-6edf-c228-78c3-d250e36e8556@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e61ab03-6edf-c228-78c3-d250e36e8556@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Jul 10:43 CDT 2022, Krzysztof Kozlowski wrote:

> On 06/07/2022 16:54, Dmitry Baryshkov wrote:
> > To ease merging of bindings and dts files, the constants were replaced
> 
> In the future I recommend just adding defines in top part of DTSI (under
> ifdef not defined). Then when time comes, you drop this entire piece of
> defines which makes it extra readable and easy to review. Nice clean
> patchset.
> 

I worked out the underlying issue with the clock maintainer, so we
should just use the dt-bindings defines directly from the beginning.

Regards,
Bjorn

> To review this approach, I would need to check every define if it
> matches the previous number.
> 
> Best regards,
> Krzysztof
