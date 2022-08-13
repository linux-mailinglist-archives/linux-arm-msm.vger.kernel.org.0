Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3E0591978
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Aug 2022 10:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbiHMIpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Aug 2022 04:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbiHMIpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Aug 2022 04:45:38 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E3F27B29
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Aug 2022 01:45:37 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so2784390pjf.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Aug 2022 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=B7Wnz4Bht8Eyjqfh8zm/V2fAnqv2K+eRz755j997iSY=;
        b=KcxRw1sPtS+WA4qyxyirPnPFNNqe1feGZSmwXDmVMmxYwC0YbmJQG5hQ6zNXZOmL+P
         zlr3J5kYyFmBHVRW2DLvzdB05W0LngoZ05cuEAbozSg16akPFFJMrLuYu0kMlPYHVuHt
         7lGzPlWdNI8E4JJhsrH7y8fPDYBTC+pqheCqn9N/sJGS1MVTzOaGYEqwD+Glc4o84KZz
         4xSk/Z5nzJgcyBGuj4LVPH7zumtKMr9Ufo5I5KUEPpQp/BgNA8tHxj/zpaQWT+WTXIcQ
         v0OhLFtxvqa3dQ+sIQIGXxD9kVdqOv2mX7Z8KdVLeDxv9lEYKr1fM3xhnTCvBx/sPIVW
         UjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=B7Wnz4Bht8Eyjqfh8zm/V2fAnqv2K+eRz755j997iSY=;
        b=vxrV+EcoK1tOH4oLHvRaqb1Ve0BY29EbeuPiEbg2nCKsjrGLELz/PFgVDyh6n4sT3X
         ESPBEhqCw1VBr15/uZG8e2+VP1a6vOITflMiIu5e/1ncipkRh++LsvTAIoeEOPca1e75
         L43XaDgwRVa5rgTIqK8LIByPtXd+Xc9Ci537lvdnXiIPBhqg8j3AZpgoffl4o5EQJtwt
         T6G8JqVw+My9oOEvGwy7mrqyUniUYcYXkrWIyMUG0t4Bwp2jeyik1dtFymhxeQPen7ZN
         lfMtLn7OZ0PO6MijYQQBpwaNS3uUPynK5IJkCSvlVWv8osVyC74BKehNaEJtcgE3boGr
         c6kg==
X-Gm-Message-State: ACgBeo1VyIJx7FJIFjM8lrz7W8oHUd7eXM+gDemXhf75XjjgMGmfvP/i
        gixbdn+vXFwP7gu3v9QKXC3GDx/+uVRVBkcT+3oMqA==
X-Google-Smtp-Source: AA6agR6yznhnbMpZolOFIbDn2QjRlymXcXG6NJOPTvlnFVUTjN8g8oVRCAs1+cIEGlsUf+sBdEKzbm/exsT4kpmJppQ=
X-Received: by 2002:a17:90b:38c2:b0:1fa:5d1f:d1f6 with SMTP id
 nn2-20020a17090b38c200b001fa5d1fd1f6mr2796059pjb.159.1660380336538; Sat, 13
 Aug 2022 01:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220811094840.1654088-1-fido_max@inbox.ru> <20220812170926.0370b05d@kernel.org>
In-Reply-To: <20220812170926.0370b05d@kernel.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Sat, 13 Aug 2022 10:45:00 +0200
Message-ID: <CAMZdPi-ESEHnWVa16tSktLZKOk=r2_2t_S+AwjAx-s3dNwbyTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] net: qrtr: start MHI channel after endpoit creation
To:     Jakub Kicinski <kuba@kernel.org>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 13 Aug 2022 at 02:09, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 11 Aug 2022 12:48:40 +0300 Maxim Kochetkov wrote:
> > MHI channel may generates event/interrupt right after enabling.
> > It may leads to 2 race conditions issues.
> >
> > 1)
> > Such event may be dropped by qcom_mhi_qrtr_dl_callback() at check:
> >
> >       if (!qdev || mhi_res->transaction_status)
> >               return;
> >
> > Because dev_set_drvdata(&mhi_dev->dev, qdev) may be not performed at
> > this moment. In this situation qrtr-ns will be unable to enumerate
> > services in device.
> > ---------------------------------------------------------------
> >
> > 2)
> > Such event may come at the moment after dev_set_drvdata() and
> > before qrtr_endpoint_register(). In this case kernel will panic with
> > accessing wrong pointer at qcom_mhi_qrtr_dl_callback():
> >
> >       rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
> >                               mhi_res->bytes_xferd);
> >
> > Because endpoint is not created yet.
> > --------------------------------------------------------------
> > So move mhi_prepare_for_transfer_autoqueue after endpoint creation
> > to fix it.
> >
> > Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
> > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> > Reviewed-by: Hemant Kumar <quic_hemantk@quicinc.com>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>


>
> You must CC the author of the patch under Fixes, they are usually
> the best person to review the fix. Adding Loic now.
>
> > diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> > index 18196e1c8c2f..9ced13c0627a 100644
> > --- a/net/qrtr/mhi.c
> > +++ b/net/qrtr/mhi.c
> > @@ -78,11 +78,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> >       struct qrtr_mhi_dev *qdev;
> >       int rc;
> >
> > -     /* start channels */
> > -     rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> > -     if (rc)
> > -             return rc;
> > -
> >       qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
> >       if (!qdev)
> >               return -ENOMEM;
> > @@ -96,6 +91,13 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> >       if (rc)
> >               return rc;
> >
> > +     /* start channels */
> > +     rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> > +     if (rc) {
> > +             qrtr_endpoint_unregister(&qdev->ep);
> > +             return rc;
> > +     }
> > +
> >       dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
> >
> >       return 0;
>
