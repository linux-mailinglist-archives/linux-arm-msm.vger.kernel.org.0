Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A43979B51C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343798AbjIKVMg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242659AbjIKQEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 12:04:22 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63311AE;
        Mon, 11 Sep 2023 09:04:16 -0700 (PDT)
Received: from [192.168.1.23] (unknown [171.76.82.102])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: vignesh)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 04FF86607313;
        Mon, 11 Sep 2023 17:04:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694448255;
        bh=B/g8SjCnc9xcn+5GHjXJAXRi60F4LL7KKfpFcTnnij0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AqlKCa35OFha/+DbJXxRJ07jLCrWI0leUjTQJnPsEZBFOWCwShOeMN8FLOEUVFBds
         pnJ1Pg8SEVDE9XQn4ggSrLSqr5bIMHB01tTYp/BUAtgBIIE0UToDt0Xzu8KL0bXIsg
         gWfp/yi740+09MAC26k2D8zGuSv6pQVOvGZ3L0mfWYMDO1iX4laZjw4mCTkZ2t6HfX
         Gh3+ze017veMQ4AkPZzi/a2o7idVgFK9AYtYY8YetF4YQXGBLsYdz49V4pIPcxAlhk
         7ETnZydxymH8cMOcGEff1WQMK9vPWRCF3dSG4xN5yxp0Gv1UgocAakcrtsqXUIxNm7
         mMATUC/IFzVZA==
Message-ID: <3c9c1df8-ae3b-9a89-7b1a-a7dcbb835218@collabora.com>
Date:   Mon, 11 Sep 2023 21:34:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: qcom: apq8016-sbc: Add overlay for usb host
 mode
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
Cc:     helen.koike@collabora.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
        daniels@collabora.com, emma@anholt.net, robdclark@gmail.com,
        mripard@kernel.org, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org
References: <20230911153207.646160-1-vignesh.raman@collabora.com>
 <8a812c6c-d26f-57a7-f3e8-d6f7442a9f89@linaro.org>
From:   Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <8a812c6c-d26f-57a7-f3e8-d6f7442a9f89@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 11/09/23 21:09, Krzysztof Kozlowski wrote:
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> You skipped all maintainers, so this patch will be simply ignored.

Apologies. I think the second time also the patch was ignored.

Will use 
https://www.marcusfolkesson.se/blog/get_maintainers-and-git-send-email/ 
to populate the correct to and cc list.

Thanks.

Regards,
Vigesh


