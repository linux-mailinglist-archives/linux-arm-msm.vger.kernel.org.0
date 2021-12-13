Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF9A4737E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 23:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243854AbhLMWrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 17:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243846AbhLMWrs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 17:47:48 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53C1C061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:47:47 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso19014793otf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5H0qbzaIjgpKRl661XZSUbngEcJPf590BIus7cp6ncA=;
        b=R8VoYyyDTSEuy9f0P5FaPR1C53Xu7aozxo+dMc2TKIiQHU8WDK78rkYLFGz2W9PvW7
         Rc6ms+egFX7SkYxyk7zzCTGkoqVk2nv4iJcBSAVQj1h8PBYGZW8JwRQJdKGgD8Phe932
         KV+utJuCmcnQ+tcsjSsktrHTtmEtTFAqyiYB9vzPdDOXCru6cQ6mPlh836V1XKUKnDqh
         SWcROoMM2fPmQt51gazWdN+qK6SYOMXNj+hYfjdhxrdV+6XREu1aVl6wOX68d3Yj2D4L
         +b1zOkEAWEoX/dF7bR6efzQ6uCVkvOcDlAzh8/KQIUx1KIdaiFUSMNQm3qSSXPga45Nr
         p1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5H0qbzaIjgpKRl661XZSUbngEcJPf590BIus7cp6ncA=;
        b=b5BlXstFzZnJ/3ZUBSd2aiNQux9pGX0Qy5kP1lZHsZ6nnc+Bv2UHUrPftAkzVL5eE6
         8JcUj2C4wb4ITD2RQZOVkvRld1+bXi16YJ9D/6bd6k91rYfrK5krp8d/Ivkj1CASSgXE
         gMPJSh4HVNYvaKvOjXCFX6JxZnsMQH3Zh3g1wNY+JHKLPunwsD/dBlGsCOaokWXm1pmK
         LhOSQuFmAVrYB1IG4bi017/INSM8vARYujw8ytmzMWNrHq2orYoWcg2ZscKwgYZYrJqR
         /TVLA3RKnAHXH56d4vUrxuF88zVcyrQeBd3YuJi2+ht4F5ZXdFE8nuAy9kIsD1xhFxec
         j+cQ==
X-Gm-Message-State: AOAM532iufETyg/jXjBrBFmRc3h3H4FfH72ibxunw4qWsbaZaFGe7tdU
        lSJzzrNQ4ClqudZvzcUgaAK1UA==
X-Google-Smtp-Source: ABdhPJxwfsPGVsS6Hn+ISBirM7ASf+Uy53iWfLYPVPoMDB+x0HE6I2kdL1NxQdLYbPLt8fOLBERuOw==
X-Received: by 2002:a9d:6254:: with SMTP id i20mr1172374otk.343.1639435667299;
        Mon, 13 Dec 2021 14:47:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm2473150oth.81.2021.12.13.14.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 14:47:46 -0800 (PST)
Date:   Mon, 13 Dec 2021 16:47:42 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom-qmp: Add SM8450 USB QMP PHYs
Message-ID: <YbfNji+glICLDy76@builder.lan>
References: <20211213131450.535775-1-vkoul@kernel.org>
 <20211213131450.535775-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213131450.535775-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 13 Dec 07:14 CST 2021, Vinod Koul wrote:

> Add support for the USB DP & UNI PHYs found on SM8450. This is same as
> the phy version used on SM8350 and sequences turned out to be same, so
> use the same table from SM8350 for this as well.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index a959c97a699f..13a249ec8ab6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -5777,6 +5777,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sm8450-qmp-ufs-phy",
>  		.data = &sm8450_ufsphy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8450-qmp-usb3-phy",
> +		.data = &sm8350_usb3phy_cfg,
>  	}, {
>  		.compatible = "qcom,qcm2290-qmp-usb3-phy",
>  		.data = &qcm2290_usb3phy_cfg,
> -- 
> 2.31.1
> 
