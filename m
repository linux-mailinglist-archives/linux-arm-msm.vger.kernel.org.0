Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541BC6AE706
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 17:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCGQpa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 11:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjCGQow (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 11:44:52 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF1190B65
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 08:41:51 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id v11so14736083plz.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678207310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZYi4jEDglb5+cxxkgMYuxcqeUvKtcEXdJWnoFmUgvI=;
        b=pU3uYCWFrPgPTwgjIL3pOfcDsHx3zZsLxkPTj1ul0HWYp86W9bkbVzR0mGMViMA5vo
         BHwFsf9n1d+Ph6cDcJuWHWfVyqKI5uyaNx9dSFV2ciKLXrDINLCqiiXbXPvWaJM2vxUN
         N69cyhPsl7p4kCY7hvsgVBDu9/eJtrF/NQS7JTTKAs52s7dyi8UQdUqNHq7R7OwrDCTO
         TrkjDLHd4QxNh87Q9iHk7RFoQ7tD9GldweR+P6Aklbdh0mbg/JZHYAIjv6JE75+40BJo
         9q2+0WJxqcjlpytOkMHhchf/DKwxhD96/BJLnTmw7L6qBwKI5vDFggdtGGiT7SRXAs5t
         AGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZYi4jEDglb5+cxxkgMYuxcqeUvKtcEXdJWnoFmUgvI=;
        b=59kkinaqsjXVCvVHfmKKUvpuhDHP2+AE6+awQPEZY7wSQ59E3bZu4HikL9TbOXIrus
         KyGJogCKQe8vkcL9eaI43QulNqedZJiC0cepktZT59mffJLcfHBTfvLnxpHHdlf2SJ31
         tqFdfQlNl2gotquvEXuMo+2YlmdCh87assVYozxZ3/QsxijWzFpJylJyHLNISPlzAd2O
         hIjp7akNd8Ae1sF6WiN2IdvKMVsLa+2JA2lMmbmsvA75Bi9Lv11l4KBuDdC9ZdMOuUX3
         wxP/Z6WzBcswGRLRhhf5qTxtPM036Dibj1pW9z/axtCK2Y/Q/PTaW/yo8RRrAqEo/o9N
         qhOQ==
X-Gm-Message-State: AO0yUKXUCCqBNvd/8jh5BfeBzHdpseEAilj3ORGohbduca1kgrko41sz
        5YRaPprxpMAqe+qNnpyKn/Zo
X-Google-Smtp-Source: AK7set+SOmaqiB/t3fmXqdM+2yPjiGEpfot8BFKE2TaBiHW8GWiWm3y851idkG45uPaO+zuNjeqhFw==
X-Received: by 2002:a17:90a:190f:b0:237:d867:2260 with SMTP id 15-20020a17090a190f00b00237d8672260mr20226733pjg.4.1678207310034;
        Tue, 07 Mar 2023 08:41:50 -0800 (PST)
Received: from thinkpad ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090a154600b002372107fc3dsm9216794pja.49.2023.03.07.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:41:49 -0800 (PST)
Date:   Tue, 7 Mar 2023 22:11:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc:     mhi@lists.linux.dev, quic_qianyu@quicinc.com,
        quic_vbadigan@quicinc.com, quic_krichai@quicinc.com,
        quic_skananth@quicinc.com, mrana@quicinc.com,
        Alex Elder <elder@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        "open list:MHI BUS" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] bus: mhi: host: Avoid ringing EV DB if there is no
 elements to process
Message-ID: <20230307164141.GG5599@thinkpad>
References: <1677087470-7004-1-git-send-email-quic_vpernami@quicinc.com>
 <20230223154836.GC6422@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223154836.GC6422@workstation>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 23, 2023 at 09:18:36PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Feb 22, 2023 at 11:07:48PM +0530, Vivek Pernamitta wrote:
> > As mhi_poll function can be called by mhi client drivers
> > which will call process_event, which will ring DB even if
> > there no ring elements to process. This could cause
> > doorbell event to be processed by MHI device to check for
> > any ring elements even it is none and also it will occupy
> > lot of bandwidth on peripheral when mhi_poll() is called in
> > aggressive loop.
> > 
> 
> The change looks good to me but who is the actual in-kernel user of
> mhi_poll() API? It is being exported and if there is no upstream client
> driver making use of it, then it shouldn't be.
> 
> I'm gonna submit a patch to remove this API altogether.
> 

The patch removing mhi_poll() API is now merged. Can you please respin this
patch removing the note to the API?

I still think this patch is relevant without that API.

Thanks,
Mani

> > Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> > Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
> > 
> > ---
> > changes since v4:
> > 	updating the commit text with more information.
> > changes since v3:
> > 	- Updating commit text for multiple versions of patches.
> > changes since v2:
> > 	- Updated comments in code.
> > changes since v1:
> > 	- Add an check to avoid ringing EV DB in mhi_process_ctrl_ev_ring().
> > ---
> >  drivers/bus/mhi/host/main.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > index df0fbfe..1bbdb75 100644
> > --- a/drivers/bus/mhi/host/main.c
> > +++ b/drivers/bus/mhi/host/main.c
> > @@ -961,7 +961,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
> >  	}
> >  
> >  	read_lock_bh(&mhi_cntrl->pm_lock);
> > -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> > +
> > +	/* Ring EV DB only if there is any pending element to process */
> > +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
> >  		mhi_ring_er_db(mhi_event);
> >  	read_unlock_bh(&mhi_cntrl->pm_lock);
> >  
> > @@ -1031,7 +1033,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
> >  		count++;
> >  	}
> >  	read_lock_bh(&mhi_cntrl->pm_lock);
> > -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> > +
> > +	/* Ring EV DB only if there is any pending element to process */
> > +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
> >  		mhi_ring_er_db(mhi_event);
> >  	read_unlock_bh(&mhi_cntrl->pm_lock);
> >  
> > -- 
> > 2.7.4
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்
