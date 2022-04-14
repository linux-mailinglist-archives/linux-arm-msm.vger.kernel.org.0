Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7078850068E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 09:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240222AbiDNHJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 03:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiDNHJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 03:09:45 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3835A42497
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:07:20 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id t25so5158363edt.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N59VpskwVzxKvrwhY6+QNdNZxdpuBQRHq8FPB+3/fNY=;
        b=V1rTg1vM2pH5UT/dmwyv12wBruW0s5c72LNfIVSnl31+6Daq5+wA1Wfcx7PTEsK8/E
         jEhpU7fQw2TV8ov0/70msTwUsCz++T6sxGF+AJ+S3K1x1dwX0WIoEj98YeUgldpEhPJ4
         8ipRFssbu1ExGGEdIriOaks65x1NrDVea64Itvx6YYRky2JydYFXRCidvgIvj1HqZ0sE
         okIAQHdvzLZx2uynd7ea0Rzufe12K7Kx+AFpDK/cbCrIng/FjpfnCPH5hC5E3WtGaArU
         6uhdaUZFgDdzne239bw57hT8MXslYXF06PDPNQgFP8PY9mgAbZSQVtD+k+9Y8gq/J1YT
         tAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N59VpskwVzxKvrwhY6+QNdNZxdpuBQRHq8FPB+3/fNY=;
        b=PpPUY4S3Z8++VVU5PZZdtrVSOEJGIhGbTjFG6Zeriqad/WJlYcGiK0XVjY6PMtzmx+
         l6WOW7VWh0GOljCLIbr4Cnfv19kgDfJkj6bjJUWdbPqXSwDD/am3tni2iNUW56bS5xOt
         rmywrVvpTsqSDvIF67vZGCJdbUHzAxwTYW7oTa6werVfHrPHQuA6diJZn2aV1e/DfoSK
         71aCjDJ2mtn3o/Fvz++srlTqfR3yr+lc2zTjh5y6k+WZTGOQCsEfL8J50I8/34N5xxGU
         f/rjG7Glrpk5JCjS/HgbCtvZVwphVG4RbldxZmsXTD3EZw7LW0P2Lm1E8zTKJmizPfyp
         33vA==
X-Gm-Message-State: AOAM533gbvYoxzX8rQ8SJ4FUx2oZP303kbozx6C28i0oo6ldBcxCsO01
        /x5OYFYkpWI1Ed8AclIKKMeI+g==
X-Google-Smtp-Source: ABdhPJzInxt/pldRqvrXl3OI1n1SZfZ22+rbQStVtA37uKDx5GjqIyzOwuCsVR6yIHoUVd75Lfl5uQ==
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id l8-20020aa7cac8000000b00410cc6c6512mr1462205edt.408.1649920038730;
        Thu, 14 Apr 2022 00:07:18 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906774300b006e79ea98369sm349759ejn.151.2022.04.14.00.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:07:18 -0700 (PDT)
Message-ID: <b7718ca1-c502-67a1-993c-460a6c55cc5e@linaro.org>
Date:   Thu, 14 Apr 2022 09:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/4] dt-bindings: soc: qcom,rpmh-rsc: convert to dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220411085935.130072-1-krzysztof.kozlowski@linaro.org>
 <20220411085935.130072-4-krzysztof.kozlowski@linaro.org>
 <Yldyccqaqgcj/Kvc@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yldyccqaqgcj/Kvc@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2022 03:01, Rob Herring wrote:
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
>> new file mode 100644
>> index 000000000000..f5ecf4a8c377
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
>> @@ -0,0 +1,272 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> 
> Surely this file was all QCom or QCom LT authors and can be dual 
> licensed. After all, it was QCom that complained to me about GPL only 
> DT licensing...

I'll work on this.

Best regards,
Krzysztof
