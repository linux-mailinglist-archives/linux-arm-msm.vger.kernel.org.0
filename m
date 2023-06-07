Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE95A725CF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 13:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238757AbjFGLVv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 07:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239942AbjFGLVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 07:21:50 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F5BE62
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 04:21:48 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-256931ec244so6207508a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686136908; x=1688728908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sXtu7T4BuQTlc5G2QE10guaIjIMheRY/q8IpaabYJXE=;
        b=mJcJOtf9cKn2YYWGd/imMh8cq1rB3fGhC5WYLbJRmA79Z2r356m97G9o9T0VhQ42Or
         dGQ2nwHsJ4TRNWy3H7od5UQpyhwG096mKD468OFXY99pwzrF2BSE37k0C9MnHN5it1nm
         ToW6hfUtdLfQadVYPGvDPW5Ivrc7sHhY8MGVJ2NUL5A4butCHKYWvRDgmSgTBmSQC1Mf
         9CtXIVdDDwEWlNZ7VV6Vwl74N4JWJreGrfVIKIY9ZMvjwZXHX6fsVQ2zE47tv4WQ2lj3
         GOH0dad4BC210GQnP0xEuBUv17WSwMbwPDiPFrgoi2LXCp/laF6+QoADHUZH63rHXcRe
         p49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686136908; x=1688728908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXtu7T4BuQTlc5G2QE10guaIjIMheRY/q8IpaabYJXE=;
        b=GvgycUUCvL8Esds1FBiihagHFlZAyPcw2KKr/bS2tdJ7E4rL52smpdxNaPLIIj4lKA
         4p1+fit51fRX1F3Y2v5WQAV+T5ytUYJlYioVcEUyvzsYmMrkgiX90l+2B9R3TLrGWGPl
         BAENKWwMu6z7F27L6/Av0IPDquuxHswcuB6WIFIT/5gNJaQT8ZpFb3q9YcdLvqYoQ7Wt
         1BiauRda9bdckl3iPH3yBdpRPS3FCtNb+N3G0b/xqSU6YqK1qcqueUlmebfHI6WFRBNt
         vfbBBdtIDAwto/YtQ9By3bXk50rNjos0gJBAPpaWCXoF3cZNDomB6BXMabP4UGXJf0BR
         Wt/Q==
X-Gm-Message-State: AC+VfDyiRe7D3HnBJY0/RhNbweREC7toq1Mw/BQkTF9zZ36BRzRFoGeB
        oQXsrCqgCFzv5Fi/Szt0RX0u
X-Google-Smtp-Source: ACHHUZ75KNTAVNCWXJU3GsKBzmblvZ/f6zZCceUwhTqXHVFfvpwuY3PBfdfhrO3xihSUnq5IJQZR0g==
X-Received: by 2002:a17:90a:195b:b0:259:c015:9fa1 with SMTP id 27-20020a17090a195b00b00259c0159fa1mr1754510pjh.46.1686136908342;
        Wed, 07 Jun 2023 04:21:48 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a001e00b00250bf8495b3sm1217420pja.39.2023.06.07.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 04:21:47 -0700 (PDT)
Date:   Wed, 7 Jun 2023 16:51:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH 1/3] net: Add MHI Endpoint network driver
Message-ID: <20230607112143.GE5025@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <20230606123119.57499-2-manivannan.sadhasivam@linaro.org>
 <ZIA910jCjl+dxc/a@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIA910jCjl+dxc/a@corigine.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 07, 2023 at 10:20:39AM +0200, Simon Horman wrote:
> On Tue, Jun 06, 2023 at 06:01:17PM +0530, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > +static void mhi_ep_net_dev_process_queue_packets(struct work_struct *work)
> > +{
> > +	struct mhi_ep_net_dev *mhi_ep_netdev = container_of(work,
> > +			struct mhi_ep_net_dev, xmit_work);
> > +	struct mhi_ep_device *mdev = mhi_ep_netdev->mdev;
> > +	struct sk_buff_head q;
> > +	struct sk_buff *skb;
> > +	int ret;
> > +
> > +	if (mhi_ep_queue_is_empty(mdev, DMA_FROM_DEVICE)) {
> > +		netif_stop_queue(mhi_ep_netdev->ndev);
> > +		return;
> > +	}
> > +
> > +	__skb_queue_head_init(&q);
> > +
> > +	spin_lock_bh(&mhi_ep_netdev->tx_lock);
> > +	skb_queue_splice_init(&mhi_ep_netdev->tx_buffers, &q);
> > +	spin_unlock_bh(&mhi_ep_netdev->tx_lock);
> > +
> > +	while ((skb = __skb_dequeue(&q))) {
> > +		ret = mhi_ep_queue_skb(mdev, skb);
> > +		if (ret) {
> 
> Hi Manivannan,
> 
> I wonder if this should be kfree_skb(skb);
> 

Good catch! Will fix it.

- Mani

> > +			kfree(skb);
> > +			goto exit_drop;
> > +		}
> 
> ...

-- 
மணிவண்ணன் சதாசிவம்
