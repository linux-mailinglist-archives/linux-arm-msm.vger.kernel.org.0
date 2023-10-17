Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDE057CC8E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 18:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjJQQdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 12:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbjJQQdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 12:33:32 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FCD9E
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:33:30 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so67452271fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697560409; x=1698165209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBFWGn/gvqVVyXZTf5VIIyU+5FQ2m7CQrE6bIJGKvHQ=;
        b=EsSO6GsoJ7c1HaiGciObuJCFkMsumw/PoKYLaVhhXCUoArBdUHPfaPQVfzQ+1JDI+2
         UL36JQsJbplaVWBqi1NFfN64pOYHoJcsqxNsK3gHDlQfDe7QSaQu2EVPwnva5DDd5Gbt
         6mjdq6+Vbj4YWxcR63KfzrzH/g2p3fH04SdjTWtnf/Ng5SgzlSVPv4qpn1PgcrsRlYBc
         7imXmjxHGxfdAvdo+NVUc7XJSGG5JJNi/NsodDc/71xhBLOhqGGj29n57geRMkKyVVz4
         SzoXY1UFwAyBjobSX0rtIPdrp+AmhogRZpJ3yeC8BOfVYLf3MLEQbhN5887wX8SIWml2
         NRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560409; x=1698165209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBFWGn/gvqVVyXZTf5VIIyU+5FQ2m7CQrE6bIJGKvHQ=;
        b=fT0OsTjd6+3Kf4jmi99J+KA4xfOsWBuln/FdQ4F++sLMKJFs7l9nttaGVME4PQXQsF
         leD8dQh0OSfnWuDhG83eo0nqqGY5JCs9TbecXgByV4f+NLJ4CThefLJwYb9NBj9fg2Ne
         kH5vvIcmG4ZD/52HBkJpWisSXIViDjF42893LJRUi5Ntd5c17lOrpmHcJVNwLAG6NpWj
         Sdwz18ciRR0aJNxOzbkt++Lfor8YwOjPYl4cpb871UZJ2O45DOQtxMukqqdS8F1MOA8Q
         Lqi2m/XG6EYSC1JYTn/BvnClj4/oHwj2N4R4zRFPGUsajRJeAIg0UIJqICQ0rJIq7OCA
         8CYg==
X-Gm-Message-State: AOJu0Ywx3qa5rnmEoSC2iavC1d97mhcBh01ohcU/VSUnl4qlyMASXKjT
        x0rhS6W6tCO5m3mInZBDQH9EAA==
X-Google-Smtp-Source: AGHT+IElFNOV8yNGHCszy8avNUOk1VnnkFpIAJDEWWtUw4SZJPVSp0RS4kPtlbCTXb5dkncA5hKIzg==
X-Received: by 2002:a05:651c:2110:b0:2c5:56b:cbd1 with SMTP id a16-20020a05651c211000b002c5056bcbd1mr2477321ljq.10.1697560409049;
        Tue, 17 Oct 2023 09:33:29 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id l38-20020a05600c1d2600b004042dbb8925sm10368884wms.38.2023.10.17.09.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:33:28 -0700 (PDT)
Message-ID: <d7d37fcf-e902-499e-a43b-c4b03d3e2caa@linaro.org>
Date:   Tue, 17 Oct 2023 18:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, kernel@pengutronix.de
References: <20231015135955.1537751-2-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231015135955.1537751-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/15/23 15:59, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Several drivers use qcom_icc_rpmh_remove() as remove callback which
> returns zero unconditionally. Make it return void and use .remove_new in
> the drivers. There is no change in behaviour.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
