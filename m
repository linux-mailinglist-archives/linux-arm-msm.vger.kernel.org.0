Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096E2596482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Aug 2022 23:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237466AbiHPVSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Aug 2022 17:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237431AbiHPVSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Aug 2022 17:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A058F2CE18
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 14:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660684718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pB2MXlODWhdpcT5LoWH4Us0FJuxoK4gcT72TphVt0ag=;
        b=MiPrmDMzf0VrN2UpKXcN5lJBHpVc6jvfj6XLXKA238JhV4hUgu343Lyk104cdASd2mvxO+
        Tw9dTdRhOetxrh000RYEMNkxeaBuU6utl1m/snzjtiOgxqlwgrOtugWtFdhLg5/K9PzccJ
        t+Wns0qPPIjA1uhMSeDlRtwOFLHnRNg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-VfmLcWQLNuW3opZMXXdUbg-1; Tue, 16 Aug 2022 17:18:37 -0400
X-MC-Unique: VfmLcWQLNuW3opZMXXdUbg-1
Received: by mail-qv1-f72.google.com with SMTP id ly9-20020a0562145c0900b00495bcb17d9cso1167982qvb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 14:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=pB2MXlODWhdpcT5LoWH4Us0FJuxoK4gcT72TphVt0ag=;
        b=DpUI1BUH9BVm9n67wmkWkpKsZYaohw7FdssXWTVzJgld5hY3ErL8rf1wIJqgtB6r5z
         PRL43QIzqKLUi1u1ker51h4aem2G57m7CqOdGe7LxGc6BI6jwQDHrYVrgi/tIgD0DHX9
         pbpE5TUAQXdiz6okOK1/wgVjZKvk9DTA6urzdQdcQ28VYB909R9b49+c/d2T1I1XfwDl
         Fg8WsXrxmckvUfL1HbymZNqC/iTzTm5K3s4eFldx01+HO+gro/HWCSqtbOhqKVhdgkGy
         +L/GtPewJ4+YDuCJgxF1v5KBxhQ8wn5gZ0EDaMshCEKl2ZmUjVuwOx+XurZDlVBJylEL
         3MGg==
X-Gm-Message-State: ACgBeo0qsbO2u7aSdyGAbDMouqsExshUUfVchnvFqGkKyI4Z4W0/JnTh
        SR6CZ2mBTPvyODhCck1Xp6fvZ1mne0rCvzco1wS/UWI+x1lpSPLaMfQ14YGxG9Pq4UnUMsFvT3L
        0JhFlrekVHDLbJaRnkiGV9Gf5uA==
X-Received: by 2002:ac8:5716:0:b0:344:540b:d118 with SMTP id 22-20020ac85716000000b00344540bd118mr13913279qtw.68.1660684716549;
        Tue, 16 Aug 2022 14:18:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IEkmqc/qG0o268oGvr06pk78pb8Xs9cosCViTIQdJJKsk2JEc+qZbuIUUgdPWBgAZ+oPi5A==
X-Received: by 2002:ac8:5716:0:b0:344:540b:d118 with SMTP id 22-20020ac85716000000b00344540bd118mr13913263qtw.68.1660684716342;
        Tue, 16 Aug 2022 14:18:36 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::1e])
        by smtp.gmail.com with ESMTPSA id h17-20020ac85e11000000b003430589dd34sm11766161qtx.57.2022.08.16.14.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:18:35 -0700 (PDT)
Date:   Tue, 16 Aug 2022 16:18:32 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] misc: fastrpc: Use USER_PD define in
 fastrpc_get_info_from_dsp
Message-ID: <20220816211832.6elmi3sg5gaeh3jl@halaneylaptop>
References: <20220816105528.3222763-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816105528.3222763-1-abel.vesa@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 16, 2022 at 01:55:28PM +0300, Abel Vesa wrote:
> There are defines for each type of protection domain now.
> Use the USER_PD instead of magic value in fastrpc_get_info_from_dsp.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Amol Maheshwari <amahesh@qti.qualcomm.com>

This looks like it got the only remaining magic value assignment.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 93ebd174d848..8895ca593911 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1515,7 +1515,7 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
>  	args[1].length = dsp_attr_buf_len;
>  	args[1].fd = -1;
> -	fl->pd = 1;
> +	fl->pd = USER_PD;
>  
>  	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
>  				       FASTRPC_SCALARS(0, 1, 1), args);
> -- 
> 2.34.1
> 

