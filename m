Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19927729D5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 16:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238814AbjFIOww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 10:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjFIOwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 10:52:51 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88767210C
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 07:52:48 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b1b3836392so20944481fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322367; x=1688914367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytR9MFcgJFjU0KeCb0QynViZURhhNB2rI5a4kf4EOfE=;
        b=If656WD9AuMcDX43YT9UOK3YuG8PxW7XUjN/uvyXFyX/HIky9sEapTbFF4V5i70pYQ
         jXVNFnW5KirPO6h5F4wDml/Xu1YIG2yUP+vXNiY0Mrhfi4VbPSdPK1ZHQlyZrkpJXFsb
         xG6kextoAxDcFQRSrfXYLtbdrTLiaGotnz/8qj0e/Dn9G5pwHLT9AMqroKZzG5XEzCci
         x4u34AnstyxYHnx/umvWRsbaKXQWBYT0uE4wGUYRvtUK5T2danVjYl550rpuE2ZVTjnL
         KcDXYLyi+/lWZhQCpSyqmTgkTiDDPUAZ5qQ8tuBA3a0RIsp/16BBInUOcDuy8ZcfXaWC
         Ks2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322367; x=1688914367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytR9MFcgJFjU0KeCb0QynViZURhhNB2rI5a4kf4EOfE=;
        b=Q43EqM05l9vRL2el4RIO/UMdhjEcQ+FLghxtDhsxsMVVU2FWp3gQo62NS2eL9Mjtqg
         BJ+qyy6ZmTZ2V0Oq/S7JbsLi9UsccOEk2G7zzbtls0JEfEMY8twNCOsfTOvO4q7cV5p8
         qdgD5OAQwKJY9JOE7sOD9vHyU1ok18cFxTqqHbAzkIePRx/T77IWtkFh6S+P4nSAwhHr
         SLZ6GfN8KR22xeMVl2ejPPgSqzRkqLbqepR0M7HF7sBdSmQDmQNYwLnGx8qLhsFjkwtH
         itywBMlpsgVM5DG0it8euk8upONDHqXN0CLumq3xQcYlsBSoTpwZ5jX4vAHraIfFa+Ux
         pltA==
X-Gm-Message-State: AC+VfDzLEGuu/Tcg15WNpuTu9Ra8RNpNGId5guDy6CjvXuBg/iH7Hesh
        2Q94A43GwqDzYeLBLwa6Y7oJsA==
X-Google-Smtp-Source: ACHHUZ6p8J+gs0jIQ4AOzs+OWU43jonUXrSgri5LlgXTp2LKnK6h1xF8IXFP3nkwV/aH1pek+nY+Og==
X-Received: by 2002:a2e:8217:0:b0:2b1:bc73:6fa with SMTP id w23-20020a2e8217000000b002b1bc7306famr1306330ljg.21.1686322366828;
        Fri, 09 Jun 2023 07:52:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id p26-20020a2ea41a000000b002adbedc9962sm420713ljn.46.2023.06.09.07.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 07:52:46 -0700 (PDT)
Message-ID: <c3c12574-fc38-84ae-2a94-3c80fb9fb363@linaro.org>
Date:   Fri, 9 Jun 2023 16:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sa8775p: Add interconnect to SMMU
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>,
        Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
 <79206b05-674b-1f6c-6eb1-ed45e6bd5637@linaro.org>
 <20230609125631.GA29252@hu-ppareek-blr.qualcomm.com>
 <2881f374-70e2-0057-f43e-7be12d32ae22@arm.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2881f374-70e2-0057-f43e-7be12d32ae22@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.06.2023 16:45, Robin Murphy wrote:
> On 2023-06-09 13:56, Parikshit Pareek wrote:
>> On Fri, Jun 09, 2023 at 10:52:26AM +0200, Konrad Dybcio wrote:
>>>
>>>
>>> On 9.06.2023 07:41, Parikshit Pareek wrote:
>>>> Some qcom SoCs have SMMUs, which need the interconnect bandwidth to be
>>>> This series introduce the due support for associated interconnect, and
>>>> setting of the due interconnect-bandwidth. Setting due interconnect
>>>> bandwidth is needed to avoid the issues like [1], caused by not having
>>>> due clock votes(indirectly dependent upon interconnect bandwidth).
>>>
>>> [1] ???
>>
>> My bad. Intended to mention following:
>> https://lore.kernel.org/linux-arm-msm/20230418165224.vmok75fwcjqdxspe@echanude/
> 
> This sounds super-dodgy - do you really have to rely on configuration of the interconnect path from the SMMU's pagetable walker to RAM to keep a completely different interconnect path clocked for the CPU to access SMMU registers? You can't just request the programming interface clock directly like on other SoCs?
On Qualcomm platforms, particularly so with the more recent ones, some
clocks are managed by various remote cores. Half of what the interconnect
infra does on these SoCs is telling one such core to change the internally
managed clock's rate based on the requested bw.

Konrad
> 
> Thanks,
> Robin.
