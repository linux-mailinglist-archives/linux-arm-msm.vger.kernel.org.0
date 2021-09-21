Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136A5412DA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 06:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhIUEGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 00:06:41 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24531 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbhIUEGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 00:06:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632197109; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=M9kaB6BRGsQz29+6dKGk/QA6hjJsYJITRgGC8vUI/vA=;
 b=WAOVniy3htJ3A3Box4PR/uff1P+5td8mfmU73Y8OwZ9++FFY+Iaxb3AH9puRe4DSuWwid3d1
 tQ72/XUnUwuVtBLRh7leOCT18GvMIPNXnjt63THAUQXhlrZbIZvipV6zzhvrrylnEz6SWHFK
 nDObdmB0A1VFVOwJ0q8bY1Hzby0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 614959dd65c3cc8c63dc93d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 04:04:45
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C419C43460; Tue, 21 Sep 2021 04:04:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C1BCEC4338F;
        Tue, 21 Sep 2021 04:04:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 09:34:44 +0530
From:   rajpat@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH V8 1/8] dt-bindings: spi: Add sc7280 support
In-Reply-To: <CAD=FV=X-7-OS0uDFDR+_AksgqLvTVCx0+Z5pbmNCCvqwBrvgBg@mail.gmail.com>
References: <1631872087-24416-1-git-send-email-rajpat@codeaurora.org>
 <1631872087-24416-2-git-send-email-rajpat@codeaurora.org>
 <CAD=FV=X-7-OS0uDFDR+_AksgqLvTVCx0+Z5pbmNCCvqwBrvgBg@mail.gmail.com>
Message-ID: <7b45fd08078847f27b8e6e989b4c326f@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-18 01:32, Doug Anderson wrote:
> Hi,
> 
> On Fri, Sep 17, 2021 at 2:49 AM Rajesh Patil <rajpat@codeaurora.org> 
> wrote:
>> 
>> Add compatible for sc7280 SoC.
>> 
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> ---
>> Changes in V8:
>>  - As per Doug's comments, added "qcom,sc7280-qspi" compatible
>> 
>>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 
>> ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml 
>> b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> index ef5698f..31711fe 100644
>> --- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> @@ -21,7 +21,10 @@ allOf:
>>  properties:
>>    compatible:
>>      items:
>> -      - const: qcom,sdm845-qspi
>> +      - enum:
>> +        - qcom,sdm845-qspi
>> +        - qcom,sc7280-qspi
> 
> Other than the fact that the indentation is wrong (as Rob's bot
> found), this looks good to me. Feel free to add my Reviewed-by when
> you fix the indentation. In theory you could also be nice and add the
> sc7180-qspi at the same time, I think.
> 
> -Doug

Okay
