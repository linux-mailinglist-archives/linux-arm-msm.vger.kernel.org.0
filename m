Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9782A53F153
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 23:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbiFFVDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 17:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbiFFVDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 17:03:06 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0DE275DB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 13:52:58 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id r206so21300082oib.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qWLu0CGS3iy/7eiKhm2guxzvJONBYd1dV/WdYo5dJpE=;
        b=i/mVanbw0l1c5Plh1b8EGgefhDVl6cQ8HOGlffP/jC1czKVR20tOIn2UrYsnJEdqcf
         Jb5sI1Q9mJx8bXj88OkW8Wy2toEebeg/etBFTSsJ2OHh9ZY6I5sELyEdxGANZeUZ9SPu
         EPmebXBDsg8WhUHOXoaeWxK0rntJlyenlWcsVB983xCePzDgLkTh8XyYU20E5Il71Kcm
         MNgvRCzMrkEr/sZ0D4jLw5Cvy1UxgayY2+KaEDe/169mepptXHXDmGlWmyil/z5AVBH0
         dvs7nZ4lbebX4cNH/KrZPewyFwXmPieFfWAhzmSDR6tCRAb7+jQVB1x9wtN718eoDgBG
         wCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qWLu0CGS3iy/7eiKhm2guxzvJONBYd1dV/WdYo5dJpE=;
        b=vZach9mhBL8r+v/YfnWq+Gyise5QcKYTi7nvjk92nygoIyzMbeeyrNcx9psurjNjPP
         BApYwfHdxdaYitWTDV3Q0osYXCoIbAqpp73d+NSpbNIUwDzIFumLLmqJ1Jn+PA+bstQj
         4FjZcL5wf6ESkRl8SphN79ClYzVp6uAbvVZ1eZvypgrxiK+qYp33yG/hGAX8E5cAJJQP
         SWvwVKIJxFoP1Egf7qbYpxbKkDmDVLoCACaDOd27b/TmQ0MmsxqsvAsihXRQd+czHn9i
         PIRFQ5CTsnKwrpIEoCDW13wXyK+0cixXQYLZqMzuKurCp65raAj0GvUdGC1SvABhodGx
         ZvGQ==
X-Gm-Message-State: AOAM532txWceJIBSPUb4yGDYLq/2FYP/Q8KgauzMSxiVqwEQqjEnq7o4
        TfNC6o8WIDTcB2vHOiiHsNTiCA==
X-Google-Smtp-Source: ABdhPJzL4s6TLZ9AhDazX7Tvme0iMN+u41SxUQJIUaUD7bX/YsUYtr7jQajm3VydOPSIo14SAhbcDg==
X-Received: by 2002:a05:6808:1703:b0:2f9:cd2d:41c5 with SMTP id bc3-20020a056808170300b002f9cd2d41c5mr31957591oib.77.1654548777755;
        Mon, 06 Jun 2022 13:52:57 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r25-20020a4a7019000000b0041b768b58basm2522657ooc.22.2022.06.06.13.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:52:57 -0700 (PDT)
Date:   Mon, 6 Jun 2022 13:55:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v3 02/30] phy: qcom-qmp-combo: drop all non-combo
 compatibles support
Message-ID: <Yp5puQCGOVXN9G8p@ripper>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
 <20220602070909.1666068-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602070909.1666068-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Jun 00:08 PDT 2022, Dmitry Baryshkov wrote:
> -MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
> -
>  static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
>  	{
>  		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
> @@ -6175,6 +2594,7 @@ static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);

You forgot to update this to qcom_qmp_combo_phy_of_match_table, then in
the later patch where you update the prefix you're making it
qcom_qmp_combo_phy_of_match_table (combo_phy vs phy_combo).

Regards,
Bjorn
