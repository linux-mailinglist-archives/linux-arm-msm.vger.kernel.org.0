Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E6357A885
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 22:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240351AbiGSUvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 16:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240358AbiGSUvF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 16:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 147AC4B0E7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658263859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KLYjLPmh6TJHSo85bLGpDWqvGEwFmv1ujqnWhvAf7WE=;
        b=jVmEu/WHIl+soT5bRNT2oUN266bD+BUqLVXrGf+I31K7tqTEyGPuQWCWwRC2by6gJV2i0y
        Yni8pGOUFaL5qshuoC37ymaYaweT31OUZM/Ono0/4JB/04hyWos+h1qF89ZoBAZyCo/vS6
        53tIa8uBdztSgA758S752Le3Uq9AYNo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-XrQqOJ8OMJqPheT7paYVxg-1; Tue, 19 Jul 2022 16:50:58 -0400
X-MC-Unique: XrQqOJ8OMJqPheT7paYVxg-1
Received: by mail-qt1-f198.google.com with SMTP id q21-20020ac84115000000b0031bf60d9b35so10870362qtl.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KLYjLPmh6TJHSo85bLGpDWqvGEwFmv1ujqnWhvAf7WE=;
        b=VqVOMiD2RYt8GUGevk8ZUGVTp7ln7V2ub96vIQqIPMoYy5WaROb5ix24cZnb0N3LL/
         mZxrV4EvBZou92R+Ck6oOECgi/LnCuyFRIIfanO6ep6k3IjpGO1xj8NALrXOeCoj+0SV
         fnW9BME3bHu9pXBWVvk59osyMjhO+u20sazV1Hw1E7ry8NbCe9e3qmvZ/tLi+hS78auh
         7YA/DdOaaKo+YsMUOS7Hbv887l6rpvsHcpOYuK0tlXcLYVqEYJAeDtXxA+MDE7mz8wNA
         0wikseGRkkL9MdWxfTKivE4iK9rRo1X6M4Wc0zwVTRTW7FpcKe2Z0zmrbeWMyKKrw39N
         GEYQ==
X-Gm-Message-State: AJIora/Ufn6lokT2q3h4dZRRezOWenPO/nm3A4j5eDnv85v9Gitygx7h
        oeEVircxktO6jjLtr0Xn/rK+paKAJ3Cjo5ls4iO80QDizduacUZS56J+ehkf6eUvkef1jin/I8p
        iiyG+7emRBazoVLo8b2oMufICWQ==
X-Received: by 2002:ac8:7dcc:0:b0:31e:f21c:45b9 with SMTP id c12-20020ac87dcc000000b0031ef21c45b9mr8052146qte.133.1658263857736;
        Tue, 19 Jul 2022 13:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzoXesGuCrLRPfo4M//fgvXvF5fsn1Z0nYeFj7o2Nf6Zzm1jCriA5qoxx+oHAtNlsi4JFPgw==
X-Received: by 2002:ac8:7dcc:0:b0:31e:f21c:45b9 with SMTP id c12-20020ac87dcc000000b0031ef21c45b9mr8052128qte.133.1658263857483;
        Tue, 19 Jul 2022 13:50:57 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id h11-20020a05620a400b00b006b60c965024sm303742qko.113.2022.07.19.13.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 13:50:57 -0700 (PDT)
Date:   Tue, 19 Jul 2022 15:50:54 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Propagate GENI_ABORT_DONE to
 geni_i2c_abort_xfer()
Message-ID: <20220719205054.rdhinuwxgabbsiht@halaneylaptop>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-3-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 16, 2022 at 08:50:26PM -0700, Bjorn Andersson wrote:
> Waiting for M_CMD_ABORT_EN in geni_i2c_abort_xfer() races with the
> interrupt handler which will read and clear the abort bit, the result is
> that every abort attempt takes 1 second and is followed by a message
> about the abort having times out.
> 
> Introduce a new state variable to carry the abort_done state from the
> interrupt handler back to geni_i2c_abort_xfer().
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 3bec7c782824..e212e7ae7ad2 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -97,6 +97,7 @@ struct geni_i2c_dev {
>  	struct dma_chan *tx_c;
>  	struct dma_chan *rx_c;
>  	bool gpi_mode;
> +	bool abort_done;
>  };
>  
>  struct geni_i2c_err_log {
> @@ -203,9 +204,14 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
>  		dev_dbg(gi2c->se.dev, "len:%d, slv-addr:0x%x, RD/WR:%d\n",
>  			gi2c->cur->len, gi2c->cur->addr, gi2c->cur->flags);
>  
> -	if (err != NACK && err != GENI_ABORT_DONE) {
> +	switch (err) {
> +	case GENI_ABORT_DONE:
> +		gi2c->abort_done = true;
> +		break;
> +	default:
>  		dev_err(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
>  		geni_i2c_err_misc(gi2c);
> +		break;
>  	}
>  }
>  

If I'm reading this right this changes the behavior on a NACK error now,
right? Was that intentional?

Otherwise looks good to me.

> @@ -311,21 +317,21 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>  
>  static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
>  {
> -	u32 val;
>  	unsigned long time_left = ABORT_TIMEOUT;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&gi2c->lock, flags);
>  	geni_i2c_err(gi2c, GENI_TIMEOUT);
>  	gi2c->cur = NULL;
> +	gi2c->abort_done = false;
>  	geni_se_abort_m_cmd(&gi2c->se);
>  	spin_unlock_irqrestore(&gi2c->lock, flags);
> +
>  	do {
>  		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
> -		val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
> -	} while (!(val & M_CMD_ABORT_EN) && time_left);
> +	} while (!gi2c->abort_done && time_left);
>  
> -	if (!(val & M_CMD_ABORT_EN))
> +	if (!time_left)
>  		dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
>  }
>  
> -- 
> 2.35.1
> 

