Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151C15006AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 09:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240294AbiDNHNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 03:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235920AbiDNHM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 03:12:58 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB369554BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:10:34 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id s18so8378991ejr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vXc9aotX8pItntv6nrbEQeQkIWFJAZuwrUVeDNb5KEY=;
        b=oGRYsPmA7r5aH6nEOkafv18jXIudJ4QSnqZ4Eqphri03GL0sKRs2CoFpW4rT7egeSV
         +/Ofo9+Rb6zqPRNeQxM3aCEw9NVH7O3FXWQ+WZsghvrrs/4pCAE3JAwDO28glperM7uf
         FtaM/HcV/JEAN2bQdGFQOwlLGULvPeKPD9qCFhng8QkPKf8wgEY6kZfzzfLFdaCi3PQ+
         42vNJfVWxiDtyGb86VIxXSUxHnpUT+TSt3yZUGIs7dGb97afnHrXeQogjoiwjAb0v6RL
         6RjdmVFJjsm+Zl0LVX2h4w8WAuGsN++p5KFafpnqg55HV/NFHu/6BR6tYy+wWhS0zRf1
         Cy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vXc9aotX8pItntv6nrbEQeQkIWFJAZuwrUVeDNb5KEY=;
        b=IP3rKJdbmu8KOELvTxjTIPYhCGkHglRE2d8y+6AIsNr76N2KUUGJBI2deYjRc6HNiT
         WhMhRM+jGcRiTyjF2qS5y0gNkPVLgH5p/l22p+l9PMmRQQkD6IF8NUsX6irxXjv+WNu3
         zePZcZNkh5hBUb3ZIOC55M8X0CpSJjRCV9ZEClrB6vlRWqFvKC0gPspVocXvYT7KcWxk
         xAL9yctaF2q96vogifpMPhhPJIUq0o1pelCdm9iE2/1nklZmO6Ar0rWo7B0tHOKCZCCK
         nDePq+idyhdxAikjScW6HtYTbYjiwZ7LeW1tDxloK+u4mssDxy6BCPYxj7R2zY5RhaYq
         4A6w==
X-Gm-Message-State: AOAM530+CtgpJ1REdCtV5a3BWPeudtzBiiYhbZxsfvPbY7+YQuGQ2Vqz
        btUcDgx3aEjJU4rW3q/1ThaeMA==
X-Google-Smtp-Source: ABdhPJxbn1hFLOcOehZlEtYBz6/zRzSwJimnPFP6rtn1IUphaeXpCXp1/vqdvJmP6/y4ydceI58nmQ==
X-Received: by 2002:a17:907:94d6:b0:6eb:6a12:df60 with SMTP id dn22-20020a17090794d600b006eb6a12df60mr1089630ejc.68.1649920233387;
        Thu, 14 Apr 2022 00:10:33 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090657c300b006d01de78926sm356507ejr.22.2022.04.14.00.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:10:32 -0700 (PDT)
Message-ID: <b7ff08b8-60fb-7629-9399-3d5cca46ab9e@linaro.org>
Date:   Thu, 14 Apr 2022 09:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] CHROMIUM: arm64: dts: qcom: Add sc7180-gelarshie
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20220330090947.9100-1-chenxiangrui@huaqin.corp-partner.google.com>
 <a0eb6bf9-256a-29b1-2211-496df710f531@linaro.org>
 <CAD=FV=UjyLofXZqnj=bL89fza5JS6O5Np9W-A4V4WK+na0hdrw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=UjyLofXZqnj=bL89fza5JS6O5Np9W-A4V4WK+na0hdrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2022 23:48, Doug Anderson wrote:
> I'm actually kinda curious: is there really a good reason for this? I
> know I haven't been adding things to
> `Documentation/devicetree/bindings/arm/qcom.yaml` for Qualcomm
> Chromebooks.  Ironically, it turns out that the script I typically use
> to invoke checkpatch happens to have "--no-tree" as an argument and
> that seems to disable this check. Doh!
> 
> That being said, though, I do wonder a little bit about the value of
> enumerating the top-level compatible like this in a yaml file.
> Certainly the yaml schema validation in general can be quite useful,
> but this top-level listing seems pure overhead. I guess it makes some
> tools happy, but other than that it seems to provide very little
> value...

If compatible is not part of ABI, it is allowed to change in whatever
shape one wishes. In such case, how can anyone (e.g. user-space)
identify the board? Model name? Also not part of ABI (not documented)...


Best regards,
Krzysztof
