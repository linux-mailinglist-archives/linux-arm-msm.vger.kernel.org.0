Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A0E2528AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 09:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgHZHxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 03:53:10 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:27605 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726442AbgHZHxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 03:53:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598428387; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=K8hws+Wc56ot1KHmF6pUD/aHPtRYJTckBNu4n1VnB3Y=;
 b=xRfoE711j3rS9d4nMsiRuVCH26wWPZNKIfrjdFlNNXZrhMYcH5zEWHPlVottw04MHgqvALvc
 bWBGpNIkAdIUv2zqkZHHjtqOHk8z6gHP+FGiBe2pJDhniHiQhZoR2SzqlyKUGmq80/UGeieo
 nL6QtNARs2JgG9/MWmqfQfzGFnY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f4614d23525716afdb5389f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 07:52:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38BAFC43391; Wed, 26 Aug 2020 07:52:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32128C433CA;
        Wed, 26 Aug 2020 07:52:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 Aug 2020 13:22:48 +0530
From:   mkrishn@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: add yaml schemas for DPU and
 DSI bindings
In-Reply-To: <20200824225702.GA3460018@bogus>
References: <1597066683-6044-1-git-send-email-mkrishn@codeaurora.org>
 <20200824225702.GA3460018@bogus>
Message-ID: <3016838fedcdd9f34515a74438ea8154@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-25 04:27, Rob Herring wrote:
> On Mon, Aug 10, 2020 at 07:08:02PM +0530, Krishna Manikandan wrote:
>> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
>> like DPU display controller, DSI etc. Add YAML schema
>> for the device tree bindings for the same.
>> 
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> 
>> Changes in v2:
>>     - Changed dpu to DPU (Sam Ravnborg)
>>     - Fixed indentation issues (Sam Ravnborg)
>>     - Added empty line between different properties (Sam Ravnborg)
>>     - Replaced reference txt files with  their corresponding
>>       yaml files (Sam Ravnborg)
>>     - Modified the file to use "|" only when it is
>>       necessary (Sam Ravnborg)
>> 
>> Changes in v3:
>>     - Corrected the license used (Rob Herring)
>>     - Added maxItems for properties (Rob Herring)
>>     - Dropped generic descriptions (Rob Herring)
>>     - Added ranges property (Rob Herring)
>>     - Corrected the indendation (Rob Herring)
>>     - Added additionalProperties (Rob Herring)
>>     - Split dsi file into two, one for dsi controller
>>       and another one for dsi phy per target (Rob Herring)
>>     - Corrected description for pinctrl-names (Rob Herring)
>>     - Corrected the examples used in yaml file (Rob Herring)
>>     - Delete dsi.txt and dpu.txt (Rob Herring)
>> 
>> Changes in v4:
>>     - Move schema up by one level (Rob Herring)
>>     - Add patternProperties for mdp node (Rob Herring)
>>     - Corrected description of some properties (Rob Herring)
>> 
>> Changes in v5:
>>     - Correct the indentation (Rob Herring)
>>     - Remove unnecessary description from properties (Rob Herring)
>>     - Correct the number of interconnect entries (Rob Herring)
>>     - Add interconnect names for sc7180 (Rob Herring)
>>     - Add description for ports (Rob Herring)
>>     - Remove common properties (Rob Herring)
>>     - Add unevalutatedProperties (Rob Herring)
>>     - Reference existing dsi controller yaml in the common
>>       dsi controller file (Rob Herring)
>>     - Correct the description of clock names to include only the
>>       clocks that are required (Rob Herring)
>>     - Remove properties which are already covered under the common
>>       binding (Rob Herring)
>>     - Add dsi phy supply nodes which are required for sc7180 and
>>       sdm845 targets (Rob Herring)
>>     - Add type ref for syscon-sfpb (Rob Herring)
>> 
>> Changes in v6:
>>     - Fixed errors during dt_binding_check (Rob Herring)
>>     - Add maxItems for phys and phys-names (Rob Herring)
>>     - Use unevaluatedProperties wherever required (Rob Herring)
>>     - Removed interrupt controller from required properties for
>>       dsi controller (Rob Herring)
>>     - Add constraints for dsi-phy reg-names based on the compatible
>>       phy version (Rob Herring)
>>     - Add constraints for dsi-phy supply nodes based on the
>>       compatible phy version (Rob Herring)
>> 
>> Changes in v7:
>>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob 
>> Herring)
>>     - Modify the schema for data-lanes (Rob Herring)
>>     - Split the phy schema into separate schemas based on
>>       the phy version (Rob Herring)
>> 
>> Changes in v8:
>>     - Resolve merge conflicts with latest dsi.txt file
>>     - Include dp yaml change also in the same series
> 
> I'm done reviewing this because I'm tired of repeating myself and 
> you're
> just throwing crap at the wall and seeing what sticks. Get someone else
> working on QCom stuff to review because I'm done until someone I know
> and trust reviews it.
> 
>> ---
>>  .../bindings/display/msm/dpu-sc7180.yaml           | 236 
>> +++++++++++++++++++
>>  .../bindings/display/msm/dpu-sdm845.yaml           | 216 
>> ++++++++++++++++++
>>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>>  .../display/msm/dsi-common-controller.yaml         | 249 
>> +++++++++++++++++++++
>>  .../display/msm/dsi-controller-sc7180.yaml         | 120 ++++++++++
>>  .../display/msm/dsi-controller-sdm845.yaml         | 120 ++++++++++
> 
> Once again, what's the difference between dsi-controller-sc7180.yaml 
> and
> dsi-controller-sdm845.yaml? I don't see one. If there's not a
> difference, why do we have msm/dsi-common-controller.yaml? If there is 
> a
> difference dsi-controller-sc7180.yaml and dsi-controller-sdm845.yaml
> should *only* have what's different because
> msm/dsi-common-controller.yaml should have everything that is the same.

Rob, The dsi yaml files were split into dsi controller and dsi phy based 
on your comments on patch v2.
As per the comments, I added one common yaml file for controller with 
all the mandatory and optional properties along with their constraints 
and only the required properties for each target is mentioned in the 
target specific dsi-controller yaml file.

Thanks,
Krishna

>>  .../bindings/display/msm/dsi-phy-10nm.yaml         |  62 +++++
>>  .../bindings/display/msm/dsi-phy-14nm.yaml         |  62 +++++
>>  .../bindings/display/msm/dsi-phy-20nm.yaml         |  66 ++++++
>>  .../bindings/display/msm/dsi-phy-28nm.yaml         |  62 +++++
>>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  80 +++++++
>>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  82 +++++++
>>  .../devicetree/bindings/display/msm/dsi.txt        | 247 
>> --------------------
>>  13 files changed, 1355 insertions(+), 388 deletions(-)
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi.txt
