Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68EB3E9049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbhHKMQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:16:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30737 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237522AbhHKMPr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:15:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628684124; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qPmQ2gNOSohAdZfImmy+eHQhQT7niOnAEsHMb+z7l8Y=;
 b=pQ4KTygGOmL9FWe4AxJNv3J3js1DUvqjA3jUUMJCYceTF/uqU+5yW8uNql3zWIck08uQE6od
 WzmneTAWxzJojpRjKTl7OhXGcX6EF4ytu+lLe6o9kXkejilQhFAeQOcNLbm16cEo/JnY+N59
 OjAl/BhVJSyhCV7rwDhdL9t2XEw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6113bf3876c3a9a172c8c7d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 12:14:48
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CAA98C43460; Wed, 11 Aug 2021 12:14:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AD6DC4338A;
        Wed, 11 Aug 2021 12:14:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 17:44:47 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V4 0/4] Add QSPI and QUPv3 DT nodes for SC7280 SoC
In-Reply-To: <CAE-0n507C35pUxqciP6jagFiL=5hiGckx8VYTwhynUZQcV1HLg@mail.gmail.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <CAE-0n507C35pUxqciP6jagFiL=5hiGckx8VYTwhynUZQcV1HLg@mail.gmail.com>
Message-ID: <003f57fe60de9fbf32765789e48369a4@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-27 05:44, Stephen Boyd wrote:
> Quoting Rajesh Patil (2021-07-26 06:40:43)
>> Roja Rani Yarubandi (4):
>>   arm64: dts: sc7280: Add QSPI node
>>   arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
>>   arm64: dts: sc7280: Update QUPv3 Debug UART DT node
>>   arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
> 
> Please include a changelog in the cover letter and Cc me on the
> subsequent rounds of this series. Thanks.
> 

Okay.

>> 
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  133 +-
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 3169 
>> +++++++++++++++++++++++--------
>>  2 files changed, 2482 insertions(+), 820 deletions(-)
>> 
