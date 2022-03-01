Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE984C81F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 05:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbiCAEKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 23:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiCAEKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 23:10:54 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D4F58827
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:10:14 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id g1so13039392pfv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hpq5GjZQptAKkSMdcyQQi01o9oZPsYgMqwCWekmi7Sw=;
        b=mYhpr1HhK5yiockpEnRo39R84MNVHzkyfh4CMNhCboaf9hf5Ppb92sKJPhWXue2cUs
         8ip8D+dWTx/OQ2Bie4OmdqgD6uib7SBwoTIaw6b4zJVUbNKiOZ/AW2pTuFHMf/YXYmxB
         cUHtaOwrr/qu2w9+8F5Ea36SQXpx5hpusCTwi8msGuCvgmS3f4a0lPa6D788YUvY52o4
         3UGGmyoNbyBspSInI7Eiy81mCMIUUyvakq51xmZdYL13bNTsDrZRqf44avBMAvm2hXjT
         oiXA1IMjF+J1wSZqtKBM6n+UZ3tmactKaq3GDUCr2Rd8fm97UpqBTPeylr9QTmDtKFNm
         dD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hpq5GjZQptAKkSMdcyQQi01o9oZPsYgMqwCWekmi7Sw=;
        b=FkWZdVkVjR6WVhbFHZ8v6h+kDQhJHbdtOC00bGUgJ76sO+SCWgHN9+PWd9p9ZQuMtP
         TGT0DDBk7mYvKdxcsh6g3xGsSWI9NA6NJSpX6m3SR0KOTsENHE/sFXG/uRuH5Giz80cf
         L9Yh8Y9f3s1BlqHdQfy69RAmfXG7g9qA5uzuIkVCUihHD8lm0o2QSq862NgHAXxXm6xI
         iruQWKNHAfmTPNGBSNxho8YPB3LU97Vtz5CnSQ1S8+v16qHw0G1aO9lBu/PWp7fP49XB
         vAFYW/gZowo8TuV/UIRS5wMgJZmaXZDN7lSFmjBT+ehIAll32OAWIgA2SdapEYewymDE
         HAHw==
X-Gm-Message-State: AOAM533iopEyxnUaSiI1ri+B88RC7TWPQjIrzDG24Eg8INbMF4TG6ohk
        1J3NyqIArOUee3H7FqvdcrSFog==
X-Google-Smtp-Source: ABdhPJxr5ZEqJaOMmcWja5H0Gd1DkSWwOqBmNmOEwJfnm+P7g8ImFFG77VVs0E0czWTsglqGhk6PSA==
X-Received: by 2002:a05:6a00:887:b0:4f2:6d3f:5b53 with SMTP id q7-20020a056a00088700b004f26d3f5b53mr25552345pfj.21.1646107813698;
        Mon, 28 Feb 2022 20:10:13 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j13-20020a056a00130d00b004f1025a4361sm15254811pfu.202.2022.02.28.20.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:10:13 -0800 (PST)
Date:   Tue, 1 Mar 2022 12:10:07 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm8450: Fix qmp ufs phy node
 (use phy@ instead of lanes@)
Message-ID: <20220301041007.GH269879@dragon>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
 <20220228123019.382037-6-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228123019.382037-6-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 06:00:16PM +0530, Bhupesh Sharma wrote:
> Fix the 'make dtbs_check' warning:
> 
> arch/arm64/boot/dts/qcom/sm8450-qrd.dt.yaml: phy@1d87000:
>  'lanes@1d87400' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Shawn Guo <shawn.guo@linaro.org>
