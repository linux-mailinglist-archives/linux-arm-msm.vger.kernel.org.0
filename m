Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64EBB53E763
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 19:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239286AbiFFNw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 09:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239419AbiFFNv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 09:51:56 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8B5B4A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 06:51:55 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id j17-20020a9d7391000000b0060bf94c4a64so2287040otk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=APhT/i13/d2E2pyeF6wRIrnq7vHDbvBVvFgrsc5P60A=;
        b=SjiXmoRMwENXFqucwGZA2phOPlKg22GjzUGv7SRumNIIskOY//r0VzeohvwPO0mNQ5
         t33XgezWAYqHDNoJSQCP6tHvRzVVzYuLfzPEuBSBhrirX4eQ8osB3MkUwSbadLsiPazH
         iPNNW9VfgiQ6r/nVgMp5frKsx8L3ffuV7Y9BXQvZMJn03tCtKyGgOBKaswkEdFAROPQG
         taQv8wqd93GGRPWEoJT46Id/+jxSLfWIbVYlCmjm3iWb/20Xp/7n8zH20H5mXz1UJi3z
         lV/ZhN8Cgg/MT4WtwUWHc+5qmYQco9jhDOGdtpW5s12E8aWOeNPakavcBJXkQ/OPsBb8
         ZWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=APhT/i13/d2E2pyeF6wRIrnq7vHDbvBVvFgrsc5P60A=;
        b=Q8CZeMPhX3o3nHvNbqg5RObSK+lPWcXqCTYI4Ocn//weDyI/sWgQQR2f4KpUwW6YaF
         wYI5vU5zINjVp+0/XvmZ1ua9exdNMuYeN+kpOSGLvxUZ38uqdxspq2WPq6HgtgYhgUim
         6M8fjT7UgYMo9ClZoM0Sj9hYU/w9YoFcmL16D91E5CuKREAMIaua92IevwWfZqXDwhZ4
         A6KFZsiSZGacusn6uK3GJthgWlhE6bTrPRQ5AhIjLmyejfa5CLjxxG+4qFInCzRKI1g7
         td//LAW39++CAxxXH/IuJ+4A4C4jNtZGZp7lxuU+vzqHcyORn00NBTQ2blEMTIP9ZAae
         jjMg==
X-Gm-Message-State: AOAM533jtDwjedfSCf3bwK6EMiyOWA+4/jMV5iAASLf4vB1mb6dZM9Rw
        rNqHU9omF1Iu1colJpxLvSrmbD8vDMQXGw==
X-Google-Smtp-Source: ABdhPJybm2N3qf8bwApBV2m3nAUeVpFq6B01YXCvkRwanrQ4T6dQmNb+nvUPSPkYRk8iUOAh1/fylg==
X-Received: by 2002:a05:6830:2807:b0:60b:e6b8:d804 with SMTP id w7-20020a056830280700b0060be6b8d804mr5419300otu.138.1654523515103;
        Mon, 06 Jun 2022 06:51:55 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e28-20020a544f1c000000b0032c18f04800sm8491038oiy.1.2022.06.06.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:51:54 -0700 (PDT)
Date:   Mon, 6 Jun 2022 06:54:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v3 02/30] phy: qcom-qmp-combo: drop all non-combo
 compatibles support
Message-ID: <Yp4HDG4Bus1FOHId@ripper>
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
> -static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
[..]
> -	}, {
> -		.compatible = "qcom,sdm845-qmp-usb3-phy",

We have a few examples of these, where we have a compatible for the
USB-half of the combo PHY. For backwards compatibility I think we would
want to retain these, but if we move them to the UNI phy driver wouldn't
we end up with duplicate USB configuration tables between the two files?

Should we keep the combo instances here as well?

Regards,
Bjorn

> -		.data = &qmp_v3_usb3phy_cfg,
> -	}, {
