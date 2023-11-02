Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181047DF429
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Nov 2023 14:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjKBNnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Nov 2023 09:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbjKBNnd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Nov 2023 09:43:33 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6CFD7
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Nov 2023 06:43:26 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so1519414a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Nov 2023 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698932605; x=1699537405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFhUVh3CuTxMB3qEjHHzdyET4eOvydg87z4/z27t8TU=;
        b=HnHjvBu4GellnOSW99XF8iPOvcbTu10rFvcqmwgha621J7MvngRoMb40VxmgCj14hL
         F2+HwziSO0ctKBb5iexi7KgZslf+srzDItp8niwXCUVPQsz9bLVfU1CyUgIFyrJ63ltP
         m46Jn6hSMgaGcL58fvYoaOgjTeFMDmtkEzZgjN+pirgMe/oGk2DNVgRrPlovm81E6snx
         jTCqAoMkkxhy014tmBC6S2QuKs170bv0udoYSD4wY1EuOXd1X79SsU4xLuPOozvIY1UJ
         iNklSOobHhNQk/uMajgSxRasruNVJit4t2BuuLOCibL0J+UKP5nwYPi1yYZoOngeMPDW
         T9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932605; x=1699537405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFhUVh3CuTxMB3qEjHHzdyET4eOvydg87z4/z27t8TU=;
        b=roiNMwGKzLF6u2UpyHDA9UQ65XDIRURN8BrtFJfeMxY3NBGe74fdM116pADP21VqS+
         qrJZgmP0nletrcJ+MJp+01gUZ2wGLBiqtzPDHf5MR69+/m8l1EYTdLpl3UoNL6v1bFOM
         h/Uovyvxh6SuM+fA6Sj+lyWzglrCQ+nhfZ96L67B91WyibitibVdQtbg4e/NMICJ0v2M
         c/Vkrf6wvNpKCnTR043nEZ0sJXBnwvVf7Jp53o73BJKkxBOTTul8uu+0h8aLDA9DCWqH
         hjouDhteqTvCgc/yyKhroAaiYM+fhUNHbyeFtMpvkBPT/99hg5bt7wt76cDQ2VhiNe1o
         2DXA==
X-Gm-Message-State: AOJu0YxJSNnttiGF9s4KWjjIktYaLcSfuEmgPtEC9BPjhdB2Ve42GN4c
        c8HaJIzV4M7snosDHOE1aqAjew==
X-Google-Smtp-Source: AGHT+IE9nqeCnJwsw76xX1IEOlhGWExW41+OZQQdczrb9v6gAaklL9Q6P1hqax771Osvj08CLCICVw==
X-Received: by 2002:aa7:d8d2:0:b0:543:5789:4d6c with SMTP id k18-20020aa7d8d2000000b0054357894d6cmr7125794eds.2.1698932605464;
        Thu, 02 Nov 2023 06:43:25 -0700 (PDT)
Received: from [192.168.1.118] (abyj199.neoplus.adsl.tpnet.pl. [83.9.29.199])
        by smtp.gmail.com with ESMTPSA id i35-20020a0564020f2300b005402b190108sm2353218eda.39.2023.11.02.06.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 06:43:25 -0700 (PDT)
Message-ID: <8ccd6953-b15b-d187-cdbb-0d85dde57442@linaro.org>
Date:   Thu, 2 Nov 2023 14:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 8/9] interconnect: qcom/smd-rpm: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@pengutronix.de
References: <20231031222851.3126434-11-u.kleine-koenig@pengutronix.de>
 <20231031222851.3126434-19-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231031222851.3126434-19-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31/10/2023 23:29, Uwe Kleine-König wrote:
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
