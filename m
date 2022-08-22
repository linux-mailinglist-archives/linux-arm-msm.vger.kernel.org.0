Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91E659C8ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 21:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238526AbiHVTcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 15:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238637AbiHVTcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 15:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AF8FF6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661196719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=utqk4gGdKcZK/drHg6MTAGb5WN+LseARDrrEG5K9cnM=;
        b=Ojxo+/7APGT+WqTk2/v1fBTlZFXzn+za8RgKrXzYIzBdwc1F6q1lNSCpnLPPY6JluYtTti
        GsSffxtVFyqiHklqG4tIjZf+4Vevlhro3CEagTieFQaKY2/84bPvnCNZi7ii3L8tIhjVBk
        T33iJZY5tXbOORkJel+hLzFoZZTRppM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-IgsSmdjIPe-_vrmodiXuHw-1; Mon, 22 Aug 2022 15:31:58 -0400
X-MC-Unique: IgsSmdjIPe-_vrmodiXuHw-1
Received: by mail-qv1-f71.google.com with SMTP id lj8-20020a0562145c8800b00496ceb190d4so2924420qvb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 12:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=utqk4gGdKcZK/drHg6MTAGb5WN+LseARDrrEG5K9cnM=;
        b=IctYwgSvkLXraefjSfdxPeASa5lwKePypS8PxdayWea+gZaeZCc039IjNZ41o2RjsI
         gqyug8E0IZ79+qHxfFoSMxYW5LVlhQSufoRxzybzyUV8q2wXCXrb//6IqoW93mlzY6yB
         Xw5YwwfaCquvXvxMPjAFc1fK5q5PnI9u3+mRdU2zDjOWHgqzypLheNttBnD8hkIcxMoV
         iec4a425qYS6Et6u2JirgtPjH+krMLfEu80AeppJakQ/OLWAUR83F4cTkKohutg4Z5Rf
         ThUh2A+iJAJz3Ee7Xn9+wWF+q3CXjIxIVHonusPXHELi0hL4CojPkiOQ/mB1WrOkvJ1b
         MJXg==
X-Gm-Message-State: ACgBeo3+XqaeYX6ewO5S+tmaMEZp/EJU5UcGRgDwBCV9f+V+byj5Xc5L
        obCDertmL2YhIAD00Ov3kZnW+MshVijschh2Ww95oAwtDzM33OyAQ62p+/Nw0RRhAZ2yofQZttk
        WAzhrEs8S7JCnmJbD2CZ/JnOstg==
X-Received: by 2002:a05:622a:305:b0:343:5601:d5c4 with SMTP id q5-20020a05622a030500b003435601d5c4mr16528079qtw.130.1661196717024;
        Mon, 22 Aug 2022 12:31:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR441WFZIaGxDI+4zPBbssWNE0YoiTVFjzUV3VHBaToaw8eVr5H6qKHK6x7f90HpAGAAzo/2IA==
X-Received: by 2002:a05:622a:305:b0:343:5601:d5c4 with SMTP id q5-20020a05622a030500b003435601d5c4mr16528055qtw.130.1661196716788;
        Mon, 22 Aug 2022 12:31:56 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id y16-20020ac85f50000000b0031ecddf2278sm10252393qta.37.2022.08.22.12.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 12:31:56 -0700 (PDT)
Date:   Mon, 22 Aug 2022 14:31:53 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Implement get_optimum_mode(), not
 set_load()
Message-ID: <20220822193153.zn2oxljmd76awqot@halaneylaptop>
References: <20220726102024.1.Icc838fe7bf0ef54a014ab2fee8af311654f5342a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726102024.1.Icc838fe7bf0ef54a014ab2fee8af311654f5342a@changeid>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Douglas,

On Tue, Jul 26, 2022 at 10:20:29AM -0700, Douglas Anderson wrote:
> Since we don't actually pass the load to the firmware, switch to using
> get_optimum_mode() instead of open-coding it.
> 
> This is intended to have no effect other than cleanup.

I hate to post something without looking into it very deeply, but with
this statement about no effect I figured I'd report what I'm noticing
before diving deeper.

I'm currently playing with the dts patches in [0], and without this
patch (and a hack patch applied that is unrelated to this) the board boots
fine. With this patch applied I get the messages reported in [1] (which I
think is still a clean up that should be applied) and the board fails to
boot due to regulator_enable() failing at the first invocation I see.

Is that something you expect?

Here's the ultimate failure message for regulator_enable():

    [    1.213419] ufshcd-qcom 1d84000.ufs: Adding to iommu group 0
    [    1.219492] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
    [    1.230287] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
    [    1.241079] vreg_l17c: invalid input voltage found
    [    1.246002] ufshcd-qcom 1d84000.ufs: ufshcd_enable_vreg: vcc enable failed, err=-22
    [    1.253952] ufshcd-qcom 1d84000.ufs: Initialization failed
    [    1.259622] ufshcd-qcom 1d84000.ufs: ufshcd_pltfrm_init() failed -22
    [    1.266151] ufshcd-qcom: probe of 1d84000.ufs failed with error -22

[0] https://lore.kernel.org/all/20220722143711.17563-1-quic_ppareek@quicinc.com/
[1] https://lore.kernel.org/all/166118500944.215002.10320899094541954077.b4-ty@kernel.org/

Thanks,
Andrew

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/regulator/qcom-rpmh-regulator.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 561de6b2e6e3..b2debde79361 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -306,9 +306,10 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
>  }
>  
>  /**
> - * rpmh_regulator_vrm_set_load() - set the regulator mode based upon the load
> - *		current requested
> + * rpmh_regulator_vrm_get_optimum_mode() - get the mode based on the  load
>   * @rdev:		Regulator device pointer for the rpmh-regulator
> + * @input_uV:		Input voltage
> + * @output_uV:		Output voltage
>   * @load_uA:		Aggregated load current in microamps
>   *
>   * This function is used in the regulator_ops for VRM type RPMh regulator
> @@ -316,17 +317,15 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
>   *
>   * Return: 0 on success, errno on failure
>   */
> -static int rpmh_regulator_vrm_set_load(struct regulator_dev *rdev, int load_uA)
> +static unsigned int rpmh_regulator_vrm_get_optimum_mode(
> +	struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
>  {
>  	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> -	unsigned int mode;
>  
>  	if (load_uA >= vreg->hw_data->hpm_min_load_uA)
> -		mode = REGULATOR_MODE_NORMAL;
> +		return REGULATOR_MODE_NORMAL;
>  	else
> -		mode = REGULATOR_MODE_IDLE;
> -
> -	return rpmh_regulator_vrm_set_mode(rdev, mode);
> +		return REGULATOR_MODE_IDLE;
>  }
>  
>  static int rpmh_regulator_vrm_set_bypass(struct regulator_dev *rdev,
> @@ -375,7 +374,7 @@ static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
>  	.list_voltage		= regulator_list_voltage_linear_range,
>  	.set_mode		= rpmh_regulator_vrm_set_mode,
>  	.get_mode		= rpmh_regulator_vrm_get_mode,
> -	.set_load		= rpmh_regulator_vrm_set_load,
> +	.get_optimum_mode	= rpmh_regulator_vrm_get_optimum_mode,
>  };
>  
>  static const struct regulator_ops rpmh_regulator_vrm_bypass_ops = {
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 

