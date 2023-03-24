Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E3C6C74E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 02:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjCXBNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 21:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjCXBNu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 21:13:50 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2638912051;
        Thu, 23 Mar 2023 18:13:47 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id h14so243234pgj.7;
        Thu, 23 Mar 2023 18:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679620426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=myQdqITlYv17PuSJdrPcx+vCBz0RFEgVII8ephhFaHI=;
        b=pyCQvHwLxVPug4BcqGPJTSRd/lM27ZMl7kMzanjudu/3XrS8grkbQoKwH9ZPLGBZak
         e8boxuJhAwJ+eP659gbvrbjtFeWdK7fDKHSRDhoFkK8Pi9hXtjI3LKcBoMF9iQflO3DB
         uiYjRr8koxMr9BmPvlONchEbFplkBgSKyxI8+ZhCu9efJDAZjNZTT94N9hIiP14l7H/J
         eRJ649cAisGcovXoJrK+CUe4g1YSCkiwRmZhbTqIDgNdhUXcNZh7SpeLAdYJxIn48F+d
         bLuXrMBMV5FIASKSQZ3FXwJ/yceLt5CS2Pd91QIgbOXzvsKee59xIiig3WaPNbDiR8A2
         gtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679620426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myQdqITlYv17PuSJdrPcx+vCBz0RFEgVII8ephhFaHI=;
        b=qPxw4Qrted+XSz870y+oKsEE2FqFUyshlilKEFjow7khLMroFsjuws0B7FrF2wV52n
         TSKpGDIhIB/akIzZ0NPztDeUr2tGLhT3fMQDJ8b1G3693UKkNstdbPr6ru5GvpfJLloh
         opKcUrNeXq5SLOoVO0CXBmyVgr+HWU+AmginJdTTzwEmwGafh+4xHbdjkMSJYPAWkEIO
         oSxTZwBduD6Rj28PFjDjE5+yJawVqHfFxJ1+J0Ju3ZCRKNsibPphqyMWQucoIsTDm+I6
         +MdMp/ivzNpE0WoZL1KwwYIH607AZbUNtMiVjA5zPvN/gso9b8AKzGTfExEPYTP0rYRG
         03tA==
X-Gm-Message-State: AAQBX9c7GFDwtkA0MoIhphULBvWld5qKQ//08+8phES1lgcp5gBABRsx
        XJuoXutvBmNNHEC0StM7k3c=
X-Google-Smtp-Source: AKy350bYDwvgcAems7RD4WtteMXJNDiEifDemy1QIncNKpCyjWgdm4463KgOH2KmySzTAbKbMdUvNQ==
X-Received: by 2002:a62:1a8a:0:b0:624:1ab3:da1a with SMTP id a132-20020a621a8a000000b006241ab3da1amr1062687pfa.29.1679620426423;
        Thu, 23 Mar 2023 18:13:46 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id c26-20020aa781da000000b005a7bd10bb2asm12596042pfn.79.2023.03.23.18.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:13:43 -0700 (PDT)
Date:   Fri, 24 Mar 2023 09:13:30 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Message-ID: <ZBz5OvauxQ2PWcHu@Gentoo>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZBxkB04KqY8WbeA1@Gentoo>
 <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
 <ZBzyK0ILtUDr986r@Gentoo>
 <37d14447-0f10-be88-9cd9-8ebd30f1d006@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37d14447-0f10-be88-9cd9-8ebd30f1d006@linaro.org>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 12:53:09AM +0000, Bryan O'Donoghue wrote:
> On 24/03/2023 00:43, Jianhua Lu wrote:
> >> Can you show the printout of *(pmic_typec->base + TYPEC_SM_STATUS_REG) ?
> > [   53.120005] hub 1-1:1.0: 4 ports detected
> > [   58.675134] typec base is 0x1500
> > [   58.675148] TYPEC_SM_STATUS_REG is 0xa
> > [   58.675153] typec status reg is 0x150a
> > It should be correct.
> >> And can you check your schematics and verify VBUS is supplied by
> >> pm8150b_vbus and not say by an external IC ?
> > I haven't schematics, so I can only use hacking code to test it.
> 
> Could you show the state of TYPEC_MISC_STATUS_REG @ 0x0b ?
when connected to usb-c, it outputs:
[   47.111552] debug: typec misc status is 0xc0

when disconnected to usb-c, it outputs:
[   64.061706] debug: typec misc status is 0x42
> 
> I wonder if BIT(5) TYPEC_VBUS_DETECT is set ?
> 
> BTW what sort of device have you connected here and is it self-powered ?
It is a usb-c to 4-usb host hub without external supplies.
> 
> ---
> bod
