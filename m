Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9728516B951
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 06:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgBYFtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 00:49:21 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:21263 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726400AbgBYFtU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 00:49:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582609760; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TJy12gozjFJPHYs+99/ImfG0WnY9iUGm1r5o3HJf61M=; b=tp9GC9E2v04yzO27x8Z2u3/AVome4qaeL6sLzhIUSgIJ5TBZenntrqN6Obl07YWX65W+RfJ4
 BTUYRtvljZkbGVYO/SwS7hug0memloIp4+gDo0HQtQQ9ha4CeAsr6MQw1IUDVLHIjHUPTK93
 6wz9LaY1POc7GSsoUbRMx1ghipA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e54b55a.7f0e0e956650-smtp-out-n03;
 Tue, 25 Feb 2020 05:49:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A08FC447A2; Tue, 25 Feb 2020 05:49:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED895C43383;
        Tue, 25 Feb 2020 05:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ED895C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
 <1582540703-6328-4-git-send-email-tdas@codeaurora.org>
 <20200224184201.GA6030@bogus>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <eec22330-2bf4-f4f5-3d28-6b69aa71f992@codeaurora.org>
Date:   Tue, 25 Feb 2020 11:19:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224184201.GA6030@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 2/25/2020 12:12 AM, Rob Herring wrote:

> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> Error: Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dts:21.26-27 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml] Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1242999
> Please check and re-submit.
> 

The error shows syntax error at line 21, below is the example.dts from 
my tree and would compile for me as I have the dependency of the include 
file when I compile.

Please guide how to go about.

+#define GCC_MSS_MFAB_AXIS_CLK					126

  17 #include <dt-bindings/clock/qcom,gcc-sc7180.h>
  18         clock-controller@41a8000 {
  19           compatible = "qcom,sc7180-mss";
  20           reg = <0 0x041a8000 0 0x8000>;
  21           clocks = <&gcc GCC_MSS_MFAB_AXIS_CLK>,



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
