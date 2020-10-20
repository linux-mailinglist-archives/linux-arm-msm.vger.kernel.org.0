Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2682A293C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 14:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406504AbgJTMof (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 08:44:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36329 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406500AbgJTMoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 08:44:34 -0400
Received: by mail-wm1-f66.google.com with SMTP id e2so1725727wme.1;
        Tue, 20 Oct 2020 05:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IzZX4zGGwluZ70Rb48zONj29b5Z7XTIenJHYm8MJX6U=;
        b=R9y6LLdqu19zCUOVcHWCf2aRzwTUxAaPyrKCM8hsgieDig4ecaRRsU+TtR2B2skGhS
         s5BPzbOnDAo1Ja8lHgqmiSg9XUpd6UjwoS6/WAjNTcafgWGzBSngGBKBpwcUmJaJRVpf
         Qvkd1bvugT2hPU7UyPEMF9uwJfJ5vAd3Z9WO+a9v5GUSkqx0iay+NpZq9Qpa9PBudM2F
         gICTQP+Zsyx/7UbwUn9h5LAW05W7fnqu2LfjMEGgVfmM4sbBlmDcsqnVJf3vVjOhxgKw
         a66f2NM9hZcrS875nhQBN+jAYNrFpzbm3g/hbwLhYWXOOSbDkHu7Vhlk6HPA4acdyR1d
         rj3A==
X-Gm-Message-State: AOAM531unJFlI8SJdWXUxP24nDIYxFOOLFEGBWTzpSlw7JU+iM+F1d+2
        Y5vhdjdyPsV/62c4aflBPokWh2V8hLQjK+a2
X-Google-Smtp-Source: ABdhPJyGjKoqZPYMot+a1OkS+n8PXkomZ+8CgF1E4gXdXXoRvO2bbYazsP6IjtG1H/mg+x6uuoXGnQ==
X-Received: by 2002:a1c:6643:: with SMTP id a64mr2861815wmc.142.1603197872185;
        Tue, 20 Oct 2020 05:44:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id u2sm2554384wme.1.2020.10.20.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:44:31 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:44:28 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <20201020124428.GX127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:59PM +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi        | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi        | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8998.dtsi        | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi     | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404.dtsi         | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi         | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8150.dtsi         | 2 +-
>  9 files changed, 14 insertions(+), 14 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
