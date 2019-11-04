Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2EDED8E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbfKDGR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:17:26 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:41384 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKDGRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:17:25 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C70DE60DCE; Mon,  4 Nov 2019 06:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572848244;
        bh=nGrTxIqNo057qIr0/Dgtiow7HzH0OaO5i5mAeGl6iV4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CjrcS9ZVL78WLE79DgT6nyHcTGy5sle5OV7cgjDKyvYpoGzD+qNiwzj17aZbzKdTE
         6KVpkqTZMqn+XvU2ERq7fbElb7xLJYkXpAtdsGPw0+dyvhMp3J+Zq76NxZc4Lgrdla
         Lun7PUlOY+8yf2HCHvKFF3BQRjG8gwigpnNrDlkM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FE8260DA6;
        Mon,  4 Nov 2019 06:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572848244;
        bh=nGrTxIqNo057qIr0/Dgtiow7HzH0OaO5i5mAeGl6iV4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CjrcS9ZVL78WLE79DgT6nyHcTGy5sle5OV7cgjDKyvYpoGzD+qNiwzj17aZbzKdTE
         6KVpkqTZMqn+XvU2ERq7fbElb7xLJYkXpAtdsGPw0+dyvhMp3J+Zq76NxZc4Lgrdla
         Lun7PUlOY+8yf2HCHvKFF3BQRjG8gwigpnNrDlkM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4FE8260DA6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt
 controller
To:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-12-rnayak@codeaurora.org>
 <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
 <20191030195021.GC27773@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <6610d7fe-5a4d-5a43-5c4f-9ae61e7e53ee@codeaurora.org>
Date:   Mon, 4 Nov 2019 11:47:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030195021.GC27773@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/31/2019 1:20 AM, Matthias Kaehlcke wrote:
> On Tue, Oct 29, 2019 at 09:50:40AM -0700, Stephen Boyd wrote:
>> Quoting Rajendra Nayak (2019-10-23 02:02:19)
>>> From: Maulik Shah <mkshah@codeaurora.org>
>>>
>>> Add pdc interrupt controller for sc7180
>>>
>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> ---
>>> v3:
>>> Used the qcom,sdm845-pdc compatible for pdc node
>>
>> Everything else isn't doing the weird old compatible thing. Why not just
>> add the new compatible and update the driver? I guess I'll have to go
>> read the history.
> 
> Marc Zyngier complained  on v2 about the churn from adding compatible
> strings for identical components, and I kinda see his point.
> 
> I agree that using the 'sdm845' compatible string for sc7180 is odd too.
> Maybe we should introduce SoC independent compatible strings for IP blocks
> that are shared across multiple SoCs? If differentiation is needed SoC
> specific strings can be added.

Sure, I will perhaps add a qcom,pdc SoC independent compatible to avoid
confusion.


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
