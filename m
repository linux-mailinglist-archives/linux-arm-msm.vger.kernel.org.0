Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB8E773110
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 23:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjHGVQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 17:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjHGVQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 17:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FA51715
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691442933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ye5A6Jw6eWidJwu3XWNBZr93qlVRCWc3OvMx6RGhxc4=;
        b=M28A9mVFHSQho9hYeutXf6YEyw9tAb1Ua1Rb5nVp13gofr/2IzTNo82PmMEvGJ75i5l8YE
        xHT1yGVnX66ULQKJjJ6OcSdmYyak0S/M/U84Qi5RK7EG89ZUBAEA2zIJQH2cR9XGfMBAua
        d163x2vZ9GuPj4tUxusIKkmVzTz/8Uc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-BeqfGG-APMCMB01ltHhufQ-1; Mon, 07 Aug 2023 17:15:31 -0400
X-MC-Unique: BeqfGG-APMCMB01ltHhufQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-63d09e8bc06so38936126d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 14:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691442931; x=1692047731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye5A6Jw6eWidJwu3XWNBZr93qlVRCWc3OvMx6RGhxc4=;
        b=bGSUp1FHFvnbvv/BD9c+Sfu5xpc9HvnU7OLI2+ocKGRcg+N+gTDfEBdzpV1L0ko3om
         36f5JcBJ2BYatuPSMTz88fXilxkRKblfzhNYadb3SlTg0DTsOFmizd3q5/ydTqGI0pa9
         eZYCrF/Gn0o2ViYmdQG+kGucs4PHIiT+gkmj/ygGhwevYfDEJbyJN/GxclQrqW9YLqha
         tp0M8pQVNVr+MEVytOQGoIOWl1f4qPA5z8wAbV3jK3MhFLQBvsciS8JN8XaAhDJux723
         XmvSP2GiKTbgCvQ+lFJJcR7xqK+efZeNcU+2BQg94A2VpoQU0ZNOIjSDMJmVRmTmHHOf
         jSyQ==
X-Gm-Message-State: AOJu0Ywgfj9k+U1pyxel7TTjBKiVmNSu9uhfpF27CTqNTVIWPH2Szlgy
        Zr7C+wxNuzPKuQcZQ65HrpWNAQ5jpNS4PyJEAeBQ3sx9TyCsXVnpQ5X8ob715uEUtTRWleqVyK+
        x+YNpcIKKEwjXeJKHiEQjEb3ymQ==
X-Received: by 2002:a05:620a:44c6:b0:76c:af3e:3c14 with SMTP id y6-20020a05620a44c600b0076caf3e3c14mr8603218qkp.71.1691442931210;
        Mon, 07 Aug 2023 14:15:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs6cY258Pte+EWAopO2m1NTOSfKDpS5t4ZtseNKSU54HCauQLwYxyIy58E/V+PpQfupC6BsA==
X-Received: by 2002:a05:620a:44c6:b0:76c:af3e:3c14 with SMTP id y6-20020a05620a44c600b0076caf3e3c14mr8603197qkp.71.1691442930969;
        Mon, 07 Aug 2023 14:15:30 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id oq6-20020a05620a610600b0076d0312b8basm1350731qkn.131.2023.08.07.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 14:15:30 -0700 (PDT)
Date:   Mon, 7 Aug 2023 16:15:28 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sa8775p-ride: enable the second
 SerDes PHY
Message-ID: <adcu2mjmpfnncwfhmwkdwwakk26ob6ee2lwyr4lz32n5zes27r@c6qkjmgoaz53>
References: <20230807193507.6488-1-brgl@bgdev.pl>
 <20230807193507.6488-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807193507.6488-4-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 07, 2023 at 09:35:01PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the second SerDes PHY on sa8775p-ride development board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Matches what I see downstream wrt the supply, so:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index ed76680410b4..09ae6e153282 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -448,6 +448,11 @@ &serdes0 {
>  	status = "okay";
>  };
>  
> +&serdes1 {
> +	phy-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
>  &sleep_clk {
>  	clock-frequency = <32764>;
>  };
> -- 
> 2.39.2
> 

