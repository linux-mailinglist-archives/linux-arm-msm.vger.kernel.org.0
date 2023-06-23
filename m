Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E56473B90A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbjFWNrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjFWNrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:47:41 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607D626B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:47:32 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b4790ff688so11570231fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687528050; x=1690120050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QY1sqDuScItGhrxobk0V3aEmwItBRyzCUAYzD0brN34=;
        b=PtxV1iGr/52iLFbquJEyzvbZxPyLl9cPPgX4VZN4/pBZ4INmcglsjp3KHL/sz+fPV7
         9u34CXpg19+iMeyzNlVInDEhSwcgB5i3I91ThucjUZjXalZ5bsojDWpsEjAsfFGYPOo0
         qThQg21+LbYCwkZzUQTiYsu9TAM28Zv+XBS+KidryZOWov/FUtcLXhJODlFF0BezRhgD
         l6852nGDMfW/3A/FT8vgO+dm9IuWaiMSu/8u6LpCac7OY0uO3XIcNqdiB4abOieVHO79
         9gHW1Wnp7sOh0Ck8ZrpWp97VyxW5Ty9sXnxXSq4pAzJNdSxQDWXAJoCaIizlbp7rVPrk
         CHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528050; x=1690120050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QY1sqDuScItGhrxobk0V3aEmwItBRyzCUAYzD0brN34=;
        b=NM9alZAT63XEmlrWappQ4Km1on97E4OtlQjAxFLgPtYmzX58A3OYluZrL9LKofLGFU
         Wz13EUMoDXfHqUVSbjiCadCMkCP0bhTkkEZWBpROTot1JtwcrPBm0nBBPmbX3SsYQb/G
         ApfDCrVFyKF87wd/L1em44L3O2hEkIOzBjO4SeErptWnn2VKe8/knFSiWr26B4BWcY/l
         MXkyHSqYXOyebyvTi7L/pNnnMcWSweI7OpvZ+TzDTZX2n1L7Y8IS7KdThu/D9vacJFg6
         3MYX2ISYmGFZf+6+2WReEYEVcqPCHRzMSp6ur6zMs9x6klFIZupLkRJ1KcVJ5PzS3XJp
         2Xyg==
X-Gm-Message-State: AC+VfDyh00K08dx2WOjG9fMZUJ6c8+v8BBku4m0/iexotvLkYEUc9QXX
        Fz759Cg0e+K5s0d0O94HfKW/Aw==
X-Google-Smtp-Source: ACHHUZ4jvuVLXR/WSF+2ZielFRURH+zzPhs0avDrijKKnk1xO0Lg6lSb6+gw9E2WHU8AvwpvytzLkQ==
X-Received: by 2002:a2e:9c86:0:b0:2b4:68a3:90e7 with SMTP id x6-20020a2e9c86000000b002b468a390e7mr13005953lji.22.1687528050736;
        Fri, 23 Jun 2023 06:47:30 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id z20-20020a05651c023400b002b2207627c0sm1753626ljn.71.2023.06.23.06.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 06:47:30 -0700 (PDT)
Message-ID: <bd99681e-c495-d9a2-5eca-0d741867e794@linaro.org>
Date:   Fri, 23 Jun 2023 15:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/4] interconnect: qcom: sa8775p: add enable_mask for
 bcm nodes
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230619-topic-sm8550-upstream-interconnect-mask-vote-v2-0-709474b151cc@linaro.org>
 <20230619-topic-sm8550-upstream-interconnect-mask-vote-v2-4-709474b151cc@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230619-topic-sm8550-upstream-interconnect-mask-vote-v2-4-709474b151cc@linaro.org>
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

On 23.06.2023 14:50, Neil Armstrong wrote:
> Set the proper enable_mask the ACV node requiring such value
> to be used instead of a bandwidth when voting.
> 
> The masks was copied from the downstream implementation at [1].
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-5.15/-/blob/kernel.lnx.5.15.r32-rel/drivers/interconnect/qcom/lemans.c
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/qcom/sa8775p.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/interconnect/qcom/sa8775p.c b/drivers/interconnect/qcom/sa8775p.c
> index da21cc31a580..f56538669de0 100644
> --- a/drivers/interconnect/qcom/sa8775p.c
> +++ b/drivers/interconnect/qcom/sa8775p.c
> @@ -1873,6 +1873,7 @@ static struct qcom_icc_node srvc_snoc = {
>  
>  static struct qcom_icc_bcm bcm_acv = {
>  	.name = "ACV",
> +	.enable_mask = 0x8,
>  	.num_nodes = 1,
>  	.nodes = { &ebi },
>  };
> 
