Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCEB1F93FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 11:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgFOJzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 05:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729318AbgFOJzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 05:55:33 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9DEC05BD1E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 02:55:33 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p20so16705250ejd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F2y9Crm4EpXrgojd+CYn/r/xzpbyjoctnZnKUBxxPGw=;
        b=bH52eZn08gxvWDKX63J+WIukX0j2P3n7HyPqonmets/vbXsOXhi81yedn4gWFeKKgc
         Nd97MdUX3wiXsdSQY3wQdUIPnAluBFWXhcBZ8BAQwlpAWUjchBVrXbGAlWp20KVUVUXY
         R/uBSQemQsvtwxH9SOV1pTp2yySw61Y07GninWtBfjDu5VIqdDzmfqe2jAhgIzT2Bz1B
         NRLp3I+nPXlIzSfhf1A1+gXtK0CLD4Q5Z4U/oY6RpQ2lyQkkt0yCU7eU1FiFl5kwZpMC
         zfXaocuA8lqIJ+rdIQpyAevnwQQC3rmI1YX9RyC/i/QgJ/IyrqlSl9gZkH4Fx+RfDPXN
         begA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F2y9Crm4EpXrgojd+CYn/r/xzpbyjoctnZnKUBxxPGw=;
        b=frGIGd0Q6/vKBaIE9/DpS/wZ9AWYpFXgXtyc2jTEwY/cDFc6bJ4aXaDOE2p7XC/r/i
         SkWOgWpmdqxKP9SCwjJIdB+jwbWBK4yA7BddOLIwQ3mxN5hKG1Z+xLwTkZmvKqIGcccU
         //vaiI9tZVolJ/EKDIilQxCXrdQYsOKyFdbdeQRxa7a3F6wRmFK1Xt9Yg1IwDT01QUeP
         n2axXrQ3mLFRzyQ48sjKbCykeNrXECMBfB1RlMLVfoFZPopAUvBgBYnyEKWuoTxwaoUk
         qLdE9CSQAvTBt9t3eh0+60dDRDoW/71N9KODIdGnNy7OnD1pbhcpVowxqXu4ydWpU9St
         7SmA==
X-Gm-Message-State: AOAM530pb6/L6ThK4zCviEdk1EG/aFzIMEXzp3XE/pgpwLDGzc7Mrjtf
        5uA4HaqqgpR94/RQ7nzPBeae2hwO/VsaBg==
X-Google-Smtp-Source: ABdhPJz6cNXf6sv5+78+bDzU/EfsCLMtxsclb4N1u2KcEBfpSY9J/kaEdBCn6renQCfjvKPO06pKAA==
X-Received: by 2002:a17:906:d78a:: with SMTP id pj10mr25691244ejb.50.1592214931572;
        Mon, 15 Jun 2020 02:55:31 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.googlemail.com with ESMTPSA id lx26sm8665063ejb.112.2020.06.15.02.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 02:55:30 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] venus: Make debug infrastructure more flexible
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
 <20200613223919.7038-3-stanimir.varbanov@linaro.org>
 <20200614063710.GB2611869@kroah.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c54a12a2-7f92-105c-a01c-8e85730f36bb@linaro.org>
Date:   Mon, 15 Jun 2020 12:55:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614063710.GB2611869@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On 6/14/20 9:37 AM, Greg KH wrote:
> On Sun, Jun 14, 2020 at 01:39:18AM +0300, Stanimir Varbanov wrote:
>>  	if (slot == -1) {
>> -		dev_dbg(inst->core->dev, "%s: no free slot\n", __func__);
>> +		VDBGH("no free slot for timestamp\n");
> 
> Again, no, you just lost a lot of valuable information by changing to a
> different format (like driver, specific device, etc.).  Please don't do
> this, it just makes the information less than before.

OK, one of the reasons to use pr_debug inside VDBGH macro is to avoid
having struct device *dev variable in every function with dev_dbg even
when the function doesn't use it.

Are you fine with s/pr_debug/dev_dbg in VDBGX macros?

-- 
regards,
Stan
