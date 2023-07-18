Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7A0758200
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 18:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjGRQX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 12:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbjGRQXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 12:23:25 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77760E53
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 09:23:24 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666eec46206so5943856b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689697404; x=1692289404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8btmNM4fZaWtft2y/AZfU76LwbrOpMNoLAwhQ6pc8YQ=;
        b=cmpZJ3bTZzlfNOFXhI408nH7WPN8NVQzrqyA2LZFUAt2ZOW8NnC/8keoT7FLyr0b5f
         t6HltMnTJ5JdbWFLLXVp4AzQlo1wPzXXQPVFFU/bYFZAEoEx65jYxw1LtXXphqZBsNup
         Pf77k/o8WsJWGccCvRi+CCeOVQhP257vTYjEvPqkRZqahwSd8pXQdDYL+8qwNE+FHLzs
         CwGwT8Dod9oI/ubbdtftQf7xIiJOp6xXmpbVwwOHT9ZJ+1ibx6oTsJw6O4knZRaa/GZT
         VMC2Tq+q+htaAVAAruvwjryHXXUbWS+R2p1eXAuf2hwgCQIhCn3Y8IHjHxQJVdfl1DgX
         0J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689697404; x=1692289404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8btmNM4fZaWtft2y/AZfU76LwbrOpMNoLAwhQ6pc8YQ=;
        b=NVmRnxEQW2B/g2a9hX/u6+k8Qtx72sNGI9hb+Q9oEScW3j208BIdyLPboZywG9KUsJ
         Ly+DQFrmMfGm1cbpjKD/8MTFM9NZDPt+Rf/rPFUj/xkmtUZE++x5hVF7EiXYE3nX9ooH
         1q9v5fLCtW4rNTp6/0UKGf0oVF0zl0vI9BIsyYTCm0HGtRnyUuqhiTSnHR8vPKdH1EQv
         LL38D4I2QjBM1riYtOPsyDohGQlvc5mi30CNPsYJm/FdvuN47pOYiuv3dHGUhYEZvS9C
         X44HgxUkHIcZiOU+dIoKz+0nwsPjOgc7iIFS/BGKmAte0pCogz4HW2gf4C+jTdn2EEDt
         QGgg==
X-Gm-Message-State: ABy/qLZBOzRSl1ROd/fZQy7xJId/1jM8Ba9wGn+kA5DH4eJAWz2Vc+IX
        /U4rF2s276WcnXX5AMkV1d2SYA==
X-Google-Smtp-Source: APBJJlEmvs3NrdWOLttT+xLgm5IvnEqfm68aKPVbDjqZNLieClmsHcxjK5jE9syxd0gRUXjnXHGGwQ==
X-Received: by 2002:a05:6a20:549f:b0:12c:fa41:3fab with SMTP id i31-20020a056a20549f00b0012cfa413fabmr19605772pzk.45.1689697403839;
        Tue, 18 Jul 2023 09:23:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:181:e3fe:53e1:920])
        by smtp.gmail.com with ESMTPSA id z1-20020aa791c1000000b006661562429fsm1769261pfa.97.2023.07.18.09.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:23:23 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:23:21 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Sarannya S <quic_sarannya@quicinc.com>,
        Chris Lew <quic_clew@quicinc.com>,
        Deepak Kumar Singh <quic_deesin@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] rpmsg: glink: Avoid dereferencing NULL channel
Message-ID: <ZLa8eRptI/21au0k@p14s>
References: <20230717165538.1542034-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717165538.1542034-1-quic_bjorande@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 17, 2023 at 09:55:38AM -0700, Bjorn Andersson wrote:
> The newly introduced signal command handler checks for non-existing
> channel and print an error message, but then continues on to dereference
> that same channel.
> 
> Instead abort the handler when no channel is found.
> 
> Fixes: a2b73aa512a4 ("rpmsg: glink: Add support to handle signals command")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202307160800.sb7gMnL6-lkp@intel.com/
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index e10c05ed21bb..82d460ff4777 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1070,8 +1070,10 @@ static void qcom_glink_handle_signals(struct qcom_glink *glink,
>  	spin_lock_irqsave(&glink->idr_lock, flags);
>  	channel = idr_find(&glink->rcids, rcid);
>  	spin_unlock_irqrestore(&glink->idr_lock, flags);
> -	if (!channel)
> +	if (!channel) {
>  		dev_err(glink->dev, "signal for non-existing channel\n");
> +		return;
> +	}

I have applied this patch.

Thanks,
Mathieu

>  
>  	enable = sigs & NATIVE_DSR_SIG || sigs & NATIVE_CTS_SIG;
>  
> -- 
> 2.25.1
> 
