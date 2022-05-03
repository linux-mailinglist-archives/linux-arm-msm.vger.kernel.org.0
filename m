Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2998A518BCE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 20:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240930AbiECSIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 14:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240919AbiECSIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 14:08:05 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541A93EA92
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 11:04:32 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id l16so11723726oil.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nGkSI+NXkk/TIaUfMbTS5LjDSixkddXSIamGkNlZLuI=;
        b=HqABJwqMfzZsj7GebOh4wS7vXKe4wQnSUTGFHifFQFAQFw3yciwClN7+rNvine68Ur
         SZwBLHGJHHMl6ow3HZfJ6qpG9G2kURPx49/ASJPY22WmWEt1ZV6NkgL5kgY54d54R/Ci
         ZdcGGIbC2rBpNoL8kc1VzyKUOLx+imv6fSRN4UbtMMDQcjskmMq30u6FqIT/TWFVtRia
         QSs9Jf3KDis5zmMMTZkU7OWyZWfz8wQdqRDkOtuACocG/jvi5oiM7B4228sE9e/nYRO0
         OsjvDn3Uv65buZkbSBhVJdAWyramIINDBfH3TgmI2zr/158e6I7WTm2y+IYgv18oXo15
         Y78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nGkSI+NXkk/TIaUfMbTS5LjDSixkddXSIamGkNlZLuI=;
        b=IhuqAjhlroL6uRsPVbW5z0taDraPPK6lFP+Yp4+kFyY/B89EkWL9KSSbxwvTtavF1z
         X18F6z/AUP337ZXmhK/d0EBM/JGbGdvD7plBUbQjdlgZ93zGJzIko2rzrwa6AFrLwd6k
         dcYDyrf4T3Ll1yKxFrRLphk/Z5hned8zqJkF0/a8YsA/dhpE7xXaVLy5209rmdkWibHe
         va+FvmAPig73BxZZW0hd3Q0qF4w/9cQ30brg7OMHv64RoSX9WUXm0hflzIdm/iEj6eLt
         f/4awDsQ6EFsqwWQXQ6iNajoXA3loC7DacXwGjLKxyKePoZqKB0Sz/tSva+eS+aTJRq3
         lNbA==
X-Gm-Message-State: AOAM531PacnqJ3Rb5diHGkBbU4YEkTY5KsaZQv2pTC5kYbga1FBsENrl
        WJr/3HxiPdeC2DJynoZ2xXmOOCOVZif5lzvF
X-Google-Smtp-Source: ABdhPJwOR7cuH3Lr5GL3MW4mj80jqAeRSqQF0RECo7ESQmRtP9ETU6jus8olppiLtanbeXKpylin9g==
X-Received: by 2002:a54:4505:0:b0:325:e50c:a71 with SMTP id l5-20020a544505000000b00325e50c0a71mr2298779oil.70.1651601070242;
        Tue, 03 May 2022 11:04:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q23-20020a4adc57000000b0035eb4e5a6c7sm5138862oov.29.2022.05.03.11.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 11:04:29 -0700 (PDT)
Date:   Tue, 3 May 2022 13:04:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Alex Elder <elder@ieee.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V7 3/7] MAINTAINERS: Add the entry for DCC(Data Capture
 and Compare) driver support
Message-ID: <YnFuq7h110fuMp5U@builder.lan>
References: <cover.1646285069.git.quic_schowdhu@quicinc.com>
 <141df53b42681ba3488f6db60983d4cdb6493f49.1646285069.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <141df53b42681ba3488f6db60983d4cdb6493f49.1646285069.git.quic_schowdhu@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Mar 00:27 CST 2022, Souradeep Chowdhury wrote:

> Added the entries for all the files added as a part of driver support for
> DCC(Data Capture and Compare).
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a61f4f3..e57d927 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5146,6 +5146,14 @@ F:	include/linux/tfrc.h
>  F:	include/uapi/linux/dccp.h
>  F:	net/dccp/
>  
> +DCC QTI DRIVER
> +M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/debugfs-driver-dcc
> +F:	Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> +F:	drivers/soc/qcom/dcc.c
> +
>  DECnet NETWORK LAYER
>  L:	linux-decnet-user@lists.sourceforge.net
>  S:	Orphan
> -- 
> 2.7.4
> 
