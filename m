Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A76A709D12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 18:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjESQ6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 12:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjESQ6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 12:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE1F114
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 09:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684515475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OSQIXexhEgr4UYHcCQ3e6Gbt+1IifasCgEOBLmd3ZJs=;
        b=MqRqw1637uy9bbPUvfG4c+Zq0duxrqK+AXEUeoU2bmNRMlVWOv//QjG0yj+3ARFXSgThAa
        ijytMws4drKw4RJSZte8dpD3tLN+bNyOBOtBaqWlm5hrT8AzmOQPg+W26j3WBgZZZqv3H5
        m6B5XvHzwBbAU80VtmY0M9e0NHiU1S8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-0DHTONujPpWv4639J7q5ug-1; Fri, 19 May 2023 12:57:53 -0400
X-MC-Unique: 0DHTONujPpWv4639J7q5ug-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ab2d2697bdso2935850a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 09:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515473; x=1687107473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSQIXexhEgr4UYHcCQ3e6Gbt+1IifasCgEOBLmd3ZJs=;
        b=Jn9Yu/g0ebzkv2eHVBbZ+Rn1eALYoBnkot5fnu1GKfFVfD9ETwTZodqMw4QLKPzyBr
         eB8Ib+zCNrNn0+qDguf6v6wkAoMmq1xpI9aJ/v+3SQtROC9mJ8jK7xFpK/i7bHXPgkBZ
         uRiUHzmHsqu6STh7s6GBwbCt/jxe2WdAP4RkX/6jvddDAoQVLtMi1jgVM8vIvWHc6YiI
         96zLEPnjySJszKlmZBmIHoA1DqkIcs3pNqbXTUDonYpZ+3DF39cHHlX+Ajh+rc6qn+RT
         tgSyi9ms9X7TAAFHh8aoMjim4n6x9qUaNe2lhCvh5lUwolbABWrsfSwar/p+GD3hc/1o
         nEdg==
X-Gm-Message-State: AC+VfDzvaHEpoot/SUA9H2+hjCnH6/pxaXQFucj1ee2PXTQz0YTo2kUV
        9NqWgwk5asKv42SADpU78wfHtF6fiqtw+Yu+SIHSDKiUDacdGnTUpF0tqazvqDf02eCu046tJXt
        KMqM0jyGTkHUwcCpAxOWqsnezyA==
X-Received: by 2002:a9d:4f07:0:b0:6a5:f682:44ca with SMTP id d7-20020a9d4f07000000b006a5f68244camr1219053otl.16.1684515472999;
        Fri, 19 May 2023 09:57:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RGmOB71h2mvB5aElpiYywwU5/QlRBW65OVaQT7Hgd8JfaRKJWGZOMGc7iCxi/sUCdW1BMfg==
X-Received: by 2002:a9d:4f07:0:b0:6a5:f682:44ca with SMTP id d7-20020a9d4f07000000b006a5f68244camr1219041otl.16.1684515472780;
        Fri, 19 May 2023 09:57:52 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::42])
        by smtp.gmail.com with ESMTPSA id n22-20020a0568301e9600b006ab305429e7sm1843984otr.0.2023.05.19.09.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 09:57:52 -0700 (PDT)
Date:   Fri, 19 May 2023 11:57:50 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 v0/4] sa8155p-adp devicetree ethernet cleanup
Message-ID: <20230519165750.p36jzknh44eij4nf@halaney-x13s>
References: <20230501212446.2570364-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501212446.2570364-1-ahalaney@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

I think this one is ready to be picked up. Just a gentle reminder, I
almost forgot about it until I cleaned my inbox this morning :)

Thanks,
Andrew

On Mon, May 01, 2023 at 04:24:42PM -0500, Andrew Halaney wrote:
> This series cleans up some devicetree conventions in sa8155p-adp based
> on feedback from other platforms.
> 
> The hope is that by getting it right here, future contributors won't
> repeat the same mistakes as I did!
> 
> v3: https://lore.kernel.org/linux-arm-msm/20230421205512.339850-1-ahalaney@redhat.com/
> 
> Thanks,
> Andrew
> 
> Andrew Halaney (4):
>   arm64: dts: qcom: sa8155p-adp: Make compatible the first property
>   arm64: dts: qcom: Make -cells decimal
>   arm64: dts: qcom: sa8155p-adp: Remove unneeded rgmii_phy information
>   arm64: dts: qcom: sa8155p-adp: Move mtl nodes into ethernet node
> 
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        |  2 +-
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi        | 14 ++---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi        |  4 +-
>  arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts |  4 +-
>  arch/arm64/boot/dts/qcom/sa8155p-adp.dts     | 56 ++++++++++----------
>  5 files changed, 39 insertions(+), 41 deletions(-)
> 
> -- 
> 2.40.0
> 

