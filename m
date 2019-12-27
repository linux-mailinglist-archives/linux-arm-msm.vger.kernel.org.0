Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7D12B234
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 08:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfL0HBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 02:01:09 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:64704 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbfL0HBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 02:01:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577430069; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jEq3NH8Tt/tdYJokKq7xs3z1G/fYNQMKHrUk2kxZTyE=;
 b=XH7UgCIlGU1QyDpo/KNS3BFSM9DHsTuGmzRRsxEnS12Oi4n0wlEHcejE1GqB89JyRK30ScQE
 QmAzTtLPSdlhrnczlR7ZDvQDL540fVptjzMJA62sbiSzmV29riTaIneiG9EcyUnxstd3Qil1
 up04KPyLV54bdZKT0ij7MBQabb0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05ac34.7f01612741b8-smtp-out-n02;
 Fri, 27 Dec 2019 07:01:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 24E47C447A0; Fri, 27 Dec 2019 07:01:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67CA6C4479F;
        Fri, 27 Dec 2019 07:01:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 27 Dec 2019 12:31:05 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Taniya Das <tdas@codeaurora.org>, bjorn.andersson@linaro.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Michael_Turquette_=C2=A0?= <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
In-Reply-To: <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
 <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
Message-ID: <5b16d051146224c1efad40c4548dd0c4@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Taniya,

On 2019-12-27 10:12, Taniya Das wrote:
> The MSS clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mss.yaml        | 41 
> ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/clock/qcom,mss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> new file mode 100644
> index 0000000..05efe2b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.
> +
> +properties:
> +  compatible :
> +    enum:
> +       - qcom,sc7180-mss
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  additionalItems: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +examples:
> +  # Example of MSS with clock nodes properties for SC7180:
> +  - |
> +    clock-controller@41aa000 {
> +      compatible = "qcom,sc7180-mss";
> +      reg = <0x041aa000 0x100>;

Bjorn/me had a discussion about the size
a while back, we should use the entire
reg space instead of fragmenting it.

reg = <0x041a8000 0x8000>;

We should just use ^^ instead.

> +      #clock-cells = <1>;
> +    };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a 
> member
> of the Code Aurora Forum, hosted by the  Linux Foundation.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
