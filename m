Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CD74F66C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 19:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238062AbiDFRNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 13:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238672AbiDFRMd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 13:12:33 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CC64E6EC9
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 07:39:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ot30so4648023ejb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bNgbs4OFoMS67Fuie7ANLOacB2yAm3W1OqcmJK7OTVs=;
        b=T3DXX5LG80TAa5jhmJ+hte2Ix47PFwLQvw5UwWPX9g32qhjfIyHWJebu9Nt9r7Mj9W
         dv1snFPDRtjBXz71iZfGVNqClfUe8yw0Cy8+myiPXcuvLDpTjv9tl+RaU020Mga7LMnQ
         0gW3uYenqx5E5WEfzZgXNUj/9z8V5Z8VJWwRh4YKmgbnuJSOF/zmUN2ZocyY6I/bWiC4
         eKPVA41/UCls5yuYaOhsLtRkwN64bbkClmst3p4PyR8tRUacjcYx+wslxpczeBaZK26/
         WfMHCqCkHbd4zLB/bo7OuoES4GmOkoRY5SJA7IUQD+HHumC7Jph3jZJm9OJAmdJBgzfo
         i9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bNgbs4OFoMS67Fuie7ANLOacB2yAm3W1OqcmJK7OTVs=;
        b=y1ueDKUJSrWC+AWB2MnSPbxSQFG1Tcj185clYr2+HQUr5u23ukrlq4i08lFbB5GMcj
         ErR88UXd2mbAvSvdmpbz66+1FlNr6ne+5xsvcua+z/fS8ggLVeASHjOw9tjP5Yjqn2s/
         MMJu/KYu6lQJ8qz1EKD22D1f7RzTvzviSKPMyKBdVltt95aJzs+FDyMRypjvqMFvuz3f
         WM74LoOKd0ArwhWicdmUXR/610WXAUBtSIYFIH7IY9cIP7rLG2LPGHjc6E6GnJ3TIMNF
         EmjPpsUCytIb5HMOGAlZxC4QsYsp6K7+hhMlysUM1kHGDrrJphuRESFYiNOZXtcBFS8k
         ekZw==
X-Gm-Message-State: AOAM533PeZfR5nLTODzB0HufEn402Ok8dHx/3rgUhO9p12rOI1xGEXlk
        kuGDdwlavJID8zm3+3s+sVydOw==
X-Google-Smtp-Source: ABdhPJzFAvgJatJMKx+tNpSSM2jv7GTFRgW2LwYez4TX7bmlyDUdenfPvyu611vrk4BD9KB6g4C0Fw==
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id nc6-20020a1709071c0600b006dfb257cbb3mr8547652ejc.631.1649255939485;
        Wed, 06 Apr 2022 07:38:59 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id y8-20020a50d8c8000000b0041c80bb88c7sm7528932edj.8.2022.04.06.07.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 07:38:59 -0700 (PDT)
Message-ID: <9326aee4-744e-9eeb-a5dd-b86e43b6c4c0@linaro.org>
Date:   Wed, 6 Apr 2022 16:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: qcom: Add sc7180-gelarshie
Content-Language: en-US
To:     Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
        agross@kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220406094156.3191-1-chenxiangrui@huaqin.corp-partner.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406094156.3191-1-chenxiangrui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2022 11:41, Mars Chen wrote:
> Add device tree for Gelarshie, a trogdor variant
> 
> Signed-off-by: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>

Hi,

I think I saw this some days ago... Isn't this a v2? If yes, please mark
it in subject and add a changelog describing what you did. See also:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst

Did you address all the comments you received before? At mine looks not
addressed... :(

Best regards,
Krzysztof
