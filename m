Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FBD3760DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 09:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbhEGHFK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Fri, 7 May 2021 03:05:10 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54783 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhEGHFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 03:05:09 -0400
X-Greylist: delayed 497 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 May 2021 03:05:08 EDT
Received: from smtpclient.apple (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id C0DA1CECD8;
        Fri,  7 May 2021 09:03:41 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH v3 4/5] dt-bindings: net: bluetooth: Convert Qualcomm BT
 binding to DT schema
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210507011753.GB1126886@robh.at.kernel.org>
Date:   Fri, 7 May 2021 08:55:50 +0200
Cc:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <C81968AD-1C0B-4764-9631-FF227D026ED7@holtmann.org>
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
 <1620322392-27148-5-git-send-email-gubbaven@codeaurora.org>
 <20210507011753.GB1126886@robh.at.kernel.org>
To:     Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

>> Converted Qualcomm Bluetooth binidings to DT schema.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
>> ---
>> .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 -------------
>> .../bindings/net/qualcomm-bluetooth.yaml           | 111 +++++++++++++++++++++
>> 2 files changed, 111 insertions(+), 69 deletions(-)
>> delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> 
> 
>> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> new file mode 100644
>> index 0000000..3f3ec4d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Bluetooth Chips
>> +
>> +maintainers:
>> +  - Marcel Holtmann <marcel@holtmann.org>
> 
> This should be someone who cares about Qcom BT.

yes, please, assign this to someone that knows the hardware.

Rob, can we leave this out for now if there is no dedicated person?

Regards

Marcel

