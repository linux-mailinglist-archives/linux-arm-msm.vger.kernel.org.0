Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C72F729E39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 17:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241466AbjFIPW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 11:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241482AbjFIPWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 11:22:55 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234EF35BE
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 08:22:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso2439518e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 08:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686324166; x=1688916166;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z86xdDsI0kGtRKtFM/tLOoPg7PoS51U7g8ShD0LwtSQ=;
        b=g+0YEjiq32Yj0Wa0AXNiU8bJ+JSClgdE/hZ428+TspCD8Mk36atPrCzhCMjgBfNU7i
         FO4dld8TogXyFJ/ENAsy/Q/TGQwSbJVpX0TXOYdLg3SgcWLXrB/yHs+kVzPQJxEUQfpf
         y7D4hWcN2yCgn9ctd/hhtpGGl4jJkYEqy0M4EiVZDgObiinjgqFHn93eqaStKnZNk2uU
         1PzEy+TrscO+6qFUIJ6jVLe/G1kOkDEHaHndYGswtHTYiM/5jd0vFIGOgLx5CLFzJxrB
         tC0JjqQEVvJpiUflPUMzFOaRkbEJ3wyiWZnLaSER6nXEjOsSIMMpamCKshCvOW8rXt8j
         k/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324166; x=1688916166;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z86xdDsI0kGtRKtFM/tLOoPg7PoS51U7g8ShD0LwtSQ=;
        b=d06ZXUVPihXNSm9zqRgExFpRQv3UAYKV2Zny9EKnDyd9C4sJgHwqIjk48jnjavKsU1
         EMzg8pyZdpcpIAEsHXWRGtwC8qpgKspxsMBqMgMieoFmLbyyigse2mWMn7pZRDB8c/lE
         5dz8MOUW3SW5ptDPYyWYPXv00MpwjiBR6orw0Gi5IEl9rZzGDzA7yNLEWoH+jm8q0MOR
         N4Ecnnygt98RLd9ItusAEmMFHDXnD7vOy9zV4pxQV9DDoax0pscAvmdgpFS/iYNXCmr9
         R3ggo88lY1QWZSF56p5IWiZfRxqUl1HGEE8u67cofP5bjWnUBr7bvzKyJC1GWl4QQYNn
         1n1Q==
X-Gm-Message-State: AC+VfDxkUFPFwxyCyQ1QMGGRcf5SsUGIy/WSksTt/tGLAFYkua6E05vd
        9KSKnMOwJHpDpqD+WWPqyul1MQ==
X-Google-Smtp-Source: ACHHUZ644vSJDB1y/RM+1wyEjsx5kTGuUMSwyzXP5Ku8VIMsRpk/Ae2ppr2P3Yn9zp8yhGbfpP+dvA==
X-Received: by 2002:ac2:498e:0:b0:4ec:8615:303e with SMTP id f14-20020ac2498e000000b004ec8615303emr1384935lfl.33.1686324166361;
        Fri, 09 Jun 2023 08:22:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id y27-20020ac2447b000000b004f4c3feb9fbsm574947lfl.61.2023.06.09.08.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:22:46 -0700 (PDT)
Message-ID: <e5aba6e3-e938-0b85-b3ad-0723cece06b5@linaro.org>
Date:   Fri, 9 Jun 2023 17:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
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
 <c3c12574-fc38-84ae-2a94-3c80fb9fb363@linaro.org>
 <54da68f0-9f9d-cea4-13fb-5e10b8171746@arm.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sa8775p: Add interconnect to SMMU
In-Reply-To: <54da68f0-9f9d-cea4-13fb-5e10b8171746@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.06.2023 17:07, Robin Murphy wrote:
> On 2023-06-09 15:52, Konrad Dybcio wrote:
>>
>>
>> On 9.06.2023 16:45, Robin Murphy wrote:
>>> On 2023-06-09 13:56, Parikshit Pareek wrote:
>>>> On Fri, Jun 09, 2023 at 10:52:26AM +0200, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 9.06.2023 07:41, Parikshit Pareek wrote:
>>>>>> Some qcom SoCs have SMMUs, which need the interconnect bandwidth to be
>>>>>> This series introduce the due support for associated interconnect, and
>>>>>> setting of the due interconnect-bandwidth. Setting due interconnect
>>>>>> bandwidth is needed to avoid the issues like [1], caused by not having
>>>>>> due clock votes(indirectly dependent upon interconnect bandwidth).
>>>>>
>>>>> [1] ???
>>>>
>>>> My bad. Intended to mention following:
>>>> https://lore.kernel.org/linux-arm-msm/20230418165224.vmok75fwcjqdxspe@echanude/
>>>
>>> This sounds super-dodgy - do you really have to rely on configuration of the interconnect path from the SMMU's pagetable walker to RAM to keep a completely different interconnect path clocked for the CPU to access SMMU registers? You can't just request the programming interface clock directly like on other SoCs?
>> On Qualcomm platforms, particularly so with the more recent ones, some
>> clocks are managed by various remote cores. Half of what the interconnect
>> infra does on these SoCs is telling one such core to change the internally
>> managed clock's rate based on the requested bw.
> 
> That much I get, it just seems like an arse-backwards design decision if it's really necessary to pretend the SMMU needs to access memory in order for the CPU to be able to access the SMMU. The respective SMMU interfaces are functionally independent of each other - even if it is the case in the integration that both interfaces and/or the internal TCU clock do happen to be driven synchronously from the same parent clock - and in any sane interconnect the CPU->SMMU and SMMU->RAM routes would be completely different and not intersect at all.
Well, it's not the first time we stumble into a.. peculiar.. design decision on
these SoCs.. That said, we can't do much about it now..

On older SoCs, some interconnect paths were strongly associated with specific
TBUs which were responsible for specific SID ranges..

In this specific case, it looks like SIDs 0x000-0x3ff should correspond to
PCIE0 and 0x400-0x7ff to PCIE1. But the line isn't drawn very clearly this
time around, so maybe there's some internal spaghetti.

Konrad
> 
> Thanks,
> Robin.
