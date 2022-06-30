Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 135945620FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235820AbiF3RNU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbiF3RNT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:13:19 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67A711477
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:13:17 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r82so120962oig.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IsDEIufxD7CLx+1ROionmMEdB9wUNBwSr55AU/DLtwQ=;
        b=dqQCT8eGOe/2dMZ7rfs2sYTCAF4dWwH2LZtnlZM1sLbZDDsXLtnPowxEUKGWPPG1gb
         qCqyAR5Mpf8xLrJYZygFZcHFXsmxgkfjFehxxTgsrheNM9WTX4LXtjnN/oGhMxYGZ/+E
         YMohTGPeuiL++PM88Qbgd+6KuEKak1XF/AuqAPTp+Rch+0xpOp8gWx2QrQReQZe5BIP3
         X6xsq3+iLBfuZKqtP76N9eT/YFdgCOGtF3FX4SxmoElPC+KJRGRV4IEPnqdNUSNX3SAe
         dYK1O8fPhXcpcNeDGwRWm+8CADIhK7ww77uVV5EMR679d/aJArOCkkg4yVx0lHvClC3w
         58xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IsDEIufxD7CLx+1ROionmMEdB9wUNBwSr55AU/DLtwQ=;
        b=mOWghR7qjIec/PfgwRjsIope2FR9VrZYyfjbt6Snw75q+ZiD0ijy9V6D4/NrOnRScq
         nUo58j3hBMbl9AFt8dBa3kHCRd4Z8+m/c5TVEgA7/7U8LW/d+hAAOobm1uGpU7ujM7pE
         s8TzFHN+ebq85S3PSz7M3cI8ssJPyEfOfSAMb9SXlI0p0B3623DFcROFF7LCVgXitvIT
         go3mNBqB7yHEFwHJdmgRb1Aesr3O1iXWkrfURPAENi4pbrktxrO5OcJRpG5GoIuwfdyQ
         ff/pHnul5+oL49/FGdr990xBFFa2rIWA5QiOkjQAN0//4fM5qLf0j798z/V187wgAvoG
         r6+g==
X-Gm-Message-State: AJIora/zVi+xVzQwYC6jFDYesin8w5UZya201GBXEuPnbE4FhLgEqOLx
        6TXRxwqDloxuUFrZNB15Hhh84A==
X-Google-Smtp-Source: AGRyM1sriIKotGa0j9+nlYnZgzNZEGOdT9GGzOp45hsDuhv1rC9WZ3aB4itMRBdjcJIYO3+l4vejyg==
X-Received: by 2002:a05:6808:ecf:b0:2f9:f0b1:7ee8 with SMTP id q15-20020a0568080ecf00b002f9f0b17ee8mr6034598oiv.225.1656609197132;
        Thu, 30 Jun 2022 10:13:17 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q10-20020a056830232a00b0060b1f3924c3sm11823645otg.44.2022.06.30.10.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:13:16 -0700 (PDT)
Date:   Thu, 30 Jun 2022 12:13:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/7] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
Message-ID: <Yr3Zqmi/rq2eKhRl@builder.lan>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081742.2554006-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081742.2554006-2-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Jun 03:17 CDT 2022, Vladimir Zapolskiy wrote:

> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
