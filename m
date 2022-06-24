Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEFDC559F5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 19:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbiFXROv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 13:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiFXROu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 13:14:50 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66453647A0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:14:48 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id g18so3941541wrb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ktu3ikYNE7irPLarQIpMZpPOBYDmyDcsFDEun1kygEY=;
        b=xi9MZOPXRCdoh9sO8tIFIGDgvS9dqWXO3XDyam9oNMuirIIWFHfz20y14sMxxpqGIT
         SOcuoeLbfj3s7aZMasQ/REd2xJGE4+YLgO8TbMaT+gCZtd9H+0LRXQUWB16W0htXNpuf
         nyYqF+5xS1ZaUFBVys39bJUQo+t/uRywgLUcgb1hs/5GkNWejnhrGHhGW9VKrld0n2EW
         AbETSPvLqdL8vVWVydLgUG3xWQY15O1Gd04XuAI9KzhYlOfcHS/WllVm89ucIjkc/2gH
         Rq78KNq0DxCHzgnb5pD+cOJdCidEfOF4jfIbwUrMxQj2EGvD2Z5WAwARhkifoDNmf05e
         qeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ktu3ikYNE7irPLarQIpMZpPOBYDmyDcsFDEun1kygEY=;
        b=hHIDDt7Mx5bQvSFDPWPhLYSAkcjLAWqnrsaaa593d7yakI0VkXNkV/oiQhQOG1Y6xE
         uUsjGyD3pWcb1Vb65765+NllcZgoWPAaUdXkjEYAghK1Qx0H0xU0uIut89PYeaRbyMdi
         Lm7G8SgNbZRbn8IoJegMbe/KZQ+LnejRDTbkM9CvyEh3GRdZazj020EuYnT4IJ7Sl7kq
         JUfkDQD+SMKcU8faST1Jx4xdpyzo9NsOm3Tzqs/8/bLoZZTxTQUvA5aCHfyELTZEFxVx
         tWFAtUEO5spMV9Llm9CedFrgNZ67oz51YQLXMST/0JcLuFXBT+GoBAK8OovFjAEniYNY
         sM6A==
X-Gm-Message-State: AJIora/+IfGJMeaNnN8JQmPRE5+/gnJ1/rvM2bNZaA5slo1hXipN9QEo
        JpqpRjP5gnQbObYhTEgB7vkBIg==
X-Google-Smtp-Source: AGRyM1sLQYGZAaX+lFxtBA94oQIWAvZYbgECA77xFxvwaOZQm0PFlwQ5AY512c5CrAbgrYnDliPWmg==
X-Received: by 2002:a05:6000:184c:b0:21b:b6ac:8cb6 with SMTP id c12-20020a056000184c00b0021bb6ac8cb6mr197570wri.154.1656090886924;
        Fri, 24 Jun 2022 10:14:46 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id az33-20020a05600c602100b003a03b4cb7cfsm2781255wmb.38.2022.06.24.10.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:14:46 -0700 (PDT)
Message-ID: <1f426a67-2cf2-b67e-3cd0-a4c452591baa@linaro.org>
Date:   Fri, 24 Jun 2022 19:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT
 nodes name
Content-Language: en-US
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-snps-arc@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/06/2022 16:16, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/lpc18xx.dtsi | 4 ++--

You should split the patchset per architecture, because maybe that's why
no one picks it up?

Let me pick up ARM bits through my cleanup series. If anyone objects,
please let me know.

Best regards,
Krzysztof
