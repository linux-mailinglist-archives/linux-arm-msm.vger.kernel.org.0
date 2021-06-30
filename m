Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44983B895E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 21:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbhF3UAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 16:00:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43456 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233693AbhF3UAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 16:00:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625083072; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=amOKaGT0U/tmgATHYPw2L7GZLIJkHCUxJX7IjppSDIw=;
 b=GNH+3LvEEoJSUvSLav58oH1GePqnl9a2Xzawr2qlnS0P7xa8dY+3PEadu5XAZdZCZYDRQvVQ
 eRh/3mWKq/Bd0j7OIpwzLl4htG3p5h8ERiWriD1U8adR/p4CcRinisacU52bwq4san7n5Dqe
 loN9Ts118RmfOqkZ0zjhF4qHeMc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60dcccaf2a2a9a9761959faa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 19:57:35
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10C13C433D3; Wed, 30 Jun 2021 19:57:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C67AC433F1;
        Wed, 30 Jun 2021 19:57:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Jul 2021 01:27:33 +0530
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
Subject: Re: [PATCH 3/9] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL
 binding
In-Reply-To: <YNZqEJxp9dZUJe5U@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-4-git-send-email-sibis@codeaurora.org>
 <YNZqEJxp9dZUJe5U@google.com>
Message-ID: <5a1534346e524b3808c11c6a4d224c86@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-26 05:13, Matthias Kaehlcke wrote:
> On Fri, Jun 25, 2021 at 01:17:32AM +0530, Sibi Sankar wrote:
>> Add a new modem compatible string for QTI SC7280 SoCs and introduce 
>> the
>> "qcom,ext-regs" and "qcom,qaccept-regs" bindings needed by the modem
>> sub-system running on SC7280 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 32 
>> ++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 494257010629..d802e57701b8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> 
>> ...
>> 
>> @@ -208,6 +218,24 @@ For the compatible strings below the following 
>> phandle references are required:
>>  		    by the offset within syscon for conn_box_spare0 register
>>  		    used by the modem sub-system running on SC7180 SoC.
>> 
>> +For the compatible strings below the following phandle references are 
>> required:
>> +  "qcom,sc7280-mss-pil"
>> +- qcom,ext-regs:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: two phandles reference to syscons representing TCSR_REG 
>> and
> 
> s/phandles reference/phandle references/
> 
>> +		    TCSR register space followed by the two offset within the 
>> syscon
> 
> s/offset/offsets/
> 
>> +		    to force_clk_en/rscc_disable and axim1_clk_off/crypto_clk_off
>> +		    registers respectively.

will fix ^^ in the re-spin.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
