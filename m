Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1252B462B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 05:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfIQDy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 23:54:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33338 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbfIQDy0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 23:54:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 249CB60850; Tue, 17 Sep 2019 03:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568692465;
        bh=joRR7LYWU8P8rz60YCJxIY2KwbV/rIB9q9L/BVlXVTY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=boZYR3mHLqOWwC2LKDjyIVdts4vDiz/gr0kON5sZKdGVmeL2Qiv4/7uoje/mvW5sm
         vPqYiw6CuAVbHUEzeauHEhMMNl26KfqQBUoehoP+5ee7KFNSSmm1jRcIOkva4JXMfd
         xRhBnXIwTSFdQUpHePp4gZJyXjV3WLq2Dt1h9ZZU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.24.216] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3DA460850;
        Tue, 17 Sep 2019 03:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568692464;
        bh=joRR7LYWU8P8rz60YCJxIY2KwbV/rIB9q9L/BVlXVTY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Nem8DnySxJVDcZ69uI0DUGjwA6HQZoCFIk/77Ciez7xS5I1T5wPXxDX5tusHGEZRi
         L5jUPZ3v3OkK0m6xhW1H1hpivUQbLDWOg+osFjhLmWt8EVbQxolIhMoQoIIeCoxceY
         vGemHT/Cu2sXbW941Gn4KTziSoWc2+2wyK686Tco=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3DA460850
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH V2 0/3] ADD interconnect support for USB
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <97684757-0895-cc27-58ed-1b56db0f2756@codeaurora.org>
Date:   Tue, 17 Sep 2019 09:24:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/16/2019 5:10 PM, Chandana Kishori Chiluveru wrote:
> This path series aims to add interconnect support in
> dwc3-qcom driver on SDM845 SoCs.

As Matthias commented on other patch, can you update the
subject to mention that series is for dwc3-qcom only? And update
same dt-bindings patch commit subject as well

>
> Changes since V1:
>   > Comments by Georgi Djakov on "[PATCH 2/3]" addressed
>   > [PATCH 1/3] and [PATCH 3/3] remains unchanged
>
> Chandana Kishori Chiluveru (3):
>   dt-bindings: Introduce interconnect bindings for usb
>   usb: dwc3: qcom: Add interconnect support in dwc3 driver
>   arm64: dts: sdm845: Add interconnect properties for USB
>
>  .../devicetree/bindings/usb/qcom,dwc3.txt          |  13 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |  12 ++
>  drivers/usb/dwc3/dwc3-qcom.c                       | 145 ++++++++++++++++++++-
>  3 files changed, 168 insertions(+), 2 deletions(-)
>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

