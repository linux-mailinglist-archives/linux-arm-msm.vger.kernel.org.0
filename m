Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76AF6C63D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 10:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjCWJjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 05:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjCWJiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 05:38:51 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E821723
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 02:38:01 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id e65so24016279ybh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679564281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qcPIfSaKdOTEn+jIof9gKFWRTvtw5HqbvZyxX2vBTbw=;
        b=PcPGR/t5xUg/3IlIo+7h7vaflki1O/ae3mrPyaq2ggEECNng6lsQvsxV/u7ELe3GGW
         PgagP3I3vDb8V2X58vflzkBl1BpU0ewbX41t2XOXiH7XEExXjDT/8BfWMALvbZIJEHJ0
         eeM7myQd61zTIiVXY/cKyZsVsuITAvjfPfnvQVdnfnoTWwacX2eNmli/d0Km5kZ7RF6R
         or2UW1u1XR4uEq8vPHDfK066MtbBwMKJKdoZomrw5cbZ18zz60dB6QqNaFYrfSMQrcjD
         2AfcWHnsADtTrRXsIwBZkEP1EwBhUvutyiTrwzhAfnhDu2/mYZHhL7xWhnbIwrYbzo87
         /2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679564281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcPIfSaKdOTEn+jIof9gKFWRTvtw5HqbvZyxX2vBTbw=;
        b=2eCg/rzpRaFe/s3ohhpRJrRyFaVZ0agwgZpm1smHmO04gLEXCkVLlBa8N/NpGzStCT
         LhBhxh98RT6mssA+ZpsrU7DnZONQQ/rw+8mkNcg0VqHBv83scD7mp4OSINb93/vpWg7U
         UwKy9XC5nlMn06GfVnyZBv5hmKJeyIjXte+D5nm3Ausg5UENVhVH6bqfGvwHsAWkzoQ0
         zFSgj6vzwvan7ZrkdMeBmZ0ptd6K/TV+146gVqgIVwsM3E2lzNuubAvEq5rNTykXmhxA
         C5x/FNqpIBManS4/nnEKlov3b7t9YT7iROqjzkMZDngu6RnHvKOo0ScJTx2SLD+Gfp0R
         0jFg==
X-Gm-Message-State: AAQBX9czFMGnyYqbnMnz2vRHnUliANbT34WBLgXVFKitxh3I+0eLmX+S
        DUUgFrwAK4oydDrs4a5wjo/G/aq4KGKmCMjw0Nupag==
X-Google-Smtp-Source: AKy350bunR2b4lpHW4k3dwpiyGpnB1KHH3Gfxbs8nhhOtTqhvm4eX90C9giQ8RCnVQH6187Kthtc5Yv/LCMhI9yQbfA=
X-Received: by 2002:a05:6902:a8e:b0:b6c:4d60:1bd6 with SMTP id
 cd14-20020a0569020a8e00b00b6c4d601bd6mr1746918ybb.9.1679564281023; Thu, 23
 Mar 2023 02:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230202064712.5804-2-quic_vboma@quicinc.com> <20230316081509.12201-1-quic_vboma@quicinc.com>
 <0a9e9729-aa5b-4ce6-fc68-394949c1b162@linaro.org> <SJ0PR02MB884886B0E37DA1F69C92503985879@SJ0PR02MB8848.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB884886B0E37DA1F69C92503985879@SJ0PR02MB8848.namprd02.prod.outlook.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 23 Mar 2023 11:37:50 +0200
Message-ID: <CAA8EJppvA=-62EwmOhYXkJO=STbNkLW0ZM5c02fF97Uz0aR-dw@mail.gmail.com>
Subject: Re: [PATCH V3 0/1] Fix for VP9 DRC and Decoder STOP issue.
To:     "Viswanath Boma (Temp)" <vboma@qti.qualcomm.com>
Cc:     "Viswanath Boma (Temp) (QUIC)" <quic_vboma@quicinc.com>,
        "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Mar 2023 at 11:22, Viswanath Boma (Temp)
<vboma@qti.qualcomm.com> wrote:
>
> HI Dmirty,
>
> Thanks for Reviews .
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Thursday, March 16, 2023 6:08 PM
> > To: Viswanath Boma (Temp) (QUIC) <quic_vboma@quicinc.com>;
> > stanimir.varbanov@linaro.org; Vikash Garodia (QUIC)
> > <quic_vgarodia@quicinc.com>; Andy Gross <agross@kernel.org>;
> > bjorn.andersson@linaro.org; Konrad Dybcio <konrad.dybcio@linaro.org>;
> > Mauro Carvalho Chehab <mchehab@kernel.org>; linux-
> > media@vger.kernel.org; linux-arm-msm@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH V3 0/1] Fix for VP9 DRC and Decoder STOP issue.
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > any links or attachments, and do not enable macros.

Can we please get rid of this in the replies? There is no need to
duplicate headers.

> >
> > On 16/03/2023 10:15, quic_vboma@quicinc.com wrote:
> > > From: Viswanath Boma <quic_vboma@quicinc.com>
> > >
> > > Fixed indent comments, ensured rebase and checkpatch with --strict.
> > > Tested the changes on v5.15 and v5.4 kernels .
> >
> > Was it tested on top of the recent kernels?
> >
> Yes, Ensured on the latest .

Then why do you mention old kernels at all? Also the email addresses
you have used do not correspond to the latest kernels.

>
> > > For testing Chrome Utilities were used .
> > >
> > > Viswanath Boma (1):
> > >    venus: Enable sufficient sequence change support for sc7180 and fix
> > >      for Decoder STOP command issue.
> > >
> > >   drivers/media/platform/qcom/venus/core.h       | 18 ++++++++++++++++++
> > >   drivers/media/platform/qcom/venus/hfi_cmds.c   |  1 +
> > >   drivers/media/platform/qcom/venus/hfi_helper.h |  2 ++
> > >   drivers/media/platform/qcom/venus/hfi_msgs.c   | 11 +++++++++--
> > >   drivers/media/platform/qcom/venus/vdec.c       | 12 +++++++++++-
> > >   5 files changed, 41 insertions(+), 3 deletions(-)
> > >
> >
> > --
> > With best wishes
> > Dmitry
>


-- 
With best wishes
Dmitry
