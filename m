Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700B97513AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbjGLWkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbjGLWkj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:40:39 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BEB1FD4
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:40:35 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b9c368f4b5so9159025ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689201635; x=1691793635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W74OVpeHRuNiX8pMSZJwMLioV1gL07KE3H1a2Sb6peY=;
        b=QgNyeryYTTACVv5xzPnNBA4fBv8uhd7VsaVJyHLSkvwtHQ661hFCyV66BZ6tioghkS
         IiSrAN7DKiJZGemA6V8wlUMgmctAMNrRpVUKhk/5Lv33vAAYGSUdGM69pCLaNnlbNOXh
         8XefLt2O2fzoj5+Y6R5Z6VGjlTW+vbMv4QtDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689201635; x=1691793635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W74OVpeHRuNiX8pMSZJwMLioV1gL07KE3H1a2Sb6peY=;
        b=kp7FTK3h6KfNgkbwIlwNS3FnINaUB4xquPeXijE7hR3Flxy9zMKHkOUqi1bvPgBZm8
         Fx9OUFdAV/cLHdEeEfBSk0gosZZRJGwHOuMm2V7PZ5P8uW/8H3U9YIRLh/BPR+84pB3r
         4QIgZ8JROxoKyliEhCYnPU/gLY7RnH2j81VO7NJYSxeOzw654x3N4YW4bcidYh6uNccR
         Fk1j3BsKiD50d4UmdJJjZnjaDCCmnANz/OMZRnI3aWKpMYbGAjsX5cSSmBqz8kG/++uu
         aKu7EmGBuVXMV78mV8OAF/NzKYipSJ4RKm9lXK4ivuK3MOxznui4oUH0dAChdD5YbhBK
         6ohQ==
X-Gm-Message-State: ABy/qLavs4Lt/2R/swUh2KFMxxrEFuPk0qUOZ3lisX6oacJ3QdVcCRZh
        eQH0C5f2Nm/kzMz/HVlbGtlOSg==
X-Google-Smtp-Source: APBJJlHjYHPAqP5SmPN3RIOl52xjZOYYkXRgyg60M7GK47U7g8k/67db5mDhdwbCY4s7DI8euJG7fA==
X-Received: by 2002:a17:902:ea03:b0:1b9:d38d:efb1 with SMTP id s3-20020a170902ea0300b001b9d38defb1mr196238plg.8.1689201635138;
        Wed, 12 Jul 2023 15:40:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d14-20020a170903230e00b001b864add154sm4475679plh.154.2023.07.12.15.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:40:34 -0700 (PDT)
Date:   Wed, 12 Jul 2023 15:40:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: Use struct_size()
Message-ID: <202307121540.F8EBBCA1D3@keescook>
References: <f74328551cfab0262ba353f37d047ac74bf616e1.1689194490.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74328551cfab0262ba353f37d047ac74bf616e1.1689194490.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 12, 2023 at 10:42:15PM +0200, Christophe JAILLET wrote:
> Use struct_size() instead of hand-writing it, when allocating a structure
> with a flex array.
> 
> This is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
