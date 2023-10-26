Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5417D89EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 22:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjJZU7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 16:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZU7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 16:59:20 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D571B1A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:59:17 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32dff202b4bso943499f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698353956; x=1698958756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJ45MedtW52f9J0KjPN0wsG1dfwZ1/8Loy/GooxEfbE=;
        b=Qg4k85B8hyfRWiujbOfcO9rvRPniVIebxOUMMY83wrV0rnGyfTSjYKoKHu6wHnox5n
         djuW0lMkGnevdzQCsvDtsG4hHbdZRsFwC6fkn70I9ouxCU8siZspMTT/a9WWhTc+yGmW
         PbDMvmiia5MT8iHoa6ufKpwUinl/+YpJUw6wu2zokO34Jnq2vF5Feb0ALFGs/NTp83UW
         hD0bf/AL+Ol+gqCR5w+SMvk2dbD+BFdadndIBh768cQ2V2suyVp87an3HHNf73C02oo9
         ZDjYIEd8wSgvl2FRy2V/UbBMdzLOTqrSNTcpGW03MizLho1ZQqvbh6LIFjyNxQRZwaaK
         kwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698353956; x=1698958756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ45MedtW52f9J0KjPN0wsG1dfwZ1/8Loy/GooxEfbE=;
        b=lIg13nPYzIBYC4qbV0s9wBtQpT2335KWLOMVXEH+el4i1rXh1pKzuJjbt0iJSN8jv6
         Q7TDL0X7h/48kjZfUeKbNx8aUbkCu1y3ThXL1thwkiWirukNsEM+1YZNbTFP8D1aBoVE
         ZMaXxgjlOyUESKWcjqtIM1LdPVlHv+ROWzaMogOvCgy827Rxzk+0yjZYghyg+g0g/Ytz
         ruV3yp1yOsdw0jXWfu8iuT2vVwUSd9q6sMEcRpbWOMK3MtNaIbndyjhaOX1oZU6IsAW5
         lF2HV6v/4S36UNsUxiJj9Kit5lRGFldzB/hV7fBqg00l1tO4xE+gJwVCe6ez9wYmLLvF
         +U8g==
X-Gm-Message-State: AOJu0YydKEbn/3cUP28k8rRs0bBBp+Qz3pZcXGRcqu+ziF5i6z8yajnM
        k3vQdX39F/lJBqX0oUvCNSNZKA==
X-Google-Smtp-Source: AGHT+IG1m2LzUjFEXtZczRmxlxINkHg+Jq1D1mGg5ZDH5g7+z7SoUtG5Oaey8r/7wyn/lWQrriixAQ==
X-Received: by 2002:a5d:62cd:0:b0:32c:c35c:2eea with SMTP id o13-20020a5d62cd000000b0032cc35c2eeamr519578wrv.6.1698353956213;
        Thu, 26 Oct 2023 13:59:16 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id l12-20020adfe9cc000000b0032dba85ea1bsm235247wrn.75.2023.10.26.13.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 13:59:15 -0700 (PDT)
Message-ID: <753148f5-d68c-49fc-b1ef-0f65eefe6e4c@linaro.org>
Date:   Thu, 26 Oct 2023 22:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] drm/msm/hdmi: switch to generic PHY subsystem
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-15-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> drivers allows better code sharing with the rest of the PHY system.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Looks like this will require some atomicity with the phy changes

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
