Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802F85E653C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 16:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiIVO0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 10:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiIVO0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 10:26:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D118AF370D
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663856787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mjiuZQ0Gls4tS1X0fH0O8+pLbJc5fMhzaA0TsxRHJvA=;
        b=hLAtAly8DpuH7kYr5cnTH8xGs4eIqpaaOj2KcrBcl/DfZ1NtnKbKRJnW3nKGIuGqw5a9Jl
        GOb7Du5RXZ4Vzulz6WjNHBAgS4dDJjhBgpsae4jhs2ft9uuErWUGneUPUbj6q0B8G04i82
        8qRhPDRqI1f1GjJxK/CxKe0jANEwqK8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-h995SfreMfG6DL29S-j41w-1; Thu, 22 Sep 2022 10:26:25 -0400
X-MC-Unique: h995SfreMfG6DL29S-j41w-1
Received: by mail-qk1-f197.google.com with SMTP id n15-20020a05620a294f00b006b5768a0ed0so6671863qkp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=mjiuZQ0Gls4tS1X0fH0O8+pLbJc5fMhzaA0TsxRHJvA=;
        b=UA48cS1Fkug8CipQzJPp0NxDrUgUNufyjuJKWF1Aoy2Fo7cC5yLYsrW4HtKcrEN/2Y
         Cq9h3Nfru6D2PgEe87rCtFM8uyxB0r44v7Qli49O7gxuEEUrs6Opd/9cLd7VpXpK/tct
         b2nX6njhHgn8pVQPsviBNSTOOtQEv72mlMCv0Xs0JedfKI3z4xrsFBxPDOP6ptPCLD5K
         wCoetk5Q2YkCmr5QiibsaL9sIw2YQTUzqaMx6ens/ChMz3VZbm2rIKHSmuS8/XNmJWKG
         PrjHJ2a5yVB4ZvDVAjSdiFgxX5fBdXH/W1nrhRH2ENcqvNcs1g+LLQMeYvqAJuSIH5tb
         ez+Q==
X-Gm-Message-State: ACrzQf1ekC06TraBCPjpveAiZPshcn6Q2XU0FmV5HpMtRCiKEVioFE2e
        EhTw6ynQuIfsBWIRQ4ZDkpnp+gHkU3j9bBU2RZ/ZiTdsnKwWFp6vyPB1cQK4z0723mtvs1AKvV4
        mz08QBIKasf1HV2WtLE+FzU/jLw==
X-Received: by 2002:a05:622a:3cc:b0:35d:b72:76b1 with SMTP id k12-20020a05622a03cc00b0035d0b7276b1mr3016651qtx.516.1663856785366;
        Thu, 22 Sep 2022 07:26:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69czvr9D1VPTKWRVdwkAL/E0kx3wlxWPZm45/1yKoFgboEIjpjN8xGfZnE5xyBwUIAaMrBoA==
X-Received: by 2002:a05:622a:3cc:b0:35d:b72:76b1 with SMTP id k12-20020a05622a03cc00b0035d0b7276b1mr3016636qtx.516.1663856785167;
        Thu, 22 Sep 2022 07:26:25 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::46])
        by smtp.gmail.com with ESMTPSA id u15-20020a05620a0c4f00b006cf19068261sm4159880qki.116.2022.09.22.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 07:26:24 -0700 (PDT)
Date:   Thu, 22 Sep 2022 09:26:22 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Yuan Can <yuancan@huawei.com>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, kishon@ti.com, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/7] Use dev_err_probe() to simplify code
Message-ID: <20220922142622.uekkiszvgv2lfrux@halaneylaptop>
References: <20220922111228.36355-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922111228.36355-1-yuancan@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 22, 2022 at 11:12:21AM +0000, Yuan Can wrote:
> This series simplify the error handling in probe function by
> switching from dev_err() to dev_err_probe().
> 
> Yuan Can (7):
>   phy: qcom-qmp-combo: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-pcie-msm8996: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-pcie: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-ufs: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-usb: Use dev_err_probe() to simplify code
>   phy: qcom-qusb2: Use dev_err_probe() to simplify code
>   phy: qcom-snps: Use dev_err_probe() to simplify code
> 
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 21 +++++----------
>  .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  9 +++----
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  9 +++----
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  9 +++----
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  9 +++----
>  drivers/phy/qualcomm/phy-qcom-qusb2.c         | 27 +++++++------------
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 +++++--------
>  7 files changed, 34 insertions(+), 68 deletions(-)
> 
> -- 
> 2.17.1
> 

The whole series looks good to me:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

