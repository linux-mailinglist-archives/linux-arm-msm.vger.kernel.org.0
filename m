Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2C359D309
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 10:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241511AbiHWICH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 04:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241495AbiHWICC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 04:02:02 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9ECE659CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 01:02:00 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a16so10301360lfs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8kwr9P28nyS277cPNviJmCpAD2kCcWxhxSzytfmAPPM=;
        b=w078FvPgjksE9hvIJJNqXO0fZOAECTh9CtTuGSZAeYhHCaqpxGSpbz2PgWnggrNcWT
         I4Qc0Q8Omjjc7DSrc9iVOIjGYGKkDKWfzHq3mIDQ6haFAQT0ZDWo2vO7uwYmrS8vpirY
         nN5ojr7F3sPVUI+9Eg3iV7No/w/WeD1YnTIbZO0AbKwaKJD539jGiXtAn3sf5JDcpAuK
         4aOaPG3qfTbvstFc79trU81O6vyyYmyUSokORniJ5AhIrDPUhXw351nzDEzsh/gi7PKB
         1UoTW2C0GS6qh/yn2H/N0m91dDhYGRiYzPUGKz2sZL1lGk9zvDcXHbc35ajiRu8exr+k
         HTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8kwr9P28nyS277cPNviJmCpAD2kCcWxhxSzytfmAPPM=;
        b=yIFpfxrUIvVJhfm3zzykz+xigXMX+DBDNhJAXMkZU3Zna5DTdrbpJwyDu+XHc/ccJi
         S8rc1rPJfVvlr0h4aZZ3uLXoramq5MMeyolXbPKBIn5WWkq4Cv6IAh7MPIXprfa0IFsG
         mOXuoJW0pnNqDaqD5dGShFevMgmrp0zFoAsuA/H9XBIngZ6Sq5QnSTUpGAbmZ4ZLgBF1
         5xtDbdnpAM/BMkkR2Rnb/EAJf5OoZv0JhAsxQeBvAEm1lu7rQsFyj+VbwcpQJC/YlskS
         9UpjnaVA1EW0BNpv6fzzUxTk1z4O+/BpSwwb1ainJSpAw4U98btlLIZL4ulrSaIc6mj6
         VsVw==
X-Gm-Message-State: ACgBeo1wYNMdF567V6bnHg10E8okITAwxKX9SIp/oluIxh0PST4Lwn/c
        urW56fnBiDtLLD0hSjFLr2GJ9w==
X-Google-Smtp-Source: AA6agR4T2ojtqAekhhO+3PeLF3Y3+5fUDILfCCYgVbuo6QADnkEMSZKuBSpzAARDk3onZwpZatyNKQ==
X-Received: by 2002:ac2:4c4c:0:b0:492:bc29:e328 with SMTP id o12-20020ac24c4c000000b00492bc29e328mr7660710lfk.386.1661241719288;
        Tue, 23 Aug 2022 01:01:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n8-20020a05651203e800b0048b13d0b896sm679256lfq.141.2022.08.23.01.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 01:01:58 -0700 (PDT)
Message-ID: <d3b435ec-fa47-9ed2-de65-e5e0a6cf7b05@linaro.org>
Date:   Tue, 23 Aug 2022 11:01:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org>
 <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/08/2022 02:38, Elliot Berman wrote:
> 
> 
> On 8/2/2022 2:24 AM, Dmitry Baryshkov wrote:
>> I might be completely wrong about this, but if my in-mind picture of 
>> Gunyah is correct, I'd have implemented the gunyah core subsytem as 
>> mailbox provider, RM as a separate platform driver consuming these 
>> mailboxes and in turn being a remoteproc driver, and consoles as 
>> remoteproc subdevices. >
> 
> The mailbox framework can only fit with message queues and not doorbells 
> or vCPUs. The mailbox framework also relies on the mailbox being defined 
> in the devicetree. RM is an exceptional case in that it is described in 
> the devicetree. Message queues for other VMs would be dynamically 
> created at runtime as/when that VM is created. Thus, the client of the 
> message queue would need to "own" both the controller and client ends of 
> the mailbox.

I'd still suggest using the mailbox API for the doorbells. You do not 
have to implement the txdone, if I'm not mistaken.

> 
> RM is not loaded or managed by Linux, so I don't think remoteproc 
> framework provides us any code re-use except for the subdevices code. 
> Remoteproc is much larger framework than just the subdevices code, so I 
> don't think it fits well overall.
> 
>> I can assume that at some point you would like to use Gunyah to boot 
>> secondary VMs from the primary VM by calling into RM, etc.
>> Most probably at this moment a VM would be allocated other bells, 
>> message queues, etc. If this assumption is correct, them the VM can 
>> become a separate device (remoteproc?) in the Linux device tree.
>>
>> I might be wrong in any of the assumptions above. Please feel free to 
>> correct me. We can then think about a better API for your usecase.
>>
> 
> We don't want to limit VM configuration to the devicetree as this limits 
> the number and kinds of VMs that can be launched to build time. I'm not 
> sure if you might have seen an early presentation of Gunyah at Linaro? 
> In the early days of Gunyah, we had static configuration of VMs and many 
> properties of the VMs were described in the devicetree. We are moving 
> away from static configuration of VMs as much as possible.

ack, this is correct.

> 
> [1]: https://chromium.googlesource.com/chromiumos/platform/crosvm
> 

-- 
With best wishes
Dmitry

