Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0782C5811B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 13:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbiGZLLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 07:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiGZLLD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 07:11:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B1B31222
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:11:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t1so22102362lft.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kYJTt3SQA/1p4kh/g9yntKNFicSu2rdf6TlMLv2CCvk=;
        b=eqJ46c7AjqTGWxQ7bcboDTaiH0YYyLKFJN3viXgUyxRERrDZAnzgp+gbzXvDCzYErh
         A7SweSz2ZuQ4ouJjVoDR32w3ahDtoZNDhSVyMLKIa6U3oYNVP+tNvCj3PF7PgLg6bvDO
         b6KR+ydpJrElb2cq8puIwPppPbF/OTXEnPKsA4VQyrbtdi44TY9XjK2npxsDN2LDa1BW
         SI1HvlmVX7fVlm6qYFzXPn+C70NcgbtHU5smq2l0s/og+LLX4EdODbCAeNvUVneWdVku
         z1EwLqU38JSPvmps6wx2UGcldJYPdoz53v/Kg5NEsH2SIn9fNwEadYhxscG348PPX7fj
         JWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kYJTt3SQA/1p4kh/g9yntKNFicSu2rdf6TlMLv2CCvk=;
        b=BgsK05xxbj49Mu7Kx7NYb/t5TvV2jgmm1jKlxUIbpXASMfd5ArD8vqM77A2G+fMXYN
         NMdY7REmo5oGWzrxKFgyXK626JmAZ21FxG10LJMU16AG0P1+SJ/qhedFYmvTOLb4zgSF
         wQd4vQgtidCcMzjp1WLtD42qfePXAAiUc6xukroXrtpUaSexLK4wbQ9ziBN8BcupWQZf
         WtbDZW/8okKNtRMQ8cxCK3A1TApDnZK2HFf1DO+woYJeJgFq6BBvO0tFZS0ZwALGK7K0
         sH3nYKaCAp5eCgqgQmVVcBpsDMT7agaXPmf2ogRWSQ5xiKNX5qTpIBU9ene6FH7+xuVF
         gJ4g==
X-Gm-Message-State: AJIora9YPgoF+EYYekjDCuTOX1weinXoUmAJR+5ao6phYmDoWaNvUhHH
        WnmQMcgT3Tola8SROAJZmwGjgg==
X-Google-Smtp-Source: AGRyM1vOfPSLpOl+PoB59ltOyfAbUzDmkmHsqkURfRJe0bRil9VTvKILBTvjRAQ82byt7ZrPVyiyEg==
X-Received: by 2002:a05:6512:2392:b0:48a:8770:f5a6 with SMTP id c18-20020a056512239200b0048a8770f5a6mr4075711lfv.389.1658833862169;
        Tue, 26 Jul 2022 04:11:02 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25d26000000b0048a91d3ae3dsm868026lfb.221.2022.07.26.04.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 04:11:01 -0700 (PDT)
Message-ID: <fa54704b-55ea-fa3d-5d1e-75d8e9fccc10@linaro.org>
Date:   Tue, 26 Jul 2022 13:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8996pro: expand Adreno OPP table
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
 <20220724140421.1933004-8-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220724140421.1933004-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2022 16:04, Dmitry Baryshkov wrote:
> There are minor differeces between msm8996 and msm8996pro in terms of
> GPU frequencies support. For example msm8996pro supports 652.8 MHz
> frequency for the Adreno. Reclect these differences in msm8996pro.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996pro.dtsi | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
