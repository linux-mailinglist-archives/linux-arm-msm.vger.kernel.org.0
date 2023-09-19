Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3537E7A6CA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 23:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjISVCn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 17:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbjISVCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 17:02:42 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142CBC4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 14:02:35 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so10308721e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 14:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695157353; x=1695762153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkfWxT6lfF9Ia8taCV57X5Sx4DgFIC2eOwDKvIcY1ZQ=;
        b=hXtqbTo192Yhry2Dr6eN/5feKgEZ14C+JI1xjJcKJMj/9Z1F1ZAUBcrepV1DdaTlPg
         Pl1OZ/j3um1NJiqzw5K5qX8miRg8QGFmXoKE0FKORcqv/9rlho7yMMLUMJ5e/r+3J7ok
         XpMfCGWQXtKocKy4yyliWf//beeih1cOdX7OFoN++5daKY7XF4eqjQLjfniGbBn4awPz
         DGxr70Va9tJG1ovbtNDI+bByPPIQ+sXkNA4urMzsKH5choyxrdKYbn9igpPIRRmcTs75
         QrLzXOvrL/7ISGKY5TBJOpMsGTtJBKNuk2xviIXkmVIIXprQ9v/BsW2ukQmwsQ6VzWjr
         W94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695157353; x=1695762153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkfWxT6lfF9Ia8taCV57X5Sx4DgFIC2eOwDKvIcY1ZQ=;
        b=FMBM7FM+jAxeFIub+q+PXCvoFBJV+lBKtC3nC8RRkgGg97RCTaRZjxS6RY3lgp7OUx
         W5EjChRRI5uuoQKReqERb4r/4sUH5VsrEJpbdoxp/2xX1YconDanxBJ9X0QAZA3zEi0p
         TCBzrdptJeevK/9TFzfyAwY5OEjLHKqel5yRWl9BjmBjb+SHbx+ABSlTfOCzGTfvPX5z
         k56XeAgDCbZINtRtQQkGIPHeOQKAOblEEJ9nmw7rYLNXLH1O1eZIiNMjL3/xE5K9+ce4
         5ejVUW38UXPqzGLzOGCtPrrDul1O4J2XKPQW4MTMW4wcnCshsz6SOGmM9AuA5UhXTYV8
         Kcmg==
X-Gm-Message-State: AOJu0YzPoU25MJ5k4KFn+n7Yf2hkuYPew5fFH+CiSKtmdtZdtjw9CwKQ
        6jQPuB2tBImngisICoj9qIK0tg==
X-Google-Smtp-Source: AGHT+IHVtD0cD72/j8e7Mh/umPtqdNCHvbA1K1mXqFLXJSuN1FEopRLJbCe/Q0jm3DjpkdwpSc6/yA==
X-Received: by 2002:a05:6512:3c98:b0:500:d970:6541 with SMTP id h24-20020a0565123c9800b00500d9706541mr844807lfv.39.1695157353186;
        Tue, 19 Sep 2023 14:02:33 -0700 (PDT)
Received: from [172.25.80.155] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id n13-20020aa7db4d000000b005232ea6a330sm8003650edt.2.2023.09.19.14.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 14:02:32 -0700 (PDT)
Message-ID: <3b6dc2d4-3aff-85a4-9fc3-1d46b93d6e08@linaro.org>
Date:   Tue, 19 Sep 2023 23:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 34/59] dma: qcom: bam_dma: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        kernel@pengutronix.de
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-35-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230919133207.1400430-35-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
