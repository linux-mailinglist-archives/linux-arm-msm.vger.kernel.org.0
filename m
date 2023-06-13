Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBDED72EAA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 20:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjFMSQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 14:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbjFMSQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 14:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5B71B2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 11:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686680120;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VMh4CxAaufkupFiXeG/ZZJofgO1Xkx5kTIdymBHMvlM=;
        b=Dx26mdI7/HwqhbIoaX8DoVHra1vjvq07VIPXmdV+YyUR51AGKaoyr10Z8BCQoJ/moZFLNx
        AepQnRjdx+7l7SiTEVD/od9uV+PWslPgHqoX6tCifB/a93xd3HIi1NCisjGvJe+hPO37Di
        bcUToM7D/GD2Txgq01nc4LlwgEm8bIY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-l80tiNxOOl2FkCbieHxbOw-1; Tue, 13 Jun 2023 14:15:17 -0400
X-MC-Unique: l80tiNxOOl2FkCbieHxbOw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-75d53bab5a9so181675385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 11:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686680112; x=1689272112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMh4CxAaufkupFiXeG/ZZJofgO1Xkx5kTIdymBHMvlM=;
        b=O5RBZgLP9nxYMoCutYf5+4g08mh1HvcwVzyHEVofAiEM910RcWCB7ZVaU0FTNvE7am
         Yqjky4SZ98sSYfuj519Qlv6OPBGxUI2okY5K5hueQK95viG/f1mSfaAf+NrtEemnAFDE
         GjMwl9WZwf5FkehYwE1sGFKWc1Hx+ixFDVMoAfNKjaz56IdBe030quB8yDnkx0j913EC
         IxciGLex69xO0bjhxGss/Gn/cjbCbH/ICB1NP5iz7lc0hkXJLZ5VZsRCR1KcfOlAv2WU
         +nbo9harwrvklOdouuafYz2OgPyQauU9iqY/gT/w97QVdKB/s3zjNuwAgXM1dxlSwSHM
         eTfA==
X-Gm-Message-State: AC+VfDx1nJxfRMGMUWeYBNBTwzWmZLXzSq8UiqN5WfHe9JFOp1Xgtz+D
        RkKImHccmZ1JJ530AzP3xYHhY6zLpY3scxx0nU0UU56676w+Y1SZ3MXKeiq3mAzcNc3fuXCr8nr
        RzAkJP1ymc3b2YnrhvY74IlOZZA==
X-Received: by 2002:a05:620a:2791:b0:75d:5321:fa40 with SMTP id g17-20020a05620a279100b0075d5321fa40mr13049276qkp.51.1686680111981;
        Tue, 13 Jun 2023 11:15:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FXQa4iGHaVb03aNKzDgMsYAUueUgnaSI5oJJ062Y4f4KWKzeuDuU7svTdTOE4LRqmwuYETA==
X-Received: by 2002:a05:620a:2791:b0:75d:5321:fa40 with SMTP id g17-20020a05620a279100b0075d5321fa40mr13049260qkp.51.1686680111740;
        Tue, 13 Jun 2023 11:15:11 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id w10-20020ae9e50a000000b0075941df3365sm3726463qkf.52.2023.06.13.11.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 11:15:11 -0700 (PDT)
Date:   Tue, 13 Jun 2023 14:15:09 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Philipp Zabel <pza@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Clock fixes for qcom-snps-femto-v2 PHY driver
Message-ID: <ZIiyLffCbVklU7YV@fedora>
References: <20230605184455.34832-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605184455.34832-1-athierry@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 05, 2023 at 02:44:52PM -0400, Adrien Thierry wrote:
> This series contains a few clock fixes for the qcom-snps-femto-v2 driver:
> - make sure ref_clk is properly enabled
> - add system sleep PM ops to disable the clocks on system suspend
> 
> v1 -> v2
> - keep cfg_ahb clock and use clk_bulk API to handle both cfg_ahb and ref
>   clocks (Bjorn Andersson)
> - add system sleep PM callbacks (Bjorn Andersson)
> - add Link: and Fixes: tag (Andrew Halaney)
> 
> Adrien Thierry (2):
>   phy: qcom-snps-femto-v2: properly enable ref clock
>   phy: qcom-snps-femto-v2: add system sleep PM ops
> 
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 85 +++++++++++++------
>  1 file changed, 59 insertions(+), 26 deletions(-)
> 
> -- 
> 2.40.1
>

Gentle ping Bjorn, is there anything you'd like me to change in a next
revision?

Best,
Adrien

