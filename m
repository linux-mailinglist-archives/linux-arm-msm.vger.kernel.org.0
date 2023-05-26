Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2417129C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjEZPkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 11:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237366AbjEZPkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 11:40:37 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31624A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 08:40:36 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30959c0dfd6so796664f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685115634; x=1687707634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGy12FOCUnsbagRN+15Y7/HckqDnqaAP8/p7vhZfyjQ=;
        b=qriB1Bae0lwSWdfPdi3Te/S4lcJ7725T/mycDP9W6kG/Q8EEadGMaWiFqmJy+HeuQp
         A7wVkEYtb/d/4+7sAWRgT4vbo515n+xfZ8Z5NtTxqAuiGneDLCnBLuTSz/OdOBKzguVR
         79XHRoDQ+cG/xeU8RYaNV4MPaM7V40O48q6Czd4nG3BCURZE6zyH/hqbaBcI1KH/4Fh3
         Dwu+Mb3Yuu78nvwJE74m6LD9/e97ZsY9OxXH7hOVily0fT976jPFzPhmos2VeZ/kkiVE
         6n69fXWfxzkObqu0X5O7Wagke9diLV68+rffk5BTrd6fvejvxlOvKmAFx10DlLDoyTSY
         uX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115634; x=1687707634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGy12FOCUnsbagRN+15Y7/HckqDnqaAP8/p7vhZfyjQ=;
        b=k0ttpKJ3Yg5vJiwPssdi2/dIgQtTJ5Vp5gHnJzoK3+i/FzpZCfFLZoKT9tf7yUB0ro
         lVlvEXculiyUnxSDQB3eHchM3GYKo/rG6tsG+P+faR3u0MJ9mNBZ5lVKeTSZ+UlXH/x6
         h98N/BxrFnB9NHTjpVJwMITWyvzNI2cs9mPx7FQsZWkXg+5A7oRQOXF8UIdSO+090LKw
         h/B7wrufGeM2+mXJ6K3tTFtbToWwgLvtU9WG6S+VBFuux1WYcOAi8HtUYg7HNrgeyNO7
         B7pcRqoXNrKjlEi/zzUh4nx0BiutPQxD6tObBMU6JyPwbnTfBq2nrDUCHUbmbVhzAQgA
         gx8Q==
X-Gm-Message-State: AC+VfDynMfatE7Rj59OEYA41IXzGHF3QH4zo1GrVQAXFyifNYK8bkF5g
        0XKFbnqEO9haspA2nWTnhqg9OQ==
X-Google-Smtp-Source: ACHHUZ5xJbOukXNJPpA1+Hbl0cwSouOsj9zauLG1BoBbHdSkUu0fjuf8Ix60/zibpyYYRT0DMV3m8Q==
X-Received: by 2002:adf:ed47:0:b0:309:48b3:3ad6 with SMTP id u7-20020adfed47000000b0030948b33ad6mr1653289wro.47.1685115634691;
        Fri, 26 May 2023 08:40:34 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d5950000000b003078cd719ffsm5418594wri.95.2023.05.26.08.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:40:34 -0700 (PDT)
Message-ID: <66250cc3-8cc7-1a98-f7c5-561769509914@linaro.org>
Date:   Fri, 26 May 2023 16:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCHv4] media: venus: provide ctx queue lock for ioctl
 synchronization
Content-Language: en-US
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230526063024.2827883-1-senozhatsky@chromium.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230526063024.2827883-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/05/2023 07:29, Sergey Senozhatsky wrote:
> Video device has to provide a lock so that __video_do_ioctl()
> can serialize IOCTL calls. Introduce a dedicated venus_inst
> mutex for the purpose of vb2 operations synchronization.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Pardon sent my RB from the wrong a/c

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

