Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8A426036A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 19:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbgIGRtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 13:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbgIGMgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 08:36:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6B3C061573
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 05:36:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c15so15608026wrs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cqFMV15+ncKbqbkS4rVaONwxjHJHpxU0h6ADgIa+Z0A=;
        b=Ytdkogj/FxZPspswI944ZPcLbsutNDXJrlYzv30IZRXro+wphhZ7PvwcYfnJRJzjIx
         s75ETcQTuUJ8NNe2sic0iOG3MMMnBSqgF13pBu4txpvZFjikm6UA5tLJLLk+Y8svAkjK
         Z4X/f15mhhpq+73D3DFlce9xxFWpwjW4n7yRPEY3bwEEZeUzDpkPbO4kFFXx0SNzouLC
         kjFo1P0XR8lmeCJnUGGu9Z6Vy5eZl4Mdl6ErHR2gA0m9LDTSuU1zVTowmjnTp8MnJ8vA
         Gg5xzBuDnxiDAPSSl28ZKMla3iXO+DznonLNjF9EF7pCJsG9fh2w9zcNUGySnCHQzMY7
         LtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cqFMV15+ncKbqbkS4rVaONwxjHJHpxU0h6ADgIa+Z0A=;
        b=HX5fKUBKSvB696A+IeJK/loW3FuCFk1G4kwOt5PEyjjLUoJdyEQrROzIP9CS4J3aYN
         wcm+RMslxlEEgSjHfU9Uye7TdUHs1MpSpHn2TaeDou5YsCKoxkaEzrcDw8NnwdNnvgTF
         bof0LfCrPvw3u31gPcODgkAQWyL/7URt9D42+IGD2Hghx202LVQlFinlEPUk4HvIMorQ
         G2iJ57QgAeZz/pDS876SH6g3rauUGBTtJfGwh0ZnS3im9yKBxwtf7lUyhnxmztwxZhbX
         0D8kGi4/G/HC407GGlM657dkkMJZOsiP/gZfaqcdVzJ4eEz6H/Duq7ECasHvMBOiTo0H
         zzTQ==
X-Gm-Message-State: AOAM533KvY6dd+TAfRhC01xxycQjLbOP2cFuTVS165oB+okYMrxh+ZXL
        qnRe1gSxNpONkGQAncFloTvA5w==
X-Google-Smtp-Source: ABdhPJzQe5EfAU2q9xGZLtiNTjwaCpqPJTnKV5+qPIuoluAHp8SC/Sa/9E3K2d5sr2tXrTy0rFiyKA==
X-Received: by 2002:adf:e583:: with SMTP id l3mr21112729wrm.72.1599482211454;
        Mon, 07 Sep 2020 05:36:51 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id z13sm28535545wro.97.2020.09.07.05.36.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 05:36:50 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200901003300.11985-1-jonathan@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <fa436d55-b986-944f-e90f-b81cb32eeb0e@linaro.org>
Date:   Mon, 7 Sep 2020 13:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200901003300.11985-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 01/09/2020 01:32, Jonathan Marek wrote:
> -#define FASTRPC_IOCTL_MMAP              _IOWR('R', 6, struct fastrpc_req_mmap)
> -#define FASTRPC_IOCTL_MUNMAP            _IOWR('R', 7, struct fastrpc_req_munmap)
> +#define FASTRPC_IOCTL_MMAP		_IOWR('R', 6, struct fastrpc_req_mmap)
> +#define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)

Looks like changes that do not belong to this patch!

I wanted to try this patch on SM8250.
How do you test attaching fastrpc to sensor core?, I mean which 
userspace lib/tool do you use?

--srini

> +#define FASTRPC_IOCTL_INIT_ATTACH_SNS	_IO('R', 8)
