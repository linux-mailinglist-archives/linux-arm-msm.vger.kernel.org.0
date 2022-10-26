Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 005C260E8D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 21:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbiJZTPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 15:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbiJZTOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 15:14:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D556264BC
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666811611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TcwkxX7f9akzTpXldeCvOVlbHPDFS3e55cTn/Ew1HBQ=;
        b=el0+FRtPphhrZlg1WNJobZsFCGHaoWl6GhYr1oKY2sJKx4Blg1KBmFHm4OIlAqzD9n9N36
        11+J95LwnJwY7+7zzA/TFyE2ErwgoBEdaWippMmStrbGjz0i0pViw2TjaMSfdm+JFQQAEN
        o9FfpT5gACI217bLL1hw0q1IEx1/p5I=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-rVgl0O4GPimdAq2HpjMthA-1; Wed, 26 Oct 2022 15:13:30 -0400
X-MC-Unique: rVgl0O4GPimdAq2HpjMthA-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-13b29b8eceaso8740869fac.20
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcwkxX7f9akzTpXldeCvOVlbHPDFS3e55cTn/Ew1HBQ=;
        b=NS8HueUo5ih3ip4u8if0ZC754rSqblKmXVBrtYbXap8p+RoQxAt28DRvLCA+Kq+I6f
         bP55mLc+OKY7fLoWr6qR8HmyBxeQi42TKaPnO23SKwZA1D4rGPakx0AtQmcGo5U6tug/
         hOMjO2567CtbXHgSc1aJeuBTd8L6LNk3iIEy3YdTnOMh2Bi04L5rGRJijnkHzj5LKLGw
         rq5einOTqz6dpBSlxO6N3Mt6i+N05GkE1OvOXKYc8aHdO+mqoAoxK7lzOC1dBnLTXadX
         gecrMBGNHsPj/9Kk1YtbI95mbTqei5xgPYayoHSoQIc0ymojrf5lC/4gnh0Z996G20mx
         8mdA==
X-Gm-Message-State: ACrzQf2sf6Vg80e+a5isYMXzSXVXH2WRxFXI4m3rpsFpHTehEPBjRvVQ
        UdjMoUbMmkeqdzCtPglY/d0ZycmR+YKJXrkjKk2xZIyor6lHfmTByiryHu+NFdgNXy02UVAoWkj
        zqrf6W/jqp0dQsTzF7rNRJB06EQ==
X-Received: by 2002:a05:6808:1802:b0:354:b406:540b with SMTP id bh2-20020a056808180200b00354b406540bmr2692773oib.256.1666811607657;
        Wed, 26 Oct 2022 12:13:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51GHRU3SteyubonbaqiEhWoUUnM42aduIw9CPdsyhnz0+5pKAXp58pAeWEh0n/myr6t/6Tvw==
X-Received: by 2002:a05:6808:1802:b0:354:b406:540b with SMTP id bh2-20020a056808180200b00354b406540bmr2692756oib.256.1666811607376;
        Wed, 26 Oct 2022 12:13:27 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id cc14-20020a05683061ce00b00661948e6119sm2568306otb.47.2022.10.26.12.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 12:13:26 -0700 (PDT)
Date:   Wed, 26 Oct 2022 14:13:24 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-combo: fix NULL-deref on runtime resume
Message-ID: <20221026191324.ehk3zarmcboq32zn@halaney-x13s>
References: <20221026162116.26462-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026162116.26462-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 26, 2022 at 06:21:16PM +0200, Johan Hovold wrote:
> Commit fc64623637da ("phy: qcom-qmp-combo,usb: add support for separate
> PCS_USB region") started treating the PCS_USB registers as potentially
> separate from the PCS registers but used the wrong base when no PCS_USB
> offset has been provided.
> 
> Fix the PCS_USB base used at runtime resume to prevent dereferencing a
> NULL pointer on platforms that do not provide a PCS_USB offset (e.g.
> SC7180).
> 
> Fixes: fc64623637da ("phy: qcom-qmp-combo,usb: add support for separate PCS_USB region")
> Cc: stable@vger.kernel.org	# 5.20
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

For what it is worth, I double checked and phy-qcom-qmp-usb.c has this
done properly already.

Thanks,
Andrew

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index f6328434c61e..ad6a0fd7ba8e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2144,7 +2144,7 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_phy *qphy)
>  static void qmp_combo_disable_autonomous_mode(struct qmp_phy *qphy)
>  {
>  	const struct qmp_phy_cfg *cfg = qphy->cfg;
> -	void __iomem *pcs_usb = qphy->pcs_usb ?: qphy->pcs_usb;
> +	void __iomem *pcs_usb = qphy->pcs_usb ?: qphy->pcs;
>  	void __iomem *pcs_misc = qphy->pcs_misc;
>  
>  	/* Disable i/o clamp_n on resume for normal mode */
> -- 
> 2.37.3
> 

