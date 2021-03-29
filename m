Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E9634C562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 09:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbhC2H5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 03:57:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29433 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231408AbhC2H5H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 03:57:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617004627; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZrWkvnhyJD0avR6AqL3OBzuydyQiUjNi+fTiXz6sSSU=;
 b=URPpqJXS8tSuzbcDkavQzl0d1jsOHr0Q2mK+pmuUYs+Qlp+24c23oUzTxhsAJMMDh/2799gt
 RoP+P0ei1mD2q2IfI5QDvQiaZLCMYl9F2efJsB5n7Va2eA0G3iZRjNJ1TOuDeg55W7z1dh4l
 duaMc80JlJcv5HFL182eXvuEeQI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60618853197975f05e42b381 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 07:57:07
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 03665C43461; Mon, 29 Mar 2021 07:57:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D7F3C433CA;
        Mon, 29 Mar 2021 07:57:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 13:27:06 +0530
From:   schowdhu@codeaurora.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V3 1/5] dt-bindings: Added the yaml bindings for DCC
In-Reply-To: <5cd274f98b38d4b85c1ce212720b6b680f4a00f0.1616997837.git.schowdhu@codeaurora.org>
References: <cover.1616997837.git.schowdhu@codeaurora.org>
 <5cd274f98b38d4b85c1ce212720b6b680f4a00f0.1616997837.git.schowdhu@codeaurora.org>
Message-ID: <8edef26768699f81d82eff3b4ca87dd2@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-29 12:02, Souradeep Chowdhury wrote:
> Documentation for Data Capture and Compare(DCC) device tree bindings
> in yaml format.
> 

Resent this patch by adding the review tag

Link as follows

https://lore.kernel.org/lkml/20210329074909.vpO1kbU39ZSxJpJFZqQc-9i_h5ucqyd4gqZK3a1DQtg@z/

> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 49 
> ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> new file mode 100644
> index 0000000..c6e0a9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/msm/qcom,dcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Data Capture and Compare
> +
> +maintainers:
> +  - Souradeep Chowdhury <schowdhu@codeaurora.org>
> +
> +description: |
> +    DCC (Data Capture and Compare) is a DMA engine which is used to 
> save
> +    configuration data or system memory contents during catastrophic 
> failure
> +    or SW trigger.DCC is used to capture and store data for debugging 
> purpose
> +
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,sm8150-dcc
> +      - const: qcom,dcc
> +
> +  reg:
> +    items:
> +      - description: DCC base register region
> +      - description: DCC RAM base register region
> +
> +  reg-names:
> +    items:
> +      - const: dcc
> +      - const: dcc-ram
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dcc@10a2000{
> +                compatible = "qcom,sm8150-dcc","qcom,dcc";
> +                reg = <0x010a2000  0x1000>,
> +                      <0x010ad000  0x2000>;
> +                reg-names = "dcc", "dcc-ram";
> +    };
