Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED0B6E6BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 20:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbjDRSMY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 14:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjDRSMX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 14:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE60868F
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 11:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681841485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a2NJ2p6cE8nPnq4qyhSh+ydMCNdO89r7It+YsHhkzyo=;
        b=LszvRvzrgvs1gNbLu/KsgGQJJX27NTCHaS3WFAsA9Tj6dcDWkiI03ce8ejeJRaavJyfhjI
        OT8WfWQDxpYibTJgu7akywA4hzJ1gsHpt+Z1nQs6Nezo5dDD/DViovPizx9wVDcS1JZkYk
        bDYTgVtlXk8yKI1HtssKa79/eFLN36s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-vrDdpDQ4NfukW15oVP8P6Q-1; Tue, 18 Apr 2023 14:11:24 -0400
X-MC-Unique: vrDdpDQ4NfukW15oVP8P6Q-1
Received: by mail-qv1-f72.google.com with SMTP id o14-20020a0cc38e000000b005e62747d93aso15787490qvi.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 11:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681841484; x=1684433484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2NJ2p6cE8nPnq4qyhSh+ydMCNdO89r7It+YsHhkzyo=;
        b=iTfplmJKy0CSMMD6pyKYY9XfruTeAvG7YbewWWzjTbMxexx9pVOn1UnA6Kix2mr0qV
         H/bNVOaU2OG6r6R9CAnLhqNUnS3+i5tA7NbOBiBPgv77nSeUsl32T9Bq3h6e6WX5AhWf
         4Pm+Qh/G9/lKV7fk+Z85lEfAsZaa5TktbySUqY7Bg4EtVT+f4mP9/Skb5/KR4czPFl8o
         jFFrYHOcrJXGa8qT6cvlVdePAZtF9T7rKKFezIVCwfiUGyUcXK5ARulr12llsKUZShxq
         3a/Tw5YyjxF9J3s7r1hUzhNunIhCENpodvLKqe9p08y4PLwgjGdtPOP9qwCCPiirecXT
         vXVQ==
X-Gm-Message-State: AAQBX9fkm6Y8TswUveQo6TdmPGYKA+oXqztIvLifQ7ce8MKx8TIC9axy
        WcenPdOwavxngINqAR6xGtuoHn/a6j6ArjCBdJd1VVXZsMPErqAmMaXO6h5fkd+43zzgXVacXmj
        ecBhvWxyQ+RpuYkcwD6ZKSYoQnA==
X-Received: by 2002:a05:6214:508b:b0:5e0:7ecb:8ffb with SMTP id kk11-20020a056214508b00b005e07ecb8ffbmr23344896qvb.8.1681841484174;
        Tue, 18 Apr 2023 11:11:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350a3GbO3FdgQzclKEsUIQPHtPQW7EW4y+mIxxoj0/PCOcdeWVYhW6FGqFVxxMO5MsPFGAYyE5w==
X-Received: by 2002:a05:6214:508b:b0:5e0:7ecb:8ffb with SMTP id kk11-20020a056214508b00b005e07ecb8ffbmr23344854qvb.8.1681841483879;
        Tue, 18 Apr 2023 11:11:23 -0700 (PDT)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id kr24-20020a0562142b9800b005eee320b5d7sm3812683qvb.63.2023.04.18.11.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 11:11:23 -0700 (PDT)
Date:   Tue, 18 Apr 2023 14:11:26 -0400
From:   Eric Chanudet <echanude@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sa8775p: pmic: add the sdam_0
 node
Message-ID: <20230418181126.yu7ym5acb3x5twex@echanude>
References: <20230417145536.414490-1-brgl@bgdev.pl>
 <20230417145536.414490-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417145536.414490-4-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 17, 2023 at 04:55:36PM +0200, Bartosz Golaszewski wrote:
> From: Parikshit Pareek <quic_ppareek@quicinc.com>
> 
> Introduce sdam_0 node, which is to be used via nvmem for power on
> reasons during reboot. Add supported PoN reaons supported via sdam_0
> node.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Tested-by: Eric Chanudet <echanude@redhat.com>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> index 5abdc239d3a6..3c3b6287cd27 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> @@ -88,6 +88,14 @@ trip1 {
>  			};
>  		};
>  	};
> +
> +	reboot-mode {
> +		compatible = "nvmem-reboot-mode";
> +		nvmem-cells = <&reboot_reason>;
> +		nvmem-cell-names = "reboot-mode";
> +		mode-recovery = <0x01>;
> +		mode-bootloader = <0x02>;
> +	};
>  };
>  
>  &spmi_bus {
> @@ -133,6 +141,19 @@ pmm8654au_0_gpios: gpio@8800 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		pmm8654au_0_sdam_0: nvram@7100 {
> +			compatible = "qcom,spmi-sdam";
> +			reg = <0x7100>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x7100 0x100>;
> +
> +			reboot_reason: reboot-reason@48 {
> +				reg = <0x48 0x1>;
> +				bits = <1 7>;
> +			};
> +		};
>  	};
>  
>  	pmm8654au_1: pmic@2 {
> -- 
> 2.37.2
> 

-- 
Eric Chanudet

