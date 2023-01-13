Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE349669A22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 15:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjAMOa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 09:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjAMOaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 09:30:18 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A6F84097
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:23:22 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id x10so28484925edd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jltJ1PtaljceVmLtUNZy4GkzBy9Rz0omnda+TqjQGk0=;
        b=VBhMWoJtRRYKon+iIS+tTXfxLPkHkUgxz1XzLA/c/iY8SCPSKqmTEUzGmJ60XXsw0j
         xdMPM9MJK9sFONsRksBoJKFnb/z7gtfHNC+tlom7DjTkL5IE+hN27SkBSARwm8vsrBxy
         MsZRm+gUd1BgSjaYJQmZaJCKMlTSAH8EZC1qiXGXid1NUWaPZNoXVno4bDuKozhrZdDz
         A0YZQ5nlUbw21Hjw6veiqJaXijY8I7atT7FsouwrcBD8DQhjN/EAqGSSWrMGXfbbMIVJ
         WqLE0fdbt0ITXpfMHdFNnitsqm9JtXrG+9JtKAhWr/ZlHg8yoTBmc0XEGjVZ6yXo10nh
         27Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jltJ1PtaljceVmLtUNZy4GkzBy9Rz0omnda+TqjQGk0=;
        b=GaaK4G6MFm3CJl8TZVIhHCROroFINtLtbF/HhZNBR6DIXvcgGhltzOiA+gcxMa/mlX
         HQ5jAwALOSvhQMfwW+nelklpnMN4jwjfO7zuw2b613jCnAXvAwmtVl46R5/jmvXLVjQK
         88C80yJiH+5n3xZc0yFJqgqhx0qJmHPX8nZ1q9qh4TPfeo73ctADVR5fyMx/+pf8E3Bt
         9Wn2GKmhJL1yjSB9T5GsqP6/3SQZJcSH+huDT/7i9LChEOd/xwo5SaIyEdUYytJ/tIzt
         +X+aWkKWIZSb6LVnVkAepvN7ADLRFagE7pKn37MJkaINxqjQekdvqe7oqyT5dFpMKar/
         SM5w==
X-Gm-Message-State: AFqh2ko6HpCt6kC1IHJ7ACimiWjJtYQ7qnPQzq55ww3sitJKXmmgtIoI
        FP5vTmGMrivzByPH57FzVB57Kg==
X-Google-Smtp-Source: AMrXdXuKgO9JGCXCLsX54cOWfaiZHFKYD32Qa/1wbUnbXVzxem7IzAMkCrTUpbAMgPNaFfCwCzrvcw==
X-Received: by 2002:a05:6402:357:b0:49b:b274:b816 with SMTP id r23-20020a056402035700b0049bb274b816mr4324189edw.37.1673619801564;
        Fri, 13 Jan 2023 06:23:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w21-20020aa7d295000000b0046c4553010fsm669382edq.1.2023.01.13.06.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:23:21 -0800 (PST)
Message-ID: <9016ea51-9ca2-551d-d4a1-0b70232b5dc5@linaro.org>
Date:   Fri, 13 Jan 2023 15:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: PCI: qcom,pcie-ep: correct
 qcom,perst-regs
Content-Language: en-US
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh@kernel.org>
References: <20230113140328.GA1836008@bhelgaas>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113140328.GA1836008@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 15:03, Bjorn Helgaas wrote:
> On Fri, Jan 13, 2023 at 10:02:27AM +0100, Krzysztof Kozlowski wrote:
>> On 30/12/2022 14:42, Lorenzo Pieralisi wrote:
>>> On Wed, 9 Nov 2022 12:32:02 +0100, Krzysztof Kozlowski wrote:
>>>> qcom,perst-regs is an phandle array of one item with a phandle and its
>>>> arguments.
>>>
>>> Applied to pci/dt, thanks!
>>>
>>> [1/1] dt-bindings: PCI: qcom,pcie-ep: correct qcom,perst-regs
>>>       https://git.kernel.org/lpieralisi/pci/c/68909a813609
>>
>> It's still not in linux-next. Is you tree correctly included in the next?
> 
> It's on Lorenzo's branch
> (https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/)
> but I haven't pulled it into my "next" branch yet.  Will try to do
> that today.

If Lorenzo picks up patches which at some point are merged by another
maintainer, his tree should be in linux-next as well (and in LKP tests).
Otherwise we loose some build and test coverage.

Best regards,
Krzysztof

