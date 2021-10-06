Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99CF242437F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 18:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239444AbhJFQ62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 12:58:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61235 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238116AbhJFQ61 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 12:58:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633539395; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=lQZLnUbAnV1z1oOtEcGvv/ll8WYBTl5+AI3Ku0BvaiY=; b=B6ul1SXON7hqfCYxjEnoJPKPaTWtyJXkbGRLN+nk6phk8+QpukTEK/nLOlcNgDa9dTVxcHHW
 Fua8a3cfsv40nt2ajxh90LZvPZhAGM4BPa2daNRnyAe+w31A/ih01zTJcYbxwa40UQBrlMwQ
 pk+/PxUmqTXEzRUcV35Lzwd9/20=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615dd538ff0285fb0a9e0c00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 16:56:24
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CA6E7C4314D; Wed,  6 Oct 2021 16:56:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.155.223.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6679DC43460;
        Wed,  6 Oct 2021 16:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6679DC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>,
        "'Rob Herring'" <robh@kernel.org>
Cc:     <mathieu.poirier@linaro.org>, <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>, <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <sibis@codeaurora.org>, <kuabhs@chromium.org>, <agross@kernel.org>,
        <ohad@wizery.com>, <linux-arm-msm@vger.kernel.org>,
        <mpubbise@codeaurora.org>
References: <1633330133-29617-1-git-send-email-pillair@codeaurora.org> <1633330133-29617-3-git-send-email-pillair@codeaurora.org> <1633350086.759437.1051509.nullmailer@robh.at.kernel.org> <006801d7ba70$54daae00$fe900a00$@codeaurora.org> <CAE-0n51rsfFX_-Vxn2tumWiw9K-Tf244rhTedc76UKx5ADzKyg@mail.gmail.com>
In-Reply-To: <CAE-0n51rsfFX_-Vxn2tumWiw9K-Tf244rhTedc76UKx5ADzKyg@mail.gmail.com>
Subject: RE: [PATCH v6 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Wed, 6 Oct 2021 22:26:15 +0530
Message-ID: <006a01d7bad3$1758f290$460ad7b0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
thread-index: AQKwJKLJ4tjmgoIJWycFdR/OOcUEpAEIhLzCAlTlvmMBQz416ALxzEPWqdjIsSA=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Wednesday, October 6, 2021 12:40 PM
> To: Rob Herring <robh@kernel.org>; pillair@codeaurora.org
> Cc: mathieu.poirier@linaro.org; p.zabel@pengutronix.de;
> devicetree@vger.kernel.org; bjorn.andersson@linaro.org; linux-
> kernel@vger.kernel.org; robh+dt@kernel.org; sibis@codeaurora.org;
> kuabhs@chromium.org; agross@kernel.org; ohad@wizery.com; linux-arm-
> msm@vger.kernel.org; mpubbise@codeaurora.org
> Subject: RE: [PATCH v6 2/3] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
> 
> Quoting pillair@codeaurora.org (2021-10-05 22:09:18)
> >
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s),
> > > then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> > >
> > > Please check and re-submit.
> >
> >
> > I have updated the dtschema (2021.7) and still not seeing these
> > errors. I will fix the errors mentioned in this log though.
> > Is there any other flag/setting, which is to be enabled ?
> >
> 
> I have dtschema-2021.10 installed.

Thanks Stephen. Yes, my dtschema, for some reason, was not getting updated.
After upgrading it to 2021.10, I was able to see the same errors.
I will send out the next patchset with these errors fixed.

Thanks,
Rakesh Pillai.

