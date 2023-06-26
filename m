Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964E673DFB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 14:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjFZMrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 08:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjFZMrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 08:47:20 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC572129
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 05:46:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fa99b57a38so6614875e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687783583; x=1690375583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5U82YOAZDYPyrN/dkGhB4WlxPaaJ5TYlLh0PEWA0G34=;
        b=BpB+X19vNnGSaXQ1f/jI6MKnwETXPmNP/AbUPwUOiw93wVA4Ws/ohU1qqaJp65RlOE
         wQ1gz/t/jbAGapccMR6W+aKYK/5z7P7DTVFFfsC85+76xgqG2S3NZwVaBvuJpvzOfKvE
         toKw8UDWLYjNs9ZOzu5JzdI6fTRKuOMgdYDWoUZwspQmRz79xERB3iFfIkWO5Zj3Do89
         yMo7kWHEun19RJSr+k+uC4g07nPzOtvcGqin6RdQEvDgf7+AWGd72nroinoYF4/IwF0N
         1KLrxbchEXoYPj3fGIKeDt19NU7Ugm43QaJH3p6D+yG+xY3l6G6rRA5j6yc/cvUjaF1+
         wevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687783583; x=1690375583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5U82YOAZDYPyrN/dkGhB4WlxPaaJ5TYlLh0PEWA0G34=;
        b=SJNpb7JF+b/no+fXYQ7QWfQJPsKJo3eIY8m4gz/ZJ7JMrK4IdwTnUgBqrMh7zueZvZ
         aA4IpKKrqDxDd8wc+1ebE6mR9bRDeNJQiMx6ttPDk7D30Fq50Qc/IuEayUtoPLv/LJfe
         C0Wf24fI6/CXZZz05aP47l9ywrRxon9PqdBXfM+grz8VjfbPCVcnQxGtlIIaq3VCkOoF
         6Hv7PQ/yCoyT4W4F3EdmuNmaYpoj3AMBncIMPeRoyq4RODPEyzRli4FDfv0HqVvFTmlU
         PvKUqLVG5vFIMItjuKrQKe4c7W27kM2wCU03Mk9Y4wa8aV/0V8QHrfoOdaDciMywHELe
         jjOg==
X-Gm-Message-State: AC+VfDyI+ALJoBjSFycxC2rudi4Wqv/nWTC8ttmes48JqZMUPSjqGcJR
        74s/M0/JU+QzaJcXxjOBQ4kkWA==
X-Google-Smtp-Source: ACHHUZ6DW6Wg0F+Tewscf7xVbXFLxWQfWf0srEoFBzX3rTH3U3MkNhnZv9qxjm/FN7b7cm30qiJPoQ==
X-Received: by 2002:a7b:ce0b:0:b0:3f9:b7cc:723 with SMTP id m11-20020a7bce0b000000b003f9b7cc0723mr12953150wmc.21.1687783582958;
        Mon, 26 Jun 2023 05:46:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d9-20020a5d6dc9000000b0030ae53550f5sm7281468wrz.51.2023.06.26.05.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 05:46:22 -0700 (PDT)
Message-ID: <7b909a56-1b3d-79fb-0286-b10117982dc3@linaro.org>
Date:   Mon, 26 Jun 2023 14:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: fix BAM DMA crash and reboot
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20230621143627.189134-1-krzysztof.kozlowski@linaro.org>
 <CTMJRMN2K8AY.20TQJE584A453@otso>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CTMJRMN2K8AY.20TQJE584A453@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2023 13:32, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Wed Jun 21, 2023 at 4:36 PM CEST, Krzysztof Kozlowski wrote:
>> SM8350 HDK and MTP boards were silently dying and rebooting during BAM
>> DMA probe:
>>
>>   [    1.574304] vreg_bob: Setting 3008000-3960000uV
>>   [    1.576918] bam-dFormat: Log Type - Time(microsec) - Message -
>>   Optional Info
>>   Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
>>   S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.0-00637.1-LAHAINA-1
>>   S - IMAGE_VARIANT_STRING=SocLahainaLAA
>>   S - OEM_IMAGE_VERSION_STRING=crm-ubuntu77
>>   S - Boot Interface: UFS
>>
>> It seems that BAM DMA is locally controller (not by firmware) and
>> requires proper initialization by the driver prior to use, at least on
>> HDK8350 and MTP8350, but probably on all boards.
> 
> Are you sure that the bam (and subsequent the qce) actually probes with
> this change? From reading the code I don't see how the bam should probe
> without either qcom,controlled-remotely or qcom,powered-remotely but no

Why the binding does not require either this or that? Eh, buggy stuff...


> clocks supplied. I think the probe just fails with this change, right?

I will need to double check. I was happy enough to be able to boot my
device instead of having crashes, but indeed it would be nice to fix it
fully.


Best regards,
Krzysztof

