Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FCBF951C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 17:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfKLQHT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 11:07:19 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:52512 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfKLQHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 11:07:19 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9198060D5A; Tue, 12 Nov 2019 16:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573574838;
        bh=LtdKcCfVo09bqodGRKYu7E6Q5R2Ji4qgLnYieGU7L6A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UEP+wHeyrWuVdLonKfdbdzmWmJ9yCEDkzMYyakEYGPVh5hRNkUn3l0CDilTj2Pj19
         wjt07eyuavu6cbXlaC0aEv5pqIm9u5OtOCmrNkqvfEzfdV7Ud+kb93pKFNzXtuunQI
         m5mAgKl/Ubt9TmPZons5Iq1fDehmae40iDVjVUSk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E653C601A3;
        Tue, 12 Nov 2019 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573574837;
        bh=LtdKcCfVo09bqodGRKYu7E6Q5R2Ji4qgLnYieGU7L6A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ki3rrQA/x0Par42iQQdjt9YYMo8co5xQwgIJ4DTs8HEVdYt7TnRUCc1QKP2PE9yI2
         YjpK6y1ONdpJTu3k1mYW3bMLiBe5BNYskHsgT2PCcWN6oXUFCfHc1+HQ89wWyljFoB
         p5oGDbyx/JChLIRrkMJepWfTkppEoXaWeyC7UR48=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E653C601A3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v8 3/4] dt-bindings: clock: Add support for the MSM8998
 mmcc
To:     Rob Herring <robh@kernel.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255068-10400-1-git-send-email-jhugo@codeaurora.org>
 <20191112005527.GA7038@bogus>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <b759445d-211e-b002-f193-a0dfcaaca449@codeaurora.org>
Date:   Tue, 12 Nov 2019 09:07:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112005527.GA7038@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2019 5:55 PM, Rob Herring wrote:
> On Fri,  8 Nov 2019 16:17:48 -0700, Jeffrey Hugo wrote:
>> Document the multimedia clock controller found on MSM8998.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,mmcc.yaml       |  36 ++++
>>   include/dt-bindings/clock/qcom,mmcc-msm8998.h      | 210 +++++++++++++++++++++
>>   2 files changed, 246 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h
>>
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

Ya know, normally you are right about this, as I did something stupid, 
but in this case I did mention in the cover letter that tags were 
dropped because the bindings were re-written in yaml (ie no one had 
reviewed the new code).

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
