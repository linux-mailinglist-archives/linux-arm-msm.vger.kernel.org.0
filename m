Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968525AB495
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 16:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbiIBO7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 10:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237229AbiIBO6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 10:58:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FAE5926E
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 07:25:22 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id az24-20020a05600c601800b003a842e4983cso1545112wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=GsmR3xTnz4EGHXPOGBe4fehwpzfQwjC/l/oY+N0cvII=;
        b=saMRdd0ZnNfhZDHYdeHmjdBclLpvYOtUjkHR+5a294NQlK1Qk7ZxtFzdDtvFPTGCgi
         w8C+A4gYT/7V7YRGFc/3Sfa6lnpp170rZUfyXOggRR7zmPvSw17rrKTB3jXZn5emZiII
         pE3kFOGHUaqe3EGXS/KEogS55sEAbZ8EVFKJ29esfi/6FthIuIdDTtFYsor6v0W3M8sM
         T8FTqTHcmionYNbafoO7Fuor68cvQHHA+06U9wsayrymnglFJ4pyD18RL5fT/UyjUyX6
         COWxMPHf011c4Ji8+ZfJp8oYQhockYPlbuIk3Fe+QVi7IcpNmKKt2oRLU3jDpoJ6NbMh
         5oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=GsmR3xTnz4EGHXPOGBe4fehwpzfQwjC/l/oY+N0cvII=;
        b=7D8QmE/9+uK+CfAXprUvYp8sw9tH7kFoxrkual8Nsh6+3XhixRkwY5MMJUHuZinqfK
         lhkrpe2rie+8ry9HAemJ/VekUTeWb+v9QC8xHzqGy0bA562iGZH+ACsGuqFWdP7V7gck
         hvpUJ/nEdWNYMI6JN6VmGJBJwiVKyC5fMVmayDIK4x+jp7CeqvmyGY5G1vnDbdC/dst0
         pAQwDA3Yim7Ma/5HMoffk1PQTuAlYCT1QK/ene6vrw5z1+Hgqp3iotvZWrx+Org/gTXj
         jPvjD+3z4uq8PJKOj0Topt5LNQIV28W+1m9z75O3TpvmquiLbpKvoE/U2LBIWiRjV7tv
         CrDg==
X-Gm-Message-State: ACgBeo3cM4HIZN1fBWi+ymX8Oe0s4LAJWeagmZHP/w2C0U3UL4Dk97Or
        u/j9EPy/06XbVTOQ0mAOgBWv36jrKCkx+BPw
X-Google-Smtp-Source: AA6agR6MNHNzYI3GeE7KT+IEcz8WAF7ybTjlpDur7lvfZW4oCn51KZHgPpZf8RQJGvTorikTG8Qh2g==
X-Received: by 2002:a7b:ca58:0:b0:3a5:3c1c:6d71 with SMTP id m24-20020a7bca58000000b003a53c1c6d71mr3120444wml.118.1662128720963;
        Fri, 02 Sep 2022 07:25:20 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z4-20020a1cf404000000b003a603fbad5bsm2173966wma.45.2022.09.02.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 07:25:20 -0700 (PDT)
Date:   Fri, 2 Sep 2022 17:25:19 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ola Jeppsson <ola@snap.com>
Subject: Re: [PATCH 01/14] misc: fastrpc: Fix use-after-free and race in
 fastrpc_map_find
Message-ID: <YxIST6Nb2iYIr+XO@linaro.org>
References: <20220902131344.3029826-1-abel.vesa@linaro.org>
 <20220902131344.3029826-2-abel.vesa@linaro.org>
 <YxIENg1AalM46bpi@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxIENg1AalM46bpi@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-02 15:25:10, Greg Kroah-Hartman wrote:
> On Fri, Sep 02, 2022 at 04:13:31PM +0300, Abel Vesa wrote:
> > Currently, there is a race window between the point when the mutex is
> > unlocked in fastrpc_map_lookup and the reference count increasing
> > (fastrpc_map_get) in fastrpc_map_find, which can also lead to
> > use-after-free.
> > 
> > So lets merge fastrpc_map_find into fastrpc_map_lookup which allows us
> > to both protect the maps list by also taking the &fl->lock spinlock and
> > the reference count, since the spinlock will be released only after.
> > Add take_ref argument to make this suitable for all callers.
> > 
> > Co-developed-by: Ola Jeppsson <ola@snap.com>
> > Signed-off-by: Ola Jeppsson <ola@snap.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/misc/fastrpc.c | 41 +++++++++++++++++++++--------------------
> >  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> What commit does this fix?  Should it go to stable trees?

Will specify in the next version.

> 
> Try splitting this series up into 2, one for 6.0-final with bugfixes to
> resolve issues found, and the next one on top of that for new features.

Fair point. Will do in the next version.

> 
> thanks,
> 
> greg k-h
