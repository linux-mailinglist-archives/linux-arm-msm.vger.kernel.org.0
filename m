Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC094569B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 06:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhKSF2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 00:28:14 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:63525 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbhKSF2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 00:28:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637299512; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=Y6ORcJ/iVAeVC11+p/N6i64GLnQ9MUTHmqnbpbXYcik=; b=Cg8NAhNAEFz9fav1xdTb5O2wceAg1//AeOgX+FPrSBY9DXpJdyhtZUyznkPiZUMWX+brNMQO
 xbeHrq6sTqlUTutE5ETM5/3niYaCuF0Mw2nZ3lnVGf5JJ1rY+ABdY0W4JemXrbSJjRZW5rUZ
 VdrgV5U2L7cLuSaUNLdSi5vYBZM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61973538665450d43a81a426 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 05:25:12
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97015C43618; Fri, 19 Nov 2021 05:25:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [49.205.244.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96AA0C4360C;
        Fri, 19 Nov 2021 05:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96AA0C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   "Rakesh Pillai" <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1637251016-21923-1-git-send-email-pillair@codeaurora.org> <CAE-0n51Z7qimY3k5qCYO5vAJ6o_skfUZL8xYpWN8a+2ThNVUGw@mail.gmail.com>
In-Reply-To: <CAE-0n51Z7qimY3k5qCYO5vAJ6o_skfUZL8xYpWN8a+2ThNVUGw@mail.gmail.com>
Subject: RE: [PATCH v6] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Date:   Fri, 19 Nov 2021 10:55:04 +0530
Message-ID: <002701d7dd05$d252b690$76f823b0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH/i79kdRymrv4IW6PKFp/g5AMsTgFcupF9q7AN/ZA=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Friday, November 19, 2021 6:22 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; sibis@codeaurora.org; mpubbise@codeaurora.org;
> kuabhs@chromium.org
> Subject: Re: [PATCH v6] arm64: dts: qcom: sc7280: Add WPSS remoteproc
> node
> 
> Quoting Rakesh Pillai (2021-11-18 07:56:56)
> > Add the WPSS remoteproc node in dts for PIL loading.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> > Changes from v5:
> > - Update the clock names
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  4 +++
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 56
> +++++++++++++++++++++++++++++++++
> >  2 files changed, 60 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > index 9b991ba..ddab150 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > @@ -80,3 +80,7 @@
> >                 qcom,pre-scaling = <1 1>;
> >         };
> >  };
> > +
> > +&remoteproc_wpss {
> > +       status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 365a2e0..76c2a90 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -134,6 +134,11 @@
> >                         no-map;
> >                 };
> >
> > +               wpss_mem: memory@9ae00000 {
> > +                       no-map;
> > +                       reg = <0x0 0x9ae00000 0x0 0x1900000>;
> 
> Almost always reg comes first. Please swap the order of these two
> properties.

Hi Stephen,
I have fixed this and sent v7 for the DTSI change.

Thanks,
Rakesh Pillai


> 
> > +               };
> > +
> >                 rmtfs_mem: memory@9c900000 {
> >                         compatible = "qcom,rmtfs-mem";
> >                         reg = <0x0 0x9c900000 0x0 0x280000>;
> 
> Otherwise
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

