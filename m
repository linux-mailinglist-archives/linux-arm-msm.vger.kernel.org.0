Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E1176C80C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 10:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbjHBIKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 04:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbjHBIKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 04:10:05 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747A01BF9
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 01:10:01 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbea147034so60727935e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690963799; x=1691568599;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l08T2Ya4che/Jgmf1RiO3c/9qzvBKrqZzRNZJZQ5jTU=;
        b=AP2qrRCgodOJfi7wTNlea2flPWh207CAO3pXkgc1g8404I1UE1CoRjyaOS+EblkIuE
         DpQB/8QP5NaZkF/HtoQL9n33+iXAcaXsNpWXB7oFgjYMS45TMLXEDblJLjQOQSzaACG1
         gMaIB0tOoqQrF9Gaq71DeNj4JHZzCoSv5OO8Nv6B7w3BV94gN3QK9+vOzHGV0G1mp23M
         ucQ7R/fhPIQ+D0rnprAp3zxOeIX3rj880oiipBNRIr88pU+CpBRICYv7ldNYb9a83d6/
         l6sgOdOS2RqZWBVLeeB5g92/lAEkFEw0ejPGFJIGnVw35/RRE14s8dP0qwWQbLBE1TL+
         keVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963799; x=1691568599;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l08T2Ya4che/Jgmf1RiO3c/9qzvBKrqZzRNZJZQ5jTU=;
        b=A0EuWUoDWIDSXuNeMRaJKKkCIh3XqiV6DyPynF9WwjlYRhEZ/eYNYUArUM1dO4O5aX
         SBjIAHBHxfqhE6+SfhgjPo3cTE4eYRYPNTl5Xhd00j+Rlt5Kmt3d+pCK2RSYrhHldaOV
         fHnohHAstF+S+u+SkLunkAGnSJBL5o2TKBZE72C4wGgQQ/lbUHQmlgx2vnVLJT+l2EOT
         hWxnJhTOVGgIR3EbE0ZaqQfYMAAq/TcwOwHB8W3Eq6k/HL9Ry7LplnkiIjuXTE5gxr95
         oxp4Znf3tfcT0mSPMVZRzoqq+3BJ7sbJhy3WEgJ4vtum6xyBvGTDjfMGKfK8KGrQHSuf
         0NPQ==
X-Gm-Message-State: ABy/qLYuLEOLbTE4RM/wu+lVJXiZt+UPtsR5pdX03DjVuEF7LulpRGop
        rzwyUJqDf70fFbEle0wWsrOG8g==
X-Google-Smtp-Source: APBJJlGjbDNLICZHsNDUhuaFTQa5+aL0NsgoSmAxDGgml7L+5MgZ10kVZ8MHdakUQEAQi/Ju98oVIw==
X-Received: by 2002:a05:600c:40c:b0:3f9:70f:8b99 with SMTP id q12-20020a05600c040c00b003f9070f8b99mr4209647wmb.7.1690963799559;
        Wed, 02 Aug 2023 01:09:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196? ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
        by smtp.gmail.com with ESMTPSA id l18-20020adfe9d2000000b003112f836d4esm18210540wrn.85.2023.08.02.01.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 01:09:58 -0700 (PDT)
Message-ID: <64b816c0-b83a-b182-90a8-b7f289d11b7e@linaro.org>
Date:   Wed, 2 Aug 2023 10:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Content-Language: en-US
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
 <9caeb91f-1277-3645-cbbb-7be538d80e2a@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9caeb91f-1277-3645-cbbb-7be538d80e2a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2023 10:08, Neil Armstrong wrote:
> Hi Dmitry,
> 
> On 02/08/2023 03:18, Dmitry Baryshkov wrote:
>> Define a helper for creating simple transparent bridges which serve the
>> only purpose of linking devices into the bridge chain up to the last
>> bridge representing the connector. This is especially useful for
>> DP/USB-C bridge chains, which can span across several devices, but do
>> not require any additional functionality from the intermediate bridges.
> 
> Can you CC me on the whole patchset ?

Oops I am... sorry for the noise...

> 
> Thanks,
> Neil
> 
> 
> <snip>
> 

