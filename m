Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7133573C4E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 01:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbjFWXpT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 19:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjFWXpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 19:45:18 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C252706
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 16:45:17 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-668711086f4so884221b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687563917; x=1690155917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxpqoKiLiXHAYzo2GF/yRNN4ujaz4VhDxbbYENoZ7HE=;
        b=MO5Uki3XpE8DoU/U9pdbrC+SMdd1H2KLAbjuYzWFlsdCGIiOkj6xMjCmrNwkPxHlYg
         gg/JSMjuPunSfXbqIdQ9X55hKImJNSiLi4B0AwwWJDyuqsLiCRllyCE2ITFjgLCNc7ON
         9HA4X+tEwV2L6eky+lcR1MlmUzdMt/kvCzxvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687563917; x=1690155917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxpqoKiLiXHAYzo2GF/yRNN4ujaz4VhDxbbYENoZ7HE=;
        b=V/l7kkAtbwiNXk5tgv5FlnJO+YZOO8GZMbgz3oQ7JVGFLv71jWpp2DqgT7yy4TN/qX
         /133NtDZqankW+DgVcBqAwklHWq3x4PntEl/FVu2B8sK/HzY/RwjJfNa7IhgeRKzCwaW
         ZTvLeP0qxhqcZ1P0nc6wtJN8LaVHJLL+ZZ8BPFtNcywYi51rA1DrYLYuVYomgfIfC5DC
         217bZUEf41AWyKzJ3RZpSgcIUQ8gG0q+Uqg1qcvIxneOz43fjeI4hO7lvoO2GpPjhqhP
         tGNDY4HEXdTSccnpiforuu3+TDpFutDo4H7E+Tz1Ws7mn56U4qbSJ1iehL74lCqbCO/q
         7dZw==
X-Gm-Message-State: AC+VfDzW6TsNBqcCmNUZuVHA8Gm+uyhNVPR9UHQqcub3qPDLs/7OEk5j
        mjZcKeZky1jIrVjkOwb/fCK1XA==
X-Google-Smtp-Source: ACHHUZ54SvsRZGuby7rh6NGkLzQV2rO8W2svdlmGiXVK6ldfvev3mbsAUeaWTAJ9SaJHOMXk4MXy/A==
X-Received: by 2002:a05:6a20:12c4:b0:123:152d:d46b with SMTP id v4-20020a056a2012c400b00123152dd46bmr14778534pzg.26.1687563917013;
        Fri, 23 Jun 2023 16:45:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7809a000000b0062cf75a9e6bsm70691pff.131.2023.06.23.16.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 16:45:16 -0700 (PDT)
Date:   Fri, 23 Jun 2023 16:45:15 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        kernel-janitors@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/26] bus: mhi: host: use array_size
Message-ID: <202306231639.68955384A@keescook>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-11-Julia.Lawall@inria.fr>
 <3b4ff79b-93b4-cf56-1488-113905b3981d@quicinc.com>
 <alpine.DEB.2.22.394.2306232340510.3129@hadrien>
 <58cb3bf6-5ffd-194b-1455-4e5bb045fc34@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58cb3bf6-5ffd-194b-1455-4e5bb045fc34@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 23, 2023 at 04:09:46PM -0600, Jeffrey Hugo wrote:
> Kees, would you please chime in and educate me here?  I feel like I'm
> missing something important here.

The array_size() family will saturate at SIZE_MAX (rather than potentially
wrapping around). No allocator can fulfil a 18446744073709551615 byte
(18 exabyte) allocation. :) So the NULL return value will (hopefully)
trigger an error path.

-- 
Kees Cook
