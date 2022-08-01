Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56FAD58735F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 23:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbiHAVbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Aug 2022 17:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235348AbiHAVah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Aug 2022 17:30:37 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748AF2F652;
        Mon,  1 Aug 2022 14:29:53 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id f10so5098361uap.2;
        Mon, 01 Aug 2022 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ts28tgvSYssnnOb/jeK0ap78rHcG7btpdX+jY1pjcs8=;
        b=MKR8e1vuCj0akBPAS46UA98lKrJ/JTYN4QwcQQp7FdAf02QiRVsPVBBMY/sR2H4Kqf
         l4Uw8h2vDpriv+qqd/uGU7pxAmYFNmJTTamlPuL+F7AwB0ojq1+rYum33UZv61yyA5hQ
         QBd/n5n1/0gE/hgFi87ifHKhIHEVPjxMbPurv4W8o8QNsBToOAJZaWzuzJjTuBz+h+73
         KyDH7rVAw9WYG4T+cCQkn8UXOz6QZVUBQB4hmu2kGN2+SGGVHVj5zT7r7hqnteaPIGdv
         mEwHywNL4Thyqjg5tdWUWE39czdecDY9WyHkMvB84AEcshSFihbgkYfFpXbjj1ygeNav
         Tk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ts28tgvSYssnnOb/jeK0ap78rHcG7btpdX+jY1pjcs8=;
        b=O+VCoE9lKtL63dB4lND96T3mGj9gdyI6OdfMy2pLdV1Vrye2mgCJb0hU6oF/PD4IwA
         Hii5Y/LT/KacJzh4FO15BbPgjXXi11LHvN2WA6GQVnE85nAXXTbGOSJNYeJEwNdIeQAD
         3x53Mm2cfeXpsLSzoBiyApx6gClGi12vD2IaxbJASb++jiEXZpHe6GUjcKL6wVm9JGlX
         abLxoiYwzcs1YEufwuJ9uce6UKxhomGljbch0C9EM2LvKPIh/aRo1jgQcbwi0WdjsUqS
         8gbKMIz+t+2/D/ao0Shx/5C7ukXME3upVaoK0xkTj4EINOgnMdjOVS7gAMD3NKYZ9ZTY
         5xHQ==
X-Gm-Message-State: ACgBeo1KW5UdAnrkp7zWfgOf3e8JPo1PC4NevVXvchvYNfjRUz4IDzBe
        3P5Ra7WF1IzpeaxhAP8pP3XAIua5m1kXCDHnUoAKxBtK
X-Google-Smtp-Source: AA6agR40jmtoaqi3G+rALbp1od6QZGsVQzLGxYVbqoBNiltnSwhEzDu+UFnMKBTKS1wLCHgNJbWg9Cvuhrwt0oUT5MQ=
X-Received: by 2002:ab0:3786:0:b0:384:d413:5c41 with SMTP id
 d6-20020ab03786000000b00384d4135c41mr6648395uav.98.1659389392566; Mon, 01 Aug
 2022 14:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220801211240.597859-1-quic_eberman@quicinc.com> <20220801211240.597859-2-quic_eberman@quicinc.com>
In-Reply-To: <20220801211240.597859-2-quic_eberman@quicinc.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 1 Aug 2022 15:29:41 -0600
Message-ID: <CAOCk7NpWxh9APUeVVip89VzPiLkkXecaD-rRutxuB0tKgBoO6A@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] docs: gunyah: Introduce Gunyah Hypervisor
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 1, 2022 at 3:16 PM Elliot Berman <quic_eberman@quicinc.com> wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 04ec80ee7352..18fb034526e1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8736,6 +8736,13 @@ L:       linux-efi@vger.kernel.org
>  S:     Maintained
>  F:     block/partitions/efi.*
>
> +GUNYAH HYPERVISOR DRIVER
> +M:     Elliot Berman <quic_eberman@quicinc.com>
> +M:     Murali Nalajala <quic_mnalajal@quicinc.com>
> +L:     linux-arm-msm@vger.kernel.org
> +S:     Maintained

Supported?  Sure seems like something you'd be paid to maintain....

> +F:     Documentation/virt/gunyah/
> +
>  HABANALABS PCI DRIVER
>  M:     Oded Gabbay <ogabbay@kernel.org>
>  S:     Supported
> --
> 2.25.1
>
