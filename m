Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98973435107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 19:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhJTRPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 13:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhJTRPx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 13:15:53 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE4DC061753
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 10:13:39 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id z126so10403214oiz.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=boiVqlUXEbveUFmoz0TXWnqa/ZprtFQSlDyn3Tbir8A=;
        b=a6oD6CiXAIjWC3NZeGrfcSrS0RkCyXVpagcBKnkc9CaLbTVcOfhvoynz7RVXDcAcR0
         UdEWbdgALEi2GM3bbek8Dn/StoTUwVqBFuhussP4oW3/nHKOduNoxuVl66vPly93gKG2
         bRN4OrihUgEFzWtGGwQBrqSx8/Y74aSHQvywOPjp4k2q16+uHt8QwgwLEKPh+Tix9ud6
         WZkn9H3AAJ8IQWFpCRu1Qxxn0e9FE01hykyKfNsC4Uakw9ra4i10RI9uKzzcUeB6qJ/e
         rnXqWzAhuOB3UU8LhOI/uBQyJZjxCwWokvcdA9sdyIPBCZoYLRuj1X2lGcO6AcDHrA24
         +4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=boiVqlUXEbveUFmoz0TXWnqa/ZprtFQSlDyn3Tbir8A=;
        b=sK8AfznL5GL03iXSBOkksQOadorESqfjxEA4MkqNEzgFzCmqSGDrFcKhxWonx86+bL
         WCFt4891ldYtiwW1PbEJnjYRYlPd9urB7nEfzi7fqZdnvZVIRiC+32S64JwNFD9UUum+
         2v2t3124enP8zcCRuHstIysc8LgwWyqiPfmNOknfMaNxUmxh9JpTEY8YG4T64PGhFFoS
         qkkZIvWZRzBTxxHXwHFVTZHgzKRwg+3rSpSYBbq/XfXX6KYevvIveetL9QhIa2XuWfw3
         /BKivrNFEokroQie6VkSis6/zq/oEwWw18PK5/BaQEoVuwf1hnoWVOwcmDvMokkhXv8f
         ot4g==
X-Gm-Message-State: AOAM5325hf3puxa/zeVmImam8efQe4zUh0TfDg3xfLK2U7Qn7tQo83sz
        7747f/1wMvtGxYPfGX8RfYLp0Q==
X-Google-Smtp-Source: ABdhPJwQBA62BC1JDoKKjsnxzLxqta2h0Q67KXB3cckwVwqmI+n9lzcnQmGAufYFyAfGIj1agID3fw==
X-Received: by 2002:aca:ad45:: with SMTP id w66mr179140oie.148.1634750018708;
        Wed, 20 Oct 2021 10:13:38 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id l9sm544966oie.15.2021.10.20.10.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 10:13:38 -0700 (PDT)
Message-ID: <19359125-16fa-f9e0-1450-b0e9181064e1@kali.org>
Date:   Wed, 20 Oct 2021 12:13:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: enable second wifi
 channel
Content-Language: en-US
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20211020163557.291803-1-caleb@connolly.tech>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211020163557.291803-1-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Caleb,

On 10/20/21 11:36 AM, Caleb Connolly wrote:
> Like the c630, the OnePlus 6 is also capable of using both antenna
> channels for 2.4 and 5ghz wifi, however unlike the c630 only the first
> channel is used for bluetooth.
>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index d4355522374a..8bf2430a3af7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -248,6 +248,12 @@ vreg_l20a_2p95: ldo20 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>
> +		vreg_l23a_3p3: ldo23 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>   		vdda_qusb_hs0_3p1:
>   		vreg_l24a_3p075: ldo24 {
>   			regulator-min-microvolt = <3088000>;
> @@ -647,6 +653,7 @@ &wifi {
>   	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>   	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
>   	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
>
>   	qcom,snoc-host-cap-8bit-quirk;
>   };
> --
> 2.33.1
>
>
Just for the record, I added it for completeness, as far as I can tell, 
the bluetooth driver itself won't use the second channel.


-- steev

