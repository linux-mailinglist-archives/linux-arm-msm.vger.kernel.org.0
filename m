Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA30368D423
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjBGK3G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjBGK24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:28:56 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F05301A5
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:28:49 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v13so14758964eda.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDeIvkfb5WALcEqUuHkmQB+FrXcaWUx/WRzdBLJGHWY=;
        b=A9yHJZWGvValsmqpGy2foiQ3afLgIag4DfGudheIUYqirOQOBjqqZXyoBSHzMUvFqr
         OsGTyMCgP73m1v3JeDRQwCQyHAzj1Dw3yEZl9ETW0oLZrcrf8e1CK8hHLMlvzW0gp/gZ
         OtfHvqJC3RnnO8s7YptRbDWaRMuCbqAOvMdT8ndQGM/0tXECDWbcSen44picYk7O0nDb
         9rmNxL7/c638UhFDN61/NOT7kvX7VArtdgNydU40CPEdmVKwEs4/KygEHVQecLl1IxWg
         wkboYKzfsok+EUKW1BNXfvtNDNnjOZC/bDnP+yMnRrbv8cJk/ku6TyhPoge60N5TUQh1
         wC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDeIvkfb5WALcEqUuHkmQB+FrXcaWUx/WRzdBLJGHWY=;
        b=HXmXYvAvXKzdazu4+gtu6flp2XvKWvsLQpkl9rp/+m2iIpgOd3PytbHzZmF2ZaIQ8X
         HzipiVatUUX/QArylr8pMggZnD41n6Te5C92bVrhI3fY8Dwmpbp/ujTYzsINo5fNB0AX
         Yo+PUsFYcFnRTxQ6FFWmBTJK3VeWQriYMIEDtAVrWTjLCRmcv+QjRZASYPr+jKAicjEP
         CCgFCK/KC+QGg/ho582jB4kA56Ztpih6ACnlsa6HGnSrPW0eP/cxdg48WD0HyybKe3VL
         Fp8B7OqRxfUGyO/I8SOi1TMWpZaONiw2pOqoZ6Kx6eE+1eVkFpr/qypPC+BFJBSiNSLz
         lwXQ==
X-Gm-Message-State: AO0yUKWDWq5Bu6cJEx0kLx8LxqZXwCIU49uWuK6wBPb4TNTg8K4qYy4M
        Bc/7TWHySnbesptDafXE+kwqBg==
X-Google-Smtp-Source: AK7set9kKCifCK42oeHDJs/5pvIjngkAC9YWRKoP4Mj8rpJzrxtAhs/9bIDPBdDtKFMQNrjNMliK9A==
X-Received: by 2002:a50:ccc6:0:b0:4aa:c4bb:2372 with SMTP id b6-20020a50ccc6000000b004aac4bb2372mr2743682edj.32.1675765727684;
        Tue, 07 Feb 2023 02:28:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o10-20020aa7dd4a000000b00499703df898sm6165573edw.69.2023.02.07.02.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:28:47 -0800 (PST)
Message-ID: <70334e80-9516-5925-441e-01120ad3577b@linaro.org>
Date:   Tue, 7 Feb 2023 12:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8996: align RPM G-Link
 clock-controller node with bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
 <20230207090852.28421-3-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230207090852.28421-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 11:08, Krzysztof Kozlowski wrote:
> qcom,rpmcc bindings expect RPM clock controller to be named generic
> "clock-controller":
> 
>    rpm-glink: rpm-requests: 'qcom,rpmcc' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

