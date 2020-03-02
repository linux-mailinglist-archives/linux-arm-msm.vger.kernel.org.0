Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A141753D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 07:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgCBGgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 01:36:18 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:37611 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725911AbgCBGgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 01:36:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583130977; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YYalt6l/N7I/mSLT1TfY3UB/16G6fmRPNEGmAhNeO4I=; b=GWagZs9/i5oL22p45SV36WpGpHhl6ztsR5Hvd5z7HFgfaW+hlF7RMOJXPWgezGNXsRntSGAv
 MPQCAQPoVuqa+dDntbC3NHxr/LDt9RtQ+VDOBXhdKFLzv61Y1Sv4+MPEgAwAgcKMi+dA9xv2
 xzAlUqGcIZi7AF2p3APVLstnwSM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5ca950.7ff8cb975340-smtp-out-n02;
 Mon, 02 Mar 2020 06:36:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6CC71C4479F; Mon,  2 Mar 2020 06:35:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.67.17] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6A9CC43383;
        Mon,  2 Mar 2020 06:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6A9CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        saiprakash.ranjan@codeaurora.org
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
 <20200220203509.GA14697@bogus>
 <6a7c1f39-a85f-4a99-fed3-71001bdb6128@codeaurora.org>
 <CAL_JsqKVNENPZKbCy4FrGRO=D79hBL3keuE-U2tTwDVViCrdPQ@mail.gmail.com>
From:   Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <3f9ae835-5146-d5db-1caf-01ede5bc9a1f@codeaurora.org>
Date:   Mon, 2 Mar 2020 12:05:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKVNENPZKbCy4FrGRO=D79hBL3keuE-U2tTwDVViCrdPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/26/2020 8:03 PM, Rob Herring wrote:
> On Wed, Feb 26, 2020 at 5:17 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>>
>> On 2/21/2020 2:05 AM, Rob Herring wrote:
>>> On Thu, 20 Feb 2020 13:42:22 +0530, Sharat Masetty wrote:
>>>> This patch adds a clock definition needed for powering on the GPU TBUs
>>>> and the GPU TCU.
>>>>
>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clock-names: ['bus', 'iface'] is too short
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clocks: [[4294967295, 123], [4294967295, 124]] is too short
>>>
>>> See https://patchwork.ozlabs.org/patch/1241297
>>> Please check and re-submit.
>> Hi Rob, These issues seem to be from the original code and not related
>> to my patch. Are these going to be blocking errors?
> There are no errors in this binding in mainline. You've added a 3rd
> clock when all the existing users have exactly 2 clocks.

Rob,

Adding something like the following seems to be solving the bot errors, 
but I am not certain if this is the right way to address this issue. Can 
you please comment?

    clock-names:
+    minItems: 2
+    maxItems: 3
      items:
        - const: bus
        - const: iface
+      - const: mem_iface_clk

    clocks:
+    minItems: 2
+    maxItems: 3
      items:
        - description: bus clock required for downstream bus access and 
for the
            smmu ptw
        - description: interface clock required to access smmu's registers
            through the TCU's programming interface.
+      - description: core clock required for the GPU SMMU TBUs and the 
GPU TCU.

>
> Rob
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
