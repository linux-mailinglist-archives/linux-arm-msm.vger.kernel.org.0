Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012497B5525
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 16:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237538AbjJBOQb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 10:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237642AbjJBOQZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 10:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21F1AD
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696256135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z9UNIWuOWIf7LekqrECDA9BOBLSukXbjzKljf8b4ucM=;
        b=bR37T94A+EsnFPA9b9lMnW9BN+/SAfuc5bJjXKgqjreSDW6ygH/AibzuS4wBdDtxCOR8yv
        4OmoGsIjpe6lIzGXAAyEWcOYAA5YQdN1ECPct0EOa3bhj1jK/PnU0YRdOa3xpG+3b7ku7b
        vlTQuebLLqRIt2+fZEQvIRgUVduseOM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-TZiK-2qRMgqTgZZSjAlYrw-1; Mon, 02 Oct 2023 10:15:33 -0400
X-MC-Unique: TZiK-2qRMgqTgZZSjAlYrw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-65af758fa1eso238026616d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 07:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696256133; x=1696860933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9UNIWuOWIf7LekqrECDA9BOBLSukXbjzKljf8b4ucM=;
        b=aB5eLK3BfsamUI4Wy/EBhdorNMVuermhYc9X1SqSFnHFe5S397oEwkPfmOVRRVn6tB
         Yo+cUc5pR0MPuF4F0AC9JQIVZCsGwbucZlfAh9wly8G2y9Ztw8mJymnfyfxQq5x/IiSa
         f+1Fs8KAIkuFk0ixmcN09zquiJm0ZRG2NhZ2BRz5KxVe2LwB5UdqIitcXhIcnhhqeRzZ
         Fb74/P51lb373dycDWKiMtMkTIwxeKD0iWvFW8bi2snRWi+yzRoxK9Q5On7SSUISo/1n
         a+ErPTou6zKLeVa5ej+b7EKuU9dCQc0rWPeHqnn2QPoEaEXpS7GLwtItoAyoKcScrCwM
         gPdg==
X-Gm-Message-State: AOJu0Yw/1+IrSYKPFmsOE62mOdfD2R8fAqEyotz4XeWYeUEPzYP0zJmP
        BFzgAek0e0CofuYelxXY9QF87/9PoNU2x4ZwcsRL10F5zHCWxtMcSeQTkJG7Hu7b27/rnc4JRHb
        mrpPiM3nrbcTUQK/mXlJIQuS2Ag==
X-Received: by 2002:a0c:a998:0:b0:65c:fd5b:d74e with SMTP id a24-20020a0ca998000000b0065cfd5bd74emr13805226qvb.26.1696256133028;
        Mon, 02 Oct 2023 07:15:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnNthnLNASHgTl9RLlo9jzS8jHG2FRGVYtYtc46PgtXWjG1q8LMR0XGQQ6YPXsO0MIlBQb9g==
X-Received: by 2002:a0c:a998:0:b0:65c:fd5b:d74e with SMTP id a24-20020a0ca998000000b0065cfd5bd74emr13805198qvb.26.1696256132717;
        Mon, 02 Oct 2023 07:15:32 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id pe3-20020a05620a850300b007726002d69esm9034997qkn.10.2023.10.02.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:15:32 -0700 (PDT)
Date:   Mon, 2 Oct 2023 09:15:30 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 06/11] firmware: qcom: scm: make
 qcom_scm_pas_init_image() use the SCM allocator
Message-ID: <6wt36wqcnvzp5znasldeu7txcscslydpxn7fcanzt3e77xcaju@ufbolnewsqwl>
References: <20230928092040.9420-1-brgl@bgdev.pl>
 <20230928092040.9420-7-brgl@bgdev.pl>
 <gwflmag5pq7osprj25l7i4tgyln2nauuqcwdhth2eomareooag@4dw4lwk4vr36>
 <CAMRc=Mfxt1DLinxMcKivQqqnHvFv5P8WXNnfAwnfrHgoz+q-5w@mail.gmail.com>
 <20230929204404.enzsjanohdqqpmk4@halaney-x13s>
 <2539186e-e0ec-4eba-9d6a-d966e00f0eb9@quicinc.com>
 <5puhrnpw2rww6kawt77krges6aj4re6nfblqkomuw5njtwydya@cuarfakzv62i>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5puhrnpw2rww6kawt77krges6aj4re6nfblqkomuw5njtwydya@cuarfakzv62i>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 02, 2023 at 08:24:09AM -0500, Andrew Halaney wrote:
