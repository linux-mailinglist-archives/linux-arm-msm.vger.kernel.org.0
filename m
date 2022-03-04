Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309224CE0CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Mar 2022 00:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiCDXPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 18:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiCDXPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 18:15:41 -0500
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DD027B93D;
        Fri,  4 Mar 2022 15:14:53 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id y15-20020a4a650f000000b0031c19e9fe9dso11110089ooc.12;
        Fri, 04 Mar 2022 15:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iKcFl+4S6s4TdPDDYO57E1OBKj3zJj6b5nIPKkI9oL4=;
        b=CS/MjtH5p6XBMtdzRs5QRwmp8iLRyDp00C7S9g9i9RVeGPmx4a88lxNcFi5xYWy9xz
         e0EkmLgFJroj7zDthrzhMl1jJLzbVKbOg628QH9alEwvv2XL3rAKb7ubNIDDl5zODHNk
         e4nmhoqQbOizJXbOyuQeyMV/Cu+WQobFZiAMfDD7h7JLnUOri43gMPtcpnepEQmvlOGJ
         TjaCXQ+eqf+9stJ5l5QGwMO1Af25VBTcQ0FgaHgvMD5u9yX8q3qnRonCo00d0s7mA/sX
         2Yx0uyN31u5etVjd6SzCru2yz869PjjcON5CAr6ODbKi/CcRD8iUbh4oG3dXdQVtMEFu
         JZ/g==
X-Gm-Message-State: AOAM533NhUsGgJICHi5MePJ7FtZSjRLQACBdKojVM8tLUtJxLW8SlGMI
        guyHHlEq/fPlVhuu0NlE7Q==
X-Google-Smtp-Source: ABdhPJzAOl0T5CUCv1n9rVwZ32AyxsHhSlrNUXPI13IMSAOM09u8I73pMrek+xwQqkTiBRDEERZh4Q==
X-Received: by 2002:a05:6870:41cc:b0:d7:5e06:faec with SMTP id z12-20020a05687041cc00b000d75e06faecmr9255098oac.30.1646435692687;
        Fri, 04 Mar 2022 15:14:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t11-20020a4ae40b000000b0031cc933b418sm2792129oov.40.2022.03.04.15.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 15:14:51 -0800 (PST)
Received: (nullmailer pid 642676 invoked by uid 1000);
        Fri, 04 Mar 2022 23:14:50 -0000
Date:   Fri, 4 Mar 2022 17:14:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
Message-ID: <YiKdajh2+mX99Nww@robh.at.kernel.org>
References: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
 <20220226205035.1826360-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226205035.1826360-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 26 Feb 2022 23:50:34 +0300, Dmitry Baryshkov wrote:
> Add bindings for the PM8450 PMIC (qcom,pm8450).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
