Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7710E526603
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 17:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381962AbiEMPZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 11:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbiEMPZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 11:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD9FC14038
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652455522;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cAlxBgNFMclJEhbPWJP/CPEc9z2rwir5WqoYbHVBM0o=;
        b=BGWwh6/P2TDALlD+NW2TBgpknlZYb6iuaUHWYNKdZXUsSJJ75K5fv0KaUZW3nNho/fGA0J
        g2LTmnEWxH7aqZqt9ahJExcSWd5CsGCTIh6Isp6+kwZ8ekODMwZ3l7o/+p2eNP0D4V0zuh
        Mj6adw9/MJme0R3tS2Kv9dXxNNp/FeI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-w9TvIN1UOVO5KKoa7K5Zfw-1; Fri, 13 May 2022 11:25:21 -0400
X-MC-Unique: w9TvIN1UOVO5KKoa7K5Zfw-1
Received: by mail-qv1-f72.google.com with SMTP id kl11-20020a056214518b00b0045a9af67efbso7065389qvb.18
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 08:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cAlxBgNFMclJEhbPWJP/CPEc9z2rwir5WqoYbHVBM0o=;
        b=q0E5GeLyzEV4jD1rwUV0JokSLi7e/f1EQffg1ljUaIqf9F/E5qik/mGwhsH2/C6+Qh
         VL1DjK2NG9/6KfwR0gWRT5J0gPuItdTStI8AJxU2d/NbfNUY8zngawvN6pa6x+i3sVst
         949qIR/vfNPgf1tPOQpgjdw9MXr6BblmASODIOGXkFlkVOOpSiEgnCgbohFr31wx66SR
         EEwla+7LDvxeI91gY5ZGXfs4oQvexSn+/EBMr8XG9SsXxjI6RPQJpst+Z3YCKZEbdWWE
         eGJI4IG1Uw4ykxtwOJmG+vYKlXTXP0n5c+mHsDnBFKVh4OXk4ZgY1aFT32k2J01pyjec
         PRug==
X-Gm-Message-State: AOAM530jTHZT7PHG93577LTpaGBIfFio6+tuM/uMayo5OxrhfP6OaN3Z
        +JhcDAbnkieuFIHMfcVgoFKireQg2rFdwztEWZYchSS6NoFj0uH4rVGWHMUVqh976rTR5zv+5Vd
        Yl22CkeEowDyztKo3BSpBd/qOwQ==
X-Received: by 2002:ae9:e887:0:b0:69f:9a9d:aa04 with SMTP id a129-20020ae9e887000000b0069f9a9daa04mr4116236qkg.31.1652455520900;
        Fri, 13 May 2022 08:25:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs10wTLegDYUDbzamzq7FJdY9st474Qj1hXGRx00kP32ZxRexYKKnM0eBdQ1u8jZKRdMj6mA==
X-Received: by 2002:ae9:e887:0:b0:69f:9a9d:aa04 with SMTP id a129-20020ae9e887000000b0069f9a9daa04mr4116221qkg.31.1652455520683;
        Fri, 13 May 2022 08:25:20 -0700 (PDT)
Received: from localhost (pool-96-237-176-193.bstnma.fios.verizon.net. [96.237.176.193])
        by smtp.gmail.com with ESMTPSA id a18-20020a05622a02d200b002f3f087c919sm1745770qtx.97.2022.05.13.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 08:25:20 -0700 (PDT)
Date:   Fri, 13 May 2022 11:25:19 -0400
From:   Eric Chanudet <echanude@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] Fixes: 76ee15ae1b13 ("soc: qcom: socinfo: Add some
 more PMICs and SoCs")
Message-ID: <20220513152519.fdzyzbd25llpkjmz@echanude>
References: <20220513144101.14223-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513144101.14223-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 13, 2022 at 08:11:01PM +0530, Parikshit Pareek wrote:
> Change the id of SA8540P to its correct value, i.e., 461.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index cee579a267a6..c37d7724c7d0 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -328,7 +328,7 @@ static const struct soc_id soc_id[] = {
>  	{ 455, "QRB5165" },
>  	{ 457, "SM8450" },
>  	{ 459, "SM7225" },
> -	{ 460, "SA8540P" },
> +	{ 461, "SA8540P" },
>  	{ 480, "SM8450" },
>  	{ 482, "SM8450" },
>  	{ 487, "SC7280" },
> -- 
> 2.17.1
> 

The original subject was fine, the "Fixes:" tag goes in the description.

When re-sending with the above change, you can add the following tags as
well:
Reviewed-by: Eric Chanudet <echanude@redhat.com>
Tested-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

