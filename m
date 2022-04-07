Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9F64F8A43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 00:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbiDGVSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 17:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbiDGVSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 17:18:12 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C7F18855F
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 14:16:09 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bh17so13423764ejb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Vnl9fzY51zFGbBPdJOVdC/ObBDnpccOA1T51DHqDBAY=;
        b=FVbhn2jeAkOUEO9Ba9dfgzN+akctgRkp9e8r/OJGtqUO8lzYFJKk/UdmdWrBlgHaR3
         KBJ3mNPV/aiTD/fHS1DW2fByC91nuDhG3OdD7zFRhc/uDatPtMNeQh5GUggnbBLtSKYR
         GZDMg+3zMYCU4207u4AgQTlXovz3nYCf1r8oOvJfnTbn73Zz3/we4qONKWT5cNFdqDmf
         VVSbzEvmlAb6oFkjHuC0TPxUtb4JOCVIx9svyPfWTwe0fguaQ/u+qGTFNRuHIN7UpmPV
         J9wNCno+UXczE04DoeY6HzidrQtulmBYfY8jFf9ZHrKMbPOa4WWVan08K3dmENV+KtCl
         ev1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Vnl9fzY51zFGbBPdJOVdC/ObBDnpccOA1T51DHqDBAY=;
        b=uGvJgawb7hX5YFZdRHE8zkImh92N2k7p905f377h8hsn63iuGeEqUc3k6Wib7uG2n1
         XPKimXPI5+7FlfexjMjHcoJdaluGej+7i3E0xcQvxQSWA8QyngjZ9yndPCPcRFj2X1UM
         zj+QC+bwVpSjmdQWZgA8/kyT7n+yvbJBHbdpowaClJxuAOSY7qiP+VJQM/Ql0u4rP4qi
         KT6m7s8VmamemfWE5vn4JjK40JfFp8HFSLquUWNtHzL1QheBqaSk1g8HUkZPwGiN50ZS
         xW8Zo67qxmLz6MRCmniyL/oF+wzFLofa3hFfsNSSadj3D4JNpvINdJVG4chp0jOnTImi
         L56A==
X-Gm-Message-State: AOAM531279B91CcpKfGn+49bf7VzUjvvenNuSDWoUhWNSwM1BqwpJrcp
        OLL7Z0WstEMPGp0B2oP/5zfKyQ==
X-Google-Smtp-Source: ABdhPJxrUjB7NB/DdRcPGk5eJGqzzzhSc4M6yqToNPSbJYPvv7fa0w3Cx6385NlAPKEiekuaF9jheQ==
X-Received: by 2002:a17:906:730e:b0:6e0:2ad8:12c8 with SMTP id di14-20020a170906730e00b006e02ad812c8mr15160740ejc.623.1649366167733;
        Thu, 07 Apr 2022 14:16:07 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c4-20020a170906340400b006d077e850b5sm7951415ejb.23.2022.04.07.14.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 14:16:07 -0700 (PDT)
Message-ID: <865ff6bc-95a2-8b39-5cf2-bb2d3f592c5a@linaro.org>
Date:   Thu, 7 Apr 2022 23:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: delete incorrect ufs
 interconnect fields
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20220407172145.31903-1-jonathan@marek.ca>
 <e41c26c2-8aa4-cfd2-27b0-eb011f45eda0@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e41c26c2-8aa4-cfd2-27b0-eb011f45eda0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/04/2022 21:40, Vladimir Zapolskiy wrote:
> On 4/7/22 20:21, Jonathan Marek wrote:
>> Upstream sm8450.dtsi has #interconnect-cells = <2>; so these are wrong.
>> Ignored and undocumented with upstream UFS driver so delete for now.

This is the upstream and they are documented here, although as pointed
by Vladimir this was rather a reverse-documentation. The documentation
might be incorrect, but then the bindings should be corrected instead of
only modifying the DTS.

> 
> Basically the description was added by a commit 462c5c0aa798 ("dt-bindings: ufs:
> qcom,ufs: convert to dtschema").
> 
> It's questionable, if an example in the new yaml file is totally correct
> in connection to the discussed issue.

To be honest - the example probably is not correct, because it was based
on existing DTS without your patch. :)

Another question is whether the interconnect properties are here correct
at all. I assumed that DTS is correct because it should describe the
hardware, even if driver does not use it. However maybe that was a false
assumption...


Best regards,
Krzysztof
