Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E03B526322
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 15:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343572AbiEMNuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 09:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382481AbiEMNsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 09:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9DA43FD3C
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652449713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xX4kszIzggw0jJ79lG9EiQ7nkM1SGc5ii4Szr8DCgkY=;
        b=O0rViqycIgmG+4W7IuQjMVf0c5Ea3HKXLML32Kv78IVt0FSiIiFX7pW08TNTuniKYOq24b
        tsNpG3EbDvfl3E1c9qfWqUqDVxCrWKTpR5ZnXYsrX4kIGdwB7fWYiM5jiMnbfANp3hz06q
        xulJ92rcZBMajDi85A+SUDI94u5b0D8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-Qo7szuIIOIeWPwysEL9x0w-1; Fri, 13 May 2022 09:48:32 -0400
X-MC-Unique: Qo7szuIIOIeWPwysEL9x0w-1
Received: by mail-qt1-f198.google.com with SMTP id i11-20020ac85e4b000000b002f3d8c3a96dso6351480qtx.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xX4kszIzggw0jJ79lG9EiQ7nkM1SGc5ii4Szr8DCgkY=;
        b=ELaGHLq6StgBpMpdaGw1IeVj9XCBhcZ39nKnMI0i+y95nnSxgp4KykM7D2Shi7jCaE
         hCqZD5rBGcYOGmYjpLVqN4apKDQPGGAbvVoeKgaltMl4zWHIyQNRml27xU4gnjJVXIeG
         5qmxzdR9eREqE11KUcHs4quzrNXQCD+svHZLWAfcp/K3Y8buu6r261nvV8WgiexGU81s
         Y1M9BBStUOb0FE+Hqc2VbB/xQOlZr/qtvsSRveXv4jjoV1FIFg/5yY/cYempSkM1Hm6D
         py7yJgAgT1d+J8GHaAt06+4Z320slUTpGPWuE3eO4ShgrI+crriFDYQwpm+17EF3OE4/
         uu+w==
X-Gm-Message-State: AOAM533raA6s4DjHg1iXfvqR1l5Bjd1R9qtH5arFfd7iIkH+yDKNuNw+
        Grls89z9aGQV8yFw3NbNToGtUPHlPX99urARXIBw7hgqCG5jxG4eqavfT9bwRy4O4iZJGQROfyx
        T3oDu5XXGqHZ8yFyfT5ebqFfkpg==
X-Received: by 2002:ad4:4386:0:b0:456:5223:7bd5 with SMTP id s6-20020ad44386000000b0045652237bd5mr4344051qvr.32.1652449711827;
        Fri, 13 May 2022 06:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqsEvUpuVPbF6jCFPguBKGuCN1RtWI9u8ysl604k+Ls+e2d+tMr4HJRwY2dZofQlR1TleYMA==
X-Received: by 2002:ad4:4386:0:b0:456:5223:7bd5 with SMTP id s6-20020ad44386000000b0045652237bd5mr4344040qvr.32.1652449711612;
        Fri, 13 May 2022 06:48:31 -0700 (PDT)
Received: from localhost (pool-96-237-176-193.bstnma.fios.verizon.net. [96.237.176.193])
        by smtp.gmail.com with ESMTPSA id w10-20020a37620a000000b0069fc13ce1f7sm1387525qkb.40.2022.05.13.06.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:48:31 -0700 (PDT)
Date:   Fri, 13 May 2022 09:48:30 -0400
From:   Eric Chanudet <echanude@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: Fix the id of SA8540P SoC
Message-ID: <20220513134830.6bi457uqtkqk4ijx@echanude>
References: <20220513114114.7103-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513114114.7103-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 13, 2022 at 05:11:14PM +0530, Parikshit Pareek wrote:
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
You should mention:
Fixes: 76ee15ae1b13 ("soc: qcom: socinfo: Add some more PMICs and SoCs")

With that addition:
Reviewed-by: Eric Chanudet <echanude@redhat.com>
Tested-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

