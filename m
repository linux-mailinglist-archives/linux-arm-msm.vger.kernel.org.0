Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBCDB6A5C5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 16:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjB1Pu4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 10:50:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjB1Pux (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 10:50:53 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE55032528
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:50:46 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id j2so10243492wrh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677599445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP+9At6GRqRbV5g3WePvbaYZr3DR0X3+cVJk1OqsfkU=;
        b=TCxUrd/8wEEghTc4H6dMhsbfLyjeuKs5LSuGK3uhWTZC1DHXHKLrLGZABVNK0HczGQ
         hDdQPbnllfrd27TvZuUTmxTPUchSQgLn+XY20BMjtB636bBiHZ3u7txzQsauQUrmV4vw
         iKbYFc5G2w9TTB/7a3aHLsd4DMfIUma7Ih1KY57aCl6MOVQtPlixgRV9EBwfn6nedxwH
         Bp4AnFLoo20TP7ahrtw2Lu+CSspoo+jYHi8sSIJ4sAtLunn/+Ge6kZbGNMgtPFmqgtdf
         BdU1c7C6NMOjWkmXH5swz6wfAnZAIUzmlyZvf6A0wBpMZV9jCI2C535UYf0TtGBTOZeQ
         34zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677599445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uP+9At6GRqRbV5g3WePvbaYZr3DR0X3+cVJk1OqsfkU=;
        b=buqWSMX7wrATKOb4gRspQnB2b/KVgRdy28v8jjMBQnHVA1GdSGgncQa39KlQmAuKt8
         wG5+ltK5NjQSgJubFCixRr0DLG2zZmAyKRGqvBRn/CVIQawA+3Xko7kYPt7rWuNyCBQM
         bowym2T/vewNeRD78xaNQauH5geSqiVXBCnn2x4C3SadJhTSy/z6eAobxbZSfp3n8jZM
         6ovC0gBRJ8PR1uX6XtxLXtMim9A2ytmAbwXEGkgLENoKlMHJInW9ttXQQF4QmMIVUanP
         RWAvbfEkYQCF6n9MBwWlb1OJy6nlIt/WB21ime9BverCMxr/wC7wsWm+rNRB4NMTBhdh
         /+/A==
X-Gm-Message-State: AO0yUKWtTDtvacZWhURLArQXLe6p2F23gWiVD2nNpZE9FO85y0B+f2sR
        q+4omCTu8YOZ0f7CyYxCnxutcA==
X-Google-Smtp-Source: AK7set88A2avuov2X0L8NoZ6Yip/SKWznsJzO+pwK41MFJy/SKhO7qb2+lZmlP61JyFfi5b6SE9DnA==
X-Received: by 2002:a05:6000:789:b0:2c5:3fce:423b with SMTP id bu9-20020a056000078900b002c53fce423bmr2453124wrb.4.1677599445445;
        Tue, 28 Feb 2023 07:50:45 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d5309000000b002c70d269b4esm10033439wrv.91.2023.02.28.07.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:50:45 -0800 (PST)
Message-ID: <4e0f94cd-c076-4fda-f2c9-19294664a7e5@linaro.org>
Date:   Tue, 28 Feb 2023 15:50:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 14/18] media: venus: vdec: Fix version check in
 vdec_set_work_route()
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
 <20230228-topic-venus-v1-14-58c2c88384e9@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230228-topic-venus-v1-14-58c2c88384e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 28/02/2023 15:24, Konrad Dybcio wrote:
> This is not so much V6-dependent as it's IRIS(1|2|2_1). Fix it.
> 
> Fixes: 6483a8cbea54 ("media: venus: vdec: set work route to fw")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4ceaba37e2e5..f55d6cce163c 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -688,7 +688,7 @@ static int vdec_set_work_route(struct venus_inst *inst)
>   	u32 ptype = HFI_PROPERTY_PARAM_WORK_ROUTE;
>   	struct hfi_video_work_route wr;
>   
> -	if (!IS_V6(inst->core))
> +	if (!(IS_IRIS1(inst->core) || IS_IRIS2(inst->core) || IS_IRIS2_1(inst->core)))
>   		return 0;
>   
>   	wr.video_work_route = inst->core->res->num_vpp_pipes;
> 

Assuming you make it possible and explicit to bring in the macros's that 
enable the cherry-picking.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
