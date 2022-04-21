Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0604150A6AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 19:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbiDURN7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 13:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbiDURN4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 13:13:56 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8482E49F11
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 10:11:06 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so1045646pjq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=b7HyC84YWaJi+rFPuVcTNleREIonvKxhwkU7uOpi5IA=;
        b=SK7jNRDR4Faawnn1rRV1m39m9ZMGdD9pQ6fLRLba7dWPyOzfrZHcGu6vCox7BixDVH
         hzWH97436KUkp5rH4s+5vhRvUSu76Qg/0hEt6Vb3BQAaCCuI8/x2Sr+D3168/mv5cdk7
         wzUZVe2GtEPzPIGK1ZQ75HS1g0c1vQBEFRF2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b7HyC84YWaJi+rFPuVcTNleREIonvKxhwkU7uOpi5IA=;
        b=D97H2WdV1RA9yJvTPWqj3Mlc5WEywkwErg9bCfY5JhwOETclnlsrnVBTSaVmIMDHVP
         kiWVYpm8nj+oU63jzfdDEizE0igvfRGeZZkHiydmvIIq5jzl7SOIFTdSdt5fILsfPIXc
         ECG185pAtLtJQliTfo076OlPX829mjNp9y14unpSWd71QXMQccjHetDGphrxq2JTit7G
         w9I2MFoOPtV8ID9vvaRbSktDcImo8XhMTOhqZMFOk0TMxk7XVuiul1iQLPj5z85FVO7o
         CFvfaPhGhdvKp/vF7f5d7m3GgqylLN3kCm3LV0vVkm+sn44OffCxIpSn9TK76JAMUc4x
         cjBw==
X-Gm-Message-State: AOAM531NBc2rc6vz+U+Bv2VeanziOxuOVQq5t1jnqy4Q1HwHMaS8RaTn
        FjiAHXKbUR/vSZnnj242Yrah0g==
X-Google-Smtp-Source: ABdhPJzpa34oFn2IWGqz+K+ssfPq9d/6lYrTylDwIjezAJ6Tc35d0NdLgGzlFyU+LIMwrX/VDY7XGA==
X-Received: by 2002:a17:90a:a593:b0:1c9:b837:e77d with SMTP id b19-20020a17090aa59300b001c9b837e77dmr626226pjq.205.1650561066073;
        Thu, 21 Apr 2022 10:11:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d426:5807:a72:7b27])
        by smtp.gmail.com with UTF8SMTPSA id y17-20020a17090a8b1100b001cd4989fee5sm3370709pjn.49.2022.04.21.10.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 10:11:05 -0700 (PDT)
Date:   Thu, 21 Apr 2022 10:11:04 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v9 07/12] arm64: dts: qcom: sc7280: Add max98360a codec
 node for CRD 3.0/3.1
Message-ID: <YmGQKKYfkrwmxmf8@google.com>
References: <1650552459-21077-1-git-send-email-quic_srivasam@quicinc.com>
 <1650552459-21077-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1650552459-21077-8-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 21, 2022 at 08:17:34PM +0530, Srinivasa Rao Mandadapu wrote:

> Subject: arm64: dts: qcom: sc7280: Add max98360a codec node for CRD 3.0/3.1

This isn´t limited to the CRD 3.x, but applies to all herobrine boards,
so it should be something like "arm64: dts: qcom: sc7280: herobrine:
Add max98360a codec".

> Add max98360a codec node for audio use case on CRD rev5
> (aka CRD 3.0/3.1) boards.

ditto

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index d58045d..f247403 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -20,6 +20,14 @@
>  #include "sc7280-chrome-common.dtsi"
>  
>  / {
> +	max98360a: audio-codec-0 {
> +		compatible = "maxim,max98360a";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&amp_en>;
> +		sdmode-gpios = <&tlmm 63 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +	};
> +

This node should be added before 'pwmleds' (alphabetical order
within the board-specific top level nodes).

>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> -- 
> 2.7.4
> 