> On Fri, Sep 29, 2023 at 03:48:37PM -0700, Elliot Berman wrote:
> > Hi Andrew,
> > 
> > On 9/29/2023 1:44 PM, Andrew Halaney wrote:
> > > On Fri, Sep 29, 2023 at 12:22:16PM -0700, Bartosz Golaszewski wrote:
> > >> On Fri, 29 Sep 2023 21:16:51 +0200, Andrew Halaney <ahalaney@redhat.com> said:
> > >>> On Thu, Sep 28, 2023 at 11:20:35AM +0200, Bartosz Golaszewski wrote:
> > >>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >>>>
> > >>>> Let's use the new SCM memory allocator to obtain a buffer for this call
> > >>>> instead of using dma_alloc_coherent().
> > >>>>
> > >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >>>> ---
> > >>>>  drivers/firmware/qcom/qcom_scm.c | 16 +++++-----------
> > >>>>  1 file changed, 5 insertions(+), 11 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > >>>> index 02a773ba1383..c0eb81069847 100644
> > >>>> --- a/drivers/firmware/qcom/qcom_scm.c
> > >>>> +++ b/drivers/firmware/qcom/qcom_scm.c
> > >>>> @@ -532,7 +532,7 @@ static void qcom_scm_set_download_mode(bool enable)
> > >>>>  int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> > >>>>  			    struct qcom_scm_pas_metadata *ctx)
> > >>>>  {
> > >>>> -	dma_addr_t mdata_phys;
> > >>>> +	phys_addr_t mdata_phys;
> > >>>
> > >>>>  	void *mdata_buf;
> > >>>>  	int ret;
> > >>>>  	struct qcom_scm_desc desc = {
> > >>>> @@ -544,13 +544,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> > >>>>  	};
> > >>>>  	struct qcom_scm_res res;
> > >>>>
> > >>>> -	/*
> > >>>> -	 * During the scm call memory protection will be enabled for the meta
> > >>>> -	 * data blob, so make sure it's physically contiguous, 4K aligned and
> > >>>> -	 * non-cachable to avoid XPU violations.
> > >>>> -	 */
> > >>>> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> > >>>> -				       GFP_KERNEL);
> > >>>> +	mdata_buf = qcom_scm_mem_alloc(size, GFP_KERNEL);
> > >>>
> > >>> mdata_phys is never initialized now, and its what's being shoved into
> > >>> desc.args[1] later, which I believe is what triggered the -EINVAL
> > >>> with qcom_scm_call() that I reported in my cover letter reply this
> > >>> morning.
> > >>>
> > >>> Prior with the DMA API that would have been the device view of the buffer.
> > >>>
> > >>
> > >> Gah! Thanks for finding this.
> > >>
> > >> Can you try the following diff?
> > >>
> > >> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > >> index 794388c3212f..b0d4ea237034 100644
> > >> --- a/drivers/firmware/qcom/qcom_scm.c
> > >> +++ b/drivers/firmware/qcom/qcom_scm.c
> > >> @@ -556,6 +556,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const
> > >> void *metadata, size_t size,
> > >>  		dev_err(__scm->dev, "Allocation of metadata buffer failed.\n");
> > >>  		return -ENOMEM;
> > >>  	}
> > >> +	mdata_phys = qcom_scm_mem_to_phys(mdata_buf);
> > >>  	memcpy(mdata_buf, metadata, size);
> > >>
> > >>  	ret = qcom_scm_clk_enable();
> > >> @@ -578,7 +579,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const
> > >> void *metadata, size_t size,
> > >>  		qcom_scm_mem_free(mdata_buf);
> > >>  	} else if (ctx) {
> > >>  		ctx->ptr = mdata_buf;
> > >> -		ctx->phys = qcom_scm_mem_to_phys(mdata_buf);
> > >> +		ctx->phys = mdata_phys;
> > >>  		ctx->size = size;
> > >>  	}
> > >>
> > >> Bart
> > >>
> > > 
> > > For some reason that I can't explain that is still not working. It seems
> > > the SMC call is returning !0 and then we return -EINVAL from there
> > > with qcom_scm_remap_error().
> > > 
> > > Here's a really crummy diff of what I hacked in during lunch to debug (don't
> > > judge my primitive debug skills):
> > > 
> > 
> > I don't know what you're talking about :-)
> > 
> > > diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> > > index 0d5554df1321..56eab0ae5f3a 100644
> > > --- a/drivers/firmware/qcom/qcom_scm-smc.c
> > > +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> > > @@ -162,6 +162,8 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> > >         struct arm_smccc_res smc_res;
> > >         struct arm_smccc_args smc = {0};
> > >  
> > > +       dev_err(dev, "%s: %d: We are in this function\n", __func__, __LINE__);
> > > +
> > >         smc.args[0] = ARM_SMCCC_CALL_VAL(
> > >                 smccc_call_type,
> > >                 qcom_smccc_convention,
> > > @@ -174,6 +176,7 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> > >         if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> > >                 alloc_len = SCM_SMC_N_EXT_ARGS * sizeof(u64);
> > >                 args_virt = qcom_scm_mem_alloc(PAGE_ALIGN(alloc_len), flag);
> > > +               dev_err(dev, "%s: %d: Hit the unlikely case!\n", __func__, __LINE__);
> > >  
> > >                 if (!args_virt)
> > >                         return -ENOMEM;
> > > @@ -197,6 +200,7 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> > >  
> > >         /* ret error check follows after args_virt cleanup*/
> > >         ret = __scm_smc_do(dev, &smc, &smc_res, atomic);
> > > +       dev_err(dev, "%s: %d: ret: %d\n", __func__, __LINE__, ret);
> > >  
> > >         if (ret)
> > >                 return ret;
> > > @@ -205,8 +209,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> > >                 res->result[0] = smc_res.a1;
> > >                 res->result[1] = smc_res.a2;
> > >                 res->result[2] = smc_res.a3;
> > > +               dev_err(dev, "%s: %d: 0: %llu, 1: %llu: 2: %llu\n", __func__, __LINE__, res->result[0], res->result[1], res->result[2]);
> > >         }
> > >  
> > > +       dev_err(dev, "%s: %d: smc_res.a0: %lu\n", __func__, __LINE__, smc_res.a0);
> > >         return (long)smc_res.a0 ? qcom_scm_remap_error(smc_res.a0) : 0;
> > > 
> > > 
> > > And that all spams dmesg successfully for most cases, but the
> > > pas_init_image calls log this out:
> > > 
> > > [   16.362965] remoteproc remoteproc1: powering up 1b300000.remoteproc
> > > [   16.364897] remoteproc remoteproc1: Booting fw image qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn, size 3575808
> > > [   16.365009] qcom_scm firmware:scm: __scm_smc_call: 165: We are in this function
> > > [   16.365251] qcom_scm firmware:scm: __scm_smc_call: 203: ret: 0
> > > [   16.365256] qcom_scm firmware:scm: __scm_smc_call: 212: 0: 0, 1: 0: 2: 0
> > > [   16.365261] qcom_scm firmware:scm: __scm_smc_call: 215: smc_res.a0: 4291821558
> > > 
> > > At the moment I am unsure why...
> > > 
> > Does the issue appear right after taking patch 6 or does it only appear after taking
> > the whole series? If it's just to this patch, then maybe something wrong with
> > the refactor: shm bridge isn't enabled at this point in the series.
> > 
> 
> I've only been testing the series as a whole on top of a 6.6 based
> branch, I'm going to try and test some more today to see if just the
> allocator bits (but not the SHM bridge enablement) works alright for
> me.
> 

After testing a little more with the fix Bart sent above,
the allocator refactor seems to work well.
With "firmware: qcom: scm: enable SHM bridge" applied is when I see the
errors I pointed out above. All prior patches cause no problems on boot
for me.

For patches 1-9 (with the fix sent here for patch 6) please feel free
to add:

    Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s

If anyone has suggestions for debugging why the switch to using
SHM bridge is breaking firmware loading for me, I'm willing to give
that a try.

Thanks,
Andrew

