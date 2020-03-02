Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42CAD175428
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 07:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgCBGzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 01:55:55 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50715 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgCBGzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 01:55:55 -0500
Received: by mail-pj1-f67.google.com with SMTP id nm14so1283103pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2020 22:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8/jJwfsO/hMGjU6F0xRuxSCi7oATNbVJFqcLWJXKQlU=;
        b=feRHnOqmJGnxbNIJ7tQvRXUSZTZAY4fcBnHvsE+gESsXwSAbUzLjz5IMWboPq0rzV6
         OzgA+oCfbGj1LMw4gwREdcllwOPUza4rmaL+ne/Hvzh+iIhCRaIQNHvfN4kWXFmoj2dV
         18W9ubZM36V6O5n4JjEN47I2dKG2s6QgiaEPgxzsvjfltovM9j0b0xmEaQSm+7hxEQMo
         nsRH/Bqp7GyYfzbktJILjyqKg2E6W5M7L+qUdYnmLRjMLvc24ZLKBmEnMuYaLEsFRn9Y
         xckFCs9aQHRnOkP2NhS+UeqOny/2ExLCh2LAuD0sDtt2FnEQHCQZqcqhfdJyKxEd1pEL
         /wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8/jJwfsO/hMGjU6F0xRuxSCi7oATNbVJFqcLWJXKQlU=;
        b=Kmxa+lG6rEkr5MVAGvRdvjKWI7azuCJ1FhuybPNWan1UD9vOUX01We2Ey4CJcOd7IU
         i8Aij35yM+YxPMyEjzBTbBTbbAfQJEprePZRI9zKRR03YudtvVojDAOACG6fOmDu4R9+
         HjfQH6V6Ebl/W0wWyBw3BONxngU/UZVFdnNkC1aJhwUC7b9nDFTx07iaEh1gCaNdTcMH
         zKgsg8IH81fknRm0mK4+yWY7UBDUaHlszgwz81FDMhxbv0HsaXPzgX4xe+/uYS28edKm
         Da7g+VrRO9CrKuWjjZ7fIpyCHDFT+mTgLR2CRgkeZmCPhslEDYJPddNkbNTkECnG+SkC
         hR/g==
X-Gm-Message-State: APjAAAXgINSQsPlUBgcHWxGwCfOumdJ57bE46h9gHCvWeqn6QGjYNSb+
        ZKOwB/cBi/S431IGx/8uvcZ+9w==
X-Google-Smtp-Source: APXvYqxxF+h10WuOjzLNgSLgjC6x+I1GajyoqqglQhktKXV+4qMD0GWozaXB3VZHznTmWa7dzF/76w==
X-Received: by 2002:a17:90a:da01:: with SMTP id e1mr20153262pjv.100.1583132154120;
        Sun, 01 Mar 2020 22:55:54 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w25sm19164387pfi.106.2020.03.01.22.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 22:55:53 -0800 (PST)
Date:   Sun, 1 Mar 2020 22:55:51 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] net: qrtr: Fix FIXME related to qrtr_ns_init()
Message-ID: <20200302065551.GH210720@yoga>
References: <20200302032527.552916-1-bjorn.andersson@linaro.org>
 <20200302032527.552916-3-bjorn.andersson@linaro.org>
 <20200302055510.GB23607@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302055510.GB23607@Mani-XPS-13-9360>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 01 Mar 21:55 PST 2020, Manivannan Sadhasivam wrote:

> On Sun, Mar 01, 2020 at 07:25:27PM -0800, Bjorn Andersson wrote:
> > The 2 second delay before calling qrtr_ns_init() meant that the remote
> > processors would register as endpoints in qrtr and the say_hello() call
> > would therefor broadcast the outgoing HELLO to them. With the HELLO
> > handshake corrected this delay is no longer needed.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  net/qrtr/ns.c   | 2 +-
> >  net/qrtr/qrtr.c | 6 +-----
> >  net/qrtr/qrtr.h | 2 +-
> >  3 files changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> > index e3f11052b5f6..cfd4bd07a62b 100644
> > --- a/net/qrtr/ns.c
> > +++ b/net/qrtr/ns.c
> > @@ -693,7 +693,7 @@ static void qrtr_ns_data_ready(struct sock *sk)
> >  	queue_work(qrtr_ns.workqueue, &qrtr_ns.work);
> >  }
> >  
> > -void qrtr_ns_init(struct work_struct *work)
> > +void qrtr_ns_init(void)
> >  {
> >  	struct sockaddr_qrtr sq;
> >  	int ret;
> > diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
> > index 423310896285..313d3194018a 100644
> > --- a/net/qrtr/qrtr.c
> > +++ b/net/qrtr/qrtr.c
> > @@ -1263,11 +1263,7 @@ static int __init qrtr_proto_init(void)
> >  		return rc;
> >  	}
> >  
> > -	/* FIXME: Currently, this 2s delay is required to catch the NEW_SERVER
> > -	 * messages from routers. But the fix could be somewhere else.
> > -	 */
> > -	INIT_DELAYED_WORK(&qrtr_ns_work, qrtr_ns_init);
> > -	schedule_delayed_work(&qrtr_ns_work, msecs_to_jiffies(2000));
> > +	qrtr_ns_init();
> >  
> 
> You forgot to remove the below instances of delayed_work:
> 
> #include <linux/workqueue.h>
> struct delayed_work qrtr_ns_work;
> cancel_delayed_work_sync(&qrtr_ns_work);
> 

I sure did, thanks for noticing.

Regards,
Bjorn

> Other than that,
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
> >  	return rc;
> >  }
> > diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
> > index 53a237a28971..dc2b67f17927 100644
> > --- a/net/qrtr/qrtr.h
> > +++ b/net/qrtr/qrtr.h
> > @@ -29,7 +29,7 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep);
> >  
> >  int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len);
> >  
> > -void qrtr_ns_init(struct work_struct *work);
> > +void qrtr_ns_init(void);
> >  
> >  void qrtr_ns_remove(void);
> >  
> > -- 
> > 2.24.0
> > 
