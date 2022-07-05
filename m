Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B56B56672D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbiGEJ7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiGEJ7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:59:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692E212D26
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:58:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m18so1205174lfg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ea01fFYVzCnx5PfCo0DkCIn2hd5aCf3DdQW2aVxLhGY=;
        b=Z+maSQLa+s6GOdu4T26/JhHGe4TcCyAj229j04vxGil4vvlm1o0vl8xoTHR3hvigSc
         QFv2aD9jDtYRVhSINsGMOLJhOGyR4L8dhixOa3+Pyvhhx03s6gfPvJEmxXGpNQFuaoVS
         ZSJq2gcajD2gh8kWp3yJM+/X19KoQVYb9mUgaAABPid+NakAKnHvcfGOg2n3JavyXqVG
         qGlVSaA2rji1flvTw7s/MFjHTXFxYJMWmFARaoA7njp5Vi5ToDjjNR3jLZyWPHtTWOlo
         3WOhYffMF1sJs3+kQusE+198lNhzTc5dTWtlKOoulOm2tI0vGqboRLQEKmzcbExLOpQE
         ZZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ea01fFYVzCnx5PfCo0DkCIn2hd5aCf3DdQW2aVxLhGY=;
        b=LoeB6AVdgC1AcStWou6BB7rgJTCa0i1YtCDkabwHpeBghDfZjSbOmNWuALvlh6AQPI
         7W9SJRsmGrjM9igSYygfkviAU2eJrGtSjto9PCta0V/TZpK/k2AcjVrmO2bzeORUmE5V
         C+aOYlgVvb6iGELmBDTJayBUVvnKjZSursNcUYPw2AZu08HabtI6AuV8PewnUmMyOze2
         qJgyA+21HSfZx0+kSCx+vn+8Trm7a2xJ/KCN5qSqcfcMnYQhAGBv6ZgVaKPrgtVsMfcv
         CFLOE6oL1XWiHEpLN7PzuV/fBh/ngaQoa0ZVZLzYczW4sVj/GF2URdDQQHPx+0GrMvE3
         csCw==
X-Gm-Message-State: AJIora9BfGBkfC37ifB+Rdr3oTByR3dz9ZyPZ2waafYHBlRyzQbuefsk
        9VKuIZTGBZU8rhXj4bEFOgUGqQ==
X-Google-Smtp-Source: AGRyM1sOLELIAUate4k04MN0E3MpwDR+yNLOJ8o61JsFjH7l3usMopSq1u5t79lvvclQHHG6oim6CA==
X-Received: by 2002:a05:6512:12c7:b0:481:51ff:d027 with SMTP id p7-20020a05651212c700b0048151ffd027mr17704489lfg.577.1657015127637;
        Tue, 05 Jul 2022 02:58:47 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512315300b00477c05f9ffbsm5625103lfi.9.2022.07.05.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:58:47 -0700 (PDT)
Message-ID: <308061b3-745f-a874-17c1-974ce15062fe@linaro.org>
Date:   Tue, 5 Jul 2022 11:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] dt-bindings: clock: qcom,mmcc: define
 clocks/clock-names for MSM8996
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220704155350.812319-1-dmitry.baryshkov@linaro.org>
 <20220704155350.812319-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704155350.812319-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2022 17:53, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on MSM8996 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 33 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
