Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6594538CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 18:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239099AbhKPRw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 12:52:29 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:40983 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239089AbhKPRwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 12:52:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637084954; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=RpXTxXojtSMaFiAviBxl1ly/oJ2rVFyQHcVBvJ3tF/A=; b=Dfmv0ab8Ka+b38g8EBAuEOYg8cmBae1gUDP9M7LpRWLaIZD2AN2jTftk+2Vyq+uX+uS7/nVM
 D0SRNtivGjau/15sxIq0dRrucNftop3SxR/SLrENX+xAZ2dolH/pwEeFFd2lzFyc1kYHcLX1
 Zkf5gfDbuHeYezLugK4HdBZHGmM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6193ef195bbbed1f707c434a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 17:49:13
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC34AC43619; Tue, 16 Nov 2021 17:49:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [49.205.244.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 90822C4338F;
        Tue, 16 Nov 2021 17:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 90822C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org> <1635860673-12146-4-git-send-email-pillair@codeaurora.org> <CAE-0n52effcajLwjOY_v-pjp68ytkb-zo4R9EHp3CQi=yB8nPQ@mail.gmail.com>
In-Reply-To: <CAE-0n52effcajLwjOY_v-pjp68ytkb-zo4R9EHp3CQi=yB8nPQ@mail.gmail.com>
Subject: RE: [PATCH v8 3/3] remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
Date:   Tue, 16 Nov 2021 23:19:05 +0530
Message-ID: <00ea01d7db12$43b6d9b0$cb248d10$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHDHL+CUvw+y47EfzH06QSq/wfqRgJVSCfZAjsT72usC2fSsA==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Tuesday, November 16, 2021 5:13 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; mathieu.poirier@linaro.org; ohad@wizery.com;
> p.zabel@pengutronix.de; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org
> Subject: Re: [PATCH v8 3/3] remoteproc: qcom: q6v5_wpss: Add support for
> sc7280 WPSS
> 
> Quoting Rakesh Pillai (2021-11-02 06:44:33)
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> b/drivers/remoteproc/qcom_q6v5_adsp.c
> > index 098362e6..e2e8d33 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -435,12 +571,22 @@ static int adsp_probe(struct platform_device
> *pdev)
> >         if (!desc)
> >                 return -EINVAL;
> >
> > +       firmware_name = desc->firmware_name;
> > +       ret = of_property_read_string(pdev->dev.of_node, "firmware-
> name",
> 
> Is this documented in the binding? If not, please add it.

Hi Stephen,
"firmware-name" is already documented in the bindings.

Thanks,
Rakesh Pillai.

