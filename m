Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1DF5122864
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 11:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfLQKLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 05:11:53 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:34111 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727188AbfLQKLx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 05:11:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576577513; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r90I13kSoefNFl8RNN/BDOH31yaeXpjEEpvv+Q+aZmI=;
 b=jV/Myl5vBDm+gwcC+SrGr9GaKBFz5pXduxW8vi/v5iEzbqoleE6ydGd2fhuNvg3oj/pQulRL
 labTP0dyKs8UZIid9KvuzePmGUq/0ZvEVVqXaxna5a+vIE9KfD42qFZPfpvQgMLNeQ8RUETP
 LE0ild2cVZKJsZ/PVUU3j5vJx1Y=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df8a9e2.7fa583cba8b8-smtp-out-n02;
 Tue, 17 Dec 2019 10:11:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2885C4479C; Tue, 17 Dec 2019 10:11:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CBACC43383;
        Tue, 17 Dec 2019 10:11:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Dec 2019 15:41:44 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, rnayak@codeaurora.org,
        robh+dt@kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        dianders@chromium.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Convert rpmpd bindings to
 yaml
In-Reply-To: <5df7dc77.1c69fb81.9e37f.16a5@mx.google.com>
References: <20191216115531.17573-1-sibis@codeaurora.org>
 <20191216115531.17573-2-sibis@codeaurora.org>
 <5df7dc77.1c69fb81.9e37f.16a5@mx.google.com>
Message-ID: <51f73b85b2a9a9f3d72f2776617be9c9@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-17 01:05, Stephen Boyd wrote:
> Quoting Sibi Sankar (2019-12-16 03:55:30)
>> Convert RPM/RPMH power-domain bindings to yaml.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> One nitpick below!
> 
>> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml 
>> b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> new file mode 100644
>> index 0000000000000..4aebf024e4427
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> @@ -0,0 +1,170 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/qcom,rpmpd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm RPM/RPMh Power domains
>> +
>> +maintainers:
>> +  - Rajendra Nayak <rnayak@codeaurora.org>
>> +
>> +description:
>> +  For RPM/RPMh Power domains, we communicate a performance state to 
>> RPM/RPMh
>> +  which then translates it into a corresponding voltage on a rail
> 
> Add a full-stop here to make it a true sentence?

sure I'll re-spin it

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,msm8976-rpmpd
>> +      - qcom,msm8996-rpmpd
>> +      - qcom,msm8998-rpmpd
>> +      - qcom,qcs404-rpmpd
>> +      - qcom,sc7180-rpmhpd
>> +      - qcom,sdm845-rpmhpd
>> +      - qcom,sm8150-rpmhpd
>> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
