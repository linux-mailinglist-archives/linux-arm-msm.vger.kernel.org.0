Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19EE65524F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 16:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236552AbiLWPlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 10:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236576AbiLWPlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 10:41:02 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210A55FEF
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 07:40:45 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso9172709pjt.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 07:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TgS3ytl4duwPJh+l9SPs/9xSZEQfIRjDKEzXHGXrmO4=;
        b=aJt3e/wRncUWgpZs0aJab6n6L6Dnpmp6P0aQu+01sHnitIflM5+fteGzfwx0w0mYIU
         +JeLX5AGIBjzf3k9G/WcVvjaiDwFLmfUhuueHmgc7MAtyNbGA5WceSDO/V2vdK8VvW2e
         RpMDASfwuPbNtPJG26rdMHAgPwrCGZshTJE5q5srH24qw0YMlLVULsUzlpKo6PZg4ajN
         d/+IMFuohtHbjSygasbfXgaRh34yrrE1aSH+95wK1gRdmTB2j/BGDMSwxgTzCtvPdBej
         AjCm+MC34e7JEHqufNrK3YlNryiddek+z4ApYmCnhIr4yiGjqkS/n4hjtyBkxDa6Bcht
         QiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgS3ytl4duwPJh+l9SPs/9xSZEQfIRjDKEzXHGXrmO4=;
        b=wGU0y+ulH4vmkeLTEOxG86t8OHM0CMlDVy4xqz0Nz7zXqAby1HhzULClAYaWtXypEr
         bKVrO24oc4pW3mhyWemaFanoNWZMYdkQpZXegygRUK5rCeYV5jv1kU9N0hlC40c1PbKT
         1zUCLglO6TEyt9AeN2DbxVR9+vgiVCvK6snkq71kJGif3J2EJiKBanuNDc6uMREIdjVU
         4AW97Lx76gdZAf/5+mP4eDRgnSQylfeswSqLy53IJqcIZ60eF/mt6dhJlkXMLZf+rg8J
         2drYbz0cCdMAfgSCxBPYR7+pWMgDAsmzV1lmWchARq562jhjyRn/uKHraB9K4AXbKzs4
         0zUQ==
X-Gm-Message-State: AFqh2ko/moKKuIAw8UGNJYr2sLDZFvkAQVhFcVxfaxOljDDPyODNdvde
        iV6LxxV1FzARKhiiyy87cBRe
X-Google-Smtp-Source: AMrXdXtROyDfUhC2bN1MXp3s7dZRYm30atXYr8THHwHLYFxwVEMiWLh9wyjdiTyBx47tIs+1F6tZrw==
X-Received: by 2002:a17:902:7793:b0:189:86f0:70a2 with SMTP id o19-20020a170902779300b0018986f070a2mr10122206pll.43.1671810045394;
        Fri, 23 Dec 2022 07:40:45 -0800 (PST)
Received: from thinkpad ([27.111.75.82])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b0017f756563bcsm2579918plx.47.2022.12.23.07.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 07:40:44 -0800 (PST)
Date:   Fri, 23 Dec 2022 21:10:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 1/2] Revert "remoteproc: qcom_q6v5_mss: map/unmap
 metadata region before/after use"
Message-ID: <20221223154039.GD4587@thinkpad>
References: <20221223092703.61927-1-hch@lst.de>
 <20221223092703.61927-2-hch@lst.de>
 <20221223144731.GA4587@thinkpad>
 <20221223145722.GA29401@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221223145722.GA29401@lst.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 23, 2022 at 03:57:22PM +0100, Christoph Hellwig wrote:
> On Fri, Dec 23, 2022 at 08:17:31PM +0530, Manivannan Sadhasivam wrote:
> > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Btw, if the hardware really does not like a kernel mapping, the
> right way is to just keep using the normal dma allocator, but make
> sure that there shared-dma-pool with the no-map property for the
> device.

Sibi posted a series that uses a separate no-map carveout for this usecase:
https://lore.kernel.org/lkml/20221213140724.8612-1-quic_sibis@quicinc.com/

But that doesn't use dma allocator with shared-dma-pool.

Thanks,
Mani

-- 
மணிவண்ணன் சதாசிவம்
