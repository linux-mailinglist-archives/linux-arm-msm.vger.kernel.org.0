Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8014540E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhKQGfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:35:00 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:22507 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229698AbhKQGfA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:35:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637130722; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=1/vb5KvHpgv8etOoYqFef1xbHBROeESVSBL8QsJJJSc=; b=RNk3zqJ+2cQNducbZQ2e2wIJQsxkF8Wti68UfYtcFYrO852l9t9DuAWOtCmWPGPJ1shBsw/F
 9rZTFa7LG3w/ghCOaf4cN9QMQWwjwpKoKgE0N9T8TRB6S+3WN574o5V2xvmtAXHlqK3IqRMC
 csj4bTWw8FPegLYJSalsrAMqfbA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6194a1e1638a2f4d61f52f70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 06:32:01
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F8BDC43618; Wed, 17 Nov 2021 06:32:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [49.205.244.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CE5CC4338F;
        Wed, 17 Nov 2021 06:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2CE5CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   "Rakesh Pillai" <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org> <1635860673-12146-4-git-send-email-pillair@codeaurora.org> <CAE-0n53PSDzj9owjeaB1bGQ5=255=Q_djEvcQGtZzRxMRMhe1g@mail.gmail.com>
In-Reply-To: <CAE-0n53PSDzj9owjeaB1bGQ5=255=Q_djEvcQGtZzRxMRMhe1g@mail.gmail.com>
Subject: RE: [PATCH v8 3/3] remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
Date:   Wed, 17 Nov 2021 12:01:51 +0530
Message-ID: <000101d7db7c$d2ef1330$78cd3990$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHDHL+CUvw+y47EfzH06QSq/wfqRgJVSCfZAR4Tu/ysFSPgoA==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Wednesday, November 17, 2021 4:25 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; mathieu.poirier@linaro.org; =
ohad@wizery.com;
> p.zabel@pengutronix.de; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org
> Subject: Re: [PATCH v8 3/3] remoteproc: qcom: q6v5_wpss: Add support =
for
> sc7280 WPSS
>=20
> Quoting Rakesh Pillai (2021-11-02 06:44:33)
> > @@ -457,7 +608,13 @@ static int adsp_probe(struct platform_device
> *pdev)
> >         if (ret)
> >                 goto free_rproc;
> >
> > -       pm_runtime_enable(adsp->dev);
> > +       ret =3D qcom_rproc_pds_attach(adsp->dev, adsp->proxy_pds,
> > +                                   desc->proxy_pd_names);
> > +       if (ret < 0) {
> > +               dev_err(&pdev->dev, "Failed to attach proxy power =
domains\n");
> > +               goto free_rproc;
> > +       }
> > +       adsp->proxy_pd_count =3D ret;
>=20
> Can we check this against the define so that we don't have more than =
the
> fixed number of power domains and try to access elements beyond the
> length of the array?

The number of entries populated in the "proxy_pds" array depends on the =
"desc->proxy_pd_names", which is statically
initialized for each remoteproc. Hence there will not be any out of =
bound access for this array.

Thanks,
Rakesh Pillai.

