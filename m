Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035137A6CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 23:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbjISVCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 17:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbjISVCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 17:02:54 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EA3BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 14:02:48 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so474741a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695157367; x=1695762167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkfWxT6lfF9Ia8taCV57X5Sx4DgFIC2eOwDKvIcY1ZQ=;
        b=G6p+jcbr06TuWpMROydDcVaurwpR5p5dOz+EFemWp9F9kauehAgxAFtgH8GUbbnXqM
         t/kCD3ZCvlbgVfXwC1o1+IP0EmJBIlcO8TUOOg4eyaHyvpUEIYD4vHJig8bDBt1CSRKX
         XxHoJvfo/xJHpFk8VRvoAv73yQlM4kzEznP7xJN1Wh1ZEe5pwpeNZpFpgrTuK8PcRBuj
         4FlEng4bDLXk2fZJ6/N0o/YSXp389WMC0/Y2IKrVlIyqEKyGDV/m/YvCUGX5sFzyDWH6
         ftDFhCMPAjM4ryscGkMZ3cS8w0DEbOHu1/V1jFL5tHZ6FjN3oTi/TLZuJrnxf3+20ATl
         2PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695157367; x=1695762167;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkfWxT6lfF9Ia8taCV57X5Sx4DgFIC2eOwDKvIcY1ZQ=;
        b=FXvl13sMtHt90AMUA4ahRLiBgA31O2+nVrtlLLrzCjjodmEfus2IbHgXM/GnpVhE/i
         o+GCtrrYwe8kQCHrxoh5Jcuyt/LInqWXL80ILk8X5ACRMXQo191PZr2vv5rQXxFf7jNp
         uPuYnoITSNkoM9tVzEw87aINxWFTTS0lYtkKTJYQRr0Z3b9agJIT2CTeCnfYC5vkxKnL
         wOlePDGUSCsa5eLbXehwQWfoMyg/dJ2Wcdm0c5bQqZFFFKx4eLYAx/3ZPXQz6qxayQdm
         8/U43HezdLjZuE6whShDnw+VC/h6JFmR+2ZwRTSIq3sOXa23Ff25UX4wQWfVQ3Q7vm53
         4jHA==
X-Gm-Message-State: AOJu0YyIHCgxIW5Wlj5mhA0vRkxcoorRrmpvVH9fqsTJ6YppW9H7juag
        VtFr0h/uZjok/KcdkMd0Q0wyel+kb8TtI4VD1sIICjlL
X-Google-Smtp-Source: AGHT+IFFsCqzpLTwxUJEwKnaQMBiylcbHdC+0tNJGg15zCrJzdFlFkwZHE4rO5ioXpIBQNlnMmV8aA==
X-Received: by 2002:aa7:c30f:0:b0:523:b37e:b83b with SMTP id l15-20020aa7c30f000000b00523b37eb83bmr981391edq.13.1695157366874;
        Tue, 19 Sep 2023 14:02:46 -0700 (PDT)
Received: from [172.25.80.155] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id cq8-20020a056402220800b00532d2b5126bsm947479edb.94.2023.09.19.14.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 14:02:46 -0700 (PDT)
Message-ID: <5c4c931b-2990-0a59-a6a8-f6046439e641@linaro.org>
Date:   Tue, 19 Sep 2023 23:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 35/59] dma: qcom: hidma: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Sinan Kaya <okaya@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        kernel@pengutronix.de
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-36-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230919133207.1400430-36-u.kleine-koenig@pengutronix.de>
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



On 9/19/23 15:31, Uwe Kleine-König wrote:
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
