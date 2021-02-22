Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAEE3216E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 13:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhBVMic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 07:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbhBVMhr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 07:37:47 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11734C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 04:37:07 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l12so18915895wry.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HiGNj3+R0Ym9jt9EX62JF7a9E4o3GHcwy0UNEFOwwjQ=;
        b=efwJF4iNOmFW20peeakaKV2KAdXdCjDp6sNK0+AHQcjcgmj83HQDcfOabrsXcZQIAs
         C+sjs989q1lerWvYIFrPsVWQk1p9S4LUycIcJ0PZZLC86r4gpr6oFaZ97rcVhIADUvOG
         +aFLXgpowd+xC7dM20hME0hRh04gYbBrkzYfT5vRrk3X4sA24T5dU67+MyTCEeMX+HXq
         BX9lqZ5awoD2bvd9Qc4BxdE+aNuHNJogu1TdEyo9aa0yg/w3raL/NdOGM9rSceleb4l9
         ayLw52Utu+rYN0869rt0kfHJulxEbByVg3Kxlr0cHTWN0cDtbHG/1pNaEC2wVO2i5ZZx
         lsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HiGNj3+R0Ym9jt9EX62JF7a9E4o3GHcwy0UNEFOwwjQ=;
        b=lQb27XJW4cNyWVUxy1FRl8fqjvcvpgLnhT9gxjjIeFweA1EGWDPRnA8tchgoghvAba
         OhSS529eGq4ByatKuVlxZ7O4I8RPy5DeHRLVr6f7XiQ5jEvBh+W3DL1+qugFzazpPWJn
         MwjPiGbxG6X8j1SoUWZqp0qYqs4Yy2OpzKraYj/OxYvb7HTMWYcxyKMMtUvjlp17CnfK
         DYKxbk9AizeSBGLRe/QXT519NMxbSRxYXNP1loa7g48gOD5V3shN/dmzrpHq3waFiME9
         SkvUc79JhKrCIhlDL82uf21M+h5TpvsK5PPXPIVcIfiXidHkVl7Gd272b0Bfin73c14y
         4dww==
X-Gm-Message-State: AOAM533dQKyEwF5dQdj43q8amAG/N2NfLWUf01Amq0E+h2Euk6h9flBy
        PoblZXukDvn7z4DsiDII5D94j1RqXcqnNg==
X-Google-Smtp-Source: ABdhPJy9o9rKOv95iSvpSUU2QrbdY7k9XakdSdgByr6YZQ+0bqdtv4QkCaM/HKsrIw9Ol7KIkzGMJA==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr13570370wru.235.1613997425876;
        Mon, 22 Feb 2021 04:37:05 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id t11sm17633432wmb.32.2021.02.22.04.37.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Feb 2021 04:37:05 -0800 (PST)
Subject: Re: [PATCH 3/3] fastrpc: remove redundant fastrpc_map_create() call
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210218032055.28247-1-jonathan@marek.ca>
 <20210218032055.28247-4-jonathan@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <58e361e0-441e-fd71-362a-398dcb84f888@linaro.org>
Date:   Mon, 22 Feb 2021 12:37:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210218032055.28247-4-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/02/2021 03:20, Jonathan Marek wrote:
> fastrpc_internal_invoke() will call fastrpc_map_create, so there is no
> point in having it called here. This does change the behavior somewhat as
> fastrpc_internal_invoke() will release the map afterwards, but that's what
> we want to happen in this case.

This will crash the DSP as you will be freeing the init process memory 
while it is actively using it!

The shell/init process is created as part of user process and it should 
be valid until the user process is valid! We can not free it when the 
invoke is finished/acked as we normally do for other invoke context!

In some firmwares the shell process is statically built into the DSP 
firmware which might work! But other normal cases are totally broken by 
this patch!

--srini

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/misc/fastrpc.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 170352b43ab6..ccad9f5f5e2f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1013,7 +1013,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   	struct fastrpc_init_create init;
>   	struct fastrpc_invoke_args *args;
>   	struct fastrpc_phy_page pages[1];
> -	struct fastrpc_map *map = NULL;
>   	struct fastrpc_buf *imem = NULL;
>   	int memlen;
>   	int err;
> @@ -1049,18 +1048,12 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   	inbuf.siglen = init.siglen;
>   	fl->pd = USER_PD;
>   
> -	if (init.filelen && init.filefd) {
> -		err = fastrpc_map_create(fl, init.filefd, init.filelen, &map);
> -		if (err)
> -			goto err;
> -	}
> - >   	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
>   		       1024 * 1024);
>   	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>   				&imem);
>   	if (err)
> -		goto err_alloc;
> +		goto err;
>   
>   	fl->init_mem = imem;
>   	args[0].ptr = (u64)(uintptr_t)&inbuf;
> @@ -1106,9 +1099,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   err_invoke:
>   	fl->init_mem = NULL;
>   	fastrpc_buf_free(imem);
> -err_alloc:
> -	if (map)
> -		fastrpc_map_put(map);
>   err:
>   	kfree(args);
>   
> 
