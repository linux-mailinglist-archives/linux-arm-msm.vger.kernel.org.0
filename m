Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CB432C20C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573599AbhCCVkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:40:18 -0500
Received: from z11.mailgun.us ([104.130.96.11]:55961 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244140AbhCCO4i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 09:56:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614783308; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UILnfCywdfyeY6fqwhyeFBww/+wz+Ww4Bwere9bnWJs=;
 b=EDPN0k+N/EdOALE5MT/7uADhhjqsuJuyD+HAKqZKMAAYKKj5NSvLyKZsm4sOT2YNkfcLSeAJ
 P1EQvVNWsyxubSvQb6lV1KL4rkCBMXLXHGGawitZvV5fbGaNWfQXT1BqfhDg706T2kThpDJ9
 7x8reshNBWxxayFvgckw6xuo3aw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 603fa32d1a5c93533fb1fa69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Mar 2021 14:54:37
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D225EC433C6; Wed,  3 Mar 2021 14:54:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E920C433CA;
        Wed,  3 Mar 2021 14:54:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Mar 2021 20:24:36 +0530
From:   skakit@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, kgunda@codeaurora.org,
        rnayak@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: regulator: Convert regulator bindings to
 YAML format
In-Reply-To: <1614609861.067266.37858.nullmailer@robh.at.kernel.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
 <1614609861.067266.37858.nullmailer@robh.at.kernel.org>
Message-ID: <77f78569ccfea64842176ae19063ef88@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-01 20:14, Rob Herring wrote:
> On Wed, 24 Feb 2021 14:03:06 +0530, satya priya wrote:
>> Convert regulator bindings from .txt to .yaml format.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 
>> ---------------------
>>  .../bindings/regulator/qcom,rpmh-regulator.yaml    | 147 
>> +++++++++++++++++
>>  2 files changed, 147 insertions(+), 180 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
>> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:13:5:
> [warning] wrong indentation: expected 2 but found 4 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:48:5:
> [warning] wrong indentation: expected 2 but found 4 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:49:9:
> [warning] wrong indentation: expected 6 but found 8 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:50:13:
> [warning] wrong indentation: expected 10 but found 12 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:64:9:
> [warning] wrong indentation: expected 6 but found 8 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:69:9:
> [warning] wrong indentation: expected 6 but found 8 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:83:6:
> [warning] wrong indentation: expected 6 but found 5 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:89:6:
> [warning] wrong indentation: expected 6 but found 5 (indentation)
> ./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:95:2:
> [warning] wrong indentation: expected 2 but found 1 (indentation)
> 
> dtschema/dtc warnings/errors:
> 
> See https://patchwork.ozlabs.org/patch/1443748
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

I've updated dt-schema, and also installed yamllint but I am not seeing 
these errors, could you please let me know if I am missing anything 
here.

Thanks,
Satya Priya
