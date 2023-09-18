Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E68D7A5653
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 01:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjIRXvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Sep 2023 19:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjIRXvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Sep 2023 19:51:12 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C190D99
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Sep 2023 16:51:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so55159225e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Sep 2023 16:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695081064; x=1695685864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0KW891hJlwQAFNhQncFmrJVpCSu1XwqJpLgBJeFg4I=;
        b=FAB33c+JUWnUgWZEofbIgFwdt2gr2pDNYyChH9WsJIevWKVcgcYEdBwMjR+CER5/ay
         5MIDqR4x9qIQ1aHpUjmSj3FS1qJJvvjnXICbCwryxtNSSt9t53B/Sw12Rd2mZe5NxXkb
         aomogRL6MhL17Xul8nfGR3OGJf9g8PddkvfjbbRJZfvrIXxMeqftD4PEPF/23CuoZIA+
         jTUfhh83Qdqe/6vWMu1//0WlHnUX+Sg6uv5K4YTfQIF150/4hiXjpGY6eR6lhYycGN3p
         Ykhkimr/G1NOR5569G3mtKWz070ZKvfPj9IeEvOIIzPDkbXp5XkK4NkXYcwR+Mgjl1P4
         r63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695081064; x=1695685864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0KW891hJlwQAFNhQncFmrJVpCSu1XwqJpLgBJeFg4I=;
        b=V3zu652QDAWqlL/xJ8zNMeRqnTo3Eia8ymO8GFJj1K1w8ob5hi8Qq26Tf7NyBFG240
         Frj8be5N9m24zbc2iEAAm1uL5KWgfIK8YWQTVeFnmqsoWwF8qGSsVMrawRA8po+UJfYT
         XOWlZKbVEDqmRDgYmDF9733ypcB61PkoA7RYhSiJZLPQwm7S3YcaY2c3XjEDs2bmh6FV
         aie2cABvcp/0GfpYpSfVOc5p8BexVf7O6IWxuDjjG/e2S8mgmsvrQw0ZeSnCcVZGIezV
         v6vO7OrSSUqmnJXWO6iid7W+X1GNC045eeJqZWqkAAelNS4H5UyoLsOuNjS3yFtjwxON
         kEng==
X-Gm-Message-State: AOJu0YyNQHsdWqgc+a/zvbkZVSnTtSrquOUhYNdJ/pWTpPRsu+Jvw1WI
        OTI//wyDAeXWLc5Fa4jQYCmdOA==
X-Google-Smtp-Source: AGHT+IFhu8EdErkJ/W7CMZJDvRxTbgF8EwR5K35B2/sL2ZDesRLdqtHoB9c1EbKS+JUAF1rQMYSscg==
X-Received: by 2002:a05:600c:2053:b0:3fe:4548:1892 with SMTP id p19-20020a05600c205300b003fe45481892mr9241926wmg.16.1695081064206;
        Mon, 18 Sep 2023 16:51:04 -0700 (PDT)
Received: from [172.25.80.116] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id i8-20020a170906698800b00988dbbd1f7esm6997386ejr.213.2023.09.18.16.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 16:51:03 -0700 (PDT)
Message-ID: <5d8f7468-241a-506f-69b1-c6ca1b15f0e4@linaro.org>
Date:   Tue, 19 Sep 2023 01:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 22/32] power: supply: qcom_smbb: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@pengutronix.de
References: <20230918133700.1254499-1-u.kleine-koenig@pengutronix.de>
 <20230918133700.1254499-23-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230918133700.1254499-23-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/18/23 15:36, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
