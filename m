Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06785E95C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 21:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbiIYTz5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 15:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbiIYTz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 15:55:56 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DC727168
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 12:55:51 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id v4so4811640pgi.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BbC1wgZUGA3VG7aRyXwF4yEsg/v9U58AhC2p3t+lydk=;
        b=RutrL0MsAkUUROpcd5FYbEbC+/QokzgyVRCH/j8FRvV09XIHjBTZFKRA8Xg3HfRtrC
         dSe1KElRTg3X3b9Y3dU3Teg+d++0XdXmT3zMdekEmbqJrHhXl2hYzsZpgj04J9OG2J0o
         YoEDLQvLkEWYwH669Eo73wyB5z2ASBAtOEnI4XS0Enmw3BfQoFBc0L3WT9ReLRi2MunM
         MGukH+BEyYfUTsGnuE5IqXy/9quwp049VZyFx/5WjNAdrMEBOUlO5iiH/7P1l1btWojG
         nGDrMd3EOL9n+NcItLtkZy+BCwTJIG3kGVy/SzbXn1kSlc7v7Kngz5mjNVinfdpuUs1x
         90UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BbC1wgZUGA3VG7aRyXwF4yEsg/v9U58AhC2p3t+lydk=;
        b=F9ROujieZEKKsBgBXj0nwqwcwL34RQZSFSReeHlQtmoSLkHeSpDLnhWqxBi3rRBrKx
         2270UpfiwqV42s1I268VokMjIGFeBw5NvN4HJSt4LJT1btGmxv+WBx2BgDlqA/IMML+O
         69Lq/WVrisn5Na92tXpWSBtzNpXnUHTwAOcRiQv7pHl+F2sV0fO5xOXmGZKFTKnpIExA
         ecipRWPd7VlxabY0qHxl9r0iZH/hnRzoaq9EJAatE26mnhZ5M9W78TjuOWay5ZHBtWjt
         CeUJfqZEeT+rmnScX+LqRWzLAXui5+8LboCt+/wKrYbDRcy+R+zQdjtsCROcpW1JTYrD
         7ROA==
X-Gm-Message-State: ACrzQf2kqEJRKESBzS5PYI2Oatxo28IjNeq1h2+wqsmedFj55InD69Qz
        mmPHiQWk8dW7Y3wgqls9Pcy0QQ==
X-Google-Smtp-Source: AMsMyM4t+v6XPNUaxap0bWu9i+f5KlhpaoKfnyU0oegKA9jcmE3xZdN3m0RuFmaVQ1i28NrVV1ICGQ==
X-Received: by 2002:a65:6cc7:0:b0:42a:4d40:8dc1 with SMTP id g7-20020a656cc7000000b0042a4d408dc1mr17069878pgw.321.1664135750972;
        Sun, 25 Sep 2022 12:55:50 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c60:7faa:3d17:778b:4e63:9e61? ([2401:4900:1c60:7faa:3d17:778b:4e63:9e61])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902b18100b00176ad86b213sm9507680plr.259.2022.09.25.12.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 12:55:50 -0700 (PDT)
Message-ID: <d3205b59-6b6e-2983-9e2a-39354cd1803e@linaro.org>
Date:   Mon, 26 Sep 2022 01:25:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: dma: Make minor fixes to qcom,bam-dma
 binding doc
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, vkoul@kernel.org, agross@kernel.org,
        dmaengine@vger.kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, andersson@kernel.org
References: <20220918081119.295364-1-bhupesh.sharma@linaro.org>
 <d7507d61-9d16-c2d3-2066-5e2f9afd6eb9@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <d7507d61-9d16-c2d3-2066-5e2f9afd6eb9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/18/22 2:19 PM, Krzysztof Kozlowski wrote:
> On 18/09/2022 09:11, Bhupesh Sharma wrote:
>> As a user recently noted, the qcom,bam-dma binding document
>> describes the BAM DMA node incorrectly.
> 
> It's a bit confusing - what is exactly incorrectly described by binding?
> You did not make any changes to the binding itself...

Sorry for the late reply. Your comment just skipped through my mail 
filters :(

I understand your point. I should have made the commit message more 
descriptive (infact now I look at it, I see some key words are actually 
missing from the commit message).

The commit message should infact read as:

"As a user recently noted, the qcom,bam-dma binding document
describes the BAM DMA node *in the example section* incorrectly. Fix the 
same by making it consistent with the node present inside 'qcom-msm8974' 
dts file, *namely the 'reg' and 'interrupt' values which are incorrect. 
While looking at the example in the binding document, the user noted 
that its incorrect when compared with both the 'msm8974' upstream as 
well as downstream dts files.*

I hope the bold text (which I added above), helps clear the purpose of 
the patch better.

Please let me know your views.

Thanks,
Bhupesh
