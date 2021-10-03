Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D144B41FF62
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 05:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhJCDJk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Oct 2021 23:09:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44558 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhJCDJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Oct 2021 23:09:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633230473; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=HujBRiYiitwYZZp7MU2kjf/XZ35qPbOPap9BDIM9iNk=; b=oTtXGmOjwfJG49rLEhCFJ8PoYU34vQEfrH5dqexK4q5epC/xVSCOuY9qsJjnwtAlTNQMTIWW
 VxpunVKPsfy6kzgmRu6Uzs1rce/Whmo5FyrwMDRWM58SvZ8hSarO9o93oFgKREE4n+da6r1h
 1vQb53F5S9E2Hh2cYojxVyVZDoE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61591e7d63b1f18658cacfe3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 03 Oct 2021 03:07:41
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AFE0CC4338F; Sun,  3 Oct 2021 03:07:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.155.223.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78C8BC4338F;
        Sun,  3 Oct 2021 03:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 78C8BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <p.zabel@pengutronix.de>
Cc:     <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sibis@codeaurora.org>, <mpubbise@codeaurora.org>,
        <kuabhs@chromium.org>
References: <1633230251-12676-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1633230251-12676-1-git-send-email-pillair@codeaurora.org>
Subject: RE: [PATCH v5 0/3] Add support for sc7280 WPSS PIL loading
Date:   Sun, 3 Oct 2021 08:37:30 +0530
Message-ID: <003b01d7b803$d2740330$775c0990$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
thread-index: AQIMrOB36X74kAwJcyhulo1mcEV4SatWrZoQ
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please ignore v5 due to a mistake in signed-off.
I will send v6 after correcting it.

Thanks,
Rakesh Pillai

> -----Original Message-----
> From: Rakesh Pillai <pillair@codeaurora.org>
> Sent: Sunday, October 3, 2021 8:34 AM
> To: agross@kernel.org; bjorn.andersson@linaro.org; ohad@wizery.com;
> mathieu.poirier@linaro.org; robh+dt@kernel.org; p.zabel@pengutronix.de
> Cc: swboyd@chromium.org; linux-arm-msm@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org;
> Rakesh Pillai <pillair@codeaurora.org>
> Subject: [PATCH v5 0/3] Add support for sc7280 WPSS PIL loading
> 
> Add support for PIL loading of WPSS co-processor for SC7280 SOCs.
> 
> Changes from v4:
> - Add yaml conversion for adsp/cdsp dt-bindings
> - Change clock names in wpss dt-bindings
> 
> Rakesh Pillai (3):
>   dt-bindings: remoteproc: qcom: adsp: Convert binding to YAML
>   dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
>   remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
> 
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 140 --------------
>  .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml  | 167
> ++++++++++++++++  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  |
> 196 +++++++++++++++++++  .../bindings/remoteproc/qcom,sdm845-adsp-
> pil.yaml  | 160 ++++++++++++++++
>  drivers/remoteproc/qcom_q6v5_adsp.c                | 209
> +++++++++++++++++++--
>  5 files changed, 717 insertions(+), 155 deletions(-)  delete mode 100644
> Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
>  create mode 100644
> Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-
> pil.yaml
>  create mode 100644
> Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-
> pil.yaml
>  create mode 100644
> Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-
> pil.yaml
> 
> --
> 2.7.4


