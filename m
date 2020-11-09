Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632A72AB51B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 11:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgKIKgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 05:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgKIKgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 05:36:00 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1DFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 02:36:00 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id r10so6771309pgb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 02:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HQ1/cCsGH4zhTXEL1omQLSlUuW9f89xTkR8XT4vTbP8=;
        b=ty39HVcWlT4BHMJG0FxUYpqT5o+Mb5pdRonM1J5HWKmMS9BEhLQNThhxNmxow/B4T8
         A6IRn+O2sm9P8hoxb413fmW3qFkP5tL1pj8oxEw9nQmxOkE6Tleub9DZ7g7fAXAiRb0k
         r4mAIRgEZDYKOeiHs8SbbuYYbcSjRJ9qvw+rDS4tdX6ZHGBVCimCARqX61/9ejK8JtOz
         ipSAxJwoRQXWGQMhEqSkRKVrfzQQWc09VuxOR7HKeI5yUzEk0A2Y8jHd1qHMpfeAKZ7s
         t79GpAsm3arRWK1LxC4SDUAHlsmeBl5KnnzgZIIeTR8Q3QfxYw5VfPDr7og6RChwtPYK
         2u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HQ1/cCsGH4zhTXEL1omQLSlUuW9f89xTkR8XT4vTbP8=;
        b=EBCslPR99W8ipsg46E2HQOoxjV2o++Sjibj8xmCQ4SL466tAeF6pZOdNWzZGb1a2bh
         oqYxfteuDQJFJniEd3Nwt1LiipUMb+qnDCrV2digPZly2OUTJJxQd/aNGMgeSmMbhkdV
         uuHFrDMIxaTL4ofvDlcvUOiFNuDJY4y2/rBgS7Q5vJQ2uaUcHSXSZcpFDlNM8Q9CfMWl
         VnpnngasZQHBGm+EbkXDs7N33zcRJ1Bsx56yzHzfc/PcI+8WhqreAbMfLdwzyWT3AxhQ
         zOcNRdXfly/gIfS2JAVUtPYjsgY+2Abd6YNF6CRMNW+P+AcjgeWYF6X96dyt2KFdN4GI
         pc6A==
X-Gm-Message-State: AOAM530XdBUbb2zUP2t/nhmdAoafUq0/8GPXXqCsIfueW39rK672b/eK
        pyd8d6LNwsnx7136+Aj8ynZD
X-Google-Smtp-Source: ABdhPJywxXqzYmrfCQ+QsYfi0RRDG06ZpbGsXlrz9jN9CRSPc+3r0q7Xld6ZwwwiFlzPa/iUdDoS7A==
X-Received: by 2002:a63:f14:: with SMTP id e20mr12856557pgl.52.1604918159591;
        Mon, 09 Nov 2020 02:35:59 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id t32sm10323467pgl.0.2020.11.09.02.35.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 02:35:58 -0800 (PST)
Date:   Mon, 9 Nov 2020 16:05:54 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: Re: [PATCH] bus: mhi: Add inbound buffers allocation flag
Message-ID: <20201109103554.GC24289@work>
References: <1600874218-10815-1-git-send-email-loic.poulain@linaro.org>
 <CAMZdPi9EvP-umfpmS-yTK+5Snx-qDcpfkkq_dtExKZjXG4atMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi9EvP-umfpmS-yTK+5Snx-qDcpfkkq_dtExKZjXG4atMg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On Tue, Sep 29, 2020 at 03:37:12PM +0200, Loic Poulain wrote:
> On Wed, 23 Sep 2020 at 17:11, Loic Poulain <loic.poulain@linaro.org> wrote:
> 
> > Currently, the MHI controller driver defines which channels should
> > have their inbound buffers allocated and queued. But ideally, this is
> > something that should be decided by the MHI device driver instead,
> > which actually deals with that buffers.
> >
> > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > if buffers have to be allocated and queued by the MHI stack.
> >
> > Keep auto_queue flag for now, but should be removed at some point.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> >
> 
> Please, discard this one, since it will request ath11k and qrtr update as
> well.
> I'll send that in a new series.
> 

Is this part of any series?

Thanks,
Mani

> Regards,
> Loic
