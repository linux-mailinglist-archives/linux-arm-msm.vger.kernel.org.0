Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0334B1A90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 01:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346440AbiBKAjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 19:39:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346419AbiBKAjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 19:39:23 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EF95F85
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 16:39:21 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id u13so7899558oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 16:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rw+VMRXRUIyN9bF2/fBVa49N7kaF4tRFWJnCSrzk2zU=;
        b=o686K0dnNs/4K4igN49JLtIdabbs0iDVtN8mKYgzWwa1omAktAYG74Uqne79/xcitc
         A+NBL/bXZnnFt0TS3SkYxrxFxYfIqJvw8o7JP6iJ9PPRJJRQXzlqOfcn3beWA3IUISvd
         gzq2EMCP4L6SqhZGN3gISzcadXQop0MIHY9Yj5D9SjVcnPsJBw+OHKm+Rz0wmLO+/vWo
         z/hYYrL8b4Z9sHQ8LDzEmf0el+NtOyKeCdb+IpxrA0gTjo3DcfTMyB3EFBU01brqETMd
         lJcTSWIRdC6lYBHxOTZIb85ZoE9oYGMQjk6l/DdTh02ck4hT0Z3fif0jH95Si7db14mn
         GFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rw+VMRXRUIyN9bF2/fBVa49N7kaF4tRFWJnCSrzk2zU=;
        b=bL0hTp3+qNBqunAi2QexL3XTWRXWIX7nkj3nMj4dKoAi4rSlHTCP8vuICaE9DNDW7v
         znujkv2QtPnLQ61znYGmM9eLg5MsbVu3iyJ1MQy5i3aqnfk31vLVFrL990trLrOe79sO
         X9SMdl6XhyCDQRGIRI8ixz1b6LjycTpdF0Vy7lZQtqr4KH2bxyYpdJdXzh19XY7p/OLJ
         Uh9heDMdflfSMcFZ/4o6vmZ2wex8GJ0R5H1TghCh/oTczFMbuhbscy3jLQtycGGunS97
         bG1E3rasbQn7/XooZNRv0hfAFd3GPYWiloHMnoHkwNStuFQ032nC5/p1d2cs4GnAFyhp
         MVuQ==
X-Gm-Message-State: AOAM533JtUvKqJiyQLudkFIF3Y7/6jo18D6iR9DpUI83ZHhqLBn6e+HQ
        Nyhjm8smSqAjrx5J+1vqUvdEnA==
X-Google-Smtp-Source: ABdhPJxlUSCZBHWuEgaZh+RQGoqoZLfLJqg6+11ciAbqbNDR4kjCc+y/5UG4wCcE0o6ZCt+xFGiGyQ==
X-Received: by 2002:a05:6808:30a0:: with SMTP id bl32mr16087oib.262.1644539960585;
        Thu, 10 Feb 2022 16:39:20 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id m5sm8497035otk.78.2022.02.10.16.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 16:39:20 -0800 (PST)
Date:   Thu, 10 Feb 2022 18:39:18 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Teja Aluvala <quic_saluvala@quicinc.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        quic_hemantg@quicinc.com, linux-arm-msm@vger.kernel.org,
        quic_bgodavar@quicinc.com, quic_rjliao@quicinc.com,
        quic_hbandi@quicinc.com, abhishekpandit@chromium.org,
        mcchou@chromium.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: setting the vddio supply
 for Bluetooth node on CRD
Message-ID: <YgWwNiLDCZ0jEV30@builder.lan>
References: <1644318803-14950-1-git-send-email-quic_saluvala@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644318803-14950-1-git-send-email-quic_saluvala@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Feb 05:13 CST 2022, Sai Teja Aluvala wrote:

> setting the vddio supply for Bluetooth SoC WCN6750 node
> on SC7280 crd board
> 

While this does better describe what the change does, as Matthias
requested on v1, it fails to provide any information about why this
done.

Is vddio simply not powered on the IDP? Or did someone forget to add it
to the idp.dtsi?

Regards,
Bjorn

> Signed-off-by: Sai Teja Aluvala <quic_saluvala@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index cd2755c..53ea3b4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -23,6 +23,10 @@
>  	};
>  };
>  
> +&bluetooth {
> +	vddio-supply = <&vreg_l18b_1p8>;
> +};
> +
>  ap_tp_i2c: &i2c0 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
> 
