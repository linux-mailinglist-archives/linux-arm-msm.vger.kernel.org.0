Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421BB6659EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 12:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjAKLXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 06:23:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjAKLXg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 06:23:36 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2219F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 03:23:35 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id 17so16503108pll.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 03:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NdOgn1yCYJAyY06Gupgzi8+hM+Xp+RpyK1OnwHdM6Og=;
        b=vy3Yu4DtcL96gccpDy/joOJ/lLj+h1IShOJMXAy1yh/hO/NvznzlkNUxewqnzk9VkW
         EMHlz6Rr6/ILIwne8BiEO8wFVCh49WEfMwvvYp/5XskhLwbN6wig2ngBuf58jE6EfgdZ
         rs++Kj55GRKD7q5G6x4vW8bPon5PkcE8yraczc8svUxhl4DlXy943PAOBRQ0XIeg64G9
         48l44Jvluszb6Wq4uEhvg63Ly3FFJIkbB2+toC1JWE2Fqx52HpthyXA3yYW/ohMoQXlv
         Zlu12NiFaRumyTHQTikCImxBRHtL2kxxL3JsmNbg9c8SY9ejUkTOOc/9aPScHxdIY0VY
         LHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdOgn1yCYJAyY06Gupgzi8+hM+Xp+RpyK1OnwHdM6Og=;
        b=2NM4o1O24Y4QxYhzmXQfoiMutRZVAH+PGreHgwgKFvNyO5j4mkHbpFbghfH2ETvkc3
         glouHvYQm7aK1NSmNazEWk1zw69C5iGHPJM8yAvCT///v/Q4anzb5wV+8OhDECaU3q18
         5KmHikT8lxbiE6s+wsb6IO8qYIOzH9zrIR6PhKtpPKIIDxTmOD6AbryQSdOJL6Wp4fVl
         ol6LIgTZLzYWvmSFysvPYH4P4EiqlnLtaYeMcmyQ5I71jYLuc2TONqqvdppPBp/aGqm5
         vVBw83OldHDeEbtvuK8eWlzbij9/wkhESjiMNo5g/TXgcfnnLIbSLfcxtl1qSSbRu/q0
         d07g==
X-Gm-Message-State: AFqh2kp6puc18p2OsCcaE5+8TyvndIZzUGO4Jg8gJS5+2+TVb7IZHGRV
        AI3FvrwdxDkoDG/3j2ZjpGDn
X-Google-Smtp-Source: AMrXdXsjMOamYa8/f02u2xtM4J9oNufkjaCTGrGv0jSv1qMVhosBp/2ZhTx8Haic2yN1xI8jYctqfg==
X-Received: by 2002:a17:903:3286:b0:193:1952:5a45 with SMTP id jh6-20020a170903328600b0019319525a45mr5187962plb.19.1673436214834;
        Wed, 11 Jan 2023 03:23:34 -0800 (PST)
Received: from thinkpad ([117.217.177.1])
        by smtp.gmail.com with ESMTPSA id jg7-20020a17090326c700b0019324fbec59sm7633311plb.41.2023.01.11.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:23:33 -0800 (PST)
Date:   Wed, 11 Jan 2023 16:53:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, robin.murphy@arm.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        amit.pundir@linaro.org, regressions@leemhuis.info,
        sumit.semwal@linaro.org, will@kernel.org, catalin.marinas@arm.com
Subject: Re: [PATCH V2 06/11] remoteproc: qcom_q6v5_mss: Use a carveout to
 authenticate modem headers
Message-ID: <20230111112324.GA4873@thinkpad>
References: <20230109034843.23759-1-quic_sibis@quicinc.com>
 <20230109034843.23759-7-quic_sibis@quicinc.com>
 <20230109083231.GB4966@thinkpad>
 <7552f8a1-9503-de7c-a6d4-46452ef78ece@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7552f8a1-9503-de7c-a6d4-46452ef78ece@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 09, 2023 at 03:35:31PM +0530, Sibi Sankar wrote:
