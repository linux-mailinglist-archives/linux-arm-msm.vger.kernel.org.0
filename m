Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B509510095
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 16:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236332AbiDZOju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 10:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351662AbiDZOin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 10:38:43 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06EF2AE3D;
        Tue, 26 Apr 2022 07:35:27 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id s131so1563264oie.1;
        Tue, 26 Apr 2022 07:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DgbKlSdIc2aaOKM++rOeVgrF/sNkwHcTZd1bq6UXXAs=;
        b=np5tK4BlWlXbOv9oYnzR6UhpedGNhmsytLUQNeT7lL91l/l1H15G3Ma4zzLIysChOs
         qYySoJiXgUYhUj7ICHwKnrz9bKSjgqDxR5zxaf0qw8fCTF/D5C4TI5v4CO60JZwP1AeX
         uteMAeLcWgdFA8BgHWMVUJGPd2OzpQsSb4mIGCgz9Yet6CUZDD3JOIqI8hxV+dfutB+n
         TteSMs9Oav0ZFDSrVbJ6afJ2U5Z946lLuduAZ54DiShgY3a4s3iX+ytSnwF4P0o+wxZo
         OSxZx86ftw/05w9mUXtru4gJsJ4LutaF/1ldX77xkp18YKIM+EnXLc+Aq7ZiYGHpAgLo
         auuA==
X-Gm-Message-State: AOAM533jHRS19nhlOQnkkKDuFgToolq7eTKbFVdo7F8XVE7pkW8NbIhJ
        OAygoY20X2b/FrQ7pJpf+A==
X-Google-Smtp-Source: ABdhPJzbnzMCTd3Phik5PcVgRZw2s8bSECyNKs1jIPZ5mmp+J9+Qnm/LHDxxJxGkgIdyu8tkPHxAcw==
X-Received: by 2002:a05:6808:1283:b0:325:162b:4845 with SMTP id a3-20020a056808128300b00325162b4845mr6928287oiw.23.1650983727140;
        Tue, 26 Apr 2022 07:35:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q7-20020a056870e60700b000e686d13878sm863389oag.18.2022.04.26.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 07:35:26 -0700 (PDT)
Received: (nullmailer pid 1945702 invoked by uid 1000);
        Tue, 26 Apr 2022 14:35:26 -0000
Date:   Tue, 26 Apr 2022 09:35:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: gcc-apq8064: move
 qcom,apq8084 back to gcc-other.yaml
Message-ID: <YmgDLZmueqoWJb7c@robh.at.kernel.org>
References: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
 <20220426093608.2957210-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426093608.2957210-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 12:36:07PM +0300, Dmitry Baryshkov wrote:
> The global clock controller on apq8084 has nothing to do with the schema
> for apq8064. It uses the schema defined in qcom,gcc-other.yaml. Move
> respective declarations back.
> 
> Instead add what was really meant to be present in qcom,gcc-apq8064
> schema: the compatibility string for qcom,apq8064 device.
> 
> Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation")
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml | 4 +---
>  Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml   | 3 +++
>  2 files changed, 4 insertions(+), 3 deletions(-)

Thanks for sorting this out!

Reviewed-by: Rob Herring <robh@kernel.org>
