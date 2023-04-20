Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7476D6E86CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 02:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjDTAsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 20:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjDTAsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 20:48:01 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9436A10E2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:48:00 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c3so959707ljf.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681951679; x=1684543679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YiCUqcs8l7xs68tLNiwLGoxcdTG7gnnvZNDM/XdASOU=;
        b=PoyvA1eEAYWocdqr2obXGcJHE+fvbQjI0qCQ7kJZHpUGLDtxBgt98xhAYPL2szwO71
         UOoAmVBnhNqIQnsZwO9xV0V0wO7ZcQh+usaHyIbf9mnTonhpcbyrSkFbp+fgK/IYb76M
         AS1oS4Iq6LoFjjExYSAQ3TEkvYyfXp1y2oq0D2c8+LcH1/TLMIAoLMecGCRJ4KxNA04D
         SKazSnLDFhVs+8294KibSTVfoUma0Wt8z3VAJnBRbQPU8uqiOwE7BJtyKhL+yUkTHYRL
         7jzrsIqVdUJTpBub1MLIhf3+b46rMhmLNT74cDulD6097QE3r9o9Br1Z1Y0EYdkGUcbN
         HYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681951679; x=1684543679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiCUqcs8l7xs68tLNiwLGoxcdTG7gnnvZNDM/XdASOU=;
        b=Nu19rlyVn5ZmCgKsSrny+RwDzR75GlATnPDtJ/vaFP5keYozblP2ezwS9ncr50PZWu
         R6uLd552MdNmpCqL84kHWRoe3ePfAhz+9a8jpK4kVaShzRMuD8fSJCNQgMinnzAZzUIX
         zsYjKOS40hu/vkQXelN9hls7rQhbpTxFbOrdVWzdsJpxsBqZWA4fdZD9xMJn3886FOSS
         2AuYbVzDuSNZk2ATXNMtKOObSOOrwGCDtP5/5uXPtvB6mKTeE/BY6xf2zccCEt+wgn+9
         14rzj116KV8sEkLQJxg2hYdYW+nrVdCOZTC53Qxcu2oC2xRDkNzILhYyDt+JzgwirrRN
         v4FQ==
X-Gm-Message-State: AAQBX9dJZQsD7ch7Vk9ErvdpNR6x9aaWKxTgpLUJB7jlxK/gMnXX89to
        QeUz+nkMEGzAAYeh0o/FQBOlew==
X-Google-Smtp-Source: AKy350Y2g0JyuJdB83x5keVTBl+YazhmfiYEa4/oZG/Tc6iQyRwmtDas24d7wHonjcUHxtv75FKVsw==
X-Received: by 2002:a2e:9917:0:b0:2a8:c1bf:5ce2 with SMTP id v23-20020a2e9917000000b002a8c1bf5ce2mr2169890lji.7.1681951678855;
        Wed, 19 Apr 2023 17:47:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y14-20020a2e320e000000b00295da33c42dsm17379ljy.15.2023.04.19.17.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:47:58 -0700 (PDT)
Message-ID: <f9e8a86f-3c69-4fda-01b9-2d4cd261bee8@linaro.org>
Date:   Thu, 20 Apr 2023 03:47:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 07/17] drm/msm/dpu: Sort INTF registers numerically
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-7-ef76c877eb97@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-7-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 23:21, Marijn Suijten wrote:
> A bunch of registers were appended at the end in e.g. 91143873a05d
> ("drm/msm/dpu: Add MISR register support for interface") rather than
> being inserted in a place that maintains numerical sorting.  Restore
> that.

Assuming that = "sort order":

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If I don't forget, I'll fix it when applying.

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)



-- 
With best wishes
Dmitry

