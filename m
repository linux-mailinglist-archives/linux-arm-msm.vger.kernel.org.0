Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B296216DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 15:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgGGNYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 09:24:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64419 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727981AbgGGNYp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 09:24:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594128285; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=50fFHxqOqiGbl65PO6T3ISd+brFmJjDWNvJZpirTFFk=; b=YjFWlg4K0IYy8GRvI+QDlbTm4Xt56yq8qa8Fb9jU41fPa6Mm7hXkJrLO5Uxaq3fx7eRwR4cN
 hyYq3B7YpiWhGjnmRHTVuwX3C03PVzWXt0c8HQfGyuCtpZ59IiapL6syMinztQVMnzEYDVU2
 UYhl11/sirILiJQuSE/ZLApAWKY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f047787a19992ac6523bd72 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 13:24:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D0E2C43387; Tue,  7 Jul 2020 13:24:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [182.74.172.118])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5822C433C6;
        Tue,  7 Jul 2020 13:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5822C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
Subject: Re: [PATCH V2 0/6] Add frequency / voltage scaling support for
 IPQ6018 SoC
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org, sricharan@codeaurora.org
References: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
From:   Kathiravan T <kathirav@codeaurora.org>
Message-ID: <4d8e7bc2-55c9-1ac4-c287-00094e4e7a9c@codeaurora.org>
Date:   Tue, 7 Jul 2020 18:54:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn, Can you help to review the below patches in this series?

   dt-bindings: soc: qcom: Add IPQ6018 compatible
   soc: qcom: smd-rpm: Add IPQ6018 compatible

Hi Rob, Can you help to review the YAML schema in this series?

Thanks,

Kathiravan T.

On 6/23/2020 10:47 AM, Kathiravan T wrote:
> IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator of MP5496
> controls the APSS and SDCC voltage scaling respectively. Add support
> for the same.
>
> changes since V1:
> 	- Moved YAML conversion to the last as per Mark's comments
>
> Kathiravan T (6):
>    dt-bindings: soc: qcom: Add IPQ6018 compatible
>    soc: qcom: smd-rpm: Add IPQ6018 compatible
>    dt-bindings: regulator: add MP5496 regulator compatible
>    regulator: qcom_smd: Add MP5496 regulators
>    dt-bindings: soc: qcom: convert the SMD-RPM document to YAML schema
>    dt-bindings: regulator: convert QCOM SMD-RPM regulator document to
>      YAML schema
>
>   .../bindings/regulator/qcom,smd-rpm-regulator.txt  | 320 ---------------------
>   .../bindings/regulator/qcom,smd-rpm-regulator.yaml | 106 +++++++
>   .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  |  62 ----
>   .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  92 ++++++
>   drivers/regulator/qcom_smd-regulator.c             |  34 +++
>   drivers/soc/qcom/smd-rpm.c                         |   1 +
>   6 files changed, 233 insertions(+), 382 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
>   create mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
>   delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

