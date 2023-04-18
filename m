Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF2B6E5CC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 11:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjDRJDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 05:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjDRJC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 05:02:59 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920B34ED0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:02:57 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-54fe82d8bf5so134880637b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681808577; x=1684400577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q3Aq3UeThcjyQHwpjXcMomx6rO6mRd481lmdvuh5Oow=;
        b=Xy6ZmrI/H0Kdia05qrYa2I/WhsZZI5u5+m6+ENsTFURUqUVrzDW40RFuF1g+6cqKX5
         9qtLn6juoiUfREGdxk+XeVnvgU5/QkI30uyOUKs8kUpR1gpw+6NeOqzW7mOOdYwRheDn
         GfximeNcodzU7Lu8JzWh47VeMlfig9jelyGSSRGZHNTFrEpaJ1Ip4KSxx4KQDebkFpbS
         01LKX3SsGYAWC7nCbA+mOiPXjJX5w4fYpznwzELFYXjYePPyZFPCFGipf+fybblD4K9z
         FYYw3M+zDR/HalIG4VQ6GlVvXuNRG3FdtSkXZcL08AG6fzcRPvCxj2LyoBQpUocFyqv9
         pUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681808577; x=1684400577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3Aq3UeThcjyQHwpjXcMomx6rO6mRd481lmdvuh5Oow=;
        b=ftvhYm0jGn/7kcxEOCz6euk6O+VBpilYAnOOxf5Meh9wHLQm1E5uf3fOHV8WLutp3W
         8mHSqloEI16FKAX4jozKFmEGze39R0hUyC4I/hVfkCNbKd1JJF4TDZoWeP0fDNmwXT7N
         +HcUfuujbbf8CISOOUOOCZh916mUebePOGxPZGBkLzgGG4m0A6xedA6JATPzWkYKh+mS
         whXzWbTMo2eVvVIpj4mnKuRFI3caCplhycKDIclV+JQeViVWWAm7zUy2ll/7xaY7nUEX
         h1Iju82JMJFyEcrJu2/AnPpJE1ApPrrXQQ5kzBwgIM/qQJhhtTt32te1lDS2J/NKH09V
         t9Xw==
X-Gm-Message-State: AAQBX9e2yRV0979H4JsCxY9sQx7fwQN2PrzBFcs4CmUEPZHJNOL4fZfU
        rd8KCk9/VxnVnbziuSIZgcfCBrXPgo34eX+Ja8bq3w==
X-Google-Smtp-Source: AKy350amoDVVD88+7xkB0c1Jy4Ume5+tTHb+L2xXcEeYeooa1Sr2o51iKrN5St2NFM68tB8MlRjVe8jcwud4C0j+y0w=
X-Received: by 2002:a0d:d8cc:0:b0:54d:c121:6c88 with SMTP id
 a195-20020a0dd8cc000000b0054dc1216c88mr18441840ywe.20.1681808576751; Tue, 18
 Apr 2023 02:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230413064344.18714-1-quic_tjiang@quicinc.com>
 <CAA8EJpoc4nn+Wr131-o=YQoDeL0t7aj9hC=8NNnJa3SeHwgJ-w@mail.gmail.com> <934c32ef9427464a9d0b898b843df6ab@quicinc.com>
In-Reply-To: <934c32ef9427464a9d0b898b843df6ab@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 18 Apr 2023 12:02:45 +0300
Message-ID: <CAA8EJpqz9o9CtAnXRE86kw-cfL=_d-c5BDAXwQLSJAyZRy_fEg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: btusb: Add WCN6855 devcoredump support
To:     "Tim Jiang (QUIC)" <quic_tjiang@quicinc.com>
Cc:     "marcel@holtmann.org" <marcel@holtmann.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>,
        "Hemant Gupta (QUIC)" <quic_hemantg@quicinc.com>,
        "mka@chromium.org" <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Apr 2023 at 04:02, Tim Jiang (QUIC) <quic_tjiang@quicinc.com> wrote:
>
> Hi Dmitry:
>
> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Saturday, April 15, 2023 5:03 AM
> To: Tim Jiang (QUIC) <quic_tjiang@quicinc.com>
> Cc: marcel@holtmann.org; linux-kernel@vger.kernel.org; linux-bluetooth@vger.kernel.org; linux-arm-msm@vger.kernel.org; Balakrishna Godavarthi (QUIC) <quic_bgodavar@quicinc.com>; Hemant Gupta (QUIC) <quic_hemantg@quicinc.com>; mka@chromium.org
> Subject: Re: [PATCH v2] Bluetooth: btusb: Add WCN6855 devcoredump support
>
> On Thu, 13 Apr 2023 at 09:44, Tim Jiang <quic_tjiang@quicinc.com> wrote:
> >
> > WCN6855 will report memdump via ACL data or HCI event when it get
> > crashed, so we collect memdump to debug firmware.
>
> Is it applicable only to wcn6855 or to some of earlier chips too?
>  [Tim]  Also applicable to earlier chips , but currently google only require us to support wcn6855

Since upstream is not a google kernel, please enable this feature for
all relevant chipsets.

>
> >
> > Signed-off-by: Tim Jiang <quic_tjiang@quicinc.com>
> > ---
> >  drivers/bluetooth/btusb.c | 222
> > ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 222 insertions(+)




-- 
With best wishes
Dmitry
