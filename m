Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBF4709583
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 12:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbjESK6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 06:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjESK6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 06:58:19 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD70910E0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:58:16 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f4449fa085so19260125e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684493895; x=1687085895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XxgOnxMM/jMjGnPd9a1thhj/iw7hO2xaZ7M1qo3NZYg=;
        b=bCO7u+Q011hkRNjgVIUsuJKMpZwPQZEwMRMpT2cVzaBkU2cVeNwyXtaRw1SC1PBA+w
         QiJxuuAB+Wcwu+NP8ZXQmlROjFvtdkZxoanDqFSpq2LndPvLQ4M15sdatas0T1cDj4gQ
         5ApylH0EPWhZhTgUnpWNDF7CEDyzeFd3KPaLU+bz2e9U4aQyibJmm4bXXaeI/g8MtoYU
         ZyUo9XchT9RFoe5J9LW+0xCs8VDZPZEvUDQi0dShZNiudoD3mjXX0fvdrChwKr/qn9P0
         9AKVSQeWzmvmaObi5D4+NKTvpPYgJmwCf8cb0HF/L7x7L0U+F1cUwmq9DjaUXfO84H6H
         pF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684493895; x=1687085895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxgOnxMM/jMjGnPd9a1thhj/iw7hO2xaZ7M1qo3NZYg=;
        b=LWmMX6o6fP2cGSBatywzzfOswDo2OJE+wXr2ZxOBaVj+SJ7wHuxo3uKlzVb5Qlfd/i
         VoYep3WaY5rWEO5THApNQdQGdX0eUtWLyseay5RLZDit8J4d5PpRPlGVNa2yLm6djm1s
         jiIibl3hAr47Qt1QRPLVGoQfCsN4b/DIGA3aStkMoQXXrcmqLhgy7NuaGzBByXzhxXJ6
         +UC6x0kmdnpfafWKO+mKbf/7ijoFLa4i5u5S4hgaj+syNlS5/yO0RWriIJu6/cFF1dZk
         bMUOy+1Ojd1GhxCeqpMPGDh7Zm/3lssQgaaJTSDq/IUAQUDzy7Rna4GhbZ5ynILN6wV4
         1IKQ==
X-Gm-Message-State: AC+VfDyXyJiWWfWrJENprM8DdxdnCAGajCXG9iUL1MOhebsG2txJWh9K
        3sH+PoPlWvqW7cF90kT8McyUlQ==
X-Google-Smtp-Source: ACHHUZ5Jkz/tisFg9BRWiG5aFVV9XmZ2Daa6Xp+YaPTVsrIurgnXC8HO/LlOr/DT1q8KJVKReSwS2Q==
X-Received: by 2002:a7b:cc8e:0:b0:3f4:1dd9:e9de with SMTP id p14-20020a7bcc8e000000b003f41dd9e9demr1272529wma.8.1684493895108;
        Fri, 19 May 2023 03:58:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c024800b003f42ceb3bf4sm1984115wmj.32.2023.05.19.03.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:58:13 -0700 (PDT)
Date:   Fri, 19 May 2023 13:58:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Sukrut Bellary <sukrut.bellary@linux.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] misc: fastrpc: Fix double free of 'buf' in error path
Message-ID: <fa0e9d9d-6362-456b-87f7-990ccf7e8930@kili.mountain>
References: <20230518100829.515143-1-sukrut.bellary@linux.com>
 <9194ebdf-f335-4cd6-bf89-bb4f86a57784@kili.mountain>
 <f47b17c1-1c02-2aa3-ba10-fcef70cb25a8@linaro.org>
 <b0115d7d-d15a-4948-8726-09a8b37f3f36@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0115d7d-d15a-4948-8726-09a8b37f3f36@kili.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is unrelated but I was looking through the driver and I notice
a bunch of code doing:

grep 'return ret ?' drivers/firmware/ -R

	return ret ? : res.result[0];

"ret" here is a kernel error code, and res.result[0] is a firmware
error code.  Mixing error codes is a dangerous thing.  I was reviewing
some of the callers and the firmware error code gets passed quite far
back into the kernel to where we would only expect kernel error codes.

Presumably the firmware is returning positive error codes?  To be honest,
I am just guessing.  It's better to convert custom error codes to kernel
error codes as soon as possible.  I am just guessing.  Sukrut, do you
think you could take a look?  If the callers do not differentiate
between negative kernel error codes and positive custom error codes then
probably just do:

	if (res.result[0])
		ret = -EIO; // -EINVAL?
	return ret;

Also there are a couple places which do:

	return ret ? false : !!res.result[0];

Here true means success and false means failure.  So the !! converts
a firmware error code to true when it should be false so that's a bug.
Quadruple negatives are confusing...  It should be:

	if (ret || res.result[0])
		return false;
	return true;

regards,
dan carpenter

