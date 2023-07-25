Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104E97624D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 23:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjGYVvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 17:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjGYVvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 17:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBE82126
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690321854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Melm6/J1BB5km5pizgjvl9Yb8xIN/1Veuqiikhv3KRo=;
        b=EmZ4uDqezYqZCmUJozcqVQZCLAZnNsK3LRMK0hRDqVcN5AcZwp4IuYT6t3A+K4V+7nypSs
        hk47kl4z+PEgwq7+rqkqy77H4I+0vb+/aAKUxQmPvacc323UbdBqX643FmYMeg6LVCqGbZ
        Fe/1BLwffgyCl46fmC7JlcmhviU3iSQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-M_i_Rc66P3iUk8gDy1NPVA-1; Tue, 25 Jul 2023 17:50:53 -0400
X-MC-Unique: M_i_Rc66P3iUk8gDy1NPVA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7656c94fc4eso810652585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690321852; x=1690926652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Melm6/J1BB5km5pizgjvl9Yb8xIN/1Veuqiikhv3KRo=;
        b=M12NtDJoF/m0bzXWcb5s9B5TS0QEUYOt9DWoIO71yJcnD9Nmtt2RVoNGykzt9V7MRT
         qfZLtYZ/t2arptflZnOfCjppKVlgQkdf9hYjlchAXrdGzec4SuR0Nr8XVH1TSCour8d9
         jIH3dNpY03oPz2xVw6iirq45d1k56me22fjRrpaQQIRDiVF+QdJmXbCEM6bQaf2iwqec
         lco1zu7NmIzPl710xJaQOYY8HnfdNVex2UiuyEaIfIB0BO+KTZu4cWMdTWRXbQEX3W9l
         5XGRojFOvy4cEsSUkvzfy+jmbmdp4Liy1NiWH1vnL1BgqGQjVkkdm2CKnOw3HFqpRhna
         o+kw==
X-Gm-Message-State: ABy/qLZSv7vJcVlREUsmCGJKSIJN1M8neSZRgVHd7sQPYsxza17LBcVT
        nZZ2GCjykfA5wlBzcbW41SMufsdk1lf/EyBCADGd8TBLawBskgllwVkUrGVkT2bm17vE4oTfN1K
        MjuzJASldnf54Dden3a42k5ykLb+wl4zJQA==
X-Received: by 2002:a37:9387:0:b0:768:75c:a323 with SMTP id v129-20020a379387000000b00768075ca323mr189184qkd.30.1690321852560;
        Tue, 25 Jul 2023 14:50:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGuBc9mQtcoAYsLLrcNS6U1ILe3WgtPfau5n+XH3C2PfNIkwun1XLJekdm58rMjVAJD2sduAg==
X-Received: by 2002:a37:9387:0:b0:768:75c:a323 with SMTP id v129-20020a379387000000b00768075ca323mr189174qkd.30.1690321852320;
        Tue, 25 Jul 2023 14:50:52 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id q29-20020a05620a039d00b00767177a5bebsm3909301qkm.56.2023.07.25.14.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 14:50:51 -0700 (PDT)
Date:   Tue, 25 Jul 2023 16:50:49 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Cc:     quic_nitirawa@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] arm64: dts: qcom: sa8775p-ride: Remove min and max
 voltages for L8A
Message-ID: <a3l7356miuuapf5dakgfchdjmxjp62ynvle4ta3hejd3tjvzd4@e2t2zm6jh7hb>
References: <20230725100007.14775-1-quic_narepall@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725100007.14775-1-quic_narepall@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 25, 2023 at 03:30:07PM +0530, Naveen Kumar Goud Arepalli wrote:
> L8A is the supply for UFS VCC, UFS specification allows different VCC
> configurations for UFS devices.
> -UFS 2.x devices: 2.70V - 3.60V
> -UFS 3.x devices: 2.40V - 2.70V
> 
> As sa8775p-ride supports both ufs 2.x and ufs 3.x devices, remove min/max
> voltages for L8A regulator. Initial voltage of L8A will be set to 2.504v
> or 2.952v during PON depending on the UFS device type. On sa8775, UFS is
> the only client in Linux for L8A and this regulator will be voted only
> for enabling/disabling.
> 
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index ed76680410b4..6f3891a09e59 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -98,8 +98,6 @@
>  
>  		vreg_l8a: ldo8 {
>  			regulator-name = "vreg_l8a";
> -			regulator-min-microvolt = <2504000>;
> -			regulator-max-microvolt = <3300000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
>  			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -- 
> 2.17.1
> 

Reviewing with very little expertise in the area....
A few questions below that would help me understand this a bit better.

Does it make sense to *not* set the range of the regulator at all?:

    1. A board dts knows its UFS device
    2. Is UFS backwards compatible with respect to UFS2/UFS3?
       I don't know how the version is determined, but if it's a
       "start at UFS2, go to UFS3" should it be scaled as that goes?

Relying on the bootloader to set up the device before the kernel starts
seems like a direction that should be actively avoided instead of
depended on in my opinion.

Thanks,
Andrew

