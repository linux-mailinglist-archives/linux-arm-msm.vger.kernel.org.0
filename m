Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222ED723D97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 11:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237561AbjFFJdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 05:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237560AbjFFJd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 05:33:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8961BCB
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 02:32:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so8467698e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686043967; x=1688635967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxkQMAtrAjXYlXCLCYJPVL2kAw3sPpp2P7XUoo3Mtkk=;
        b=blB6o0l1iByS5jsw+xhbP2Yg78bpb1zKbqynTN8o4kF+MUrrZN+GsVyMHqzILpuM2F
         SxOzJJid3l2BN4jhnMMcdI6smGL7NCLnk77qt60Y4Q6TNyP8TH5ZK5K3Y6O7iom54zFN
         CzrYIkroLGVM5rtpywgIQiyj1jCDOlqa5d9bM0HajC/G0XYd70IqqJQH+Ov0drFScHk9
         ImML2aox82sp+nqI8mOPk8Wgx2ulPMf5zWNVF1FqjHv3R62tr39Ihlx5iZQa/L2t6+lm
         opXUYkG2Nq5ZjNHiG2otNJaNTcftrZHqcs/b+oNyfelGQekae8NatHa62huovnP2Si7t
         FLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043967; x=1688635967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxkQMAtrAjXYlXCLCYJPVL2kAw3sPpp2P7XUoo3Mtkk=;
        b=Sup16yO4QWiF/N+22DZYxMiEHjZ3TAJAk1Q8xttwfqL9yQ5o+/qZ6ovU90HxR3fYKN
         S98BXuFnTvSf20KkrKelcmJLxwW/yRYEA9RQhh/R3d6k2rNfdi9vigN6qVWSchPfI2ja
         8CUQjYLuXMNligWsCvBzOt5KWGq5xPB5QrY3+UoFqLKZkle70Xta7bXvR7E+gjzTEWAp
         K3ozgTp8FItQ0nmoMZ+9VEKYD8pX1cMTSOQl9qgB2xaJ2MAw3ZgjrpMO8vSPGZGCk2Tk
         VxPFzsvwEISfl4vtWY1kY46vllqlYWHBir/uc0oe0o1o38lguKHV72ihpdT3o7zOH00X
         pMhw==
X-Gm-Message-State: AC+VfDx+i4wB/D1qgY0GnwOPNLC7i6CddOnMhiOMqnH4dtzIF7mFpWhn
        tirWDBVQ+kKyOq2wLOlIN/Mr0A==
X-Google-Smtp-Source: ACHHUZ7dAShyWhAYyjHCo+hysxhu0snYpSt86ZJU3ohfH4CKrxq/MKjPH+QMBJ7GzgdmlhfApc09NA==
X-Received: by 2002:ac2:5285:0:b0:4f4:2717:7e6f with SMTP id q5-20020ac25285000000b004f427177e6fmr524178lfm.23.1686043967069;
        Tue, 06 Jun 2023 02:32:47 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
        by smtp.gmail.com with ESMTPSA id b5-20020a056512024500b004f627ceb33csm737626lfo.229.2023.06.06.02.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:32:46 -0700 (PDT)
Message-ID: <bcd80f0a-6282-259b-23d3-a77baf2cf94b@linaro.org>
Date:   Tue, 6 Jun 2023 11:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] soc: qcom: Fix a IS_ERR() vs NULL bug in probe
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <ZH7sgpLAN23bCz9v@moroto>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZH7sgpLAN23bCz9v@moroto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.06.2023 10:21, Dan Carpenter wrote:
> The devm_ioremap() function returns NULL on error, it never returns
> error pointers.
> 
> Fixes: a77b2a0b1280 ("soc: qcom: Introduce RPM master stats driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/rpm_master_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpm_master_stats.c b/drivers/soc/qcom/rpm_master_stats.c
> index 6dd98b9f7129..9ca13bcf67d3 100644
> --- a/drivers/soc/qcom/rpm_master_stats.c
> +++ b/drivers/soc/qcom/rpm_master_stats.c
> @@ -105,7 +105,7 @@ static int master_stats_probe(struct platform_device *pdev)
>  		}
>  
>  		data[i].base = devm_ioremap(dev, res.start, resource_size(&res));
> -		if (IS_ERR(data[i].base)) {
> +		if (!data[i].base) {
>  			debugfs_remove_recursive(root);
>  			return dev_err_probe(dev, -EINVAL,
>  					     "Could not map the MSG RAM slice idx %d!\n", i);
