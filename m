Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B417D1E96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Oct 2023 19:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbjJURXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Oct 2023 13:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjJURXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Oct 2023 13:23:32 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F209511B
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:23:26 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40675f06f1fso16975895e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697909005; x=1698513805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/B060x0z3e8JVT+CDyvjumdRFqrHNlOMqjo2TVRNGo=;
        b=C4AnOo9dBLXGH8m6qzr6sV9fdZHuETmEJmepPoBTKT3Q2BlZJNuc3LplsWt9uV4juR
         jG5O+Ivk+HKTgFYqUAL6olizl2L6JDw4VadJImOMedd+vxdJMrYc1dxTatjgbolHBYZR
         7b5gJ88RbaK2NDM7hmw0OFhb9ujui4GIAie6VrD1ivh0fx1lvMjOjXa8S5WH2UJOGbsH
         s47hx7JXEW45t3aR1GZl+Tw+X1/Z9gt8AKNxPh9EfmE2ccn0izyZoS+BCY32p69qlOWW
         zU86E9ded30blykNvPfiI365K2nWghO/EU3n89SZAGmgd9Ho4MpHE3AIrM90Lx//cJU/
         9QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697909005; x=1698513805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/B060x0z3e8JVT+CDyvjumdRFqrHNlOMqjo2TVRNGo=;
        b=DzeY8YXB3bv4Bg+uF1mn308qjJHYEFm6gmyPgw80gKuRGz3KAa3ocwRC7A7d1RrLzo
         e/pPK/GECd1GK4Dg5NuyHNh/7ODbcNXKIJQj20ZGxQMiLDvTQxRe3Lajm9JeSpGM2Mh6
         U82HDq6X2DNxKQxxoRwfSWC8rcVmx5Mz/dKnlJ+5CqrZHP0NGOkDNiN1/al5r4G/S98K
         x0AenAvg/mpetyGx7SagFaebFtqWHtCj1TnRUaA4bqVBi1G1mihYXeeaGdrvYqfPlfwP
         i63Jd8M4iXXspDSbnYbC4FV8BYV5ZctwycI1OnjhT6JUyRo++8WQftwZLZCUjg25zOdv
         Jb2g==
X-Gm-Message-State: AOJu0Yy7QGlge9BQWP+PDePqwsmJpCBKxsS0n9wmEAXWPp2rQGF3IhJR
        ByUjXBVjVSY0pC2o2wdUf+CC0g==
X-Google-Smtp-Source: AGHT+IH+v5iAfxWEV/FCka8QfasfLlcxqmQ85Ug3mXOd53qZb7OFudt4QWnfga9ot7HqQ5cJtVM/Cw==
X-Received: by 2002:a5d:594b:0:b0:32d:9d03:29e6 with SMTP id e11-20020a5d594b000000b0032d9d0329e6mr4526132wri.27.1697909005415;
        Sat, 21 Oct 2023 10:23:25 -0700 (PDT)
Received: from [10.66.66.3] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d4852000000b0032db4e660d9sm4026394wrs.56.2023.10.21.10.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:23:25 -0700 (PDT)
Message-ID: <d049f717-46f5-4715-894e-59bcfd040391@linaro.org>
Date:   Sat, 21 Oct 2023 19:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/42] crypto: qcom-rng - Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        kernel@pengutronix.de
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
 <20231020075521.2121571-77-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231020075521.2121571-77-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/20/23 09:55, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
