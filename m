Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9DD67663C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 07:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjG1FvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 01:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjG1FvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 01:51:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611312682
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 22:51:00 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-317744867a6so1718953f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690523459; x=1691128259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSuglWWWuvnTAwFecP2fdurJw0H3jPVUPOnEpGUZ84k=;
        b=Pf+35Ea2+OP5qEt+XA1bRQIY1QwBMwcoOV0F1MhOgDlOtPmqo1Vl84lahKA+PwNA5p
         7MV1xJr76S9kyHKrotCUbiCMrdH2eNSZTrFl0Z9OVRJv4cHs54ff9UMiIyTiUS0aUdxE
         /MjHJBbmaJJ1L4I7Ka+yWZRh7oKeaGkPQiVED9tR8qZoUB1BD5979MgdCpYP7vEtbsQY
         BsRz5B+PmEUweiMqgAh+o8olOE0S2FIydic3R6lvXO3XWs4IJPOpGp0AQa/Mn56VpFWO
         MWO8cMxv4Lmd4W9Ch20KgCvZT2O/vYPh3PsoCsTcyrF/9bj1Z25Hntm1V8jFk0hJK41B
         kb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523459; x=1691128259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSuglWWWuvnTAwFecP2fdurJw0H3jPVUPOnEpGUZ84k=;
        b=dPgepD8GGDd/3yxQnlfhiWlmlqK0m5v59U5/0dDvZc0K9RGFi2LJyK0xAyniTKWBDn
         XNwW8alVfqjmt3EJ9++dux/AkUUrnEOxhp0oksUqKOV+ZSfDk+UoBKOi3K6a0+SG8Hxc
         eVtoPMNFI8hHlVRqDtqfkdwj2pgsuKxQrmSRrS/gLevXE4uItnffqF8JNxpIXsjjpZPl
         Z6fsWVgjMMQlBV+dyVJV7rRv4sPNBzDqLZQHrgAymqW8yK5uOQhpLuKjR6vl4EZdh3f2
         C0lLNw8Du+Ak9d46bqzAGMjPr9XX5j1f//MAveDm4wLM4rvLm1Hma5E4jfIxpz0ILMOK
         wAkA==
X-Gm-Message-State: ABy/qLZ735AYu7HTL+v29U5mlBZE9HMkrW1d3BE4TXyAE/2mi+gI96k2
        /S/sJOYaw2eddmC4HPzj1WIyzUYOnUCVJCtZfnM=
X-Google-Smtp-Source: APBJJlFaG8h7Fj0j7Unr5sC2nd3IjUGHzuPwquodiSKRNodcz43RwOaO6l+fbEz0F9h4adT+oF4H6Q==
X-Received: by 2002:adf:fa03:0:b0:317:7441:1a4 with SMTP id m3-20020adffa03000000b00317744101a4mr840161wrr.29.1690523458882;
        Thu, 27 Jul 2023 22:50:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm3835498wrn.52.2023.07.27.22.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:50:58 -0700 (PDT)
Date:   Fri, 28 Jul 2023 08:50:55 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, krzysztof.kozlowski@linaro.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v4 9/9] bus: mhi: ep: wake up host if the MHI state is in
 M3
Message-ID: <15a19a2d-d6e8-4fbc-a31d-561cff00b01a@kadam.mountain>
References: <1689232218-28265-1-git-send-email-quic_krichai@quicinc.com>
 <1689232218-28265-10-git-send-email-quic_krichai@quicinc.com>
 <20230728043452.GI4433@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728043452.GI4433@thinkpad>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 28, 2023 at 10:04:52AM +0530, Manivannan Sadhasivam wrote:
> > @@ -464,6 +484,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> >  	buf_left = skb->len;
> >  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
> >  
> > +	if (mhi_cntrl->mhi_state == MHI_STATE_M3) {
> > +		if (mhi_ep_wake_host(mhi_cntrl)) {
> 
> Don't you need lock here in the case of multiple queue requests?
> 
> - Mani
> 
> > +			dev_err(dev, "Failed to wakeup host\n");
> > +			return -ENODEV;
> > +		}
> > +	}
> > +
> >  	mutex_lock(&mhi_chan->lock);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^
This lock isn't enough?

regards,
dan carpenter
