Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E191687BB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 12:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjBBLKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 06:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjBBLKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 06:10:04 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF3D6B009
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 03:09:36 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1103190wmq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGhcwfRQP1vbMhQHFBN3FkAYqNe4cdk/CFn8QpsceBo=;
        b=FDpSb+mwnlw8m5dHv+86Ui3ZrmgaXz6GfNCWc2N7biOdmOXsemof67Z+Ql7/ScD270
         vlo8IXDmUvSzX9EhLRxmlbY9GUQ2qr7Mi+Uw9lo8o86w3HSbNgAb2Q3x2R43VIf1Bfyp
         9SKdNxy+e8QEaLvjNrvMFx+Rq7O0NHz4qOzdedbPqbKPI2IRknH0xNWJ/J0HyJg2l+cm
         A1rqYTSdb+EiYaI/wLKGn0+KRytAoOvUcEp4ERC4c/M6ajPmWxxUwL0Nuv8JlRXbwhKx
         0L3YQMXEu7x+DqKQuRcOR0+LyW1/LcIUZxHzR4heBcWPZkJQ5sNvCrtOdfcYipx3Reww
         7hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGhcwfRQP1vbMhQHFBN3FkAYqNe4cdk/CFn8QpsceBo=;
        b=xt/dlDitoBsM/ipueq/KHfREzvYbBYBlZtAVhZfkVWbQO1oznTJBD9Lx2xgW2SsOkj
         ABbumd3qWtf6GeolKSFJitJD3TUR9+T8viWqs+E4dS2jwDSqWJk8b5tuAIttQdHQp3An
         eY5Dii9EFYztiSOUofbnY4EkZkhlJ1SVw++GtnZXl6Uj1Jy2Q01eCuiRs8gEpI6xKoty
         nL+A8UNPtMb5nkPyJste7U8W71w3DRKQd3ZhXXXoAgkSkqV3kDXHdLzKn8zALu8w5DRW
         ZLn5uFK+QIvDSmhDfzTRLjq+r3tPK09yMsXYehA/T1JfB/CTp4xQXEGPqNwi6pxeNSdS
         6kFQ==
X-Gm-Message-State: AO0yUKXiBdOXGh34cDHubLnBPQKxuHwEObjJjN0Ffx3r/qdFaTMbl3zj
        jrEGIsDWhXHF/mYhCAcLXGoASQ==
X-Google-Smtp-Source: AK7set97949CQomMTHJXrUmVYXoP68F1grpSho+nTxTkUvOOSDw/afzyYWDMSQ0qCS57Wk1H9+6yeg==
X-Received: by 2002:a05:600c:35cc:b0:3dc:55e6:fffd with SMTP id r12-20020a05600c35cc00b003dc55e6fffdmr5502802wmq.15.1675336175028;
        Thu, 02 Feb 2023 03:09:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c2e0600b003dcc82ce53fsm4247203wmf.38.2023.02.02.03.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:09:34 -0800 (PST)
Message-ID: <40d0fff4-5d1c-3e93-1eed-132c7e1aa92e@linaro.org>
Date:   Thu, 2 Feb 2023 12:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 16/23] interconnect: exynos: drop redundant link destroy
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-17-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201101559.15529-17-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 11:15, Johan Hovold wrote:
> There is no longer any need to explicitly destroy node links as this is
> now done when the node is destroyed as part of icc_nodes_remove().
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/interconnect/samsung/exynos.c | 6 ------
>  1 file changed, 6 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

