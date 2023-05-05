Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D2C6F8803
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 19:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbjEERwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 13:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjEERwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 13:52:07 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52469203C6
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 10:51:22 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so29386707a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683309032; x=1685901032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNAjtGkZTnyvPXFM1hkH3rcTHl1qTgleJ0X8KEi0be8=;
        b=crVV77F4duLe0194uuxbJ39uu++eszWvoJx05GoKD+iHRs6bG65rcDWXFqM6Tz+Ppw
         EJN4Xp2vCYvQaXZAy6S9bdPHbvPSiGgRk5Bzfo028gUL/TQdQJe3cb43NDNZ+Jf3eq9b
         NcmJ8BuPTy+ZVFIqG0HoCa49tlW+vp8P6LQvG5sImxdEtUdopSEJvkeBzypGw4yc40x+
         OseD/p1NPVkzI/vnE1xfBR/zQFsm8HHvRqSRsSipcDlAUMlEDNNvBI/eobaPT8pRCpeq
         JXgNQ8a/BfcM+ksfp94gfbSzs8XNJggvMl+AJKLnGOZpR9h3EdiU6ek4qy3uex4Lg0yT
         wb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309032; x=1685901032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNAjtGkZTnyvPXFM1hkH3rcTHl1qTgleJ0X8KEi0be8=;
        b=QrNgxNI6HN45FScbHM292PGq+fDmKlZdj6WK7q5W06WP+45f+WMJ20b5mBuOIstk09
         6sRBJzUgxzpc3gv5yuj+0kf/R/NXNH39ZO2edufu7ppOngRcWV14PNqsx/gSDaCUROlf
         r4Km8njPxiuZyc3Ty0VSaIT1m9GdGqirce0qhAxZAYsvMMYz8Mjpknc4mDoipM5afSoP
         k7AbBxwIFjjeWSEjTs+2h4GGYFSeBOCh5rwccJuM6NiR+IcwGa6L7DaiCCp0gDZzhCZJ
         e9QAnQ9b4YL2UV3AtV+JQtTqt9kHZ/wRybQTJ+I39qZ1VGqTxf2k0bCYf3bn7mA04d2w
         G+Iw==
X-Gm-Message-State: AC+VfDw1Pf0CbGqLMkZHnhxIUJBmM/VlntRvtvtLsjOO0fcZzF7BBFJH
        zeItYNJZqmhmWJOT6GqWuw9CJA==
X-Google-Smtp-Source: ACHHUZ4aXnYE6LxyyVrhPHgqL43SWNyHVz4GZAj8nJEgzI/1iOUrsrsRv6RWp4wzWl0RJ/YLjsba2w==
X-Received: by 2002:aa7:d29a:0:b0:504:81d4:118d with SMTP id w26-20020aa7d29a000000b0050481d4118dmr2297086edq.3.1683309032559;
        Fri, 05 May 2023 10:50:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id n5-20020aa7c785000000b0050d89daaa70sm5885eds.2.2023.05.05.10.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 10:50:31 -0700 (PDT)
Message-ID: <db835ac3-cf3e-8dd3-62b3-ffca9a7f6c03@linaro.org>
Date:   Fri, 5 May 2023 19:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/3] media: dt-bindings: media: camss: qcom,msm8996-camss:
 Add CAMSS power domain and power-domain-names
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230503072543.4837-1-y.oudjana@protonmail.com>
 <20230503072543.4837-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503072543.4837-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 09:25, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add the CAMSS power domain which is needed for the proper operation of CAMSS, and add
> power-domain-names to ease fetching it as well as the other power domains.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

Same for all other patches.


Subject: you have double media, drop the latter one.

Your subject is anyway too long, so shorten it. camss: is also a
redundant prefix.

Best regards,
Krzysztof

