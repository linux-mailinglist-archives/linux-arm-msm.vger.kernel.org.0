Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CC2500293
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 01:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbiDMX0U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 19:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233812AbiDMX0U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 19:26:20 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0A123BF4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:23:57 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p189so2003982wmp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lo222dx271RZBM+PZPbGHgrR4V9AewtXM+gxOLvCm2I=;
        b=ooWghhBZybzJhO95f/a9kEj3SwS/nB5xLnjAEJmxk2pCkHXSJKhVotr3xLroN+oCPB
         UYZL3OIDjqz1Gld9LKtDX5KNKSCERaHp1FxpyylkebXRmOAE5g9S720tUNeuFKvsOwQE
         KWn0xZr68MoNTYQhJkCyDiZ6AvwN2dxomuBImwQcziNYTecgrRDbppPHmHPzAqCgCOef
         8gGRleazPp7Kz34JgXqisq/RrugKKpLxPJYxE4wXu4LBsGObAYUaTwjjSnh8k33E8rul
         9G4Wt3lMucqiw2epbhhxyJ/EZq+KErmsxmGrYpnjcoQRhlOhGa0dyO7zsLOqP9qhOx0Y
         KMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lo222dx271RZBM+PZPbGHgrR4V9AewtXM+gxOLvCm2I=;
        b=w+da2inh29ZOfDXOOgvOypLqHbrRuusLUgznj8CTGzpEbo8SZx1JDwlR6H9OfQsTsZ
         QTZ7w+5CUqjr+ONKKMxRQpAIYyQ/EY89uP84QUwasHbtbJIIs3F+UGGHU7ObVTNPWOay
         mMe7E8BteAHcHp/WnKVqJWuIb26lXVxnOR6acDXPd7fBtKVpP4QXVKvKtVSklBJoJ5Ra
         Vuy2V/WvQituIpaoOABeAfZPcWnZ/zs2oLiLpfYy/2hp5LHO1C5daC71ssX3eHRTlu2G
         aZdSV5qmXzJkEEKD86WCxwCY0gN4WMdWoGKSu9tk98ufKpMj5Lh7WjEn3ts9Wm4e8nNn
         AGWA==
X-Gm-Message-State: AOAM530O7qnElFVYQAhwdP2qIkUn+K82+DMT/bG0+3+XePWZRU0GSBH9
        PBTni4HGlzIzdNWfJeeCyKDkTgKO6HjW9Q==
X-Google-Smtp-Source: ABdhPJx9AtbpVH23mBv3sdIAPC89sMV8A13WffMaN6fu2QHhnt3ecmPXXEBIqwUpx9so/cYjn9/cow==
X-Received: by 2002:a05:600c:489a:b0:38e:bb23:c7df with SMTP id j26-20020a05600c489a00b0038ebb23c7dfmr407567wmp.148.1649892236130;
        Wed, 13 Apr 2022 16:23:56 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h2-20020a05600c414200b0038ec7a4f07esm3534850wmm.33.2022.04.13.16.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 16:23:55 -0700 (PDT)
Message-ID: <400bf6af-aa8f-49e2-4c76-c8355468a714@nexus-software.ie>
Date:   Thu, 14 Apr 2022 00:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/3] Add camss to SM8250 dtsi
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2022 00:17, Bryan O'Donoghue wrote:
> V2:
> - Change 0xHEX to 0xhex - Bjorn
> - Merge CCI and CCI pin definitions into one patch - Bjorn
> - Future pinctrl dropped, moved into dts file for board
>    which appears more consistent with sdm845-db845 &tlmm{} section - Bjorn, Bryan
> - Renamed cci0_i2c0/cci0_i2c1 and cci1_ic20/cci1_i2c1 - Bjorn
> - Grouped CCI pins into cci0_default, cci0_sleep, etc - Bryan
> 
> V1:
> Add in necessary CAMSS, pin and CCI definitions to the SM8250 dtsi.
> 
> This is the SoC specific stuff, the platform enablement will be done in a
> separate drop later.
> 
> On the RB5 platform we have validated ~ 30 FPS @ 4K using the SRGGB10P
> pixel format provided by a Sony IMX577 sensor.
> 
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=br-v5.19b%2brb5-dts%2bsensors
> 
> Bryan O'Donoghue (3):
>    arm64: dts: qcom: sm8250: Add camcc DT node
>    arm64: dts: qcom: sm8250: camss: Add CAMSS block definition
>    arm64: dts: qcom: sm8250: camss: Add CCI definitions
> 
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 330 +++++++++++++++++++++++++++
>   1 file changed, 330 insertions(+)
> 

I forgot the link to the fully bootable tree with working sensor in the 
overview

Link: 
https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=br-v5.19b%2brb5-dts%2bsensors-v2

---
bod
