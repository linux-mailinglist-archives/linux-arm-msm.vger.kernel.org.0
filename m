Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC0041AF46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240708AbhI1MqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 08:46:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40538 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240632AbhI1MqJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 08:46:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632833070; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=av2/tPBGX6NuSZLU+FvSMaJ0cW9h/uM3y8ef2WV5jQc=;
 b=WGND3hTMKXEGxFLWbCZkCajtfeWSVr0WQ/xaauyYxnsx+7qoqsoTSR0GXu6bOV02gDGH7syI
 MMreuuX79jsbIS+Dy3jdo/PjGLjhhTZgwludToNdmisX0ftPijsKXFvCHYzt5w3rwz1mTLFw
 4rN3IQ3PoN6NFaTM06rN1uudLQE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61530e21713d5d6f969d194a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 12:44:17
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AC15C43618; Tue, 28 Sep 2021 12:44:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99BA7C43460;
        Tue, 28 Sep 2021 12:44:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 18:14:16 +0530
From:   skakit@codeaurora.org
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] regulator: dt-bindings: Add pm8008 regulator bindings
In-Reply-To: <20210917154818.GC4700@sirena.org.uk>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-3-git-send-email-skakit@codeaurora.org>
 <20210917154818.GC4700@sirena.org.uk>
Message-ID: <b192c1e056e0ea2fc959651065e4ce7b@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-17 21:18, Mark Brown wrote:
> On Fri, Sep 17, 2021 at 04:15:36PM +0530, Satya Priya wrote:
> 
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +      regulator-name: true
>> +      regulator-min-microvolt: true
>> +      regulator-max-microvolt: true
> 
> You shouldn't be forcing these properties, it should be perfectly OK 
> for
> boards to have fixed voltages especially for example during bringup or
> for debugging.
> 

Okay. I will remove these.

>> +      qcom,min-dropout-voltage:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          Specifies the minimum voltage in microvolts that the parent
>> +          supply regulator must output, above the output of this
>> +          regulator.
> 
> If this is needed in DT it should be a generic property since most
> regulators have some requirement here however usually it's a fixed
> property of the silicon and should therefore just gets set in the
> regulator_desc as min_dropout_uV - I'd strongly recommend having a
> default there even if there's some requirement for it to be set per
> board.

Yeah, we are setting the default values for this(headroom_uv) from 
driver. Please see below

struct regulator_data {
      char        *name;
      char        *supply_name;
      int     min_uv;
      int     max_uv;
      int     min_dropout_uv;
};

static const struct regulator_data reg_data[PM8008_MAX_LDO] = {
      /* name  parent      min_uv  max_uv  headroom_uv */
     {"l1", "vdd_l1_l2",  528000, 1504000, 225000},
     {"l2", "vdd_l1_l2",  528000, 1504000, 225000},
     {"l3", "vdd_l3_l4", 1504000, 3400000, 200000},
     {"l4", "vdd_l3_l4", 1504000, 3400000, 200000},
     {"l5", "vdd_l5",    1504000, 3400000, 300000},
     {"l6", "vdd_l6",    1504000, 3400000, 300000},
     {"l7", "vdd_l7",    1504000, 3400000, 300000},
};

Inside Register LDO API:

pm8008_reg->rdesc.min_dropout_uV = reg_data[i].min_dropout_uv;
of_property_read_u32(reg_node, "qcom,min-dropout-voltage",
                   &pm8008_reg->rdesc.min_dropout_uV);

