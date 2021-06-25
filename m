Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9945B3B483B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 19:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhFYRbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 13:31:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48134 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhFYRbM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 13:31:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624642132; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Vo8cdOnBvL4ILFl2F7aCfrak2qNnWkdcHomLwpZ2oAI=;
 b=JK8BoUVYmMwL+ywO5OmeaFElYDWb4dL5TBYaa9+8YpNdDvDPGiPgK7Z13fL6LXrsYz13vswU
 gX7EY8AdIU09sKfzIHG809kjndXNOCqpMsmWXjs+3YrYid6hROGnIinwXu1GcTpZ0XdjIiOP
 nRzONkeXeNvzUee4ioRxQ5OAT+s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60d6124f06ea41c941bdca47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 17:28:47
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36100C4323A; Fri, 25 Jun 2021 17:28:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4325EC433F1;
        Fri, 25 Jun 2021 17:28:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 25 Jun 2021 22:58:45 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS
 support
In-Reply-To: <YNYOkmja0kfuzLpF@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-2-git-send-email-sibis@codeaurora.org>
 <YNYOkmja0kfuzLpF@google.com>
Message-ID: <ca7ca4df465f50c6db03a4642102c636@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-25 22:42, Matthias Kaehlcke wrote:
> On Fri, Jun 25, 2021 at 01:17:30AM +0530, Sibi Sankar wrote:
>> Add MPSS PAS support for SC7280 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> 
> On which tree is this series based? I guess it must be the remoteproc 
> tree
> since the conversion of the binding to YAML isn't in Linus' tree yet,
> however the patch doesn't apply cleanly against remoteproc/for-next:
> 
>   patching file 
> Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>   Hunk #2 succeeded at 144 (offset -4 lines).
>   Hunk #3 succeeded at 285 (offset -4 lines).
>   Hunk #4 succeeded at 416 with fuzz 2 (offset 23 lines).
>   Hunk #5 succeeded at 492 (offset 25 lines).
>   Hunk #6 FAILED at 485.

https://patchwork.kernel.org/project/linux-arm-msm/cover/1624560727-6870-1-git-send-email-sibis@codeaurora.org/

sry for wasting your time I missed
mentioning that it was dependent on
^^ series.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