> Hey Mani,
> 
> On 1/9/23 14:02, Manivannan Sadhasivam wrote:
> > On Mon, Jan 09, 2023 at 09:18:38AM +0530, Sibi Sankar wrote:
> > > Any access to the dynamically allocated metadata region by the application
> > > processor after assigning it to the remote Q6 will result in a XPU
> > > violation. Fix this by replacing the dynamically allocated memory region
> > > with a no-map carveout and unmap the modem metadata memory region before
> > > passing control to the remote Q6.
> > > 
> > > Reported-and-tested-by: Amit Pundir <amit.pundir@linaro.org>
> > > Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
> > > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > > ---
> > > 
> > > v2:
> > >   * Revert no_kernel_mapping [Mani/Robin]
> > > 
> > >   drivers/remoteproc/qcom_q6v5_mss.c | 48 ++++++++++++++++++++++++++----
> > >   1 file changed, 42 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > > index e2f765f87ec9..b7a158751cef 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > > @@ -215,6 +215,7 @@ struct q6v5 {
> > >   	size_t mba_size;
> > >   	size_t dp_size;
> > > +	phys_addr_t mdata_phys;
> > >   	phys_addr_t mpss_phys;
> > >   	phys_addr_t mpss_reloc;
> > >   	size_t mpss_size;
> > > @@ -973,15 +974,29 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
> > >   	if (IS_ERR(metadata))
> > >   		return PTR_ERR(metadata);
> > > -	ptr = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
> > > -	if (!ptr) {
> > > -		kfree(metadata);
> > > -		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
> > > -		return -ENOMEM;
> > > +	if (qproc->mdata_phys) {
> > > +		phys = qproc->mdata_phys;
> > > +		ptr = memremap(qproc->mdata_phys, size, MEMREMAP_WC);
> > > +		if (!ptr) {
> > > +			dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> > > +				&qproc->mdata_phys, size);
> > > +			ret = -EBUSY;
> > > +			goto free_dma_attrs;
> > 
> > There is no memory to free at this point.
> 
> we would just free the metadata in the no-map carveout scenario since
> mdata_phys wouldn't be NULL. I can do a kfree(metadata) directly from
> this branch and return as well if you think it makes things more
> readable.
> 

Oops, I missed that. But yeah it is confusing too with the current way of
freeing metadata. I'd suggest using a separate label instead.

Thanks,
Mani

> > 
> > Thanks,
> > Mani
> > 
> > > +		}
> > > +	} else {
> > > +		ptr = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
> > > +		if (!ptr) {
> > > +			kfree(metadata);
> > > +			dev_err(qproc->dev, "failed to allocate mdt buffer\n");
> > > +			return -ENOMEM;
> > > +		}
> > >   	}
> > >   	memcpy(ptr, metadata, size);
> > > +	if (qproc->mdata_phys)
> > > +		memunmap(ptr);
> > > +
> > >   	/* Hypervisor mapping to access metadata by modem */
> > >   	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
> > >   	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true,
> > > @@ -1010,7 +1025,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
> > >   			 "mdt buffer not reclaimed system may become unstable\n");
> > >   free_dma_attrs:
> > > -	dma_free_attrs(qproc->dev, size, ptr, phys, dma_attrs);
> > > +	if (!qproc->mdata_phys)
> > > +		dma_free_attrs(qproc->dev, size, ptr, phys, dma_attrs);
> > >   	kfree(metadata);
> > >   	return ret < 0 ? ret : 0;
> > > @@ -1893,6 +1909,26 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
> > >   	qproc->mpss_phys = qproc->mpss_reloc = r.start;
> > >   	qproc->mpss_size = resource_size(&r);
> > > +	if (!child) {
> > > +		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
> > > +	} else {
> > > +		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
> > > +		node = of_parse_phandle(child, "memory-region", 0);
> > > +		of_node_put(child);
> > > +	}
> > > +
> > > +	if (!node)
> > > +		return 0;
> > > +
> > > +	ret = of_address_to_resource(node, 0, &r);
> > > +	of_node_put(node);
> > > +	if (ret) {
> > > +		dev_err(qproc->dev, "unable to resolve metadata region\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	qproc->mdata_phys = r.start;
> > > +
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.17.1
> > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்
