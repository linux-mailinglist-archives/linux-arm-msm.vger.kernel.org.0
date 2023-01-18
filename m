Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4C4671124
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjARC22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:28:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjARC21 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:28:27 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BC744BE6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:28:26 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id vw16so16765855ejc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1TSyUdp4Jkds0cmJxddHX9zPn7SkqnsbQ6bC5wfOng=;
        b=xrw2W7Kly2r6bTGksOwrn1vGjQhSuUBsKiTJSqeOXP50hfepW3Ib90dJRMoxtoyPlm
         AdXZTdJibjsouWzBqXAq18GApiGJIojYiO3/5EtWvl8dpD3Fcwtt0PCkWsJhxNWkCbEr
         IDcmicMVj8UXh0AP8OvrXnmvrbGmIIHvolBIa4+ZUbLbCbX+Uyrc6ruC7LmwlHOlYzaZ
         ZJsIwQbUdmKAkjmyAKCEGHuEhlyMkGfCAWNZKliRzO1KFcENgngfEcZHgkhyY4Y/RUsV
         gvuCmFox8WT8y8Fl/+vuIWqbPZ/OmKziGyD9rDYN9VBFPaeze/KRdTeghnVTSLgQGQac
         4sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N1TSyUdp4Jkds0cmJxddHX9zPn7SkqnsbQ6bC5wfOng=;
        b=JvIPv5rHJwJ6+A5p+XRWn3jMzjU+062kCUG87314GN34jwMykGQjQYc5R1pzhw+Xjw
         FmggtV7U0h9TMiTGvUIod9OyfZNhSrgGuPutVZuHJkVqcNeujkobAkE8DJ5vmY/+aKwW
         ZCkQJtRVfnAz8kFj4e8I0Q7NMsn9wmoRmoyhd/t4dfoUugn/4w34tg6EoqRhjm3vK9Gj
         T0rqrOZZfkzi8FQdD62UH1IIju4Z3bDmTXDRzbEeQqA73veTYwBR06ARpOIpm4CmbK5/
         oLTwRJ3VZvt67Zt4wFYStl50FgjzC3XSM6MFITRABnvSxJnzleLn3W+z5FRUhuU1MySI
         QIUw==
X-Gm-Message-State: AFqh2krYYu7DmNJzFFlS1gCmhdy4sjPcOHpYLqb1BRK1wulJ0pD82LUh
        V7AjHm47R5mxiiS+fEJLjSLk6A==
X-Google-Smtp-Source: AMrXdXvDc9I51HhY1IunUYtmSRVaUY3aNhtaCa9ZwYi9f/vzw6oGFSF1qdOoHWyFp2t2cE5Y+P1n2A==
X-Received: by 2002:a17:907:ca85:b0:7c1:1e5a:ed10 with SMTP id ul5-20020a170907ca8500b007c11e5aed10mr5648255ejc.8.1674008904506;
        Tue, 17 Jan 2023 18:28:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id fy5-20020a170906b7c500b0084d3bf4498csm12550657ejb.140.2023.01.17.18.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 18:28:24 -0800 (PST)
Message-ID: <2ec13e85-6640-df02-3069-9e2e67fb0e79@linaro.org>
Date:   Wed, 18 Jan 2023 04:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 04/11] dt-bindings: display/msm: rename mdss nodes to
 display-subsystem
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        devicetree@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
 <167362341911.2212079.15291287366051593468.robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <167362341911.2212079.15291287366051593468.robh@kernel.org>
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

On 13/01/2023 17:26, Rob Herring wrote:
> 
> On Fri, 13 Jan 2023 10:37:13 +0200, Dmitry Baryshkov wrote:
>> Follow the 'generic names' rule and rename mdss nodes to
>> display-subsystem.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>>   .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml

This should be fixed already by the commit e5266ca38294 ("dt-bindings: 
display: msm: Rename mdss node name in example")

See https://gitlab.freedesktop.org/drm/msm/-/commit/e5266ca38294

-- 
With best wishes
Dmitry

