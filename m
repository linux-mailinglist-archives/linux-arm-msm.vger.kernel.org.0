Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4F2ECC1DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 19:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbfJDRjm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 13:39:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60824 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387428AbfJDRjm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 13:39:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 342A86081E; Fri,  4 Oct 2019 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570210781;
        bh=Xy3fQzgklWWmrTL56KOs57tZvRR4HJiCwiXK2LW/+2U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GRiT1kNtfbftNap7rnqSoOhcBvBJvKr7cMBwB7AFi8SRsPiaB6deP5LDpezqpQB9i
         FBenvrQ62ecA0vh5D+Axpcwh3xwiQ7+qo/VJb28dqSA0LgnPOu/rzmAIj/OZTAE8G4
         YvUxsHs1CNNAecUcr3KalDF9oCiNImgBohfMsMCk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.165.229] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DD9E6016D;
        Fri,  4 Oct 2019 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570210780;
        bh=Xy3fQzgklWWmrTL56KOs57tZvRR4HJiCwiXK2LW/+2U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GkeyLHMcqKS10Cha3XKBd3VfPjuyAA9vxaCy5r2w0HAuxTM4WOJ9VlHTQ9tiVOnG6
         IZFf11s10EMq5BMykHNoFBXR67hSc9YFTFEzqsFFpMXXQx+dkj7a1L9xnsavUjfbZN
         uv0IylCjnT0vfx5PHqVuu0vGzmH7VQWTL99uvbpg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DD9E6016D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <20190918095018.17979-4-tdas@codeaurora.org>
 <20190918213946.DC03521924@mail.kernel.org>
 <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org>
 <20190924231223.9012C207FD@mail.kernel.org>
 <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org>
 <20190925130346.42E0820640@mail.kernel.org>
 <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org>
 <20191001143825.CD3212054F@mail.kernel.org>
 <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
 <20191003160130.5A19B222D0@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <81a2fa46-a7e6-66a2-9649-009f22813c81@codeaurora.org>
Date:   Fri, 4 Oct 2019 23:09:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003160130.5A19B222D0@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 10/3/2019 9:31 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-10-03 03:31:15)
>> Hi Stephen,
>>
>> On 10/1/2019 8:08 PM, Stephen Boyd wrote:
>>>
>>> Why do you want to keep them critical and registered? I'm suggesting
>>> that any clk that is marked critical and doesn't have a parent should
>>> instead become a register write in probe to turn the clk on.
>>>
>> Sure, let me do a one-time enable from probe for the clocks which
>> doesn't have a parent.
>> But I would now have to educate the clients of these clocks to remove
>> using them.
>>
> 
> If anyone is using these clks we can return NULL from the provider for
> the specifier so that we indicate there isn't support for them in the
> kernel. At least I hope that code path still works given all the recent
> changes to clk_get().
> 

Could you please confirm if you are referring to update the below?

--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -218,7 +218,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct 
of_phandle_args *clkspec,
                 return ERR_PTR(-EINVAL);
         }

-       return cc->rclks[idx] ? &cc->rclks[idx]->hw : ERR_PTR(-ENOENT);
+       return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
  }


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
