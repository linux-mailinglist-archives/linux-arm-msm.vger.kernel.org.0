Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF5C3823B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 07:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhEQFaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 01:30:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27040 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234305AbhEQFaI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 01:30:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621229333; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=f2OQmIUadLX/vJUsCw/tZ97nNVk3pjk1o5K0ABgM7o0=;
 b=S1iEWl4xpYJ+C2nYQom5Iky8fDkNofw2RIRLUE5RJ4zBzzOWqIxlpoGjRK97um6NacWNXjYU
 mMhygAuW4iETkx9Pb6a3yZll81EoE3IOFllmeo8kRDKohS2TsI+/q37H/h0hncXG1J/5UXDE
 1n34EDO105s/PTPMqNvZTdZPAbU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60a1ff067b5af81b5c21cea5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 05:28:38
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C9CEC4338A; Mon, 17 May 2021 05:28:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1CDEC433F1;
        Mon, 17 May 2021 05:28:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 17 May 2021 10:58:37 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V4 7/8] arm64: dts: qcom: sc7280: Add channel nodes for
 sc7280-idp
In-Reply-To: <YJKvtLMPCg56DO1E@google.com>
References: <1620197726-23802-1-git-send-email-skakit@codeaurora.org>
 <1620197726-23802-8-git-send-email-skakit@codeaurora.org>
 <YJKvtLMPCg56DO1E@google.com>
Message-ID: <a835d67abc8509f1e7de5f0afd330a1c@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-05 20:16, Matthias Kaehlcke wrote:
> On Wed, May 05, 2021 at 12:25:25PM +0530, satya priya wrote:
> 
>> Subject: arm64: dts: qcom: sc7280: Add channel nodes for sc7280-idp
> 
> nit: just 'channel nodes' is a bit vague. In case you respin maybe
> change it to something like 'Add ADC channel nodes for PMIC
> temperatures to sc7280-idp'
> 

Okay will change it and resend v4.

> In any case it doesn't seem worth to respin just for this.
> 
>> 
>> Add channel nodes for the on die temperatures of PMICS
>> pmk8350, pm8350, pmr735a and pmr735b.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
