Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B375241EF5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 16:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354304AbhJAOXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 10:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354175AbhJAOX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 10:23:29 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DD2C06177D
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 07:21:45 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so11658263otv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RyljskWxEIj64E0/JKXsfCLMykqvOmjKdzQgJe75r2U=;
        b=yQsH27dcsAfYNORAm1R6gUODOKo31/SdiCD/fT+dVfWd+sVz8HZDJoZm5NQGe7i2gY
         7VEmSxQvd9JqFOs6Sn+Gt587qhhhHXJgHdsnpLDEbFzTzQwax/SmF0sU6pqbi2d3I7dS
         n9G1hzvK13Lv75ThsNaRlHLZre2/xOk7NZ5Lpo5LCwXo28H8jIcMbg403AN5MlIWY5L4
         Eo6QERZ8uyrjeBiBgTzKrP1frovpqd7Dr/33FhGzU9EYPh8vxoEIlmCHQSy731S6ljf4
         0fjJ4tWuuuuRBYwiHYg5MP6mP2vPNqlWeIc/vqCcXkBwh11vH+YUvWjDRzbZfIdtdLXN
         tZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RyljskWxEIj64E0/JKXsfCLMykqvOmjKdzQgJe75r2U=;
        b=t+fuPyBHRvK0dDWB29CSrLkBl69UTzb1aFTiJ9z0a7RE0O2o9765fcWnWZMTUe4wHS
         tuQioD+GGEGadzJnEHD7njhLLejGxvdGfIvAEGq5N1W+a62fLuKhLH6HRhJ2mGcnTsrA
         xgqPzH8aGQ3b139PmpBw4/OMJvh3h8zyIRjI80KZPhkpzDmLWXws6uIfGEHFI1Lss+CO
         T6cjHdR0A5bBaOZ4ECAlWtI2m+/s/SKLWYXNVLW0FTbKJkPGqesFlzIS/Aq3Ob04Y4CA
         zTpgq3sFaaQX7asGJPrpLoW4voG3LZc3DMpGinW2Ldv26rO42XlJjKcJsMaU53xmFdZn
         MGiA==
X-Gm-Message-State: AOAM532vBErWFymKObvj8NwIdw/kNq5Re/3nFTJwNG7eeN3VcyjEIv8W
        UpBEnORjU40dBEp3fwjWcDVcGg==
X-Google-Smtp-Source: ABdhPJx4IXNLQp5mpOgHA767G+AngUBs0pCRIIbB0v5aaUOGgR/hVSObk7E9KZiGC2CkqwZ9AfFg3A==
X-Received: by 2002:a9d:5f9b:: with SMTP id g27mr11101284oti.217.1633098104962;
        Fri, 01 Oct 2021 07:21:44 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i24sm1176746oie.42.2021.10.01.07.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 07:21:44 -0700 (PDT)
Date:   Fri, 1 Oct 2021 07:23:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: Re: [PATCH v2 3/4] soc: qcom: smem: Support reserved-memory
 description
Message-ID: <YVcZ5FsM2u+3uoK4@ripper>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
 <20210930182111.57353-4-bjorn.andersson@linaro.org>
 <9a4ef69d-df15-0fbc-3735-6d7c861855ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a4ef69d-df15-0fbc-3735-6d7c861855ac@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 01 Oct 00:08 PDT 2021, Vladimir Zapolskiy wrote:
> On 9/30/21 9:21 PM, Bjorn Andersson wrote:
[..]
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
[..]
> > @@ -895,12 +892,14 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
> >   static int qcom_smem_probe(struct platform_device *pdev)
> >   {
> >   	struct smem_header *header;
> > +	struct reserved_mem *rmem;
> >   	struct qcom_smem *smem;
> >   	size_t array_size;
> >   	int num_regions;
> >   	int hwlock_id;
> >   	u32 version;
> >   	int ret;
> > +	int i;
> 
> Just a nitpicking, the index can be unsigned.
> 

It's compared against the "num_regions", which is also signed. So I
think it should be signed.

[..]
> > +	for (i = 0; i < num_regions; i++) {

Thanks for the review!

Regards,
Bjorn
